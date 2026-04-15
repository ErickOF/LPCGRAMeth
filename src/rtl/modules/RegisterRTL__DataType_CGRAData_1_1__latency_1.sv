module RegisterRTL__DataType_CGRAData_1_1__latency_1
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv__en,
  input CGRAData_1_1 recv__msg,
  output logic [0:0] recv__rdy,
  output logic [0:0] send__en,
  output CGRAData_1_1 send__msg,
  input logic [0:0] send__rdy
);
  localparam logic [31:0] latency = 32'd1;
  //-------------------------------------------------------------
  // Component queues[0:0]
  //-------------------------------------------------------------

  logic [0:0] queues__clk [0:0] ;
  logic [1:0] queues__count [0:0] ;
  logic [0:0] queues__reset [0:0] ;
  logic [0:0] queues__deq__en [0:0] ;
  logic [0:0] queues__deq__rdy [0:0] ;
  CGRAData_1_1 queues__deq__ret [0:0] ;
  logic [0:0] queues__enq__en [0:0] ;
  CGRAData_1_1 queues__enq__msg [0:0] ;
  logic [0:0] queues__enq__rdy [0:0] ;

  NormalQueueRTL__EntryType_CGRAData_1_1__num_entries_2 queues__0
  (
    .clk( queues__clk[0] ),
    .count( queues__count[0] ),
    .reset( queues__reset[0] ),
    .deq__en( queues__deq__en[0] ),
    .deq__rdy( queues__deq__rdy[0] ),
    .deq__ret( queues__deq__ret[0] ),
    .enq__en( queues__enq__en[0] ),
    .enq__msg( queues__enq__msg[0] ),
    .enq__rdy( queues__enq__rdy[0] )
  );

  //-------------------------------------------------------------
  // End of component queues[0:0]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/rf/RegisterRTL.py:30
  //   @s.update
  //   def process():
  //     s.recv.rdy = s.queues[0].enq.rdy
  //     s.queues[0].enq.msg = s.recv.msg
  //     s.queues[0].enq.en  = s.recv.en and s.queues[0].enq.rdy
  //     for i in range(s.latency - 1):
  //       s.queues[i+1].enq.msg = s.queues[i].deq.ret
  //       s.queues[i+1].enq.en  = s.queues[i].deq.rdy and s.queues[i+1].enq.rdy
  //       s.queues[i].deq.en    = s.queues[i+1].enq.en
  // 
  //     s.send.msg  = s.queues[s.latency-1].deq.ret
  //     s.send.en   = s.send.rdy and s.queues[s.latency-1].deq.rdy
  //     s.queues[s.latency-1].deq.en   = s.send.en
  
  always_comb begin : process
    recv__rdy = queues__enq__rdy[0];
    queues__enq__msg[0] = recv__msg;
    queues__enq__en[0] = recv__en && queues__enq__rdy[0];
    for ( int i = 0; i < latency - 1; i += 1 ) begin
      queues__enq__msg[i + 1] = queues__deq__ret[i];
      queues__enq__en[i + 1] = queues__deq__rdy[i] && queues__enq__rdy[i + 1];
      queues__deq__en[i] = queues__enq__en[i + 1];
    end
    send__msg = queues__deq__ret[latency - 1];
    send__en = send__rdy && queues__deq__rdy[latency - 1];
    queues__deq__en[latency - 1] = send__en;
  end

  assign queues__clk[0] = clk;
  assign queues__reset[0] = reset;

endmodule