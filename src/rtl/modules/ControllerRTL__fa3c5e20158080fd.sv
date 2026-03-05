module ControllerRTL__fa3c5e20158080fd
import cgra_pkg::*;
(
  input  logic [1:0] cgra_id ,
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_from_cpu_pkt__msg  ,
  output logic [0:0] recv_from_cpu_pkt__rdy  ,
  input logic [0:0] recv_from_cpu_pkt__val  ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_from_ctrl_ring_pkt__msg  ,
  output logic [0:0] recv_from_ctrl_ring_pkt__rdy  ,
  input logic [0:0] recv_from_ctrl_ring_pkt__val  ,
  input InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_inter_cgra_noc__msg  ,
  output logic [0:0] recv_from_inter_cgra_noc__rdy  ,
  input logic [0:0] recv_from_inter_cgra_noc__val  ,
  input InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_request_pkt__msg  ,
  output logic [0:0] recv_from_tile_load_request_pkt__rdy  ,
  input logic [0:0] recv_from_tile_load_request_pkt__val  ,
  input InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_response_pkt__msg  ,
  output logic [0:0] recv_from_tile_load_response_pkt__rdy  ,
  input logic [0:0] recv_from_tile_load_response_pkt__val  ,
  input InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_store_request_pkt__msg  ,
  output logic [0:0] recv_from_tile_store_request_pkt__rdy  ,
  input logic [0:0] recv_from_tile_store_request_pkt__val  ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_to_cpu_pkt__msg  ,
  input logic [0:0] send_to_cpu_pkt__rdy  ,
  output logic [0:0] send_to_cpu_pkt__val  ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_to_ctrl_ring_pkt__msg  ,
  input logic [0:0] send_to_ctrl_ring_pkt__rdy  ,
  output logic [0:0] send_to_ctrl_ring_pkt__val  ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_inter_cgra_noc__msg  ,
  input logic [0:0] send_to_inter_cgra_noc__rdy  ,
  output logic [0:0] send_to_inter_cgra_noc__val  ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_load_request__msg  ,
  input logic [0:0] send_to_mem_load_request__rdy  ,
  output logic [0:0] send_to_mem_load_request__val  ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_store_request__msg  ,
  input logic [0:0] send_to_mem_store_request__rdy  ,
  output logic [0:0] send_to_mem_store_request__val  ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_tile_load_response__msg  ,
  input logic [0:0] send_to_tile_load_response__rdy  ,
  output logic [0:0] send_to_tile_load_response__val  
);
  localparam logic [2:0] __const__CONTROLLER_CROSSBAR_INPORTS  = 3'd6;
  localparam logic [2:0] __const__num_tiles_at_update_received_msg  = 3'd4;
  localparam logic [3:0] __const__CMD_LOAD_REQUEST  = 4'd10;
  localparam logic [3:0] __const__CMD_STORE_REQUEST  = 4'd12;
  localparam logic [3:0] __const__CMD_LOAD_RESPONSE  = 4'd11;
  localparam logic [3:0] __const__CMD_COMPLETE  = 4'd14;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD  = 5'd18;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_COUNT  = 5'd17;
  localparam logic [1:0] __const__CMD_CONFIG  = 2'd3;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU  = 3'd4;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR  = 3'd5;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR  = 3'd6;
  localparam logic [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT  = 3'd7;
  localparam logic [3:0] __const__CMD_CONFIG_COUNT_PER_ITER  = 4'd8;
  localparam logic [3:0] __const__CMD_CONFIG_CTRL_LOWER_BOUND  = 4'd9;
  localparam logic [3:0] __const__CMD_CONST  = 4'd13;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE  = 5'd20;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE  = 5'd21;
  localparam logic [0:0] __const__CMD_PAUSE  = 1'd1;
  localparam logic [4:0] __const__CMD_PRESERVE  = 5'd22;
  localparam logic [3:0] __const__CMD_RESUME  = 4'd15;
  localparam logic [4:0] __const__CMD_RECORD_PHI_ADDR  = 5'd16;
  localparam logic [1:0] __const__CMD_TERMINATE  = 2'd2;
  localparam logic [0:0] __const__CMD_LAUNCH  = 1'd0;
  localparam logic [1:0] __const__addr_offset_nbits_at_capture_addr_dst_id  = 2'd2;
  logic [1:0] addr2controller_lut [0:3];
  logic [1:0] addr_dst_id;
  logic [1:0] idTo2d_x_lut [0:3];
  logic [0:0] idTo2d_y_lut [0:3];
  //-------------------------------------------------------------
  // Component crossbar
  //-------------------------------------------------------------

  logic [0:0] crossbar__clk;
  logic [0:0] crossbar__reset;
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c crossbar__recv__msg [0:5];
  logic [0:0] crossbar__recv__rdy [0:5];
  logic [0:0] crossbar__recv__val [0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c crossbar__send__msg [0:0];
  logic [0:0] crossbar__send__rdy [0:0];
  logic [0:0] crossbar__send__val [0:0];

  XbarRTL__40ca80b1d76a0751 crossbar
  (
    .clk( crossbar__clk ),
    .reset( crossbar__reset ),
    .recv__msg( crossbar__recv__msg ),
    .recv__rdy( crossbar__recv__rdy ),
    .recv__val( crossbar__recv__val ),
    .send__msg( crossbar__send__msg ),
    .send__rdy( crossbar__send__rdy ),
    .send__val( crossbar__send__val )
  );

  //-------------------------------------------------------------
  // End of component crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component global_reduce_unit
  //-------------------------------------------------------------

  logic [0:0] global_reduce_unit__clk;
  logic [0:0] global_reduce_unit__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff global_reduce_unit__recv_count__msg;
  logic [0:0] global_reduce_unit__recv_count__rdy;
  logic [0:0] global_reduce_unit__recv_count__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff global_reduce_unit__recv_data__msg;
  logic [0:0] global_reduce_unit__recv_data__rdy;
  logic [0:0] global_reduce_unit__recv_data__val;
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c global_reduce_unit__send__msg;
  logic [0:0] global_reduce_unit__send__rdy;
  logic [0:0] global_reduce_unit__send__val;

  GlobalReduceUnitRTL__a68241ebe958efcc global_reduce_unit
  (
    .clk( global_reduce_unit__clk ),
    .reset( global_reduce_unit__reset ),
    .recv_count__msg( global_reduce_unit__recv_count__msg ),
    .recv_count__rdy( global_reduce_unit__recv_count__rdy ),
    .recv_count__val( global_reduce_unit__recv_count__val ),
    .recv_data__msg( global_reduce_unit__recv_data__msg ),
    .recv_data__rdy( global_reduce_unit__recv_data__rdy ),
    .recv_data__val( global_reduce_unit__recv_data__val ),
    .send__msg( global_reduce_unit__send__msg ),
    .send__rdy( global_reduce_unit__send__rdy ),
    .send__val( global_reduce_unit__send__val )
  );

  //-------------------------------------------------------------
  // End of component global_reduce_unit
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component recv_from_cpu_pkt_queue
  //-------------------------------------------------------------

  logic [0:0] recv_from_cpu_pkt_queue__clk;
  logic [1:0] recv_from_cpu_pkt_queue__count;
  logic [0:0] recv_from_cpu_pkt_queue__reset;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_from_cpu_pkt_queue__recv__msg;
  logic [0:0] recv_from_cpu_pkt_queue__recv__rdy;
  logic [0:0] recv_from_cpu_pkt_queue__recv__val;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_from_cpu_pkt_queue__send__msg;
  logic [0:0] recv_from_cpu_pkt_queue__send__rdy;
  logic [0:0] recv_from_cpu_pkt_queue__send__val;

  NormalQueueRTL__4d91d5ee0229de22 recv_from_cpu_pkt_queue
  (
    .clk( recv_from_cpu_pkt_queue__clk ),
    .count( recv_from_cpu_pkt_queue__count ),
    .reset( recv_from_cpu_pkt_queue__reset ),
    .recv__msg( recv_from_cpu_pkt_queue__recv__msg ),
    .recv__rdy( recv_from_cpu_pkt_queue__recv__rdy ),
    .recv__val( recv_from_cpu_pkt_queue__recv__val ),
    .send__msg( recv_from_cpu_pkt_queue__send__msg ),
    .send__rdy( recv_from_cpu_pkt_queue__send__rdy ),
    .send__val( recv_from_cpu_pkt_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_from_cpu_pkt_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component recv_from_tile_load_request_pkt_queue
  //-------------------------------------------------------------

  logic [0:0] recv_from_tile_load_request_pkt_queue__clk;
  logic [0:0] recv_from_tile_load_request_pkt_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_request_pkt_queue__recv__msg;
  logic [0:0] recv_from_tile_load_request_pkt_queue__recv__rdy;
  logic [0:0] recv_from_tile_load_request_pkt_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_request_pkt_queue__send__msg;
  logic [0:0] recv_from_tile_load_request_pkt_queue__send__rdy;
  logic [0:0] recv_from_tile_load_request_pkt_queue__send__val;

  ChannelRTL__1970d1f511171c70 recv_from_tile_load_request_pkt_queue
  (
    .clk( recv_from_tile_load_request_pkt_queue__clk ),
    .reset( recv_from_tile_load_request_pkt_queue__reset ),
    .recv__msg( recv_from_tile_load_request_pkt_queue__recv__msg ),
    .recv__rdy( recv_from_tile_load_request_pkt_queue__recv__rdy ),
    .recv__val( recv_from_tile_load_request_pkt_queue__recv__val ),
    .send__msg( recv_from_tile_load_request_pkt_queue__send__msg ),
    .send__rdy( recv_from_tile_load_request_pkt_queue__send__rdy ),
    .send__val( recv_from_tile_load_request_pkt_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_from_tile_load_request_pkt_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component recv_from_tile_load_response_pkt_queue
  //-------------------------------------------------------------

  logic [0:0] recv_from_tile_load_response_pkt_queue__clk;
  logic [0:0] recv_from_tile_load_response_pkt_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_response_pkt_queue__recv__msg;
  logic [0:0] recv_from_tile_load_response_pkt_queue__recv__rdy;
  logic [0:0] recv_from_tile_load_response_pkt_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_load_response_pkt_queue__send__msg;
  logic [0:0] recv_from_tile_load_response_pkt_queue__send__rdy;
  logic [0:0] recv_from_tile_load_response_pkt_queue__send__val;

  ChannelRTL__1970d1f511171c70 recv_from_tile_load_response_pkt_queue
  (
    .clk( recv_from_tile_load_response_pkt_queue__clk ),
    .reset( recv_from_tile_load_response_pkt_queue__reset ),
    .recv__msg( recv_from_tile_load_response_pkt_queue__recv__msg ),
    .recv__rdy( recv_from_tile_load_response_pkt_queue__recv__rdy ),
    .recv__val( recv_from_tile_load_response_pkt_queue__recv__val ),
    .send__msg( recv_from_tile_load_response_pkt_queue__send__msg ),
    .send__rdy( recv_from_tile_load_response_pkt_queue__send__rdy ),
    .send__val( recv_from_tile_load_response_pkt_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_from_tile_load_response_pkt_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component recv_from_tile_store_request_pkt_queue
  //-------------------------------------------------------------

  logic [0:0] recv_from_tile_store_request_pkt_queue__clk;
  logic [0:0] recv_from_tile_store_request_pkt_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_store_request_pkt_queue__recv__msg;
  logic [0:0] recv_from_tile_store_request_pkt_queue__recv__rdy;
  logic [0:0] recv_from_tile_store_request_pkt_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv_from_tile_store_request_pkt_queue__send__msg;
  logic [0:0] recv_from_tile_store_request_pkt_queue__send__rdy;
  logic [0:0] recv_from_tile_store_request_pkt_queue__send__val;

  ChannelRTL__1970d1f511171c70 recv_from_tile_store_request_pkt_queue
  (
    .clk( recv_from_tile_store_request_pkt_queue__clk ),
    .reset( recv_from_tile_store_request_pkt_queue__reset ),
    .recv__msg( recv_from_tile_store_request_pkt_queue__recv__msg ),
    .recv__rdy( recv_from_tile_store_request_pkt_queue__recv__rdy ),
    .recv__val( recv_from_tile_store_request_pkt_queue__recv__val ),
    .send__msg( recv_from_tile_store_request_pkt_queue__send__msg ),
    .send__rdy( recv_from_tile_store_request_pkt_queue__send__rdy ),
    .send__val( recv_from_tile_store_request_pkt_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_from_tile_store_request_pkt_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component send_to_cpu_pkt_queue
  //-------------------------------------------------------------

  logic [0:0] send_to_cpu_pkt_queue__clk;
  logic [1:0] send_to_cpu_pkt_queue__count;
  logic [0:0] send_to_cpu_pkt_queue__reset;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_to_cpu_pkt_queue__recv__msg;
  logic [0:0] send_to_cpu_pkt_queue__recv__rdy;
  logic [0:0] send_to_cpu_pkt_queue__recv__val;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_to_cpu_pkt_queue__send__msg;
  logic [0:0] send_to_cpu_pkt_queue__send__rdy;
  logic [0:0] send_to_cpu_pkt_queue__send__val;

  NormalQueueRTL__4d91d5ee0229de22 send_to_cpu_pkt_queue
  (
    .clk( send_to_cpu_pkt_queue__clk ),
    .count( send_to_cpu_pkt_queue__count ),
    .reset( send_to_cpu_pkt_queue__reset ),
    .recv__msg( send_to_cpu_pkt_queue__recv__msg ),
    .recv__rdy( send_to_cpu_pkt_queue__recv__rdy ),
    .recv__val( send_to_cpu_pkt_queue__recv__val ),
    .send__msg( send_to_cpu_pkt_queue__send__msg ),
    .send__rdy( send_to_cpu_pkt_queue__send__rdy ),
    .send__val( send_to_cpu_pkt_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component send_to_cpu_pkt_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component send_to_mem_load_request_queue
  //-------------------------------------------------------------

  logic [0:0] send_to_mem_load_request_queue__clk;
  logic [0:0] send_to_mem_load_request_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_load_request_queue__recv__msg;
  logic [0:0] send_to_mem_load_request_queue__recv__rdy;
  logic [0:0] send_to_mem_load_request_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_load_request_queue__send__msg;
  logic [0:0] send_to_mem_load_request_queue__send__rdy;
  logic [0:0] send_to_mem_load_request_queue__send__val;

  ChannelRTL__1970d1f511171c70 send_to_mem_load_request_queue
  (
    .clk( send_to_mem_load_request_queue__clk ),
    .reset( send_to_mem_load_request_queue__reset ),
    .recv__msg( send_to_mem_load_request_queue__recv__msg ),
    .recv__rdy( send_to_mem_load_request_queue__recv__rdy ),
    .recv__val( send_to_mem_load_request_queue__recv__val ),
    .send__msg( send_to_mem_load_request_queue__send__msg ),
    .send__rdy( send_to_mem_load_request_queue__send__rdy ),
    .send__val( send_to_mem_load_request_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component send_to_mem_load_request_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component send_to_mem_store_request_queue
  //-------------------------------------------------------------

  logic [0:0] send_to_mem_store_request_queue__clk;
  logic [0:0] send_to_mem_store_request_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_store_request_queue__recv__msg;
  logic [0:0] send_to_mem_store_request_queue__recv__rdy;
  logic [0:0] send_to_mem_store_request_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_mem_store_request_queue__send__msg;
  logic [0:0] send_to_mem_store_request_queue__send__rdy;
  logic [0:0] send_to_mem_store_request_queue__send__val;

  ChannelRTL__1970d1f511171c70 send_to_mem_store_request_queue
  (
    .clk( send_to_mem_store_request_queue__clk ),
    .reset( send_to_mem_store_request_queue__reset ),
    .recv__msg( send_to_mem_store_request_queue__recv__msg ),
    .recv__rdy( send_to_mem_store_request_queue__recv__rdy ),
    .recv__val( send_to_mem_store_request_queue__recv__val ),
    .send__msg( send_to_mem_store_request_queue__send__msg ),
    .send__rdy( send_to_mem_store_request_queue__send__rdy ),
    .send__val( send_to_mem_store_request_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component send_to_mem_store_request_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component send_to_tile_load_response_queue
  //-------------------------------------------------------------

  logic [0:0] send_to_tile_load_response_queue__clk;
  logic [0:0] send_to_tile_load_response_queue__reset;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_tile_load_response_queue__recv__msg;
  logic [0:0] send_to_tile_load_response_queue__recv__rdy;
  logic [0:0] send_to_tile_load_response_queue__recv__val;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send_to_tile_load_response_queue__send__msg;
  logic [0:0] send_to_tile_load_response_queue__send__rdy;
  logic [0:0] send_to_tile_load_response_queue__send__val;

  ChannelRTL__1970d1f511171c70 send_to_tile_load_response_queue
  (
    .clk( send_to_tile_load_response_queue__clk ),
    .reset( send_to_tile_load_response_queue__reset ),
    .recv__msg( send_to_tile_load_response_queue__recv__msg ),
    .recv__rdy( send_to_tile_load_response_queue__recv__rdy ),
    .recv__val( send_to_tile_load_response_queue__recv__val ),
    .send__msg( send_to_tile_load_response_queue__send__msg ),
    .send__rdy( send_to_tile_load_response_queue__send__rdy ),
    .send__val( send_to_tile_load_response_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component send_to_tile_load_response_queue
  //-------------------------------------------------------------
  logic [0:0] __tmpvar__update_received_msg_kLoadRequestInportIdx;
  logic [0:0] __tmpvar__update_received_msg_kLoadResponseInportIdx;
  logic [1:0] __tmpvar__update_received_msg_kStoreRequestInportIdx;
  logic [1:0] __tmpvar__update_received_msg_kFromCpuCtrlAndDataIdx;
  logic [2:0] __tmpvar__update_received_msg_kFromInterTileRingIdx;
  logic [2:0] __tmpvar__update_received_msg_kFromReduceUnitIdx;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff __tmpvar__update_received_msg_received_pkt;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/ControllerRTL.py:362
  // @update
  // def capture_addr_dst_id():
  //   s.addr_dst_id @= s.addr2controller_lut[trunc(s.crossbar.send[0].msg.inter_cgra_pkt.payload.data_addr >> addr_offset_nbits, CgraIdType)]
  
  always_comb begin : capture_addr_dst_id
    addr_dst_id = addr2controller_lut[2'(crossbar__send__msg[1'd0].inter_cgra_pkt.payload.data_addr >> 2'( __const__addr_offset_nbits_at_capture_addr_dst_id ))];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/ControllerRTL.py:141
  // @update
  // def update_received_msg():
  //   kLoadRequestInportIdx = 0
  //   kLoadResponseInportIdx = 1
  //   kStoreRequestInportIdx = 2
  //   kFromCpuCtrlAndDataIdx = 3
  //   kFromInterTileRingIdx = 4
  //   kFromReduceUnitIdx = 5
  // 
  //   s.send_to_cpu_pkt_queue.recv.val @= 0
  //   s.send_to_cpu_pkt_queue.recv.msg @= IntraCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   s.recv_from_ctrl_ring_pkt.rdy @= 0
  // 
  //   for i in range(CONTROLLER_CROSSBAR_INPORTS):
  //     s.crossbar.recv[i].val @= 0
  //     s.crossbar.recv[i].msg @= ControllerXbarPktType(0, 0)
  // 
  //   # For the command signal from inter-tile/intra-cgra control ring.
  //   s.crossbar.recv[kFromInterTileRingIdx].val @= s.recv_from_ctrl_ring_pkt.val
  //   s.recv_from_ctrl_ring_pkt.rdy @= s.crossbar.recv[kFromInterTileRingIdx].rdy
  //   s.crossbar.recv[kFromInterTileRingIdx].msg @= \
  //       ControllerXbarPktType(0, # dst (always 0 to align with the single outport of the crossbar, i.e., NoC)
  //                             InterCgraPktType(s.cgra_id,
  //                                              s.recv_from_ctrl_ring_pkt.msg.dst_cgra_id,
  //                                              s.idTo2d_x_lut[s.cgra_id], # src_x
  //                                              s.idTo2d_y_lut[s.cgra_id], # src_y
  //                                              s.recv_from_ctrl_ring_pkt.msg.dst_cgra_x, # dst_x
  //                                              s.recv_from_ctrl_ring_pkt.msg.dst_cgra_y, # dst_y
  //                                              s.recv_from_ctrl_ring_pkt.msg.src, # src_tile_id
  //                                              s.recv_from_ctrl_ring_pkt.msg.dst, # dst_tile_id
  //                                              0, # remote_src_port, only used for inter-cgra remote load request/response.
  //                                              0, # opaque
  //                                              0, # vc_id. No need to specify vc_id for self produce-consume pkt thanks to the additional VC buffer.
  //                                              s.recv_from_ctrl_ring_pkt.msg.payload))
  // 
  //   # For the load request from local tiles.
  //   s.crossbar.recv[kLoadRequestInportIdx].val @= s.recv_from_tile_load_request_pkt_queue.send.val
  //   s.recv_from_tile_load_request_pkt_queue.send.rdy @= s.crossbar.recv[kLoadRequestInportIdx].rdy
  //   s.crossbar.recv[kLoadRequestInportIdx].msg @= \
  //       ControllerXbarPktType(0, # dst (always 0 to align with the single outport of the crossbar, i.e., NoC)
  //                             s.recv_from_tile_load_request_pkt_queue.send.msg)
  // 
  //   # For the store request from local tiles.
  //   s.crossbar.recv[kStoreRequestInportIdx].val @= s.recv_from_tile_store_request_pkt_queue.send.val
  //   s.recv_from_tile_store_request_pkt_queue.send.rdy @= s.crossbar.recv[kStoreRequestInportIdx].rdy
  //   s.crossbar.recv[kStoreRequestInportIdx].msg @= \
  //       ControllerXbarPktType(0, # dst (always 0 to align with the single outport of the crossbar, i.e., NoC)
  //                             s.recv_from_tile_store_request_pkt_queue.send.msg)
  // 
  //   # For the load response (i.e., the data towards other) from local memory.
  //   s.crossbar.recv[kLoadResponseInportIdx].val @= \
  //       s.recv_from_tile_load_response_pkt_queue.send.val
  //   s.recv_from_tile_load_response_pkt_queue.send.rdy @= s.crossbar.recv[kLoadResponseInportIdx].rdy
  //   s.crossbar.recv[kLoadResponseInportIdx].msg @= \
  //       ControllerXbarPktType(0, # dst (always 0 to align with the single outport of the crossbar, i.e., NoC)
  //                             s.recv_from_tile_load_response_pkt_queue.send.msg)
  // 
  //   # For the load response (i.e., the data towards other) from local memory.
  //   s.crossbar.recv[kFromReduceUnitIdx].val @= \
  //       s.global_reduce_unit.send.val
  //   s.global_reduce_unit.send.rdy @= s.crossbar.recv[kFromReduceUnitIdx].rdy
  //   s.crossbar.recv[kFromReduceUnitIdx].msg @= s.global_reduce_unit.send.msg
  // 
  //   # For the ctrl and data preloading.
  //   s.crossbar.recv[kFromCpuCtrlAndDataIdx].val @= \
  //       s.recv_from_cpu_pkt_queue.send.val
  //   s.recv_from_cpu_pkt_queue.send.rdy @= s.crossbar.recv[kFromCpuCtrlAndDataIdx].rdy
  //   s.crossbar.recv[kFromCpuCtrlAndDataIdx].msg @= \
  //       ControllerXbarPktType(0, # dst (always 0 to align with the single outport of the crossbar, i.e., NoC)
  //                             InterCgraPktType(s.cgra_id, # src
  //                                              s.recv_from_cpu_pkt_queue.send.msg.dst_cgra_id, # dst
  //                                              0, # src_x
  //                                              0, # src_y
  //                                              s.idTo2d_x_lut[s.recv_from_cpu_pkt_queue.send.msg.dst_cgra_id], # dst_x
  //                                              s.idTo2d_y_lut[s.recv_from_cpu_pkt_queue.send.msg.dst_cgra_id], # dst_y
  //                                              num_tiles, # src_tile_id, num_tiles is used to indicate the request is from CPU, so the LOAD response can come back.
  //                                              s.recv_from_cpu_pkt_queue.send.msg.dst, # dst_tile_id
  //                                              0, # remote_src_port, only used for inter-cgra remote load request/response.
  //                                              0, # opaque
  //                                              0, # vc_id
  //                                              s.recv_from_cpu_pkt_queue.send.msg.payload))
  // 
  //   # TODO: For the other cmd types.
  // 
  // 
  // # @update
  // # def update_received_msg_from_noc():
  // 
  //   # Initiates the signals.
  //   s.send_to_mem_load_request_queue.recv.val @= 0
  //   s.send_to_mem_store_request_queue.recv.val @= 0
  //   s.send_to_tile_load_response_queue.recv.val @= 0
  // 
  //   s.send_to_mem_load_request_queue.recv.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   s.send_to_mem_store_request_queue.recv.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   s.send_to_tile_load_response_queue.recv.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  // 
  //   s.recv_from_inter_cgra_noc.rdy @= 0
  //   s.send_to_ctrl_ring_pkt.val @= 0
  //   s.send_to_ctrl_ring_pkt.msg @= IntraCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   s.global_reduce_unit.recv_count.val @= 0
  //   s.global_reduce_unit.recv_count.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   s.global_reduce_unit.recv_data.val @= 0
  //   s.global_reduce_unit.recv_data.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  // 
  //   # For the load request from NoC.
  //   received_pkt = s.recv_from_inter_cgra_noc.msg
  //   if s.recv_from_inter_cgra_noc.val:
  //     if s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_LOAD_REQUEST:
  //       s.send_to_mem_load_request_queue.recv.val @= 1
  // 
  //       if s.send_to_mem_load_request_queue.recv.rdy:
  //         s.recv_from_inter_cgra_noc.rdy @= 1
  //         s.send_to_mem_load_request_queue.recv.msg @= received_pkt
  // 
  //     elif s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_STORE_REQUEST:
  //       s.send_to_mem_store_request_queue.recv.msg @= received_pkt
  //       s.send_to_mem_store_request_queue.recv.val @= 1
  // 
  //       if s.send_to_mem_store_request_queue.recv.rdy:
  //         s.recv_from_inter_cgra_noc.rdy @= 1
  // 
  //     elif s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_LOAD_RESPONSE:
  //       # FIXME: This condition needs to check whether this controller is the
  //       # one connecting to CPU, and with the help from additional field indicating
  //       # whether the packet is originally from CPU.
  //       # https://github.com/tancheng/VectorCGRA/issues/116.
  //       if s.recv_from_inter_cgra_noc.msg.dst_tile_id == num_tiles:
  //         s.recv_from_inter_cgra_noc.rdy @= s.send_to_cpu_pkt_queue.recv.rdy
  //         s.send_to_cpu_pkt_queue.recv.val @= 1
  //         s.send_to_cpu_pkt_queue.recv.msg @= \
  //             IntraCgraPktType(s.recv_from_inter_cgra_noc.msg.src_tile_id, # src
  //                              s.recv_from_inter_cgra_noc.msg.dst_tile_id, # dst
  //                              s.recv_from_inter_cgra_noc.msg.src, # src_cgra_id
  //                              s.recv_from_inter_cgra_noc.msg.dst, # src_cgra_id
  //                              s.recv_from_inter_cgra_noc.msg.src_x, # src_cgra_x
  //                              s.recv_from_inter_cgra_noc.msg.src_y, # src_cgra_y
  //                              s.recv_from_inter_cgra_noc.msg.dst_x, # dst_cgra_x
  //                              s.recv_from_inter_cgra_noc.msg.dst_y, # dst_cgra_y
  //                              0, # opaque
  //                              0, # vc_id
  //                              s.recv_from_inter_cgra_noc.msg.payload)
  // 
  //       else:
  //         s.recv_from_inter_cgra_noc.rdy @= s.send_to_tile_load_response_queue.recv.rdy
  //         s.send_to_tile_load_response_queue.recv.msg @= received_pkt
  //         s.send_to_tile_load_response_queue.recv.val @= 1
  // 
  //     elif s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_COMPLETE:
  //       s.recv_from_inter_cgra_noc.rdy @= s.send_to_cpu_pkt_queue.recv.rdy
  //       s.send_to_cpu_pkt_queue.recv.val @= 1
  //       s.send_to_cpu_pkt_queue.recv.msg @= \
  //           IntraCgraPktType(s.recv_from_inter_cgra_noc.msg.src_tile_id, # src
  //                            s.recv_from_inter_cgra_noc.msg.dst_tile_id, # dst
  //                            s.recv_from_inter_cgra_noc.msg.src, # src_cgra_id
  //                            s.recv_from_inter_cgra_noc.msg.dst, # src_cgra_id
  //                            s.recv_from_inter_cgra_noc.msg.src_x, # src_cgra_x
  //                            s.recv_from_inter_cgra_noc.msg.src_y, # src_cgra_y
  //                            s.recv_from_inter_cgra_noc.msg.dst_x, # dst_cgra_x
  //                            s.recv_from_inter_cgra_noc.msg.dst_y, # dst_cgra_y
  //                            0, # opaque
  //                            0, # vc_id
  //                            s.recv_from_inter_cgra_noc.msg.payload)
  // 
  //     elif s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD:
  //       s.recv_from_inter_cgra_noc.rdy @= s.global_reduce_unit.recv_data.rdy
  //       s.global_reduce_unit.recv_data.val @= 1
  //       s.global_reduce_unit.recv_data.msg @= s.recv_from_inter_cgra_noc.msg
  // 
  //     elif s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_GLOBAL_REDUCE_COUNT:
  //       s.recv_from_inter_cgra_noc.rdy @= s.global_reduce_unit.recv_count.rdy
  //       s.global_reduce_unit.recv_count.val @= 1
  //       s.global_reduce_unit.recv_count.msg @= s.recv_from_inter_cgra_noc.msg
  // 
  //     elif (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU_CROSSBAR) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_TOTAL_CTRL_COUNT) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_COUNT_PER_ITER) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONFIG_CTRL_LOWER_BOUND) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_CONST) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD_RESPONSE) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL_RESPONSE) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_PAUSE) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_PRESERVE) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_RESUME) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_RECORD_PHI_ADDR) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_TERMINATE) | \
  //          (s.recv_from_inter_cgra_noc.msg.payload.cmd == CMD_LAUNCH):
  //       s.recv_from_inter_cgra_noc.rdy @= s.send_to_ctrl_ring_pkt.rdy
  //       s.send_to_ctrl_ring_pkt.val @= s.recv_from_inter_cgra_noc.val
  //       s.send_to_ctrl_ring_pkt.msg @= \
  //           IntraCgraPktType(s.recv_from_inter_cgra_noc.msg.src_tile_id, # src
  //                            s.recv_from_inter_cgra_noc.msg.dst_tile_id, # dst
  //                            s.recv_from_inter_cgra_noc.msg.src, # src_cgra_id
  //                            s.recv_from_inter_cgra_noc.msg.dst, # src_cgra_id
  //                            s.recv_from_inter_cgra_noc.msg.src_x, # src_cgra_x
  //                            s.recv_from_inter_cgra_noc.msg.src_y, # src_cgra_y
  //                            s.recv_from_inter_cgra_noc.msg.dst_x, # dst_cgra_x
  //                            s.recv_from_inter_cgra_noc.msg.dst_y, # dst_cgra_y
  //                            0, # opaque
  //                            0, # vc_id
  //                            s.recv_from_inter_cgra_noc.msg.payload)
  // 
  //     # else:
  //     #   # TODO: Handle other cmd types.
  //     #   assert(False)
  
  always_comb begin : update_received_msg
    __tmpvar__update_received_msg_kLoadRequestInportIdx = 1'd0;
    __tmpvar__update_received_msg_kLoadResponseInportIdx = 1'd1;
    __tmpvar__update_received_msg_kStoreRequestInportIdx = 2'd2;
    __tmpvar__update_received_msg_kFromCpuCtrlAndDataIdx = 2'd3;
    __tmpvar__update_received_msg_kFromInterTileRingIdx = 3'd4;
    __tmpvar__update_received_msg_kFromReduceUnitIdx = 3'd5;
    send_to_cpu_pkt_queue__recv__val = 1'd0;
    send_to_cpu_pkt_queue__recv__msg = { 3'd0, 3'd0, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, 191'd0 };
    recv_from_ctrl_ring_pkt__rdy = 1'd0;
    for ( int unsigned i = 1'd0; i < 3'( __const__CONTROLLER_CROSSBAR_INPORTS ); i += 1'd1 ) begin
      crossbar__recv__val[3'(i)] = 1'd0;
      crossbar__recv__msg[3'(i)] = { 1'd0, 219'd0 };
    end
    crossbar__recv__val[__tmpvar__update_received_msg_kFromInterTileRingIdx] = recv_from_ctrl_ring_pkt__val;
    recv_from_ctrl_ring_pkt__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kFromInterTileRingIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kFromInterTileRingIdx] = { 1'd0, { cgra_id, recv_from_ctrl_ring_pkt__msg.dst_cgra_id, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], recv_from_ctrl_ring_pkt__msg.dst_cgra_x, recv_from_ctrl_ring_pkt__msg.dst_cgra_y, recv_from_ctrl_ring_pkt__msg.src, recv_from_ctrl_ring_pkt__msg.dst, 2'd0, 8'd0, 2'd0, recv_from_ctrl_ring_pkt__msg.payload } };
    crossbar__recv__val[__tmpvar__update_received_msg_kLoadRequestInportIdx] = recv_from_tile_load_request_pkt_queue__send__val;
    recv_from_tile_load_request_pkt_queue__send__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kLoadRequestInportIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kLoadRequestInportIdx] = { 1'd0, recv_from_tile_load_request_pkt_queue__send__msg };
    crossbar__recv__val[__tmpvar__update_received_msg_kStoreRequestInportIdx] = recv_from_tile_store_request_pkt_queue__send__val;
    recv_from_tile_store_request_pkt_queue__send__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kStoreRequestInportIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kStoreRequestInportIdx] = { 1'd0, recv_from_tile_store_request_pkt_queue__send__msg };
    crossbar__recv__val[__tmpvar__update_received_msg_kLoadResponseInportIdx] = recv_from_tile_load_response_pkt_queue__send__val;
    recv_from_tile_load_response_pkt_queue__send__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kLoadResponseInportIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kLoadResponseInportIdx] = { 1'd0, recv_from_tile_load_response_pkt_queue__send__msg };
    crossbar__recv__val[__tmpvar__update_received_msg_kFromReduceUnitIdx] = global_reduce_unit__send__val;
    global_reduce_unit__send__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kFromReduceUnitIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kFromReduceUnitIdx] = global_reduce_unit__send__msg;
    crossbar__recv__val[__tmpvar__update_received_msg_kFromCpuCtrlAndDataIdx] = recv_from_cpu_pkt_queue__send__val;
    recv_from_cpu_pkt_queue__send__rdy = crossbar__recv__rdy[3'(__tmpvar__update_received_msg_kFromCpuCtrlAndDataIdx)];
    crossbar__recv__msg[__tmpvar__update_received_msg_kFromCpuCtrlAndDataIdx] = { 1'd0, { cgra_id, recv_from_cpu_pkt_queue__send__msg.dst_cgra_id, 2'd0, 1'd0, idTo2d_x_lut[recv_from_cpu_pkt_queue__send__msg.dst_cgra_id], idTo2d_y_lut[recv_from_cpu_pkt_queue__send__msg.dst_cgra_id], 3'( __const__num_tiles_at_update_received_msg ), recv_from_cpu_pkt_queue__send__msg.dst, 2'd0, 8'd0, 2'd0, recv_from_cpu_pkt_queue__send__msg.payload } };
    send_to_mem_load_request_queue__recv__val = 1'd0;
    send_to_mem_store_request_queue__recv__val = 1'd0;
    send_to_tile_load_response_queue__recv__val = 1'd0;
    send_to_mem_load_request_queue__recv__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 3'd0, 3'd0, 2'd0, 8'd0, 2'd0, 191'd0 };
    send_to_mem_store_request_queue__recv__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 3'd0, 3'd0, 2'd0, 8'd0, 2'd0, 191'd0 };
    send_to_tile_load_response_queue__recv__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 3'd0, 3'd0, 2'd0, 8'd0, 2'd0, 191'd0 };
    recv_from_inter_cgra_noc__rdy = 1'd0;
    send_to_ctrl_ring_pkt__val = 1'd0;
    send_to_ctrl_ring_pkt__msg = { 3'd0, 3'd0, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, 191'd0 };
    global_reduce_unit__recv_count__val = 1'd0;
    global_reduce_unit__recv_count__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 3'd0, 3'd0, 2'd0, 8'd0, 2'd0, 191'd0 };
    global_reduce_unit__recv_data__val = 1'd0;
    global_reduce_unit__recv_data__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 3'd0, 3'd0, 2'd0, 8'd0, 2'd0, 191'd0 };
    __tmpvar__update_received_msg_received_pkt = recv_from_inter_cgra_noc__msg;
    if ( recv_from_inter_cgra_noc__val ) begin
      if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_LOAD_REQUEST ) ) begin
        send_to_mem_load_request_queue__recv__val = 1'd1;
        if ( send_to_mem_load_request_queue__recv__rdy ) begin
          recv_from_inter_cgra_noc__rdy = 1'd1;
          send_to_mem_load_request_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
        end
      end
      else if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_STORE_REQUEST ) ) begin
        send_to_mem_store_request_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
        send_to_mem_store_request_queue__recv__val = 1'd1;
        if ( send_to_mem_store_request_queue__recv__rdy ) begin
          recv_from_inter_cgra_noc__rdy = 1'd1;
        end
      end
      else if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_LOAD_RESPONSE ) ) begin
        if ( recv_from_inter_cgra_noc__msg.dst_tile_id == 3'( __const__num_tiles_at_update_received_msg ) ) begin
          recv_from_inter_cgra_noc__rdy = send_to_cpu_pkt_queue__recv__rdy;
          send_to_cpu_pkt_queue__recv__val = 1'd1;
          send_to_cpu_pkt_queue__recv__msg = { recv_from_inter_cgra_noc__msg.src_tile_id, recv_from_inter_cgra_noc__msg.dst_tile_id, recv_from_inter_cgra_noc__msg.src, recv_from_inter_cgra_noc__msg.dst, recv_from_inter_cgra_noc__msg.src_x, recv_from_inter_cgra_noc__msg.src_y, recv_from_inter_cgra_noc__msg.dst_x, recv_from_inter_cgra_noc__msg.dst_y, 8'd0, 1'd0, recv_from_inter_cgra_noc__msg.payload };
        end
        else begin
          recv_from_inter_cgra_noc__rdy = send_to_tile_load_response_queue__recv__rdy;
          send_to_tile_load_response_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
          send_to_tile_load_response_queue__recv__val = 1'd1;
        end
      end
      else if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_COMPLETE ) ) begin
        recv_from_inter_cgra_noc__rdy = send_to_cpu_pkt_queue__recv__rdy;
        send_to_cpu_pkt_queue__recv__val = 1'd1;
        send_to_cpu_pkt_queue__recv__msg = { recv_from_inter_cgra_noc__msg.src_tile_id, recv_from_inter_cgra_noc__msg.dst_tile_id, recv_from_inter_cgra_noc__msg.src, recv_from_inter_cgra_noc__msg.dst, recv_from_inter_cgra_noc__msg.src_x, recv_from_inter_cgra_noc__msg.src_y, recv_from_inter_cgra_noc__msg.dst_x, recv_from_inter_cgra_noc__msg.dst_y, 8'd0, 1'd0, recv_from_inter_cgra_noc__msg.payload };
      end
      else if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD ) ) begin
        recv_from_inter_cgra_noc__rdy = global_reduce_unit__recv_data__rdy;
        global_reduce_unit__recv_data__val = 1'd1;
        global_reduce_unit__recv_data__msg = recv_from_inter_cgra_noc__msg;
      end
      else if ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_COUNT ) ) begin
        recv_from_inter_cgra_noc__rdy = global_reduce_unit__recv_count__rdy;
        global_reduce_unit__recv_count__val = 1'd1;
        global_reduce_unit__recv_count__msg = recv_from_inter_cgra_noc__msg;
      end
      else if ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_TOTAL_CTRL_COUNT ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_COUNT_PER_ITER ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONFIG_CTRL_LOWER_BOUND ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_CONST ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_PAUSE ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_PRESERVE ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_RESUME ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_RECORD_PHI_ADDR ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_TERMINATE ) ) ) | ( recv_from_inter_cgra_noc__msg.payload.cmd == 5'( __const__CMD_LAUNCH ) ) ) begin
        recv_from_inter_cgra_noc__rdy = send_to_ctrl_ring_pkt__rdy;
        send_to_ctrl_ring_pkt__val = recv_from_inter_cgra_noc__val;
        send_to_ctrl_ring_pkt__msg = { recv_from_inter_cgra_noc__msg.src_tile_id, recv_from_inter_cgra_noc__msg.dst_tile_id, recv_from_inter_cgra_noc__msg.src, recv_from_inter_cgra_noc__msg.dst, recv_from_inter_cgra_noc__msg.src_x, recv_from_inter_cgra_noc__msg.src_y, recv_from_inter_cgra_noc__msg.dst_x, recv_from_inter_cgra_noc__msg.dst_y, 8'd0, 1'd0, recv_from_inter_cgra_noc__msg.payload };
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/ControllerRTL.py:350
  // @update
  // def update_sending_to_noc_msg():
  //   s.send_to_inter_cgra_noc.val @= s.crossbar.send[0].val
  //   s.crossbar.send[0].rdy @= s.send_to_inter_cgra_noc.rdy
  //   s.send_to_inter_cgra_noc.msg @= s.crossbar.send[0].msg.inter_cgra_pkt
  //   # addr_dst_id = 0
  //   if (s.crossbar.send[0].msg.inter_cgra_pkt.payload.cmd == CMD_LOAD_REQUEST) | \
  //      (s.crossbar.send[0].msg.inter_cgra_pkt.payload.cmd == CMD_STORE_REQUEST):
  //     s.send_to_inter_cgra_noc.msg.dst @= s.addr_dst_id
  //     s.send_to_inter_cgra_noc.msg.dst_x @= s.idTo2d_x_lut[s.addr_dst_id]
  //     s.send_to_inter_cgra_noc.msg.dst_y @= s.idTo2d_y_lut[s.addr_dst_id]
  
  always_comb begin : update_sending_to_noc_msg
    send_to_inter_cgra_noc__val = crossbar__send__val[1'd0];
    crossbar__send__rdy[1'd0] = send_to_inter_cgra_noc__rdy;
    send_to_inter_cgra_noc__msg = crossbar__send__msg[1'd0].inter_cgra_pkt;
    if ( ( crossbar__send__msg[1'd0].inter_cgra_pkt.payload.cmd == 5'( __const__CMD_LOAD_REQUEST ) ) | ( crossbar__send__msg[1'd0].inter_cgra_pkt.payload.cmd == 5'( __const__CMD_STORE_REQUEST ) ) ) begin
      send_to_inter_cgra_noc__msg.dst = addr_dst_id;
      send_to_inter_cgra_noc__msg.dst_x = idTo2d_x_lut[addr_dst_id];
      send_to_inter_cgra_noc__msg.dst_y = idTo2d_y_lut[addr_dst_id];
    end
  end

  assign recv_from_tile_load_request_pkt_queue__clk = clk;
  assign recv_from_tile_load_request_pkt_queue__reset = reset;
  assign recv_from_tile_load_response_pkt_queue__clk = clk;
  assign recv_from_tile_load_response_pkt_queue__reset = reset;
  assign recv_from_tile_store_request_pkt_queue__clk = clk;
  assign recv_from_tile_store_request_pkt_queue__reset = reset;
  assign send_to_mem_load_request_queue__clk = clk;
  assign send_to_mem_load_request_queue__reset = reset;
  assign send_to_tile_load_response_queue__clk = clk;
  assign send_to_tile_load_response_queue__reset = reset;
  assign send_to_mem_store_request_queue__clk = clk;
  assign send_to_mem_store_request_queue__reset = reset;
  assign crossbar__clk = clk;
  assign crossbar__reset = reset;
  assign recv_from_cpu_pkt_queue__clk = clk;
  assign recv_from_cpu_pkt_queue__reset = reset;
  assign send_to_cpu_pkt_queue__clk = clk;
  assign send_to_cpu_pkt_queue__reset = reset;
  assign global_reduce_unit__clk = clk;
  assign global_reduce_unit__reset = reset;
  assign addr2controller_lut[0] = 2'd0;
  assign addr2controller_lut[1] = 2'd1;
  assign addr2controller_lut[2] = 2'd2;
  assign addr2controller_lut[3] = 2'd3;
  assign idTo2d_x_lut[0] = 2'd0;
  assign idTo2d_y_lut[0] = 1'd0;
  assign idTo2d_x_lut[1] = 2'd1;
  assign idTo2d_y_lut[1] = 1'd0;
  assign idTo2d_x_lut[2] = 2'd2;
  assign idTo2d_y_lut[2] = 1'd0;
  assign idTo2d_x_lut[3] = 2'd3;
  assign idTo2d_y_lut[3] = 1'd0;
  assign recv_from_tile_load_request_pkt_queue__recv__msg = recv_from_tile_load_request_pkt__msg;
  assign recv_from_tile_load_request_pkt__rdy = recv_from_tile_load_request_pkt_queue__recv__rdy;
  assign recv_from_tile_load_request_pkt_queue__recv__val = recv_from_tile_load_request_pkt__val;
  assign recv_from_tile_load_response_pkt_queue__recv__msg = recv_from_tile_load_response_pkt__msg;
  assign recv_from_tile_load_response_pkt__rdy = recv_from_tile_load_response_pkt_queue__recv__rdy;
  assign recv_from_tile_load_response_pkt_queue__recv__val = recv_from_tile_load_response_pkt__val;
  assign recv_from_tile_store_request_pkt_queue__recv__msg = recv_from_tile_store_request_pkt__msg;
  assign recv_from_tile_store_request_pkt__rdy = recv_from_tile_store_request_pkt_queue__recv__rdy;
  assign recv_from_tile_store_request_pkt_queue__recv__val = recv_from_tile_store_request_pkt__val;
  assign send_to_mem_load_request__msg = send_to_mem_load_request_queue__send__msg;
  assign send_to_mem_load_request_queue__send__rdy = send_to_mem_load_request__rdy;
  assign send_to_mem_load_request__val = send_to_mem_load_request_queue__send__val;
  assign send_to_tile_load_response__msg = send_to_tile_load_response_queue__send__msg;
  assign send_to_tile_load_response_queue__send__rdy = send_to_tile_load_response__rdy;
  assign send_to_tile_load_response__val = send_to_tile_load_response_queue__send__val;
  assign send_to_mem_store_request__msg = send_to_mem_store_request_queue__send__msg;
  assign send_to_mem_store_request_queue__send__rdy = send_to_mem_store_request__rdy;
  assign send_to_mem_store_request__val = send_to_mem_store_request_queue__send__val;
  assign recv_from_cpu_pkt_queue__recv__msg = recv_from_cpu_pkt__msg;
  assign recv_from_cpu_pkt__rdy = recv_from_cpu_pkt_queue__recv__rdy;
  assign recv_from_cpu_pkt_queue__recv__val = recv_from_cpu_pkt__val;
  assign send_to_cpu_pkt__msg = send_to_cpu_pkt_queue__send__msg;
  assign send_to_cpu_pkt_queue__send__rdy = send_to_cpu_pkt__rdy;
  assign send_to_cpu_pkt__val = send_to_cpu_pkt_queue__send__val;

endmodule