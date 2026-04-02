// ============================================================================
// Name:         cgra_tile_cfg.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-03-21
// Description:  Per-tile aggregate configuration object containing const,
//      loop, main control, and prologue control descriptors.
// ============================================================================

class cgra_tile_cfg;
    logic [8:0]  tile_id;           // destination tile ID (0 - 255)
    logic [31:0] const_val;         // CMD_CONST : constant register value
    logic [31:0] count_per_iter;    // CMD_CONFIG_COUNT_PER_ITER
    logic [31:0] total_ctrl_count;  // CMD_CONFIG_TOTAL_CTRL_COUNT

    // Kernel control steps - one CMD_CONFIG per entry (ctrl_addr = index)
    cgra_ctrl_step_cfg ctrl_steps[];

    // Prologue entries (each set uses sequential ctrl_addr values)
    cgra_ctrl_step_cfg prologue_fu[];       // CMD_CONFIG_PROLOGUE_FU
    cgra_ctrl_step_cfg prologue_routing[];  // CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR
    cgra_ctrl_step_cfg prologue_fu_xbar[];  // CMD_CONFIG_PROLOGUE_FU_CROSSBAR

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Initializes per-tile configuration container fields with
    //      default values and empty step arrays.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    function new();
        tile_id          = 9'd0;
        const_val        = 32'd0;
        count_per_iter   = 32'd1;
        total_ctrl_count = 32'd1;
        ctrl_steps       = new[0];
        prologue_fu      = new[0];
        prologue_routing = new[0];
        prologue_fu_xbar = new[0];
    endfunction
endclass : cgra_tile_cfg
