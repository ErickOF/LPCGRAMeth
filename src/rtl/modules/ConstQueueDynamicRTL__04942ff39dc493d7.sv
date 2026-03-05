module ConstQueueDynamicRTL__04942ff39dc493d7
import cgra_pkg::*;
(
  input  logic [0:0] clear ,
  input  logic [0:0] clk ,
  input  logic [0:0] ctrl_proceed ,
  input  logic [0:0] reset ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_const__msg  ,
  output logic [0:0] recv_const__rdy  ,
  input logic [0:0] recv_const__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_const__msg  ,
  input logic [0:0] send_const__rdy  ,
  output logic [0:0] send_const__val  
);
  localparam logic [3:0] __const__const_mem_size_at_load_const  = 4'd8;
  localparam logic [3:0] __const__const_mem_size_at_update_wr_cur  = 4'd8;
  logic [2:0] rd_cur;
  logic [3:0] wr_cur;
  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk;
  logic [2:0] reg_file__raddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_file__rdata [0:0];
  logic [0:0] reg_file__reset;
  logic [2:0] reg_file__waddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_file__wdata [0:0];
  logic [0:0] reg_file__wen [0:0];

  RegisterFile__14fb828f022f9b03 reg_file
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
  logic [0:0] __tmpvar__load_const_not_full;
  logic [0:0] __tmpvar__update_wr_cur_not_full;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueDynamicRTL.py:56
  // @update
  // def load_const():
  //   # Initializes signals.
  //   s.reg_file.waddr[0] @= AddrType()
  //   s.reg_file.wdata[0] @= DataType()
  //   s.reg_file.wen[0] @= 0
  // 
  //   not_full = s.wr_cur < const_mem_size
  //   s.recv_const.rdy @= not_full
  // 
  //   if s.recv_const.val & not_full:
  //     s.reg_file.waddr[0] @= trunc(s.wr_cur, AddrType)
  //     s.reg_file.wdata[0] @= s.recv_const.msg
  //     s.reg_file.wen[0] @= 1
  
  always_comb begin : load_const
    reg_file__waddr[1'd0] = 3'd0;
    reg_file__wdata[1'd0] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    reg_file__wen[1'd0] = 1'd0;
    __tmpvar__load_const_not_full = wr_cur < 4'( __const__const_mem_size_at_load_const );
    recv_const__rdy = __tmpvar__load_const_not_full;
    if ( recv_const__val & __tmpvar__load_const_not_full ) begin
      reg_file__waddr[1'd0] = 3'(wr_cur);
      reg_file__wdata[1'd0] = recv_const__msg;
      reg_file__wen[1'd0] = 1'd1;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueDynamicRTL.py:83
  // @update
  // def update_send_val():
  //   # Checks if read cursor is in front of write cursor.
  //   if (zext(s.rd_cur, WrCurType) < s.wr_cur):
  //     s.send_const.val @= 1
  //   else:
  //     s.send_const.val @= 0
  
  always_comb begin : update_send_val
    if ( { { 1 { 1'b0 } }, rd_cur } < wr_cur ) begin
      send_const__val = 1'd1;
    end
    else
      send_const__val = 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueDynamicRTL.py:92
  // @update_ff
  // def update_rd_cur():
  //   if s.reset | s.clear:
  //     s.rd_cur <<= 0
  //   else:
  //     # Checks whether the "reader" successfully read the data at rd_cur,
  //     # and proceed rd_cur accordingly.
  //     if s.send_const.rdy & s.ctrl_proceed:
  //       if zext((s.rd_cur), WrCurType) < (s.wr_cur - 1):
  //         s.rd_cur <<= s.rd_cur + 1
  //       else:
  //         s.rd_cur <<= 0
  
  always_ff @(posedge clk) begin : update_rd_cur
    if ( reset | clear ) begin
      rd_cur <= 3'd0;
    end
    else if ( send_const__rdy & ctrl_proceed ) begin
      if ( { { 1 { 1'b0 } }, rd_cur } < ( wr_cur - 4'd1 ) ) begin
        rd_cur <= rd_cur + 3'd1;
      end
      else
        rd_cur <= 3'd0;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueDynamicRTL.py:72
  // @update_ff
  // def update_wr_cur():
  //   not_full = (s.wr_cur < const_mem_size)
  //   if s.reset | s.clear:
  //     s.wr_cur <<= 0
  //   # Checks if there's a valid const (from producer) to be written.
  //   else:
  //     if s.recv_const.val & not_full:
  //       s.wr_cur <<= s.wr_cur + 1
  
  always_ff @(posedge clk) begin : update_wr_cur
    __tmpvar__update_wr_cur_not_full = wr_cur < 4'( __const__const_mem_size_at_update_wr_cur );
    if ( reset | clear ) begin
      wr_cur <= 4'd0;
    end
    else if ( recv_const__val & __tmpvar__update_wr_cur_not_full ) begin
      wr_cur <= wr_cur + 4'd1;
    end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;
  assign send_const__msg = reg_file__rdata[0];
  assign reg_file__raddr[0] = rd_cur;

endmodule