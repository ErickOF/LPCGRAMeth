module BypassQueueRTL__5bfea575fa5cf9e7
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  output logic [0:0] count ,
  input  logic [0:0] reset ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv__msg  ,
  output logic [0:0] recv__rdy  ,
  input logic [0:0] recv__val  ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  //-------------------------------------------------------------
  // Component q
  //-------------------------------------------------------------

  logic [0:0] q__clk;
  logic [0:0] q__count;
  logic [0:0] q__reset;
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b q__recv__msg;
  logic [0:0] q__recv__rdy;
  logic [0:0] q__recv__val;
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b q__send__msg;
  logic [0:0] q__send__rdy;
  logic [0:0] q__send__val;

  BypassQueue1EntryRTL__0966cc2d8bc57328 q
  (
    .clk( q__clk ),
    .count( q__count ),
    .reset( q__reset ),
    .recv__msg( q__recv__msg ),
    .recv__rdy( q__recv__rdy ),
    .recv__val( q__recv__val ),
    .send__msg( q__send__msg ),
    .send__rdy( q__send__rdy ),
    .send__val( q__send__val )
  );

  //-------------------------------------------------------------
  // End of component q
  //-------------------------------------------------------------

  assign q__clk = clk;
  assign q__reset = reset;
  assign q__recv__msg = recv__msg;
  assign recv__rdy = q__recv__rdy;
  assign q__recv__val = recv__val;
  assign send__msg = q__send__msg;
  assign q__send__rdy = send__rdy;
  assign send__val = q__send__val;
  assign count = q__count;

endmodule