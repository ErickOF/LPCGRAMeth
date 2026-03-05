module XbarBypassQueueRTL__9671b847394a6dc3
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_3_4_512__8e5c7af30d36e757 recv__msg [0:2] ,
  output logic [0:0] recv__rdy [0:2] ,
  input logic [0:0] recv__val [0:2] ,
  output MemAccessPacket_3_4_512__8e5c7af30d36e757 send__msg [0:3] ,
  input logic [0:0] send__rdy [0:3] ,
  output logic [0:0] send__val [0:3] 
);
  //-------------------------------------------------------------
  // Component input_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] input_units__clk [0:2];
  logic [0:0] input_units__reset [0:2];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 input_units__recv__msg [0:2];
  logic [0:0] input_units__recv__rdy [0:2];
  logic [0:0] input_units__recv__val [0:2];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 input_units__send__msg [0:2];
  logic [0:0] input_units__send__rdy [0:2];
  logic [0:0] input_units__send__val [0:2];

  InputUnitRTL__650aef5c30cfb328 input_units__0
  (
    .clk( input_units__clk[0] ),
    .reset( input_units__reset[0] ),
    .recv__msg( input_units__recv__msg[0] ),
    .recv__rdy( input_units__recv__rdy[0] ),
    .recv__val( input_units__recv__val[0] ),
    .send__msg( input_units__send__msg[0] ),
    .send__rdy( input_units__send__rdy[0] ),
    .send__val( input_units__send__val[0] )
  );

  InputUnitRTL__650aef5c30cfb328 input_units__1
  (
    .clk( input_units__clk[1] ),
    .reset( input_units__reset[1] ),
    .recv__msg( input_units__recv__msg[1] ),
    .recv__rdy( input_units__recv__rdy[1] ),
    .recv__val( input_units__recv__val[1] ),
    .send__msg( input_units__send__msg[1] ),
    .send__rdy( input_units__send__rdy[1] ),
    .send__val( input_units__send__val[1] )
  );

  InputUnitRTL__650aef5c30cfb328 input_units__2
  (
    .clk( input_units__clk[2] ),
    .reset( input_units__reset[2] ),
    .recv__msg( input_units__recv__msg[2] ),
    .recv__rdy( input_units__recv__rdy[2] ),
    .recv__val( input_units__recv__val[2] ),
    .send__msg( input_units__send__msg[2] ),
    .send__rdy( input_units__send__rdy[2] ),
    .send__val( input_units__send__val[2] )
  );

  //-------------------------------------------------------------
  // End of component input_units[0:2]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component output_units[0:3]
  //-------------------------------------------------------------

  logic [0:0] output_units__clk [0:3];
  logic [0:0] output_units__reset [0:3];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 output_units__recv__msg [0:3];
  logic [0:0] output_units__recv__rdy [0:3];
  logic [0:0] output_units__recv__val [0:3];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 output_units__send__msg [0:3];
  logic [0:0] output_units__send__rdy [0:3];
  logic [0:0] output_units__send__val [0:3];

  OutputUnitRTL__080a73c660696c5b output_units__0
  (
    .clk( output_units__clk[0] ),
    .reset( output_units__reset[0] ),
    .recv__msg( output_units__recv__msg[0] ),
    .recv__rdy( output_units__recv__rdy[0] ),
    .recv__val( output_units__recv__val[0] ),
    .send__msg( output_units__send__msg[0] ),
    .send__rdy( output_units__send__rdy[0] ),
    .send__val( output_units__send__val[0] )
  );

  OutputUnitRTL__080a73c660696c5b output_units__1
  (
    .clk( output_units__clk[1] ),
    .reset( output_units__reset[1] ),
    .recv__msg( output_units__recv__msg[1] ),
    .recv__rdy( output_units__recv__rdy[1] ),
    .recv__val( output_units__recv__val[1] ),
    .send__msg( output_units__send__msg[1] ),
    .send__rdy( output_units__send__rdy[1] ),
    .send__val( output_units__send__val[1] )
  );

  OutputUnitRTL__080a73c660696c5b output_units__2
  (
    .clk( output_units__clk[2] ),
    .reset( output_units__reset[2] ),
    .recv__msg( output_units__recv__msg[2] ),
    .recv__rdy( output_units__recv__rdy[2] ),
    .recv__val( output_units__recv__val[2] ),
    .send__msg( output_units__send__msg[2] ),
    .send__rdy( output_units__send__rdy[2] ),
    .send__val( output_units__send__val[2] )
  );

  OutputUnitRTL__080a73c660696c5b output_units__3
  (
    .clk( output_units__clk[3] ),
    .reset( output_units__reset[3] ),
    .recv__msg( output_units__recv__msg[3] ),
    .recv__rdy( output_units__recv__rdy[3] ),
    .recv__val( output_units__recv__val[3] ),
    .send__msg( output_units__send__msg[3] ),
    .send__rdy( output_units__send__rdy[3] ),
    .send__val( output_units__send__val[3] )
  );

  //-------------------------------------------------------------
  // End of component output_units[0:3]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component route_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] route_units__clk [0:2];
  logic [0:0] route_units__reset [0:2];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 route_units__recv__msg [0:2];
  logic [0:0] route_units__recv__rdy [0:2];
  logic [0:0] route_units__recv__val [0:2];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 route_units__send__msg [0:2][0:3];
  logic [0:0] route_units__send__rdy [0:2][0:3];
  logic [0:0] route_units__send__val [0:2][0:3];

  XbarRouteUnitRTL__34e11fe36f929554 route_units__0
  (
    .clk( route_units__clk[0] ),
    .reset( route_units__reset[0] ),
    .recv__msg( route_units__recv__msg[0] ),
    .recv__rdy( route_units__recv__rdy[0] ),
    .recv__val( route_units__recv__val[0] ),
    .send__msg( route_units__send__msg[0] ),
    .send__rdy( route_units__send__rdy[0] ),
    .send__val( route_units__send__val[0] )
  );

  XbarRouteUnitRTL__34e11fe36f929554 route_units__1
  (
    .clk( route_units__clk[1] ),
    .reset( route_units__reset[1] ),
    .recv__msg( route_units__recv__msg[1] ),
    .recv__rdy( route_units__recv__rdy[1] ),
    .recv__val( route_units__recv__val[1] ),
    .send__msg( route_units__send__msg[1] ),
    .send__rdy( route_units__send__rdy[1] ),
    .send__val( route_units__send__val[1] )
  );

  XbarRouteUnitRTL__34e11fe36f929554 route_units__2
  (
    .clk( route_units__clk[2] ),
    .reset( route_units__reset[2] ),
    .recv__msg( route_units__recv__msg[2] ),
    .recv__rdy( route_units__recv__rdy[2] ),
    .recv__val( route_units__recv__val[2] ),
    .send__msg( route_units__send__msg[2] ),
    .send__rdy( route_units__send__rdy[2] ),
    .send__val( route_units__send__val[2] )
  );

  //-------------------------------------------------------------
  // End of component route_units[0:2]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component switch_units[0:3]
  //-------------------------------------------------------------

  logic [0:0] switch_units__clk [0:3];
  logic [0:0] switch_units__reset [0:3];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 switch_units__recv__msg [0:3][0:2];
  logic [0:0] switch_units__recv__rdy [0:3][0:2];
  logic [0:0] switch_units__recv__val [0:3][0:2];
  MemAccessPacket_3_4_512__8e5c7af30d36e757 switch_units__send__msg [0:3];
  logic [0:0] switch_units__send__rdy [0:3];
  logic [0:0] switch_units__send__val [0:3];

  SwitchUnitRTL__da45a6cfd5b55ca9 switch_units__0
  (
    .clk( switch_units__clk[0] ),
    .reset( switch_units__reset[0] ),
    .recv__msg( switch_units__recv__msg[0] ),
    .recv__rdy( switch_units__recv__rdy[0] ),
    .recv__val( switch_units__recv__val[0] ),
    .send__msg( switch_units__send__msg[0] ),
    .send__rdy( switch_units__send__rdy[0] ),
    .send__val( switch_units__send__val[0] )
  );

  SwitchUnitRTL__da45a6cfd5b55ca9 switch_units__1
  (
    .clk( switch_units__clk[1] ),
    .reset( switch_units__reset[1] ),
    .recv__msg( switch_units__recv__msg[1] ),
    .recv__rdy( switch_units__recv__rdy[1] ),
    .recv__val( switch_units__recv__val[1] ),
    .send__msg( switch_units__send__msg[1] ),
    .send__rdy( switch_units__send__rdy[1] ),
    .send__val( switch_units__send__val[1] )
  );

  SwitchUnitRTL__da45a6cfd5b55ca9 switch_units__2
  (
    .clk( switch_units__clk[2] ),
    .reset( switch_units__reset[2] ),
    .recv__msg( switch_units__recv__msg[2] ),
    .recv__rdy( switch_units__recv__rdy[2] ),
    .recv__val( switch_units__recv__val[2] ),
    .send__msg( switch_units__send__msg[2] ),
    .send__rdy( switch_units__send__rdy[2] ),
    .send__val( switch_units__send__val[2] )
  );

  SwitchUnitRTL__da45a6cfd5b55ca9 switch_units__3
  (
    .clk( switch_units__clk[3] ),
    .reset( switch_units__reset[3] ),
    .recv__msg( switch_units__recv__msg[3] ),
    .recv__rdy( switch_units__recv__rdy[3] ),
    .recv__val( switch_units__recv__val[3] ),
    .send__msg( switch_units__send__msg[3] ),
    .send__rdy( switch_units__send__rdy[3] ),
    .send__val( switch_units__send__val[3] )
  );

  //-------------------------------------------------------------
  // End of component switch_units[0:3]
  //-------------------------------------------------------------

  assign input_units__clk[0] = clk;
  assign input_units__reset[0] = reset;
  assign input_units__clk[1] = clk;
  assign input_units__reset[1] = reset;
  assign input_units__clk[2] = clk;
  assign input_units__reset[2] = reset;
  assign route_units__clk[0] = clk;
  assign route_units__reset[0] = reset;
  assign route_units__clk[1] = clk;
  assign route_units__reset[1] = reset;
  assign route_units__clk[2] = clk;
  assign route_units__reset[2] = reset;
  assign switch_units__clk[0] = clk;
  assign switch_units__reset[0] = reset;
  assign switch_units__clk[1] = clk;
  assign switch_units__reset[1] = reset;
  assign switch_units__clk[2] = clk;
  assign switch_units__reset[2] = reset;
  assign switch_units__clk[3] = clk;
  assign switch_units__reset[3] = reset;
  assign output_units__clk[0] = clk;
  assign output_units__reset[0] = reset;
  assign output_units__clk[1] = clk;
  assign output_units__reset[1] = reset;
  assign output_units__clk[2] = clk;
  assign output_units__reset[2] = reset;
  assign output_units__clk[3] = clk;
  assign output_units__reset[3] = reset;
  assign input_units__recv__msg[0] = recv__msg[0];
  assign recv__rdy[0] = input_units__recv__rdy[0];
  assign input_units__recv__val[0] = recv__val[0];
  assign route_units__recv__msg[0] = input_units__send__msg[0];
  assign input_units__send__rdy[0] = route_units__recv__rdy[0];
  assign route_units__recv__val[0] = input_units__send__val[0];
  assign input_units__recv__msg[1] = recv__msg[1];
  assign recv__rdy[1] = input_units__recv__rdy[1];
  assign input_units__recv__val[1] = recv__val[1];
  assign route_units__recv__msg[1] = input_units__send__msg[1];
  assign input_units__send__rdy[1] = route_units__recv__rdy[1];
  assign route_units__recv__val[1] = input_units__send__val[1];
  assign input_units__recv__msg[2] = recv__msg[2];
  assign recv__rdy[2] = input_units__recv__rdy[2];
  assign input_units__recv__val[2] = recv__val[2];
  assign route_units__recv__msg[2] = input_units__send__msg[2];
  assign input_units__send__rdy[2] = route_units__recv__rdy[2];
  assign route_units__recv__val[2] = input_units__send__val[2];
  assign switch_units__recv__msg[0][0] = route_units__send__msg[0][0];
  assign route_units__send__rdy[0][0] = switch_units__recv__rdy[0][0];
  assign switch_units__recv__val[0][0] = route_units__send__val[0][0];
  assign switch_units__recv__msg[1][0] = route_units__send__msg[0][1];
  assign route_units__send__rdy[0][1] = switch_units__recv__rdy[1][0];
  assign switch_units__recv__val[1][0] = route_units__send__val[0][1];
  assign switch_units__recv__msg[2][0] = route_units__send__msg[0][2];
  assign route_units__send__rdy[0][2] = switch_units__recv__rdy[2][0];
  assign switch_units__recv__val[2][0] = route_units__send__val[0][2];
  assign switch_units__recv__msg[3][0] = route_units__send__msg[0][3];
  assign route_units__send__rdy[0][3] = switch_units__recv__rdy[3][0];
  assign switch_units__recv__val[3][0] = route_units__send__val[0][3];
  assign switch_units__recv__msg[0][1] = route_units__send__msg[1][0];
  assign route_units__send__rdy[1][0] = switch_units__recv__rdy[0][1];
  assign switch_units__recv__val[0][1] = route_units__send__val[1][0];
  assign switch_units__recv__msg[1][1] = route_units__send__msg[1][1];
  assign route_units__send__rdy[1][1] = switch_units__recv__rdy[1][1];
  assign switch_units__recv__val[1][1] = route_units__send__val[1][1];
  assign switch_units__recv__msg[2][1] = route_units__send__msg[1][2];
  assign route_units__send__rdy[1][2] = switch_units__recv__rdy[2][1];
  assign switch_units__recv__val[2][1] = route_units__send__val[1][2];
  assign switch_units__recv__msg[3][1] = route_units__send__msg[1][3];
  assign route_units__send__rdy[1][3] = switch_units__recv__rdy[3][1];
  assign switch_units__recv__val[3][1] = route_units__send__val[1][3];
  assign switch_units__recv__msg[0][2] = route_units__send__msg[2][0];
  assign route_units__send__rdy[2][0] = switch_units__recv__rdy[0][2];
  assign switch_units__recv__val[0][2] = route_units__send__val[2][0];
  assign switch_units__recv__msg[1][2] = route_units__send__msg[2][1];
  assign route_units__send__rdy[2][1] = switch_units__recv__rdy[1][2];
  assign switch_units__recv__val[1][2] = route_units__send__val[2][1];
  assign switch_units__recv__msg[2][2] = route_units__send__msg[2][2];
  assign route_units__send__rdy[2][2] = switch_units__recv__rdy[2][2];
  assign switch_units__recv__val[2][2] = route_units__send__val[2][2];
  assign switch_units__recv__msg[3][2] = route_units__send__msg[2][3];
  assign route_units__send__rdy[2][3] = switch_units__recv__rdy[3][2];
  assign switch_units__recv__val[3][2] = route_units__send__val[2][3];
  assign output_units__recv__msg[0] = switch_units__send__msg[0];
  assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
  assign output_units__recv__val[0] = switch_units__send__val[0];
  assign send__msg[0] = output_units__send__msg[0];
  assign output_units__send__rdy[0] = send__rdy[0];
  assign send__val[0] = output_units__send__val[0];
  assign output_units__recv__msg[1] = switch_units__send__msg[1];
  assign switch_units__send__rdy[1] = output_units__recv__rdy[1];
  assign output_units__recv__val[1] = switch_units__send__val[1];
  assign send__msg[1] = output_units__send__msg[1];
  assign output_units__send__rdy[1] = send__rdy[1];
  assign send__val[1] = output_units__send__val[1];
  assign output_units__recv__msg[2] = switch_units__send__msg[2];
  assign switch_units__send__rdy[2] = output_units__recv__rdy[2];
  assign output_units__recv__val[2] = switch_units__send__val[2];
  assign send__msg[2] = output_units__send__msg[2];
  assign output_units__send__rdy[2] = send__rdy[2];
  assign send__val[2] = output_units__send__val[2];
  assign output_units__recv__msg[3] = switch_units__send__msg[3];
  assign switch_units__send__rdy[3] = output_units__recv__rdy[3];
  assign output_units__recv__val[3] = switch_units__send__val[3];
  assign send__msg[3] = output_units__send__msg[3];
  assign output_units__send__rdy[3] = send__rdy[3];
  assign send__val[3] = output_units__send__val[3];

endmodule