// ============================================================================
// File   : cgra_base_test.sv
// Brief  : UVM base test – bootstraps the environment and runs the base
//          sequence.  All other tests extend this class.
//
// TODO CGRA: In run_test_body(), replace cgra_base_seq with
//            specialized sequences once the DUT is connected:
//              - cgra_config_seq  (loads configuration words)
//              - cgra_data_seq    (injects data via CPU channel)
//              - cgra_random_seq  (stress / regression)
// ============================================================================
class cgra_base_test extends uvm_test;
    `uvm_component_utils(cgra_base_test)

    cgra_env m_env;

    function new(string name = "cgra_base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_env = cgra_env::type_id::create("m_env", this);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "cgra_base_test running");
        run_test_body(phase);
        phase.drop_objection(this, "cgra_base_test done");
    endtask

    // ------------------------------------------------------------------------
    // Override this task in derived tests to change stimulus
    // ------------------------------------------------------------------------
    virtual task run_test_body(uvm_phase phase);
        cgra_base_seq seq = cgra_base_seq::type_id::create("base_seq");
        seq.start(m_env.m_agent.m_sequencer);
        `uvm_info(get_type_name(), "Hello from cgra_base_test!", UVM_LOW)
    endtask
endclass : cgra_base_test
