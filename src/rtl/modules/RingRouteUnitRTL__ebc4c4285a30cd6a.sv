module RingRouteUnitRTL__ebc4c4285a30cd6a
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [2:0] pos ,
  input  logic [0:0] reset ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send__msg [0:2] ,
  input logic [0:0] send__rdy [0:2] ,
  output logic [0:0] send__val [0:2] 
);
  localparam logic [1:0] __const__SELF  = 2'd2;
  localparam logic [0:0] __const__LEFT  = 1'd0;
  localparam logic [0:0] __const__RIGHT  = 1'd1;
  logic [2:0] left_dist;
  logic [1:0] out_dir;
  logic [2:0] right_dist;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_msg_wire;
  logic [2:0] send_rdy;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ringnet/RingRouteUnitRTL.py:51
  // @update
  // def up_left_right_dist():
  //   if s.recv.msg.dst < s.pos:
  //     s.left_dist  @= zext(s.pos, DistType) - zext(s.recv.msg.dst, DistType)
  //     s.right_dist @= zext(s.last_idx, DistType) - zext(s.pos, DistType) + zext(s.recv.msg.dst, DistType) + 1
  //   else:
  //     s.left_dist  @= 1 + zext(s.last_idx, DistType) + zext(s.pos, DistType) - zext(s.recv.msg.dst, DistType)
  //     s.right_dist @= zext(s.recv.msg.dst, DistType) - zext(s.pos, DistType)
  
  always_comb begin : up_left_right_dist
    if ( recv__msg.dst < pos ) begin
      left_dist = pos - recv__msg.dst;
      right_dist = ( ( 3'd4 - pos ) + recv__msg.dst ) + 3'd1;
    end
    else begin
      left_dist = ( ( 3'd1 + 3'd4 ) + pos ) - recv__msg.dst;
      right_dist = recv__msg.dst - pos;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ringnet/RingRouteUnitRTL.py:85
  // @update
  // def up_ru_recv_rdy():
  //   s.recv.rdy @= s.send_rdy[ s.out_dir ]
  
  always_comb begin : up_ru_recv_rdy
    recv__rdy = send_rdy[out_dir];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ringnet/RingRouteUnitRTL.py:60
  // @update
  // def up_ru_routing():
  // 
  //   s.out_dir @= 0
  //   s.send_msg_wire @= s.recv.msg
  //   for i in range( s.num_outports ):
  //     s.send[i].val @= 0
  //     s.send[i].msg @= s.recv.msg
  // 
  //   if s.recv.val:
  //     if s.pos == s.recv.msg.dst:
  //       s.out_dir @= SELF
  //     elif s.left_dist < s.right_dist:
  //       s.out_dir @= LEFT
  //     else:
  //       s.out_dir @= RIGHT
  // 
  //     if ( s.pos == s.last_idx ) & ( s.out_dir == RIGHT ):
  //       s.send_msg_wire.vc_id @= 1
  //     elif ( s.pos == 0 ) & ( s.out_dir == LEFT ):
  //       s.send_msg_wire.vc_id @= 1
  // 
  //     s.send[ s.out_dir ].val @= 1
  //     s.send[ s.out_dir ].msg @= s.send_msg_wire
  
  always_comb begin : up_ru_routing
    out_dir = 2'd0;
    send_msg_wire = recv__msg;
    for ( int unsigned i = 1'd0; i < 2'd3; i += 1'd1 ) begin
      send__val[2'(i)] = 1'd0;
      send__msg[2'(i)] = recv__msg;
    end
    if ( recv__val ) begin
      if ( pos == recv__msg.dst ) begin
        out_dir = 2'( __const__SELF );
      end
      else if ( left_dist < right_dist ) begin
        out_dir = 2'( __const__LEFT );
      end
      else
        out_dir = 2'( __const__RIGHT );
      if ( ( pos == 3'd4 ) & ( out_dir == 2'( __const__RIGHT ) ) ) begin
        send_msg_wire.vc_id = 1'd1;
      end
      else if ( ( pos == 3'd0 ) & ( out_dir == 2'( __const__LEFT ) ) ) begin
        send_msg_wire.vc_id = 1'd1;
      end
      send__val[out_dir] = 1'd1;
      send__msg[out_dir] = send_msg_wire;
    end
  end

  assign send_rdy[0:0] = send__rdy[0];
  assign send_rdy[1:1] = send__rdy[1];
  assign send_rdy[2:2] = send__rdy[2];

endmodule