module XbarRouteUnitRTL__b4ff6020003d1be0
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c send__msg [0:0] ,
  input logic [0:0] send__rdy [0:0] ,
  output logic [0:0] send__val [0:0] 
);
  localparam logic [0:0] __const__num_outports_at_up_ru_routing  = 1'd1;
  logic [0:0] out_dir;
  logic [0:0] send_val;

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
    for ( int unsigned i = 1'd0; i < 1'( __const__num_outports_at_up_ru_routing ); i += 1'd1 )
      send__val[1'(i)] = 1'd0;
    if ( recv__val ) begin
      send__val[out_dir] = 1'd1;
    end
  end

  assign send__msg[0] = recv__msg;
  assign send_val[0:0] = send__val[0];

endmodule