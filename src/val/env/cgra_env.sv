// ============================================================================
// File   : cgra_env.sv
// Brief  : UVM environment - assembles agent, scoreboard and coverage.
// ============================================================================
class cgra_env extends uvm_env;
    `uvm_component_utils(cgra_env)

    cgra_agent       m_agent;
    cgra_scoreboard  m_scoreboard;
    cgra_coverage    m_coverage;

    function new(string name = "cgra_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_agent      = cgra_agent::type_id::create("m_agent",      this);
        m_scoreboard = cgra_scoreboard::type_id::create("m_scoreboard", this);
        m_coverage   = cgra_coverage::type_id::create("m_coverage", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        m_agent.ap.connect(m_scoreboard.analysis_export);
        m_agent.ap.connect(m_coverage.analysis_export);
    endfunction
endclass : cgra_env
