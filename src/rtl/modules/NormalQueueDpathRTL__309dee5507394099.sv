module NormalQueueDpathRTL__309dee5507394099
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] raddr ,
  input  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv_msg ,
  input  logic [0:0] reset ,
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component rf
  //-------------------------------------------------------------

  logic [0:0] rf__clk;
  logic [0:0] rf__raddr [0:0];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__d02ace6a21999072 rf
  (
    .clk( rf__clk ),
    .raddr( rf__raddr ),
    .rdata( rf__rdata ),
    .reset( rf__reset ),
    .waddr( rf__waddr ),
    .wdata( rf__wdata ),
    .wen( rf__wen )
  );

  //-------------------------------------------------------------
  // End of component rf
  //-------------------------------------------------------------

  assign rf__clk = clk;
  assign rf__reset = reset;
  assign rf__raddr[0] = raddr;
  assign send_msg = rf__rdata[0];
  assign rf__wen[0] = wen;
  assign rf__waddr[0] = waddr;
  assign rf__wdata[0] = recv_msg;

endmodule