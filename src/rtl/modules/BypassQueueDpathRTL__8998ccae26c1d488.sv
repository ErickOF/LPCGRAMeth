module BypassQueueDpathRTL__8998ccae26c1d488
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] mux_sel ,
  input  logic [0:0] raddr ,
  input  MemAccessPacket_32_3_512__0e5e373c0405ceef recv_msg ,
  input  logic [0:0] reset ,
  output MemAccessPacket_32_3_512__0e5e373c0405ceef send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component mux
  //-------------------------------------------------------------

  logic [0:0] mux__clk;
  MemAccessPacket_32_3_512__0e5e373c0405ceef mux__in_ [0:1];
  MemAccessPacket_32_3_512__0e5e373c0405ceef mux__out;
  logic [0:0] mux__reset;
  logic [0:0] mux__sel;

  Mux__Type_MemAccessPacket_32_3_512__0e5e373c0405ceef__ninputs_2 mux
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
  MemAccessPacket_32_3_512__0e5e373c0405ceef rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  MemAccessPacket_32_3_512__0e5e373c0405ceef rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__9786ab45f2eef562 rf
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