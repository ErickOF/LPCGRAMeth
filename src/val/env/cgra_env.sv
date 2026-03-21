// ============================================================================
// Name:         cgra_env.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM environment - assembles agent, scoreboard and coverage.
// ============================================================================

class cgra_env extends uvm_env;
    `uvm_component_utils(cgra_env)

    cgra_agent       m_agent;
    cgra_scoreboard  m_scoreboard;
    cgra_coverage    m_coverage;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the environment instance and forwards arguments
    //      to the UVM base class constructor.
    //
    // Params:
    //   - name (input string): Instance name used by UVM hierarchy/reporting.
    //   - parent (input uvm_component): Parent component in UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Creates all environment sub-components (agent, scoreboard,
    //      and coverage collector).
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_agent      = cgra_agent::type_id::create("m_agent",      this);
        m_scoreboard = cgra_scoreboard::type_id::create("m_scoreboard", this);
        m_coverage   = cgra_coverage::type_id::create("m_coverage", this);
    endfunction

    // ------------------------------------------------------------------------
    // Function: connect_phase
    //
    // Description: Connects the agent analysis port to scoreboard and
    //      coverage analysis exports.
    //
    // Params:
    //   - phase (input uvm_phase): UVM connect phase handle.
    // ------------------------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        m_agent.ap.connect(m_scoreboard.analysis_export);
        m_agent.ap.connect(m_coverage.analysis_export);
    endfunction
endclass : cgra_env
