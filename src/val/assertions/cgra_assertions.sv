// ============================================================================
// Name:         cgra_assertions.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-04-12
// Description:  SVA assertion module - bound to CgraTemplateRTL from tb_top.
//      Checks that recv_waddr__rdy and recv_wopt__rdy never carry X/Z
//      outside reset, and covers at least one accepted transfer per tile.
// ============================================================================

`timescale 1ns/1ps

module cgra_assertions (
    input logic clk,
    input logic reset,
    input logic [0:0] recv_waddr__rdy [0:63],
    input logic [0:0] recv_wopt__rdy  [0:63]
);

    genvar i;
    generate
        for (i = 0; i < 64; i++) begin : g_tile_rdy_checks

            // ----------------------------------------------------------------
            // A_WADDR_RDY_X_FREE: recv_waddr__rdy[i] must not carry X/Z
            //   while out of reset.
            // ----------------------------------------------------------------
            property p_waddr_rdy_x_free;
                @(posedge clk) disable iff (reset !== 1'b0)
                    !$isunknown(recv_waddr__rdy[i]);
            endproperty

            A_WADDR_RDY_X_FREE : assert property (p_waddr_rdy_x_free)
                else $error("[SVA] recv_waddr__rdy[%0d] has X/Z at time %0t", i, $time);

            // ----------------------------------------------------------------
            // A_WOPT_RDY_X_FREE: recv_wopt__rdy[i] must not carry X/Z
            //   while out of reset.
            // ----------------------------------------------------------------
            property p_wopt_rdy_x_free;
                @(posedge clk) disable iff (reset !== 1'b0)
                    !$isunknown(recv_wopt__rdy[i]);
            endproperty

            A_WOPT_RDY_X_FREE : assert property (p_wopt_rdy_x_free)
                else $error("[SVA] recv_wopt__rdy[%0d] has X/Z at time %0t", i, $time);

            // ----------------------------------------------------------------
            // Coverage: ready seen high at least once per tile.
            // ----------------------------------------------------------------
            C_WADDR_RDY : cover property (@(posedge clk) recv_waddr__rdy[i]);
            C_WOPT_RDY  : cover property (@(posedge clk) recv_wopt__rdy[i]);

        end
    endgenerate

endmodule : cgra_assertions
