// ============================================================================
// File   : cgra_coverage.sv
// Brief  : Functional coverage collector.
//          Currently covers the dummy DFF stimulus space.
//
// TODO CGRA: Add covergroups for:
//              - Transaction types (CPU_PKT, INTER_NOC, RESET)
//              - CPU packet CMD field values (0..4)
//              - NoC packet CMD field values
//              - Back-pressure (val && !rdy sustained for N cycles)
//              - Configuration word address ranges
//              - Data payload corner cases (0x0, 0xFF, etc.)
// ============================================================================
class cgra_coverage extends uvm_subscriber #(cgra_seq_item);
    `uvm_component_utils(cgra_coverage)

    cgra_seq_item current_item;

    // ------------------------------------------------------------------------
    // Cover-group: stimulus space of the dummy DFF
    // TODO CGRA: replace / extend with DUT-relevant groups
    // ------------------------------------------------------------------------
    covergroup cg_dff_stimulus;
        cp_reset   : coverpoint current_item.reset;
        cp_data_in : coverpoint current_item.data_in {
            bins zero    = {8'h00};
            bins max_val = {8'hFF};
            bins others  = default;
        }
        cx_reset_x_data : cross cp_reset, cp_data_in;
    endgroup

    function new(string name = "cgra_coverage", uvm_component parent = null);
        super.new(name, parent);

        cg_dff_stimulus = new();
    endfunction

    // ------------------------------------------------------------------------
    // Called by uvm_subscriber analysis export
    // ------------------------------------------------------------------------
    function void write(cgra_seq_item t);
        current_item = t;
        cg_dff_stimulus.sample();
    endfunction

    function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(),
            $sformatf("Coverage: cg_dff_stimulus=%.1f%%",
                      cg_dff_stimulus.get_coverage()),
            UVM_LOW)
    endfunction
endclass : cgra_coverage
