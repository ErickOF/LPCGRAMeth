module Mux__231db74928a9d294
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c in_ [0:5],
  output ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c out ,
  input  logic [0:0] reset ,
  input  logic [2:0] sel 
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