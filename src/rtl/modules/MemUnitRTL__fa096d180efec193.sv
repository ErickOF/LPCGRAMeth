module MemUnitRTL__fa096d180efec193
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
  localparam logic [2:0] __const__num_inports_at_comb_logic  = 3'd4;
  localparam logic [1:0] __const__num_outports_at_comb_logic  = 2'd2;
  localparam logic [6:0] __const__OPT_LD  = 7'd12;
  localparam logic [6:0] __const__OPT_ADD_CONST_LD  = 7'd81;
  localparam logic [6:0] __const__OPT_LD_CONST  = 7'd28;
  localparam logic [6:0] __const__OPT_STR  = 7'd13;
  localparam logic [6:0] __const__OPT_STR_CONST  = 7'd58;
  logic [0:0] already_sent_raddr;
  logic [2:0] in0;
  logic [1:0] in0_idx;
  logic [2:0] in1;
  logic [1:0] in1_idx;
  logic [0:0] reached_vector_factor;
  logic [0:0] recv_all_val;
  logic [3:0] recv_in_val_vector;
  logic [7:0] vector_factor_counter;
  logic [2:0] vector_factor_power;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/MemUnitRTL.py:82
  // @update
  // def comb_logic():
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
  //     if s.recv_opt.msg.fu_in[0] != 0:
  //       s.in0 @= zext(s.recv_opt.msg.fu_in[0] - 1, FuInType)
  //     if s.recv_opt.msg.fu_in[1] != 0:
  //       s.in1 @= zext(s.recv_opt.msg.fu_in[1] - 1, FuInType)
  // 
  //   s.to_mem_waddr.val @= 0
  //   s.to_mem_waddr.msg @= AddrType()
  //   s.to_mem_wdata.val @= 0
  //   s.to_mem_wdata.msg @= DataType()
  //   s.to_mem_raddr.val @= 0
  //   s.to_mem_raddr.msg @= AddrType()
  //   s.from_mem_rdata.rdy @= 0
  // 
  //   if s.recv_opt.val:
  //     if s.recv_opt.msg.operation == OPT_LD:
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.to_mem_raddr.rdy
  //       s.to_mem_raddr.msg @= AddrType(s.recv_in[s.in0_idx].msg.payload[0:AddrType.nbits])
  //       # Do not access memory by setting raddr.val=0 if the raddr has predicate=0.
  //       # Note that this only happends "once" when all the required inputs are arrived.
  //       if s.recv_all_val & (s.recv_in[s.in0_idx].msg.predicate == 0):
  //         s.to_mem_raddr.val @= 0
  //       else:
  //         s.to_mem_raddr.val @= s.recv_all_val & ~s.already_sent_raddr
  //       s.from_mem_rdata.rdy @= s.send_out[0].rdy
  //       # Although we do not access memory when raddr has predicate=0,
  //       # we still need to simulate that memory returns a fake data with predicate=0,
  //       # so that the consumer will not block due to the lack of data.
  //       # Then all initiated iterations can be normally drained.
  //       # Note that this only happends "after" all the required inputs are arrived.
  //       # Otherwise, the recv_opt's opcode would be consumed at the wrong timing.
  //       if s.recv_all_val & (s.recv_in[s.in0_idx].msg.predicate == 0):
  //         s.send_out[0].val @= s.recv_all_val
  //         s.send_out[0].msg.predicate @= 0
  //         s.recv_opt.rdy @= s.send_out[0].rdy
  //       else:
  //         s.send_out[0].val @= s.from_mem_rdata.val
  //         s.send_out[0].msg @= s.from_mem_rdata.msg
  //         # Predicate of 0 is already handled and returned with fake data. So just
  //         # use the from_mem_rdata's predicate here.
  //         s.send_out[0].msg.predicate @= s.from_mem_rdata.msg.predicate & \
  //                                        s.reached_vector_factor
  //         s.recv_opt.rdy @= s.send_out[0].rdy & s.from_mem_rdata.val
  // 
  //     # ADD_CONST_LD indicates the address is added on a const, then perform load.
  //     elif s.recv_opt.msg.operation == OPT_ADD_CONST_LD:
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & s.recv_const.val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.to_mem_raddr.rdy
  //       # It is okay to always set recv_const.rdy=1 here, because the const queue
  //       # would only proceed once the operation is done executing.
  //       s.recv_const.rdy @= 1
  //       s.to_mem_raddr.msg @= AddrType(s.recv_in[s.in0_idx].msg.payload[0:AddrType.nbits] +
  //                                      s.recv_const.msg.payload[0:AddrType.nbits])
  //       # Do not access memory by setting raddr.val=0 if the raddr has predicate=0.
  //       # Note that this only happends "once" when all the required inputs are arrived.
  //       if s.recv_all_val & (s.recv_in[s.in0_idx].msg.predicate == 0):
  //         s.to_mem_raddr.val @= 0
  //       else:
  //         s.to_mem_raddr.val @= s.recv_all_val & ~s.already_sent_raddr
  //       s.from_mem_rdata.rdy @= s.send_out[0].rdy
  //       # Although we do not access memory when raddr has predicate=0,
  //       # we still need to simulate that memory returns a fake data with predicate=0,
  //       # so that the consumer will not block due to the lack of data.
  //       # Then all initiated iterations can be normally drained.
  //       # Note that this only happends "after" all the required inputs are arrived.
  //       # Otherwise, the recv_opt's opcode would be consumed at the wrong timing.
  //       if s.recv_all_val & (s.recv_in[s.in0_idx].msg.predicate == 0):
  //         s.send_out[0].val @= s.recv_all_val
  //         s.send_out[0].msg.predicate @= 0
  //         s.recv_opt.rdy @= s.send_out[0].rdy
  //       else:
  //         s.send_out[0].val @= s.from_mem_rdata.val
  //         s.send_out[0].msg @= s.from_mem_rdata.msg
  //         # Predicate of 0 is already handled and returned with fake data. So just
  //         # use the from_mem_rdata's predicate here.
  //         s.send_out[0].msg.predicate @= s.from_mem_rdata.msg.predicate & \
  //                                        s.reached_vector_factor
  //         s.recv_opt.rdy @= s.send_out[0].rdy & s.from_mem_rdata.val
  // 
  //     # LD_CONST indicates the address is a const.
  //     elif s.recv_opt.msg.operation == OPT_LD_CONST:
  //       s.recv_all_val @= s.recv_const.val
  //       # It is okay to always set recv_const.rdy=1 here, because the const queue
  //       # would only proceed once the operation is done executing.
  //       s.recv_const.rdy @= 1
  //       s.to_mem_raddr.msg @= AddrType(s.recv_const.msg.payload[0:AddrType.nbits])
  //       s.to_mem_raddr.val @= s.recv_all_val & ~s.already_sent_raddr
  //       s.from_mem_rdata.rdy @= s.send_out[0].rdy
  //       s.send_out[0].val @= s.from_mem_rdata.val
  //       s.send_out[0].msg @= s.from_mem_rdata.msg
  //       s.send_out[0].msg.predicate @= s.recv_const.msg.predicate & \
  //                                      s.from_mem_rdata.msg.predicate & \
  //                                      s.reached_vector_factor
  //       s.recv_opt.rdy @= s.send_out[0].rdy & s.from_mem_rdata.val
  // 
  //     elif s.recv_opt.msg.operation == OPT_STR:
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & \
  //                         s.recv_in[s.in1_idx].val
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  //       s.recv_in[s.in1_idx].rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  //       s.to_mem_waddr.msg @= AddrType(s.recv_in[0].msg.payload[0:AddrType.nbits])
  //       s.to_mem_waddr.val @= s.recv_all_val
  //       s.to_mem_wdata.msg @= s.recv_in[s.in1_idx].msg
  //       s.to_mem_wdata.msg.predicate @= s.recv_in[s.in0_idx].msg.predicate & \
  //                                       s.recv_in[s.in1_idx].msg.predicate & \
  //                                       s.reached_vector_factor
  //       s.to_mem_wdata.val @= s.recv_all_val
  // 
  //       # `send_out` is meaningless for store operation.
  //       s.send_out[0].val @= b1(0)
  // 
  //       s.recv_opt.rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  // 
  //     # STR_CONST indicates the address is a const.
  //     elif s.recv_opt.msg.operation == OPT_STR_CONST:
  //       s.recv_all_val @= s.recv_in[s.in0_idx].val & s.recv_const.val
  //       s.recv_const.rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  //       # Only needs one input register to indicate the storing data.
  //       s.recv_in[s.in0_idx].rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  //       s.to_mem_waddr.msg @= AddrType(s.recv_const.msg.payload[0:AddrType.nbits])
  //       s.to_mem_waddr.val @= s.recv_all_val & \
  //                             s.recv_in[s.in0_idx].msg.predicate & \
  //                             s.recv_const.msg.predicate
  //       s.to_mem_wdata.msg @= s.recv_in[s.in0_idx].msg
  //       s.to_mem_wdata.msg.predicate @= s.recv_in[s.in0_idx].msg.predicate & \
  //                                       s.recv_const.msg.predicate & \
  //                                       s.reached_vector_factor
  //       s.to_mem_wdata.val @= s.recv_all_val & \
  //                             s.recv_in[s.in0_idx].msg.predicate & \
  //                             s.recv_const.msg.predicate
  // 
  //       # `send_out` is meaningless for store operation.
  //       s.send_out[0].val @= b1(0)
  // 
  //       s.recv_opt.rdy @= s.recv_all_val & s.to_mem_waddr.rdy & s.to_mem_wdata.rdy
  // 
  //     else:
  //       for j in range(num_outports):
  //         s.send_out[j].val @= b1(0)
  //       s.recv_opt.rdy @= 0
  //       s.recv_in[s.in0_idx].rdy @= 0
  //       s.recv_in[s.in1_idx].rdy @= 0
  
  always_comb begin : comb_logic
    recv_all_val = 1'd0;
    in0 = 3'd0;
    in1 = 3'd0;
    for ( int unsigned i = 1'd0; i < 3'( __const__num_inports_at_comb_logic ); i += 1'd1 )
      recv_in__rdy[2'(i)] = 1'd0;
    for ( int unsigned i = 1'd0; i < 2'( __const__num_outports_at_comb_logic ); i += 1'd1 ) begin
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
    to_mem_waddr__val = 1'd0;
    to_mem_waddr__msg = 9'd0;
    to_mem_wdata__val = 1'd0;
    to_mem_wdata__msg = { 32'd0, 1'd0, 1'd0, 1'd0 };
    to_mem_raddr__val = 1'd0;
    to_mem_raddr__msg = 9'd0;
    from_mem_rdata__rdy = 1'd0;
    if ( recv_opt__val ) begin
      if ( recv_opt__msg.operation == 7'( __const__OPT_LD ) ) begin
        recv_all_val = recv_in__val[in0_idx];
        recv_in__rdy[in0_idx] = recv_all_val & to_mem_raddr__rdy;
        to_mem_raddr__msg = 9'( recv_in__msg[in0_idx].payload[5'd8:5'd0] );
        if ( recv_all_val & ( recv_in__msg[in0_idx].predicate == 1'd0 ) ) begin
          to_mem_raddr__val = 1'd0;
        end
        else
          to_mem_raddr__val = recv_all_val & ( ~already_sent_raddr );
        from_mem_rdata__rdy = send_out__rdy[1'd0];
        if ( recv_all_val & ( recv_in__msg[in0_idx].predicate == 1'd0 ) ) begin
          send_out__val[1'd0] = recv_all_val;
          send_out__msg[1'd0].predicate = 1'd0;
          recv_opt__rdy = send_out__rdy[1'd0];
        end
        else begin
          send_out__val[1'd0] = from_mem_rdata__val;
          send_out__msg[1'd0] = from_mem_rdata__msg;
          send_out__msg[1'd0].predicate = from_mem_rdata__msg.predicate & reached_vector_factor;
          recv_opt__rdy = send_out__rdy[1'd0] & from_mem_rdata__val;
        end
      end
      else if ( recv_opt__msg.operation == 7'( __const__OPT_ADD_CONST_LD ) ) begin
        recv_all_val = recv_in__val[in0_idx] & recv_const__val;
        recv_in__rdy[in0_idx] = recv_all_val & to_mem_raddr__rdy;
        recv_const__rdy = 1'd1;
        to_mem_raddr__msg = 9'( recv_in__msg[in0_idx].payload[5'd8:5'd0] + recv_const__msg.payload[5'd8:5'd0] );
        if ( recv_all_val & ( recv_in__msg[in0_idx].predicate == 1'd0 ) ) begin
          to_mem_raddr__val = 1'd0;
        end
        else
          to_mem_raddr__val = recv_all_val & ( ~already_sent_raddr );
        from_mem_rdata__rdy = send_out__rdy[1'd0];
        if ( recv_all_val & ( recv_in__msg[in0_idx].predicate == 1'd0 ) ) begin
          send_out__val[1'd0] = recv_all_val;
          send_out__msg[1'd0].predicate = 1'd0;
          recv_opt__rdy = send_out__rdy[1'd0];
        end
        else begin
          send_out__val[1'd0] = from_mem_rdata__val;
          send_out__msg[1'd0] = from_mem_rdata__msg;
          send_out__msg[1'd0].predicate = from_mem_rdata__msg.predicate & reached_vector_factor;
          recv_opt__rdy = send_out__rdy[1'd0] & from_mem_rdata__val;
        end
      end
      else if ( recv_opt__msg.operation == 7'( __const__OPT_LD_CONST ) ) begin
        recv_all_val = recv_const__val;
        recv_const__rdy = 1'd1;
        to_mem_raddr__msg = 9'( recv_const__msg.payload[5'd8:5'd0] );
        to_mem_raddr__val = recv_all_val & ( ~already_sent_raddr );
        from_mem_rdata__rdy = send_out__rdy[1'd0];
        send_out__val[1'd0] = from_mem_rdata__val;
        send_out__msg[1'd0] = from_mem_rdata__msg;
        send_out__msg[1'd0].predicate = ( recv_const__msg.predicate & from_mem_rdata__msg.predicate ) & reached_vector_factor;
        recv_opt__rdy = send_out__rdy[1'd0] & from_mem_rdata__val;
      end
      else if ( recv_opt__msg.operation == 7'( __const__OPT_STR ) ) begin
        recv_all_val = recv_in__val[in0_idx] & recv_in__val[in1_idx];
        recv_in__rdy[in0_idx] = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
        recv_in__rdy[in1_idx] = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
        to_mem_waddr__msg = 9'( recv_in__msg[2'd0].payload[5'd8:5'd0] );
        to_mem_waddr__val = recv_all_val;
        to_mem_wdata__msg = recv_in__msg[in1_idx];
        to_mem_wdata__msg.predicate = ( recv_in__msg[in0_idx].predicate & recv_in__msg[in1_idx].predicate ) & reached_vector_factor;
        to_mem_wdata__val = recv_all_val;
        send_out__val[1'd0] = 1'd0;
        recv_opt__rdy = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
      end
      else if ( recv_opt__msg.operation == 7'( __const__OPT_STR_CONST ) ) begin
        recv_all_val = recv_in__val[in0_idx] & recv_const__val;
        recv_const__rdy = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
        recv_in__rdy[in0_idx] = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
        to_mem_waddr__msg = 9'( recv_const__msg.payload[5'd8:5'd0] );
        to_mem_waddr__val = ( recv_all_val & recv_in__msg[in0_idx].predicate ) & recv_const__msg.predicate;
        to_mem_wdata__msg = recv_in__msg[in0_idx];
        to_mem_wdata__msg.predicate = ( recv_in__msg[in0_idx].predicate & recv_const__msg.predicate ) & reached_vector_factor;
        to_mem_wdata__val = ( recv_all_val & recv_in__msg[in0_idx].predicate ) & recv_const__msg.predicate;
        send_out__val[1'd0] = 1'd0;
        recv_opt__rdy = ( recv_all_val & to_mem_waddr__rdy ) & to_mem_wdata__rdy;
      end
      else begin
        for ( int unsigned j = 1'd0; j < 2'( __const__num_outports_at_comb_logic ); j += 1'd1 )
          send_out__val[1'(j)] = 1'd0;
        recv_opt__rdy = 1'd0;
        recv_in__rdy[in0_idx] = 1'd0;
        recv_in__rdy[in1_idx] = 1'd0;
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/MemUnitRTL.py:246
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
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/MemUnitRTL.py:270
  // @update_ff
  // def update_already_sent_raddr():
  //   if s.reset:
  //     s.already_sent_raddr <<= 0
  //   else:
  //     if ~s.recv_opt.val:
  //       s.already_sent_raddr <<= 0
  //     elif s.from_mem_rdata.val & s.from_mem_rdata.rdy:
  //       # Clears the flag when the data has returned (s.from_mem_rdata.val)
  //       # and successfully delivered to the destination (s.from_mem_rdata.rdy).
  //       s.already_sent_raddr <<= 0
  //     elif s.to_mem_raddr.val & \
  //          s.to_mem_raddr.rdy & \
  //          ~s.already_sent_raddr:
  //       s.already_sent_raddr <<= 1
  //     else:
  //       s.already_sent_raddr <<= s.already_sent_raddr
  
  always_ff @(posedge clk) begin : update_already_sent_raddr
    if ( reset ) begin
      already_sent_raddr <= 1'd0;
    end
    else if ( ~recv_opt__val ) begin
      already_sent_raddr <= 1'd0;
    end
    else if ( from_mem_rdata__val & from_mem_rdata__rdy ) begin
      already_sent_raddr <= 1'd0;
    end
    else if ( ( to_mem_raddr__val & to_mem_raddr__rdy ) & ( ~already_sent_raddr ) ) begin
      already_sent_raddr <= 1'd1;
    end
    else
      already_sent_raddr <= already_sent_raddr;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/single/MemUnitRTL.py:254
  // @update_ff
  // def update_vector_factor_counter():
  //   if s.reset:
  //     s.vector_factor_counter <<= 0
  //   else:
  //     if s.recv_opt.val:
  //       if s.recv_opt.msg.is_last_ctrl & \
  //          (s.vector_factor_counter + \
  //           (VectorFactorType(1) << zext(s.vector_factor_power, VectorFactorType)) < \
  //          (VectorFactorType(1) << zext(s.recv_opt.msg.vector_factor_power, VectorFactorType))):
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

  assign in0_idx = in0[1:0];
  assign in1_idx = in1[1:0];
  assign vector_factor_power = 3'd0;

endmodule