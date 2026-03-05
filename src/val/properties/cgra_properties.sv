// ============================================================================
// File   : cgra_properties.sv
// Brief  : Reusable SVA named properties for the CGRA testbench.
//
// How to use
// ----------
// `include "cgra_properties.sv" inside any module or checker that needs these
// checks, then bind each property to an assertion or cover label, e.g.:
//
//   MY_ASSERT : assert property (
//       p_no_x_during_normal(clk, reset, my_signal))
//       else $error("...");
//
//   MY_COVER  : cover property (
//       p_handshake_transfer(clk, val_sig, rdy_sig));
//
// All properties take explicit formal port arguments so they remain fully
// signal-agnostic and can be reused across different modules / checkers.
// ============================================================================

// ----------------------------------------------------------------------------
// p_no_x_during_normal
//   sig must never carry X or Z while reset is de-asserted.
//   Applies to any single-bit or packed output that must be driven cleanly
//   outside of reset.
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
// p_val_clears_after_reset
//   val_sig must be de-asserted exactly one cycle after reset is raised.
//   Enforces that the DUT does not spuriously assert an output-valid on the
//   rising edge of reset.
// ----------------------------------------------------------------------------
property p_val_clears_after_reset(
    logic clk,
    logic reset,
    logic val_sig
);
    @(posedge clk) $rose(reset) |=> !val_sig;
endproperty

// ----------------------------------------------------------------------------
// p_val_stable_until_rdy  (handshake stability / no-retract rule)
//   Once val_sig is asserted it must remain asserted until rdy_sig is seen.
//   This enforces the standard ready/valid protocol: a sender may not
//   de-assert valid before the receiver acknowledges with ready.
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
// p_rdy_stable_until_val  (back-pressure stability)
//   Symmetric counterpart: once rdy_sig is asserted it must stay high until
//   the sender completes the transfer (val_sig seen high).
//   Useful when the TB drives back-pressure and must not withdraw it early.
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
// p_handshake_transfer
//   A successful transfer occurs when both val_sig and rdy_sig are high on
//   the same rising clock edge.  Intended as a cover property to prove that
//   at least one complete transaction was observed.
// ----------------------------------------------------------------------------
property p_handshake_transfer(
    logic clk,
    logic val_sig,
    logic rdy_sig
);
    @(posedge clk) val_sig && rdy_sig;
endproperty

// ----------------------------------------------------------------------------
// p_no_transfer_during_reset
//   Neither val nor rdy should produce a simultaneous high pair during reset,
//   meaning no transfer accidentally commits while the DUT is in reset.
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
// p_sig_asserted
//   Convenience cover property: signal sig was observed high at least once.
//   Use this to confirm that a channel or control line was exercised.
// ----------------------------------------------------------------------------
property p_sig_asserted(
    logic clk,
    logic sig
);
    @(posedge clk) sig;
endproperty
