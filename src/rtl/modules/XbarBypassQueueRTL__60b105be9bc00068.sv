module XbarBypassQueueRTL__60b105be9bc00068
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_3_32_512__62fa6e6064d885d7 recv__msg [0:2] ,
  output logic [0:0] recv__rdy [0:2] ,
  input logic [0:0] recv__val [0:2] ,
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 send__msg [0:31] ,
  input logic [0:0] send__rdy [0:31] ,
  output logic [0:0] send__val [0:31] 
);
  //-------------------------------------------------------------
  // Component input_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] input_units__clk [0:2];
  logic [0:0] input_units__reset [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 input_units__recv__msg [0:2];
  logic [0:0] input_units__recv__rdy [0:2];
  logic [0:0] input_units__recv__val [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 input_units__send__msg [0:2];
  logic [0:0] input_units__send__rdy [0:2];
  logic [0:0] input_units__send__val [0:2];

  InputUnitRTL__b49b617718d7597c input_units__0
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

  InputUnitRTL__b49b617718d7597c input_units__1
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

  InputUnitRTL__b49b617718d7597c input_units__2
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
  // Component output_units[0:31]
  //-------------------------------------------------------------

  logic [0:0] output_units__clk [0:31];
  logic [0:0] output_units__reset [0:31];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 output_units__recv__msg [0:31];
  logic [0:0] output_units__recv__rdy [0:31];
  logic [0:0] output_units__recv__val [0:31];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 output_units__send__msg [0:31];
  logic [0:0] output_units__send__rdy [0:31];
  logic [0:0] output_units__send__val [0:31];

  OutputUnitRTL__9213f9284de16e3b output_units__0
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

  OutputUnitRTL__9213f9284de16e3b output_units__1
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

  OutputUnitRTL__9213f9284de16e3b output_units__2
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

  OutputUnitRTL__9213f9284de16e3b output_units__3
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

  OutputUnitRTL__9213f9284de16e3b output_units__4
  (
    .clk( output_units__clk[4] ),
    .reset( output_units__reset[4] ),
    .recv__msg( output_units__recv__msg[4] ),
    .recv__rdy( output_units__recv__rdy[4] ),
    .recv__val( output_units__recv__val[4] ),
    .send__msg( output_units__send__msg[4] ),
    .send__rdy( output_units__send__rdy[4] ),
    .send__val( output_units__send__val[4] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__5
  (
    .clk( output_units__clk[5] ),
    .reset( output_units__reset[5] ),
    .recv__msg( output_units__recv__msg[5] ),
    .recv__rdy( output_units__recv__rdy[5] ),
    .recv__val( output_units__recv__val[5] ),
    .send__msg( output_units__send__msg[5] ),
    .send__rdy( output_units__send__rdy[5] ),
    .send__val( output_units__send__val[5] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__6
  (
    .clk( output_units__clk[6] ),
    .reset( output_units__reset[6] ),
    .recv__msg( output_units__recv__msg[6] ),
    .recv__rdy( output_units__recv__rdy[6] ),
    .recv__val( output_units__recv__val[6] ),
    .send__msg( output_units__send__msg[6] ),
    .send__rdy( output_units__send__rdy[6] ),
    .send__val( output_units__send__val[6] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__7
  (
    .clk( output_units__clk[7] ),
    .reset( output_units__reset[7] ),
    .recv__msg( output_units__recv__msg[7] ),
    .recv__rdy( output_units__recv__rdy[7] ),
    .recv__val( output_units__recv__val[7] ),
    .send__msg( output_units__send__msg[7] ),
    .send__rdy( output_units__send__rdy[7] ),
    .send__val( output_units__send__val[7] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__8
  (
    .clk( output_units__clk[8] ),
    .reset( output_units__reset[8] ),
    .recv__msg( output_units__recv__msg[8] ),
    .recv__rdy( output_units__recv__rdy[8] ),
    .recv__val( output_units__recv__val[8] ),
    .send__msg( output_units__send__msg[8] ),
    .send__rdy( output_units__send__rdy[8] ),
    .send__val( output_units__send__val[8] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__9
  (
    .clk( output_units__clk[9] ),
    .reset( output_units__reset[9] ),
    .recv__msg( output_units__recv__msg[9] ),
    .recv__rdy( output_units__recv__rdy[9] ),
    .recv__val( output_units__recv__val[9] ),
    .send__msg( output_units__send__msg[9] ),
    .send__rdy( output_units__send__rdy[9] ),
    .send__val( output_units__send__val[9] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__10
  (
    .clk( output_units__clk[10] ),
    .reset( output_units__reset[10] ),
    .recv__msg( output_units__recv__msg[10] ),
    .recv__rdy( output_units__recv__rdy[10] ),
    .recv__val( output_units__recv__val[10] ),
    .send__msg( output_units__send__msg[10] ),
    .send__rdy( output_units__send__rdy[10] ),
    .send__val( output_units__send__val[10] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__11
  (
    .clk( output_units__clk[11] ),
    .reset( output_units__reset[11] ),
    .recv__msg( output_units__recv__msg[11] ),
    .recv__rdy( output_units__recv__rdy[11] ),
    .recv__val( output_units__recv__val[11] ),
    .send__msg( output_units__send__msg[11] ),
    .send__rdy( output_units__send__rdy[11] ),
    .send__val( output_units__send__val[11] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__12
  (
    .clk( output_units__clk[12] ),
    .reset( output_units__reset[12] ),
    .recv__msg( output_units__recv__msg[12] ),
    .recv__rdy( output_units__recv__rdy[12] ),
    .recv__val( output_units__recv__val[12] ),
    .send__msg( output_units__send__msg[12] ),
    .send__rdy( output_units__send__rdy[12] ),
    .send__val( output_units__send__val[12] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__13
  (
    .clk( output_units__clk[13] ),
    .reset( output_units__reset[13] ),
    .recv__msg( output_units__recv__msg[13] ),
    .recv__rdy( output_units__recv__rdy[13] ),
    .recv__val( output_units__recv__val[13] ),
    .send__msg( output_units__send__msg[13] ),
    .send__rdy( output_units__send__rdy[13] ),
    .send__val( output_units__send__val[13] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__14
  (
    .clk( output_units__clk[14] ),
    .reset( output_units__reset[14] ),
    .recv__msg( output_units__recv__msg[14] ),
    .recv__rdy( output_units__recv__rdy[14] ),
    .recv__val( output_units__recv__val[14] ),
    .send__msg( output_units__send__msg[14] ),
    .send__rdy( output_units__send__rdy[14] ),
    .send__val( output_units__send__val[14] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__15
  (
    .clk( output_units__clk[15] ),
    .reset( output_units__reset[15] ),
    .recv__msg( output_units__recv__msg[15] ),
    .recv__rdy( output_units__recv__rdy[15] ),
    .recv__val( output_units__recv__val[15] ),
    .send__msg( output_units__send__msg[15] ),
    .send__rdy( output_units__send__rdy[15] ),
    .send__val( output_units__send__val[15] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__16
  (
    .clk( output_units__clk[16] ),
    .reset( output_units__reset[16] ),
    .recv__msg( output_units__recv__msg[16] ),
    .recv__rdy( output_units__recv__rdy[16] ),
    .recv__val( output_units__recv__val[16] ),
    .send__msg( output_units__send__msg[16] ),
    .send__rdy( output_units__send__rdy[16] ),
    .send__val( output_units__send__val[16] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__17
  (
    .clk( output_units__clk[17] ),
    .reset( output_units__reset[17] ),
    .recv__msg( output_units__recv__msg[17] ),
    .recv__rdy( output_units__recv__rdy[17] ),
    .recv__val( output_units__recv__val[17] ),
    .send__msg( output_units__send__msg[17] ),
    .send__rdy( output_units__send__rdy[17] ),
    .send__val( output_units__send__val[17] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__18
  (
    .clk( output_units__clk[18] ),
    .reset( output_units__reset[18] ),
    .recv__msg( output_units__recv__msg[18] ),
    .recv__rdy( output_units__recv__rdy[18] ),
    .recv__val( output_units__recv__val[18] ),
    .send__msg( output_units__send__msg[18] ),
    .send__rdy( output_units__send__rdy[18] ),
    .send__val( output_units__send__val[18] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__19
  (
    .clk( output_units__clk[19] ),
    .reset( output_units__reset[19] ),
    .recv__msg( output_units__recv__msg[19] ),
    .recv__rdy( output_units__recv__rdy[19] ),
    .recv__val( output_units__recv__val[19] ),
    .send__msg( output_units__send__msg[19] ),
    .send__rdy( output_units__send__rdy[19] ),
    .send__val( output_units__send__val[19] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__20
  (
    .clk( output_units__clk[20] ),
    .reset( output_units__reset[20] ),
    .recv__msg( output_units__recv__msg[20] ),
    .recv__rdy( output_units__recv__rdy[20] ),
    .recv__val( output_units__recv__val[20] ),
    .send__msg( output_units__send__msg[20] ),
    .send__rdy( output_units__send__rdy[20] ),
    .send__val( output_units__send__val[20] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__21
  (
    .clk( output_units__clk[21] ),
    .reset( output_units__reset[21] ),
    .recv__msg( output_units__recv__msg[21] ),
    .recv__rdy( output_units__recv__rdy[21] ),
    .recv__val( output_units__recv__val[21] ),
    .send__msg( output_units__send__msg[21] ),
    .send__rdy( output_units__send__rdy[21] ),
    .send__val( output_units__send__val[21] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__22
  (
    .clk( output_units__clk[22] ),
    .reset( output_units__reset[22] ),
    .recv__msg( output_units__recv__msg[22] ),
    .recv__rdy( output_units__recv__rdy[22] ),
    .recv__val( output_units__recv__val[22] ),
    .send__msg( output_units__send__msg[22] ),
    .send__rdy( output_units__send__rdy[22] ),
    .send__val( output_units__send__val[22] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__23
  (
    .clk( output_units__clk[23] ),
    .reset( output_units__reset[23] ),
    .recv__msg( output_units__recv__msg[23] ),
    .recv__rdy( output_units__recv__rdy[23] ),
    .recv__val( output_units__recv__val[23] ),
    .send__msg( output_units__send__msg[23] ),
    .send__rdy( output_units__send__rdy[23] ),
    .send__val( output_units__send__val[23] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__24
  (
    .clk( output_units__clk[24] ),
    .reset( output_units__reset[24] ),
    .recv__msg( output_units__recv__msg[24] ),
    .recv__rdy( output_units__recv__rdy[24] ),
    .recv__val( output_units__recv__val[24] ),
    .send__msg( output_units__send__msg[24] ),
    .send__rdy( output_units__send__rdy[24] ),
    .send__val( output_units__send__val[24] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__25
  (
    .clk( output_units__clk[25] ),
    .reset( output_units__reset[25] ),
    .recv__msg( output_units__recv__msg[25] ),
    .recv__rdy( output_units__recv__rdy[25] ),
    .recv__val( output_units__recv__val[25] ),
    .send__msg( output_units__send__msg[25] ),
    .send__rdy( output_units__send__rdy[25] ),
    .send__val( output_units__send__val[25] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__26
  (
    .clk( output_units__clk[26] ),
    .reset( output_units__reset[26] ),
    .recv__msg( output_units__recv__msg[26] ),
    .recv__rdy( output_units__recv__rdy[26] ),
    .recv__val( output_units__recv__val[26] ),
    .send__msg( output_units__send__msg[26] ),
    .send__rdy( output_units__send__rdy[26] ),
    .send__val( output_units__send__val[26] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__27
  (
    .clk( output_units__clk[27] ),
    .reset( output_units__reset[27] ),
    .recv__msg( output_units__recv__msg[27] ),
    .recv__rdy( output_units__recv__rdy[27] ),
    .recv__val( output_units__recv__val[27] ),
    .send__msg( output_units__send__msg[27] ),
    .send__rdy( output_units__send__rdy[27] ),
    .send__val( output_units__send__val[27] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__28
  (
    .clk( output_units__clk[28] ),
    .reset( output_units__reset[28] ),
    .recv__msg( output_units__recv__msg[28] ),
    .recv__rdy( output_units__recv__rdy[28] ),
    .recv__val( output_units__recv__val[28] ),
    .send__msg( output_units__send__msg[28] ),
    .send__rdy( output_units__send__rdy[28] ),
    .send__val( output_units__send__val[28] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__29
  (
    .clk( output_units__clk[29] ),
    .reset( output_units__reset[29] ),
    .recv__msg( output_units__recv__msg[29] ),
    .recv__rdy( output_units__recv__rdy[29] ),
    .recv__val( output_units__recv__val[29] ),
    .send__msg( output_units__send__msg[29] ),
    .send__rdy( output_units__send__rdy[29] ),
    .send__val( output_units__send__val[29] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__30
  (
    .clk( output_units__clk[30] ),
    .reset( output_units__reset[30] ),
    .recv__msg( output_units__recv__msg[30] ),
    .recv__rdy( output_units__recv__rdy[30] ),
    .recv__val( output_units__recv__val[30] ),
    .send__msg( output_units__send__msg[30] ),
    .send__rdy( output_units__send__rdy[30] ),
    .send__val( output_units__send__val[30] )
  );

  OutputUnitRTL__9213f9284de16e3b output_units__31
  (
    .clk( output_units__clk[31] ),
    .reset( output_units__reset[31] ),
    .recv__msg( output_units__recv__msg[31] ),
    .recv__rdy( output_units__recv__rdy[31] ),
    .recv__val( output_units__recv__val[31] ),
    .send__msg( output_units__send__msg[31] ),
    .send__rdy( output_units__send__rdy[31] ),
    .send__val( output_units__send__val[31] )
  );

  //-------------------------------------------------------------
  // End of component output_units[0:31]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component route_units[0:2]
  //-------------------------------------------------------------

  logic [0:0] route_units__clk [0:2];
  logic [0:0] route_units__reset [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 route_units__recv__msg [0:2];
  logic [0:0] route_units__recv__rdy [0:2];
  logic [0:0] route_units__recv__val [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 route_units__send__msg [0:2][0:31];
  logic [0:0] route_units__send__rdy [0:2][0:31];
  logic [0:0] route_units__send__val [0:2][0:31];

  XbarRouteUnitRTL__f784643ba22a3629 route_units__0
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

  XbarRouteUnitRTL__f784643ba22a3629 route_units__1
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

  XbarRouteUnitRTL__f784643ba22a3629 route_units__2
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
  // Component switch_units[0:31]
  //-------------------------------------------------------------

  logic [0:0] switch_units__clk [0:31];
  logic [0:0] switch_units__reset [0:31];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 switch_units__recv__msg [0:31][0:2];
  logic [0:0] switch_units__recv__rdy [0:31][0:2];
  logic [0:0] switch_units__recv__val [0:31][0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 switch_units__send__msg [0:31];
  logic [0:0] switch_units__send__rdy [0:31];
  logic [0:0] switch_units__send__val [0:31];

  SwitchUnitRTL__51ac93e9c686b5af switch_units__0
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

  SwitchUnitRTL__51ac93e9c686b5af switch_units__1
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

  SwitchUnitRTL__51ac93e9c686b5af switch_units__2
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

  SwitchUnitRTL__51ac93e9c686b5af switch_units__3
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

  SwitchUnitRTL__51ac93e9c686b5af switch_units__4
  (
    .clk( switch_units__clk[4] ),
    .reset( switch_units__reset[4] ),
    .recv__msg( switch_units__recv__msg[4] ),
    .recv__rdy( switch_units__recv__rdy[4] ),
    .recv__val( switch_units__recv__val[4] ),
    .send__msg( switch_units__send__msg[4] ),
    .send__rdy( switch_units__send__rdy[4] ),
    .send__val( switch_units__send__val[4] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__5
  (
    .clk( switch_units__clk[5] ),
    .reset( switch_units__reset[5] ),
    .recv__msg( switch_units__recv__msg[5] ),
    .recv__rdy( switch_units__recv__rdy[5] ),
    .recv__val( switch_units__recv__val[5] ),
    .send__msg( switch_units__send__msg[5] ),
    .send__rdy( switch_units__send__rdy[5] ),
    .send__val( switch_units__send__val[5] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__6
  (
    .clk( switch_units__clk[6] ),
    .reset( switch_units__reset[6] ),
    .recv__msg( switch_units__recv__msg[6] ),
    .recv__rdy( switch_units__recv__rdy[6] ),
    .recv__val( switch_units__recv__val[6] ),
    .send__msg( switch_units__send__msg[6] ),
    .send__rdy( switch_units__send__rdy[6] ),
    .send__val( switch_units__send__val[6] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__7
  (
    .clk( switch_units__clk[7] ),
    .reset( switch_units__reset[7] ),
    .recv__msg( switch_units__recv__msg[7] ),
    .recv__rdy( switch_units__recv__rdy[7] ),
    .recv__val( switch_units__recv__val[7] ),
    .send__msg( switch_units__send__msg[7] ),
    .send__rdy( switch_units__send__rdy[7] ),
    .send__val( switch_units__send__val[7] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__8
  (
    .clk( switch_units__clk[8] ),
    .reset( switch_units__reset[8] ),
    .recv__msg( switch_units__recv__msg[8] ),
    .recv__rdy( switch_units__recv__rdy[8] ),
    .recv__val( switch_units__recv__val[8] ),
    .send__msg( switch_units__send__msg[8] ),
    .send__rdy( switch_units__send__rdy[8] ),
    .send__val( switch_units__send__val[8] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__9
  (
    .clk( switch_units__clk[9] ),
    .reset( switch_units__reset[9] ),
    .recv__msg( switch_units__recv__msg[9] ),
    .recv__rdy( switch_units__recv__rdy[9] ),
    .recv__val( switch_units__recv__val[9] ),
    .send__msg( switch_units__send__msg[9] ),
    .send__rdy( switch_units__send__rdy[9] ),
    .send__val( switch_units__send__val[9] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__10
  (
    .clk( switch_units__clk[10] ),
    .reset( switch_units__reset[10] ),
    .recv__msg( switch_units__recv__msg[10] ),
    .recv__rdy( switch_units__recv__rdy[10] ),
    .recv__val( switch_units__recv__val[10] ),
    .send__msg( switch_units__send__msg[10] ),
    .send__rdy( switch_units__send__rdy[10] ),
    .send__val( switch_units__send__val[10] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__11
  (
    .clk( switch_units__clk[11] ),
    .reset( switch_units__reset[11] ),
    .recv__msg( switch_units__recv__msg[11] ),
    .recv__rdy( switch_units__recv__rdy[11] ),
    .recv__val( switch_units__recv__val[11] ),
    .send__msg( switch_units__send__msg[11] ),
    .send__rdy( switch_units__send__rdy[11] ),
    .send__val( switch_units__send__val[11] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__12
  (
    .clk( switch_units__clk[12] ),
    .reset( switch_units__reset[12] ),
    .recv__msg( switch_units__recv__msg[12] ),
    .recv__rdy( switch_units__recv__rdy[12] ),
    .recv__val( switch_units__recv__val[12] ),
    .send__msg( switch_units__send__msg[12] ),
    .send__rdy( switch_units__send__rdy[12] ),
    .send__val( switch_units__send__val[12] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__13
  (
    .clk( switch_units__clk[13] ),
    .reset( switch_units__reset[13] ),
    .recv__msg( switch_units__recv__msg[13] ),
    .recv__rdy( switch_units__recv__rdy[13] ),
    .recv__val( switch_units__recv__val[13] ),
    .send__msg( switch_units__send__msg[13] ),
    .send__rdy( switch_units__send__rdy[13] ),
    .send__val( switch_units__send__val[13] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__14
  (
    .clk( switch_units__clk[14] ),
    .reset( switch_units__reset[14] ),
    .recv__msg( switch_units__recv__msg[14] ),
    .recv__rdy( switch_units__recv__rdy[14] ),
    .recv__val( switch_units__recv__val[14] ),
    .send__msg( switch_units__send__msg[14] ),
    .send__rdy( switch_units__send__rdy[14] ),
    .send__val( switch_units__send__val[14] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__15
  (
    .clk( switch_units__clk[15] ),
    .reset( switch_units__reset[15] ),
    .recv__msg( switch_units__recv__msg[15] ),
    .recv__rdy( switch_units__recv__rdy[15] ),
    .recv__val( switch_units__recv__val[15] ),
    .send__msg( switch_units__send__msg[15] ),
    .send__rdy( switch_units__send__rdy[15] ),
    .send__val( switch_units__send__val[15] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__16
  (
    .clk( switch_units__clk[16] ),
    .reset( switch_units__reset[16] ),
    .recv__msg( switch_units__recv__msg[16] ),
    .recv__rdy( switch_units__recv__rdy[16] ),
    .recv__val( switch_units__recv__val[16] ),
    .send__msg( switch_units__send__msg[16] ),
    .send__rdy( switch_units__send__rdy[16] ),
    .send__val( switch_units__send__val[16] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__17
  (
    .clk( switch_units__clk[17] ),
    .reset( switch_units__reset[17] ),
    .recv__msg( switch_units__recv__msg[17] ),
    .recv__rdy( switch_units__recv__rdy[17] ),
    .recv__val( switch_units__recv__val[17] ),
    .send__msg( switch_units__send__msg[17] ),
    .send__rdy( switch_units__send__rdy[17] ),
    .send__val( switch_units__send__val[17] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__18
  (
    .clk( switch_units__clk[18] ),
    .reset( switch_units__reset[18] ),
    .recv__msg( switch_units__recv__msg[18] ),
    .recv__rdy( switch_units__recv__rdy[18] ),
    .recv__val( switch_units__recv__val[18] ),
    .send__msg( switch_units__send__msg[18] ),
    .send__rdy( switch_units__send__rdy[18] ),
    .send__val( switch_units__send__val[18] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__19
  (
    .clk( switch_units__clk[19] ),
    .reset( switch_units__reset[19] ),
    .recv__msg( switch_units__recv__msg[19] ),
    .recv__rdy( switch_units__recv__rdy[19] ),
    .recv__val( switch_units__recv__val[19] ),
    .send__msg( switch_units__send__msg[19] ),
    .send__rdy( switch_units__send__rdy[19] ),
    .send__val( switch_units__send__val[19] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__20
  (
    .clk( switch_units__clk[20] ),
    .reset( switch_units__reset[20] ),
    .recv__msg( switch_units__recv__msg[20] ),
    .recv__rdy( switch_units__recv__rdy[20] ),
    .recv__val( switch_units__recv__val[20] ),
    .send__msg( switch_units__send__msg[20] ),
    .send__rdy( switch_units__send__rdy[20] ),
    .send__val( switch_units__send__val[20] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__21
  (
    .clk( switch_units__clk[21] ),
    .reset( switch_units__reset[21] ),
    .recv__msg( switch_units__recv__msg[21] ),
    .recv__rdy( switch_units__recv__rdy[21] ),
    .recv__val( switch_units__recv__val[21] ),
    .send__msg( switch_units__send__msg[21] ),
    .send__rdy( switch_units__send__rdy[21] ),
    .send__val( switch_units__send__val[21] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__22
  (
    .clk( switch_units__clk[22] ),
    .reset( switch_units__reset[22] ),
    .recv__msg( switch_units__recv__msg[22] ),
    .recv__rdy( switch_units__recv__rdy[22] ),
    .recv__val( switch_units__recv__val[22] ),
    .send__msg( switch_units__send__msg[22] ),
    .send__rdy( switch_units__send__rdy[22] ),
    .send__val( switch_units__send__val[22] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__23
  (
    .clk( switch_units__clk[23] ),
    .reset( switch_units__reset[23] ),
    .recv__msg( switch_units__recv__msg[23] ),
    .recv__rdy( switch_units__recv__rdy[23] ),
    .recv__val( switch_units__recv__val[23] ),
    .send__msg( switch_units__send__msg[23] ),
    .send__rdy( switch_units__send__rdy[23] ),
    .send__val( switch_units__send__val[23] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__24
  (
    .clk( switch_units__clk[24] ),
    .reset( switch_units__reset[24] ),
    .recv__msg( switch_units__recv__msg[24] ),
    .recv__rdy( switch_units__recv__rdy[24] ),
    .recv__val( switch_units__recv__val[24] ),
    .send__msg( switch_units__send__msg[24] ),
    .send__rdy( switch_units__send__rdy[24] ),
    .send__val( switch_units__send__val[24] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__25
  (
    .clk( switch_units__clk[25] ),
    .reset( switch_units__reset[25] ),
    .recv__msg( switch_units__recv__msg[25] ),
    .recv__rdy( switch_units__recv__rdy[25] ),
    .recv__val( switch_units__recv__val[25] ),
    .send__msg( switch_units__send__msg[25] ),
    .send__rdy( switch_units__send__rdy[25] ),
    .send__val( switch_units__send__val[25] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__26
  (
    .clk( switch_units__clk[26] ),
    .reset( switch_units__reset[26] ),
    .recv__msg( switch_units__recv__msg[26] ),
    .recv__rdy( switch_units__recv__rdy[26] ),
    .recv__val( switch_units__recv__val[26] ),
    .send__msg( switch_units__send__msg[26] ),
    .send__rdy( switch_units__send__rdy[26] ),
    .send__val( switch_units__send__val[26] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__27
  (
    .clk( switch_units__clk[27] ),
    .reset( switch_units__reset[27] ),
    .recv__msg( switch_units__recv__msg[27] ),
    .recv__rdy( switch_units__recv__rdy[27] ),
    .recv__val( switch_units__recv__val[27] ),
    .send__msg( switch_units__send__msg[27] ),
    .send__rdy( switch_units__send__rdy[27] ),
    .send__val( switch_units__send__val[27] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__28
  (
    .clk( switch_units__clk[28] ),
    .reset( switch_units__reset[28] ),
    .recv__msg( switch_units__recv__msg[28] ),
    .recv__rdy( switch_units__recv__rdy[28] ),
    .recv__val( switch_units__recv__val[28] ),
    .send__msg( switch_units__send__msg[28] ),
    .send__rdy( switch_units__send__rdy[28] ),
    .send__val( switch_units__send__val[28] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__29
  (
    .clk( switch_units__clk[29] ),
    .reset( switch_units__reset[29] ),
    .recv__msg( switch_units__recv__msg[29] ),
    .recv__rdy( switch_units__recv__rdy[29] ),
    .recv__val( switch_units__recv__val[29] ),
    .send__msg( switch_units__send__msg[29] ),
    .send__rdy( switch_units__send__rdy[29] ),
    .send__val( switch_units__send__val[29] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__30
  (
    .clk( switch_units__clk[30] ),
    .reset( switch_units__reset[30] ),
    .recv__msg( switch_units__recv__msg[30] ),
    .recv__rdy( switch_units__recv__rdy[30] ),
    .recv__val( switch_units__recv__val[30] ),
    .send__msg( switch_units__send__msg[30] ),
    .send__rdy( switch_units__send__rdy[30] ),
    .send__val( switch_units__send__val[30] )
  );

  SwitchUnitRTL__51ac93e9c686b5af switch_units__31
  (
    .clk( switch_units__clk[31] ),
    .reset( switch_units__reset[31] ),
    .recv__msg( switch_units__recv__msg[31] ),
    .recv__rdy( switch_units__recv__rdy[31] ),
    .recv__val( switch_units__recv__val[31] ),
    .send__msg( switch_units__send__msg[31] ),
    .send__rdy( switch_units__send__rdy[31] ),
    .send__val( switch_units__send__val[31] )
  );

  //-------------------------------------------------------------
  // End of component switch_units[0:31]
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
  assign switch_units__clk[4] = clk;
  assign switch_units__reset[4] = reset;
  assign switch_units__clk[5] = clk;
  assign switch_units__reset[5] = reset;
  assign switch_units__clk[6] = clk;
  assign switch_units__reset[6] = reset;
  assign switch_units__clk[7] = clk;
  assign switch_units__reset[7] = reset;
  assign switch_units__clk[8] = clk;
  assign switch_units__reset[8] = reset;
  assign switch_units__clk[9] = clk;
  assign switch_units__reset[9] = reset;
  assign switch_units__clk[10] = clk;
  assign switch_units__reset[10] = reset;
  assign switch_units__clk[11] = clk;
  assign switch_units__reset[11] = reset;
  assign switch_units__clk[12] = clk;
  assign switch_units__reset[12] = reset;
  assign switch_units__clk[13] = clk;
  assign switch_units__reset[13] = reset;
  assign switch_units__clk[14] = clk;
  assign switch_units__reset[14] = reset;
  assign switch_units__clk[15] = clk;
  assign switch_units__reset[15] = reset;
  assign switch_units__clk[16] = clk;
  assign switch_units__reset[16] = reset;
  assign switch_units__clk[17] = clk;
  assign switch_units__reset[17] = reset;
  assign switch_units__clk[18] = clk;
  assign switch_units__reset[18] = reset;
  assign switch_units__clk[19] = clk;
  assign switch_units__reset[19] = reset;
  assign switch_units__clk[20] = clk;
  assign switch_units__reset[20] = reset;
  assign switch_units__clk[21] = clk;
  assign switch_units__reset[21] = reset;
  assign switch_units__clk[22] = clk;
  assign switch_units__reset[22] = reset;
  assign switch_units__clk[23] = clk;
  assign switch_units__reset[23] = reset;
  assign switch_units__clk[24] = clk;
  assign switch_units__reset[24] = reset;
  assign switch_units__clk[25] = clk;
  assign switch_units__reset[25] = reset;
  assign switch_units__clk[26] = clk;
  assign switch_units__reset[26] = reset;
  assign switch_units__clk[27] = clk;
  assign switch_units__reset[27] = reset;
  assign switch_units__clk[28] = clk;
  assign switch_units__reset[28] = reset;
  assign switch_units__clk[29] = clk;
  assign switch_units__reset[29] = reset;
  assign switch_units__clk[30] = clk;
  assign switch_units__reset[30] = reset;
  assign switch_units__clk[31] = clk;
  assign switch_units__reset[31] = reset;
  assign output_units__clk[0] = clk;
  assign output_units__reset[0] = reset;
  assign output_units__clk[1] = clk;
  assign output_units__reset[1] = reset;
  assign output_units__clk[2] = clk;
  assign output_units__reset[2] = reset;
  assign output_units__clk[3] = clk;
  assign output_units__reset[3] = reset;
  assign output_units__clk[4] = clk;
  assign output_units__reset[4] = reset;
  assign output_units__clk[5] = clk;
  assign output_units__reset[5] = reset;
  assign output_units__clk[6] = clk;
  assign output_units__reset[6] = reset;
  assign output_units__clk[7] = clk;
  assign output_units__reset[7] = reset;
  assign output_units__clk[8] = clk;
  assign output_units__reset[8] = reset;
  assign output_units__clk[9] = clk;
  assign output_units__reset[9] = reset;
  assign output_units__clk[10] = clk;
  assign output_units__reset[10] = reset;
  assign output_units__clk[11] = clk;
  assign output_units__reset[11] = reset;
  assign output_units__clk[12] = clk;
  assign output_units__reset[12] = reset;
  assign output_units__clk[13] = clk;
  assign output_units__reset[13] = reset;
  assign output_units__clk[14] = clk;
  assign output_units__reset[14] = reset;
  assign output_units__clk[15] = clk;
  assign output_units__reset[15] = reset;
  assign output_units__clk[16] = clk;
  assign output_units__reset[16] = reset;
  assign output_units__clk[17] = clk;
  assign output_units__reset[17] = reset;
  assign output_units__clk[18] = clk;
  assign output_units__reset[18] = reset;
  assign output_units__clk[19] = clk;
  assign output_units__reset[19] = reset;
  assign output_units__clk[20] = clk;
  assign output_units__reset[20] = reset;
  assign output_units__clk[21] = clk;
  assign output_units__reset[21] = reset;
  assign output_units__clk[22] = clk;
  assign output_units__reset[22] = reset;
  assign output_units__clk[23] = clk;
  assign output_units__reset[23] = reset;
  assign output_units__clk[24] = clk;
  assign output_units__reset[24] = reset;
  assign output_units__clk[25] = clk;
  assign output_units__reset[25] = reset;
  assign output_units__clk[26] = clk;
  assign output_units__reset[26] = reset;
  assign output_units__clk[27] = clk;
  assign output_units__reset[27] = reset;
  assign output_units__clk[28] = clk;
  assign output_units__reset[28] = reset;
  assign output_units__clk[29] = clk;
  assign output_units__reset[29] = reset;
  assign output_units__clk[30] = clk;
  assign output_units__reset[30] = reset;
  assign output_units__clk[31] = clk;
  assign output_units__reset[31] = reset;
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
  assign switch_units__recv__msg[4][0] = route_units__send__msg[0][4];
  assign route_units__send__rdy[0][4] = switch_units__recv__rdy[4][0];
  assign switch_units__recv__val[4][0] = route_units__send__val[0][4];
  assign switch_units__recv__msg[5][0] = route_units__send__msg[0][5];
  assign route_units__send__rdy[0][5] = switch_units__recv__rdy[5][0];
  assign switch_units__recv__val[5][0] = route_units__send__val[0][5];
  assign switch_units__recv__msg[6][0] = route_units__send__msg[0][6];
  assign route_units__send__rdy[0][6] = switch_units__recv__rdy[6][0];
  assign switch_units__recv__val[6][0] = route_units__send__val[0][6];
  assign switch_units__recv__msg[7][0] = route_units__send__msg[0][7];
  assign route_units__send__rdy[0][7] = switch_units__recv__rdy[7][0];
  assign switch_units__recv__val[7][0] = route_units__send__val[0][7];
  assign switch_units__recv__msg[8][0] = route_units__send__msg[0][8];
  assign route_units__send__rdy[0][8] = switch_units__recv__rdy[8][0];
  assign switch_units__recv__val[8][0] = route_units__send__val[0][8];
  assign switch_units__recv__msg[9][0] = route_units__send__msg[0][9];
  assign route_units__send__rdy[0][9] = switch_units__recv__rdy[9][0];
  assign switch_units__recv__val[9][0] = route_units__send__val[0][9];
  assign switch_units__recv__msg[10][0] = route_units__send__msg[0][10];
  assign route_units__send__rdy[0][10] = switch_units__recv__rdy[10][0];
  assign switch_units__recv__val[10][0] = route_units__send__val[0][10];
  assign switch_units__recv__msg[11][0] = route_units__send__msg[0][11];
  assign route_units__send__rdy[0][11] = switch_units__recv__rdy[11][0];
  assign switch_units__recv__val[11][0] = route_units__send__val[0][11];
  assign switch_units__recv__msg[12][0] = route_units__send__msg[0][12];
  assign route_units__send__rdy[0][12] = switch_units__recv__rdy[12][0];
  assign switch_units__recv__val[12][0] = route_units__send__val[0][12];
  assign switch_units__recv__msg[13][0] = route_units__send__msg[0][13];
  assign route_units__send__rdy[0][13] = switch_units__recv__rdy[13][0];
  assign switch_units__recv__val[13][0] = route_units__send__val[0][13];
  assign switch_units__recv__msg[14][0] = route_units__send__msg[0][14];
  assign route_units__send__rdy[0][14] = switch_units__recv__rdy[14][0];
  assign switch_units__recv__val[14][0] = route_units__send__val[0][14];
  assign switch_units__recv__msg[15][0] = route_units__send__msg[0][15];
  assign route_units__send__rdy[0][15] = switch_units__recv__rdy[15][0];
  assign switch_units__recv__val[15][0] = route_units__send__val[0][15];
  assign switch_units__recv__msg[16][0] = route_units__send__msg[0][16];
  assign route_units__send__rdy[0][16] = switch_units__recv__rdy[16][0];
  assign switch_units__recv__val[16][0] = route_units__send__val[0][16];
  assign switch_units__recv__msg[17][0] = route_units__send__msg[0][17];
  assign route_units__send__rdy[0][17] = switch_units__recv__rdy[17][0];
  assign switch_units__recv__val[17][0] = route_units__send__val[0][17];
  assign switch_units__recv__msg[18][0] = route_units__send__msg[0][18];
  assign route_units__send__rdy[0][18] = switch_units__recv__rdy[18][0];
  assign switch_units__recv__val[18][0] = route_units__send__val[0][18];
  assign switch_units__recv__msg[19][0] = route_units__send__msg[0][19];
  assign route_units__send__rdy[0][19] = switch_units__recv__rdy[19][0];
  assign switch_units__recv__val[19][0] = route_units__send__val[0][19];
  assign switch_units__recv__msg[20][0] = route_units__send__msg[0][20];
  assign route_units__send__rdy[0][20] = switch_units__recv__rdy[20][0];
  assign switch_units__recv__val[20][0] = route_units__send__val[0][20];
  assign switch_units__recv__msg[21][0] = route_units__send__msg[0][21];
  assign route_units__send__rdy[0][21] = switch_units__recv__rdy[21][0];
  assign switch_units__recv__val[21][0] = route_units__send__val[0][21];
  assign switch_units__recv__msg[22][0] = route_units__send__msg[0][22];
  assign route_units__send__rdy[0][22] = switch_units__recv__rdy[22][0];
  assign switch_units__recv__val[22][0] = route_units__send__val[0][22];
  assign switch_units__recv__msg[23][0] = route_units__send__msg[0][23];
  assign route_units__send__rdy[0][23] = switch_units__recv__rdy[23][0];
  assign switch_units__recv__val[23][0] = route_units__send__val[0][23];
  assign switch_units__recv__msg[24][0] = route_units__send__msg[0][24];
  assign route_units__send__rdy[0][24] = switch_units__recv__rdy[24][0];
  assign switch_units__recv__val[24][0] = route_units__send__val[0][24];
  assign switch_units__recv__msg[25][0] = route_units__send__msg[0][25];
  assign route_units__send__rdy[0][25] = switch_units__recv__rdy[25][0];
  assign switch_units__recv__val[25][0] = route_units__send__val[0][25];
  assign switch_units__recv__msg[26][0] = route_units__send__msg[0][26];
  assign route_units__send__rdy[0][26] = switch_units__recv__rdy[26][0];
  assign switch_units__recv__val[26][0] = route_units__send__val[0][26];
  assign switch_units__recv__msg[27][0] = route_units__send__msg[0][27];
  assign route_units__send__rdy[0][27] = switch_units__recv__rdy[27][0];
  assign switch_units__recv__val[27][0] = route_units__send__val[0][27];
  assign switch_units__recv__msg[28][0] = route_units__send__msg[0][28];
  assign route_units__send__rdy[0][28] = switch_units__recv__rdy[28][0];
  assign switch_units__recv__val[28][0] = route_units__send__val[0][28];
  assign switch_units__recv__msg[29][0] = route_units__send__msg[0][29];
  assign route_units__send__rdy[0][29] = switch_units__recv__rdy[29][0];
  assign switch_units__recv__val[29][0] = route_units__send__val[0][29];
  assign switch_units__recv__msg[30][0] = route_units__send__msg[0][30];
  assign route_units__send__rdy[0][30] = switch_units__recv__rdy[30][0];
  assign switch_units__recv__val[30][0] = route_units__send__val[0][30];
  assign switch_units__recv__msg[31][0] = route_units__send__msg[0][31];
  assign route_units__send__rdy[0][31] = switch_units__recv__rdy[31][0];
  assign switch_units__recv__val[31][0] = route_units__send__val[0][31];
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
  assign switch_units__recv__msg[4][1] = route_units__send__msg[1][4];
  assign route_units__send__rdy[1][4] = switch_units__recv__rdy[4][1];
  assign switch_units__recv__val[4][1] = route_units__send__val[1][4];
  assign switch_units__recv__msg[5][1] = route_units__send__msg[1][5];
  assign route_units__send__rdy[1][5] = switch_units__recv__rdy[5][1];
  assign switch_units__recv__val[5][1] = route_units__send__val[1][5];
  assign switch_units__recv__msg[6][1] = route_units__send__msg[1][6];
  assign route_units__send__rdy[1][6] = switch_units__recv__rdy[6][1];
  assign switch_units__recv__val[6][1] = route_units__send__val[1][6];
  assign switch_units__recv__msg[7][1] = route_units__send__msg[1][7];
  assign route_units__send__rdy[1][7] = switch_units__recv__rdy[7][1];
  assign switch_units__recv__val[7][1] = route_units__send__val[1][7];
  assign switch_units__recv__msg[8][1] = route_units__send__msg[1][8];
  assign route_units__send__rdy[1][8] = switch_units__recv__rdy[8][1];
  assign switch_units__recv__val[8][1] = route_units__send__val[1][8];
  assign switch_units__recv__msg[9][1] = route_units__send__msg[1][9];
  assign route_units__send__rdy[1][9] = switch_units__recv__rdy[9][1];
  assign switch_units__recv__val[9][1] = route_units__send__val[1][9];
  assign switch_units__recv__msg[10][1] = route_units__send__msg[1][10];
  assign route_units__send__rdy[1][10] = switch_units__recv__rdy[10][1];
  assign switch_units__recv__val[10][1] = route_units__send__val[1][10];
  assign switch_units__recv__msg[11][1] = route_units__send__msg[1][11];
  assign route_units__send__rdy[1][11] = switch_units__recv__rdy[11][1];
  assign switch_units__recv__val[11][1] = route_units__send__val[1][11];
  assign switch_units__recv__msg[12][1] = route_units__send__msg[1][12];
  assign route_units__send__rdy[1][12] = switch_units__recv__rdy[12][1];
  assign switch_units__recv__val[12][1] = route_units__send__val[1][12];
  assign switch_units__recv__msg[13][1] = route_units__send__msg[1][13];
  assign route_units__send__rdy[1][13] = switch_units__recv__rdy[13][1];
  assign switch_units__recv__val[13][1] = route_units__send__val[1][13];
  assign switch_units__recv__msg[14][1] = route_units__send__msg[1][14];
  assign route_units__send__rdy[1][14] = switch_units__recv__rdy[14][1];
  assign switch_units__recv__val[14][1] = route_units__send__val[1][14];
  assign switch_units__recv__msg[15][1] = route_units__send__msg[1][15];
  assign route_units__send__rdy[1][15] = switch_units__recv__rdy[15][1];
  assign switch_units__recv__val[15][1] = route_units__send__val[1][15];
  assign switch_units__recv__msg[16][1] = route_units__send__msg[1][16];
  assign route_units__send__rdy[1][16] = switch_units__recv__rdy[16][1];
  assign switch_units__recv__val[16][1] = route_units__send__val[1][16];
  assign switch_units__recv__msg[17][1] = route_units__send__msg[1][17];
  assign route_units__send__rdy[1][17] = switch_units__recv__rdy[17][1];
  assign switch_units__recv__val[17][1] = route_units__send__val[1][17];
  assign switch_units__recv__msg[18][1] = route_units__send__msg[1][18];
  assign route_units__send__rdy[1][18] = switch_units__recv__rdy[18][1];
  assign switch_units__recv__val[18][1] = route_units__send__val[1][18];
  assign switch_units__recv__msg[19][1] = route_units__send__msg[1][19];
  assign route_units__send__rdy[1][19] = switch_units__recv__rdy[19][1];
  assign switch_units__recv__val[19][1] = route_units__send__val[1][19];
  assign switch_units__recv__msg[20][1] = route_units__send__msg[1][20];
  assign route_units__send__rdy[1][20] = switch_units__recv__rdy[20][1];
  assign switch_units__recv__val[20][1] = route_units__send__val[1][20];
  assign switch_units__recv__msg[21][1] = route_units__send__msg[1][21];
  assign route_units__send__rdy[1][21] = switch_units__recv__rdy[21][1];
  assign switch_units__recv__val[21][1] = route_units__send__val[1][21];
  assign switch_units__recv__msg[22][1] = route_units__send__msg[1][22];
  assign route_units__send__rdy[1][22] = switch_units__recv__rdy[22][1];
  assign switch_units__recv__val[22][1] = route_units__send__val[1][22];
  assign switch_units__recv__msg[23][1] = route_units__send__msg[1][23];
  assign route_units__send__rdy[1][23] = switch_units__recv__rdy[23][1];
  assign switch_units__recv__val[23][1] = route_units__send__val[1][23];
  assign switch_units__recv__msg[24][1] = route_units__send__msg[1][24];
  assign route_units__send__rdy[1][24] = switch_units__recv__rdy[24][1];
  assign switch_units__recv__val[24][1] = route_units__send__val[1][24];
  assign switch_units__recv__msg[25][1] = route_units__send__msg[1][25];
  assign route_units__send__rdy[1][25] = switch_units__recv__rdy[25][1];
  assign switch_units__recv__val[25][1] = route_units__send__val[1][25];
  assign switch_units__recv__msg[26][1] = route_units__send__msg[1][26];
  assign route_units__send__rdy[1][26] = switch_units__recv__rdy[26][1];
  assign switch_units__recv__val[26][1] = route_units__send__val[1][26];
  assign switch_units__recv__msg[27][1] = route_units__send__msg[1][27];
  assign route_units__send__rdy[1][27] = switch_units__recv__rdy[27][1];
  assign switch_units__recv__val[27][1] = route_units__send__val[1][27];
  assign switch_units__recv__msg[28][1] = route_units__send__msg[1][28];
  assign route_units__send__rdy[1][28] = switch_units__recv__rdy[28][1];
  assign switch_units__recv__val[28][1] = route_units__send__val[1][28];
  assign switch_units__recv__msg[29][1] = route_units__send__msg[1][29];
  assign route_units__send__rdy[1][29] = switch_units__recv__rdy[29][1];
  assign switch_units__recv__val[29][1] = route_units__send__val[1][29];
  assign switch_units__recv__msg[30][1] = route_units__send__msg[1][30];
  assign route_units__send__rdy[1][30] = switch_units__recv__rdy[30][1];
  assign switch_units__recv__val[30][1] = route_units__send__val[1][30];
  assign switch_units__recv__msg[31][1] = route_units__send__msg[1][31];
  assign route_units__send__rdy[1][31] = switch_units__recv__rdy[31][1];
  assign switch_units__recv__val[31][1] = route_units__send__val[1][31];
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
  assign switch_units__recv__msg[4][2] = route_units__send__msg[2][4];
  assign route_units__send__rdy[2][4] = switch_units__recv__rdy[4][2];
  assign switch_units__recv__val[4][2] = route_units__send__val[2][4];
  assign switch_units__recv__msg[5][2] = route_units__send__msg[2][5];
  assign route_units__send__rdy[2][5] = switch_units__recv__rdy[5][2];
  assign switch_units__recv__val[5][2] = route_units__send__val[2][5];
  assign switch_units__recv__msg[6][2] = route_units__send__msg[2][6];
  assign route_units__send__rdy[2][6] = switch_units__recv__rdy[6][2];
  assign switch_units__recv__val[6][2] = route_units__send__val[2][6];
  assign switch_units__recv__msg[7][2] = route_units__send__msg[2][7];
  assign route_units__send__rdy[2][7] = switch_units__recv__rdy[7][2];
  assign switch_units__recv__val[7][2] = route_units__send__val[2][7];
  assign switch_units__recv__msg[8][2] = route_units__send__msg[2][8];
  assign route_units__send__rdy[2][8] = switch_units__recv__rdy[8][2];
  assign switch_units__recv__val[8][2] = route_units__send__val[2][8];
  assign switch_units__recv__msg[9][2] = route_units__send__msg[2][9];
  assign route_units__send__rdy[2][9] = switch_units__recv__rdy[9][2];
  assign switch_units__recv__val[9][2] = route_units__send__val[2][9];
  assign switch_units__recv__msg[10][2] = route_units__send__msg[2][10];
  assign route_units__send__rdy[2][10] = switch_units__recv__rdy[10][2];
  assign switch_units__recv__val[10][2] = route_units__send__val[2][10];
  assign switch_units__recv__msg[11][2] = route_units__send__msg[2][11];
  assign route_units__send__rdy[2][11] = switch_units__recv__rdy[11][2];
  assign switch_units__recv__val[11][2] = route_units__send__val[2][11];
  assign switch_units__recv__msg[12][2] = route_units__send__msg[2][12];
  assign route_units__send__rdy[2][12] = switch_units__recv__rdy[12][2];
  assign switch_units__recv__val[12][2] = route_units__send__val[2][12];
  assign switch_units__recv__msg[13][2] = route_units__send__msg[2][13];
  assign route_units__send__rdy[2][13] = switch_units__recv__rdy[13][2];
  assign switch_units__recv__val[13][2] = route_units__send__val[2][13];
  assign switch_units__recv__msg[14][2] = route_units__send__msg[2][14];
  assign route_units__send__rdy[2][14] = switch_units__recv__rdy[14][2];
  assign switch_units__recv__val[14][2] = route_units__send__val[2][14];
  assign switch_units__recv__msg[15][2] = route_units__send__msg[2][15];
  assign route_units__send__rdy[2][15] = switch_units__recv__rdy[15][2];
  assign switch_units__recv__val[15][2] = route_units__send__val[2][15];
  assign switch_units__recv__msg[16][2] = route_units__send__msg[2][16];
  assign route_units__send__rdy[2][16] = switch_units__recv__rdy[16][2];
  assign switch_units__recv__val[16][2] = route_units__send__val[2][16];
  assign switch_units__recv__msg[17][2] = route_units__send__msg[2][17];
  assign route_units__send__rdy[2][17] = switch_units__recv__rdy[17][2];
  assign switch_units__recv__val[17][2] = route_units__send__val[2][17];
  assign switch_units__recv__msg[18][2] = route_units__send__msg[2][18];
  assign route_units__send__rdy[2][18] = switch_units__recv__rdy[18][2];
  assign switch_units__recv__val[18][2] = route_units__send__val[2][18];
  assign switch_units__recv__msg[19][2] = route_units__send__msg[2][19];
  assign route_units__send__rdy[2][19] = switch_units__recv__rdy[19][2];
  assign switch_units__recv__val[19][2] = route_units__send__val[2][19];
  assign switch_units__recv__msg[20][2] = route_units__send__msg[2][20];
  assign route_units__send__rdy[2][20] = switch_units__recv__rdy[20][2];
  assign switch_units__recv__val[20][2] = route_units__send__val[2][20];
  assign switch_units__recv__msg[21][2] = route_units__send__msg[2][21];
  assign route_units__send__rdy[2][21] = switch_units__recv__rdy[21][2];
  assign switch_units__recv__val[21][2] = route_units__send__val[2][21];
  assign switch_units__recv__msg[22][2] = route_units__send__msg[2][22];
  assign route_units__send__rdy[2][22] = switch_units__recv__rdy[22][2];
  assign switch_units__recv__val[22][2] = route_units__send__val[2][22];
  assign switch_units__recv__msg[23][2] = route_units__send__msg[2][23];
  assign route_units__send__rdy[2][23] = switch_units__recv__rdy[23][2];
  assign switch_units__recv__val[23][2] = route_units__send__val[2][23];
  assign switch_units__recv__msg[24][2] = route_units__send__msg[2][24];
  assign route_units__send__rdy[2][24] = switch_units__recv__rdy[24][2];
  assign switch_units__recv__val[24][2] = route_units__send__val[2][24];
  assign switch_units__recv__msg[25][2] = route_units__send__msg[2][25];
  assign route_units__send__rdy[2][25] = switch_units__recv__rdy[25][2];
  assign switch_units__recv__val[25][2] = route_units__send__val[2][25];
  assign switch_units__recv__msg[26][2] = route_units__send__msg[2][26];
  assign route_units__send__rdy[2][26] = switch_units__recv__rdy[26][2];
  assign switch_units__recv__val[26][2] = route_units__send__val[2][26];
  assign switch_units__recv__msg[27][2] = route_units__send__msg[2][27];
  assign route_units__send__rdy[2][27] = switch_units__recv__rdy[27][2];
  assign switch_units__recv__val[27][2] = route_units__send__val[2][27];
  assign switch_units__recv__msg[28][2] = route_units__send__msg[2][28];
  assign route_units__send__rdy[2][28] = switch_units__recv__rdy[28][2];
  assign switch_units__recv__val[28][2] = route_units__send__val[2][28];
  assign switch_units__recv__msg[29][2] = route_units__send__msg[2][29];
  assign route_units__send__rdy[2][29] = switch_units__recv__rdy[29][2];
  assign switch_units__recv__val[29][2] = route_units__send__val[2][29];
  assign switch_units__recv__msg[30][2] = route_units__send__msg[2][30];
  assign route_units__send__rdy[2][30] = switch_units__recv__rdy[30][2];
  assign switch_units__recv__val[30][2] = route_units__send__val[2][30];
  assign switch_units__recv__msg[31][2] = route_units__send__msg[2][31];
  assign route_units__send__rdy[2][31] = switch_units__recv__rdy[31][2];
  assign switch_units__recv__val[31][2] = route_units__send__val[2][31];
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
  assign output_units__recv__msg[4] = switch_units__send__msg[4];
  assign switch_units__send__rdy[4] = output_units__recv__rdy[4];
  assign output_units__recv__val[4] = switch_units__send__val[4];
  assign send__msg[4] = output_units__send__msg[4];
  assign output_units__send__rdy[4] = send__rdy[4];
  assign send__val[4] = output_units__send__val[4];
  assign output_units__recv__msg[5] = switch_units__send__msg[5];
  assign switch_units__send__rdy[5] = output_units__recv__rdy[5];
  assign output_units__recv__val[5] = switch_units__send__val[5];
  assign send__msg[5] = output_units__send__msg[5];
  assign output_units__send__rdy[5] = send__rdy[5];
  assign send__val[5] = output_units__send__val[5];
  assign output_units__recv__msg[6] = switch_units__send__msg[6];
  assign switch_units__send__rdy[6] = output_units__recv__rdy[6];
  assign output_units__recv__val[6] = switch_units__send__val[6];
  assign send__msg[6] = output_units__send__msg[6];
  assign output_units__send__rdy[6] = send__rdy[6];
  assign send__val[6] = output_units__send__val[6];
  assign output_units__recv__msg[7] = switch_units__send__msg[7];
  assign switch_units__send__rdy[7] = output_units__recv__rdy[7];
  assign output_units__recv__val[7] = switch_units__send__val[7];
  assign send__msg[7] = output_units__send__msg[7];
  assign output_units__send__rdy[7] = send__rdy[7];
  assign send__val[7] = output_units__send__val[7];
  assign output_units__recv__msg[8] = switch_units__send__msg[8];
  assign switch_units__send__rdy[8] = output_units__recv__rdy[8];
  assign output_units__recv__val[8] = switch_units__send__val[8];
  assign send__msg[8] = output_units__send__msg[8];
  assign output_units__send__rdy[8] = send__rdy[8];
  assign send__val[8] = output_units__send__val[8];
  assign output_units__recv__msg[9] = switch_units__send__msg[9];
  assign switch_units__send__rdy[9] = output_units__recv__rdy[9];
  assign output_units__recv__val[9] = switch_units__send__val[9];
  assign send__msg[9] = output_units__send__msg[9];
  assign output_units__send__rdy[9] = send__rdy[9];
  assign send__val[9] = output_units__send__val[9];
  assign output_units__recv__msg[10] = switch_units__send__msg[10];
  assign switch_units__send__rdy[10] = output_units__recv__rdy[10];
  assign output_units__recv__val[10] = switch_units__send__val[10];
  assign send__msg[10] = output_units__send__msg[10];
  assign output_units__send__rdy[10] = send__rdy[10];
  assign send__val[10] = output_units__send__val[10];
  assign output_units__recv__msg[11] = switch_units__send__msg[11];
  assign switch_units__send__rdy[11] = output_units__recv__rdy[11];
  assign output_units__recv__val[11] = switch_units__send__val[11];
  assign send__msg[11] = output_units__send__msg[11];
  assign output_units__send__rdy[11] = send__rdy[11];
  assign send__val[11] = output_units__send__val[11];
  assign output_units__recv__msg[12] = switch_units__send__msg[12];
  assign switch_units__send__rdy[12] = output_units__recv__rdy[12];
  assign output_units__recv__val[12] = switch_units__send__val[12];
  assign send__msg[12] = output_units__send__msg[12];
  assign output_units__send__rdy[12] = send__rdy[12];
  assign send__val[12] = output_units__send__val[12];
  assign output_units__recv__msg[13] = switch_units__send__msg[13];
  assign switch_units__send__rdy[13] = output_units__recv__rdy[13];
  assign output_units__recv__val[13] = switch_units__send__val[13];
  assign send__msg[13] = output_units__send__msg[13];
  assign output_units__send__rdy[13] = send__rdy[13];
  assign send__val[13] = output_units__send__val[13];
  assign output_units__recv__msg[14] = switch_units__send__msg[14];
  assign switch_units__send__rdy[14] = output_units__recv__rdy[14];
  assign output_units__recv__val[14] = switch_units__send__val[14];
  assign send__msg[14] = output_units__send__msg[14];
  assign output_units__send__rdy[14] = send__rdy[14];
  assign send__val[14] = output_units__send__val[14];
  assign output_units__recv__msg[15] = switch_units__send__msg[15];
  assign switch_units__send__rdy[15] = output_units__recv__rdy[15];
  assign output_units__recv__val[15] = switch_units__send__val[15];
  assign send__msg[15] = output_units__send__msg[15];
  assign output_units__send__rdy[15] = send__rdy[15];
  assign send__val[15] = output_units__send__val[15];
  assign output_units__recv__msg[16] = switch_units__send__msg[16];
  assign switch_units__send__rdy[16] = output_units__recv__rdy[16];
  assign output_units__recv__val[16] = switch_units__send__val[16];
  assign send__msg[16] = output_units__send__msg[16];
  assign output_units__send__rdy[16] = send__rdy[16];
  assign send__val[16] = output_units__send__val[16];
  assign output_units__recv__msg[17] = switch_units__send__msg[17];
  assign switch_units__send__rdy[17] = output_units__recv__rdy[17];
  assign output_units__recv__val[17] = switch_units__send__val[17];
  assign send__msg[17] = output_units__send__msg[17];
  assign output_units__send__rdy[17] = send__rdy[17];
  assign send__val[17] = output_units__send__val[17];
  assign output_units__recv__msg[18] = switch_units__send__msg[18];
  assign switch_units__send__rdy[18] = output_units__recv__rdy[18];
  assign output_units__recv__val[18] = switch_units__send__val[18];
  assign send__msg[18] = output_units__send__msg[18];
  assign output_units__send__rdy[18] = send__rdy[18];
  assign send__val[18] = output_units__send__val[18];
  assign output_units__recv__msg[19] = switch_units__send__msg[19];
  assign switch_units__send__rdy[19] = output_units__recv__rdy[19];
  assign output_units__recv__val[19] = switch_units__send__val[19];
  assign send__msg[19] = output_units__send__msg[19];
  assign output_units__send__rdy[19] = send__rdy[19];
  assign send__val[19] = output_units__send__val[19];
  assign output_units__recv__msg[20] = switch_units__send__msg[20];
  assign switch_units__send__rdy[20] = output_units__recv__rdy[20];
  assign output_units__recv__val[20] = switch_units__send__val[20];
  assign send__msg[20] = output_units__send__msg[20];
  assign output_units__send__rdy[20] = send__rdy[20];
  assign send__val[20] = output_units__send__val[20];
  assign output_units__recv__msg[21] = switch_units__send__msg[21];
  assign switch_units__send__rdy[21] = output_units__recv__rdy[21];
  assign output_units__recv__val[21] = switch_units__send__val[21];
  assign send__msg[21] = output_units__send__msg[21];
  assign output_units__send__rdy[21] = send__rdy[21];
  assign send__val[21] = output_units__send__val[21];
  assign output_units__recv__msg[22] = switch_units__send__msg[22];
  assign switch_units__send__rdy[22] = output_units__recv__rdy[22];
  assign output_units__recv__val[22] = switch_units__send__val[22];
  assign send__msg[22] = output_units__send__msg[22];
  assign output_units__send__rdy[22] = send__rdy[22];
  assign send__val[22] = output_units__send__val[22];
  assign output_units__recv__msg[23] = switch_units__send__msg[23];
  assign switch_units__send__rdy[23] = output_units__recv__rdy[23];
  assign output_units__recv__val[23] = switch_units__send__val[23];
  assign send__msg[23] = output_units__send__msg[23];
  assign output_units__send__rdy[23] = send__rdy[23];
  assign send__val[23] = output_units__send__val[23];
  assign output_units__recv__msg[24] = switch_units__send__msg[24];
  assign switch_units__send__rdy[24] = output_units__recv__rdy[24];
  assign output_units__recv__val[24] = switch_units__send__val[24];
  assign send__msg[24] = output_units__send__msg[24];
  assign output_units__send__rdy[24] = send__rdy[24];
  assign send__val[24] = output_units__send__val[24];
  assign output_units__recv__msg[25] = switch_units__send__msg[25];
  assign switch_units__send__rdy[25] = output_units__recv__rdy[25];
  assign output_units__recv__val[25] = switch_units__send__val[25];
  assign send__msg[25] = output_units__send__msg[25];
  assign output_units__send__rdy[25] = send__rdy[25];
  assign send__val[25] = output_units__send__val[25];
  assign output_units__recv__msg[26] = switch_units__send__msg[26];
  assign switch_units__send__rdy[26] = output_units__recv__rdy[26];
  assign output_units__recv__val[26] = switch_units__send__val[26];
  assign send__msg[26] = output_units__send__msg[26];
  assign output_units__send__rdy[26] = send__rdy[26];
  assign send__val[26] = output_units__send__val[26];
  assign output_units__recv__msg[27] = switch_units__send__msg[27];
  assign switch_units__send__rdy[27] = output_units__recv__rdy[27];
  assign output_units__recv__val[27] = switch_units__send__val[27];
  assign send__msg[27] = output_units__send__msg[27];
  assign output_units__send__rdy[27] = send__rdy[27];
  assign send__val[27] = output_units__send__val[27];
  assign output_units__recv__msg[28] = switch_units__send__msg[28];
  assign switch_units__send__rdy[28] = output_units__recv__rdy[28];
  assign output_units__recv__val[28] = switch_units__send__val[28];
  assign send__msg[28] = output_units__send__msg[28];
  assign output_units__send__rdy[28] = send__rdy[28];
  assign send__val[28] = output_units__send__val[28];
  assign output_units__recv__msg[29] = switch_units__send__msg[29];
  assign switch_units__send__rdy[29] = output_units__recv__rdy[29];
  assign output_units__recv__val[29] = switch_units__send__val[29];
  assign send__msg[29] = output_units__send__msg[29];
  assign output_units__send__rdy[29] = send__rdy[29];
  assign send__val[29] = output_units__send__val[29];
  assign output_units__recv__msg[30] = switch_units__send__msg[30];
  assign switch_units__send__rdy[30] = output_units__recv__rdy[30];
  assign output_units__recv__val[30] = switch_units__send__val[30];
  assign send__msg[30] = output_units__send__msg[30];
  assign output_units__send__rdy[30] = send__rdy[30];
  assign send__val[30] = output_units__send__val[30];
  assign output_units__recv__msg[31] = switch_units__send__msg[31];
  assign switch_units__send__rdy[31] = output_units__recv__rdy[31];
  assign output_units__recv__val[31] = switch_units__send__val[31];
  assign send__msg[31] = output_units__send__msg[31];
  assign output_units__send__rdy[31] = send__rdy[31];
  assign send__val[31] = output_units__send__val[31];

endmodule