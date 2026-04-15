// ============================================================================
// Name:         cgra_tile_cfg.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-04-12
// Description:  Per-tile aggregate configuration object. Holds the target
//      tile index and an ordered array of CGRAConfig_6_4_10_12 control steps
//      that are written sequentially via recv_waddr / recv_wopt.
// ============================================================================

class cgra_tile_cfg;
    logic [5:0] tile_id;  // destination tile index (0-63)

    // Kernel control steps - one write per entry; ctrl_addr = array index
    cgra_ctrl_step_cfg ctrl_steps[];

    // Prologue entries (each set uses sequential ctrl_addr values)
    cgra_ctrl_step_cfg prologue_fu[];       // prologue FU config
    cgra_ctrl_step_cfg prologue_routing[];  // prologue routing crossbar config
    cgra_ctrl_step_cfg prologue_fu_xbar[];  // prologue FU crossbar config

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Initializes per-tile configuration container with defaults.
    // ------------------------------------------------------------------------
    function new();
        tile_id          = 6'd0;
        ctrl_steps       = new[0];
        prologue_fu      = new[0];
        prologue_routing = new[0];
        prologue_fu_xbar = new[0];
    endfunction
endclass : cgra_tile_cfg
