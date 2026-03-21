// ============================================================================
// Name:         cgra_assertions.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  SVA assertion module - bound to CgraTemplateRTL from tb_top.
// ============================================================================

`timescale 1ns/1ps

// ----------------------------------------------------------------------------
// Module: cgra_assertions
//
// Description: Assertion module bound to the CGRA DUT to enforce basic
//      signal-integrity and reset/handshake behavior on CPU-facing output
//      channels.
//
// Params:
//   - clk (input logic): Assertion sampling clock.
//   - reset (input logic): Active-high reset.
//   - recv_from_cpu_pkt__rdy (input logic): DUT ready back to CPU input.
//   - send_to_cpu_pkt__msg (input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d):
//     DUT message sent toward CPU.
//   - send_to_cpu_pkt__val (input logic): DUT valid toward CPU.
//   - send_to_cpu_pkt__rdy (input logic): TB ready for CPU-send channel.
// ----------------------------------------------------------------------------
module cgra_assertions (
    input logic clk,
    input logic reset,
    // Ready signals (DUT outputs)
    input logic recv_from_cpu_pkt__rdy,
    // DUT send-channel outputs
    input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send_to_cpu_pkt__msg,
    input logic send_to_cpu_pkt__val,
    input logic send_to_cpu_pkt__rdy
    // Note: inter_cgra_noc ports omitted - feature not supported
);

    // ------------------------------------------------------------------------
    // Property: p_send_cpu_val_x_free
    //
    // Description: Ensures send-to-CPU valid is never X/Z while out of reset.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // A_SEND_CPU_VAL_X_FREE : No X on send_to_cpu_pkt__val outside reset
    // ------------------------------------------------------------------------
    property p_send_cpu_val_x_free;
        @(posedge clk) disable iff (reset !== 1'b0)
            !$isunknown(send_to_cpu_pkt__val);
    endproperty

    A_SEND_CPU_VAL_X_FREE : assert property (p_send_cpu_val_x_free)
        else $error("[SVA] send_to_cpu_pkt__val has X/Z at time %0t", $time);

    // ------------------------------------------------------------------------
    // Property: p_send_cpu_val_in_reset
    //
    // Description: Ensures send-to-CPU valid is de-asserted one cycle after
    //      reset rises.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
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
    // Property: p_send_cpu_payload_x_free
    //
    // Description: Ensures accepted payload data on CPU output channel is
    //      fully known (not X/Z).
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // A_SEND_CPU_PAYLOAD_X_FREE : on accepted result packet, payload must be
    // fully known.
    // ------------------------------------------------------------------------
    property p_send_cpu_payload_x_free;
        @(posedge clk) disable iff (reset !== 1'b0)
            (send_to_cpu_pkt__val && send_to_cpu_pkt__rdy)
            |-> !$isunknown(send_to_cpu_pkt__msg.payload.data.payload);
    endproperty

    A_SEND_CPU_PAYLOAD_X_FREE : assert property (p_send_cpu_payload_x_free)
        else $error("[SVA] send_to_cpu result payload has X/Z during handshake");

    // ------------------------------------------------------------------------
    // Coverage
    // ------------------------------------------------------------------------
    C_RECV_CPU_RDY  : cover property (@(posedge clk) recv_from_cpu_pkt__rdy);
    C_SEND_CPU_XFER : cover property (
        @(posedge clk) send_to_cpu_pkt__val && send_to_cpu_pkt__rdy);
endmodule : cgra_assertions
