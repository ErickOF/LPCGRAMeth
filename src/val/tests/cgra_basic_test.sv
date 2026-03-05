// ============================================================================
// File   : cgra_basic_test.sv
// Brief  : Basic connectivity test for CgraTemplateRTL.
//          1. Holds reset for exactly 10 clock cycles (cgra_reset_seq).
//          2. Releases reset and idles for 10 clock cycles (cgra_base_seq).
// ============================================================================
class cgra_basic_test extends cgra_base_test;
    `uvm_component_utils(cgra_basic_test)

    function new(string name = "cgra_basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual task run_test_body(uvm_phase phase);
        cgra_reset_seq rst_seq  = cgra_reset_seq::type_id::create("rst_seq");
        cgra_base_seq  idle_seq = cgra_base_seq::type_id::create("idle_seq");

        rst_seq.n_reset_cycles  = 10;
        idle_seq.n_transactions = 10;

        rst_seq.start(m_env.m_agent.m_sequencer);
        idle_seq.start(m_env.m_agent.m_sequencer);

        `uvm_info(get_type_name(),
            "cgra_basic_test PASSED: 10 reset + 10 idle cycles completed",
            UVM_LOW)
    endtask
endclass : cgra_basic_test
