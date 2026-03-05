module Mux__ab8b1dcf5a16f461
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d in_ [0:1],
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d out ,
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