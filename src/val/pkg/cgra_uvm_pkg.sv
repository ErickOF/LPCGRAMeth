// ============================================================================
// File   : cgra_uvm_pkg.sv
// Brief  : UVM package - includes all TB classes in the correct
//          compilation / elaboration order.
//
// Compilation order matters:
//   seq_item -> sequences -> sequencer -> driver -> monitor -> agent
//   -> scoreboard -> coverage -> env -> tests
// ============================================================================
package cgra_uvm_pkg;
    import uvm_pkg::*;
    import cgra_pkg::*;
    `include "uvm_macros.svh"

    // ------------------------------------------------------------------------
    // Sequence item
    // ------------------------------------------------------------------------
    `include "cgra_seq_item.sv"

    // ------------------------------------------------------------------------
    // Sequences
    // ------------------------------------------------------------------------
    `include "cgra_base_seq.sv"
    `include "cgra_reset_seq.sv"

    // ------------------------------------------------------------------------
    // Agent components
    // ------------------------------------------------------------------------
    `include "cgra_sequencer.sv"
    `include "cgra_driver.sv"
    `include "cgra_monitor.sv"
    `include "cgra_agent.sv"

    // ------------------------------------------------------------------------
    // Scoreboard, coverage, environment
    // ------------------------------------------------------------------------
    `include "cgra_scoreboard.sv"
    `include "cgra_coverage.sv"
    `include "cgra_env.sv"

    // ------------------------------------------------------------------------
    // Tests
    // ------------------------------------------------------------------------
    `include "cgra_base_test.sv"
    `include "cgra_basic_test.sv"
endpackage : cgra_uvm_pkg
