module Mux__c22975805c9abe20
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  MemAccessPacket_32_3_512__0e5e373c0405ceef in_ [0:31],
  output MemAccessPacket_32_3_512__0e5e373c0405ceef out ,
  input  logic [0:0] reset ,
  input  logic [4:0] sel 
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