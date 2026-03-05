module XbarRTL__40ca80b1d76a0751
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c recv__msg [0:5] ,
  output logic [0:0] recv__rdy [0:5] ,
  input logic [0:0] recv__val [0:5] ,
  output ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c send__msg [0:0] ,
  input logic [0:0] send__rdy [0:0] ,
  output logic [0:0] send__val [0:0] 
);
  //-------------------------------------------------------------
  // Component input_units[0:5]
  //-------------------------------------------------------------

  logic [0:0] input_units__clk [0:5];
  logic [0:0] input_units__reset [0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c input_units__recv__msg [0:5];
  logic [0:0] input_units__recv__rdy [0:5];
  logic [0:0] input_units__recv__val [0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c input_units__send__msg [0:5];
  logic [0:0] input_units__send__rdy [0:5];
  logic [0:0] input_units__send__val [0:5];

  InputUnitRTL__cc02cdef134123ae input_units__0
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

  InputUnitRTL__cc02cdef134123ae input_units__1
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

  InputUnitRTL__cc02cdef134123ae input_units__2
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

  InputUnitRTL__cc02cdef134123ae input_units__3
  (
    .clk( input_units__clk[3] ),
    .reset( input_units__reset[3] ),
    .recv__msg( input_units__recv__msg[3] ),
    .recv__rdy( input_units__recv__rdy[3] ),
    .recv__val( input_units__recv__val[3] ),
    .send__msg( input_units__send__msg[3] ),
    .send__rdy( input_units__send__rdy[3] ),
    .send__val( input_units__send__val[3] )
  );

  InputUnitRTL__cc02cdef134123ae input_units__4
  (
    .clk( input_units__clk[4] ),
    .reset( input_units__reset[4] ),
    .recv__msg( input_units__recv__msg[4] ),
    .recv__rdy( input_units__recv__rdy[4] ),
    .recv__val( input_units__recv__val[4] ),
    .send__msg( input_units__send__msg[4] ),
    .send__rdy( input_units__send__rdy[4] ),
    .send__val( input_units__send__val[4] )
  );

  InputUnitRTL__cc02cdef134123ae input_units__5
  (
    .clk( input_units__clk[5] ),
    .reset( input_units__reset[5] ),
    .recv__msg( input_units__recv__msg[5] ),
    .recv__rdy( input_units__recv__rdy[5] ),
    .recv__val( input_units__recv__val[5] ),
    .send__msg( input_units__send__msg[5] ),
    .send__rdy( input_units__send__rdy[5] ),
    .send__val( input_units__send__val[5] )
  );

  //-------------------------------------------------------------
  // End of component input_units[0:5]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component output_units[0:0]
  //-------------------------------------------------------------

  logic [0:0] output_units__clk [0:0];
  logic [0:0] output_units__reset [0:0];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c output_units__recv__msg [0:0];
  logic [0:0] output_units__recv__rdy [0:0];
  logic [0:0] output_units__recv__val [0:0];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c output_units__send__msg [0:0];
  logic [0:0] output_units__send__rdy [0:0];
  logic [0:0] output_units__send__val [0:0];

  OutputUnitRTL__a9946f5ad8907102 output_units__0
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

  //-------------------------------------------------------------
  // End of component output_units[0:0]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component route_units[0:5]
  //-------------------------------------------------------------

  logic [0:0] route_units__clk [0:5];
  logic [0:0] route_units__reset [0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c route_units__recv__msg [0:5];
  logic [0:0] route_units__recv__rdy [0:5];
  logic [0:0] route_units__recv__val [0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c route_units__send__msg [0:5][0:0];
  logic [0:0] route_units__send__rdy [0:5][0:0];
  logic [0:0] route_units__send__val [0:5][0:0];

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__0
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

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__1
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

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__2
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

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__3
  (
    .clk( route_units__clk[3] ),
    .reset( route_units__reset[3] ),
    .recv__msg( route_units__recv__msg[3] ),
    .recv__rdy( route_units__recv__rdy[3] ),
    .recv__val( route_units__recv__val[3] ),
    .send__msg( route_units__send__msg[3] ),
    .send__rdy( route_units__send__rdy[3] ),
    .send__val( route_units__send__val[3] )
  );

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__4
  (
    .clk( route_units__clk[4] ),
    .reset( route_units__reset[4] ),
    .recv__msg( route_units__recv__msg[4] ),
    .recv__rdy( route_units__recv__rdy[4] ),
    .recv__val( route_units__recv__val[4] ),
    .send__msg( route_units__send__msg[4] ),
    .send__rdy( route_units__send__rdy[4] ),
    .send__val( route_units__send__val[4] )
  );

  XbarRouteUnitRTL__b4ff6020003d1be0 route_units__5
  (
    .clk( route_units__clk[5] ),
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
  // Component switch_units[0:0]
  //-------------------------------------------------------------

  logic [0:0] switch_units__clk [0:0];
  logic [0:0] switch_units__reset [0:0];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c switch_units__recv__msg [0:0][0:5];
  logic [0:0] switch_units__recv__rdy [0:0][0:5];
  logic [0:0] switch_units__recv__val [0:0][0:5];
  ControllerNocXbarPacket_InterCgraPktType__f1a81b7e6c97120c switch_units__send__msg [0:0];
  logic [0:0] switch_units__send__rdy [0:0];
  logic [0:0] switch_units__send__val [0:0];

  SwitchUnitRTL__80ba1a3063bf34da switch_units__0
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

  //-------------------------------------------------------------
  // End of component switch_units[0:0]
  //-------------------------------------------------------------

  assign input_units__clk[0] = clk;
  assign input_units__reset[0] = reset;
  assign input_units__clk[1] = clk;
  assign input_units__reset[1] = reset;
  assign input_units__clk[2] = clk;
  assign input_units__reset[2] = reset;
  assign input_units__clk[3] = clk;
  assign input_units__reset[3] = reset;
  assign input_units__clk[4] = clk;
  assign input_units__reset[4] = reset;
  assign input_units__clk[5] = clk;
  assign input_units__reset[5] = reset;
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
  assign output_units__clk[0] = clk;
  assign output_units__reset[0] = reset;
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
  assign input_units__recv__msg[3] = recv__msg[3];
  assign recv__rdy[3] = input_units__recv__rdy[3];
  assign input_units__recv__val[3] = recv__val[3];
  assign route_units__recv__msg[3] = input_units__send__msg[3];
  assign input_units__send__rdy[3] = route_units__recv__rdy[3];
  assign route_units__recv__val[3] = input_units__send__val[3];
  assign input_units__recv__msg[4] = recv__msg[4];
  assign recv__rdy[4] = input_units__recv__rdy[4];
  assign input_units__recv__val[4] = recv__val[4];
  assign route_units__recv__msg[4] = input_units__send__msg[4];
  assign input_units__send__rdy[4] = route_units__recv__rdy[4];
  assign route_units__recv__val[4] = input_units__send__val[4];
  assign input_units__recv__msg[5] = recv__msg[5];
  assign recv__rdy[5] = input_units__recv__rdy[5];
  assign input_units__recv__val[5] = recv__val[5];
  assign route_units__recv__msg[5] = input_units__send__msg[5];
  assign input_units__send__rdy[5] = route_units__recv__rdy[5];
  assign route_units__recv__val[5] = input_units__send__val[5];
  assign switch_units__recv__msg[0][0] = route_units__send__msg[0][0];
  assign route_units__send__rdy[0][0] = switch_units__recv__rdy[0][0];
  assign switch_units__recv__val[0][0] = route_units__send__val[0][0];
  assign switch_units__recv__msg[0][1] = route_units__send__msg[1][0];
  assign route_units__send__rdy[1][0] = switch_units__recv__rdy[0][1];
  assign switch_units__recv__val[0][1] = route_units__send__val[1][0];
  assign switch_units__recv__msg[0][2] = route_units__send__msg[2][0];
  assign route_units__send__rdy[2][0] = switch_units__recv__rdy[0][2];
  assign switch_units__recv__val[0][2] = route_units__send__val[2][0];
  assign switch_units__recv__msg[0][3] = route_units__send__msg[3][0];
  assign route_units__send__rdy[3][0] = switch_units__recv__rdy[0][3];
  assign switch_units__recv__val[0][3] = route_units__send__val[3][0];
  assign switch_units__recv__msg[0][4] = route_units__send__msg[4][0];
  assign route_units__send__rdy[4][0] = switch_units__recv__rdy[0][4];
  assign switch_units__recv__val[0][4] = route_units__send__val[4][0];
  assign switch_units__recv__msg[0][5] = route_units__send__msg[5][0];
  assign route_units__send__rdy[5][0] = switch_units__recv__rdy[0][5];
  assign switch_units__recv__val[0][5] = route_units__send__val[5][0];
  assign output_units__recv__msg[0] = switch_units__send__msg[0];
  assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
  assign output_units__recv__val[0] = switch_units__send__val[0];
  assign send__msg[0] = output_units__send__msg[0];
  assign output_units__send__rdy[0] = send__rdy[0];
  assign send__val[0] = output_units__send__val[0];

endmodule