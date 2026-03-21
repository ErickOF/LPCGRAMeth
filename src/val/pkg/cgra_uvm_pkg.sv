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

    typedef enum logic [6:0] {
        CGRA_OP_OPT_NAH       = `OPT_NAH,
        CGRA_OP_OPT_ADD       = `OPT_ADD,
        CGRA_OP_OPT_MUL       = `OPT_MUL,
        CGRA_OP_OPT_LD        = `OPT_LD,
        CGRA_OP_OPT_DIV       = `OPT_DIV,
        CGRA_OP_OPT_REM       = `OPT_REM,
        CGRA_OP_OPT_ADD_CONST = `OPT_ADD_CONST,
        CGRA_OP_OPT_PHI_CONST = `OPT_PHI_CONST,
        CGRA_OP_OPT_EQ_CONST  = `OPT_EQ_CONST,
        CGRA_OP_OPT_EXT       = `OPT_EXT,
        CGRA_OP_OPT_BRH       = `OPT_BRH
    } cgra_opcode_e;

    typedef enum logic [4:0] {
        CMD_LAUNCH                       = 5'd0,
        CMD_CONFIG                       = 5'd3,
        CMD_CONFIG_PROLOGUE_FU           = 5'd4,
        CMD_CONFIG_PROLOGUE_FU_CROSSBAR  = 5'd5,
        CMD_CONFIG_PROLOGUE_ROUTING_XBAR = 5'd6,
        CMD_CONFIG_TOTAL_CTRL_COUNT      = 5'd7,
        CMD_CONFIG_COUNT_PER_ITER        = 5'd8,
        CMD_STORE_REQUEST                = 5'd12,
        CMD_CONST                        = 5'd13
    } cgra_cmd_e;

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
