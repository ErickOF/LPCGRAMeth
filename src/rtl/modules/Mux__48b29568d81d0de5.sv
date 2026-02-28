module Mux__48b29568d81d0de5
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff in_ [0:1],
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff out ,
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