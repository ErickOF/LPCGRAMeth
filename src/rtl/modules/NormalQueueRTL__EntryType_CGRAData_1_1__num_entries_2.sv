module NormalQueueRTL__EntryType_CGRAData_1_1__num_entries_2
import cgra_pkg::*;
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] reset,
  input logic [0:0] deq__en,
  output logic [0:0] deq__rdy,
  output CGRAData_1_1 deq__ret,
  input logic [0:0] enq__en,
  input CGRAData_1_1 enq__msg,
  output logic [0:0] enq__rdy
);
  //-------------------------------------------------------------
  // Component ctrl
  //-------------------------------------------------------------

  logic [0:0] ctrl__clk ;
  logic [1:0] ctrl__count ;
  logic [0:0] ctrl__deq_en ;
  logic [0:0] ctrl__deq_rdy ;
  logic [0:0] ctrl__enq_en ;
  logic [0:0] ctrl__enq_rdy ;
  logic [0:0] ctrl__raddr ;
  logic [0:0] ctrl__reset ;
  logic [0:0] ctrl__waddr ;
  logic [0:0] ctrl__wen ;

  NormalQueueCtrlRTL__num_entries_2 ctrl
  (
    .clk( ctrl__clk ),
    .count( ctrl__count ),
    .deq_en( ctrl__deq_en ),
    .deq_rdy( ctrl__deq_rdy ),
    .enq_en( ctrl__enq_en ),
    .enq_rdy( ctrl__enq_rdy ),
    .raddr( ctrl__raddr ),
    .reset( ctrl__reset ),
    .waddr( ctrl__waddr ),
    .wen( ctrl__wen )
  );

  //-------------------------------------------------------------
  // End of component ctrl
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component dpath
  //-------------------------------------------------------------

  logic [0:0] dpath__clk ;
  CGRAData_1_1 dpath__deq_ret ;
  CGRAData_1_1 dpath__enq_msg ;
  logic [0:0] dpath__raddr ;
  logic [0:0] dpath__reset ;
  logic [0:0] dpath__waddr ;
  logic [0:0] dpath__wen ;

  NormalQueueDpathRTL__EntryType_CGRAData_1_1__num_entries_2 dpath
  (
    .clk( dpath__clk ),
    .deq_ret( dpath__deq_ret ),
    .enq_msg( dpath__enq_msg ),
    .raddr( dpath__raddr ),
    .reset( dpath__reset ),
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
  assign ctrl__enq_en = enq__en;
  assign enq__rdy = ctrl__enq_rdy;
  assign ctrl__deq_en = deq__en;
  assign deq__rdy = ctrl__deq_rdy;
  assign count = ctrl__count;
  assign dpath__enq_msg = enq__msg;
  assign deq__ret = dpath__deq_ret;

endmodule