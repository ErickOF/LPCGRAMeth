module OutputUnitRTL__a9946f5ad8907102
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);

  assign send__msg = recv__msg;
  assign recv__rdy = send__rdy;
  assign send__val = recv__val;

endmodule