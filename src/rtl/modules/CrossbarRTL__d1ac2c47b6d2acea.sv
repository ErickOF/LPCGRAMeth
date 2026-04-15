module CrossbarRTL__d1ac2c47b6d2acea
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv_data__en [0:9],
  input CGRAData_32_1_1 recv_data__msg [0:9],
  output logic [0:0] recv_data__rdy [0:9],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_10_12 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  output logic [0:0] send_data__en [0:11],
  output CGRAData_32_1_1 send_data__msg [0:11],
  input logic [0:0] send_data__rdy [0:11],
  output logic [0:0] send_predicate__en,
  output CGRAData_1_1 send_predicate__msg,
  input logic [0:0] send_predicate__rdy
);
  localparam logic [31:0] bypass_point = 32'd4;
  localparam logic [5:0] __const__OPT_START = 6'd0;
  localparam logic [31:0] __const__num_inports_at_update_signal = 32'd10;
  localparam logic [31:0] __const__num_outports_at_update_signal = 32'd12;
  logic [0:0] __tmpvar__update_signal_out_rdy ;
  logic [3:0] __tmpvar__update_signal_in_dir ;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:34
  //     @s.update
  //     def update_signal():
  //       out_rdy = b1( 0 )
  //       s.send_predicate.en = b1( 0 )
  //       # predicate_out_rdy = b1( 0 )
  //       # For predication register update. 'predicate' and 'predicate_in' no need
  //       # to be active at the same time. Specifically, the 'predicate' is for
  //       # the operation at the current cycle while the 'predicate_in' accumulates
  //       # the predicate and pushes into the predicate register that will be used
  //       # in the future.
  //       if s.recv_opt.msg.predicate == b1( 1 ):
  //         # s.send_predicate.msg.payload = b1( 0 )
  //         # s.send_predicate.msg.predicate = b1( 0 )
  //         s.send_predicate.msg = PredicateType( b1(0), b1(0) )
  //       if s.recv_opt.msg.ctrl != OPT_START:
  //         for i in range( num_inports ):
  //           # Set predicate once the recv_data is stable (i.e., en == true).
  //           if s.recv_opt.msg.predicate_in[i] == b1( 1 ) and s.recv_data[i].en == b1( 1 ):
  //             s.send_predicate.en = b1( 1 )
  //             s.send_predicate.msg.payload = b1( 1 )
  //             s.send_predicate.msg.predicate = s.send_predicate.msg.predicate | s.recv_data[i].msg.predicate
  //             # predicate_out_rdy = b1( 1 )
  //         for i in range( num_outports ):
  //           in_dir  = s.recv_opt.msg.outport[i]
  //           out_rdy = out_rdy | s.send_data[i].rdy
  // #          s.send_data[i].msg.bypass = b1( 0 ) 
  //           if in_dir > OutType( 0 ) and s.send_data[i].rdy:
  //             in_dir = in_dir - OutType( 1 )
  //             s.recv_data[in_dir].rdy = s.send_data[i].rdy
  //             s.send_data[i].en       = s.recv_data[in_dir].en
  //             if s.send_data[i].en and s.recv_data[in_dir].rdy:
  //               s.send_data[i].msg.payload   = s.recv_data[in_dir].msg.payload
  //               s.send_data[i].msg.predicate = s.recv_data[in_dir].msg.predicate
  // #              s.send_data[i].msg = s.recv_data[in_dir].msg
  //               s.send_data[i].msg.bypass    = s.recv_data[in_dir].msg.bypass
  //             # The generate one can be send to other tile without buffering,
  //             # but buffering is still needed when 'other tile' is yourself
  //             # (i.e., generating output to self input). Here we avoid self 
  //             # connecting by checking whether the inport belongs to FU and
  //             # outport be towards to remote tiles to eliminate combinational
  //             # loop.
  //             if in_dir >= OutType( s.bypass_point ) and i<s.bypass_point:
  //               s.send_data[i].msg.bypass = b1( 1 ) 
  // #              print("in crossbar ", s, " set bypass ... s.recv_opt.msg.outport[", i, "]: ", s.recv_opt.msg.outport[i])
  //             else:
  //               s.send_data[i].msg.bypass = b1( 0 ) 
  // #            print("in crossbar if... s.send_data[", i, "].msg: ", s.send_data[i].msg, "; recv.rdy: ", s.recv_data[in_dir].rdy)
  //           else:
  //             s.send_data[i].en  = b1( 0 )
  //             #s.send_data[i].msg = b1( 0 )
  // #            print("in crossbar else... s.send_data[", i, "].msg: ", s.send_data[i].msg)
  // 
  //       else:
  //         for i in range( num_outports ):
  // #          s.send_data[i].msg.bypass = b1( 0 ) 
  //           s.send_data[i].en = b1( 0 )
  //       s.recv_opt.rdy = out_rdy# and predicate_out_rdy
  
  always_comb begin : update_signal
    __tmpvar__update_signal_out_rdy = 1'd0;
    send_predicate__en = 1'd0;
    if ( recv_opt__msg.predicate == 1'd1 ) begin
      send_predicate__msg = { 1'd0, 1'd0 };
    end
    if ( recv_opt__msg.ctrl != __const__OPT_START ) begin
      for ( int i = 0; i < __const__num_inports_at_update_signal; i += 1 )
        if ( ( recv_opt__msg.predicate_in[i] == 1'd1 ) && ( recv_data__en[i] == 1'd1 ) ) begin
          send_predicate__en = 1'd1;
          send_predicate__msg.payload = 1'd1;
          send_predicate__msg.predicate = send_predicate__msg.predicate | recv_data__msg[i].predicate;
        end
      for ( int i = 0; i < __const__num_outports_at_update_signal; i += 1 ) begin
        __tmpvar__update_signal_in_dir = recv_opt__msg.outport[i];
        __tmpvar__update_signal_out_rdy = __tmpvar__update_signal_out_rdy | send_data__rdy[i];
        if ( ( __tmpvar__update_signal_in_dir > 4'd0 ) && send_data__rdy[i] ) begin
          __tmpvar__update_signal_in_dir = __tmpvar__update_signal_in_dir - 4'd1;
          recv_data__rdy[__tmpvar__update_signal_in_dir] = send_data__rdy[i];
          send_data__en[i] = recv_data__en[__tmpvar__update_signal_in_dir];
          if ( send_data__en[i] && recv_data__rdy[__tmpvar__update_signal_in_dir] ) begin
            send_data__msg[i].payload = recv_data__msg[__tmpvar__update_signal_in_dir].payload;
            send_data__msg[i].predicate = recv_data__msg[__tmpvar__update_signal_in_dir].predicate;
            send_data__msg[i].bypass = recv_data__msg[__tmpvar__update_signal_in_dir].bypass;
          end
          if ( ( __tmpvar__update_signal_in_dir >= 4'( bypass_point ) ) && ( i < bypass_point ) ) begin
            send_data__msg[i].bypass = 1'd1;
          end
          else
            send_data__msg[i].bypass = 1'd0;
        end
        else
          send_data__en[i] = 1'd0;
      end
    end
    else
      for ( int i = 0; i < __const__num_outports_at_update_signal; i += 1 )
        send_data__en[i] = 1'd0;
    recv_opt__rdy = __tmpvar__update_signal_out_rdy;
  end

endmodule