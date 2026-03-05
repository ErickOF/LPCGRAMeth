module OutputUnitRTL__6406738047a14a77
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_32_3_512__0e5e373c0405ceef recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_32_3_512__0e5e373c0405ceef send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);

  assign send__msg = recv__msg;
  assign recv__rdy = send__rdy;
  assign send__val = recv__val;

endmodule