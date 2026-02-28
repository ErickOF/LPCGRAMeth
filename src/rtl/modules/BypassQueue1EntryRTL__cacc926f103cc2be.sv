module BypassQueue1EntryRTL__cacc926f103cc2be
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  output logic [0:0] count ,
  input  logic [0:0] reset ,
  input InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff entry;
  logic [0:0] full;
  //-------------------------------------------------------------
  // Component bypass_mux
  //-------------------------------------------------------------

  logic [0:0] bypass_mux__clk;
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff bypass_mux__in_ [0:1];
  InterCgraPacket_4_4x1_4_8_4_CgraPayload__9d404f857a1e94ff bypass_mux__out;
  logic [0:0] bypass_mux__reset;
  logic [0:0] bypass_mux__sel;

  Mux__48b29568d81d0de5 bypass_mux
  (
    .clk( bypass_mux__clk ),
    .in_( bypass_mux__in_ ),
    .out( bypass_mux__out ),
    .reset( bypass_mux__reset ),
    .sel( bypass_mux__sel )
  );

  //-------------------------------------------------------------
  // End of component bypass_mux
  //-------------------------------------------------------------

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:553
  // s.recv.rdy //= lambda: ~s.full
  
  always_comb begin : _lambda__s_dut_bypass_queue_q_recv_rdy
    recv__rdy = ~full;
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:552
  // s.send.val //= lambda: s.full | s.recv.val
  
  always_comb begin : _lambda__s_dut_bypass_queue_q_send_val
    send__val = full | recv__val;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/lib/basic/val_rdy/queues.py:555
  // @update_ff
  // def ff_bypass1():
  //   if s.reset:
  //     s.full <<= 0
  //   else:
  //     s.full <<= ~s.send.rdy & (s.full | s.recv.val)
  // 
  //   # buffer the incoming message if we cannot directly send it out
  //   if ~s.send.rdy & ~s.full & s.recv.val:
  //     s.entry <<= s.recv.msg
  
  always_ff @(posedge clk) begin : ff_bypass1
    if ( reset ) begin
      full <= 1'd0;
    end
    else
      full <= ( ~send__rdy ) & ( full | recv__val );
    if ( ( ( ~send__rdy ) & ( ~full ) ) & recv__val ) begin
      entry <= recv__msg;
    end
  end

  assign bypass_mux__clk = clk;
  assign bypass_mux__reset = reset;
  assign bypass_mux__in_[0] = recv__msg;
  assign bypass_mux__in_[1] = entry;
  assign send__msg = bypass_mux__out;
  assign bypass_mux__sel = full;
  assign count = full;

endmodule