// ============================================================================
// File   : cgra_assertions.sv
// Brief  : SVA assertion module - bound to CgraTemplateRTL from tb_top.
// ============================================================================
`timescale 1ns/1ps

module cgra_assertions (
    input logic clk,
    input logic reset,
    // Ready signals (DUT outputs)
    input logic recv_from_cpu_pkt__rdy,
    input logic recv_from_inter_cgra_noc__rdy,
    // DUT send-channel outputs
    input logic send_to_cpu_pkt__val,
    input logic send_to_cpu_pkt__rdy,
    input logic send_to_inter_cgra_noc__val,
    input logic send_to_inter_cgra_noc__rdy
);
    // ------------------------------------------------------------------------
    // A_SEND_CPU_VAL_X_FREE : No X on send_to_cpu_pkt__val outside reset
    // ------------------------------------------------------------------------
    property p_send_cpu_val_x_free;
        @(posedge clk) disable iff (reset)
            !$isunknown(send_to_cpu_pkt__val);
    endproperty

    A_SEND_CPU_VAL_X_FREE : assert property (p_send_cpu_val_x_free)
        else $error("[SVA] send_to_cpu_pkt__val has X/Z at time %0t", $time);

    // ------------------------------------------------------------------------
    // A_SEND_NOC_VAL_X_FREE : No X on send_to_inter_cgra_noc__val outside reset
    // ------------------------------------------------------------------------
    property p_send_noc_val_x_free;
        @(posedge clk) disable iff (reset)
            !$isunknown(send_to_inter_cgra_noc__val);
    endproperty

    A_SEND_NOC_VAL_X_FREE : assert property (p_send_noc_val_x_free)
        else $error("[SVA] send_to_inter_cgra_noc__val has X/Z at time %0t", $time);

    // ------------------------------------------------------------------------
    // A_SEND_CPU_VAL_IN_RESET : DUT must not assert CPU send-valid during reset
    // (one cycle after reset rises the output must be clear)
    // ------------------------------------------------------------------------
    property p_send_cpu_val_in_reset;
        @(posedge clk) $rose(reset) |=> !send_to_cpu_pkt__val;
    endproperty

    A_SEND_CPU_VAL_IN_RESET : assert property (p_send_cpu_val_in_reset)
        else $error("[SVA] send_to_cpu_pkt__val asserted one cycle after reset rose");

    // ------------------------------------------------------------------------
    // A_SEND_NOC_VAL_IN_RESET : DUT must not assert NoC send-valid during reset
    // ------------------------------------------------------------------------
    property p_send_noc_val_in_reset;
        @(posedge clk) $rose(reset) |=> !send_to_inter_cgra_noc__val;
    endproperty

    A_SEND_NOC_VAL_IN_RESET : assert property (p_send_noc_val_in_reset)
        else $error("[SVA] send_to_inter_cgra_noc__val asserted one cycle after reset rose");

    // ------------------------------------------------------------------------
    // Coverage
    // ------------------------------------------------------------------------
    C_RECV_CPU_RDY : cover property (@(posedge clk) recv_from_cpu_pkt__rdy);
    C_RECV_NOC_RDY : cover property (@(posedge clk) recv_from_inter_cgra_noc__rdy);
    C_SEND_CPU_XFER : cover property (
        @(posedge clk) send_to_cpu_pkt__val && send_to_cpu_pkt__rdy);
    C_SEND_NOC_XFER : cover property (
        @(posedge clk) send_to_inter_cgra_noc__val && send_to_inter_cgra_noc__rdy);
endmodule : cgra_assertions
