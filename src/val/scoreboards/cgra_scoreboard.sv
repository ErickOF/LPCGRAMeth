// =============================================================================
// File   : cgra_scoreboard.sv
// Brief  : UVM scoreboard – checks DUT output against a reference model.
//          Currently validates the dummy DFF (output == previous input).
//
// TODO CGRA: Replace the check_item() logic with a reference model for
//            CgraTemplateRTL.  Key things to model:
//              - Configuration load (store sent CGRAConfig words)
//              - Data execution (predict data_out after N cycles latency)
//              - Memory read/write responses on the NoC channel
//            Use a queue or associative array to correlate requests/responses.
// =============================================================================
class cgra_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(cgra_scoreboard)

    uvm_analysis_imp #(cgra_seq_item, cgra_scoreboard) analysis_export;

    // Simple 1-cycle reference model state (DFF)
    // TODO CGRA: replace with a proper reference model
    logic [7:0] expected_out = '0;

    int unsigned n_checks = 0;
    int unsigned n_errors = 0;

    function new(string name = "cgra_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        analysis_export = new("analysis_export", this);
    endfunction

    // -------------------------------------------------------------------------
    // Called by the monitor analysis port on every observed transaction
    // -------------------------------------------------------------------------
    function void write(cgra_seq_item item);
        check_item(item);

        // Advance reference model one cycle
        // TODO CGRA: update reference model state here
        if (item.reset)
            expected_out = '0;
        else
            expected_out = item.data_in;
    endfunction

    function void check_item(cgra_seq_item item);
        n_checks++;

        // Skip check during reset cycle (output undefined)
        if (item.reset) return;

        // TODO CGRA: replace this DFF check with CGRA output prediction
        if (item.data_out !== expected_out) begin
            `uvm_error("SB_MISMATCH",
                $sformatf("data_out=0x%02h, expected=0x%02h | %s",
                          item.data_out, expected_out, item.convert2string()))
            n_errors++;
        end
    endfunction

    function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(),
            $sformatf("Scoreboard: checks=%0d errors=%0d", n_checks, n_errors),
            UVM_LOW)
        if (n_errors == 0)
            `uvm_info(get_type_name(), "*** ALL CHECKS PASSED ***", UVM_LOW)
        else
            `uvm_error(get_type_name(), "*** SCOREBOARD DETECTED ERRORS ***")
    endfunction
endclass : cgra_scoreboard
