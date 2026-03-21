// ============================================================================
// Name:         cgra_properties.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-05
// Last Modify:  2026-03-21
// Description:  Reusable SVA named properties for the CGRA testbench.
// ============================================================================

// ----------------------------------------------------------------------------
// Property: p_no_x_during_normal
//
// Description: Signal must never carry X/Z while reset is de-asserted.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - reset (input logic): Active-high reset.
//   - sig (input logic): Signal under check.
// ----------------------------------------------------------------------------
property p_no_x_during_normal(
    logic clk,
    logic reset,
    logic sig
);
    @(posedge clk) disable iff (reset)
        !$isunknown(sig);
endproperty

// ----------------------------------------------------------------------------
// Property: p_val_clears_after_reset
//
// Description: Valid must be de-asserted one cycle after reset rises.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - reset (input logic): Active-high reset.
//   - val_sig (input logic): Valid signal under check.
// ----------------------------------------------------------------------------
property p_val_clears_after_reset(
    logic clk,
    logic reset,
    logic val_sig
);
    @(posedge clk) $rose(reset) |=> !val_sig;
endproperty

// ----------------------------------------------------------------------------
// Property: p_val_stable_until_rdy
//
// Description: Once valid asserts, it must remain asserted until ready is
//      observed.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - reset (input logic): Active-high reset.
//   - val_sig (input logic): Valid signal.
//   - rdy_sig (input logic): Ready signal.
// ----------------------------------------------------------------------------
property p_val_stable_until_rdy(
    logic clk,
    logic reset,
    logic val_sig,
    logic rdy_sig
);
    @(posedge clk) disable iff (reset)
        (val_sig && !rdy_sig) |=> val_sig;
endproperty

// ----------------------------------------------------------------------------
// Property: p_rdy_stable_until_val
//
// Description: Once ready asserts, it must remain asserted until valid is
//      observed.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - reset (input logic): Active-high reset.
//   - val_sig (input logic): Valid signal.
//   - rdy_sig (input logic): Ready signal.
// ----------------------------------------------------------------------------
property p_rdy_stable_until_val(
    logic clk,
    logic reset,
    logic val_sig,
    logic rdy_sig
);
    @(posedge clk) disable iff (reset)
        (rdy_sig && !val_sig) |=> rdy_sig;
endproperty

// ----------------------------------------------------------------------------
// Property: p_handshake_transfer
//
// Description: Defines a successful ready/valid transfer event.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - val_sig (input logic): Valid signal.
//   - rdy_sig (input logic): Ready signal.
// ----------------------------------------------------------------------------
property p_handshake_transfer(
    logic clk,
    logic val_sig,
    logic rdy_sig
);
    @(posedge clk) val_sig && rdy_sig;
endproperty

// ----------------------------------------------------------------------------
// Property: p_no_transfer_during_reset
//
// Description: Prevents valid/ready transfer from being considered during
//      reset.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - reset (input logic): Active-high reset.
//   - val_sig (input logic): Valid signal.
//   - rdy_sig (input logic): Ready signal.
// ----------------------------------------------------------------------------
property p_no_transfer_during_reset(
    logic clk,
    logic reset,
    logic val_sig,
    logic rdy_sig
);
    @(posedge clk) reset |-> !(val_sig && rdy_sig);
endproperty

// ----------------------------------------------------------------------------
// Property: p_sig_asserted
//
// Description: Convenience cover property; signal observed high at least once.
//
// Params:
//   - clk (input logic): Sampling clock.
//   - sig (input logic): Signal to observe.
// ----------------------------------------------------------------------------
property p_sig_asserted(
    logic clk,
    logic sig
);
    @(posedge clk) sig;
endproperty
