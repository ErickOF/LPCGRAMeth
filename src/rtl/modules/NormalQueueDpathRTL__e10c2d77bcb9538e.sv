module NormalQueueDpathRTL__e10c2d77bcb9538e
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] raddr ,
  input  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_msg ,
  input  logic [0:0] reset ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component rf
  //-------------------------------------------------------------

  logic [0:0] rf__clk;
  logic [0:0] rf__raddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__da749a1852bb59a5 rf
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