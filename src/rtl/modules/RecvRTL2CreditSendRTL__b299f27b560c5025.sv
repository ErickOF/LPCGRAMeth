module RecvRTL2CreditSendRTL__b299f27b560c5025
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output logic [0:0] send__en  ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send__msg  ,
  input logic [0:0] send__yum [0:1] 
);
  localparam logic [1:0] __const__vc_at_up_credit_send  = 2'd2;
  localparam logic [1:0] __const__vc_at_up_counter_decr  = 2'd2;
  //-------------------------------------------------------------
  // Component credit[0:1]
  //-------------------------------------------------------------

  logic [0:0] credit__clk [0:1];
  logic [1:0] credit__count [0:1];
  logic [0:0] credit__decr [0:1];
  logic [0:0] credit__incr [0:1];
  logic [0:0] credit__load [0:1];
  logic [1:0] credit__load_value [0:1];
  logic [0:0] credit__reset [0:1];

  Counter__Type_Bits2__reset_value_2 credit__0
  (
    .clk( credit__clk[0] ),
    .count( credit__count[0] ),
    .decr( credit__decr[0] ),
    .incr( credit__incr[0] ),
    .load( credit__load[0] ),
    .load_value( credit__load_value[0] ),
    .reset( credit__reset[0] )
  );

  Counter__Type_Bits2__reset_value_2 credit__1
  (
    .clk( credit__clk[1] ),
    .count( credit__count[1] ),
    .decr( credit__decr[1] ),
    .incr( credit__incr[1] ),
    .load( credit__load[1] ),
    .load_value( credit__load_value[1] ),
    .reset( credit__reset[1] )
  );

  //-------------------------------------------------------------
  // End of component credit[0:1]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/ifcs/CreditIfc.py:149
  // @update
  // def up_counter_decr():
  //   for i in range( vc ):
  //     s.credit[i].decr @= s.send.en & ( i == s.send.msg.vc_id )
  
  always_comb begin : up_counter_decr
    for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_counter_decr ); i += 1'd1 )
      credit__decr[1'(i)] = send__en & ( 1'(i) == send__msg.vc_id );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/ifcs/CreditIfc.py:137
  // @update
  // def up_credit_send():
  //   s.send.en  @= 0
  //   s.recv.rdy @= 0
  //   # NOTE: recv.rdy depends on recv.val.
  //   #       Be careful about combinationl loop.
  //   if s.recv.val:
  //     for i in range( vc ):
  //       if ( i == s.recv.msg.vc_id ) & ( s.credit[i].count > 0 ):
  //         s.send.en  @= 1
  //         s.recv.rdy @= 1
  
  always_comb begin : up_credit_send
    send__en = 1'd0;
    recv__rdy = 1'd0;
    if ( recv__val ) begin
      for ( int unsigned i = 1'd0; i < 2'( __const__vc_at_up_credit_send ); i += 1'd1 )
        if ( ( 1'(i) == recv__msg.vc_id ) & ( credit__count[1'(i)] > 2'd0 ) ) begin
          send__en = 1'd1;
          recv__rdy = 1'd1;
        end
    end
  end

  assign credit__clk[0] = clk;
  assign credit__reset[0] = reset;
  assign credit__clk[1] = clk;
  assign credit__reset[1] = reset;
  assign send__msg = recv__msg;
  assign credit__incr[0] = send__yum[0];
  assign credit__load[0] = 1'd0;
  assign credit__load_value[0] = 2'd0;
  assign credit__incr[1] = send__yum[1];
  assign credit__load[1] = 1'd0;
  assign credit__load_value[1] = 2'd0;

endmodule