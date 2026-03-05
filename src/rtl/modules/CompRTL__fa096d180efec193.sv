module CompRTL__fa096d180efec193
import cgra_pkg::*;
(
  input  logic [0:0] clear ,
  input  logic [0:0] clk ,
  input  logic [2:0] ctrl_addr_inport ,
  input  logic [0:0] reset ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 from_mem_rdata__msg  ,
  output logic [0:0] from_mem_rdata__rdy  ,
  input logic [0:0] from_mem_rdata__val  ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_const__msg  ,
  output logic [0:0] recv_const__rdy  ,
  input logic [0:0] recv_const__val  ,
  input MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f recv_from_ctrl_mem__msg  ,
  output logic [0:0] recv_from_ctrl_mem__rdy  ,
  input logic [0:0] recv_from_ctrl_mem__val  ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_in__msg [0:3] ,
  output logic [0:0] recv_in__rdy [0:3] ,
  input logic [0:0] recv_in__val [0:3] ,
  input CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f recv_opt__msg  ,
  output logic [0:0] recv_opt__rdy  ,
  input logic [0:0] recv_opt__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_out__msg [0:1] ,
  input logic [0:0] send_out__rdy [0:1] ,
  output logic [0:0] send_out__val [0:1] ,
  output MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f send_to_ctrl_mem__msg  ,
  input logic [0:0] send_to_ctrl_mem__rdy  ,
  output logic [0:0] send_to_ctrl_mem__val  ,
  output logic [8:0] to_mem_raddr__msg  ,
  input logic [0:0] to_mem_raddr__rdy  ,
  output logic [0:0] to_mem_raddr__val  ,
  output logic [8:0] to_mem_waddr__msg  ,
  input logic [0:0] to_mem_waddr__rdy  ,
  output logic [0:0] to_mem_waddr__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 to_mem_wdata__msg  ,
  input logic [0:0] to_mem_wdata__rdy  ,
  output logic [0:0] to_mem_wdata__val  
);
  localparam CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 const_one  = { 32'd1, 1'd0, 1'd0, 1'd0 };
  localparam CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 const_zero  = { 32'd0, 1'd0, 1'd0, 1'd0 };
  localparam logic [6:0] __const__OPT_START  = 7'd0;
  localparam logic [0:0] __const__latency_at_proceed_latency  = 1'd1;
  localparam logic [2:0] __const__num_inports_at_read_reg  = 3'd4;
  localparam logic [1:0] __const__num_outports_at_read_reg  = 2'd2;
  localparam logic [6:0] __const__OPT_EQ  = 7'd14;
  localparam logic [6:0] __const__OPT_NE  = 7'd45;
  localparam logic [6:0] __const__OPT_EQ_CONST  = 7'd33;
  localparam logic [6:0] __const__OPT_NE_CONST  = 7'd46;
  localparam logic [6:0] __const__OPT_LT  = 7'd60;
  logic [2:0] in0;
  logic [1:0] in0_idx;
  logic [2:0] in1;
  logic [1:0] in1_idx;
  logic [0:0] latency;
  logic [0:0] reached_vector_factor;
  logic [0:0] recv_all_val;
  logic [7:0] vector_factor_counter;
  logic [2:0] vector_factor_power;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/CompRTL.py:48
  // @update
  // def read_reg():
  // 
  //   s.recv_all_val @= 0
  //   # For pick input register
  //   s.in0 @= FuInType(0)
  //   s.in1 @= FuInType(0)
  //   for i in range(num_inports):
  //     s.recv_in[i].rdy @= b1(0)
  //   for i in range(num_outports):
  //     s.send_out[i].val @= 0
  //     s.send_out[i].msg @= DataType()
  // 
  //   s.recv_const.rdy @= 0
  //   s.recv_opt.rdy @= 0
  // 
  //   s.send_to_ctrl_mem.val @= 0
  //   s.send_to_ctrl_mem.msg @= s.CgraPayloadType(0, 0, 0, 0, 0)
  //   s.recv_from_ctrl_mem.rdy @= 0
  // 
  //   if s.recv_opt.val:
  //     if s.recv_opt.msg.fu_in[0] != FuInType( 0 ):
  //       s.in0 @= s.recv_opt.msg.fu_in[0] - FuInType(1)
  //     if s.recv_opt.msg.fu_in[1] != FuInType(0):
  //       s.in1 @= s.recv_opt.msg.fu_in[1] - FuInType(1)
  // 
  //   if s.recv_opt.val:
  //     if (s.recv_opt.msg.operation == OPT_EQ) | (s.recv_opt.msg.operation == OPT_NE):
  //       if (s.recv_opt.msg.operation == OPT_EQ) & \
  //          (s.recv_in[s.in0_idx].msg.payload == s.recv_in[s.in1_idx].msg.payload):
  //         s.send_out[0].msg @= s.const_one
  //       elif (s.recv_opt.msg.operation == OPT_NE) & \
  //            (s.recv_in[s.in0_idx].msg.payload != s.recv_in[s.in1_idx].msg.payload):
  //         s.send_out[0].msg @= s.const_one
  //       else:
  //         s.send_out[0].msg @= s.const_zero
  //       s.send_out[0].msg.predicate @= s.recv_in[s.in0_idx].msg.predicate & \
  //                                      s.recv_in[s.in1_idx].msg.predicate & \
  //                                      s.reached_vector_factor
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & s.recv_in[s.in1_idx].val
  //       s.send_out[0].val @= s.recv_all_val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_in[s.in1_idx].rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_opt.rdy @= s.recv_all_val & s.send_out[0].rdy
  // 
  //     elif (s.recv_opt.msg.operation == OPT_EQ_CONST) | (s.recv_opt.msg.operation == OPT_NE_CONST):
  //       if (s.recv_opt.msg.operation == OPT_EQ_CONST) & \
  //          (s.recv_in[s.in0_idx].msg.payload == s.recv_const.msg.payload):
  //         s.send_out[0].msg @= s.const_one
  //       elif (s.recv_opt.msg.operation == OPT_NE_CONST) & \
  //            (s.recv_in[s.in0_idx].msg.payload != s.recv_const.msg.payload):
  //         s.send_out[0].msg @= s.const_one
  //       else:
  //         s.send_out[0].msg @= s.const_zero
  //       s.send_out[0].msg.predicate @= s.recv_in[s.in0_idx].msg.predicate & \
  //                                      s.reached_vector_factor
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & s.recv_const.val
  //       s.send_out[0].val @= s.recv_all_val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_const.rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_opt.rdy @= s.recv_all_val & s.send_out[0].rdy
  // 
  //     elif s.recv_opt.msg.operation == OPT_LT:
  //       if s.recv_in[s.in0_idx].msg.payload < s.recv_in[s.in1_idx].msg.payload:
  //         s.send_out[0].msg @= s.const_one
  //       else:
  //         s.send_out[0].msg @= s.const_zero
  //       s.send_out[0].msg.predicate @= s.recv_in[s.in0_idx].msg.predicate & \
  //                                      s.recv_in[s.in1_idx].msg.predicate & \
  //                                      s.reached_vector_factor
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & s.recv_in[s.in1_idx].val
  //       s.send_out[0].val @= s.recv_all_val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_in[s.in1_idx].rdy @= s.recv_all_val & s.send_out[0].rdy
  //       s.recv_opt.rdy @= s.recv_all_val & s.send_out[0].rdy
  // 
  //     else:
  //       for j in range(num_outports):
  //         s.send_out[j].val @= b1(0)
  //       s.recv_opt.rdy @= 0
  //       s.recv_in[s.in0_idx].rdy @= 0
  //       s.recv_in[s.in1_idx].rdy @= 0
  
  always_comb begin : read_reg
    recv_all_val = 1'd0;
    in0 = 3'd0;
    in1 = 3'd0;
    for ( int unsigned i = 1'd0; i < 3'( __const__num_inports_at_read_reg ); i += 1'd1 )
      recv_in__rdy[2'(i)] = 1'd0;
    for ( int unsigned i = 1'd0; i < 2'( __const__num_outports_at_read_reg ); i += 1'd1 ) begin
      send_out__val[1'(i)] = 1'd0;
      send_out__msg[1'(i)] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    end
    recv_const__rdy = 1'd0;
    recv_opt__rdy = 1'd0;
    send_to_ctrl_mem__val = 1'd0;
    send_to_ctrl_mem__msg = { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 };
    recv_from_ctrl_mem__rdy = 1'd0;
    if ( recv_opt__val ) begin
      if ( recv_opt__msg.fu_in[2'd0] != 3'd0 ) begin
        in0 = recv_opt__msg.fu_in[2'd0] - 3'd1;
      end
      if ( recv_opt__msg.fu_in[2'd1] != 3'd0 ) begin
        in1 = recv_opt__msg.fu_in[2'd1] - 3'd1;
      end
    end
    if ( recv_opt__val ) begin
      if ( ( recv_opt__msg.operation == 7'( __const__OPT_EQ ) ) | ( recv_opt__msg.operation == 7'( __const__OPT_NE ) ) ) begin
        if ( ( recv_opt__msg.operation == 7'( __const__OPT_EQ ) ) & ( recv_in__msg[in0_idx].payload == recv_in__msg[in1_idx].payload ) ) begin
          send_out__msg[1'd0] = const_one;
        end
        else if ( ( recv_opt__msg.operation == 7'( __const__OPT_NE ) ) & ( recv_in__msg[in0_idx].payload != recv_in__msg[in1_idx].payload ) ) begin
          send_out__msg[1'd0] = const_one;
        end
        else
          send_out__msg[1'd0] = const_zero;
        send_out__msg[1'd0].predicate = ( recv_in__msg[in0_idx].predicate & recv_in__msg[in1_idx].predicate ) & reached_vector_factor;
        recv_all_val = recv_in__val[in0_idx] & recv_in__val[in1_idx];
        send_out__val[1'd0] = recv_all_val;
        recv_in__rdy[in0_idx] = recv_all_val & send_out__rdy[1'd0];
        recv_in__rdy[in1_idx] = recv_all_val & send_out__rdy[1'd0];
        recv_opt__rdy = recv_all_val & send_out__rdy[1'd0];
      end
      else if ( ( recv_opt__msg.operation == 7'( __const__OPT_EQ_CONST ) ) | ( recv_opt__msg.operation == 7'( __const__OPT_NE_CONST ) ) ) begin
        if ( ( recv_opt__msg.operation == 7'( __const__OPT_EQ_CONST ) ) & ( recv_in__msg[in0_idx].payload == recv_const__msg.payload ) ) begin
          send_out__msg[1'd0] = const_one;
        end
        else if ( ( recv_opt__msg.operation == 7'( __const__OPT_NE_CONST ) ) & ( recv_in__msg[in0_idx].payload != recv_const__msg.payload ) ) begin
          send_out__msg[1'd0] = const_one;
        end
        else
          send_out__msg[1'd0] = const_zero;
        send_out__msg[1'd0].predicate = recv_in__msg[in0_idx].predicate & reached_vector_factor;
        recv_all_val = recv_in__val[in0_idx] & recv_const__val;
        send_out__val[1'd0] = recv_all_val;
        recv_in__rdy[in0_idx] = recv_all_val & send_out__rdy[1'd0];
        recv_const__rdy = recv_all_val & send_out__rdy[1'd0];
        recv_opt__rdy = recv_all_val & send_out__rdy[1'd0];
      end
      else if ( recv_opt__msg.operation == 7'( __const__OPT_LT ) ) begin
        if ( recv_in__msg[in0_idx].payload < recv_in__msg[in1_idx].payload ) begin
          send_out__msg[1'd0] = const_one;
        end
        else
          send_out__msg[1'd0] = const_zero;
        send_out__msg[1'd0].predicate = ( recv_in__msg[in0_idx].predicate & recv_in__msg[in1_idx].predicate ) & reached_vector_factor;
        recv_all_val = recv_in__val[in0_idx] & recv_in__val[in1_idx];
        send_out__val[1'd0] = recv_all_val;
        recv_in__rdy[in0_idx] = recv_all_val & send_out__rdy[1'd0];
        recv_in__rdy[in1_idx] = recv_all_val & send_out__rdy[1'd0];
        recv_opt__rdy = recv_all_val & send_out__rdy[1'd0];
      end
      else begin
        for ( int unsigned j = 1'd0; j < 2'( __const__num_outports_at_read_reg ); j += 1'd1 )
          send_out__val[1'(j)] = 1'd0;
        recv_opt__rdy = 1'd0;
        recv_in__rdy[in0_idx] = 1'd0;
        recv_in__rdy[in1_idx] = 1'd0;
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:71
  // @update
  // def update_mem():
  //   s.to_mem_waddr.val @= b1(0)
  //   s.to_mem_wdata.val @= b1(0)
  //   s.to_mem_wdata.msg @= s.const_zero
  //   s.to_mem_waddr.msg @= DataAddrType(0)
  //   s.to_mem_raddr.msg @= DataAddrType(0)
  //   s.to_mem_raddr.val @= b1(0)
  //   s.from_mem_rdata.rdy @= b1(0)
  
  always_comb begin : update_mem
    to_mem_waddr__val = 1'd0;
    to_mem_wdata__val = 1'd0;
    to_mem_wdata__msg = const_zero;
    to_mem_waddr__msg = 9'd0;
    to_mem_raddr__msg = 9'd0;
    to_mem_raddr__val = 1'd0;
    from_mem_rdata__rdy = 1'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:90
  // @update
  // def update_reached_vector_factor():
  //   s.reached_vector_factor @= 0
  //   if s.recv_opt.val & (s.vector_factor_counter + \
  //                        (VectorFactorType(1) << zext(s.vector_factor_power, VectorFactorType)) >= \
  //                        (VectorFactorType(1) << zext(s.recv_opt.msg.vector_factor_power, VectorFactorType))):
  //     s.reached_vector_factor @= 1
  
  always_comb begin : update_reached_vector_factor
    reached_vector_factor = 1'd0;
    if ( recv_opt__val & ( ( vector_factor_counter + ( 8'd1 << { { 5 { 1'b0 } }, vector_factor_power } ) ) >= ( 8'd1 << { { 5 { 1'b0 } }, recv_opt__msg.vector_factor_power } ) ) ) begin
      reached_vector_factor = 1'd1;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:81
  // @update_ff
  // def proceed_latency():
  //   if s.recv_opt.msg.operation == OPT_START:
  //     s.latency <<= LatencyType(0)
  //   elif s.latency == latency - 1:
  //     s.latency <<= LatencyType(0)
  //   else:
  //     s.latency <<= s.latency + LatencyType(1)
  
  always_ff @(posedge clk) begin : proceed_latency
    if ( recv_opt__msg.operation == 7'( __const__OPT_START ) ) begin
      latency <= 1'd0;
    end
    else if ( latency == ( 1'( __const__latency_at_proceed_latency ) - 1'd1 ) ) begin
      latency <= 1'd0;
    end
    else
      latency <= latency + 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/basic/Fu.py:98
  // @update_ff
  // def update_vector_factor_counter():
  //   if s.reset:
  //     s.vector_factor_counter <<= 0
  //   else:
  //     if s.recv_opt.val:
  //       if s.recv_opt.msg.is_last_ctrl & \
  //          (s.vector_factor_counter + \
  //           (VectorFactorType(1) << zext(s.vector_factor_power, VectorFactorType)) < \
  //           (VectorFactorType(1) << zext(s.recv_opt.msg.vector_factor_power, VectorFactorType))):
  //         s.vector_factor_counter <<= s.vector_factor_counter + \
  //                                     (VectorFactorType(1) << zext(s.vector_factor_power, \
  //                                                                  VectorFactorType))
  //       elif s.recv_opt.msg.is_last_ctrl & s.reached_vector_factor:
  //         s.vector_factor_counter <<= 0
  
  always_ff @(posedge clk) begin : update_vector_factor_counter
    if ( reset ) begin
      vector_factor_counter <= 8'd0;
    end
    else if ( recv_opt__val ) begin
      if ( recv_opt__msg.is_last_ctrl & ( ( vector_factor_counter + ( 8'd1 << { { 5 { 1'b0 } }, vector_factor_power } ) ) < ( 8'd1 << { { 5 { 1'b0 } }, recv_opt__msg.vector_factor_power } ) ) ) begin
        vector_factor_counter <= vector_factor_counter + ( 8'd1 << { { 5 { 1'b0 } }, vector_factor_power } );
      end
      else if ( recv_opt__msg.is_last_ctrl & reached_vector_factor ) begin
        vector_factor_counter <= 8'd0;
      end
    end
  end

  assign vector_factor_power = 3'd0;
  assign in0_idx = in0[1:0];
  assign in1_idx = in1[1:0];

endmodule