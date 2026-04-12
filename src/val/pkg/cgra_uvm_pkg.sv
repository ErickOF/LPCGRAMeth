// ============================================================================
// Name:         cgra_uvm_pkg.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM package - includes all TB classes in the correct
//      compilation / elaboration order.
// ============================================================================

package cgra_uvm_pkg;
    import uvm_pkg::*;
    import cgra_pkg::*;
    `include "uvm_macros.svh"
    `include "cgra_opcodes.svh"

    // ------------------------------------------------------------------------
    // Sequence item
    // ------------------------------------------------------------------------
    `include "cgra_seq_item.sv"

    // ------------------------------------------------------------------------
    // Sequences
    // ------------------------------------------------------------------------
    `include "cgra_base_seq.sv"
    `include "cgra_reset_seq.sv"
    `include "cgra_ctrl_step_cfg.sv"
    `include "cgra_tile_cfg.sv"
    `include "cgra_program_base_seq.sv"
    `include "cgra_operation_map_seq.sv"
    `include "cgra_prologue_config_seq.sv"
    `include "cgra_hex_replay_seq.sv"
    `include "cgra_config_seq.sv"

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
