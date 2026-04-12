module PhiRTL__cf54288ae5eea774
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
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [5:0] __const__OPT_PHI = 6'd17;
  localparam logic [5:0] __const__OPT_PHI_CONST = 6'd32;
  logic [2:0] __tmpvar__comb_logic_in0 ;
  logic [2:0] __tmpvar__comb_logic_in1 ;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/PhiRTL.py:30
  // @s.update
  // def comb_logic():
  // 
  //   # For pick input register
  //   in0 = FuInType( 0 )
  //   in1 = FuInType( 0 )
  //   for i in range( num_inports ):
  //     s.recv_in[i].rdy = b1( 0 )
  // 
  //   s.recv_predicate.rdy = b1( 0 )
  // 
  //   if s.recv_opt.en:
  //     if s.recv_opt.msg.fu_in[0] != FuInType( 0 ):
  //       in0 = s.recv_opt.msg.fu_in[0] - FuInType( 1 )
  //       s.recv_in[in0].rdy = b1( 1 )
  //     if s.recv_opt.msg.fu_in[1] != FuInType( 0 ):
  //       in1 = s.recv_opt.msg.fu_in[1] - FuInType( 1 )
  //       s.recv_in[in1].rdy = b1( 1 )
  //     if s.recv_opt.msg.predicate == b1( 1 ):
  //       s.recv_predicate.rdy = b1( 1 )
  // 
  //   for j in range( num_outports ):
  //     s.send_out[j].en = s.recv_opt.en
  // 
  //   if s.recv_opt.msg.ctrl == OPT_PHI:
  //     if s.recv_in[in0].msg.predicate == Bits1( 1 ):
  //       s.send_out[0].msg.payload   = s.recv_in[in0].msg.payload
  //       s.send_out[0].msg.predicate = Bits1( 1 )
  //     elif s.recv_in[in1].msg.predicate == Bits1( 1 ):
  //       s.send_out[0].msg.payload   = s.recv_in[in1].msg.payload
  //       s.send_out[0].msg.predicate = Bits1( 1 )
  //     else: # No predecessor is active.
  //       s.send_out[0].msg.payload   = s.recv_in[in0].msg.payload
  //       s.send_out[0].msg.predicate = Bits1( 0 )
  //     if s.recv_opt.en and ( s.recv_in_count[in0] == CountType( 0 ) or\
  //                            s.recv_in_count[in1] == CountType( 0 ) ):
  //       s.recv_in[in0].rdy   = b1( 0 )
  //       s.recv_in[in1].rdy   = b1( 0 )
  //       s.recv_predicate.rdy = b1( 0 )
  //       s.send_out[0].msg.predicate = b1( 0 )
  // 
  //     if s.recv_opt.msg.predicate     == b1( 1 ) and\
  //        s.recv_predicate.msg.payload == b1( 0 ):
  //       s.recv_predicate.rdy = b1( 0 )
  //       s.recv_in[in0].rdy   = b1( 0 )
  //       s.recv_in[in1].rdy   = b1( 0 )
  // 
  //   elif s.recv_opt.msg.ctrl == OPT_PHI_CONST:
  // 
  //     s.send_out[0].msg.predicate = Bits1( 1 )
  //     if s.recv_in[in0].msg.predicate == Bits1( 1 ):
  //       s.send_out[0].msg.payload   = s.recv_in[in0].msg.payload
  //     else:
  //       s.send_out[0].msg.payload   = s.recv_const.msg.payload
  // 
  //     # Predication signal not arrive yet.
  //     if s.recv_opt.msg.predicate     == b1( 1 ) and\
  //        s.recv_predicate.msg.payload == b1( 0 ):
  //       #s.recv_predicate.rdy = b1( 0 )
  //       s.recv_in[in0].rdy   = b1( 0 )
  // 
  //   else:
  //     for j in range( num_outports ):
  //       s.send_out[j].en = b1( 0 )
  // 
  //   if s.recv_opt.msg.predicate == b1( 1 ):
  // 
  //     s.send_out[0].msg.predicate = s.send_out[0].msg.predicate and\
  //                                   s.recv_predicate.msg.predicate
  //     # The PHI_CONST operation executed an the first time does not need predication signal.
  //     if s.recv_opt.msg.ctrl == OPT_PHI_CONST:
  //       if s.recv_predicate.msg.payload == b1( 0 ):
  //         s.send_out[0].msg.predicate = b1( 1 )
  
  always_comb begin : comb_logic
    __tmpvar__comb_logic_in0 = 3'd0;
    __tmpvar__comb_logic_in1 = 3'd0;
    for ( int i = 0; i < __const__num_inports_at_comb_logic; i += 1 )
      recv_in__rdy[i] = 1'd0;
    recv_predicate__rdy = 1'd0;
    if ( recv_opt__en ) begin
      if ( recv_opt__msg.fu_in[0] != 3'd0 ) begin
        __tmpvar__comb_logic_in0 = recv_opt__msg.fu_in[0] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd1;
      end
      if ( recv_opt__msg.fu_in[1] != 3'd0 ) begin
        __tmpvar__comb_logic_in1 = recv_opt__msg.fu_in[1] - 3'd1;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd1;
      end
      if ( recv_opt__msg.predicate == 1'd1 ) begin
        recv_predicate__rdy = 1'd1;
      end
    end
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = recv_opt__en;
    if ( recv_opt__msg.ctrl == __const__OPT_PHI ) begin
      if ( recv_in__msg[__tmpvar__comb_logic_in0].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
        send_out__msg[0].predicate = 1'd1;
      end
      else if ( recv_in__msg[__tmpvar__comb_logic_in1].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in1].payload;
        send_out__msg[0].predicate = 1'd1;
      end
      else begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
        send_out__msg[0].predicate = 1'd0;
      end
      if ( recv_opt__en && ( ( recv_in_count[__tmpvar__comb_logic_in0] == 2'd0 ) || ( recv_in_count[__tmpvar__comb_logic_in1] == 2'd0 ) ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
        recv_predicate__rdy = 1'd0;
        send_out__msg[0].predicate = 1'd0;
      end
      if ( ( recv_opt__msg.predicate == 1'd1 ) && ( recv_predicate__msg.payload == 1'd0 ) ) begin
        recv_predicate__rdy = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
        recv_in__rdy[__tmpvar__comb_logic_in1] = 1'd0;
      end
    end
    else if ( recv_opt__msg.ctrl == __const__OPT_PHI_CONST ) begin
      send_out__msg[0].predicate = 1'd1;
      if ( recv_in__msg[__tmpvar__comb_logic_in0].predicate == 1'd1 ) begin
        send_out__msg[0].payload = recv_in__msg[__tmpvar__comb_logic_in0].payload;
      end
      else
        send_out__msg[0].payload = recv_const__msg.payload;
      if ( ( recv_opt__msg.predicate == 1'd1 ) && ( recv_predicate__msg.payload == 1'd0 ) ) begin
        recv_in__rdy[__tmpvar__comb_logic_in0] = 1'd0;
      end
    end
    else
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
        send_out__en[j] = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_out__msg[0].predicate = send_out__msg[0].predicate && recv_predicate__msg.predicate;
      if ( recv_opt__msg.ctrl == __const__OPT_PHI_CONST ) begin
        if ( recv_predicate__msg.payload == 1'd0 ) begin
          send_out__msg[0].predicate = 1'd1;
        end
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:49
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
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:43
  // @s.update
  // def update_signal():
  //   for j in range( num_outports ):
  //     s.recv_const.rdy = s.send_out[j].rdy or s.recv_const.rdy
  //     s.recv_opt.rdy = s.send_out[j].rdy or s.recv_opt.rdy
  
  always_comb begin : update_signal
    for ( int j = 0; j < __const__num_outports_at_update_signal; j += 1 ) begin
      recv_const__rdy = send_out__rdy[j] || recv_const__rdy;
      recv_opt__rdy = send_out__rdy[j] || recv_opt__rdy;
    end
  end

endmodule