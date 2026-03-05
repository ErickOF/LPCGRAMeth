module ChannelRTL__91cc029d3b0c57f8
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_32_3_512__0e5e373c0405ceef recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_32_3_512__0e5e373c0405ceef send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  //-------------------------------------------------------------
  // Component queues[0:0]
  //-------------------------------------------------------------

  logic [0:0] queues__clk [0:0];
  logic [1:0] queues__count [0:0];
  logic [0:0] queues__reset [0:0];
  MemAccessPacket_32_3_512__0e5e373c0405ceef queues__recv__msg [0:0];
  logic [0:0] queues__recv__rdy [0:0];
  logic [0:0] queues__recv__val [0:0];
  MemAccessPacket_32_3_512__0e5e373c0405ceef queues__send__msg [0:0];
  logic [0:0] queues__send__rdy [0:0];
  logic [0:0] queues__send__val [0:0];

  NormalQueueRTL__8998ccae26c1d488 queues__0
  (
    .clk( queues__clk[0] ),
    .count( queues__count[0] ),
    .reset( queues__reset[0] ),
    .recv__msg( queues__recv__msg[0] ),
    .recv__rdy( queues__recv__rdy[0] ),
    .recv__val( queues__recv__val[0] ),
    .send__msg( queues__send__msg[0] ),
    .send__rdy( queues__send__rdy[0] ),
    .send__val( queues__send__val[0] )
  );

  //-------------------------------------------------------------
  // End of component queues[0:0]
  //-------------------------------------------------------------

  assign queues__clk[0] = clk;
  assign queues__reset[0] = reset;
  assign queues__recv__msg[0] = recv__msg;
  assign recv__rdy = queues__recv__rdy[0];
  assign queues__recv__val[0] = recv__val;
  assign send__msg = queues__send__msg[0];
  assign queues__send__rdy[0] = send__rdy;
  assign send__val = queues__send__val[0];

endmodule