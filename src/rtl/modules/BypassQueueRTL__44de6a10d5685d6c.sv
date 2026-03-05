module BypassQueueRTL__44de6a10d5685d6c
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  output logic [1:0] count ,
  input  logic [0:0] reset ,
  input MemAccessPacket_4_3_512__8e5c7af30d36e757 recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_4_3_512__8e5c7af30d36e757 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  //-------------------------------------------------------------
  // Component ctrl
  //-------------------------------------------------------------

  logic [0:0] ctrl__clk;
  logic [1:0] ctrl__count;
  logic [0:0] ctrl__mux_sel;
  logic [0:0] ctrl__raddr;
  logic [0:0] ctrl__recv_rdy;
  logic [0:0] ctrl__recv_val;
  logic [0:0] ctrl__reset;
  logic [0:0] ctrl__send_rdy;
  logic [0:0] ctrl__send_val;
  logic [0:0] ctrl__waddr;
  logic [0:0] ctrl__wen;

  BypassQueueCtrlRTL__num_entries_2 ctrl
  (
    .clk( ctrl__clk ),
    .count( ctrl__count ),
    .mux_sel( ctrl__mux_sel ),
    .raddr( ctrl__raddr ),
    .recv_rdy( ctrl__recv_rdy ),
    .recv_val( ctrl__recv_val ),
    .reset( ctrl__reset ),
    .send_rdy( ctrl__send_rdy ),
    .send_val( ctrl__send_val ),
    .waddr( ctrl__waddr ),
    .wen( ctrl__wen )
  );

  //-------------------------------------------------------------
  // End of component ctrl
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component dpath
  //-------------------------------------------------------------

  logic [0:0] dpath__clk;
  logic [0:0] dpath__mux_sel;
  logic [0:0] dpath__raddr;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 dpath__recv_msg;
  logic [0:0] dpath__reset;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 dpath__send_msg;
  logic [0:0] dpath__waddr;
  logic [0:0] dpath__wen;

  BypassQueueDpathRTL__44de6a10d5685d6c dpath
  (
    .clk( dpath__clk ),
    .mux_sel( dpath__mux_sel ),
    .raddr( dpath__raddr ),
    .recv_msg( dpath__recv_msg ),
    .reset( dpath__reset ),
    .send_msg( dpath__send_msg ),
    .waddr( dpath__waddr ),
    .wen( dpath__wen )
  );

  //-------------------------------------------------------------
  // End of component dpath
  //-------------------------------------------------------------

  assign ctrl__clk = clk;
  assign ctrl__reset = reset;
  assign dpath__clk = clk;
  assign dpath__reset = reset;
  assign dpath__wen = ctrl__wen;
  assign dpath__waddr = ctrl__waddr;
  assign dpath__raddr = ctrl__raddr;
  assign dpath__mux_sel = ctrl__mux_sel;
  assign ctrl__recv_val = recv__val;
  assign recv__rdy = ctrl__recv_rdy;
  assign send__val = ctrl__send_val;
  assign ctrl__send_rdy = send__rdy;
  assign count = ctrl__count;
  assign dpath__recv_msg = recv__msg;
  assign send__msg = dpath__send_msg;

endmodule