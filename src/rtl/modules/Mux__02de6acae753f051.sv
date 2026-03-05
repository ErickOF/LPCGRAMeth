module Mux__02de6acae753f051
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757 in_ [0:5],
  output ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757 out ,
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