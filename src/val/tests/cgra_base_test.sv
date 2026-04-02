// ============================================================================
// Name:         cgra_base_test.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM base test - bootstraps the environment and runs the base
//               sequence. All other tests extend this class.
// ============================================================================

class cgra_base_test extends uvm_test;
    `uvm_component_utils(cgra_base_test)

    cgra_env m_env;
    virtual cgra_if vif;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the base test component and forwards arguments
    //      to the UVM base class constructor.
    //
    // Params:
    //   - name (input string): Test instance name.
    //   - parent (input uvm_component): Parent component in UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Creates environment and retrieves virtual interface from
    //      UVM config database.
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_env = cgra_env::type_id::create("m_env", this);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal(
                get_type_name(),
                "Virtual interface not found. Check uvm_config_db::set() call in tb_top.")
    endfunction

    // ------------------------------------------------------------------------
    // Task: run_phase
    //
    // Description: Raises objection, runs test body, and drops objection to
    //      control simulation end.
    //
    // Params:
    //   - phase (input uvm_phase): UVM run phase handle.
    // ------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "cgra_base_test running");
        run_test_body(phase);
        phase.drop_objection(this, "cgra_base_test done");
    endtask

    // ------------------------------------------------------------------------
    // Task: run_test_body
    //
    // Description: Default test body that starts the base sequence; intended
    //      to be overridden by derived tests.
    //      Override this task in derived tests to change stimulus generation
    //      behavior.
    //
    // Params:
    //   - phase (input uvm_phase): Active UVM phase handle.
    // ------------------------------------------------------------------------
    virtual task run_test_body(uvm_phase phase);
        cgra_base_seq seq = cgra_base_seq::type_id::create("base_seq");
        seq.start(m_env.m_agent.m_sequencer);
        `uvm_info(get_type_name(), "Hello from cgra_base_test!", UVM_LOW)
    endtask

    // ------------------------------------------------------------------------
    // Task: wait_n_clocks
    //
    // Description: Waits for a programmable number of monitor clock events.
    //
    // Params:
    //   - n_cycles (input int unsigned): Number of monitor clock cycles.
    // ------------------------------------------------------------------------
    task wait_n_clocks(int unsigned n_cycles);
        repeat (n_cycles)
            @(vif.monitor_cb);
    endtask
endclass : cgra_base_test
