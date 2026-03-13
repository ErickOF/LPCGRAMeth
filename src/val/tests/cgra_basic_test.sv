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

    int unsigned n_pre_reset_cycles = 7;
    int unsigned n_reset_cycles = 50;
    int unsigned n_idle_cycles = 10;
    int unsigned post_launch_wait_cycles = 300;
    bit enable_memory_dump = 1'b1;

    function new(string name = "cgra_basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual task run_test_body(uvm_phase phase);
        cgra_reset_seq  rst_seq  = cgra_reset_seq::type_id::create("rst_seq");
        cgra_preload_seq preload_seq = cgra_preload_seq::type_id::create("preload_seq");
        cgra_const_load_seq const_load_seq = cgra_const_load_seq::type_id::create("const_load_seq");
        cgra_loop_config_seq loop_config_seq = cgra_loop_config_seq::type_id::create("loop_config_seq");
        cgra_operation_map_seq operation_map_seq = cgra_operation_map_seq::type_id::create("operation_map_seq");
        cgra_prologue_config_seq prologue_config_seq = cgra_prologue_config_seq::type_id::create("prologue_config_seq");
        cgra_launch_seq launch_seq = cgra_launch_seq::type_id::create("launch_seq");
        cgra_data_entry_t data_entries[$];
        cgra_tile_cfg tile_cfgs[$];
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
        build_data_entries(data_entries);
        build_tile_cfgs(tile_cfgs);
        build_expected_results(expected_results);
        configure_post_run(expected_results);

        preload_seq.data_entries = data_entries;
        preload_seq.tile_cfgs = tile_cfgs;
        preload_seq.start(m_env.m_agent.m_sequencer);

        const_load_seq.tile_cfgs = tile_cfgs;
        const_load_seq.start(m_env.m_agent.m_sequencer);

        loop_config_seq.tile_cfgs = tile_cfgs;
        loop_config_seq.start(m_env.m_agent.m_sequencer);

        operation_map_seq.tile_cfgs = tile_cfgs;
        operation_map_seq.start(m_env.m_agent.m_sequencer);

        prologue_config_seq.tile_cfgs = tile_cfgs;
        prologue_config_seq.start(m_env.m_agent.m_sequencer);

        launch_seq.tile_cfgs = tile_cfgs;
        launch_seq.start(m_env.m_agent.m_sequencer);

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
endclass : cgra_basic_test
