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
    // TB-only types (structs / unions must live in a package)
    // ------------------------------------------------------------------------
    typedef struct packed {
        logic [8:0]  dst_tile;   // destination tile ID  (0 - 255)
        logic [8:0]  addr;       // data SRAM word address
        logic [31:0] data;       // 32-bit payload
        logic [0:0]  predicate;  // predicate bit
    } cgra_data_entry_t;

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
    `include "cgra_preload_seq.sv"
    `include "cgra_const_load_seq.sv"
    `include "cgra_loop_config_seq.sv"
    `include "cgra_operation_map_seq.sv"
    `include "cgra_prologue_config_seq.sv"
    `include "cgra_launch_seq.sv"
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
