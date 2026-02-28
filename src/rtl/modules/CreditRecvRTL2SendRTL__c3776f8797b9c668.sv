module CreditRecvRTL2SendRTL__c3776f8797b9c668
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input logic [0:0] recv__en  ,
  input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv__msg  ,
  output logic [0:0] recv__yum [0:1] ,
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [1:0] __const__vc_at_up_enq  = 2'd2;
  localparam logic [1:0] __const__vc_at_up_deq_and_send  = 2'd2;
  localparam logic [1:0] __const__vc_at_up_yummy  = 2'd2;
  //-------------------------------------------------------------
  // Component arbiter
  //-------------------------------------------------------------

  logic [0:0] arbiter__clk;
  logic [0:0] arbiter__en;
  logic [1:0] arbiter__grants;
  logic [1:0] arbiter__reqs;
  logic [0:0] arbiter__reset;

  RoundRobinArbiterEn__nreqs_2 arbiter
  (
    .clk( arbiter__clk ),
    .en( arbiter__en ),
    .grants( arbiter__grants ),
    .reqs( arbiter__reqs ),
    .reset( arbiter__reset )
  );

  //-------------------------------------------------------------
  // End of component arbiter
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component buffers[0:1]
  //-------------------------------------------------------------

  logic [0:0] buffers__clk [0:1];
  logic [1:0] buffers__count [0:1];
  logic [0:0] buffers__reset [0:1];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d buffers__recv__msg [0:1];
  logic [0:0] buffers__recv__rdy [0:1];
  logic [0:0] buffers__recv__val [0:1];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d buffers__send__msg [0:1];
  logic [0:0] buffers__send__rdy [0:1];
  logic [0:0] buffers__send__val [0:1];

  BypassQueueRTL__309dee5507394099 buffers__0
  (
    .clk( buffers__clk[0] ),
    .count( buffers__count[0] ),
    .reset( buffers__reset[0] ),
    .recv__msg( buffers__recv__msg[0] ),
    .recv__rdy( buffers__recv__rdy[0] ),
    .recv__val( buffers__recv__val[0] ),
    .send__msg( buffers__send__msg[0] ),
    .send__rdy( buffers__send__rdy[0] ),
    .send__val( buffers__send__val[0] )
  );

  BypassQueueRTL__309dee5507394099 buffers__1
  (
    .clk( buffers__clk[1] ),
    .count( buffers__count[1] ),
    .reset( buffers__reset[1] ),
    .recv__msg( buffers__recv__msg[1] ),
    .recv__rdy( buffers__recv__rdy[1] ),
    .recv__val( buffers__recv__val[1] ),
    .send__msg( buffers__send__msg[1] ),
    .send__rdy( buffers__send__rdy[1] ),
    .send__val( buffers__send__val[1] )
  );

  //-------------------------------------------------------------
  // End of component buffers[0:1]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component encoder
  //-------------------------------------------------------------

  logic [0:0] encoder__clk;
  logic [1:0] encoder__in_;
  logic [0:0] encoder__out;
  logic [0:0] encoder__reset;

  Encoder__in_nbits_2__out_nbits_1 encoder
  (
    .clk( encoder__clk ),
    .in_( encoder__in_ ),
    .out( encoder__out ),
    .reset( encoder__reset )
  );

  //-------------------------------------------------------------
  // End of component encoder
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/ifcs/CreditIfc.py:205
  // @update
  // def up_deq_and_send():
  //   for i in range( vc ):
  //     s.buffers[i].send.rdy @= 0
  // 
  //   s.send.msg @= s.buffers[ s.encoder.out ].send.msg
  // 
  //   if s.arbiter.grants > 0:
  //     s.send.val @= 1
  //     s.buffers[ s.encoder.out ].send.rdy @= s.send.rdy
  //   else:
  //     s.send.val @= 0
  
  always_comb begin : up_deq_and_send
    for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_deq_and_send ); i += 1'd1 )
      buffers__send__rdy[1'(i)] = 1'd0;
    send__msg = buffers__send__msg[encoder__out];
    if ( arbiter__grants > 2'd0 ) begin
      send__val = 1'd1;
      buffers__send__rdy[encoder__out] = send__rdy;
    end
    else
      send__val = 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/ifcs/CreditIfc.py:194
  // @update
  // def up_enq():
  //   if s.recv.en:
  //     for i in range( vc ):
  //       s.buffers[i].recv.val @= ( s.recv.msg.vc_id == i )
  //   else:
  //     for i in range( vc ):
  //       s.buffers[i].recv.val @= 0
  
  always_comb begin : up_enq
    if ( recv__en ) begin
      for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_enq ); i += 1'd1 )
        buffers__recv__val[1'(i)] = recv__msg.vc_id == 1'(i);
    end
    else
      for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_enq ); i += 1'd1 )
        buffers__recv__val[1'(i)] = 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/ifcs/CreditIfc.py:218
  // @update
  // def up_yummy():
  //   for i in range( vc ):
  //     s.recv.yum[i] @= s.buffers[i].send.val & s.buffers[i].send.rdy
  
  always_comb begin : up_yummy
    for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_yummy ); i += 1'd1 )
      recv__yum[1'(i)] = buffers__send__val[1'(i)] & buffers__send__rdy[1'(i)];
  end

  assign buffers__clk[0] = clk;
  assign buffers__reset[0] = reset;
  assign buffers__clk[1] = clk;
  assign buffers__reset[1] = reset;
  assign arbiter__clk = clk;
  assign arbiter__reset = reset;
  assign encoder__clk = clk;
  assign encoder__reset = reset;
  assign buffers__recv__msg[0] = recv__msg;
  assign arbiter__reqs[0:0] = buffers__send__val[0];
  assign buffers__recv__msg[1] = recv__msg;
  assign arbiter__reqs[1:1] = buffers__send__val[1];
  assign encoder__in_ = arbiter__grants;
  assign arbiter__en = send__val;

endmodule