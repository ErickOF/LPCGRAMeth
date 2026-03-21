// ============================================================================
// File   : cgra_basic_test.sv
// Brief  : Basic end-to-end CGRA test flow.
//          1. Init and data preload.
//          2. Tiles / PEs / FUs configuration.
//             const load -> loop config -> operation mapping -> prologue.
//          3. Launch.
//          4. Driver physically transmits packets cycle-by-cycle.
//          5. Result validation and memory dump.
//
// Override build_data_entries(), build_tile_cfgs(), and
// build_expected_results() in derived tests to supply application-specific
// programs and checks.
// ============================================================================
class cgra_basic_test extends cgra_base_test;
    `uvm_component_utils(cgra_basic_test)

    localparam int IMEM_WORDS_PER_PACKET = 25;

    int unsigned n_pre_reset_cycles = 7;
    int unsigned n_reset_cycles = 50;
    int unsigned n_idle_cycles = 10;
    int unsigned post_launch_wait_cycles = 300;
    bit enable_memory_dump = 1'b1;
    string imem_hex_file = "src/gen/imem.hex";
    string legacy_packet_hex_file = "src/gen/packet_stream.hex";
    string program_hex_file = "src/gen/uvm_packet_stream.hex";

    function new(string name = "cgra_basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual task run_test_body(uvm_phase phase);
        cgra_reset_seq  rst_seq  = cgra_reset_seq::type_id::create("rst_seq");
        cgra_hex_replay_seq hex_replay_seq = cgra_hex_replay_seq::type_id::create("hex_replay_seq");
        logic [31:0] expected_results[$];

        // ---- 1. Init ----------------------------------------------------
        rst_seq.n_reset_cycles = n_pre_reset_cycles;
        rst_seq.reset_assert_val = 1'b0;
        rst_seq.start(m_env.m_agent.m_sequencer);

        rst_seq.n_reset_cycles = n_reset_cycles;
        rst_seq.reset_assert_val = 1'b1;
        rst_seq.start(m_env.m_agent.m_sequencer);

        rst_seq.n_reset_cycles = n_idle_cycles;
        rst_seq.reset_assert_val = 1'b0;
        rst_seq.start(m_env.m_agent.m_sequencer);

        // ---- 2. Data preload + tile / PE / FU configuration ------------
        build_expected_results(expected_results);
        m_env.m_scoreboard.set_expected_results(expected_results);
        configure_post_run(expected_results);

        if (!file_exists(program_hex_file))
            `uvm_fatal(get_type_name(),
                $sformatf("Hex program file not found: %s", program_hex_file))

        validate_generated_hex_artifacts();

        `uvm_info(get_type_name(),
            $sformatf("Using fixed hex replay program: %s", program_hex_file),
            UVM_LOW)
        hex_replay_seq.packet_hex_file = program_hex_file;
        hex_replay_seq.start(m_env.m_agent.m_sequencer);

        // ---- 3/5. Post-launch validation window ------------------------
        validate_results(expected_results);

        `uvm_info(get_type_name(), "cgra_basic_test PASSED", UVM_LOW)
    endtask

    // ------------------------------------------------------------------
    // Override in derived tests to provide application-specific stimulus.
    // ------------------------------------------------------------------

    // Populate data-SRAM preload entries (CMD_STORE_REQUEST).
    // Default: no preload data.
    virtual task build_data_entries(ref cgra_data_entry_t data_entries[$]);
    endtask

    // Populate per-tile configuration.
    // Default: tile 0, one NAH step, and one entry for each prologue phase
    // so the full reference flow is exercised.
    virtual task build_tile_cfgs(ref cgra_tile_cfg tile_cfgs[$]);
        cgra_tile_cfg      tc;
        cgra_ctrl_step_cfg step;
        cgra_ctrl_step_cfg prologue_fu_step;
        cgra_ctrl_step_cfg prologue_routing_step;
        cgra_ctrl_step_cfg prologue_fu_xbar_step;

        tc                  = new();
        tc.tile_id          = 9'd0;
        tc.const_val        = 32'd0;
        tc.count_per_iter   = 32'd1;
        tc.total_ctrl_count = 32'd1;

        step              = new();
        step.is_last_ctrl = 1'b1;
        tc.ctrl_steps     = new[1];
        tc.ctrl_steps[0]  = step;

        prologue_fu_step = new();
        prologue_fu_step.data_payload = 32'd1;
        prologue_fu_step.data_predicate = 1'b1;
        tc.prologue_fu = new[1];
        tc.prologue_fu[0] = prologue_fu_step;

        prologue_routing_step = new();
        prologue_routing_step.data_payload = 32'd1;
        prologue_routing_step.data_predicate = 1'b1;
        tc.prologue_routing = new[1];
        tc.prologue_routing[0] = prologue_routing_step;

        prologue_fu_xbar_step = new();
        prologue_fu_xbar_step.data_payload = 32'd1;
        prologue_fu_xbar_step.data_predicate = 1'b1;
        tc.prologue_fu_xbar = new[1];
        tc.prologue_fu_xbar[0] = prologue_fu_xbar_step;

        tile_cfgs.push_back(tc);
    endtask

    // Populate expected CPU result payloads.
    // Default: no strict data check; derived tests should fill this in.
    virtual task build_expected_results(ref logic [31:0] expected_results[$]);
    endtask

    task configure_post_run(ref logic [31:0] expected_results[$]);
        vif.dump_enable = enable_memory_dump;
        vif.dump_const_mem_enable = enable_memory_dump;
        vif.dump_ctrl_mem_enable = enable_memory_dump;
        vif.dump_data_mem_enable = enable_memory_dump;
        vif.post_launch_wait_cycles = post_launch_wait_cycles;
        vif.expected_result_count = expected_results.size();

        for (int i = 0; i < 16; i++)
            vif.expected_result_payloads[i] = '0;

        for (int i = 0; (i < expected_results.size()) && (i < 16); i++)
            vif.expected_result_payloads[i] = expected_results[i];
    endtask

    task validate_results(ref logic [31:0] expected_results[$]);
        bit matched[16];
        int unsigned match_count;
        logic [31:0] observed_payload;

        for (int i = 0; i < 16; i++)
            matched[i] = 1'b0;

        if (expected_results.size() == 0) begin
            `uvm_info(get_type_name(),
                $sformatf("No expected CPU results registered; waiting %0d post-launch cycles before ending test",
                    post_launch_wait_cycles),
                UVM_LOW)
            wait_n_clocks(post_launch_wait_cycles);
            return;
        end

        match_count = 0;

        repeat (post_launch_wait_cycles) begin
            @(vif.monitor_cb);

            if (vif.monitor_cb.send_to_cpu_pkt__val && vif.monitor_cb.send_to_cpu_pkt__rdy) begin
                observed_payload = vif.monitor_cb.send_to_cpu_pkt__msg.payload.data.payload;
                `uvm_info(get_type_name(),
                    $sformatf("Observed CPU result payload 0x%08h", observed_payload),
                    UVM_LOW)

                for (int i = 0; i < expected_results.size(); i++) begin
                    if (!matched[i] && (observed_payload == expected_results[i])) begin
                        matched[i] = 1'b1;
                        match_count++;
                        break;
                    end
                end

                if (match_count == expected_results.size()) begin
                    `uvm_info(get_type_name(),
                        $sformatf("Matched all %0d expected CPU result payload(s)", match_count),
                        UVM_LOW)
                    return;
                end
            end
        end

        `uvm_fatal(get_type_name(),
            $sformatf("Timed out after %0d post-launch cycles waiting for %0d expected CPU result payload(s); matched %0d",
                post_launch_wait_cycles, expected_results.size(), match_count))
    endtask

    function bit file_exists(string path);
        int fd;
        fd = $fopen(path, "r");
        if (fd == 0)
            return 1'b0;
        $fclose(fd);
        return 1'b1;
    endfunction

    function int count_hex_lines(string path);
        int fd;
        int count;
        string line;
        logic [1023:0] packed;

        fd = $fopen(path, "r");
        if (fd == 0)
            return -1;

        count = 0;
        while (!$feof(fd)) begin
            line = "";
            void'($fgets(line, fd));
            if ($sscanf(line, "%h", packed) == 1)
                count++;
        end

        $fclose(fd);
        return count;
    endfunction

    task validate_generated_hex_artifacts();
        int imem_lines;
        int packet_lines;

        if (!file_exists(imem_hex_file))
            `uvm_fatal(get_type_name(),
                $sformatf("IMEM file not found: %s", imem_hex_file))

        if (!file_exists(legacy_packet_hex_file))
            `uvm_fatal(get_type_name(),
                $sformatf("Legacy packet file not found: %s", legacy_packet_hex_file))

        imem_lines = count_hex_lines(imem_hex_file);
        packet_lines = count_hex_lines(legacy_packet_hex_file);

        if (imem_lines <= 0)
            `uvm_fatal(get_type_name(),
                $sformatf("IMEM file has no hex payload lines: %s", imem_hex_file))

        if (packet_lines <= 0)
            `uvm_fatal(get_type_name(),
                $sformatf("Legacy packet file has no hex payload lines: %s", legacy_packet_hex_file))

        if (imem_lines != (packet_lines * IMEM_WORDS_PER_PACKET))
            `uvm_fatal(get_type_name(),
                $sformatf("Generated file mismatch: %s has %0d words, but %s has %0d packets (expected %0d words)",
                    imem_hex_file,
                    imem_lines,
                    legacy_packet_hex_file,
                    packet_lines,
                    packet_lines * IMEM_WORDS_PER_PACKET))

        `uvm_info(get_type_name(),
            $sformatf("Validated generated artifacts: %s (%0d words) and %s (%0d packets)",
                imem_hex_file,
                imem_lines,
                legacy_packet_hex_file,
                packet_lines),
            UVM_LOW)
    endtask
endclass : cgra_basic_test
