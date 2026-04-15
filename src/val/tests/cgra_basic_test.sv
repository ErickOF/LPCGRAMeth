// ============================================================================
// Name:         cgra_basic_test.sv
// Author:        Obregon Fonseca, Erick
// Create Date:  2026-03-05
// Last Modify:  2026-04-12
// Description:  Basic end-to-end CGRA test flow.
//      1. Reset sequence.
//      2. Hex-replay: drives write transactions from uvm_packet_stream.hex.
//      3. Post-write wait window.
// ============================================================================

class cgra_basic_test extends cgra_base_test;
    `uvm_component_utils(cgra_basic_test)

    int unsigned n_pre_reset_cycles    = 7;
    int unsigned n_reset_cycles        = 50;
    int unsigned n_idle_cycles         = 10;
    int unsigned post_write_wait_cycles = 300;
    bit          enable_memory_dump    = 1'b1;
    string       program_hex_file      = "src/gen/uvm_packet_stream.hex";

    // ------------------------------------------------------------------------
    // Function: new
    // ------------------------------------------------------------------------
    function new(string name = "cgra_basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Task: run_test_body
    //
    // Description: Executes reset, write-transaction replay, and post-write
    //      wait.
    // ------------------------------------------------------------------------
    virtual task run_test_body(uvm_phase phase);
        cgra_reset_seq     rst_seq     = cgra_reset_seq::type_id::create("rst_seq");
        cgra_hex_replay_seq hex_replay = cgra_hex_replay_seq::type_id::create("hex_replay");

        // ---- Reset -------------------------------------------------------
        rst_seq.n_reset_cycles    = n_pre_reset_cycles;
        rst_seq.reset_assert_val  = 1'b0;
        rst_seq.start(m_env.m_agent.m_sequencer);

        rst_seq.n_reset_cycles    = n_reset_cycles;
        rst_seq.reset_assert_val  = 1'b1;
        rst_seq.start(m_env.m_agent.m_sequencer);

        rst_seq.n_reset_cycles    = n_idle_cycles;
        rst_seq.reset_assert_val  = 1'b0;
        rst_seq.start(m_env.m_agent.m_sequencer);

        // ---- Configure VIF dump controls ---------------------------------
        vif.dump_enable           = enable_memory_dump;
        vif.dump_const_mem_enable = enable_memory_dump;
        vif.dump_ctrl_mem_enable  = enable_memory_dump;
        vif.dump_data_mem_enable  = enable_memory_dump;
        vif.post_launch_wait_cycles = post_write_wait_cycles;
        vif.expected_result_count   = 0;

        // ---- Hex replay --------------------------------------------------
        if (!file_exists(program_hex_file))
            `uvm_fatal(get_type_name(),
                $sformatf("Hex program file not found: %s", program_hex_file))

        `uvm_info(get_type_name(),
            $sformatf("Replaying write program: %s", program_hex_file), UVM_LOW)
        hex_replay.packet_hex_file = program_hex_file;
        hex_replay.start(m_env.m_agent.m_sequencer);

        // ---- Post-write wait window --------------------------------------
        `uvm_info(get_type_name(),
            $sformatf("Waiting %0d post-write cycles", post_write_wait_cycles), UVM_LOW)
        wait_n_clocks(post_write_wait_cycles);

        `uvm_info(get_type_name(), "cgra_basic_test PASSED", UVM_LOW)
    endtask

    // ------------------------------------------------------------------------
    // Function: file_exists
    //
    // Description: Returns true when file can be opened for read access.
    // ------------------------------------------------------------------------
    function bit file_exists(string path);
        int fd;
        fd = $fopen(path, "r");
        if (fd == 0) return 1'b0;
        $fclose(fd);
        return 1'b1;
    endfunction
endclass : cgra_basic_test
