module Mux__Type_MemAccessPacket_3_32_512__62fa6e6064d885d7__ninputs_2
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  MemAccessPacket_3_32_512__62fa6e6064d885d7 in_ [0:1],
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 out ,
  input  logic [0:0] reset ,
  input  logic [0:0] sel 
);

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arithmetics.py:13
  // @update
  // def up_mux():
  //   s.out @= s.in_[ s.sel ]
  
  always_comb begin : up_mux
    out = in_[sel];
  end

endmodule