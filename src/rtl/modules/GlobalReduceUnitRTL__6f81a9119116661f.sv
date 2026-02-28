module GlobalReduceUnitRTL__6f81a9119116661f
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_count__msg  ,
  output logic [0:0] recv_count__rdy  ,
  input logic [0:0] recv_count__val  ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_data__msg  ,
  output logic [0:0] recv_data__rdy  ,
  input logic [0:0] recv_data__val  ,
  output ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD  = 5'd18;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE  = 5'd20;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_MUL  = 5'd19;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE  = 5'd21;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 receiving_count;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reduce_add_value;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reduce_mul_value;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 sending_count;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 target_count;
  //-------------------------------------------------------------
  // Component queue
  //-------------------------------------------------------------

  logic [0:0] queue__clk;
  logic [4:0] queue__count;
  logic [0:0] queue__reset;
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b queue__recv__msg;
  logic [0:0] queue__recv__rdy;
  logic [0:0] queue__recv__val;
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b queue__send__msg;
  logic [0:0] queue__send__rdy;
  logic [0:0] queue__send__val;

  NormalQueueRTL__52a8ec1b3572dd66 queue
  (
    .clk( queue__clk ),
    .count( queue__count ),
    .reset( queue__reset ),
    .recv__msg( queue__recv__msg ),
    .recv__rdy( queue__recv__rdy ),
    .recv__val( queue__recv__val ),
    .send__msg( queue__send__msg ),
    .send__rdy( queue__send__rdy ),
    .send__val( queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component queue
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/GlobalReduceUnitRTL.py:45
  // @update
  // def set_recv_rdy():
  //   s.recv_data.rdy @= 0
  //   s.queue.recv.val @= 0
  //   s.queue.recv.msg @= InterCgraPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //   if s.target_count.payload > s.receiving_count.payload:
  //     s.recv_data.rdy @= s.queue.recv.rdy
  //     s.queue.recv.msg @= s.recv_data.msg
  //     s.queue.recv.val @= s.recv_data.val
  
  always_comb begin : set_recv_rdy
    recv_data__rdy = 1'd0;
    queue__recv__val = 1'd0;
    queue__recv__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 9'd0, 9'd0, 5'd0, 8'd0, 2'd0, 191'd0 };
    if ( target_count.payload > receiving_count.payload ) begin
      recv_data__rdy = queue__recv__rdy;
      queue__recv__msg = recv_data__msg;
      queue__recv__val = recv_data__val;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/GlobalReduceUnitRTL.py:74
  // @update
  // def update_send():
  //   s.send.msg @= ControllerXbarPktType(0, 0)
  //   s.send.val @= 0
  //   s.queue.send.rdy @= 0
  //   if (s.target_count.payload > 0) & (s.receiving_count.payload == s.target_count.payload):
  //     # Updates the cmd type, result value, and src/dst.
  //     if s.queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD:
  //       s.send.msg.inter_cgra_pkt.payload.cmd @= CMD_GLOBAL_REDUCE_ADD_RESPONSE
  //       s.send.msg.inter_cgra_pkt.payload.data @= s.reduce_add_value
  //     elif s.queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL:
  //       s.send.msg.inter_cgra_pkt.payload.cmd @= CMD_GLOBAL_REDUCE_MUL_RESPONSE
  //       s.send.msg.inter_cgra_pkt.payload.data @= s.reduce_mul_value
  //     s.send.msg.inter_cgra_pkt.src @= s.queue.send.msg.dst
  //     s.send.msg.inter_cgra_pkt.dst @= s.queue.send.msg.src
  //     s.send.msg.inter_cgra_pkt.src_x @= s.queue.send.msg.dst_x
  //     s.send.msg.inter_cgra_pkt.src_y @= s.queue.send.msg.dst_y
  //     s.send.msg.inter_cgra_pkt.dst_x @= s.queue.send.msg.src_x
  //     s.send.msg.inter_cgra_pkt.dst_y @= s.queue.send.msg.src_y
  //     s.send.msg.inter_cgra_pkt.src_tile_id @= s.queue.send.msg.dst_tile_id
  //     s.send.msg.inter_cgra_pkt.dst_tile_id @= s.queue.send.msg.src_tile_id
  //     s.queue.send.rdy @= s.send.rdy
  //     s.send.val @= s.queue.send.val
  
  always_comb begin : update_send
    send__msg = { 1'd0, 234'd0 };
    send__val = 1'd0;
    queue__send__rdy = 1'd0;
    if ( ( target_count.payload > 32'd0 ) & ( receiving_count.payload == target_count.payload ) ) begin
      if ( queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD ) ) begin
        send__msg.inter_cgra_pkt.payload.cmd = 5'( __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE );
        send__msg.inter_cgra_pkt.payload.data = reduce_add_value;
      end
      else if ( queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL ) ) begin
        send__msg.inter_cgra_pkt.payload.cmd = 5'( __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE );
        send__msg.inter_cgra_pkt.payload.data = reduce_mul_value;
      end
      send__msg.inter_cgra_pkt.src = queue__send__msg.dst;
      send__msg.inter_cgra_pkt.dst = queue__send__msg.src;
      send__msg.inter_cgra_pkt.src_x = queue__send__msg.dst_x;
      send__msg.inter_cgra_pkt.src_y = queue__send__msg.dst_y;
      send__msg.inter_cgra_pkt.dst_x = queue__send__msg.src_x;
      send__msg.inter_cgra_pkt.dst_y = queue__send__msg.src_y;
      send__msg.inter_cgra_pkt.src_tile_id = queue__send__msg.dst_tile_id;
      send__msg.inter_cgra_pkt.dst_tile_id = queue__send__msg.src_tile_id;
      queue__send__rdy = send__rdy;
      send__val = queue__send__val;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/GlobalReduceUnitRTL.py:98
  // @update_ff
  // def accumulate_value():
  //   if s.reset | (s.sending_count == s.target_count):
  //     s.reduce_add_value <<= DataType(0, 0, 0, 0)
  //     s.reduce_mul_value <<= DataType(1, 0, 0, 0)
  //   else:
  //     if s.recv_data.val & \
  //        s.recv_data.rdy:
  //       if s.recv_data.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD:
  //         s.reduce_add_value <<= DataType(s.reduce_add_value.payload + s.recv_data.msg.payload.data.payload,
  //                                         s.recv_data.msg.payload.data.predicate,
  //                                         0,
  //                                         0)
  //       elif s.recv_data.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL:
  //         s.reduce_mul_value <<= DataType(s.reduce_mul_value.payload * s.recv_data.msg.payload.data.payload,
  //                                         s.recv_data.msg.payload.data.predicate,
  //                                         0,
  //                                         0)
  
  always_ff @(posedge clk) begin : accumulate_value
    if ( reset | ( sending_count == target_count ) ) begin
      reduce_add_value <= { 32'd0, 1'd0, 1'd0, 1'd0 };
      reduce_mul_value <= { 32'd1, 1'd0, 1'd0, 1'd0 };
    end
    else if ( recv_data__val & recv_data__rdy ) begin
      if ( recv_data__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD ) ) begin
        reduce_add_value <= { reduce_add_value.payload + recv_data__msg.payload.data.payload, recv_data__msg.payload.data.predicate, 1'd0, 1'd0 };
      end
      else if ( recv_data__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL ) ) begin
        reduce_mul_value <= { reduce_mul_value.payload * recv_data__msg.payload.data.payload, recv_data__msg.payload.data.predicate, 1'd0, 1'd0 };
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/controller/GlobalReduceUnitRTL.py:55
  // @update_ff
  // def update_count():
  //   if s.reset:
  //     s.target_count <<= DataType(0, 0, 0, 0)
  //     s.receiving_count <<= DataType(0, 0, 0, 0)
  //     s.sending_count <<= DataType(0, 0, 0, 0)
  //   else:
  //     if s.recv_count.val & s.recv_count.rdy:
  //       s.target_count <<= DataType(s.recv_count.msg.payload.data.payload, 0, 0, 0)
  //     if s.recv_data.val & s.recv_data.rdy:
  //       s.receiving_count <<= DataType(s.receiving_count.payload + 1, 0, 0, 0)
  //     if s.send.rdy & s.send.val:
  //       s.sending_count <<= DataType(s.sending_count.payload + 1, 0, 0, 0)
  //     elif (s.sending_count == s.receiving_count) & \
  //          (s.sending_count == s.target_count) & \
  //          (s.target_count.payload > 0):
  //       s.sending_count <<= DataType(0, 0, 0, 0)
  //       s.receiving_count <<= DataType(0, 0, 0, 0)
  
  always_ff @(posedge clk) begin : update_count
    if ( reset ) begin
      target_count <= { 32'd0, 1'd0, 1'd0, 1'd0 };
      receiving_count <= { 32'd0, 1'd0, 1'd0, 1'd0 };
      sending_count <= { 32'd0, 1'd0, 1'd0, 1'd0 };
    end
    else begin
      if ( recv_count__val & recv_count__rdy ) begin
        target_count <= { recv_count__msg.payload.data.payload, 1'd0, 1'd0, 1'd0 };
      end
      if ( recv_data__val & recv_data__rdy ) begin
        receiving_count <= { receiving_count.payload + 32'd1, 1'd0, 1'd0, 1'd0 };
      end
      if ( send__rdy & send__val ) begin
        sending_count <= { sending_count.payload + 32'd1, 1'd0, 1'd0, 1'd0 };
      end
      else if ( ( ( sending_count == receiving_count ) & ( sending_count == target_count ) ) & ( target_count.payload > 32'd0 ) ) begin
        sending_count <= { 32'd0, 1'd0, 1'd0, 1'd0 };
        receiving_count <= { 32'd0, 1'd0, 1'd0, 1'd0 };
      end
    end
  end

  assign queue__clk = clk;
  assign queue__reset = reset;
  assign recv_count__rdy = 1'd1;

endmodule