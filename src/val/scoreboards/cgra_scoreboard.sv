// ============================================================================
// Name:         cgra_scoreboard.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM scoreboard for protocol and functional result checks.
//      1) Verifies no X/Z on critical handshake signals.
//      2) Verifies each observed CPU result payload matches one expected
//         operation result configured by the active test.
// ============================================================================

class cgra_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(cgra_scoreboard)

    uvm_analysis_imp #(cgra_seq_item, cgra_scoreboard) analysis_export;

    int unsigned n_checks = 0;
    int unsigned n_errors = 0;
    int unsigned n_result_pkts = 0;
    int unsigned n_result_matched = 0;

    logic [31:0] expected_results[$];
    bit expected_matched[$];

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
    // Function: set_expected_results
    //
    // Description: Loads the expected CPU result payload list and resets
    //      runtime match counters/state.
    //
    // Params:
    //   - results (input logic [31:0] results[$]): Expected payload queue.
    // ------------------------------------------------------------------------
    function void set_expected_results(logic [31:0] results[$]);
        expected_results.delete();
        expected_matched.delete();
        n_result_pkts = 0;
        n_result_matched = 0;

        for (int i = 0; i < results.size(); i++) begin
            expected_results.push_back(results[i]);
            expected_matched.push_back(1'b0);
        end

        `uvm_info(get_type_name(),
            $sformatf("Configured %0d expected operation result(s)", expected_results.size()),
            UVM_LOW)
    endfunction

    // ------------------------------------------------------------------------
    // Function: check_item
    //
    // Description: Performs protocol checks and expected-result matching for a
    //      single observed transaction item.
    //
    // Params:
    //   - item (input cgra_seq_item): Observed transaction to validate.
    // ------------------------------------------------------------------------
    function void check_item(cgra_seq_item item);
        logic [31:0] observed_payload;
        int matched_idx;

        n_checks++;

        // Skip checks while DUT is in reset (also skip when reset is
        // X/uninitialized)
        if (item.reset !== 1'b0) return;

        if ($isunknown(item.send_to_cpu_pkt__val)) begin
            `uvm_error("SB_X_ON_VAL",
                $sformatf("send_to_cpu_pkt__val X/Z | %s", item.convert2string()))
            n_errors++;
        end

        if ($isunknown(item.recv_from_cpu_pkt__rdy)) begin
            `uvm_error("SB_X_ON_RDY",
                $sformatf("recv_from_cpu_pkt__rdy X/Z | %s", item.convert2string()))
            n_errors++;
        end

        // Functional checker: every output result packet must map to one
        // expected result payload configured by the test.
        if (item.send_to_cpu_pkt__val && item.send_to_cpu_pkt__rdy) begin
            n_result_pkts++;
            observed_payload = item.send_to_cpu_pkt__msg.payload.data.payload;

            if ($isunknown(observed_payload)) begin
                `uvm_error("SB_X_ON_RESULT_PAYLOAD",
                    $sformatf("CPU result payload has X/Z on handshake | %s", item.convert2string()))
                n_errors++;
                return;
            end

            if (expected_results.size() == 0) begin
                `uvm_error("SB_UNEXPECTED_RESULT",
                    $sformatf("Observed result payload 0x%08h but no expected results were configured",
                        observed_payload))
                n_errors++;
                return;
            end

            matched_idx = -1;
            for (int i = 0; i < expected_results.size(); i++) begin
                if (!expected_matched[i] && (observed_payload == expected_results[i])) begin
                    matched_idx = i;
                    break;
                end
            end

            if (matched_idx < 0) begin
                `uvm_error("SB_RESULT_MISMATCH",
                    $sformatf("Unexpected result payload 0x%08h (no unmatched expected value)",
                        observed_payload))
                n_errors++;
                return;
            end

            expected_matched[matched_idx] = 1'b1;
            n_result_matched++;
            `uvm_info("SB_RESULT_MATCH",
                $sformatf("Matched result[%0d] = 0x%08h", matched_idx, observed_payload),
                UVM_MEDIUM)
        end

    endfunction

    // ------------------------------------------------------------------------
    // Function: report_phase
    //
    // Description: Reports final scoreboard statistics and emits errors for
    //      unmatched expected results.
    //
    // Params:
    //   - phase (input uvm_phase): UVM report phase handle.
    // ------------------------------------------------------------------------
    function void report_phase(uvm_phase phase);
        int unmatched;

        unmatched = 0;
        for (int i = 0; i < expected_matched.size(); i++) begin
            if (!expected_matched[i])
                unmatched++;
        end

        if (unmatched != 0) begin
            `uvm_error("SB_MISSING_RESULTS",
                $sformatf("Missing %0d expected result(s): matched=%0d expected=%0d",
                    unmatched, n_result_matched, expected_results.size()))
            n_errors += unmatched;
        end

        `uvm_info(get_type_name(),
            $sformatf("Scoreboard: checks=%0d errors=%0d result_pkts=%0d matched=%0d expected=%0d",
                n_checks, n_errors, n_result_pkts, n_result_matched, expected_results.size()),
            UVM_LOW)
        if (n_errors == 0)
            `uvm_info(get_type_name(), "*** ALL CHECKS PASSED ***", UVM_LOW)
        else
            `uvm_error(get_type_name(), "*** SCOREBOARD DETECTED ERRORS ***")
    endfunction
endclass : cgra_scoreboard
