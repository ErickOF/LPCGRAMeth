module NormalQueueDpathRTL__EntryType_CGRAData_1_1__num_entries_2
import cgra_pkg::*;
(
  input logic [0:0] clk,
  output CGRAData_1_1 deq_ret,
  input CGRAData_1_1 enq_msg,
  input logic [0:0] raddr,
  input logic [0:0] reset,
  input logic [0:0] waddr,
  input logic [0:0] wen
);
  //-------------------------------------------------------------
  // Component queue
  //-------------------------------------------------------------

  logic [0:0] queue__clk ;
  logic [0:0] queue__raddr [0:0] ;
  CGRAData_1_1 queue__rdata [0:0] ;
  logic [0:0] queue__reset ;
  logic [0:0] queue__waddr [0:0] ;
  CGRAData_1_1 queue__wdata [0:0] ;
  logic [0:0] queue__wen [0:0] ;

  RegisterFile__b2651f5e70154f41 queue
  (
    .clk( queue__clk ),
    .raddr( queue__raddr ),
    .rdata( queue__rdata ),
    .reset( queue__reset ),
    .waddr( queue__waddr ),
    .wdata( queue__wdata ),
    .wen( queue__wen )
  );

  //-------------------------------------------------------------
  // End of component queue
  //-------------------------------------------------------------

  assign queue__clk = clk;
  assign queue__reset = reset;
  assign queue__raddr[0] = raddr;
  assign deq_ret = queue__rdata[0];
  assign queue__wen[0] = wen;
  assign queue__waddr[0] = waddr;
  assign queue__wdata[0] = enq_msg;

endmodule