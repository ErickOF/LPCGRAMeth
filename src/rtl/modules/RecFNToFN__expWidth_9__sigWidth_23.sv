module RecFNToFN__expWidth_9__sigWidth_23
import cgra_pkg::*;
(
  input logic reset,
  input logic clk,
  input logic [33-1:0] in_ ,
  output logic [32-1:0] out 
);
  recFNToFN
  #(
    .expWidth( 9 ),
    .sigWidth( 23 )
  ) v
  (
    .in_( in_ ),
    .out( out )
  );
endmodule