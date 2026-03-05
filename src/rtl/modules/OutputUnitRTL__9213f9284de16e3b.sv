module OutputUnitRTL__9213f9284de16e3b
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_3_32_512__62fa6e6064d885d7 recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);

  assign send__msg = recv__msg;
  assign recv__rdy = send__rdy;
  assign send__val = recv__val;

endmodule