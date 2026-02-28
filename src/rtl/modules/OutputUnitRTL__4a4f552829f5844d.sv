module OutputUnitRTL__4a4f552829f5844d
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757 recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);

  assign send__msg = recv__msg;
  assign recv__rdy = send__rdy;
  assign send__val = recv__val;

endmodule