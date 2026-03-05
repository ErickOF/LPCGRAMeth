module NormalQueueCtrlRTL__num_entries_16
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  output logic [4:0] count ,
  output logic [3:0] raddr ,
  output logic [0:0] recv_rdy ,
  input  logic [0:0] recv_val ,
  input  logic [0:0] reset ,
  input  logic [0:0] send_rdy ,
  output logic [0:0] send_val ,
  output logic [3:0] waddr ,
  output logic [0:0] wen 
);
  localparam logic [4:0] __const__num_entries_at__lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy  = 5'd16;
  localparam logic [4:0] __const__num_entries_at_up_reg  = 5'd16;
  logic [3:0] head;
  logic [0:0] recv_xfer;
  logic [0:0] send_xfer;
  logic [3:0] tail;

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:121
  // s.recv_rdy  //= lambda: s.count < num_entries
  
  always_comb begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy
    recv_rdy = count < 5'( __const__num_entries_at__lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy );
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:124
  // s.recv_xfer //= lambda: s.recv_val & s.recv_rdy
  
  always_comb begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_xfer
    recv_xfer = recv_val & recv_rdy;
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:122
  // s.send_val  //= lambda: s.count > 0
  
  always_comb begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_send_val
    send_val = count > 5'd0;
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:125
  // s.send_xfer //= lambda: s.send_val & s.send_rdy
  
  always_comb begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_send_xfer
    send_xfer = send_val & send_rdy;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:127
  // @update_ff
  // def up_reg():
  // 
  //   if s.reset:
  //     s.head  <<= 0
  //     s.tail  <<= 0
  //     s.count <<= 0
  // 
  //   else:
  //     if s.recv_xfer:
  //       s.tail <<= s.tail + 1 if ( s.tail < num_entries - 1 ) else 0
  // 
  //     if s.send_xfer:
  //       s.head <<= s.head + 1 if ( s.head < num_entries -1 ) else 0
  // 
  //     if s.recv_xfer & ~s.send_xfer:
  //       s.count <<= s.count + 1
  //     elif ~s.recv_xfer & s.send_xfer:
  //       s.count <<= s.count - 1
  
  always_ff @(posedge clk) begin : up_reg
    if ( reset ) begin
      head <= 4'd0;
      tail <= 4'd0;
      count <= 5'd0;
    end
    else begin
      if ( recv_xfer ) begin
        tail <= ( tail < ( 4'( __const__num_entries_at_up_reg ) - 4'd1 ) ) ? tail + 4'd1 : 4'd0;
      end
      if ( send_xfer ) begin
        head <= ( head < ( 4'( __const__num_entries_at_up_reg ) - 4'd1 ) ) ? head + 4'd1 : 4'd0;
      end
      if ( recv_xfer & ( ~send_xfer ) ) begin
        count <= count + 5'd1;
      end
      else if ( ( ~recv_xfer ) & send_xfer ) begin
        count <= count - 5'd1;
      end
    end
  end

  assign wen = recv_xfer;
  assign waddr = tail;
  assign raddr = head;

endmodule