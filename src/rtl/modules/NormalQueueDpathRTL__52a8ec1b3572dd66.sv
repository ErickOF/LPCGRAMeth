module NormalQueueDpathRTL__52a8ec1b3572dd66
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [3:0] raddr ,
  input  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_msg ,
  input  logic [0:0] reset ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_msg ,
  input  logic [3:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component rf
  //-------------------------------------------------------------

  logic [0:0] rf__clk;
  logic [3:0] rf__raddr [0:0];
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [3:0] rf__waddr [0:0];
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__e0c26c9518ccc1c5 rf
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