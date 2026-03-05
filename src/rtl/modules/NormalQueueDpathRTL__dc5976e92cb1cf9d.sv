module NormalQueueDpathRTL__dc5976e92cb1cf9d
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] raddr ,
  input  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_msg ,
  input  logic [0:0] reset ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component rf
  //-------------------------------------------------------------

  logic [0:0] rf__clk;
  logic [0:0] rf__raddr [0:0];
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__88cee4889c541961 rf
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