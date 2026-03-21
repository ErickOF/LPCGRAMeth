// ============================================================================
// Name:         cgra_coverage.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  Functional coverage collector for CgraTemplateRTL.
// ============================================================================

class cgra_coverage extends uvm_subscriber #(cgra_seq_item);
    `uvm_component_utils(cgra_coverage)

    cgra_seq_item current_item;

    // ------------------------------------------------------------------------
    // Cover-group: key stimulus and response signals
    // ------------------------------------------------------------------------
    covergroup cg_cgra_stimulus;
        cp_reset          : coverpoint current_item.reset;
        cp_cpu_val        : coverpoint current_item.recv_from_cpu_pkt__val;
        cp_noc_val        : coverpoint current_item.recv_from_inter_cgra_noc__val;
        cp_send_cpu_val   : coverpoint current_item.send_to_cpu_pkt__val;
        cp_send_noc_val   : coverpoint current_item.send_to_inter_cgra_noc__val;
        cp_cpu_rdy_out    : coverpoint current_item.recv_from_cpu_pkt__rdy;
        cp_noc_rdy_out    : coverpoint current_item.recv_from_inter_cgra_noc__rdy;
        cx_reset_x_cpu_val : cross cp_reset, cp_cpu_val;
    endgroup

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the coverage collector and instantiates the
    //      covergroup used for sampling observed transactions.
    //
    // Params:
    //   - name (input string): Instance name used in the UVM hierarchy.
    //   - parent (input uvm_component): Parent component in the UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_coverage", uvm_component parent = null);
        super.new(name, parent);

        cg_cgra_stimulus = new();
    endfunction

    // ------------------------------------------------------------------------
    // Called by uvm_subscriber analysis export
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // Function: write
    //
    // Description: Receives one observed sequence item and samples the
    //      coverage model using that item as the current sample.
    //
    // Params:
    //   - t (input cgra_seq_item): Observed transaction from the monitor.
    // ------------------------------------------------------------------------
    function void write(cgra_seq_item t);
        current_item = t;
        cg_cgra_stimulus.sample();
    endfunction

    // ------------------------------------------------------------------------
    // Function: report_phase
    //
    // Description: Reports aggregate functional coverage at the end of
    //      simulation.
    //
    // Params:
    //   - phase (input uvm_phase): UVM report phase handle.
    // ------------------------------------------------------------------------
    function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(),
            $sformatf("Coverage: cg_cgra_stimulus=%.1f%%",
                      cg_cgra_stimulus.get_coverage()),
            UVM_LOW)
    endfunction
endclass : cgra_coverage
