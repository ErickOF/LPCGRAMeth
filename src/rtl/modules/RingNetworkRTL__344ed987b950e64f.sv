module RingNetworkRTL__344ed987b950e64f
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv__msg [0:4] ,
  output logic [0:0] recv__rdy [0:4] ,
  input logic [0:0] recv__val [0:4] ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send__msg [0:4] ,
  input logic [0:0] send__rdy [0:4] ,
  output logic [0:0] send__val [0:4] 
);
  //-------------------------------------------------------------
  // Component recv_adp[0:4]
  //-------------------------------------------------------------

  logic [0:0] recv_adp__clk [0:4];
  logic [0:0] recv_adp__reset [0:4];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_adp__recv__msg [0:4];
  logic [0:0] recv_adp__recv__rdy [0:4];
  logic [0:0] recv_adp__recv__val [0:4];
  logic [0:0] recv_adp__send__en [0:4];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_adp__send__msg [0:4];
  logic [0:0] recv_adp__send__yum [0:4][0:1];

  RecvRTL2CreditSendRTL__b299f27b560c5025 recv_adp__0
  (
    .clk( recv_adp__clk[0] ),
    .reset( recv_adp__reset[0] ),
    .recv__msg( recv_adp__recv__msg[0] ),
    .recv__rdy( recv_adp__recv__rdy[0] ),
    .recv__val( recv_adp__recv__val[0] ),
    .send__en( recv_adp__send__en[0] ),
    .send__msg( recv_adp__send__msg[0] ),
    .send__yum( recv_adp__send__yum[0] )
  );

  RecvRTL2CreditSendRTL__b299f27b560c5025 recv_adp__1
  (
    .clk( recv_adp__clk[1] ),
    .reset( recv_adp__reset[1] ),
    .recv__msg( recv_adp__recv__msg[1] ),
    .recv__rdy( recv_adp__recv__rdy[1] ),
    .recv__val( recv_adp__recv__val[1] ),
    .send__en( recv_adp__send__en[1] ),
    .send__msg( recv_adp__send__msg[1] ),
    .send__yum( recv_adp__send__yum[1] )
  );

  RecvRTL2CreditSendRTL__b299f27b560c5025 recv_adp__2
  (
    .clk( recv_adp__clk[2] ),
    .reset( recv_adp__reset[2] ),
    .recv__msg( recv_adp__recv__msg[2] ),
    .recv__rdy( recv_adp__recv__rdy[2] ),
    .recv__val( recv_adp__recv__val[2] ),
    .send__en( recv_adp__send__en[2] ),
    .send__msg( recv_adp__send__msg[2] ),
    .send__yum( recv_adp__send__yum[2] )
  );

  RecvRTL2CreditSendRTL__b299f27b560c5025 recv_adp__3
  (
    .clk( recv_adp__clk[3] ),
    .reset( recv_adp__reset[3] ),
    .recv__msg( recv_adp__recv__msg[3] ),
    .recv__rdy( recv_adp__recv__rdy[3] ),
    .recv__val( recv_adp__recv__val[3] ),
    .send__en( recv_adp__send__en[3] ),
    .send__msg( recv_adp__send__msg[3] ),
    .send__yum( recv_adp__send__yum[3] )
  );

  RecvRTL2CreditSendRTL__b299f27b560c5025 recv_adp__4
  (
    .clk( recv_adp__clk[4] ),
    .reset( recv_adp__reset[4] ),
    .recv__msg( recv_adp__recv__msg[4] ),
    .recv__rdy( recv_adp__recv__rdy[4] ),
    .recv__val( recv_adp__recv__val[4] ),
    .send__en( recv_adp__send__en[4] ),
    .send__msg( recv_adp__send__msg[4] ),
    .send__yum( recv_adp__send__yum[4] )
  );

  //-------------------------------------------------------------
  // End of component recv_adp[0:4]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component routers[0:4]
  //-------------------------------------------------------------

  logic [0:0] routers__clk [0:4];
  logic [2:0] routers__pos [0:4];
  logic [0:0] routers__reset [0:4];
  logic [0:0] routers__recv__en [0:4][0:2];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c routers__recv__msg [0:4][0:2];
  logic [0:0] routers__recv__yum [0:4][0:2][0:1];
  logic [0:0] routers__send__en [0:4][0:2];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c routers__send__msg [0:4][0:2];
  logic [0:0] routers__send__yum [0:4][0:2][0:1];

  RingRouterRTL__795a7ef5c610671c routers__0
  (
    .clk( routers__clk[0] ),
    .pos( routers__pos[0] ),
    .reset( routers__reset[0] ),
    .recv__en( routers__recv__en[0] ),
    .recv__msg( routers__recv__msg[0] ),
    .recv__yum( routers__recv__yum[0] ),
    .send__en( routers__send__en[0] ),
    .send__msg( routers__send__msg[0] ),
    .send__yum( routers__send__yum[0] )
  );

  RingRouterRTL__795a7ef5c610671c routers__1
  (
    .clk( routers__clk[1] ),
    .pos( routers__pos[1] ),
    .reset( routers__reset[1] ),
    .recv__en( routers__recv__en[1] ),
    .recv__msg( routers__recv__msg[1] ),
    .recv__yum( routers__recv__yum[1] ),
    .send__en( routers__send__en[1] ),
    .send__msg( routers__send__msg[1] ),
    .send__yum( routers__send__yum[1] )
  );

  RingRouterRTL__795a7ef5c610671c routers__2
  (
    .clk( routers__clk[2] ),
    .pos( routers__pos[2] ),
    .reset( routers__reset[2] ),
    .recv__en( routers__recv__en[2] ),
    .recv__msg( routers__recv__msg[2] ),
    .recv__yum( routers__recv__yum[2] ),
    .send__en( routers__send__en[2] ),
    .send__msg( routers__send__msg[2] ),
    .send__yum( routers__send__yum[2] )
  );

  RingRouterRTL__795a7ef5c610671c routers__3
  (
    .clk( routers__clk[3] ),
    .pos( routers__pos[3] ),
    .reset( routers__reset[3] ),
    .recv__en( routers__recv__en[3] ),
    .recv__msg( routers__recv__msg[3] ),
    .recv__yum( routers__recv__yum[3] ),
    .send__en( routers__send__en[3] ),
    .send__msg( routers__send__msg[3] ),
    .send__yum( routers__send__yum[3] )
  );

  RingRouterRTL__795a7ef5c610671c routers__4
  (
    .clk( routers__clk[4] ),
    .pos( routers__pos[4] ),
    .reset( routers__reset[4] ),
    .recv__en( routers__recv__en[4] ),
    .recv__msg( routers__recv__msg[4] ),
    .recv__yum( routers__recv__yum[4] ),
    .send__en( routers__send__en[4] ),
    .send__msg( routers__send__msg[4] ),
    .send__yum( routers__send__yum[4] )
  );

  //-------------------------------------------------------------
  // End of component routers[0:4]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component send_adp[0:4]
  //-------------------------------------------------------------

  logic [0:0] send_adp__clk [0:4];
  logic [0:0] send_adp__reset [0:4];
  logic [0:0] send_adp__recv__en [0:4];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_adp__recv__msg [0:4];
  logic [0:0] send_adp__recv__yum [0:4][0:1];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_adp__send__msg [0:4];
  logic [0:0] send_adp__send__rdy [0:4];
  logic [0:0] send_adp__send__val [0:4];

  CreditRecvRTL2SendRTL__8b4e283003268cf5 send_adp__0
  (
    .clk( send_adp__clk[0] ),
    .reset( send_adp__reset[0] ),
    .recv__en( send_adp__recv__en[0] ),
    .recv__msg( send_adp__recv__msg[0] ),
    .recv__yum( send_adp__recv__yum[0] ),
    .send__msg( send_adp__send__msg[0] ),
    .send__rdy( send_adp__send__rdy[0] ),
    .send__val( send_adp__send__val[0] )
  );

  CreditRecvRTL2SendRTL__8b4e283003268cf5 send_adp__1
  (
    .clk( send_adp__clk[1] ),
    .reset( send_adp__reset[1] ),
    .recv__en( send_adp__recv__en[1] ),
    .recv__msg( send_adp__recv__msg[1] ),
    .recv__yum( send_adp__recv__yum[1] ),
    .send__msg( send_adp__send__msg[1] ),
    .send__rdy( send_adp__send__rdy[1] ),
    .send__val( send_adp__send__val[1] )
  );

  CreditRecvRTL2SendRTL__8b4e283003268cf5 send_adp__2
  (
    .clk( send_adp__clk[2] ),
    .reset( send_adp__reset[2] ),
    .recv__en( send_adp__recv__en[2] ),
    .recv__msg( send_adp__recv__msg[2] ),
    .recv__yum( send_adp__recv__yum[2] ),
    .send__msg( send_adp__send__msg[2] ),
    .send__rdy( send_adp__send__rdy[2] ),
    .send__val( send_adp__send__val[2] )
  );

  CreditRecvRTL2SendRTL__8b4e283003268cf5 send_adp__3
  (
    .clk( send_adp__clk[3] ),
    .reset( send_adp__reset[3] ),
    .recv__en( send_adp__recv__en[3] ),
    .recv__msg( send_adp__recv__msg[3] ),
    .recv__yum( send_adp__recv__yum[3] ),
    .send__msg( send_adp__send__msg[3] ),
    .send__rdy( send_adp__send__rdy[3] ),
    .send__val( send_adp__send__val[3] )
  );

  CreditRecvRTL2SendRTL__8b4e283003268cf5 send_adp__4
  (
    .clk( send_adp__clk[4] ),
    .reset( send_adp__reset[4] ),
    .recv__en( send_adp__recv__en[4] ),
    .recv__msg( send_adp__recv__msg[4] ),
    .recv__yum( send_adp__recv__yum[4] ),
    .send__msg( send_adp__send__msg[4] ),
    .send__rdy( send_adp__send__rdy[4] ),
    .send__val( send_adp__send__val[4] )
  );

  //-------------------------------------------------------------
  // End of component send_adp[0:4]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ringnet/RingNetworkRTL.py:58
  // @update
  // def up_pos():
  //   for r in range( s.num_routers ):
  //     s.routers[r].pos @= r
  
  always_comb begin : up_pos
    for ( int unsigned r = 1'd0; r < 3'd5; r += 1'd1 )
      routers__pos[3'(r)] = 3'(r);
  end

  assign routers__clk[0] = clk;
  assign routers__reset[0] = reset;
  assign routers__clk[1] = clk;
  assign routers__reset[1] = reset;
  assign routers__clk[2] = clk;
  assign routers__reset[2] = reset;
  assign routers__clk[3] = clk;
  assign routers__reset[3] = reset;
  assign routers__clk[4] = clk;
  assign routers__reset[4] = reset;
  assign recv_adp__clk[0] = clk;
  assign recv_adp__reset[0] = reset;
  assign recv_adp__clk[1] = clk;
  assign recv_adp__reset[1] = reset;
  assign recv_adp__clk[2] = clk;
  assign recv_adp__reset[2] = reset;
  assign recv_adp__clk[3] = clk;
  assign recv_adp__reset[3] = reset;
  assign recv_adp__clk[4] = clk;
  assign recv_adp__reset[4] = reset;
  assign send_adp__clk[0] = clk;
  assign send_adp__reset[0] = reset;
  assign send_adp__clk[1] = clk;
  assign send_adp__reset[1] = reset;
  assign send_adp__clk[2] = clk;
  assign send_adp__reset[2] = reset;
  assign send_adp__clk[3] = clk;
  assign send_adp__reset[3] = reset;
  assign send_adp__clk[4] = clk;
  assign send_adp__reset[4] = reset;
  assign routers__recv__en[1][0] = routers__send__en[0][1];
  assign routers__recv__msg[1][0] = routers__send__msg[0][1];
  assign routers__send__yum[0][1][0] = routers__recv__yum[1][0][0];
  assign routers__send__yum[0][1][1] = routers__recv__yum[1][0][1];
  assign routers__recv__en[0][1] = routers__send__en[1][0];
  assign routers__recv__msg[0][1] = routers__send__msg[1][0];
  assign routers__send__yum[1][0][0] = routers__recv__yum[0][1][0];
  assign routers__send__yum[1][0][1] = routers__recv__yum[0][1][1];
  assign recv_adp__recv__msg[0] = recv__msg[0];
  assign recv__rdy[0] = recv_adp__recv__rdy[0];
  assign recv_adp__recv__val[0] = recv__val[0];
  assign routers__recv__en[0][2] = recv_adp__send__en[0];
  assign routers__recv__msg[0][2] = recv_adp__send__msg[0];
  assign recv_adp__send__yum[0][0] = routers__recv__yum[0][2][0];
  assign recv_adp__send__yum[0][1] = routers__recv__yum[0][2][1];
  assign send_adp__recv__en[0] = routers__send__en[0][2];
  assign send_adp__recv__msg[0] = routers__send__msg[0][2];
  assign routers__send__yum[0][2][0] = send_adp__recv__yum[0][0];
  assign routers__send__yum[0][2][1] = send_adp__recv__yum[0][1];
  assign send__msg[0] = send_adp__send__msg[0];
  assign send_adp__send__rdy[0] = send__rdy[0];
  assign send__val[0] = send_adp__send__val[0];
  assign routers__recv__en[2][0] = routers__send__en[1][1];
  assign routers__recv__msg[2][0] = routers__send__msg[1][1];
  assign routers__send__yum[1][1][0] = routers__recv__yum[2][0][0];
  assign routers__send__yum[1][1][1] = routers__recv__yum[2][0][1];
  assign routers__recv__en[1][1] = routers__send__en[2][0];
  assign routers__recv__msg[1][1] = routers__send__msg[2][0];
  assign routers__send__yum[2][0][0] = routers__recv__yum[1][1][0];
  assign routers__send__yum[2][0][1] = routers__recv__yum[1][1][1];
  assign recv_adp__recv__msg[1] = recv__msg[1];
  assign recv__rdy[1] = recv_adp__recv__rdy[1];
  assign recv_adp__recv__val[1] = recv__val[1];
  assign routers__recv__en[1][2] = recv_adp__send__en[1];
  assign routers__recv__msg[1][2] = recv_adp__send__msg[1];
  assign recv_adp__send__yum[1][0] = routers__recv__yum[1][2][0];
  assign recv_adp__send__yum[1][1] = routers__recv__yum[1][2][1];
  assign send_adp__recv__en[1] = routers__send__en[1][2];
  assign send_adp__recv__msg[1] = routers__send__msg[1][2];
  assign routers__send__yum[1][2][0] = send_adp__recv__yum[1][0];
  assign routers__send__yum[1][2][1] = send_adp__recv__yum[1][1];
  assign send__msg[1] = send_adp__send__msg[1];
  assign send_adp__send__rdy[1] = send__rdy[1];
  assign send__val[1] = send_adp__send__val[1];
  assign routers__recv__en[3][0] = routers__send__en[2][1];
  assign routers__recv__msg[3][0] = routers__send__msg[2][1];
  assign routers__send__yum[2][1][0] = routers__recv__yum[3][0][0];
  assign routers__send__yum[2][1][1] = routers__recv__yum[3][0][1];
  assign routers__recv__en[2][1] = routers__send__en[3][0];
  assign routers__recv__msg[2][1] = routers__send__msg[3][0];
  assign routers__send__yum[3][0][0] = routers__recv__yum[2][1][0];
  assign routers__send__yum[3][0][1] = routers__recv__yum[2][1][1];
  assign recv_adp__recv__msg[2] = recv__msg[2];
  assign recv__rdy[2] = recv_adp__recv__rdy[2];
  assign recv_adp__recv__val[2] = recv__val[2];
  assign routers__recv__en[2][2] = recv_adp__send__en[2];
  assign routers__recv__msg[2][2] = recv_adp__send__msg[2];
  assign recv_adp__send__yum[2][0] = routers__recv__yum[2][2][0];
  assign recv_adp__send__yum[2][1] = routers__recv__yum[2][2][1];
  assign send_adp__recv__en[2] = routers__send__en[2][2];
  assign send_adp__recv__msg[2] = routers__send__msg[2][2];
  assign routers__send__yum[2][2][0] = send_adp__recv__yum[2][0];
  assign routers__send__yum[2][2][1] = send_adp__recv__yum[2][1];
  assign send__msg[2] = send_adp__send__msg[2];
  assign send_adp__send__rdy[2] = send__rdy[2];
  assign send__val[2] = send_adp__send__val[2];
  assign routers__recv__en[4][0] = routers__send__en[3][1];
  assign routers__recv__msg[4][0] = routers__send__msg[3][1];
  assign routers__send__yum[3][1][0] = routers__recv__yum[4][0][0];
  assign routers__send__yum[3][1][1] = routers__recv__yum[4][0][1];
  assign routers__recv__en[3][1] = routers__send__en[4][0];
  assign routers__recv__msg[3][1] = routers__send__msg[4][0];
  assign routers__send__yum[4][0][0] = routers__recv__yum[3][1][0];
  assign routers__send__yum[4][0][1] = routers__recv__yum[3][1][1];
  assign recv_adp__recv__msg[3] = recv__msg[3];
  assign recv__rdy[3] = recv_adp__recv__rdy[3];
  assign recv_adp__recv__val[3] = recv__val[3];
  assign routers__recv__en[3][2] = recv_adp__send__en[3];
  assign routers__recv__msg[3][2] = recv_adp__send__msg[3];
  assign recv_adp__send__yum[3][0] = routers__recv__yum[3][2][0];
  assign recv_adp__send__yum[3][1] = routers__recv__yum[3][2][1];
  assign send_adp__recv__en[3] = routers__send__en[3][2];
  assign send_adp__recv__msg[3] = routers__send__msg[3][2];
  assign routers__send__yum[3][2][0] = send_adp__recv__yum[3][0];
  assign routers__send__yum[3][2][1] = send_adp__recv__yum[3][1];
  assign send__msg[3] = send_adp__send__msg[3];
  assign send_adp__send__rdy[3] = send__rdy[3];
  assign send__val[3] = send_adp__send__val[3];
  assign routers__recv__en[0][0] = routers__send__en[4][1];
  assign routers__recv__msg[0][0] = routers__send__msg[4][1];
  assign routers__send__yum[4][1][0] = routers__recv__yum[0][0][0];
  assign routers__send__yum[4][1][1] = routers__recv__yum[0][0][1];
  assign routers__recv__en[4][1] = routers__send__en[0][0];
  assign routers__recv__msg[4][1] = routers__send__msg[0][0];
  assign routers__send__yum[0][0][0] = routers__recv__yum[4][1][0];
  assign routers__send__yum[0][0][1] = routers__recv__yum[4][1][1];
  assign recv_adp__recv__msg[4] = recv__msg[4];
  assign recv__rdy[4] = recv_adp__recv__rdy[4];
  assign recv_adp__recv__val[4] = recv__val[4];
  assign routers__recv__en[4][2] = recv_adp__send__en[4];
  assign routers__recv__msg[4][2] = recv_adp__send__msg[4];
  assign recv_adp__send__yum[4][0] = routers__recv__yum[4][2][0];
  assign recv_adp__send__yum[4][1] = routers__recv__yum[4][2][1];
  assign send_adp__recv__en[4] = routers__send__en[4][2];
  assign send_adp__recv__msg[4] = routers__send__msg[4][2];
  assign routers__send__yum[4][2][0] = send_adp__recv__yum[4][0];
  assign routers__send__yum[4][2][1] = send_adp__recv__yum[4][1];
  assign send__msg[4] = send_adp__send__msg[4];
  assign send_adp__send__rdy[4] = send__rdy[4];
  assign send__val[4] = send_adp__send__val[4];

endmodule