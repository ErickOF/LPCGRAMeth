// ============================================================================
// Name:         cgra_agent.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM agent - bundles driver, monitor and sequencer.
// ============================================================================

class cgra_agent extends uvm_agent;
    `uvm_component_utils(cgra_agent)

    cgra_driver    m_driver;
    cgra_monitor   m_monitor;
    cgra_sequencer m_sequencer;

    // Forward analysis port so the environment can connect scoreboard/coverage
    uvm_analysis_port #(cgra_seq_item) ap;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the agent instance and forwards arguments to the
    //      UVM base class constructor.
    //
    // Params:
    //   - name (input string): Instance name used by UVM hierarchy and
    //     reporting.
    //   - parent (input uvm_component): Parent component in the UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Creates the analysis port and monitor, and conditionally
    //      creates driver and sequencer when the agent is active.
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);
        m_monitor = cgra_monitor::type_id::create("m_monitor", this);

        if (get_is_active() == UVM_ACTIVE) begin
            m_driver    = cgra_driver::type_id::create("m_driver", this);
            m_sequencer = cgra_sequencer::type_id::create("m_sequencer", this);
        end
    endfunction

    // ------------------------------------------------------------------------
    // Function: connect_phase
    //
    // Description: Connects monitor analysis output to the agent analysis
    //      port and connects driver/sequencer ports for active mode.
    //
    // Params:
    //   - phase (input uvm_phase): UVM connect phase handle.
    // ------------------------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        m_monitor.ap.connect(ap);

        if (get_is_active() == UVM_ACTIVE)
            m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
    endfunction
endclass : cgra_agent
