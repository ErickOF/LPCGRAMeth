module CtrlMemDynamicRTL__06f86f060b697c96
import cgra_pkg::*;
(
  input  logic [1:0] cgra_id ,
  input  logic [0:0] clk ,
  output logic [2:0] ctrl_addr_outport ,
  output logic [2:0] prologue_count_outport_fu ,
  output logic [2:0] prologue_count_outport_fu_crossbar [0:7][0:1],
  output logic [2:0] prologue_count_outport_routing_crossbar [0:7][0:7],
  input  logic [0:0] reset ,
  input  logic [2:0] tile_id ,
  input MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f recv_from_element__msg  ,
  output logic [0:0] recv_from_element__rdy  ,
  input logic [0:0] recv_from_element__val  ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_pkt_from_controller__msg  ,
  output logic [0:0] recv_pkt_from_controller__rdy  ,
  input logic [0:0] recv_pkt_from_controller__val  ,
  output CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f send_ctrl__msg  ,
  input logic [0:0] send_ctrl__rdy  ,
  output logic [0:0] send_ctrl__val  ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send_pkt_to_controller__msg  ,
  input logic [0:0] send_pkt_to_controller__rdy  ,
  output logic [0:0] send_pkt_to_controller__val  ,
  output MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f send_to_element__msg  ,
  input logic [0:0] send_to_element__rdy  ,
  output logic [0:0] send_to_element__val  
);
  localparam logic [2:0] __const__num_fu_inports_at_update_msg  = 3'd4;
  localparam logic [3:0] __const__num_routing_outports_at_update_msg  = 4'd12;
  localparam logic [1:0] __const__CMD_CONFIG  = 2'd3;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE  = 5'd20;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE  = 5'd21;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU  = 3'd4;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR  = 3'd5;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR  = 3'd6;
  localparam logic [0:0] __const__CMD_LAUNCH  = 1'd0;
  localparam logic [1:0] __const__CMD_TERMINATE  = 2'd2;
  localparam logic [0:0] __const__CMD_PAUSE  = 1'd1;
  localparam logic [4:0] __const__CMD_PRESERVE  = 5'd22;
  localparam logic [3:0] __const__CMD_RESUME  = 4'd15;
  localparam logic [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT  = 3'd7;
  localparam logic [3:0] __const__CMD_CONFIG_COUNT_PER_ITER  = 4'd8;
  localparam logic [3:0] __const__CMD_CONFIG_CTRL_LOWER_BOUND  = 4'd9;
  localparam logic [4:0] __const__CMD_RECORD_PHI_ADDR  = 5'd16;
  localparam logic [2:0] __const__num_tiles_at_update_send_pkt_to_controller  = 3'd4;
  localparam logic [3:0] __const__CMD_COMPLETE  = 4'd14;
  localparam logic [6:0] __const__OPT_START  = 7'd0;
  localparam logic [3:0] __const__ctrl_mem_size_at_update_raddr_and_fu_prologue  = 4'd8;
  localparam logic [3:0] __const__ctrl_mem_size_at_update_prologue_outport  = 4'd8;
  localparam logic [3:0] __const__num_tile_inports_at_update_prologue_outport  = 4'd8;
  localparam logic [1:0] __const__num_fu_outports_at_update_prologue_outport  = 2'd2;
  localparam logic [3:0] __const__ctrl_mem_size_at_update_prologue_reg  = 4'd8;
  localparam logic [3:0] __const__num_tile_inports_at_update_prologue_reg  = 4'd8;
  localparam logic [1:0] __const__num_fu_outports_at_update_prologue_reg  = 2'd2;
  localparam logic [3:0] __const__ctrl_count_per_iter_at_update_ctrl_count_per_iter  = 4'd8;
  localparam logic [3:0] __const__total_ctrl_steps_at_update_total_ctrl_steps  = 4'd8;
  logic [2:0] ctrl_count_lower_bound;
  logic [3:0] ctrl_count_per_iter_val;
  logic [3:0] ctrl_count_upper_bound;
  logic [2:0] prologue_count_reg_fu [0:7];
  logic [2:0] prologue_count_reg_fu_crossbar [0:7][0:1];
  logic [2:0] prologue_count_reg_routing_crossbar [0:7][0:7];
  logic [0:0] sent_complete;
  logic [0:0] start_iterate_ctrl;
  logic [10:0] times;
  logic [10:0] total_ctrl_steps_val;
  //-------------------------------------------------------------
  // Component recv_from_element_queue
  //-------------------------------------------------------------

  logic [0:0] recv_from_element_queue__clk;
  logic [1:0] recv_from_element_queue__count;
  logic [0:0] recv_from_element_queue__reset;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f recv_from_element_queue__recv__msg;
  logic [0:0] recv_from_element_queue__recv__rdy;
  logic [0:0] recv_from_element_queue__recv__val;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f recv_from_element_queue__send__msg;
  logic [0:0] recv_from_element_queue__send__rdy;
  logic [0:0] recv_from_element_queue__send__val;

  NormalQueueRTL__2d36eadf4911a62a recv_from_element_queue
  (
    .clk( recv_from_element_queue__clk ),
    .count( recv_from_element_queue__count ),
    .reset( recv_from_element_queue__reset ),
    .recv__msg( recv_from_element_queue__recv__msg ),
    .recv__rdy( recv_from_element_queue__recv__rdy ),
    .recv__val( recv_from_element_queue__recv__val ),
    .send__msg( recv_from_element_queue__send__msg ),
    .send__rdy( recv_from_element_queue__send__rdy ),
    .send__val( recv_from_element_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_from_element_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component recv_pkt_from_controller_queue
  //-------------------------------------------------------------

  logic [0:0] recv_pkt_from_controller_queue__clk;
  logic [1:0] recv_pkt_from_controller_queue__count;
  logic [0:0] recv_pkt_from_controller_queue__reset;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_pkt_from_controller_queue__recv__msg;
  logic [0:0] recv_pkt_from_controller_queue__recv__rdy;
  logic [0:0] recv_pkt_from_controller_queue__recv__val;
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv_pkt_from_controller_queue__send__msg;
  logic [0:0] recv_pkt_from_controller_queue__send__rdy;
  logic [0:0] recv_pkt_from_controller_queue__send__val;

  NormalQueueRTL__4d91d5ee0229de22 recv_pkt_from_controller_queue
  (
    .clk( recv_pkt_from_controller_queue__clk ),
    .count( recv_pkt_from_controller_queue__count ),
    .reset( recv_pkt_from_controller_queue__reset ),
    .recv__msg( recv_pkt_from_controller_queue__recv__msg ),
    .recv__rdy( recv_pkt_from_controller_queue__recv__rdy ),
    .recv__val( recv_pkt_from_controller_queue__recv__val ),
    .send__msg( recv_pkt_from_controller_queue__send__msg ),
    .send__rdy( recv_pkt_from_controller_queue__send__rdy ),
    .send__val( recv_pkt_from_controller_queue__send__val )
  );

  //-------------------------------------------------------------
  // End of component recv_pkt_from_controller_queue
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk;
  logic [2:0] reg_file__raddr [0:0];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f reg_file__rdata [0:0];
  logic [0:0] reg_file__reset;
  logic [2:0] reg_file__waddr [0:0];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f reg_file__wdata [0:0];
  logic [0:0] reg_file__wen [0:0];

  RegisterFile__1d4e07673f8d2d02 reg_file
  (
    .clk( reg_file__clk ),
    .raddr( reg_file__raddr ),
    .rdata( reg_file__rdata ),
    .reset( reg_file__reset ),
    .waddr( reg_file__waddr ),
    .wdata( reg_file__wdata ),
    .wen( reg_file__wen )
  );

  //-------------------------------------------------------------
  // End of component reg_file
  //-------------------------------------------------------------
  logic [3:0] __tmpvar__update_prologue_reg_temp_routing_crossbar_in;
  logic [1:0] __tmpvar__update_prologue_reg_temp_fu_crossbar_in;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:157
  // @update
  // def update_ctrl_addr_outport():
  //   s.ctrl_addr_outport @= s.reg_file.raddr[0]
  
  always_comb begin : update_ctrl_addr_outport
    ctrl_addr_outport = reg_file__raddr[1'd0];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:94
  // @update
  // def update_msg():
  //   s.recv_pkt_from_controller_queue.send.rdy @= 0
  //   s.send_to_element.msg @= CgraPayloadType(0, 0, 0, 0, 0)
  //   s.send_to_element.val @= 0
  //   s.reg_file.wen[0] @= 0
  //   s.reg_file.waddr[0] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl_addr
  //   # Initializes the fields of the control signal.
  //   s.reg_file.wdata[0].operation @= 0
  //   for i in range(num_fu_inports):
  //     s.reg_file.wdata[0].fu_in[i] @= 0
  //     s.reg_file.wdata[0].write_reg_from[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.write_reg_from[i]
  //     s.reg_file.wdata[0].write_reg_idx[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.write_reg_idx[i]
  //     s.reg_file.wdata[0].read_reg_from[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.read_reg_from[i]
  //     s.reg_file.wdata[0].read_reg_idx[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.read_reg_idx[i]
  //   for i in range(num_routing_outports):
  //     s.reg_file.wdata[0].routing_xbar_outport[i] @= 0
  //     s.reg_file.wdata[0].fu_xbar_outport[i] @= 0
  //   s.reg_file.wdata[0].vector_factor_power @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.vector_factor_power
  //   s.reg_file.wdata[0].is_last_ctrl @= 0
  // 
  //   if s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG):
  //     s.reg_file.wen[0] @= 1
  //     s.reg_file.waddr[0] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl_addr
  //     # Fills the fields of the control signal.
  //     s.reg_file.wdata[0].operation @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.operation
  //     for i in range(num_fu_inports):
  //       s.reg_file.wdata[0].fu_in[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.fu_in[i]
  //       s.reg_file.wdata[0].write_reg_from[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.write_reg_from[i]
  //       s.reg_file.wdata[0].write_reg_idx[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.write_reg_idx[i]
  //       s.reg_file.wdata[0].read_reg_from[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.read_reg_from[i]
  //       s.reg_file.wdata[0].read_reg_idx[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.read_reg_idx[i]
  //     for i in range(num_routing_outports):
  //       s.reg_file.wdata[0].routing_xbar_outport[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.routing_xbar_outport[i]
  //       s.reg_file.wdata[0].fu_xbar_outport[i] @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.fu_xbar_outport[i]
  //     s.reg_file.wdata[0].vector_factor_power @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.vector_factor_power
  //     s.reg_file.wdata[0].is_last_ctrl @= s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.is_last_ctrl
  //   elif s.recv_pkt_from_controller_queue.send.val & \
  //        ((s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD_RESPONSE) | \
  //         (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL_RESPONSE)):
  //     s.send_to_element.msg @= s.recv_pkt_from_controller_queue.send.msg.payload
  //     s.send_to_element.val @= 1
  // 
  //   if (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU_CROSSBAR) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_LAUNCH) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_TERMINATE) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_PAUSE) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_PRESERVE) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_RESUME) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_TOTAL_CTRL_COUNT) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_COUNT_PER_ITER) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_CTRL_LOWER_BOUND) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_RECORD_PHI_ADDR) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD_RESPONSE) | \
  //      (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL_RESPONSE):
  //     s.recv_pkt_from_controller_queue.send.rdy @= 1
  //   # TODO: Extend for the other commands. Maybe another queue to
  //   # handle complicated actions.
  //   # else:
  
  always_comb begin : update_msg
    recv_pkt_from_controller_queue__send__rdy = 1'd0;
    send_to_element__msg = { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 };
    send_to_element__val = 1'd0;
    reg_file__wen[1'd0] = 1'd0;
    reg_file__waddr[1'd0] = recv_pkt_from_controller_queue__send__msg.payload.ctrl_addr;
    reg_file__wdata[1'd0].operation = 7'd0;
    for ( int unsigned i = 1'd0; i < 3'( __const__num_fu_inports_at_update_msg ); i += 1'd1 ) begin
      reg_file__wdata[1'd0].fu_in[2'(i)] = 3'd0;
      reg_file__wdata[1'd0].write_reg_from[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.write_reg_from[2'(i)];
      reg_file__wdata[1'd0].write_reg_idx[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.write_reg_idx[2'(i)];
      reg_file__wdata[1'd0].read_reg_from[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.read_reg_from[2'(i)];
      reg_file__wdata[1'd0].read_reg_idx[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.read_reg_idx[2'(i)];
    end
    for ( int unsigned i = 1'd0; i < 4'( __const__num_routing_outports_at_update_msg ); i += 1'd1 ) begin
      reg_file__wdata[1'd0].routing_xbar_outport[4'(i)] = 4'd0;
      reg_file__wdata[1'd0].fu_xbar_outport[4'(i)] = 2'd0;
    end
    reg_file__wdata[1'd0].vector_factor_power = recv_pkt_from_controller_queue__send__msg.payload.ctrl.vector_factor_power;
    reg_file__wdata[1'd0].is_last_ctrl = 1'd0;
    if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG ) ) ) begin
      reg_file__wen[1'd0] = 1'd1;
      reg_file__waddr[1'd0] = recv_pkt_from_controller_queue__send__msg.payload.ctrl_addr;
      reg_file__wdata[1'd0].operation = recv_pkt_from_controller_queue__send__msg.payload.ctrl.operation;
      for ( int unsigned i = 1'd0; i < 3'( __const__num_fu_inports_at_update_msg ); i += 1'd1 ) begin
        reg_file__wdata[1'd0].fu_in[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.fu_in[2'(i)];
        reg_file__wdata[1'd0].write_reg_from[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.write_reg_from[2'(i)];
        reg_file__wdata[1'd0].write_reg_idx[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.write_reg_idx[2'(i)];
        reg_file__wdata[1'd0].read_reg_from[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.read_reg_from[2'(i)];
        reg_file__wdata[1'd0].read_reg_idx[2'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.read_reg_idx[2'(i)];
      end
      for ( int unsigned i = 1'd0; i < 4'( __const__num_routing_outports_at_update_msg ); i += 1'd1 ) begin
        reg_file__wdata[1'd0].routing_xbar_outport[4'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.routing_xbar_outport[4'(i)];
        reg_file__wdata[1'd0].fu_xbar_outport[4'(i)] = recv_pkt_from_controller_queue__send__msg.payload.ctrl.fu_xbar_outport[4'(i)];
      end
      reg_file__wdata[1'd0].vector_factor_power = recv_pkt_from_controller_queue__send__msg.payload.ctrl.vector_factor_power;
      reg_file__wdata[1'd0].is_last_ctrl = recv_pkt_from_controller_queue__send__msg.payload.ctrl.is_last_ctrl;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE ) ) ) ) begin
      send_to_element__msg = recv_pkt_from_controller_queue__send__msg.payload;
      send_to_element__val = 1'd1;
    end
    if ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_LAUNCH ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_TERMINATE ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_PAUSE ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_PRESERVE ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_RESUME ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_TOTAL_CTRL_COUNT ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_COUNT_PER_ITER ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_CTRL_LOWER_BOUND ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_RECORD_PHI_ADDR ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE ) ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE ) ) ) begin
      recv_pkt_from_controller_queue__send__rdy = 1'd1;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:255
  // @update
  // def update_prologue_outport():
  //   s.prologue_count_outport_fu @= s.prologue_count_reg_fu[s.reg_file.raddr[0]]
  //   for addr in range(ctrl_mem_size):
  //     for i in range(num_tile_inports):
  //       s.prologue_count_outport_routing_crossbar[addr][i] @= \
  //           s.prologue_count_reg_routing_crossbar[addr][i]
  //     for i in range(num_fu_outports):
  //       s.prologue_count_outport_fu_crossbar[addr][i] @= \
  //           s.prologue_count_reg_fu_crossbar[addr][i]
  
  always_comb begin : update_prologue_outport
    prologue_count_outport_fu = prologue_count_reg_fu[reg_file__raddr[1'd0]];
    for ( int unsigned addr = 1'd0; addr < 4'( __const__ctrl_mem_size_at_update_prologue_outport ); addr += 1'd1 ) begin
      for ( int unsigned i = 1'd0; i < 4'( __const__num_tile_inports_at_update_prologue_outport ); i += 1'd1 )
        prologue_count_outport_routing_crossbar[3'(addr)][3'(i)] = prologue_count_reg_routing_crossbar[3'(addr)][3'(i)];
      for ( int unsigned i = 1'd0; i < 2'( __const__num_fu_outports_at_update_prologue_outport ); i += 1'd1 )
        prologue_count_outport_fu_crossbar[3'(addr)][1'(i)] = prologue_count_reg_fu_crossbar[3'(addr)][1'(i)];
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:181
  // @update
  // def update_send_ctrl():
  //   s.send_ctrl.val @= 0
  //   if s.start_iterate_ctrl == b1(1):
  //     if s.sent_complete:
  //       s.send_ctrl.val @= 0
  //     elif ((s.total_ctrl_steps_val > 0) & (s.times == s.total_ctrl_steps_val)) | \
  //        (s.reg_file.rdata[0].operation == OPT_START):
  //       s.send_ctrl.val @= b1(0)
  //     else:
  //       s.send_ctrl.val @= 1
  //   if s.recv_pkt_from_controller_queue.send.val & \
  //       (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_TERMINATE):
  //     s.send_ctrl.val @= b1(0)
  
  always_comb begin : update_send_ctrl
    send_ctrl__val = 1'd0;
    if ( start_iterate_ctrl == 1'd1 ) begin
      if ( sent_complete ) begin
        send_ctrl__val = 1'd0;
      end
      else if ( ( ( total_ctrl_steps_val > 11'd0 ) & ( times == total_ctrl_steps_val ) ) | ( reg_file__rdata[1'd0].operation == 7'( __const__OPT_START ) ) ) begin
        send_ctrl__val = 1'd0;
      end
      else
        send_ctrl__val = 1'd1;
    end
    if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_TERMINATE ) ) ) begin
      send_ctrl__val = 1'd0;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:161
  // @update
  // def update_send_pkt_to_controller():
  //   s.send_pkt_to_controller.val @= 0
  //   s.send_pkt_to_controller.msg @= IntraCgraPktType(0, num_tiles, 0, 0, 0, 0, 0, 0, 0, 0, CgraPayloadType(CMD_COMPLETE, 0, 0, 0, 0))
  //   s.recv_from_element_queue.send.rdy @= 0
  //   if s.start_iterate_ctrl == b1(1):
  //     if s.recv_from_element_queue.send.val & (~s.sent_complete):
  //       s.send_pkt_to_controller.msg @= \
  //           IntraCgraPktType(s.tile_id, num_tiles, 0, 0, 0, 0, 0, 0, 0, 0,
  //                            s.recv_from_element_queue.send.msg)
  //       s.send_pkt_to_controller.val @= 1
  //       s.recv_from_element_queue.send.rdy @= s.send_pkt_to_controller.rdy
  //     elif ((s.total_ctrl_steps_val > 0) & (s.times == s.total_ctrl_steps_val)) | \
  //        (s.reg_file.rdata[0].operation == OPT_START):
  //       # Sends COMPLETE signal to Controller when the last ctrl signal is done.
  //       if ~s.sent_complete & (s.total_ctrl_steps_val > 0) & (s.times == s.total_ctrl_steps_val) & s.start_iterate_ctrl:
  //         s.send_pkt_to_controller.msg @= \
  //             IntraCgraPktType(s.tile_id, num_tiles, 0, 0, 0, 0, 0, 0, 0, 0, CgraPayloadType(CMD_COMPLETE, 0, 0, 0, 0))
  //         s.send_pkt_to_controller.val @= 1
  
  always_comb begin : update_send_pkt_to_controller
    send_pkt_to_controller__val = 1'd0;
    send_pkt_to_controller__msg = { 3'd0, 3'( __const__num_tiles_at_update_send_pkt_to_controller ), 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, { 5'( __const__CMD_COMPLETE ), 35'd0, 9'd0, 139'd0, 3'd0 } };
    recv_from_element_queue__send__rdy = 1'd0;
    if ( start_iterate_ctrl == 1'd1 ) begin
      if ( recv_from_element_queue__send__val & ( ~sent_complete ) ) begin
        send_pkt_to_controller__msg = { tile_id, 3'( __const__num_tiles_at_update_send_pkt_to_controller ), 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, recv_from_element_queue__send__msg };
        send_pkt_to_controller__val = 1'd1;
        recv_from_element_queue__send__rdy = send_pkt_to_controller__rdy;
      end
      else if ( ( ( total_ctrl_steps_val > 11'd0 ) & ( times == total_ctrl_steps_val ) ) | ( reg_file__rdata[1'd0].operation == 7'( __const__OPT_START ) ) ) begin
        if ( ( ( ( ~sent_complete ) & ( total_ctrl_steps_val > 11'd0 ) ) & ( times == total_ctrl_steps_val ) ) & start_iterate_ctrl ) begin
          send_pkt_to_controller__msg = { tile_id, 3'( __const__num_tiles_at_update_send_pkt_to_controller ), 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, { 5'( __const__CMD_COMPLETE ), 35'd0, 9'd0, 139'd0, 3'd0 } };
          send_pkt_to_controller__val = 1'd1;
        end
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:298
  // @update
  // def update_upper_bound():
  //   s.ctrl_count_upper_bound @= zext(s.ctrl_count_lower_bound, UpperBoundType) + zext(s.ctrl_count_per_iter_val, UpperBoundType)
  
  always_comb begin : update_upper_bound
    ctrl_count_upper_bound = { { 1 { 1'b0 } }, ctrl_count_lower_bound } + ctrl_count_per_iter_val;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:210
  // @update_ff
  // def issue_complete():
  //   if s.reset:
  //     s.sent_complete <<= 0
  //   else:
  //     if s.send_pkt_to_controller.val & \
  //        s.send_pkt_to_controller.rdy & \
  //        (s.send_pkt_to_controller.msg.payload.cmd == CMD_COMPLETE):
  //       s.sent_complete <<= 1
  //     elif s.recv_pkt_from_controller_queue.send.val & ( (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_LAUNCH) | \
  //             (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_RESUME) ):
  //       s.sent_complete <<= 0
  
  always_ff @(posedge clk) begin : issue_complete
    if ( reset ) begin
      sent_complete <= 1'd0;
    end
    else if ( ( send_pkt_to_controller__val & send_pkt_to_controller__rdy ) & ( send_pkt_to_controller__msg.payload.cmd == 5'( __const__CMD_COMPLETE ) ) ) begin
      sent_complete <= 1'd1;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_LAUNCH ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_RESUME ) ) ) ) begin
      sent_complete <= 1'd0;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:284
  // @update_ff
  // def update_ctrl_count_per_iter():
  //   if s.reset:
  //     s.ctrl_count_per_iter_val <<= PCType(ctrl_count_per_iter)
  //   elif s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_COUNT_PER_ITER):
  //     s.ctrl_count_per_iter_val <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, PCType)
  
  always_ff @(posedge clk) begin : update_ctrl_count_per_iter
    if ( reset ) begin
      ctrl_count_per_iter_val <= 4'd8;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_COUNT_PER_ITER ) ) ) begin
      ctrl_count_per_iter_val <= 4'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:291
  // @update_ff
  // def update_lower_bound():
  //   if s.reset:
  //     s.ctrl_count_lower_bound <<= CtrlAddrType(0)
  //   elif s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_CTRL_LOWER_BOUND):
  //     s.ctrl_count_lower_bound <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, CtrlAddrType)
  
  always_ff @(posedge clk) begin : update_lower_bound
    if ( reset ) begin
      ctrl_count_lower_bound <= 3'd0;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_CTRL_LOWER_BOUND ) ) ) begin
      ctrl_count_lower_bound <= 3'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:266
  // @update_ff
  // def update_prologue_reg():
  //   if s.reset:
  //     for addr in range(ctrl_mem_size):
  //       for i in range(num_tile_inports):
  //         s.prologue_count_reg_routing_crossbar[addr][i] <<= 0
  //       for i in range(num_fu_outports):
  //         s.prologue_count_reg_fu_crossbar[addr][i] <<= 0
  //   else:
  //     if s.recv_pkt_from_controller_queue.send.val & \
  //        (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR):
  //       temp_routing_crossbar_in = s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.routing_xbar_outport[0]
  //       s.prologue_count_reg_routing_crossbar[s.recv_pkt_from_controller_queue.send.msg.payload.ctrl_addr][trunc(temp_routing_crossbar_in, TileInPortType)] <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, PrologueCountType)
  //     elif s.recv_pkt_from_controller_queue.send.val & \
  //        (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU_CROSSBAR):
  //       temp_fu_crossbar_in = s.recv_pkt_from_controller_queue.send.msg.payload.ctrl.fu_xbar_outport[0]
  //       s.prologue_count_reg_fu_crossbar[s.recv_pkt_from_controller_queue.send.msg.payload.ctrl_addr][trunc(temp_fu_crossbar_in, FuOutPortType)] <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, PrologueCountType)
  
  always_ff @(posedge clk) begin : update_prologue_reg
    if ( reset ) begin
      for ( int unsigned addr = 1'd0; addr < 4'( __const__ctrl_mem_size_at_update_prologue_reg ); addr += 1'd1 ) begin
        for ( int unsigned i = 1'd0; i < 4'( __const__num_tile_inports_at_update_prologue_reg ); i += 1'd1 )
          prologue_count_reg_routing_crossbar[3'(addr)][3'(i)] <= 3'd0;
        for ( int unsigned i = 1'd0; i < 2'( __const__num_fu_outports_at_update_prologue_reg ); i += 1'd1 )
          prologue_count_reg_fu_crossbar[3'(addr)][1'(i)] <= 3'd0;
      end
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR ) ) ) begin
      __tmpvar__update_prologue_reg_temp_routing_crossbar_in = recv_pkt_from_controller_queue__send__msg.payload.ctrl.routing_xbar_outport[4'd0];
      prologue_count_reg_routing_crossbar[recv_pkt_from_controller_queue__send__msg.payload.ctrl_addr][3'(__tmpvar__update_prologue_reg_temp_routing_crossbar_in)] <= 3'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR ) ) ) begin
      __tmpvar__update_prologue_reg_temp_fu_crossbar_in = recv_pkt_from_controller_queue__send__msg.payload.ctrl.fu_xbar_outport[4'd0];
      prologue_count_reg_fu_crossbar[recv_pkt_from_controller_queue__send__msg.payload.ctrl_addr][1'(__tmpvar__update_prologue_reg_temp_fu_crossbar_in)] <= 3'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:223
  // @update_ff
  // def update_raddr_and_fu_prologue():
  //   if s.reset:
  //     s.times <<= 0
  //     s.reg_file.raddr[0] <<= 0
  //     for i in range(ctrl_mem_size):
  //       s.prologue_count_reg_fu[i] <<= 0
  //   elif s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_CTRL_LOWER_BOUND):
  //     s.reg_file.raddr[0] <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, CtrlAddrType)
  //   elif s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_TERMINATE):
  //     s.times <<= TimeType(0)
  //   else:
  //     if s.recv_pkt_from_controller_queue.send.val & \
  //        (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU):
  //       s.prologue_count_reg_fu[s.recv_pkt_from_controller_queue.send.msg.payload.ctrl_addr] <<= \
  //           trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, PrologueCountType)
  // 
  //     if s.start_iterate_ctrl == b1(1):
  //       if ((s.total_ctrl_steps_val == 0) | \
  //           (s.times < s.total_ctrl_steps_val)) & \
  //          s.send_ctrl.rdy & s.send_ctrl.val:
  //         s.times <<= s.times + TimeType(1)
  // 
  //       # Reads the next ctrl signal only when the current one is done.
  //       if s.send_ctrl.rdy & s.send_ctrl.val:
  //         if zext(s.reg_file.raddr[0], UpperBoundType) == s.ctrl_count_upper_bound - UpperBoundType(1):
  //           s.reg_file.raddr[0] <<= s.ctrl_count_lower_bound
  //         else:
  //           s.reg_file.raddr[0] <<= s.reg_file.raddr[0] + CtrlAddrType(1)
  //         if s.prologue_count_reg_fu[s.reg_file.raddr[0]] > 0:
  //           s.prologue_count_reg_fu[s.reg_file.raddr[0]] <<= s.prologue_count_reg_fu[s.reg_file.raddr[0]] - 1
  
  always_ff @(posedge clk) begin : update_raddr_and_fu_prologue
    if ( reset ) begin
      times <= 11'd0;
      reg_file__raddr[1'd0] <= 3'd0;
      for ( int unsigned i = 1'd0; i < 4'( __const__ctrl_mem_size_at_update_raddr_and_fu_prologue ); i += 1'd1 )
        prologue_count_reg_fu[3'(i)] <= 3'd0;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_CTRL_LOWER_BOUND ) ) ) begin
      reg_file__raddr[1'd0] <= 3'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_TERMINATE ) ) ) begin
      times <= 11'd0;
    end
    else begin
      if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU ) ) ) begin
        prologue_count_reg_fu[recv_pkt_from_controller_queue__send__msg.payload.ctrl_addr] <= 3'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
      end
      if ( start_iterate_ctrl == 1'd1 ) begin
        if ( ( ( ( total_ctrl_steps_val == 11'd0 ) | ( times < total_ctrl_steps_val ) ) & send_ctrl__rdy ) & send_ctrl__val ) begin
          times <= times + 11'd1;
        end
        if ( send_ctrl__rdy & send_ctrl__val ) begin
          if ( { { 1 { 1'b0 } }, reg_file__raddr[1'd0] } == ( ctrl_count_upper_bound - 4'd1 ) ) begin
            reg_file__raddr[1'd0] <= ctrl_count_lower_bound;
          end
          else
            reg_file__raddr[1'd0] <= reg_file__raddr[1'd0] + 3'd1;
          if ( prologue_count_reg_fu[reg_file__raddr[1'd0]] > 3'd0 ) begin
            prologue_count_reg_fu[reg_file__raddr[1'd0]] <= prologue_count_reg_fu[reg_file__raddr[1'd0]] - 3'd1;
          end
        end
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:302
  // @update_ff
  // def update_total_ctrl_steps():
  //   if s.reset:
  //     s.total_ctrl_steps_val <<= TimeType(total_ctrl_steps)
  //   elif s.recv_pkt_from_controller_queue.send.val & (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_CONFIG_TOTAL_CTRL_COUNT):
  //     s.total_ctrl_steps_val <<= trunc(s.recv_pkt_from_controller_queue.send.msg.payload.data.payload, TimeType)
  
  always_ff @(posedge clk) begin : update_total_ctrl_steps
    if ( reset ) begin
      total_ctrl_steps_val <= 11'd8;
    end
    else if ( recv_pkt_from_controller_queue__send__val & ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_CONFIG_TOTAL_CTRL_COUNT ) ) ) begin
      total_ctrl_steps_val <= 11'(recv_pkt_from_controller_queue__send__msg.payload.data.payload);
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/ctrl/CtrlMemDynamicRTL.py:196
  // @update_ff
  // def update_whether_we_can_iterate_ctrl():
  //   if s.reset:
  //     s.start_iterate_ctrl <<= 0
  //   else:
  //     if s.recv_pkt_from_controller_queue.send.val:
  //       if (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_LAUNCH) | \
  //               (s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_RESUME):
  //         s.start_iterate_ctrl <<= 1
  // # TODO: issue #191, stop iterate ctrl after 10 cycels during pausing status, 
  // # so as to clear channels safely.
  //       elif s.recv_pkt_from_controller_queue.send.msg.payload.cmd == CMD_TERMINATE:
  //         s.start_iterate_ctrl <<= 0
  
  always_ff @(posedge clk) begin : update_whether_we_can_iterate_ctrl
    if ( reset ) begin
      start_iterate_ctrl <= 1'd0;
    end
    else if ( recv_pkt_from_controller_queue__send__val ) begin
      if ( ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_LAUNCH ) ) | ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_RESUME ) ) ) begin
        start_iterate_ctrl <= 1'd1;
      end
      else if ( recv_pkt_from_controller_queue__send__msg.payload.cmd == 5'( __const__CMD_TERMINATE ) ) begin
        start_iterate_ctrl <= 1'd0;
      end
    end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;
  assign recv_pkt_from_controller_queue__clk = clk;
  assign recv_pkt_from_controller_queue__reset = reset;
  assign recv_from_element_queue__clk = clk;
  assign recv_from_element_queue__reset = reset;
  assign send_ctrl__msg = reg_file__rdata[0];
  assign recv_pkt_from_controller_queue__recv__msg = recv_pkt_from_controller__msg;
  assign recv_pkt_from_controller__rdy = recv_pkt_from_controller_queue__recv__rdy;
  assign recv_pkt_from_controller_queue__recv__val = recv_pkt_from_controller__val;
  assign recv_from_element_queue__recv__msg = recv_from_element__msg;
  assign recv_from_element__rdy = recv_from_element_queue__recv__rdy;
  assign recv_from_element_queue__recv__val = recv_from_element__val;

endmodule