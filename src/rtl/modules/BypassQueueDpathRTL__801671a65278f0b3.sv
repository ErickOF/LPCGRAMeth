module BypassQueueDpathRTL__801671a65278f0b3
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] mux_sel ,
  input  logic [0:0] raddr ,
  input  MemAccessPacket_3_32_512__62fa6e6064d885d7 recv_msg ,
  input  logic [0:0] reset ,
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component mux
  //-------------------------------------------------------------

  logic [0:0] mux__clk;
  MemAccessPacket_3_32_512__62fa6e6064d885d7 mux__in_ [0:1];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 mux__out;
  logic [0:0] mux__reset;
  logic [0:0] mux__sel;

  Mux__Type_MemAccessPacket_3_32_512__62fa6e6064d885d7__ninputs_2 mux
  (
    .clk( mux__clk ),
    .in_( mux__in_ ),
    .out( mux__out ),
    .reset( mux__reset ),
    .sel( mux__sel )
  );

  //-------------------------------------------------------------
  // End of component mux
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component rf
  //-------------------------------------------------------------

  logic [0:0] rf__clk;
  logic [0:0] rf__raddr [0:0];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__0addb5da4a055f50 rf
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
  assign rf__wen[0] = wen;
  assign rf__waddr[0] = waddr;
  assign rf__wdata[0] = recv_msg;
  assign mux__clk = clk;
  assign mux__reset = reset;
  assign mux__sel = mux_sel;
  assign mux__in_[0] = rf__rdata[0];
  assign mux__in_[1] = recv_msg;
  assign send_msg = mux__out;

endmodule