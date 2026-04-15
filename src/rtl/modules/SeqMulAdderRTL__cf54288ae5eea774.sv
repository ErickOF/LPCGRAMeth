module SeqMulAdderRTL__cf54288ae5eea774
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] initial_carry_in,
  output logic [0:0] initial_carry_out,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en,
  input CGRAData_32_1_1 from_mem_rdata__msg,
  output logic [0:0] from_mem_rdata__rdy,
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_10_12 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
  output logic [0:0] to_mem_raddr__en,
  output logic [0:0] to_mem_raddr__msg,
  input logic [0:0] to_mem_raddr__rdy,
  output logic [0:0] to_mem_waddr__en,
  output logic [0:0] to_mem_waddr__msg,
  input logic [0:0] to_mem_waddr__rdy,
  output logic [0:0] to_mem_wdata__en,
  output CGRAData_32_1_1 to_mem_wdata__msg,
  input logic [0:0] to_mem_wdata__rdy
);
  localparam CGRAData_32_1_1 const_zero = { 32'd0, 1'd0, 1'd0 };
  localparam logic [5:0] __const__OPT_MUL_ADD = 6'd18;
  localparam logic [5:0] __const__OPT_MUL = 6'd7;
  localparam logic [5:0] __const__OPT_ADD = 6'd2;
  localparam logic [5:0] __const__OPT_MUL_CONST_ADD = 6'd30;
  localparam logic [5:0] __const__OPT_MUL_CONST = 6'd29;
  localparam logic [5:0] __const__OPT_PAS = 6'd31;
  localparam logic [5:0] __const__OPT_MUL_SUB = 6'd19;
  localparam logic [5:0] __const__OPT_SUB = 6'd4;
  //-------------------------------------------------------------
  // Component Fu0
  //-------------------------------------------------------------

  logic [0:0] Fu0__clk ;
  logic [0:0] Fu0__initial_carry_in ;
  logic [0:0] Fu0__initial_carry_out ;
  logic [1:0] Fu0__recv_in_count [0:3] ;
  logic [0:0] Fu0__reset ;
  logic [0:0] Fu0__from_mem_rdata__en ;
  CGRAData_32_1_1 Fu0__from_mem_rdata__msg ;
  logic [0:0] Fu0__from_mem_rdata__rdy ;
  logic [0:0] Fu0__recv_const__en ;
  CGRAData_32_1_1 Fu0__recv_const__msg ;
  logic [0:0] Fu0__recv_const__rdy ;
  logic [0:0] Fu0__recv_in__en [0:3] ;
  CGRAData_32_1_1 Fu0__recv_in__msg [0:3] ;
  logic [0:0] Fu0__recv_in__rdy [0:3] ;
  logic [0:0] Fu0__recv_opt__en ;
  CGRAConfig_6_4_10_12 Fu0__recv_opt__msg ;
  logic [0:0] Fu0__recv_opt__rdy ;
  logic [0:0] Fu0__recv_predicate__en ;
  CGRAData_1_1 Fu0__recv_predicate__msg ;
  logic [0:0] Fu0__recv_predicate__rdy ;
  logic [0:0] Fu0__send_out__en [0:1] ;
  CGRAData_32_1_1 Fu0__send_out__msg [0:1] ;
  logic [0:0] Fu0__send_out__rdy [0:1] ;
  logic [0:0] Fu0__to_mem_raddr__en ;
  logic [0:0] Fu0__to_mem_raddr__msg ;
  logic [0:0] Fu0__to_mem_raddr__rdy ;
  logic [0:0] Fu0__to_mem_waddr__en ;
  logic [0:0] Fu0__to_mem_waddr__msg ;
  logic [0:0] Fu0__to_mem_waddr__rdy ;
  logic [0:0] Fu0__to_mem_wdata__en ;
  CGRAData_32_1_1 Fu0__to_mem_wdata__msg ;
  logic [0:0] Fu0__to_mem_wdata__rdy ;

  MulRTL__cf54288ae5eea774 Fu0
  (
    .clk( Fu0__clk ),
    .initial_carry_in( Fu0__initial_carry_in ),
    .initial_carry_out( Fu0__initial_carry_out ),
    .recv_in_count( Fu0__recv_in_count ),
    .reset( Fu0__reset ),
    .from_mem_rdata__en( Fu0__from_mem_rdata__en ),
    .from_mem_rdata__msg( Fu0__from_mem_rdata__msg ),
    .from_mem_rdata__rdy( Fu0__from_mem_rdata__rdy ),
    .recv_const__en( Fu0__recv_const__en ),
    .recv_const__msg( Fu0__recv_const__msg ),
    .recv_const__rdy( Fu0__recv_const__rdy ),
    .recv_in__en( Fu0__recv_in__en ),
    .recv_in__msg( Fu0__recv_in__msg ),
    .recv_in__rdy( Fu0__recv_in__rdy ),
    .recv_opt__en( Fu0__recv_opt__en ),
    .recv_opt__msg( Fu0__recv_opt__msg ),
    .recv_opt__rdy( Fu0__recv_opt__rdy ),
    .recv_predicate__en( Fu0__recv_predicate__en ),
    .recv_predicate__msg( Fu0__recv_predicate__msg ),
    .recv_predicate__rdy( Fu0__recv_predicate__rdy ),
    .send_out__en( Fu0__send_out__en ),
    .send_out__msg( Fu0__send_out__msg ),
    .send_out__rdy( Fu0__send_out__rdy ),
    .to_mem_raddr__en( Fu0__to_mem_raddr__en ),
    .to_mem_raddr__msg( Fu0__to_mem_raddr__msg ),
    .to_mem_raddr__rdy( Fu0__to_mem_raddr__rdy ),
    .to_mem_waddr__en( Fu0__to_mem_waddr__en ),
    .to_mem_waddr__msg( Fu0__to_mem_waddr__msg ),
    .to_mem_waddr__rdy( Fu0__to_mem_waddr__rdy ),
    .to_mem_wdata__en( Fu0__to_mem_wdata__en ),
    .to_mem_wdata__msg( Fu0__to_mem_wdata__msg ),
    .to_mem_wdata__rdy( Fu0__to_mem_wdata__rdy )
  );

  //-------------------------------------------------------------
  // End of component Fu0
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component Fu1
  //-------------------------------------------------------------

  logic [0:0] Fu1__clk ;
  logic [0:0] Fu1__initial_carry_in ;
  logic [0:0] Fu1__initial_carry_out ;
  logic [1:0] Fu1__recv_in_count [0:3] ;
  logic [0:0] Fu1__reset ;
  logic [0:0] Fu1__from_mem_rdata__en ;
  CGRAData_32_1_1 Fu1__from_mem_rdata__msg ;
  logic [0:0] Fu1__from_mem_rdata__rdy ;
  logic [0:0] Fu1__recv_const__en ;
  CGRAData_32_1_1 Fu1__recv_const__msg ;
  logic [0:0] Fu1__recv_const__rdy ;
  logic [0:0] Fu1__recv_in__en [0:3] ;
  CGRAData_32_1_1 Fu1__recv_in__msg [0:3] ;
  logic [0:0] Fu1__recv_in__rdy [0:3] ;
  logic [0:0] Fu1__recv_opt__en ;
  CGRAConfig_6_4_10_12 Fu1__recv_opt__msg ;
  logic [0:0] Fu1__recv_opt__rdy ;
  logic [0:0] Fu1__recv_predicate__en ;
  CGRAData_1_1 Fu1__recv_predicate__msg ;
  logic [0:0] Fu1__recv_predicate__rdy ;
  logic [0:0] Fu1__send_out__en [0:1] ;
  CGRAData_32_1_1 Fu1__send_out__msg [0:1] ;
  logic [0:0] Fu1__send_out__rdy [0:1] ;
  logic [0:0] Fu1__to_mem_raddr__en ;
  logic [0:0] Fu1__to_mem_raddr__msg ;
  logic [0:0] Fu1__to_mem_raddr__rdy ;
  logic [0:0] Fu1__to_mem_waddr__en ;
  logic [0:0] Fu1__to_mem_waddr__msg ;
  logic [0:0] Fu1__to_mem_waddr__rdy ;
  logic [0:0] Fu1__to_mem_wdata__en ;
  CGRAData_32_1_1 Fu1__to_mem_wdata__msg ;
  logic [0:0] Fu1__to_mem_wdata__rdy ;

  AdderRTL__cf54288ae5eea774 Fu1
  (
    .clk( Fu1__clk ),
    .initial_carry_in( Fu1__initial_carry_in ),
    .initial_carry_out( Fu1__initial_carry_out ),
    .recv_in_count( Fu1__recv_in_count ),
    .reset( Fu1__reset ),
    .from_mem_rdata__en( Fu1__from_mem_rdata__en ),
    .from_mem_rdata__msg( Fu1__from_mem_rdata__msg ),
    .from_mem_rdata__rdy( Fu1__from_mem_rdata__rdy ),
    .recv_const__en( Fu1__recv_const__en ),
    .recv_const__msg( Fu1__recv_const__msg ),
    .recv_const__rdy( Fu1__recv_const__rdy ),
    .recv_in__en( Fu1__recv_in__en ),
    .recv_in__msg( Fu1__recv_in__msg ),
    .recv_in__rdy( Fu1__recv_in__rdy ),
    .recv_opt__en( Fu1__recv_opt__en ),
    .recv_opt__msg( Fu1__recv_opt__msg ),
    .recv_opt__rdy( Fu1__recv_opt__rdy ),
    .recv_predicate__en( Fu1__recv_predicate__en ),
    .recv_predicate__msg( Fu1__recv_predicate__msg ),
    .recv_predicate__rdy( Fu1__recv_predicate__rdy ),
    .send_out__en( Fu1__send_out__en ),
    .send_out__msg( Fu1__send_out__msg ),
    .send_out__rdy( Fu1__send_out__rdy ),
    .to_mem_raddr__en( Fu1__to_mem_raddr__en ),
    .to_mem_raddr__msg( Fu1__to_mem_raddr__msg ),
    .to_mem_raddr__rdy( Fu1__to_mem_raddr__rdy ),
    .to_mem_waddr__en( Fu1__to_mem_waddr__en ),
    .to_mem_waddr__msg( Fu1__to_mem_waddr__msg ),
    .to_mem_waddr__rdy( Fu1__to_mem_waddr__rdy ),
    .to_mem_wdata__en( Fu1__to_mem_wdata__en ),
    .to_mem_wdata__msg( Fu1__to_mem_wdata__msg ),
    .to_mem_wdata__rdy( Fu1__to_mem_wdata__rdy )
  );

  //-------------------------------------------------------------
  // End of component Fu1
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/TwoSeqCombo.py:92
  // @s.update
  // def update_mem():
  //   s.to_mem_waddr.en    = b1( 0 )
  //   s.to_mem_wdata.en    = b1( 0 )
  //   s.to_mem_wdata.msg   = s.const_zero
  //   s.to_mem_waddr.msg   = AddrType( 0 )
  //   s.to_mem_raddr.msg   = AddrType( 0 )
  //   s.to_mem_raddr.en    = b1( 0 )
  //   s.from_mem_rdata.rdy = b1( 0 )
  
  always_comb begin : update_mem
    to_mem_waddr__en = 1'd0;
    to_mem_wdata__en = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 1'd0;
    to_mem_raddr__msg = 1'd0;
    to_mem_raddr__en = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/double/SeqMulAdderRTL.py:30
  // @s.update
  // def update_opt():
  // 
  //   s.Fu0.recv_opt.msg.fu_in[0] = FuInType(1)
  //   s.Fu0.recv_opt.msg.fu_in[1] = FuInType(2)
  //   s.Fu1.recv_opt.msg.fu_in[0] = FuInType(1)
  //   s.Fu1.recv_opt.msg.fu_in[1] = FuInType(2)
  // 
  //   if s.recv_opt.msg.ctrl == OPT_MUL_ADD:
  //     s.Fu0.recv_opt.msg.ctrl = OPT_MUL
  //     s.Fu1.recv_opt.msg.ctrl = OPT_ADD
  //   elif s.recv_opt.msg.ctrl == OPT_MUL_CONST_ADD:
  //     s.Fu0.recv_opt.msg.ctrl = OPT_MUL_CONST
  //     s.Fu1.recv_opt.msg.ctrl = OPT_ADD
  //   elif s.recv_opt.msg.ctrl == OPT_MUL_CONST:
  //     s.Fu0.recv_opt.msg.ctrl = OPT_MUL_CONST
  //     s.Fu1.recv_opt.msg.ctrl = OPT_PAS
  //   elif s.recv_opt.msg.ctrl == OPT_MUL_SUB:
  //     s.Fu0.recv_opt.msg.ctrl = OPT_MUL
  //     s.Fu1.recv_opt.msg.ctrl = OPT_SUB
  
  always_comb begin : update_opt
    Fu0__recv_opt__msg.fu_in[0] = 3'd1;
    Fu0__recv_opt__msg.fu_in[1] = 3'd2;
    Fu1__recv_opt__msg.fu_in[0] = 3'd1;
    Fu1__recv_opt__msg.fu_in[1] = 3'd2;
    if ( recv_opt__msg.ctrl == __const__OPT_MUL_ADD ) begin
      Fu0__recv_opt__msg.ctrl = __const__OPT_MUL;
      Fu1__recv_opt__msg.ctrl = __const__OPT_ADD;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_MUL_CONST_ADD ) begin
      Fu0__recv_opt__msg.ctrl = __const__OPT_MUL_CONST;
      Fu1__recv_opt__msg.ctrl = __const__OPT_ADD;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_MUL_CONST ) begin
      Fu0__recv_opt__msg.ctrl = __const__OPT_MUL_CONST;
      Fu1__recv_opt__msg.ctrl = __const__OPT_PAS;
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_MUL_SUB ) begin
      Fu0__recv_opt__msg.ctrl = __const__OPT_MUL;
      Fu1__recv_opt__msg.ctrl = __const__OPT_SUB;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/TwoSeqCombo.py:60
  //     @s.update
  //     def update_signal():
  //       s.recv_in[0].rdy  = s.send_out[0].rdy
  //       s.recv_in[1].rdy  = s.send_out[0].rdy
  //       s.recv_in[2].rdy  = s.send_out[0].rdy
  //       s.Fu0.recv_opt.en = s.recv_opt.en
  //       s.Fu1.recv_opt.en = s.recv_opt.en
  //       s.recv_opt.rdy    = s.send_out[0].rdy
  // #      s.send_out[0].en  = s.recv_in[0].en and s.recv_in[1].en and\
  // #                          s.recv_in[2].en and s.recv_opt.en
  //       s.send_out[0].en  = s.recv_in[0].en and s.recv_opt.en
  // 
  //       # Note that the predication for a combined FU should be identical/shareable,
  //       # which means the computation in different basic block cannot be combined.
  //       s.Fu0.recv_opt.msg.predicate = s.recv_opt.msg.predicate
  //       s.Fu1.recv_opt.msg.predicate = s.recv_opt.msg.predicate
  // 
  //       s.recv_predicate.rdy     = s.Fu0.recv_predicate.rdy and\
  //                                  s.Fu1.recv_predicate.rdy
  //       s.Fu0.recv_predicate.en  = s.recv_predicate.en
  //       s.Fu1.recv_predicate.en  = s.recv_predicate.en
  // 
  //       # FIXME:should work, though two fields...
  //       s.Fu0.recv_predicate.msg = s.recv_predicate.msg
  //       s.Fu1.recv_predicate.msg = s.recv_predicate.msg
  // 
  //       # Connect count.
  //       s.Fu0.recv_in_count[0] = s.recv_in_count[0]
  //       s.Fu0.recv_in_count[1] = s.recv_in_count[1]
  //       s.Fu1.recv_in_count[0] = s.recv_in_count[0]
  //       s.Fu1.recv_in_count[1] = s.recv_in_count[2]
  
  always_comb begin : update_signal
    recv_in__rdy[0] = send_out__rdy[0];
    recv_in__rdy[1] = send_out__rdy[0];
    recv_in__rdy[2] = send_out__rdy[0];
    Fu0__recv_opt__en = recv_opt__en;
    Fu1__recv_opt__en = recv_opt__en;
    recv_opt__rdy = send_out__rdy[0];
    send_out__en[0] = recv_in__en[0] && recv_opt__en;
    Fu0__recv_opt__msg.predicate = recv_opt__msg.predicate;
    Fu1__recv_opt__msg.predicate = recv_opt__msg.predicate;
    recv_predicate__rdy = Fu0__recv_predicate__rdy && Fu1__recv_predicate__rdy;
    Fu0__recv_predicate__en = recv_predicate__en;
    Fu1__recv_predicate__en = recv_predicate__en;
    Fu0__recv_predicate__msg = recv_predicate__msg;
    Fu1__recv_predicate__msg = recv_predicate__msg;
    Fu0__recv_in_count[0] = recv_in_count[0];
    Fu0__recv_in_count[1] = recv_in_count[1];
    Fu1__recv_in_count[0] = recv_in_count[0];
    Fu1__recv_in_count[1] = recv_in_count[2];
  end

  assign Fu0__clk = clk;
  assign Fu0__reset = reset;
  assign Fu1__clk = clk;
  assign Fu1__reset = reset;
  assign Fu0__recv_in__msg[0] = recv_in__msg[0];
  assign Fu0__recv_in__msg[1] = recv_in__msg[1];
  assign Fu1__recv_in__msg[1] = recv_in__msg[2];
  assign Fu1__recv_in__msg[0] = Fu0__send_out__msg[0];
  assign send_out__msg[0] = Fu1__send_out__msg[0];
  assign Fu0__recv_const__en = recv_const__en;
  assign Fu0__recv_const__msg = recv_const__msg;
  assign recv_const__rdy = Fu0__recv_const__rdy;

endmodule