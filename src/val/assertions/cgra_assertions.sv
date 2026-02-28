// ============================================================================
// File   : cgra_assertions.sv
// Brief  : SVA assertion module – bound to the DUT from tb_top.
//          Currently checks the dummy DFF contract.
//
// TODO CGRA: Replace port list with CgraTemplateRTL signals:
//              input IntraCgraPacket_*  recv_from_cpu_pkt__msg, ...
//              input InterCgraPacket_*  recv_from_inter_cgra_noc__msg, ...
//            Add assertions for:
//              - Output valid never asserted during reset
//              - Handshake stability (val stays high until rdy)
//              - No X/Z on output valid signals
//              - Latency bounds (response within N cycles after request)
// ============================================================================
`timescale 1ns/1ps

module cgra_assertions (
    input logic       clk,
    input logic       reset,
    // TODO CGRA: replace these two ports with real DUT I/O
    input logic [7:0] data_in,
    input logic [7:0] data_out
);
    // ------------------------------------------------------------------------
    // A_OUTPUT_X_FREE : No X on data_out while not in reset
    // ------------------------------------------------------------------------
    property p_output_x_free;
        @(posedge clk) disable iff (reset)
            !$isunknown(data_out);
    endproperty

    A_OUTPUT_X_FREE : assert property (p_output_x_free)
        else $error("[SVA] data_out has X/Z at time %0t", $time);

    // ------------------------------------------------------------------------
    // A_RESET_CLEARS_OUTPUT : After reset the output must be 0
    // TODO CGRA: adapt to real reset behaviour of CgraTemplateRTL
    // ------------------------------------------------------------------------
    property p_reset_clears_output;
        @(posedge clk) $fell(reset) |=> (data_out === '0);
    endproperty

    A_RESET_CLEARS_OUTPUT : assert property (p_reset_clears_output)
        else $error("[SVA] data_out not zero one cycle after reset de-asserted");

    // ------------------------------------------------------------------------
    // Coverage properties
    // TODO CGRA: add cover properties for handshake scenarios
    // ------------------------------------------------------------------------
    C_DATA_MAX  : cover property (@(posedge clk) data_in === 8'hFF);
    C_DATA_ZERO : cover property (@(posedge clk) data_in === 8'h00);
endmodule : cgra_assertions
