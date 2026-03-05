module InputUnitCreditRTL__fb413909b40d24f2
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input logic [0:0] recv__en  ,
  input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv__msg  ,
  output logic [0:0] recv__yum [0:1] ,
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send__msg [0:1] ,
  input logic [0:0] send__rdy [0:1] ,
  output logic [0:0] send__val [0:1] 
);
  localparam logic [0:0] __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_  = 1'd0;
  localparam logic [0:0] __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_  = 1'd1;
  localparam logic [1:0] __const__vc_at_up_enq  = 2'd2;
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

  NormalQueueRTL__309dee5507394099 buffers__0
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

  NormalQueueRTL__309dee5507394099 buffers__1
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

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/InputUnitCreditRTL.py:39
  // s.recv.yum[i]         //= lambda: s.send[i].val & s.send[i].rdy
  
  always_comb begin : _lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_
    recv__yum[1'd0] = send__val[1'( __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_ )] & send__rdy[1'( __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_ )];
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/InputUnitCreditRTL.py:39
  // s.recv.yum[i]         //= lambda: s.send[i].val & s.send[i].rdy
  
  always_comb begin : _lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_
    recv__yum[1'd1] = send__val[1'( __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_ )] & send__rdy[1'( __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_ )];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/InputUnitCreditRTL.py:41
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

  assign buffers__clk[0] = clk;
  assign buffers__reset[0] = reset;
  assign buffers__clk[1] = clk;
  assign buffers__reset[1] = reset;
  assign buffers__recv__msg[0] = recv__msg;
  assign send__msg[0] = buffers__send__msg[0];
  assign buffers__send__rdy[0] = send__rdy[0];
  assign send__val[0] = buffers__send__val[0];
  assign buffers__recv__msg[1] = recv__msg;
  assign send__msg[1] = buffers__send__msg[1];
  assign buffers__send__rdy[1] = send__rdy[1];
  assign send__val[1] = buffers__send__val[1];

endmodule