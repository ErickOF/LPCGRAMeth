// ============================================================================
// File   : cgra_smoke_test.sv
// Brief  : Minimal smoke test – verifies the TB infrastructure compiles and
//          the DUT responds to reset + a few data words.
//
// TODO CGRA: Replace with a proper configuration + data sequence once the real
//            DUT is connected.  Typical CGRA smoke scenario:
//              1. Hard reset
//              2. Load N configuration words (cgra_config_seq)
//              3. Inject M data words (cgra_data_seq)
//              4. Check expected outputs in scoreboard
// ============================================================================
class cgra_smoke_test extends cgra_base_test;
    `uvm_component_utils(cgra_smoke_test)

    function new(string name = "cgra_smoke_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual task run_test_body(uvm_phase phase);
        cgra_base_seq seq;
        seq = cgra_base_seq::type_id::create("smoke_seq");
        seq.n_transactions = 5;
        seq.start(m_env.m_agent.m_sequencer);
        `uvm_info(get_type_name(), "Smoke test PASSED (dummy DUT)", UVM_LOW)
    endtask
endclass : cgra_smoke_test
