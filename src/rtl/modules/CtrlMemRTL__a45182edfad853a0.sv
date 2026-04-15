module CtrlMemRTL__a45182edfad853a0
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv_ctrl__en,
  input CGRAConfig_6_4_10_12 recv_ctrl__msg,
  output logic [0:0] recv_ctrl__rdy,
  input logic [0:0] recv_waddr__en,
  input logic [2:0] recv_waddr__msg,
  output logic [0:0] recv_waddr__rdy,
  output logic [0:0] send_ctrl__en,
  output CGRAConfig_6_4_10_12 send_ctrl__msg,
  input logic [0:0] send_ctrl__rdy
);
  localparam logic [31:0] __const__num_ctrl_at_update_signal = 32'd6;
  localparam logic [5:0] __const__OPT_START = 6'd0;
  localparam logic [31:0] __const__num_ctrl_at_update_raddr = 32'd6;
  localparam logic [2:0] __const__last_item_at_update_raddr = 3'd7;
  logic [2:0] times ;
  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk ;
  logic [2:0] reg_file__raddr [0:0] ;
  CGRAConfig_6_4_10_12 reg_file__rdata [0:0] ;
  logic [0:0] reg_file__reset ;
  logic [2:0] reg_file__waddr [0:0] ;
  CGRAConfig_6_4_10_12 reg_file__wdata [0:0] ;
  logic [0:0] reg_file__wen [0:0] ;

  RegisterFile__4c93ecd593d406ca reg_file
  (
    .clk( reg_file__clk ),
    .raddr( reg_file__raddr ),
    .rdata( reg_file__rdata ),
    .reset( reg_file__reset ),
    .waddr( reg_file__waddr ),
    .wdata( reg_file__wdata ),
    .wen( reg_file__wen )
  );

  //-------------------------------------------------------------
  // End of component reg_file
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemRTL.py:42
  // @s.update
  // def update_signal():
  //   if s.times == TimeType( num_ctrl ) or s.reg_file.rdata[0].ctrl == OPT_START:
  //     s.send_ctrl.en = b1( 0 )
  //   else:
  //     s.send_ctrl.en  = s.send_ctrl.rdy # s.recv_raddr[i].rdy
  //   s.recv_waddr.rdy = b1( 1 )
  //   s.recv_ctrl.rdy = b1( 1 )
  
  always_comb begin : update_signal
    if ( ( times == 3'd6 ) || ( reg_file__rdata[0].ctrl == __const__OPT_START ) ) begin
      send_ctrl__en = 1'd0;
    end
    else
      send_ctrl__en = send_ctrl__rdy;
    recv_waddr__rdy = 1'd1;
    recv_ctrl__rdy = 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemRTL.py:51
  // @s.update_ff
  // def update_raddr():
  //   if s.reg_file.rdata[0].ctrl != OPT_START:
  //     if s.times < TimeType( num_ctrl ):
  //       s.times <<= s.times + TimeType( 1 )
  //     if s.reg_file.raddr[0] < last_item:
  //       s.reg_file.raddr[0] <<= s.reg_file.raddr[0] + AddrType( 1 )
  //     else:
  //       s.reg_file.raddr[0] <<= AddrType( 0 )
  
  always_ff @(posedge clk) begin : update_raddr
    if ( reg_file__rdata[0].ctrl != __const__OPT_START ) begin
      if ( times < 3'd6 ) begin
        times <= times + 3'd1;
      end
      if ( reg_file__raddr[0] < __const__last_item_at_update_raddr ) begin
        reg_file__raddr[0] <= reg_file__raddr[0] + 3'd1;
      end
      else
        reg_file__raddr[0] <= 3'd0;
    end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;
  assign send_ctrl__msg = reg_file__rdata[0];
  assign reg_file__waddr[0] = recv_waddr__msg;
  assign reg_file__wdata[0] = recv_ctrl__msg;
  assign reg_file__wen[0] = recv_waddr__en;

endmodule