// ============================================================================
// File   : cgra_basic_test.sv
// Brief  : Basic connectivity test for CgraTemplateRTL.
//          Holds reset for exactly 10 clock cycles, then releases reset and
//          idles for 10 more clock cycles before finishing.
// ============================================================================
class cgra_basic_test extends cgra_base_test;
    `uvm_component_utils(cgra_basic_test)

    function new(string name = "cgra_basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual task run_test_body(uvm_phase phase);
        cgra_base_seq seq = cgra_base_seq::type_id::create("basic_seq");

        // 10 cycles in reset, then 10 cycles out of reset
        seq.n_reset_cycles = 10;
        seq.n_transactions = 10;

        seq.start(m_env.m_agent.m_sequencer);

        `uvm_info(get_type_name(),
            "cgra_basic_test PASSED: 10 reset + 10 active cycles completed",
            UVM_LOW)
    endtask
endclass : cgra_basic_test
