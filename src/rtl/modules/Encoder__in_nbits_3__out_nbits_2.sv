module Encoder__in_nbits_3__out_nbits_2
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [2:0] in_ ,
  output logic [1:0] out ,
  input  logic [0:0] reset 
);

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/encoders.py:28
  // @update
  // def encode():
  //   s.out @= 0
  //   for i in range( s.in_nbits ):
  //     if s.in_[i]:
  //       s.out @= i
  
  always_comb begin : encode
    out = 2'd0;
    for ( int unsigned i = 1'd0; i < 2'd3; i += 1'd1 )
      if ( in_[2'(i)] ) begin
        out = 2'(i);
      end
  end

endmodule