// ============================================================================
// File   : dut_dummy.sv
// Brief  : Dummy DUT – single D flip-flop used as a compile/sim placeholder.
//
// TODO CGRA: Replace this module with CgraTemplateRTL and update cgra_if.sv,
//            cgra_tb_top.sv and the driver/monitor to match the real port
//            list.
// ============================================================================
`timescale 1ns/1ps

module dut_dummy (
    input  logic       clk,
    input  logic       reset,
    input  logic [7:0] data_in,
    output logic [7:0] data_out
);
    // Simple registered pass-through
    always_ff @(posedge clk) begin
        if (reset)
            data_out <= '0;
        else
            data_out <= data_in;
    end
endmodule : dut_dummy
