// =============================================================================
// File   : cgra_scoreboard.sv
// Brief  : UVM scoreboard - sanity-checks DUT output signals.
//          Verifies no X/Z on output valids during normal operation.
//          A full reference model can be added when stimulus is developed.
// =============================================================================
class cgra_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(cgra_scoreboard)

    uvm_analysis_imp #(cgra_seq_item, cgra_scoreboard) analysis_export;

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
    endfunction

    function void check_item(cgra_seq_item item);
        n_checks++;

        // Skip checks while DUT is in reset
        if (item.reset) return;

        if ($isunknown(item.send_to_cpu_pkt__val)) begin
            `uvm_error("SB_X_ON_VAL",
                $sformatf("send_to_cpu_pkt__val X/Z | %s", item.convert2string()))
            n_errors++;
        end

        if ($isunknown(item.send_to_inter_cgra_noc__val)) begin
            `uvm_error("SB_X_ON_VAL",
                $sformatf("send_to_inter_cgra_noc__val X/Z | %s", item.convert2string()))
            n_errors++;
        end

        if ($isunknown(item.recv_from_cpu_pkt__rdy)) begin
            `uvm_error("SB_X_ON_RDY",
                $sformatf("recv_from_cpu_pkt__rdy X/Z | %s", item.convert2string()))
            n_errors++;
        end

        if ($isunknown(item.recv_from_inter_cgra_noc__rdy)) begin
            `uvm_error("SB_X_ON_RDY",
                $sformatf("recv_from_inter_cgra_noc__rdy X/Z | %s", item.convert2string()))
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
