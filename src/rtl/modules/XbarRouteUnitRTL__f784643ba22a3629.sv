module XbarRouteUnitRTL__f784643ba22a3629
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_3_32_512__62fa6e6064d885d7 recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 send__msg [0:31] ,
  input logic [0:0] send__rdy [0:31] ,
  output logic [0:0] send__val [0:31] 
);
  localparam logic [5:0] __const__num_outports_at_up_ru_routing  = 6'd32;
  logic [4:0] out_dir;
  logic [31:0] send_val;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/xbar/XbarRouteUnitRTL.py:51
  // @update
  // def up_ru_recv_rdy():
  //   s.recv.rdy @= s.send[ s.out_dir ].rdy > 0
  
  always_comb begin : up_ru_recv_rdy
    recv__rdy = send__rdy[out_dir] > 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/xbar/XbarRouteUnitRTL.py:41
  // @update
  // def up_ru_routing():
  //   s.out_dir @= trunc( s.recv.msg.dst, dir_nbits )
  // 
  //   for i in range( num_outports ):
  //     s.send[i].val @= b1(0)
  // 
  //   if s.recv.val:
  //     s.send[ s.out_dir ].val @= b1(1)
  
  always_comb begin : up_ru_routing
    out_dir = recv__msg.dst;
    for ( int unsigned i = 1'd0; i < 6'( __const__num_outports_at_up_ru_routing ); i += 1'd1 )
      send__val[5'(i)] = 1'd0;
    if ( recv__val ) begin
      send__val[out_dir] = 1'd1;
    end
  end

  assign send__msg[0] = recv__msg;
  assign send_val[0:0] = send__val[0];
  assign send__msg[1] = recv__msg;
  assign send_val[1:1] = send__val[1];
  assign send__msg[2] = recv__msg;
  assign send_val[2:2] = send__val[2];
  assign send__msg[3] = recv__msg;
  assign send_val[3:3] = send__val[3];
  assign send__msg[4] = recv__msg;
  assign send_val[4:4] = send__val[4];
  assign send__msg[5] = recv__msg;
  assign send_val[5:5] = send__val[5];
  assign send__msg[6] = recv__msg;
  assign send_val[6:6] = send__val[6];
  assign send__msg[7] = recv__msg;
  assign send_val[7:7] = send__val[7];
  assign send__msg[8] = recv__msg;
  assign send_val[8:8] = send__val[8];
  assign send__msg[9] = recv__msg;
  assign send_val[9:9] = send__val[9];
  assign send__msg[10] = recv__msg;
  assign send_val[10:10] = send__val[10];
  assign send__msg[11] = recv__msg;
  assign send_val[11:11] = send__val[11];
  assign send__msg[12] = recv__msg;
  assign send_val[12:12] = send__val[12];
  assign send__msg[13] = recv__msg;
  assign send_val[13:13] = send__val[13];
  assign send__msg[14] = recv__msg;
  assign send_val[14:14] = send__val[14];
  assign send__msg[15] = recv__msg;
  assign send_val[15:15] = send__val[15];
  assign send__msg[16] = recv__msg;
  assign send_val[16:16] = send__val[16];
  assign send__msg[17] = recv__msg;
  assign send_val[17:17] = send__val[17];
  assign send__msg[18] = recv__msg;
  assign send_val[18:18] = send__val[18];
  assign send__msg[19] = recv__msg;
  assign send_val[19:19] = send__val[19];
  assign send__msg[20] = recv__msg;
  assign send_val[20:20] = send__val[20];
  assign send__msg[21] = recv__msg;
  assign send_val[21:21] = send__val[21];
  assign send__msg[22] = recv__msg;
  assign send_val[22:22] = send__val[22];
  assign send__msg[23] = recv__msg;
  assign send_val[23:23] = send__val[23];
  assign send__msg[24] = recv__msg;
  assign send_val[24:24] = send__val[24];
  assign send__msg[25] = recv__msg;
  assign send_val[25:25] = send__val[25];
  assign send__msg[26] = recv__msg;
  assign send_val[26:26] = send__val[26];
  assign send__msg[27] = recv__msg;
  assign send_val[27:27] = send__val[27];
  assign send__msg[28] = recv__msg;
  assign send_val[28:28] = send__val[28];
  assign send__msg[29] = recv__msg;
  assign send_val[29:29] = send__val[29];
  assign send__msg[30] = recv__msg;
  assign send_val[30:30] = send__val[30];
  assign send__msg[31] = recv__msg;
  assign send_val[31:31] = send__val[31];

endmodule