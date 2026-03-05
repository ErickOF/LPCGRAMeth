module MulRecFN__expWidth_9__sigWidth_23
import cgra_pkg::*;
(
  input logic reset,
  input logic clk,
  input logic [33-1:0] a ,
  input logic [33-1:0] b ,
  input logic [1-1:0] control ,
  output logic [5-1:0] exceptionFlags ,
  output logic [33-1:0] out ,
  input logic [3-1:0] roundingMode 
);
  mulRecFN
  #(
    .expWidth( 9 ),
    .sigWidth( 23 )
  ) v
  (
    .a( a ),
    .b( b ),
    .control( control ),
    .exceptionFlags( exceptionFlags ),
    .out( out ),
    .roundingMode( roundingMode )
  );
endmodule