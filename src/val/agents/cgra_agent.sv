// ============================================================================
// File   : cgra_agent.sv
// Brief  : UVM agent - bundles driver, monitor and sequencer.
// ============================================================================
class cgra_agent extends uvm_agent;
    `uvm_component_utils(cgra_agent)

    cgra_driver    m_driver;
    cgra_monitor   m_monitor;
    cgra_sequencer m_sequencer;

    // Forward analysis port so the environment can connect scoreboard/coverage
    uvm_analysis_port #(cgra_seq_item) ap;

    function new(string name = "cgra_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);
        m_monitor = cgra_monitor::type_id::create("m_monitor", this);

        if (get_is_active() == UVM_ACTIVE) begin
            m_driver    = cgra_driver::type_id::create("m_driver", this);
            m_sequencer = cgra_sequencer::type_id::create("m_sequencer", this);
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        m_monitor.ap.connect(ap);

        if (get_is_active() == UVM_ACTIVE)
            m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
    endfunction
endclass : cgra_agent
