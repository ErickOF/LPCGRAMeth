module RingRouterRTL__de9fce29d18eb239
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [8:0] pos ,
  input  logic [0:0] reset ,
  input logic [0:0] recv__en [0:2] ,
  input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv__msg [0:2] ,
  output logic [0:0] recv__yum [0:2][0:1] ,
  output logic [0:0] send__en [0:2] ,
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send__msg [0:2] ,
  input logic [0:0] send__yum [0:2][0:1] 
);
  //-------------------------------------------------------------
  // Component input_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] input_units__clk [0:2];
  logic [0:0] input_units__reset [0:2];
  logic [0:0] input_units__recv__en [0:2];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d input_units__recv__msg [0:2];
  logic [0:0] input_units__recv__yum [0:2][0:1];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d input_units__send__msg [0:2][0:1];
  logic [0:0] input_units__send__rdy [0:2][0:1];
  logic [0:0] input_units__send__val [0:2][0:1];

  InputUnitCreditRTL__fb413909b40d24f2 input_units__0
  (
    .clk( input_units__clk[0] ),
    .reset( input_units__reset[0] ),
    .recv__en( input_units__recv__en[0] ),
    .recv__msg( input_units__recv__msg[0] ),
    .recv__yum( input_units__recv__yum[0] ),
    .send__msg( input_units__send__msg[0] ),
    .send__rdy( input_units__send__rdy[0] ),
    .send__val( input_units__send__val[0] )
  );

  InputUnitCreditRTL__fb413909b40d24f2 input_units__1
  (
    .clk( input_units__clk[1] ),
    .reset( input_units__reset[1] ),
    .recv__en( input_units__recv__en[1] ),
    .recv__msg( input_units__recv__msg[1] ),
    .recv__yum( input_units__recv__yum[1] ),
    .send__msg( input_units__send__msg[1] ),
    .send__rdy( input_units__send__rdy[1] ),
    .send__val( input_units__send__val[1] )
  );

  InputUnitCreditRTL__fb413909b40d24f2 input_units__2
  (
    .clk( input_units__clk[2] ),
    .reset( input_units__reset[2] ),
    .recv__en( input_units__recv__en[2] ),
    .recv__msg( input_units__recv__msg[2] ),
    .recv__yum( input_units__recv__yum[2] ),
    .send__msg( input_units__send__msg[2] ),
    .send__rdy( input_units__send__rdy[2] ),
    .send__val( input_units__send__val[2] )
  );

  //-------------------------------------------------------------
  // End of component input_units[0:2]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component output_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] output_units__clk [0:2];
  logic [0:0] output_units__reset [0:2];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d output_units__recv__msg [0:2];
  logic [0:0] output_units__recv__rdy [0:2];
  logic [0:0] output_units__recv__val [0:2];
  logic [0:0] output_units__send__en [0:2];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d output_units__send__msg [0:2];
  logic [0:0] output_units__send__yum [0:2][0:1];

  OutputUnitCreditRTL__d03a8e7c366bf9eb output_units__0
  (
    .clk( output_units__clk[0] ),
    .reset( output_units__reset[0] ),
    .recv__msg( output_units__recv__msg[0] ),
    .recv__rdy( output_units__recv__rdy[0] ),
    .recv__val( output_units__recv__val[0] ),
    .send__en( output_units__send__en[0] ),
    .send__msg( output_units__send__msg[0] ),
    .send__yum( output_units__send__yum[0] )
  );

  OutputUnitCreditRTL__d03a8e7c366bf9eb output_units__1
  (
    .clk( output_units__clk[1] ),
    .reset( output_units__reset[1] ),
    .recv__msg( output_units__recv__msg[1] ),
    .recv__rdy( output_units__recv__rdy[1] ),
    .recv__val( output_units__recv__val[1] ),
    .send__en( output_units__send__en[1] ),
    .send__msg( output_units__send__msg[1] ),
    .send__yum( output_units__send__yum[1] )
  );

  OutputUnitCreditRTL__d03a8e7c366bf9eb output_units__2
  (
    .clk( output_units__clk[2] ),
    .reset( output_units__reset[2] ),
    .recv__msg( output_units__recv__msg[2] ),
    .recv__rdy( output_units__recv__rdy[2] ),
    .recv__val( output_units__recv__val[2] ),
    .send__en( output_units__send__en[2] ),
    .send__msg( output_units__send__msg[2] ),
    .send__yum( output_units__send__yum[2] )
  );

  //-------------------------------------------------------------
  // End of component output_units[0:2]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component route_units[0:5]
  //-------------------------------------------------------------

  logic [0:0] route_units__clk [0:5];
  logic [8:0] route_units__pos [0:5];
  logic [0:0] route_units__reset [0:5];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d route_units__recv__msg [0:5];
  logic [0:0] route_units__recv__rdy [0:5];
  logic [0:0] route_units__recv__val [0:5];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d route_units__send__msg [0:5][0:2];
  logic [0:0] route_units__send__rdy [0:5][0:2];
  logic [0:0] route_units__send__val [0:5][0:2];

  RingRouteUnitRTL__feefaee243610805 route_units__0
  (
    .clk( route_units__clk[0] ),
    .pos( route_units__pos[0] ),
    .reset( route_units__reset[0] ),
    .recv__msg( route_units__recv__msg[0] ),
    .recv__rdy( route_units__recv__rdy[0] ),
    .recv__val( route_units__recv__val[0] ),
    .send__msg( route_units__send__msg[0] ),
    .send__rdy( route_units__send__rdy[0] ),
    .send__val( route_units__send__val[0] )
  );

  RingRouteUnitRTL__feefaee243610805 route_units__1
  (
    .clk( route_units__clk[1] ),
    .pos( route_units__pos[1] ),
    .reset( route_units__reset[1] ),
    .recv__msg( route_units__recv__msg[1] ),
    .recv__rdy( route_units__recv__rdy[1] ),
    .recv__val( route_units__recv__val[1] ),
    .send__msg( route_units__send__msg[1] ),
    .send__rdy( route_units__send__rdy[1] ),
    .send__val( route_units__send__val[1] )
  );

  RingRouteUnitRTL__feefaee243610805 route_units__2
  (
    .clk( route_units__clk[2] ),
    .pos( route_units__pos[2] ),
    .reset( route_units__reset[2] ),
    .recv__msg( route_units__recv__msg[2] ),
    .recv__rdy( route_units__recv__rdy[2] ),
    .recv__val( route_units__recv__val[2] ),
    .send__msg( route_units__send__msg[2] ),
    .send__rdy( route_units__send__rdy[2] ),
    .send__val( route_units__send__val[2] )
  );

  RingRouteUnitRTL__feefaee243610805 route_units__3
  (
    .clk( route_units__clk[3] ),
    .pos( route_units__pos[3] ),
    .reset( route_units__reset[3] ),
    .recv__msg( route_units__recv__msg[3] ),
    .recv__rdy( route_units__recv__rdy[3] ),
    .recv__val( route_units__recv__val[3] ),
    .send__msg( route_units__send__msg[3] ),
    .send__rdy( route_units__send__rdy[3] ),
    .send__val( route_units__send__val[3] )
  );

  RingRouteUnitRTL__feefaee243610805 route_units__4
  (
    .clk( route_units__clk[4] ),
    .pos( route_units__pos[4] ),
    .reset( route_units__reset[4] ),
    .recv__msg( route_units__recv__msg[4] ),
    .recv__rdy( route_units__recv__rdy[4] ),
    .recv__val( route_units__recv__val[4] ),
    .send__msg( route_units__send__msg[4] ),
    .send__rdy( route_units__send__rdy[4] ),
    .send__val( route_units__send__val[4] )
  );

  RingRouteUnitRTL__feefaee243610805 route_units__5
  (
    .clk( route_units__clk[5] ),
    .pos( route_units__pos[5] ),
    .reset( route_units__reset[5] ),
    .recv__msg( route_units__recv__msg[5] ),
    .recv__rdy( route_units__recv__rdy[5] ),
    .recv__val( route_units__recv__val[5] ),
    .send__msg( route_units__send__msg[5] ),
    .send__rdy( route_units__send__rdy[5] ),
    .send__val( route_units__send__val[5] )
  );

  //-------------------------------------------------------------
  // End of component route_units[0:5]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component switch_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] switch_units__clk [0:2];
  logic [0:0] switch_units__reset [0:2];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d switch_units__recv__msg [0:2][0:5];
  logic [0:0] switch_units__recv__rdy [0:2][0:5];
  logic [0:0] switch_units__recv__val [0:2][0:5];
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d switch_units__send__msg [0:2];
  logic [0:0] switch_units__send__rdy [0:2];
  logic [0:0] switch_units__send__val [0:2];

  SwitchUnitRTL__ad8349834852327a switch_units__0
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

  SwitchUnitRTL__ad8349834852327a switch_units__1
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

  SwitchUnitRTL__ad8349834852327a switch_units__2
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

  //-------------------------------------------------------------
  // End of component switch_units[0:2]
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
  assign route_units__clk[3] = clk;
  assign route_units__reset[3] = reset;
  assign route_units__clk[4] = clk;
  assign route_units__reset[4] = reset;
  assign route_units__clk[5] = clk;
  assign route_units__reset[5] = reset;
  assign switch_units__clk[0] = clk;
  assign switch_units__reset[0] = reset;
  assign switch_units__clk[1] = clk;
  assign switch_units__reset[1] = reset;
  assign switch_units__clk[2] = clk;
  assign switch_units__reset[2] = reset;
  assign output_units__clk[0] = clk;
  assign output_units__reset[0] = reset;
  assign output_units__clk[1] = clk;
  assign output_units__reset[1] = reset;
  assign output_units__clk[2] = clk;
  assign output_units__reset[2] = reset;
  assign input_units__recv__en[0] = recv__en[0];
  assign input_units__recv__msg[0] = recv__msg[0];
  assign recv__yum[0][0] = input_units__recv__yum[0][0];
  assign recv__yum[0][1] = input_units__recv__yum[0][1];
  assign route_units__recv__msg[0] = input_units__send__msg[0][0];
  assign input_units__send__rdy[0][0] = route_units__recv__rdy[0];
  assign route_units__recv__val[0] = input_units__send__val[0][0];
  assign route_units__pos[0] = pos;
  assign route_units__recv__msg[1] = input_units__send__msg[0][1];
  assign input_units__send__rdy[0][1] = route_units__recv__rdy[1];
  assign route_units__recv__val[1] = input_units__send__val[0][1];
  assign route_units__pos[1] = pos;
  assign input_units__recv__en[1] = recv__en[1];
  assign input_units__recv__msg[1] = recv__msg[1];
  assign recv__yum[1][0] = input_units__recv__yum[1][0];
  assign recv__yum[1][1] = input_units__recv__yum[1][1];
  assign route_units__recv__msg[2] = input_units__send__msg[1][0];
  assign input_units__send__rdy[1][0] = route_units__recv__rdy[2];
  assign route_units__recv__val[2] = input_units__send__val[1][0];
  assign route_units__pos[2] = pos;
  assign route_units__recv__msg[3] = input_units__send__msg[1][1];
  assign input_units__send__rdy[1][1] = route_units__recv__rdy[3];
  assign route_units__recv__val[3] = input_units__send__val[1][1];
  assign route_units__pos[3] = pos;
  assign input_units__recv__en[2] = recv__en[2];
  assign input_units__recv__msg[2] = recv__msg[2];
  assign recv__yum[2][0] = input_units__recv__yum[2][0];
  assign recv__yum[2][1] = input_units__recv__yum[2][1];
  assign route_units__recv__msg[4] = input_units__send__msg[2][0];
  assign input_units__send__rdy[2][0] = route_units__recv__rdy[4];
  assign route_units__recv__val[4] = input_units__send__val[2][0];
  assign route_units__pos[4] = pos;
  assign route_units__recv__msg[5] = input_units__send__msg[2][1];
  assign input_units__send__rdy[2][1] = route_units__recv__rdy[5];
  assign route_units__recv__val[5] = input_units__send__val[2][1];
  assign route_units__pos[5] = pos;
  assign switch_units__recv__msg[0][0] = route_units__send__msg[0][0];
  assign route_units__send__rdy[0][0] = switch_units__recv__rdy[0][0];
  assign switch_units__recv__val[0][0] = route_units__send__val[0][0];
  assign switch_units__recv__msg[1][0] = route_units__send__msg[0][1];
  assign route_units__send__rdy[0][1] = switch_units__recv__rdy[1][0];
  assign switch_units__recv__val[1][0] = route_units__send__val[0][1];
  assign switch_units__recv__msg[2][0] = route_units__send__msg[0][2];
  assign route_units__send__rdy[0][2] = switch_units__recv__rdy[2][0];
  assign switch_units__recv__val[2][0] = route_units__send__val[0][2];
  assign switch_units__recv__msg[0][1] = route_units__send__msg[1][0];
  assign route_units__send__rdy[1][0] = switch_units__recv__rdy[0][1];
  assign switch_units__recv__val[0][1] = route_units__send__val[1][0];
  assign switch_units__recv__msg[1][1] = route_units__send__msg[1][1];
  assign route_units__send__rdy[1][1] = switch_units__recv__rdy[1][1];
  assign switch_units__recv__val[1][1] = route_units__send__val[1][1];
  assign switch_units__recv__msg[2][1] = route_units__send__msg[1][2];
  assign route_units__send__rdy[1][2] = switch_units__recv__rdy[2][1];
  assign switch_units__recv__val[2][1] = route_units__send__val[1][2];
  assign switch_units__recv__msg[0][2] = route_units__send__msg[2][0];
  assign route_units__send__rdy[2][0] = switch_units__recv__rdy[0][2];
  assign switch_units__recv__val[0][2] = route_units__send__val[2][0];
  assign switch_units__recv__msg[1][2] = route_units__send__msg[2][1];
  assign route_units__send__rdy[2][1] = switch_units__recv__rdy[1][2];
  assign switch_units__recv__val[1][2] = route_units__send__val[2][1];
  assign switch_units__recv__msg[2][2] = route_units__send__msg[2][2];
  assign route_units__send__rdy[2][2] = switch_units__recv__rdy[2][2];
  assign switch_units__recv__val[2][2] = route_units__send__val[2][2];
  assign switch_units__recv__msg[0][3] = route_units__send__msg[3][0];
  assign route_units__send__rdy[3][0] = switch_units__recv__rdy[0][3];
  assign switch_units__recv__val[0][3] = route_units__send__val[3][0];
  assign switch_units__recv__msg[1][3] = route_units__send__msg[3][1];
  assign route_units__send__rdy[3][1] = switch_units__recv__rdy[1][3];
  assign switch_units__recv__val[1][3] = route_units__send__val[3][1];
  assign switch_units__recv__msg[2][3] = route_units__send__msg[3][2];
  assign route_units__send__rdy[3][2] = switch_units__recv__rdy[2][3];
  assign switch_units__recv__val[2][3] = route_units__send__val[3][2];
  assign switch_units__recv__msg[0][4] = route_units__send__msg[4][0];
  assign route_units__send__rdy[4][0] = switch_units__recv__rdy[0][4];
  assign switch_units__recv__val[0][4] = route_units__send__val[4][0];
  assign switch_units__recv__msg[1][4] = route_units__send__msg[4][1];
  assign route_units__send__rdy[4][1] = switch_units__recv__rdy[1][4];
  assign switch_units__recv__val[1][4] = route_units__send__val[4][1];
  assign switch_units__recv__msg[2][4] = route_units__send__msg[4][2];
  assign route_units__send__rdy[4][2] = switch_units__recv__rdy[2][4];
  assign switch_units__recv__val[2][4] = route_units__send__val[4][2];
  assign switch_units__recv__msg[0][5] = route_units__send__msg[5][0];
  assign route_units__send__rdy[5][0] = switch_units__recv__rdy[0][5];
  assign switch_units__recv__val[0][5] = route_units__send__val[5][0];
  assign switch_units__recv__msg[1][5] = route_units__send__msg[5][1];
  assign route_units__send__rdy[5][1] = switch_units__recv__rdy[1][5];
  assign switch_units__recv__val[1][5] = route_units__send__val[5][1];
  assign switch_units__recv__msg[2][5] = route_units__send__msg[5][2];
  assign route_units__send__rdy[5][2] = switch_units__recv__rdy[2][5];
  assign switch_units__recv__val[2][5] = route_units__send__val[5][2];
  assign output_units__recv__msg[0] = switch_units__send__msg[0];
  assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
  assign output_units__recv__val[0] = switch_units__send__val[0];
  assign send__en[0] = output_units__send__en[0];
  assign send__msg[0] = output_units__send__msg[0];
  assign output_units__send__yum[0][0] = send__yum[0][0];
  assign output_units__send__yum[0][1] = send__yum[0][1];
  assign output_units__recv__msg[1] = switch_units__send__msg[1];
  assign switch_units__send__rdy[1] = output_units__recv__rdy[1];
  assign output_units__recv__val[1] = switch_units__send__val[1];
  assign send__en[1] = output_units__send__en[1];
  assign send__msg[1] = output_units__send__msg[1];
  assign output_units__send__yum[1][0] = send__yum[1][0];
  assign output_units__send__yum[1][1] = send__yum[1][1];
  assign output_units__recv__msg[2] = switch_units__send__msg[2];
  assign switch_units__send__rdy[2] = output_units__recv__rdy[2];
  assign output_units__recv__val[2] = switch_units__send__val[2];
  assign send__en[2] = output_units__send__en[2];
  assign send__msg[2] = output_units__send__msg[2];
  assign output_units__send__yum[2][0] = send__yum[2][0];
  assign output_units__send__yum[2][1] = send__yum[2][1];

endmodule