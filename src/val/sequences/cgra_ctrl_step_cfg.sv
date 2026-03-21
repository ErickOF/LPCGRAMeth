// ============================================================================
// Name:         cgra_ctrl_step_cfg.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-03-21
// Description:  Data container for one CGRAConfig control word used by
//      CMD_CONFIG and all CMD_CONFIG_PROLOGUE_* commands. Fields mirror
//      CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f. The data_payload /
//      data_predicate fields are populated for prologue commands that also
//      carry a data word.
// ============================================================================

class cgra_ctrl_step_cfg;

    // ---- ctrl-word fields -----------------------------------------------
    logic [6:0]       operation;             // FU operation code
    logic [3:0][2:0]  fu_in;                // FU input selectors   [3:0][2:0]
    logic [11:0][3:0] routing_xbar_outport;  // routing xbar outputs [11:0][3:0]
    logic [11:0][1:0] fu_xbar_outport;       // FU xbar outputs      [11:0][1:0]
    logic [2:0]       vector_factor_power;   // SIMD vector factor
    logic [0:0]       is_last_ctrl;          // marks last ctrl step in loop
    logic [3:0][1:0]  write_reg_from;        // reg-file write source
    logic [3:0][3:0]  write_reg_idx;         // reg-file write index
    logic [3:0][0:0]  read_reg_from;         // reg-file read source
    logic [3:0][3:0]  read_reg_idx;          // reg-file read index

    // ---- data-word fields (prologue commands only) ----------------------
    logic [31:0]      data_payload;          // data.payload
    logic [0:0]       data_predicate;        // data.predicate

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Initializes all control/data fields to safe default values
    //      for an inactive (NAH) control step.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    function new();
        operation            = 7'd1;         // OPT_NAH (no-operation)
        fu_in                = '{default: 3'd0};
        routing_xbar_outport = '{default: 4'd0};
        fu_xbar_outport      = '{default: 2'd0};
        vector_factor_power  = 3'd0;
        is_last_ctrl         = 1'b0;
        write_reg_from       = '{default: 2'd0};
        write_reg_idx        = '{default: 4'd0};
        read_reg_from        = '{default: 1'd0};
        read_reg_idx         = '{default: 4'd0};
        data_payload         = 32'd0;
        data_predicate       = 1'b0;
    endfunction
endclass : cgra_ctrl_step_cfg
