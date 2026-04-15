// ============================================================================
// Name:         cgra_ctrl_step_cfg.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-04-12
// Description:  Data container for one CGRAConfig_6_4_10_12 control word.
//      Fields directly mirror the RTL typedef:
//        ctrl[5:0], predicate[0:0], fu_in[3:0][2:0],
//        outport[11:0][3:0], predicate_in[9:0][0:0].
// ============================================================================

class cgra_ctrl_step_cfg;
    logic [5:0]        ctrl;          // 6-bit FU/routing control opcode
    logic [0:0]        predicate;     // predicate enable for this step
    logic [3:0][2:0]   fu_in;         // FU input selectors [3:0][2:0]
    logic [11:0][3:0]  outport;       // output port selectors [11:0][3:0]
    logic [9:0][0:0]   predicate_in;  // predicate-input selectors [9:0][0:0]

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Initializes all fields to safe zero defaults.
    // ------------------------------------------------------------------------
    function new();
        ctrl         = 6'd0;
        predicate    = 1'b0;
        fu_in        = '{default: 3'd0};
        outport      = '{default: 4'd0};
        predicate_in = '{default: 1'b0};
    endfunction

    // ------------------------------------------------------------------------
    // Function: to_cfg_word
    //
    // Description: Packs all fields into a CGRAConfig_6_4_10_12 struct.
    // ------------------------------------------------------------------------
    function CGRAConfig_6_4_10_12 to_cfg_word();
        CGRAConfig_6_4_10_12 w;
        w.ctrl         = ctrl;
        w.predicate    = predicate;
        w.fu_in        = fu_in;
        w.outport      = outport;
        w.predicate_in = predicate_in;
        return w;
    endfunction
endclass : cgra_ctrl_step_cfg
