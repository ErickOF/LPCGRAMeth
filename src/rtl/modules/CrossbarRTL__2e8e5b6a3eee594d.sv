module CrossbarRTL__2e8e5b6a3eee594d
import cgra_pkg::*;
(
  input  logic [1:0] cgra_id ,
  input  logic [0:0] clear ,
  input  logic [0:0] clk ,
  input  logic [0:0] compute_done ,
  input  logic [0:0] crossbar_id ,
  input  logic [3:0] crossbar_outport [0:11],
  input  logic [2:0] ctrl_addr_inport ,
  input  logic [2:0] prologue_count_inport [0:7][0:7],
  input  logic [0:0] reset ,
  input  logic [2:0] tile_id ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data__msg [0:7] ,
  output logic [0:0] recv_data__rdy [0:7] ,
  input logic [0:0] recv_data__val [0:7] ,
  input CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f recv_opt__msg  ,
  output logic [0:0] recv_opt__rdy  ,
  input logic [0:0] recv_opt__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_data__msg [0:11] ,
  input logic [0:0] send_data__rdy [0:11] ,
  output logic [0:0] send_data__val [0:11] 
);
  localparam logic [3:0] __const__num_inports_at_update_signal  = 4'd8;
  localparam logic [3:0] __const__num_outports_at_update_signal  = 4'd12;
  localparam logic [6:0] __const__OPT_START  = 7'd0;
  localparam logic [3:0] __const__ctrl_mem_size_at_update_prologue_counter  = 4'd8;
  localparam logic [3:0] __const__num_inports_at_update_prologue_counter  = 4'd8;
  localparam logic [3:0] __const__ctrl_mem_size_at_update_prologue_counter_next  = 4'd8;
  localparam logic [3:0] __const__num_inports_at_update_prologue_counter_next  = 4'd8;
  localparam logic [3:0] __const__num_outports_at_update_prologue_counter_next  = 4'd12;
  localparam logic [3:0] __const__num_outports_at_update_prologue_allowing_vector  = 4'd12;
  localparam logic [3:0] __const__num_outports_at_update_prologue_or_valid_vector  = 4'd12;
  localparam logic [3:0] __const__num_outports_at_update_in_dir_vector  = 4'd12;
  localparam logic [3:0] __const__num_outports_at_update_rdy_vector  = 4'd12;
  localparam logic [3:0] __const__outport_towards_local_base_id_at_update_rdy_vector  = 4'd8;
  localparam logic [3:0] __const__num_outports_at_update_valid_vector  = 4'd12;
  localparam logic [3:0] __const__num_inports_at_update_recv_required_vector  = 4'd8;
  localparam logic [3:0] __const__num_outports_at_update_recv_required_vector  = 4'd12;
  localparam logic [3:0] __const__num_outports_at_update_send_required_vector  = 4'd12;
  logic [3:0] in_dir [0:11];
  logic [2:0] in_dir_local [0:11];
  logic [11:0] prologue_allowing_vector;
  logic [2:0] prologue_count_wire [0:7][0:7];
  logic [2:0] prologue_counter [0:7][0:7];
  logic [2:0] prologue_counter_next [0:7][0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data_msg [0:7];
  logic [0:0] recv_data_val [0:7];
  logic [7:0] recv_required_vector;
  logic [11:0] recv_valid_or_prologue_allowing_vector;
  logic [11:0] recv_valid_vector;
  logic [11:0] send_rdy_vector;
  logic [11:0] send_required_vector;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:153
  // @update
  // def update_in_dir_vector():
  // 
  //   for i in range(num_outports):
  //     s.in_dir[i] @= 0
  //     s.in_dir_local[i] @= 0
  // 
  //   for i in range(num_outports):
  //     s.in_dir[i] @= s.crossbar_outport[i]
  //     if s.in_dir[i] > 0:
  //       s.in_dir_local[i] @= trunc(s.in_dir[i] - 1, NumInportType)
  
  always_comb begin : update_in_dir_vector
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_in_dir_vector ); i += 1'd1 ) begin
      in_dir[4'(i)] = 4'd0;
      in_dir_local[4'(i)] = 3'd0;
    end
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_in_dir_vector ); i += 1'd1 ) begin
      in_dir[4'(i)] = crossbar_outport[4'(i)];
      if ( in_dir[4'(i)] > 4'd0 ) begin
        in_dir_local[4'(i)] = 3'(in_dir[4'(i)] - 4'd1);
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:134
  // @update
  // def update_prologue_allowing_vector():
  //   s.prologue_allowing_vector @= 0
  //   for i in range(num_outports):
  //     if s.in_dir[i] > 0:
  //       # Records whether the prologue steps have already been satisfied.
  //       s.prologue_allowing_vector[i] @= \
  //         (s.prologue_counter[s.ctrl_addr_inport][s.in_dir_local[i]] < \
  //          s.prologue_count_wire[s.ctrl_addr_inport][s.in_dir_local[i]])
  //     else:
  //       s.prologue_allowing_vector[i] @= 1
  
  always_comb begin : update_prologue_allowing_vector
    prologue_allowing_vector = 12'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_prologue_allowing_vector ); i += 1'd1 )
      if ( in_dir[4'(i)] > 4'd0 ) begin
        prologue_allowing_vector[4'(i)] = prologue_counter[ctrl_addr_inport][in_dir_local[4'(i)]] < prologue_count_wire[ctrl_addr_inport][in_dir_local[4'(i)]];
      end
      else
        prologue_allowing_vector[4'(i)] = 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:119
  // @update
  // def update_prologue_counter_next():
  //   # Nested-loop to update the prologue counter, to avoid dynamic indexing to
  //   # work-around Yosys issue: https://github.com/tancheng/VectorCGRA/issues/148
  //   for addr in range(ctrl_mem_size):
  //     for i in range(num_inports):
  //       s.prologue_counter_next[addr][i] @= s.prologue_counter[addr][i]
  //       for j in range(num_outports):
  //         if s.recv_opt.rdy & \
  //           (s.in_dir[j] > 0) & \
  //           (s.in_dir_local[j] == i) & \
  //           (addr == s.ctrl_addr_inport) & \
  //           (s.prologue_counter[addr][i] < s.prologue_count_wire[addr][i]):
  //           s.prologue_counter_next[addr][i] @= s.prologue_counter[addr][i] + 1
  
  always_comb begin : update_prologue_counter_next
    for ( int unsigned addr = 1'd0; addr < 4'( __const__ctrl_mem_size_at_update_prologue_counter_next ); addr += 1'd1 )
      for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_prologue_counter_next ); i += 1'd1 ) begin
        prologue_counter_next[3'(addr)][3'(i)] = prologue_counter[3'(addr)][3'(i)];
        for ( int unsigned j = 1'd0; j < 4'( __const__num_outports_at_update_prologue_counter_next ); j += 1'd1 )
          if ( ( ( ( recv_opt__rdy & ( in_dir[4'(j)] > 4'd0 ) ) & ( in_dir_local[4'(j)] == 3'(i) ) ) & ( 3'(addr) == ctrl_addr_inport ) ) & ( prologue_counter[3'(addr)][3'(i)] < prologue_count_wire[3'(addr)][3'(i)] ) ) begin
            prologue_counter_next[3'(addr)][3'(i)] = prologue_counter[3'(addr)][3'(i)] + 3'd1;
          end
      end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:146
  // @update
  // def update_prologue_or_valid_vector():
  //   s.recv_valid_or_prologue_allowing_vector @= 0
  //   for i in range(num_outports):
  //     s.recv_valid_or_prologue_allowing_vector[i] @= \
  //         s.recv_valid_vector[i] | s.prologue_allowing_vector[i]
  
  always_comb begin : update_prologue_or_valid_vector
    recv_valid_or_prologue_allowing_vector = 12'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_prologue_or_valid_vector ); i += 1'd1 )
      recv_valid_or_prologue_allowing_vector[4'(i)] = recv_valid_vector[4'(i)] | prologue_allowing_vector[4'(i)];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:165
  // @update
  // def update_rdy_vector():
  //   s.send_rdy_vector @= 0
  //   for i in range(num_outports):
  //     # The `num_inports` indicates the number of outports that go to other tiles.
  //     # Specifically, if the compute already done, we shouldn't care the ones
  //     # (i.e., i >= num_inports) go to the FU's inports. In other words, we skip
  //     # the rdy checking on the FU's inports (connecting from crossbar_outport) if
  //     # the compute is already completed.
  //     if (s.in_dir[i] > 0) & \
  //        (~s.compute_done | (i < outport_towards_local_base_id)):
  //       s.send_rdy_vector[i] @= s.send_data[i].rdy
  //     else:
  //       s.send_rdy_vector[i] @= 1
  
  always_comb begin : update_rdy_vector
    send_rdy_vector = 12'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_rdy_vector ); i += 1'd1 )
      if ( ( in_dir[4'(i)] > 4'd0 ) & ( ( ~compute_done ) | ( 4'(i) < 4'( __const__outport_towards_local_base_id_at_update_rdy_vector ) ) ) ) begin
        send_rdy_vector[4'(i)] = send_data__rdy[4'(i)];
      end
      else
        send_rdy_vector[4'(i)] = 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:189
  // @update
  // def update_recv_required_vector():
  //   for i in range(num_inports):
  //     s.recv_required_vector[i] @= 0
  // 
  //   for i in range(num_outports):
  //     if s.in_dir[i] > 0:
  //       s.recv_required_vector[s.in_dir_local[i]] @= 1
  
  always_comb begin : update_recv_required_vector
    for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_recv_required_vector ); i += 1'd1 )
      recv_required_vector[3'(i)] = 1'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_recv_required_vector ); i += 1'd1 )
      if ( in_dir[4'(i)] > 4'd0 ) begin
        recv_required_vector[in_dir_local[4'(i)]] = 1'd1;
      end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:198
  // @update
  // def update_send_required_vector():
  // 
  //   for i in range(num_outports):
  //     s.send_required_vector[i] @= 0
  // 
  //   for i in range(num_outports):
  //     if s.in_dir[i] > 0:
  //       s.send_required_vector[i] @= 1
  
  always_comb begin : update_send_required_vector
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_send_required_vector ); i += 1'd1 )
      send_required_vector[4'(i)] = 1'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_send_required_vector ); i += 1'd1 )
      if ( in_dir[4'(i)] > 4'd0 ) begin
        send_required_vector[4'(i)] = 1'd1;
      end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:82
  // @update
  // def update_signal():
  //   for i in range(num_inports):
  //     s.recv_data[i].rdy @= 0
  //   for i in range(num_outports):
  //     s.send_data[i].val @= 0
  //     s.send_data[i].msg @= DataType()
  //   s.recv_opt.rdy @= 0
  // 
  //   if s.recv_opt.val & (s.recv_opt.msg.operation != OPT_START):
  //     for i in range(num_inports):
  //       s.recv_data[i].rdy @= reduce_and(s.recv_valid_vector) & \
  //                             reduce_and(s.send_rdy_vector) & \
  //                             s.recv_required_vector[i]
  // 
  //     for i in range(num_outports):
  //       s.send_data[i].val @= reduce_and(s.recv_valid_vector) & \
  //                             s.send_required_vector[i]
  //       if reduce_and(s.recv_valid_vector) & \
  //          s.send_required_vector[i]:
  //         s.send_data[i].msg.payload @= s.recv_data_msg[s.in_dir_local[i]].payload
  //         s.send_data[i].msg.predicate @= s.recv_data_msg[s.in_dir_local[i]].predicate
  // 
  //     s.recv_opt.rdy @= reduce_and(s.send_rdy_vector) & \
  //                       reduce_and(s.recv_valid_or_prologue_allowing_vector)
  
  always_comb begin : update_signal
    for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_signal ); i += 1'd1 )
      recv_data__rdy[3'(i)] = 1'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_signal ); i += 1'd1 ) begin
      send_data__val[4'(i)] = 1'd0;
      send_data__msg[4'(i)] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    end
    recv_opt__rdy = 1'd0;
    if ( recv_opt__val & ( recv_opt__msg.operation != 7'( __const__OPT_START ) ) ) begin
      for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_signal ); i += 1'd1 )
        recv_data__rdy[3'(i)] = ( ( & recv_valid_vector ) & ( & send_rdy_vector ) ) & recv_required_vector[3'(i)];
      for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_signal ); i += 1'd1 ) begin
        send_data__val[4'(i)] = ( & recv_valid_vector ) & send_required_vector[4'(i)];
        if ( ( & recv_valid_vector ) & send_required_vector[4'(i)] ) begin
          send_data__msg[4'(i)].payload = recv_data_msg[in_dir_local[4'(i)]].payload;
          send_data__msg[4'(i)].predicate = recv_data_msg[in_dir_local[4'(i)]].predicate;
        end
      end
      recv_opt__rdy = ( & send_rdy_vector ) & ( & recv_valid_or_prologue_allowing_vector );
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:180
  // @update
  // def update_valid_vector():
  //   s.recv_valid_vector @= 0
  //   for i in range(num_outports):
  //     if s.in_dir[i] > 0:
  //       s.recv_valid_vector[i] @= s.recv_data_val[s.in_dir_local[i]]
  //     else:
  //       s.recv_valid_vector[i] @= 1
  
  always_comb begin : update_valid_vector
    recv_valid_vector = 12'd0;
    for ( int unsigned i = 1'd0; i < 4'( __const__num_outports_at_update_valid_vector ); i += 1'd1 )
      if ( in_dir[4'(i)] > 4'd0 ) begin
        recv_valid_vector[4'(i)] = recv_data_val[in_dir_local[4'(i)]];
      end
      else
        recv_valid_vector[4'(i)] = 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/CrossbarRTL.py:108
  // @update_ff
  // def update_prologue_counter():
  //   if s.reset | s.clear:
  //     for addr in range(ctrl_mem_size):
  //       for i in range(num_inports):
  //         s.prologue_counter[addr][i] <<= 0
  //   else:
  //     for addr in range(ctrl_mem_size):
  //       for i in range(num_inports):
  //         s.prologue_counter[addr][i] <<= s.prologue_counter_next[addr][i]
  
  always_ff @(posedge clk) begin : update_prologue_counter
    if ( reset | clear ) begin
      for ( int unsigned addr = 1'd0; addr < 4'( __const__ctrl_mem_size_at_update_prologue_counter ); addr += 1'd1 )
        for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_prologue_counter ); i += 1'd1 )
          prologue_counter[3'(addr)][3'(i)] <= 3'd0;
    end
    else
      for ( int unsigned addr = 1'd0; addr < 4'( __const__ctrl_mem_size_at_update_prologue_counter ); addr += 1'd1 )
        for ( int unsigned i = 1'd0; i < 4'( __const__num_inports_at_update_prologue_counter ); i += 1'd1 )
          prologue_counter[3'(addr)][3'(i)] <= prologue_counter_next[3'(addr)][3'(i)];
  end

  assign recv_data_msg[0] = recv_data__msg[0];
  assign recv_data_val[0] = recv_data__val[0];
  assign recv_data_msg[1] = recv_data__msg[1];
  assign recv_data_val[1] = recv_data__val[1];
  assign recv_data_msg[2] = recv_data__msg[2];
  assign recv_data_val[2] = recv_data__val[2];
  assign recv_data_msg[3] = recv_data__msg[3];
  assign recv_data_val[3] = recv_data__val[3];
  assign recv_data_msg[4] = recv_data__msg[4];
  assign recv_data_val[4] = recv_data__val[4];
  assign recv_data_msg[5] = recv_data__msg[5];
  assign recv_data_val[5] = recv_data__val[5];
  assign recv_data_msg[6] = recv_data__msg[6];
  assign recv_data_val[6] = recv_data__val[6];
  assign recv_data_msg[7] = recv_data__msg[7];
  assign recv_data_val[7] = recv_data__val[7];
  assign prologue_count_wire[0][0] = prologue_count_inport[0][0];
  assign prologue_count_wire[0][1] = prologue_count_inport[0][1];
  assign prologue_count_wire[0][2] = prologue_count_inport[0][2];
  assign prologue_count_wire[0][3] = prologue_count_inport[0][3];
  assign prologue_count_wire[0][4] = prologue_count_inport[0][4];
  assign prologue_count_wire[0][5] = prologue_count_inport[0][5];
  assign prologue_count_wire[0][6] = prologue_count_inport[0][6];
  assign prologue_count_wire[0][7] = prologue_count_inport[0][7];
  assign prologue_count_wire[1][0] = prologue_count_inport[1][0];
  assign prologue_count_wire[1][1] = prologue_count_inport[1][1];
  assign prologue_count_wire[1][2] = prologue_count_inport[1][2];
  assign prologue_count_wire[1][3] = prologue_count_inport[1][3];
  assign prologue_count_wire[1][4] = prologue_count_inport[1][4];
  assign prologue_count_wire[1][5] = prologue_count_inport[1][5];
  assign prologue_count_wire[1][6] = prologue_count_inport[1][6];
  assign prologue_count_wire[1][7] = prologue_count_inport[1][7];
  assign prologue_count_wire[2][0] = prologue_count_inport[2][0];
  assign prologue_count_wire[2][1] = prologue_count_inport[2][1];
  assign prologue_count_wire[2][2] = prologue_count_inport[2][2];
  assign prologue_count_wire[2][3] = prologue_count_inport[2][3];
  assign prologue_count_wire[2][4] = prologue_count_inport[2][4];
  assign prologue_count_wire[2][5] = prologue_count_inport[2][5];
  assign prologue_count_wire[2][6] = prologue_count_inport[2][6];
  assign prologue_count_wire[2][7] = prologue_count_inport[2][7];
  assign prologue_count_wire[3][0] = prologue_count_inport[3][0];
  assign prologue_count_wire[3][1] = prologue_count_inport[3][1];
  assign prologue_count_wire[3][2] = prologue_count_inport[3][2];
  assign prologue_count_wire[3][3] = prologue_count_inport[3][3];
  assign prologue_count_wire[3][4] = prologue_count_inport[3][4];
  assign prologue_count_wire[3][5] = prologue_count_inport[3][5];
  assign prologue_count_wire[3][6] = prologue_count_inport[3][6];
  assign prologue_count_wire[3][7] = prologue_count_inport[3][7];
  assign prologue_count_wire[4][0] = prologue_count_inport[4][0];
  assign prologue_count_wire[4][1] = prologue_count_inport[4][1];
  assign prologue_count_wire[4][2] = prologue_count_inport[4][2];
  assign prologue_count_wire[4][3] = prologue_count_inport[4][3];
  assign prologue_count_wire[4][4] = prologue_count_inport[4][4];
  assign prologue_count_wire[4][5] = prologue_count_inport[4][5];
  assign prologue_count_wire[4][6] = prologue_count_inport[4][6];
  assign prologue_count_wire[4][7] = prologue_count_inport[4][7];
  assign prologue_count_wire[5][0] = prologue_count_inport[5][0];
  assign prologue_count_wire[5][1] = prologue_count_inport[5][1];
  assign prologue_count_wire[5][2] = prologue_count_inport[5][2];
  assign prologue_count_wire[5][3] = prologue_count_inport[5][3];
  assign prologue_count_wire[5][4] = prologue_count_inport[5][4];
  assign prologue_count_wire[5][5] = prologue_count_inport[5][5];
  assign prologue_count_wire[5][6] = prologue_count_inport[5][6];
  assign prologue_count_wire[5][7] = prologue_count_inport[5][7];
  assign prologue_count_wire[6][0] = prologue_count_inport[6][0];
  assign prologue_count_wire[6][1] = prologue_count_inport[6][1];
  assign prologue_count_wire[6][2] = prologue_count_inport[6][2];
  assign prologue_count_wire[6][3] = prologue_count_inport[6][3];
  assign prologue_count_wire[6][4] = prologue_count_inport[6][4];
  assign prologue_count_wire[6][5] = prologue_count_inport[6][5];
  assign prologue_count_wire[6][6] = prologue_count_inport[6][6];
  assign prologue_count_wire[6][7] = prologue_count_inport[6][7];
  assign prologue_count_wire[7][0] = prologue_count_inport[7][0];
  assign prologue_count_wire[7][1] = prologue_count_inport[7][1];
  assign prologue_count_wire[7][2] = prologue_count_inport[7][2];
  assign prologue_count_wire[7][3] = prologue_count_inport[7][3];
  assign prologue_count_wire[7][4] = prologue_count_inport[7][4];
  assign prologue_count_wire[7][5] = prologue_count_inport[7][5];
  assign prologue_count_wire[7][6] = prologue_count_inport[7][6];
  assign prologue_count_wire[7][7] = prologue_count_inport[7][7];

endmodule