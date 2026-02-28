// ============================================================================
// File   : cgra_uvm_pkg.sv
// Brief  : UVM package – includes all TB classes in the correct
//          compilation / elaboration order.
//
// Compilation order matters:
//   seq_item -> sequences -> sequencer -> driver -> monitor -> agent
//   -> scoreboard -> coverage -> env -> tests
//
// TODO CGRA: When adding more sequence types (config, data, random …) or
//            additional agents, add their `include lines in order below.
// ============================================================================
package cgra_uvm_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // ------------------------------------------------------------------------
    // Sequence item
    // ------------------------------------------------------------------------
    `include "cgra_seq_item.sv"

    // ------------------------------------------------------------------------
    // Sequences
    // TODO CGRA: add cgra_config_seq.sv, cgra_data_seq.sv, cgra_random_seq.sv
    // ------------------------------------------------------------------------
    `include "cgra_base_seq.sv"

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
    // TODO CGRA: add cgra_random_test.sv and any targeted test classes
    // ------------------------------------------------------------------------
    `include "cgra_base_test.sv"
    `include "cgra_smoke_test.sv"
endpackage : cgra_uvm_pkg
