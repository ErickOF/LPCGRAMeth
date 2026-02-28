module InputUnitRTL__0a4d453f46c7c913
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_4_3_512__8e5c7af30d36e757 recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output MemAccessPacket_4_3_512__8e5c7af30d36e757 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  //-------------------------------------------------------------
  // Component queue
  //-------------------------------------------------------------

  logic [0:0] queue__clk;
  logic [1:0] queue__count;
  logic [0:0] queue__reset;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 queue__recv__msg;
  logic [0:0] queue__recv__rdy;
  logic [0:0] queue__recv__val;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 queue__send__msg;
  logic [0:0] queue__send__rdy;
  logic [0:0] queue__send__val;

  BypassQueueRTL__44de6a10d5685d6c queue
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

  assign queue__clk = clk;
  assign queue__reset = reset;
  assign queue__recv__msg = recv__msg;
  assign recv__rdy = queue__recv__rdy;
  assign queue__recv__val = recv__val;
  assign send__msg = queue__send__msg;
  assign queue__send__rdy = send__rdy;
  assign send__val = queue__send__val;

endmodule