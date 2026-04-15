// ============================================================================
// Name:         cgra_scoreboard.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-04-12
// Description:  UVM scoreboard - checks write-handshake signal integrity for
//      CgraTemplateRTL.
//      1) Verifies no X/Z on ready signals during non-reset cycles.
//      2) Counts accepted write transfers per tile.
// ============================================================================

class cgra_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(cgra_scoreboard)

    uvm_analysis_imp #(cgra_seq_item, cgra_scoreboard) analysis_export;

    int unsigned n_checks       = 0;
    int unsigned n_errors       = 0;
    int unsigned n_transfers    = 0;    // total accepted write handshakes

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the scoreboard instance and forwards arguments
    //      to the UVM base class constructor.
    //
    // Params:
    //   - name (input string): Instance name used by UVM hierarchy/reporting.
    //   - parent (input uvm_component): Parent component in UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Creates the analysis implementation export used to receive
    //      monitor transactions.
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        analysis_export = new("analysis_export", this);
    endfunction

    // ------------------------------------------------------------------------
    // Function: set_expected_results
    //
    // Description: No-op kept for interface compatibility with cgra_basic_test.
    //      The new DUT exposes no result output channel; expected payloads are
    //      not applicable.
    //
    // Params:
    //   - results (input logic [31:0] results[$]): Ignored.
    // ------------------------------------------------------------------------
    function void set_expected_results(logic [31:0] results[$]);
        if (results.size() > 0)
            `uvm_warning(get_type_name(),
                "set_expected_results called but new DUT has no output channel; ignoring.")
    endfunction

    // ------------------------------------------------------------------------
    // Function: write
    //
    // Description: Analysis callback that dispatches one observed item to the
    //      scoreboard checker.
    //
    // Params:
    //   - item (input cgra_seq_item): Observed transaction from monitor.
    // ------------------------------------------------------------------------
    function void write(cgra_seq_item item);
        check_item(item);
    endfunction

    // ------------------------------------------------------------------------
    // Function: check_item
    //
    // Description: Protocol check on each accepted write transfer: ensures
    //      ready signals are not X/Z.
    //
    // Params:
    //   - item (input cgra_seq_item): Observed transaction to validate.
    // ------------------------------------------------------------------------
    function void check_item(cgra_seq_item item);
        n_checks++;
        n_transfers++;

        // Skip X checks while DUT is in reset
        if (item.reset !== 1'b0) return;

        if ($isunknown(item.waddr_rdy)) begin
            `uvm_error("SB_X_ON_WADDR_RDY",
                $sformatf("recv_waddr__rdy X/Z on accepted transfer | %s",
                    item.convert2string()))
            n_errors++;
        end

        if ($isunknown(item.wopt_rdy)) begin
            `uvm_error("SB_X_ON_WOPT_RDY",
                $sformatf("recv_wopt__rdy X/Z on accepted transfer | %s",
                    item.convert2string()))
            n_errors++;
        end
    endfunction

    // ------------------------------------------------------------------------
    // Function: report_phase
    //
    // Description: Reports final scoreboard statistics.
    //
    // Params:
    //   - phase (input uvm_phase): UVM report phase handle.
    // ------------------------------------------------------------------------
    function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(),
            $sformatf("Scoreboard: checks=%0d errors=%0d accepted_transfers=%0d",
                n_checks, n_errors, n_transfers),
            UVM_LOW)
        if (n_errors == 0)
            `uvm_info(get_type_name(), "*** ALL CHECKS PASSED ***", UVM_LOW)
        else
            `uvm_error(get_type_name(), "*** SCOREBOARD DETECTED ERRORS ***")
    endfunction
endclass : cgra_scoreboard
