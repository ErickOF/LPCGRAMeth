module BypassQueueDpathRTL__4d91d5ee0229de22
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] mux_sel ,
  input  logic [0:0] raddr ,
  input  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_msg ,
  input  logic [0:0] reset ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_msg ,
  input  logic [0:0] waddr ,
  input  logic [0:0] wen 
);
  //-------------------------------------------------------------
  // Component mux
  //-------------------------------------------------------------

  logic [0:0] mux__clk;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c mux__in_ [0:1];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c mux__out;
  logic [0:0] mux__reset;
  logic [0:0] mux__sel;

  Mux__3ebf9295f9fd3a5c mux
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
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c rf__rdata [0:0];
  logic [0:0] rf__reset;
  logic [0:0] rf__waddr [0:0];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c rf__wdata [0:0];
  logic [0:0] rf__wen [0:0];

  RegisterFile__c97a00dce3981e0a rf
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