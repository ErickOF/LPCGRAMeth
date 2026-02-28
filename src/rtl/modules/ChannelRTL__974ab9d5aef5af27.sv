module ChannelRTL__974ab9d5aef5af27
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  //-------------------------------------------------------------
  // Component queues[0:0]
  //-------------------------------------------------------------

  logic [0:0] queues__clk [0:0];
  logic [1:0] queues__count [0:0];
  logic [0:0] queues__reset [0:0];
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b queues__recv__msg [0:0];
  logic [0:0] queues__recv__rdy [0:0];
  logic [0:0] queues__recv__val [0:0];
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b queues__send__msg [0:0];
  logic [0:0] queues__send__rdy [0:0];
  logic [0:0] queues__send__val [0:0];

  NormalQueueRTL__3f94efedd36bf361 queues__0
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