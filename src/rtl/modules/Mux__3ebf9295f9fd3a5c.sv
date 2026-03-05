module Mux__3ebf9295f9fd3a5c
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c in_ [0:1],
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c out ,
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