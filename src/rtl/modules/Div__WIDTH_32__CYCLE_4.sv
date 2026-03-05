module Div__WIDTH_32__CYCLE_4
import cgra_pkg::*;
(
  input logic [1-1:0] clk ,
  input logic [32-1:0] dividend ,
  input logic [32-1:0] divisor ,
  output logic [32-1:0] quotient ,
  output logic [32-1:0] remainder ,
  input logic [1-1:0] reset 
);
  pipeline_division
  #(
    .WIDTH( 32 ),
    .CYCLE( 4 )
  ) v
  (
    .clk( clk ),
    .dividend( dividend ),
    .divisor( divisor ),
    .quotient( quotient ),
    .remainder( remainder ),
    .reset( reset )
  );
endmodule