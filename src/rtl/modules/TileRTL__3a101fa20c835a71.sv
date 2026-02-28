module TileRTL__3a101fa20c835a71
import cgra_pkg::*;
(
  input  logic [1:0] cgra_id ,
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input  logic [8:0] tile_id ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 from_mem_rdata__msg  ,
  output logic [0:0] from_mem_rdata__rdy  ,
  input logic [0:0] from_mem_rdata__val  ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data__msg [0:7] ,
  output logic [0:0] recv_data__rdy [0:7] ,
  input logic [0:0] recv_data__val [0:7] ,
  input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv_from_controller_pkt__msg  ,
  output logic [0:0] recv_from_controller_pkt__rdy  ,
  input logic [0:0] recv_from_controller_pkt__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_data__msg [0:7] ,
  input logic [0:0] send_data__rdy [0:7] ,
  output logic [0:0] send_data__val [0:7] ,
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send_to_controller_pkt__msg  ,
  input logic [0:0] send_to_controller_pkt__rdy  ,
  output logic [0:0] send_to_controller_pkt__val  ,
  output logic [8:0] to_mem_raddr__msg  ,
  input logic [0:0] to_mem_raddr__rdy  ,
  output logic [0:0] to_mem_raddr__val  ,
  output logic [8:0] to_mem_waddr__msg  ,
  input logic [0:0] to_mem_waddr__rdy  ,
  output logic [0:0] to_mem_waddr__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 to_mem_wdata__msg  ,
  input logic [0:0] to_mem_wdata__rdy  ,
  output logic [0:0] to_mem_wdata__val  
);
  localparam logic [1:0] __const__CMD_CONFIG  = 2'd3;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU  = 3'd4;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR  = 3'd5;
  localparam logic [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR  = 3'd6;
  localparam logic [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT  = 3'd7;
  localparam logic [3:0] __const__CMD_CONFIG_COUNT_PER_ITER  = 4'd8;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE  = 5'd20;
  localparam logic [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE  = 5'd21;
  localparam logic [0:0] __const__CMD_LAUNCH  = 1'd0;
  localparam logic [3:0] __const__CMD_CONST  = 4'd13;
  logic [0:0] element_done;
  logic [0:0] fu_crossbar_done;
  logic [0:0] routing_crossbar_done;
  //-------------------------------------------------------------
  // Component const_mem
  //-------------------------------------------------------------

  logic [0:0] const_mem__clear;
  logic [0:0] const_mem__clk;
  logic [0:0] const_mem__ctrl_proceed;
  logic [0:0] const_mem__reset;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 const_mem__recv_const__msg;
  logic [0:0] const_mem__recv_const__rdy;
  logic [0:0] const_mem__recv_const__val;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 const_mem__send_const__msg;
  logic [0:0] const_mem__send_const__rdy;
  logic [0:0] const_mem__send_const__val;

  ConstQueueDynamicRTL__04942ff39dc493d7 const_mem
  (
    .clear( const_mem__clear ),
    .clk( const_mem__clk ),
    .ctrl_proceed( const_mem__ctrl_proceed ),
    .reset( const_mem__reset ),
    .recv_const__msg( const_mem__recv_const__msg ),
    .recv_const__rdy( const_mem__recv_const__rdy ),
    .recv_const__val( const_mem__recv_const__val ),
    .send_const__msg( const_mem__send_const__msg ),
    .send_const__rdy( const_mem__send_const__rdy ),
    .send_const__val( const_mem__send_const__val )
  );

  //-------------------------------------------------------------
  // End of component const_mem
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component ctrl_mem
  //-------------------------------------------------------------

  logic [1:0] ctrl_mem__cgra_id;
  logic [0:0] ctrl_mem__clk;
  logic [2:0] ctrl_mem__ctrl_addr_outport;
  logic [2:0] ctrl_mem__prologue_count_outport_fu;
  logic [2:0] ctrl_mem__prologue_count_outport_fu_crossbar [0:7][0:1];
  logic [2:0] ctrl_mem__prologue_count_outport_routing_crossbar [0:7][0:7];
  logic [0:0] ctrl_mem__reset;
  logic [8:0] ctrl_mem__tile_id;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f ctrl_mem__recv_from_element__msg;
  logic [0:0] ctrl_mem__recv_from_element__rdy;
  logic [0:0] ctrl_mem__recv_from_element__val;
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d ctrl_mem__recv_pkt_from_controller__msg;
  logic [0:0] ctrl_mem__recv_pkt_from_controller__rdy;
  logic [0:0] ctrl_mem__recv_pkt_from_controller__val;
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f ctrl_mem__send_ctrl__msg;
  logic [0:0] ctrl_mem__send_ctrl__rdy;
  logic [0:0] ctrl_mem__send_ctrl__val;
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d ctrl_mem__send_pkt_to_controller__msg;
  logic [0:0] ctrl_mem__send_pkt_to_controller__rdy;
  logic [0:0] ctrl_mem__send_pkt_to_controller__val;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f ctrl_mem__send_to_element__msg;
  logic [0:0] ctrl_mem__send_to_element__rdy;
  logic [0:0] ctrl_mem__send_to_element__val;

  CtrlMemDynamicRTL__c76262b5eab974b5 ctrl_mem
  (
    .cgra_id( ctrl_mem__cgra_id ),
    .clk( ctrl_mem__clk ),
    .ctrl_addr_outport( ctrl_mem__ctrl_addr_outport ),
    .prologue_count_outport_fu( ctrl_mem__prologue_count_outport_fu ),
    .prologue_count_outport_fu_crossbar( ctrl_mem__prologue_count_outport_fu_crossbar ),
    .prologue_count_outport_routing_crossbar( ctrl_mem__prologue_count_outport_routing_crossbar ),
    .reset( ctrl_mem__reset ),
    .tile_id( ctrl_mem__tile_id ),
    .recv_from_element__msg( ctrl_mem__recv_from_element__msg ),
    .recv_from_element__rdy( ctrl_mem__recv_from_element__rdy ),
    .recv_from_element__val( ctrl_mem__recv_from_element__val ),
    .recv_pkt_from_controller__msg( ctrl_mem__recv_pkt_from_controller__msg ),
    .recv_pkt_from_controller__rdy( ctrl_mem__recv_pkt_from_controller__rdy ),
    .recv_pkt_from_controller__val( ctrl_mem__recv_pkt_from_controller__val ),
    .send_ctrl__msg( ctrl_mem__send_ctrl__msg ),
    .send_ctrl__rdy( ctrl_mem__send_ctrl__rdy ),
    .send_ctrl__val( ctrl_mem__send_ctrl__val ),
    .send_pkt_to_controller__msg( ctrl_mem__send_pkt_to_controller__msg ),
    .send_pkt_to_controller__rdy( ctrl_mem__send_pkt_to_controller__rdy ),
    .send_pkt_to_controller__val( ctrl_mem__send_pkt_to_controller__val ),
    .send_to_element__msg( ctrl_mem__send_to_element__msg ),
    .send_to_element__rdy( ctrl_mem__send_to_element__rdy ),
    .send_to_element__val( ctrl_mem__send_to_element__val )
  );

  //-------------------------------------------------------------
  // End of component ctrl_mem
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component element
  //-------------------------------------------------------------

  logic [0:0] element__clear [0:15];
  logic [0:0] element__clk;
  logic [2:0] element__ctrl_addr_inport;
  logic [2:0] element__prologue_count_inport;
  logic [0:0] element__reset;
  logic [8:0] element__tile_id;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 element__from_mem_rdata__msg [0:15];
  logic [0:0] element__from_mem_rdata__rdy [0:15];
  logic [0:0] element__from_mem_rdata__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 element__recv_const__msg;
  logic [0:0] element__recv_const__rdy;
  logic [0:0] element__recv_const__val;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f element__recv_from_ctrl_mem__msg;
  logic [0:0] element__recv_from_ctrl_mem__rdy;
  logic [0:0] element__recv_from_ctrl_mem__val;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 element__recv_in__msg [0:3];
  logic [0:0] element__recv_in__rdy [0:3];
  logic [0:0] element__recv_in__val [0:3];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f element__recv_opt__msg;
  logic [0:0] element__recv_opt__rdy;
  logic [0:0] element__recv_opt__val;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 element__send_out__msg [0:1];
  logic [0:0] element__send_out__rdy [0:1];
  logic [0:0] element__send_out__val [0:1];
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f element__send_to_ctrl_mem__msg;
  logic [0:0] element__send_to_ctrl_mem__rdy;
  logic [0:0] element__send_to_ctrl_mem__val;
  logic [8:0] element__to_mem_raddr__msg [0:15];
  logic [0:0] element__to_mem_raddr__rdy [0:15];
  logic [0:0] element__to_mem_raddr__val [0:15];
  logic [8:0] element__to_mem_waddr__msg [0:15];
  logic [0:0] element__to_mem_waddr__rdy [0:15];
  logic [0:0] element__to_mem_waddr__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 element__to_mem_wdata__msg [0:15];
  logic [0:0] element__to_mem_wdata__rdy [0:15];
  logic [0:0] element__to_mem_wdata__val [0:15];

  FlexibleFuRTL__59f466375d9ce40e element
  (
    .clear( element__clear ),
    .clk( element__clk ),
    .ctrl_addr_inport( element__ctrl_addr_inport ),
    .prologue_count_inport( element__prologue_count_inport ),
    .reset( element__reset ),
    .tile_id( element__tile_id ),
    .from_mem_rdata__msg( element__from_mem_rdata__msg ),
    .from_mem_rdata__rdy( element__from_mem_rdata__rdy ),
    .from_mem_rdata__val( element__from_mem_rdata__val ),
    .recv_const__msg( element__recv_const__msg ),
    .recv_const__rdy( element__recv_const__rdy ),
    .recv_const__val( element__recv_const__val ),
    .recv_from_ctrl_mem__msg( element__recv_from_ctrl_mem__msg ),
    .recv_from_ctrl_mem__rdy( element__recv_from_ctrl_mem__rdy ),
    .recv_from_ctrl_mem__val( element__recv_from_ctrl_mem__val ),
    .recv_in__msg( element__recv_in__msg ),
    .recv_in__rdy( element__recv_in__rdy ),
    .recv_in__val( element__recv_in__val ),
    .recv_opt__msg( element__recv_opt__msg ),
    .recv_opt__rdy( element__recv_opt__rdy ),
    .recv_opt__val( element__recv_opt__val ),
    .send_out__msg( element__send_out__msg ),
    .send_out__rdy( element__send_out__rdy ),
    .send_out__val( element__send_out__val ),
    .send_to_ctrl_mem__msg( element__send_to_ctrl_mem__msg ),
    .send_to_ctrl_mem__rdy( element__send_to_ctrl_mem__rdy ),
    .send_to_ctrl_mem__val( element__send_to_ctrl_mem__val ),
    .to_mem_raddr__msg( element__to_mem_raddr__msg ),
    .to_mem_raddr__rdy( element__to_mem_raddr__rdy ),
    .to_mem_raddr__val( element__to_mem_raddr__val ),
    .to_mem_waddr__msg( element__to_mem_waddr__msg ),
    .to_mem_waddr__rdy( element__to_mem_waddr__rdy ),
    .to_mem_waddr__val( element__to_mem_waddr__val ),
    .to_mem_wdata__msg( element__to_mem_wdata__msg ),
    .to_mem_wdata__rdy( element__to_mem_wdata__rdy ),
    .to_mem_wdata__val( element__to_mem_wdata__val )
  );

  //-------------------------------------------------------------
  // End of component element
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component fu_crossbar
  //-------------------------------------------------------------

  logic [1:0] fu_crossbar__cgra_id;
  logic [0:0] fu_crossbar__clear;
  logic [0:0] fu_crossbar__clk;
  logic [0:0] fu_crossbar__compute_done;
  logic [0:0] fu_crossbar__crossbar_id;
  logic [1:0] fu_crossbar__crossbar_outport [0:11];
  logic [2:0] fu_crossbar__ctrl_addr_inport;
  logic [2:0] fu_crossbar__prologue_count_inport [0:7][0:1];
  logic [0:0] fu_crossbar__reset;
  logic [8:0] fu_crossbar__tile_id;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu_crossbar__recv_data__msg [0:1];
  logic [0:0] fu_crossbar__recv_data__rdy [0:1];
  logic [0:0] fu_crossbar__recv_data__val [0:1];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f fu_crossbar__recv_opt__msg;
  logic [0:0] fu_crossbar__recv_opt__rdy;
  logic [0:0] fu_crossbar__recv_opt__val;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu_crossbar__send_data__msg [0:11];
  logic [0:0] fu_crossbar__send_data__rdy [0:11];
  logic [0:0] fu_crossbar__send_data__val [0:11];

  CrossbarRTL__447f8cfcf26711c9 fu_crossbar
  (
    .cgra_id( fu_crossbar__cgra_id ),
    .clear( fu_crossbar__clear ),
    .clk( fu_crossbar__clk ),
    .compute_done( fu_crossbar__compute_done ),
    .crossbar_id( fu_crossbar__crossbar_id ),
    .crossbar_outport( fu_crossbar__crossbar_outport ),
    .ctrl_addr_inport( fu_crossbar__ctrl_addr_inport ),
    .prologue_count_inport( fu_crossbar__prologue_count_inport ),
    .reset( fu_crossbar__reset ),
    .tile_id( fu_crossbar__tile_id ),
    .recv_data__msg( fu_crossbar__recv_data__msg ),
    .recv_data__rdy( fu_crossbar__recv_data__rdy ),
    .recv_data__val( fu_crossbar__recv_data__val ),
    .recv_opt__msg( fu_crossbar__recv_opt__msg ),
    .recv_opt__rdy( fu_crossbar__recv_opt__rdy ),
    .recv_opt__val( fu_crossbar__recv_opt__val ),
    .send_data__msg( fu_crossbar__send_data__msg ),
    .send_data__rdy( fu_crossbar__send_data__rdy ),
    .send_data__val( fu_crossbar__send_data__val )
  );

  //-------------------------------------------------------------
  // End of component fu_crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component register_cluster
  //-------------------------------------------------------------

  logic [0:0] register_cluster__clk;
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f register_cluster__inport_opt;
  logic [0:0] register_cluster__reset;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 register_cluster__recv_data_from_const__msg [0:3];
  logic [0:0] register_cluster__recv_data_from_const__rdy [0:3];
  logic [0:0] register_cluster__recv_data_from_const__val [0:3];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 register_cluster__recv_data_from_fu_crossbar__msg [0:3];
  logic [0:0] register_cluster__recv_data_from_fu_crossbar__rdy [0:3];
  logic [0:0] register_cluster__recv_data_from_fu_crossbar__val [0:3];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 register_cluster__recv_data_from_routing_crossbar__msg [0:3];
  logic [0:0] register_cluster__recv_data_from_routing_crossbar__rdy [0:3];
  logic [0:0] register_cluster__recv_data_from_routing_crossbar__val [0:3];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 register_cluster__send_data_to_fu__msg [0:3];
  logic [0:0] register_cluster__send_data_to_fu__rdy [0:3];
  logic [0:0] register_cluster__send_data_to_fu__val [0:3];

  RegisterClusterRTL__8a44c1a18964df48 register_cluster
  (
    .clk( register_cluster__clk ),
    .inport_opt( register_cluster__inport_opt ),
    .reset( register_cluster__reset ),
    .recv_data_from_const__msg( register_cluster__recv_data_from_const__msg ),
    .recv_data_from_const__rdy( register_cluster__recv_data_from_const__rdy ),
    .recv_data_from_const__val( register_cluster__recv_data_from_const__val ),
    .recv_data_from_fu_crossbar__msg( register_cluster__recv_data_from_fu_crossbar__msg ),
    .recv_data_from_fu_crossbar__rdy( register_cluster__recv_data_from_fu_crossbar__rdy ),
    .recv_data_from_fu_crossbar__val( register_cluster__recv_data_from_fu_crossbar__val ),
    .recv_data_from_routing_crossbar__msg( register_cluster__recv_data_from_routing_crossbar__msg ),
    .recv_data_from_routing_crossbar__rdy( register_cluster__recv_data_from_routing_crossbar__rdy ),
    .recv_data_from_routing_crossbar__val( register_cluster__recv_data_from_routing_crossbar__val ),
    .send_data_to_fu__msg( register_cluster__send_data_to_fu__msg ),
    .send_data_to_fu__rdy( register_cluster__send_data_to_fu__rdy ),
    .send_data_to_fu__val( register_cluster__send_data_to_fu__val )
  );

  //-------------------------------------------------------------
  // End of component register_cluster
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component routing_crossbar
  //-------------------------------------------------------------

  logic [1:0] routing_crossbar__cgra_id;
  logic [0:0] routing_crossbar__clear;
  logic [0:0] routing_crossbar__clk;
  logic [0:0] routing_crossbar__compute_done;
  logic [0:0] routing_crossbar__crossbar_id;
  logic [3:0] routing_crossbar__crossbar_outport [0:11];
  logic [2:0] routing_crossbar__ctrl_addr_inport;
  logic [2:0] routing_crossbar__prologue_count_inport [0:7][0:7];
  logic [0:0] routing_crossbar__reset;
  logic [8:0] routing_crossbar__tile_id;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 routing_crossbar__recv_data__msg [0:7];
  logic [0:0] routing_crossbar__recv_data__rdy [0:7];
  logic [0:0] routing_crossbar__recv_data__val [0:7];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f routing_crossbar__recv_opt__msg;
  logic [0:0] routing_crossbar__recv_opt__rdy;
  logic [0:0] routing_crossbar__recv_opt__val;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 routing_crossbar__send_data__msg [0:11];
  logic [0:0] routing_crossbar__send_data__rdy [0:11];
  logic [0:0] routing_crossbar__send_data__val [0:11];

  CrossbarRTL__eb4a909a6d47afd9 routing_crossbar
  (
    .cgra_id( routing_crossbar__cgra_id ),
    .clear( routing_crossbar__clear ),
    .clk( routing_crossbar__clk ),
    .compute_done( routing_crossbar__compute_done ),
    .crossbar_id( routing_crossbar__crossbar_id ),
    .crossbar_outport( routing_crossbar__crossbar_outport ),
    .ctrl_addr_inport( routing_crossbar__ctrl_addr_inport ),
    .prologue_count_inport( routing_crossbar__prologue_count_inport ),
    .reset( routing_crossbar__reset ),
    .tile_id( routing_crossbar__tile_id ),
    .recv_data__msg( routing_crossbar__recv_data__msg ),
    .recv_data__rdy( routing_crossbar__recv_data__rdy ),
    .recv_data__val( routing_crossbar__recv_data__val ),
    .recv_opt__msg( routing_crossbar__recv_opt__msg ),
    .recv_opt__rdy( routing_crossbar__recv_opt__rdy ),
    .recv_opt__val( routing_crossbar__recv_opt__val ),
    .send_data__msg( routing_crossbar__send_data__msg ),
    .send_data__rdy( routing_crossbar__send_data__rdy ),
    .send_data__val( routing_crossbar__send_data__val )
  );

  //-------------------------------------------------------------
  // End of component routing_crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component tile_in_channel[0:7]
  //-------------------------------------------------------------

  logic [0:0] tile_in_channel__clk [0:7];
  logic [0:0] tile_in_channel__reset [0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 tile_in_channel__recv__msg [0:7];
  logic [0:0] tile_in_channel__recv__rdy [0:7];
  logic [0:0] tile_in_channel__recv__val [0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 tile_in_channel__send__msg [0:7];
  logic [0:0] tile_in_channel__send__rdy [0:7];
  logic [0:0] tile_in_channel__send__val [0:7];

  ChannelRTL__d316842813c529a6 tile_in_channel__0
  (
    .clk( tile_in_channel__clk[0] ),
    .reset( tile_in_channel__reset[0] ),
    .recv__msg( tile_in_channel__recv__msg[0] ),
    .recv__rdy( tile_in_channel__recv__rdy[0] ),
    .recv__val( tile_in_channel__recv__val[0] ),
    .send__msg( tile_in_channel__send__msg[0] ),
    .send__rdy( tile_in_channel__send__rdy[0] ),
    .send__val( tile_in_channel__send__val[0] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__1
  (
    .clk( tile_in_channel__clk[1] ),
    .reset( tile_in_channel__reset[1] ),
    .recv__msg( tile_in_channel__recv__msg[1] ),
    .recv__rdy( tile_in_channel__recv__rdy[1] ),
    .recv__val( tile_in_channel__recv__val[1] ),
    .send__msg( tile_in_channel__send__msg[1] ),
    .send__rdy( tile_in_channel__send__rdy[1] ),
    .send__val( tile_in_channel__send__val[1] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__2
  (
    .clk( tile_in_channel__clk[2] ),
    .reset( tile_in_channel__reset[2] ),
    .recv__msg( tile_in_channel__recv__msg[2] ),
    .recv__rdy( tile_in_channel__recv__rdy[2] ),
    .recv__val( tile_in_channel__recv__val[2] ),
    .send__msg( tile_in_channel__send__msg[2] ),
    .send__rdy( tile_in_channel__send__rdy[2] ),
    .send__val( tile_in_channel__send__val[2] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__3
  (
    .clk( tile_in_channel__clk[3] ),
    .reset( tile_in_channel__reset[3] ),
    .recv__msg( tile_in_channel__recv__msg[3] ),
    .recv__rdy( tile_in_channel__recv__rdy[3] ),
    .recv__val( tile_in_channel__recv__val[3] ),
    .send__msg( tile_in_channel__send__msg[3] ),
    .send__rdy( tile_in_channel__send__rdy[3] ),
    .send__val( tile_in_channel__send__val[3] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__4
  (
    .clk( tile_in_channel__clk[4] ),
    .reset( tile_in_channel__reset[4] ),
    .recv__msg( tile_in_channel__recv__msg[4] ),
    .recv__rdy( tile_in_channel__recv__rdy[4] ),
    .recv__val( tile_in_channel__recv__val[4] ),
    .send__msg( tile_in_channel__send__msg[4] ),
    .send__rdy( tile_in_channel__send__rdy[4] ),
    .send__val( tile_in_channel__send__val[4] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__5
  (
    .clk( tile_in_channel__clk[5] ),
    .reset( tile_in_channel__reset[5] ),
    .recv__msg( tile_in_channel__recv__msg[5] ),
    .recv__rdy( tile_in_channel__recv__rdy[5] ),
    .recv__val( tile_in_channel__recv__val[5] ),
    .send__msg( tile_in_channel__send__msg[5] ),
    .send__rdy( tile_in_channel__send__rdy[5] ),
    .send__val( tile_in_channel__send__val[5] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__6
  (
    .clk( tile_in_channel__clk[6] ),
    .reset( tile_in_channel__reset[6] ),
    .recv__msg( tile_in_channel__recv__msg[6] ),
    .recv__rdy( tile_in_channel__recv__rdy[6] ),
    .recv__val( tile_in_channel__recv__val[6] ),
    .send__msg( tile_in_channel__send__msg[6] ),
    .send__rdy( tile_in_channel__send__rdy[6] ),
    .send__val( tile_in_channel__send__val[6] )
  );

  ChannelRTL__d316842813c529a6 tile_in_channel__7
  (
    .clk( tile_in_channel__clk[7] ),
    .reset( tile_in_channel__reset[7] ),
    .recv__msg( tile_in_channel__recv__msg[7] ),
    .recv__rdy( tile_in_channel__recv__rdy[7] ),
    .recv__val( tile_in_channel__recv__val[7] ),
    .send__msg( tile_in_channel__send__msg[7] ),
    .send__rdy( tile_in_channel__send__rdy[7] ),
    .send__val( tile_in_channel__send__val[7] )
  );

  //-------------------------------------------------------------
  // End of component tile_in_channel[0:7]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component tile_out_or_link[0:7]
  //-------------------------------------------------------------

  logic [0:0] tile_out_or_link__clk [0:7];
  logic [0:0] tile_out_or_link__reset [0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 tile_out_or_link__recv_fu__msg [0:7];
  logic [0:0] tile_out_or_link__recv_fu__rdy [0:7];
  logic [0:0] tile_out_or_link__recv_fu__val [0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 tile_out_or_link__recv_xbar__msg [0:7];
  logic [0:0] tile_out_or_link__recv_xbar__rdy [0:7];
  logic [0:0] tile_out_or_link__recv_xbar__val [0:7];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 tile_out_or_link__send__msg [0:7];
  logic [0:0] tile_out_or_link__send__rdy [0:7];
  logic [0:0] tile_out_or_link__send__val [0:7];

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__0
  (
    .clk( tile_out_or_link__clk[0] ),
    .reset( tile_out_or_link__reset[0] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[0] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[0] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[0] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[0] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[0] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[0] ),
    .send__msg( tile_out_or_link__send__msg[0] ),
    .send__rdy( tile_out_or_link__send__rdy[0] ),
    .send__val( tile_out_or_link__send__val[0] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__1
  (
    .clk( tile_out_or_link__clk[1] ),
    .reset( tile_out_or_link__reset[1] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[1] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[1] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[1] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[1] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[1] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[1] ),
    .send__msg( tile_out_or_link__send__msg[1] ),
    .send__rdy( tile_out_or_link__send__rdy[1] ),
    .send__val( tile_out_or_link__send__val[1] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__2
  (
    .clk( tile_out_or_link__clk[2] ),
    .reset( tile_out_or_link__reset[2] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[2] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[2] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[2] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[2] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[2] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[2] ),
    .send__msg( tile_out_or_link__send__msg[2] ),
    .send__rdy( tile_out_or_link__send__rdy[2] ),
    .send__val( tile_out_or_link__send__val[2] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__3
  (
    .clk( tile_out_or_link__clk[3] ),
    .reset( tile_out_or_link__reset[3] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[3] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[3] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[3] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[3] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[3] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[3] ),
    .send__msg( tile_out_or_link__send__msg[3] ),
    .send__rdy( tile_out_or_link__send__rdy[3] ),
    .send__val( tile_out_or_link__send__val[3] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__4
  (
    .clk( tile_out_or_link__clk[4] ),
    .reset( tile_out_or_link__reset[4] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[4] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[4] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[4] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[4] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[4] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[4] ),
    .send__msg( tile_out_or_link__send__msg[4] ),
    .send__rdy( tile_out_or_link__send__rdy[4] ),
    .send__val( tile_out_or_link__send__val[4] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__5
  (
    .clk( tile_out_or_link__clk[5] ),
    .reset( tile_out_or_link__reset[5] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[5] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[5] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[5] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[5] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[5] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[5] ),
    .send__msg( tile_out_or_link__send__msg[5] ),
    .send__rdy( tile_out_or_link__send__rdy[5] ),
    .send__val( tile_out_or_link__send__val[5] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__6
  (
    .clk( tile_out_or_link__clk[6] ),
    .reset( tile_out_or_link__reset[6] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[6] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[6] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[6] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[6] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[6] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[6] ),
    .send__msg( tile_out_or_link__send__msg[6] ),
    .send__rdy( tile_out_or_link__send__rdy[6] ),
    .send__val( tile_out_or_link__send__val[6] )
  );

  LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__7
  (
    .clk( tile_out_or_link__clk[7] ),
    .reset( tile_out_or_link__reset[7] ),
    .recv_fu__msg( tile_out_or_link__recv_fu__msg[7] ),
    .recv_fu__rdy( tile_out_or_link__recv_fu__rdy[7] ),
    .recv_fu__val( tile_out_or_link__recv_fu__val[7] ),
    .recv_xbar__msg( tile_out_or_link__recv_xbar__msg[7] ),
    .recv_xbar__rdy( tile_out_or_link__recv_xbar__rdy[7] ),
    .recv_xbar__val( tile_out_or_link__recv_xbar__val[7] ),
    .send__msg( tile_out_or_link__send__msg[7] ),
    .send__rdy( tile_out_or_link__send__rdy[7] ),
    .send__val( tile_out_or_link__send__val[7] )
  );

  //-------------------------------------------------------------
  // End of component tile_out_or_link[0:7]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:237
  // @update
  // def feed_pkt():
  //     s.ctrl_mem.recv_pkt_from_controller.msg @= CtrlPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) # , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //     s.const_mem.recv_const.msg @= DataType(0, 0, 0, 0)
  //     s.ctrl_mem.recv_pkt_from_controller.val @= 0
  //     s.const_mem.recv_const.val @= 0
  //     s.recv_from_controller_pkt.rdy @= 0
  // 
  //     if s.recv_from_controller_pkt.val & \
  //        ((s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG_PROLOGUE_FU_CROSSBAR) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG_TOTAL_CTRL_COUNT) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONFIG_COUNT_PER_ITER) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_GLOBAL_REDUCE_ADD_RESPONSE) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_GLOBAL_REDUCE_MUL_RESPONSE) | \
  //         (s.recv_from_controller_pkt.msg.payload.cmd == CMD_LAUNCH)):
  //         s.ctrl_mem.recv_pkt_from_controller.val @= 1
  //         s.ctrl_mem.recv_pkt_from_controller.msg @= s.recv_from_controller_pkt.msg
  //         s.recv_from_controller_pkt.rdy @= s.ctrl_mem.recv_pkt_from_controller.rdy
  //     elif s.recv_from_controller_pkt.val & (s.recv_from_controller_pkt.msg.payload.cmd == CMD_CONST):
  //         s.const_mem.recv_const.val @= 1
  //         s.const_mem.recv_const.msg @= s.recv_from_controller_pkt.msg.payload.data
  //         s.recv_from_controller_pkt.rdy @= s.const_mem.recv_const.rdy
  
  always_comb begin : feed_pkt
    ctrl_mem__recv_pkt_from_controller__msg = { 9'd0, 9'd0, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, 191'd0 };
    const_mem__recv_const__msg = { 32'd0, 1'd0, 1'd0, 1'd0 };
    ctrl_mem__recv_pkt_from_controller__val = 1'd0;
    const_mem__recv_const__val = 1'd0;
    recv_from_controller_pkt__rdy = 1'd0;
    if ( recv_from_controller_pkt__val & ( ( ( ( ( ( ( ( ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG_TOTAL_CTRL_COUNT ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONFIG_COUNT_PER_ITER ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE ) ) ) | ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_LAUNCH ) ) ) ) begin
      ctrl_mem__recv_pkt_from_controller__val = 1'd1;
      ctrl_mem__recv_pkt_from_controller__msg = recv_from_controller_pkt__msg;
      recv_from_controller_pkt__rdy = ctrl_mem__recv_pkt_from_controller__rdy;
    end
    else if ( recv_from_controller_pkt__val & ( recv_from_controller_pkt__msg.payload.cmd == 5'( __const__CMD_CONST ) ) ) begin
      const_mem__recv_const__val = 1'd1;
      const_mem__recv_const__msg = recv_from_controller_pkt__msg.payload.data;
      recv_from_controller_pkt__rdy = const_mem__recv_const__rdy;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:293
  // @update
  // def notify_const_mem():
  //   s.const_mem.ctrl_proceed @= s.ctrl_mem.send_ctrl.rdy & s.ctrl_mem.send_ctrl.val
  
  always_comb begin : notify_const_mem
    const_mem__ctrl_proceed = ctrl_mem__send_ctrl__rdy & ctrl_mem__send_ctrl__val;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:312
  // @update
  // def notify_crossbars_compute_status():
  //   s.routing_crossbar.compute_done @= s.element_done
  //   s.fu_crossbar.compute_done @= s.element_done
  
  always_comb begin : notify_crossbars_compute_status
    routing_crossbar__compute_done = element_done;
    fu_crossbar__compute_done = element_done;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:273
  // @update
  // def update_opt():
  //   s.element.recv_opt.msg @= s.ctrl_mem.send_ctrl.msg
  //   s.routing_crossbar.recv_opt.msg @= s.ctrl_mem.send_ctrl.msg
  //   s.fu_crossbar.recv_opt.msg @= s.ctrl_mem.send_ctrl.msg
  // 
  //   # FIXME: Do we still need separate element and routing_xbar?
  //   # FIXME: Do we need to consider reg bank here?
  //   s.element.recv_opt.val @= s.ctrl_mem.send_ctrl.val & ~s.element_done
  //   s.routing_crossbar.recv_opt.val @= s.ctrl_mem.send_ctrl.val & ~s.routing_crossbar_done
  //   s.fu_crossbar.recv_opt.val @= s.ctrl_mem.send_ctrl.val & ~s.fu_crossbar_done
  // 
  //   # FIXME: yo96, rename ctrl.rdy to ctrl.proceed or sth similar.
  //   # Allows either the FU-related go out first or routing-xbar go out first. And only
  //   # allows the ctrl signal proceed till all the sub-modules done their own job (once).
  //   s.ctrl_mem.send_ctrl.rdy @= (s.element.recv_opt.rdy | s.element_done) & \
  //                               (s.routing_crossbar.recv_opt.rdy | s.routing_crossbar_done) & \
  //                               (s.fu_crossbar.recv_opt.rdy | s.fu_crossbar_done)
  
  always_comb begin : update_opt
    element__recv_opt__msg = ctrl_mem__send_ctrl__msg;
    routing_crossbar__recv_opt__msg = ctrl_mem__send_ctrl__msg;
    fu_crossbar__recv_opt__msg = ctrl_mem__send_ctrl__msg;
    element__recv_opt__val = ctrl_mem__send_ctrl__val & ( ~element_done );
    routing_crossbar__recv_opt__val = ctrl_mem__send_ctrl__val & ( ~routing_crossbar_done );
    fu_crossbar__recv_opt__val = ctrl_mem__send_ctrl__val & ( ~fu_crossbar_done );
    ctrl_mem__send_ctrl__rdy = ( ( element__recv_opt__rdy | element_done ) & ( routing_crossbar__recv_opt__rdy | routing_crossbar_done ) ) & ( fu_crossbar__recv_opt__rdy | fu_crossbar_done );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:263
  // @update
  // def update_send_out_signal():
  //     s.send_to_controller_pkt.val @= 0
  //     s.send_to_controller_pkt.msg @= CtrlPktType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) # , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  //     if s.ctrl_mem.send_pkt_to_controller.val:
  //         s.send_to_controller_pkt.val @= 1
  //         s.send_to_controller_pkt.msg @= s.ctrl_mem.send_pkt_to_controller.msg
  //     s.ctrl_mem.send_pkt_to_controller.rdy @= s.send_to_controller_pkt.rdy
  
  always_comb begin : update_send_out_signal
    send_to_controller_pkt__val = 1'd0;
    send_to_controller_pkt__msg = { 9'd0, 9'd0, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, 191'd0 };
    if ( ctrl_mem__send_pkt_to_controller__val ) begin
      send_to_controller_pkt__val = 1'd1;
      send_to_controller_pkt__msg = ctrl_mem__send_pkt_to_controller__msg;
    end
    ctrl_mem__send_pkt_to_controller__rdy = send_to_controller_pkt__rdy;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/tile/TileRTL.py:298
  // @update_ff
  // def already_done():
  //   if s.reset | s.ctrl_mem.send_ctrl.rdy:
  //     s.element_done <<= 0
  //     s.fu_crossbar_done <<= 0
  //     s.routing_crossbar_done <<= 0
  //   else:
  //     if s.element.recv_opt.rdy:
  //       s.element_done <<= 1
  //     if s.fu_crossbar.recv_opt.rdy:
  //       s.fu_crossbar_done <<= 1
  //     if s.routing_crossbar.recv_opt.rdy:
  //       s.routing_crossbar_done <<= 1
  
  always_ff @(posedge clk) begin : already_done
    if ( reset | ctrl_mem__send_ctrl__rdy ) begin
      element_done <= 1'd0;
      fu_crossbar_done <= 1'd0;
      routing_crossbar_done <= 1'd0;
    end
    else begin
      if ( element__recv_opt__rdy ) begin
        element_done <= 1'd1;
      end
      if ( fu_crossbar__recv_opt__rdy ) begin
        fu_crossbar_done <= 1'd1;
      end
      if ( routing_crossbar__recv_opt__rdy ) begin
        routing_crossbar_done <= 1'd1;
      end
    end
  end

  assign element__clk = clk;
  assign element__reset = reset;
  assign const_mem__clk = clk;
  assign const_mem__reset = reset;
  assign routing_crossbar__clk = clk;
  assign routing_crossbar__reset = reset;
  assign fu_crossbar__clk = clk;
  assign fu_crossbar__reset = reset;
  assign register_cluster__clk = clk;
  assign register_cluster__reset = reset;
  assign ctrl_mem__clk = clk;
  assign ctrl_mem__reset = reset;
  assign tile_in_channel__clk[0] = clk;
  assign tile_in_channel__reset[0] = reset;
  assign tile_in_channel__clk[1] = clk;
  assign tile_in_channel__reset[1] = reset;
  assign tile_in_channel__clk[2] = clk;
  assign tile_in_channel__reset[2] = reset;
  assign tile_in_channel__clk[3] = clk;
  assign tile_in_channel__reset[3] = reset;
  assign tile_in_channel__clk[4] = clk;
  assign tile_in_channel__reset[4] = reset;
  assign tile_in_channel__clk[5] = clk;
  assign tile_in_channel__reset[5] = reset;
  assign tile_in_channel__clk[6] = clk;
  assign tile_in_channel__reset[6] = reset;
  assign tile_in_channel__clk[7] = clk;
  assign tile_in_channel__reset[7] = reset;
  assign tile_out_or_link__clk[0] = clk;
  assign tile_out_or_link__reset[0] = reset;
  assign tile_out_or_link__clk[1] = clk;
  assign tile_out_or_link__reset[1] = reset;
  assign tile_out_or_link__clk[2] = clk;
  assign tile_out_or_link__reset[2] = reset;
  assign tile_out_or_link__clk[3] = clk;
  assign tile_out_or_link__reset[3] = reset;
  assign tile_out_or_link__clk[4] = clk;
  assign tile_out_or_link__reset[4] = reset;
  assign tile_out_or_link__clk[5] = clk;
  assign tile_out_or_link__reset[5] = reset;
  assign tile_out_or_link__clk[6] = clk;
  assign tile_out_or_link__reset[6] = reset;
  assign tile_out_or_link__clk[7] = clk;
  assign tile_out_or_link__reset[7] = reset;
  assign element__tile_id = tile_id;
  assign ctrl_mem__cgra_id = cgra_id;
  assign ctrl_mem__tile_id = tile_id;
  assign fu_crossbar__cgra_id = cgra_id;
  assign fu_crossbar__tile_id = tile_id;
  assign routing_crossbar__cgra_id = cgra_id;
  assign routing_crossbar__tile_id = tile_id;
  assign routing_crossbar__crossbar_id = 1'd0;
  assign fu_crossbar__crossbar_id = 1'd1;
  assign element__recv_const__msg = const_mem__send_const__msg;
  assign const_mem__send_const__rdy = element__recv_const__rdy;
  assign element__recv_const__val = const_mem__send_const__val;
  assign ctrl_mem__recv_from_element__msg = element__send_to_ctrl_mem__msg;
  assign element__send_to_ctrl_mem__rdy = ctrl_mem__recv_from_element__rdy;
  assign ctrl_mem__recv_from_element__val = element__send_to_ctrl_mem__val;
  assign element__recv_from_ctrl_mem__msg = ctrl_mem__send_to_element__msg;
  assign ctrl_mem__send_to_element__rdy = element__recv_from_ctrl_mem__rdy;
  assign element__recv_from_ctrl_mem__val = ctrl_mem__send_to_element__val;
  assign routing_crossbar__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
  assign fu_crossbar__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
  assign element__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
  assign element__prologue_count_inport = ctrl_mem__prologue_count_outport_fu;
  assign routing_crossbar__prologue_count_inport[0][0] = ctrl_mem__prologue_count_outport_routing_crossbar[0][0];
  assign routing_crossbar__prologue_count_inport[0][1] = ctrl_mem__prologue_count_outport_routing_crossbar[0][1];
  assign routing_crossbar__prologue_count_inport[0][2] = ctrl_mem__prologue_count_outport_routing_crossbar[0][2];
  assign routing_crossbar__prologue_count_inport[0][3] = ctrl_mem__prologue_count_outport_routing_crossbar[0][3];
  assign routing_crossbar__prologue_count_inport[0][4] = ctrl_mem__prologue_count_outport_routing_crossbar[0][4];
  assign routing_crossbar__prologue_count_inport[0][5] = ctrl_mem__prologue_count_outport_routing_crossbar[0][5];
  assign routing_crossbar__prologue_count_inport[0][6] = ctrl_mem__prologue_count_outport_routing_crossbar[0][6];
  assign routing_crossbar__prologue_count_inport[0][7] = ctrl_mem__prologue_count_outport_routing_crossbar[0][7];
  assign fu_crossbar__prologue_count_inport[0][0] = ctrl_mem__prologue_count_outport_fu_crossbar[0][0];
  assign fu_crossbar__prologue_count_inport[0][1] = ctrl_mem__prologue_count_outport_fu_crossbar[0][1];
  assign routing_crossbar__prologue_count_inport[1][0] = ctrl_mem__prologue_count_outport_routing_crossbar[1][0];
  assign routing_crossbar__prologue_count_inport[1][1] = ctrl_mem__prologue_count_outport_routing_crossbar[1][1];
  assign routing_crossbar__prologue_count_inport[1][2] = ctrl_mem__prologue_count_outport_routing_crossbar[1][2];
  assign routing_crossbar__prologue_count_inport[1][3] = ctrl_mem__prologue_count_outport_routing_crossbar[1][3];
  assign routing_crossbar__prologue_count_inport[1][4] = ctrl_mem__prologue_count_outport_routing_crossbar[1][4];
  assign routing_crossbar__prologue_count_inport[1][5] = ctrl_mem__prologue_count_outport_routing_crossbar[1][5];
  assign routing_crossbar__prologue_count_inport[1][6] = ctrl_mem__prologue_count_outport_routing_crossbar[1][6];
  assign routing_crossbar__prologue_count_inport[1][7] = ctrl_mem__prologue_count_outport_routing_crossbar[1][7];
  assign fu_crossbar__prologue_count_inport[1][0] = ctrl_mem__prologue_count_outport_fu_crossbar[1][0];
  assign fu_crossbar__prologue_count_inport[1][1] = ctrl_mem__prologue_count_outport_fu_crossbar[1][1];
  assign routing_crossbar__prologue_count_inport[2][0] = ctrl_mem__prologue_count_outport_routing_crossbar[2][0];
  assign routing_crossbar__prologue_count_inport[2][1] = ctrl_mem__prologue_count_outport_routing_crossbar[2][1];
  assign routing_crossbar__prologue_count_inport[2][2] = ctrl_mem__prologue_count_outport_routing_crossbar[2][2];
  assign routing_crossbar__prologue_count_inport[2][3] = ctrl_mem__prologue_count_outport_routing_crossbar[2][3];
  assign routing_crossbar__prologue_count_inport[2][4] = ctrl_mem__prologue_count_outport_routing_crossbar[2][4];
  assign routing_crossbar__prologue_count_inport[2][5] = ctrl_mem__prologue_count_outport_routing_crossbar[2][5];
  assign routing_crossbar__prologue_count_inport[2][6] = ctrl_mem__prologue_count_outport_routing_crossbar[2][6];
  assign routing_crossbar__prologue_count_inport[2][7] = ctrl_mem__prologue_count_outport_routing_crossbar[2][7];
  assign fu_crossbar__prologue_count_inport[2][0] = ctrl_mem__prologue_count_outport_fu_crossbar[2][0];
  assign fu_crossbar__prologue_count_inport[2][1] = ctrl_mem__prologue_count_outport_fu_crossbar[2][1];
  assign routing_crossbar__prologue_count_inport[3][0] = ctrl_mem__prologue_count_outport_routing_crossbar[3][0];
  assign routing_crossbar__prologue_count_inport[3][1] = ctrl_mem__prologue_count_outport_routing_crossbar[3][1];
  assign routing_crossbar__prologue_count_inport[3][2] = ctrl_mem__prologue_count_outport_routing_crossbar[3][2];
  assign routing_crossbar__prologue_count_inport[3][3] = ctrl_mem__prologue_count_outport_routing_crossbar[3][3];
  assign routing_crossbar__prologue_count_inport[3][4] = ctrl_mem__prologue_count_outport_routing_crossbar[3][4];
  assign routing_crossbar__prologue_count_inport[3][5] = ctrl_mem__prologue_count_outport_routing_crossbar[3][5];
  assign routing_crossbar__prologue_count_inport[3][6] = ctrl_mem__prologue_count_outport_routing_crossbar[3][6];
  assign routing_crossbar__prologue_count_inport[3][7] = ctrl_mem__prologue_count_outport_routing_crossbar[3][7];
  assign fu_crossbar__prologue_count_inport[3][0] = ctrl_mem__prologue_count_outport_fu_crossbar[3][0];
  assign fu_crossbar__prologue_count_inport[3][1] = ctrl_mem__prologue_count_outport_fu_crossbar[3][1];
  assign routing_crossbar__prologue_count_inport[4][0] = ctrl_mem__prologue_count_outport_routing_crossbar[4][0];
  assign routing_crossbar__prologue_count_inport[4][1] = ctrl_mem__prologue_count_outport_routing_crossbar[4][1];
  assign routing_crossbar__prologue_count_inport[4][2] = ctrl_mem__prologue_count_outport_routing_crossbar[4][2];
  assign routing_crossbar__prologue_count_inport[4][3] = ctrl_mem__prologue_count_outport_routing_crossbar[4][3];
  assign routing_crossbar__prologue_count_inport[4][4] = ctrl_mem__prologue_count_outport_routing_crossbar[4][4];
  assign routing_crossbar__prologue_count_inport[4][5] = ctrl_mem__prologue_count_outport_routing_crossbar[4][5];
  assign routing_crossbar__prologue_count_inport[4][6] = ctrl_mem__prologue_count_outport_routing_crossbar[4][6];
  assign routing_crossbar__prologue_count_inport[4][7] = ctrl_mem__prologue_count_outport_routing_crossbar[4][7];
  assign fu_crossbar__prologue_count_inport[4][0] = ctrl_mem__prologue_count_outport_fu_crossbar[4][0];
  assign fu_crossbar__prologue_count_inport[4][1] = ctrl_mem__prologue_count_outport_fu_crossbar[4][1];
  assign routing_crossbar__prologue_count_inport[5][0] = ctrl_mem__prologue_count_outport_routing_crossbar[5][0];
  assign routing_crossbar__prologue_count_inport[5][1] = ctrl_mem__prologue_count_outport_routing_crossbar[5][1];
  assign routing_crossbar__prologue_count_inport[5][2] = ctrl_mem__prologue_count_outport_routing_crossbar[5][2];
  assign routing_crossbar__prologue_count_inport[5][3] = ctrl_mem__prologue_count_outport_routing_crossbar[5][3];
  assign routing_crossbar__prologue_count_inport[5][4] = ctrl_mem__prologue_count_outport_routing_crossbar[5][4];
  assign routing_crossbar__prologue_count_inport[5][5] = ctrl_mem__prologue_count_outport_routing_crossbar[5][5];
  assign routing_crossbar__prologue_count_inport[5][6] = ctrl_mem__prologue_count_outport_routing_crossbar[5][6];
  assign routing_crossbar__prologue_count_inport[5][7] = ctrl_mem__prologue_count_outport_routing_crossbar[5][7];
  assign fu_crossbar__prologue_count_inport[5][0] = ctrl_mem__prologue_count_outport_fu_crossbar[5][0];
  assign fu_crossbar__prologue_count_inport[5][1] = ctrl_mem__prologue_count_outport_fu_crossbar[5][1];
  assign routing_crossbar__prologue_count_inport[6][0] = ctrl_mem__prologue_count_outport_routing_crossbar[6][0];
  assign routing_crossbar__prologue_count_inport[6][1] = ctrl_mem__prologue_count_outport_routing_crossbar[6][1];
  assign routing_crossbar__prologue_count_inport[6][2] = ctrl_mem__prologue_count_outport_routing_crossbar[6][2];
  assign routing_crossbar__prologue_count_inport[6][3] = ctrl_mem__prologue_count_outport_routing_crossbar[6][3];
  assign routing_crossbar__prologue_count_inport[6][4] = ctrl_mem__prologue_count_outport_routing_crossbar[6][4];
  assign routing_crossbar__prologue_count_inport[6][5] = ctrl_mem__prologue_count_outport_routing_crossbar[6][5];
  assign routing_crossbar__prologue_count_inport[6][6] = ctrl_mem__prologue_count_outport_routing_crossbar[6][6];
  assign routing_crossbar__prologue_count_inport[6][7] = ctrl_mem__prologue_count_outport_routing_crossbar[6][7];
  assign fu_crossbar__prologue_count_inport[6][0] = ctrl_mem__prologue_count_outport_fu_crossbar[6][0];
  assign fu_crossbar__prologue_count_inport[6][1] = ctrl_mem__prologue_count_outport_fu_crossbar[6][1];
  assign routing_crossbar__prologue_count_inport[7][0] = ctrl_mem__prologue_count_outport_routing_crossbar[7][0];
  assign routing_crossbar__prologue_count_inport[7][1] = ctrl_mem__prologue_count_outport_routing_crossbar[7][1];
  assign routing_crossbar__prologue_count_inport[7][2] = ctrl_mem__prologue_count_outport_routing_crossbar[7][2];
  assign routing_crossbar__prologue_count_inport[7][3] = ctrl_mem__prologue_count_outport_routing_crossbar[7][3];
  assign routing_crossbar__prologue_count_inport[7][4] = ctrl_mem__prologue_count_outport_routing_crossbar[7][4];
  assign routing_crossbar__prologue_count_inport[7][5] = ctrl_mem__prologue_count_outport_routing_crossbar[7][5];
  assign routing_crossbar__prologue_count_inport[7][6] = ctrl_mem__prologue_count_outport_routing_crossbar[7][6];
  assign routing_crossbar__prologue_count_inport[7][7] = ctrl_mem__prologue_count_outport_routing_crossbar[7][7];
  assign fu_crossbar__prologue_count_inport[7][0] = ctrl_mem__prologue_count_outport_fu_crossbar[7][0];
  assign fu_crossbar__prologue_count_inport[7][1] = ctrl_mem__prologue_count_outport_fu_crossbar[7][1];
  assign element__to_mem_raddr__rdy[0] = 1'd0;
  assign element__from_mem_rdata__val[0] = 1'd0;
  assign element__from_mem_rdata__msg[0] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[0] = 1'd0;
  assign element__to_mem_wdata__rdy[0] = 1'd0;
  assign element__to_mem_raddr__rdy[1] = 1'd0;
  assign element__from_mem_rdata__val[1] = 1'd0;
  assign element__from_mem_rdata__msg[1] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[1] = 1'd0;
  assign element__to_mem_wdata__rdy[1] = 1'd0;
  assign element__to_mem_raddr__rdy[2] = 1'd0;
  assign element__from_mem_rdata__val[2] = 1'd0;
  assign element__from_mem_rdata__msg[2] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[2] = 1'd0;
  assign element__to_mem_wdata__rdy[2] = 1'd0;
  assign to_mem_raddr__msg = element__to_mem_raddr__msg[3];
  assign element__to_mem_raddr__rdy[3] = to_mem_raddr__rdy;
  assign to_mem_raddr__val = element__to_mem_raddr__val[3];
  assign element__from_mem_rdata__msg[3] = from_mem_rdata__msg;
  assign from_mem_rdata__rdy = element__from_mem_rdata__rdy[3];
  assign element__from_mem_rdata__val[3] = from_mem_rdata__val;
  assign to_mem_waddr__msg = element__to_mem_waddr__msg[3];
  assign element__to_mem_waddr__rdy[3] = to_mem_waddr__rdy;
  assign to_mem_waddr__val = element__to_mem_waddr__val[3];
  assign to_mem_wdata__msg = element__to_mem_wdata__msg[3];
  assign element__to_mem_wdata__rdy[3] = to_mem_wdata__rdy;
  assign to_mem_wdata__val = element__to_mem_wdata__val[3];
  assign element__to_mem_raddr__rdy[4] = 1'd0;
  assign element__from_mem_rdata__val[4] = 1'd0;
  assign element__from_mem_rdata__msg[4] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[4] = 1'd0;
  assign element__to_mem_wdata__rdy[4] = 1'd0;
  assign element__to_mem_raddr__rdy[5] = 1'd0;
  assign element__from_mem_rdata__val[5] = 1'd0;
  assign element__from_mem_rdata__msg[5] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[5] = 1'd0;
  assign element__to_mem_wdata__rdy[5] = 1'd0;
  assign element__to_mem_raddr__rdy[6] = 1'd0;
  assign element__from_mem_rdata__val[6] = 1'd0;
  assign element__from_mem_rdata__msg[6] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[6] = 1'd0;
  assign element__to_mem_wdata__rdy[6] = 1'd0;
  assign element__to_mem_raddr__rdy[7] = 1'd0;
  assign element__from_mem_rdata__val[7] = 1'd0;
  assign element__from_mem_rdata__msg[7] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[7] = 1'd0;
  assign element__to_mem_wdata__rdy[7] = 1'd0;
  assign element__to_mem_raddr__rdy[8] = 1'd0;
  assign element__from_mem_rdata__val[8] = 1'd0;
  assign element__from_mem_rdata__msg[8] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[8] = 1'd0;
  assign element__to_mem_wdata__rdy[8] = 1'd0;
  assign element__to_mem_raddr__rdy[9] = 1'd0;
  assign element__from_mem_rdata__val[9] = 1'd0;
  assign element__from_mem_rdata__msg[9] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[9] = 1'd0;
  assign element__to_mem_wdata__rdy[9] = 1'd0;
  assign element__to_mem_raddr__rdy[10] = 1'd0;
  assign element__from_mem_rdata__val[10] = 1'd0;
  assign element__from_mem_rdata__msg[10] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[10] = 1'd0;
  assign element__to_mem_wdata__rdy[10] = 1'd0;
  assign element__to_mem_raddr__rdy[11] = 1'd0;
  assign element__from_mem_rdata__val[11] = 1'd0;
  assign element__from_mem_rdata__msg[11] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[11] = 1'd0;
  assign element__to_mem_wdata__rdy[11] = 1'd0;
  assign element__to_mem_raddr__rdy[12] = 1'd0;
  assign element__from_mem_rdata__val[12] = 1'd0;
  assign element__from_mem_rdata__msg[12] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[12] = 1'd0;
  assign element__to_mem_wdata__rdy[12] = 1'd0;
  assign element__to_mem_raddr__rdy[13] = 1'd0;
  assign element__from_mem_rdata__val[13] = 1'd0;
  assign element__from_mem_rdata__msg[13] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[13] = 1'd0;
  assign element__to_mem_wdata__rdy[13] = 1'd0;
  assign element__to_mem_raddr__rdy[14] = 1'd0;
  assign element__from_mem_rdata__val[14] = 1'd0;
  assign element__from_mem_rdata__msg[14] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[14] = 1'd0;
  assign element__to_mem_wdata__rdy[14] = 1'd0;
  assign element__to_mem_raddr__rdy[15] = 1'd0;
  assign element__from_mem_rdata__val[15] = 1'd0;
  assign element__from_mem_rdata__msg[15] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign element__to_mem_waddr__rdy[15] = 1'd0;
  assign element__to_mem_wdata__rdy[15] = 1'd0;
  assign tile_in_channel__recv__msg[0] = recv_data__msg[0];
  assign recv_data__rdy[0] = tile_in_channel__recv__rdy[0];
  assign tile_in_channel__recv__val[0] = recv_data__val[0];
  assign routing_crossbar__recv_data__msg[0] = tile_in_channel__send__msg[0];
  assign tile_in_channel__send__rdy[0] = routing_crossbar__recv_data__rdy[0];
  assign routing_crossbar__recv_data__val[0] = tile_in_channel__send__val[0];
  assign tile_in_channel__recv__msg[1] = recv_data__msg[1];
  assign recv_data__rdy[1] = tile_in_channel__recv__rdy[1];
  assign tile_in_channel__recv__val[1] = recv_data__val[1];
  assign routing_crossbar__recv_data__msg[1] = tile_in_channel__send__msg[1];
  assign tile_in_channel__send__rdy[1] = routing_crossbar__recv_data__rdy[1];
  assign routing_crossbar__recv_data__val[1] = tile_in_channel__send__val[1];
  assign tile_in_channel__recv__msg[2] = recv_data__msg[2];
  assign recv_data__rdy[2] = tile_in_channel__recv__rdy[2];
  assign tile_in_channel__recv__val[2] = recv_data__val[2];
  assign routing_crossbar__recv_data__msg[2] = tile_in_channel__send__msg[2];
  assign tile_in_channel__send__rdy[2] = routing_crossbar__recv_data__rdy[2];
  assign routing_crossbar__recv_data__val[2] = tile_in_channel__send__val[2];
  assign tile_in_channel__recv__msg[3] = recv_data__msg[3];
  assign recv_data__rdy[3] = tile_in_channel__recv__rdy[3];
  assign tile_in_channel__recv__val[3] = recv_data__val[3];
  assign routing_crossbar__recv_data__msg[3] = tile_in_channel__send__msg[3];
  assign tile_in_channel__send__rdy[3] = routing_crossbar__recv_data__rdy[3];
  assign routing_crossbar__recv_data__val[3] = tile_in_channel__send__val[3];
  assign tile_in_channel__recv__msg[4] = recv_data__msg[4];
  assign recv_data__rdy[4] = tile_in_channel__recv__rdy[4];
  assign tile_in_channel__recv__val[4] = recv_data__val[4];
  assign routing_crossbar__recv_data__msg[4] = tile_in_channel__send__msg[4];
  assign tile_in_channel__send__rdy[4] = routing_crossbar__recv_data__rdy[4];
  assign routing_crossbar__recv_data__val[4] = tile_in_channel__send__val[4];
  assign tile_in_channel__recv__msg[5] = recv_data__msg[5];
  assign recv_data__rdy[5] = tile_in_channel__recv__rdy[5];
  assign tile_in_channel__recv__val[5] = recv_data__val[5];
  assign routing_crossbar__recv_data__msg[5] = tile_in_channel__send__msg[5];
  assign tile_in_channel__send__rdy[5] = routing_crossbar__recv_data__rdy[5];
  assign routing_crossbar__recv_data__val[5] = tile_in_channel__send__val[5];
  assign tile_in_channel__recv__msg[6] = recv_data__msg[6];
  assign recv_data__rdy[6] = tile_in_channel__recv__rdy[6];
  assign tile_in_channel__recv__val[6] = recv_data__val[6];
  assign routing_crossbar__recv_data__msg[6] = tile_in_channel__send__msg[6];
  assign tile_in_channel__send__rdy[6] = routing_crossbar__recv_data__rdy[6];
  assign routing_crossbar__recv_data__val[6] = tile_in_channel__send__val[6];
  assign tile_in_channel__recv__msg[7] = recv_data__msg[7];
  assign recv_data__rdy[7] = tile_in_channel__recv__rdy[7];
  assign tile_in_channel__recv__val[7] = recv_data__val[7];
  assign routing_crossbar__recv_data__msg[7] = tile_in_channel__send__msg[7];
  assign tile_in_channel__send__rdy[7] = routing_crossbar__recv_data__rdy[7];
  assign routing_crossbar__recv_data__val[7] = tile_in_channel__send__val[7];
  assign routing_crossbar__crossbar_outport[0] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[0];
  assign fu_crossbar__crossbar_outport[0] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[0];
  assign routing_crossbar__crossbar_outport[1] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[1];
  assign fu_crossbar__crossbar_outport[1] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[1];
  assign routing_crossbar__crossbar_outport[2] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[2];
  assign fu_crossbar__crossbar_outport[2] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[2];
  assign routing_crossbar__crossbar_outport[3] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[3];
  assign fu_crossbar__crossbar_outport[3] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[3];
  assign routing_crossbar__crossbar_outport[4] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[4];
  assign fu_crossbar__crossbar_outport[4] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[4];
  assign routing_crossbar__crossbar_outport[5] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[5];
  assign fu_crossbar__crossbar_outport[5] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[5];
  assign routing_crossbar__crossbar_outport[6] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[6];
  assign fu_crossbar__crossbar_outport[6] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[6];
  assign routing_crossbar__crossbar_outport[7] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[7];
  assign fu_crossbar__crossbar_outport[7] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[7];
  assign routing_crossbar__crossbar_outport[8] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[8];
  assign fu_crossbar__crossbar_outport[8] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[8];
  assign routing_crossbar__crossbar_outport[9] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[9];
  assign fu_crossbar__crossbar_outport[9] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[9];
  assign routing_crossbar__crossbar_outport[10] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[10];
  assign fu_crossbar__crossbar_outport[10] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[10];
  assign routing_crossbar__crossbar_outport[11] = ctrl_mem__send_ctrl__msg.routing_xbar_outport[11];
  assign fu_crossbar__crossbar_outport[11] = ctrl_mem__send_ctrl__msg.fu_xbar_outport[11];
  assign fu_crossbar__recv_data__msg[0] = element__send_out__msg[0];
  assign element__send_out__rdy[0] = fu_crossbar__recv_data__rdy[0];
  assign fu_crossbar__recv_data__val[0] = element__send_out__val[0];
  assign fu_crossbar__recv_data__msg[1] = element__send_out__msg[1];
  assign element__send_out__rdy[1] = fu_crossbar__recv_data__rdy[1];
  assign fu_crossbar__recv_data__val[1] = element__send_out__val[1];
  assign tile_out_or_link__recv_fu__msg[0] = fu_crossbar__send_data__msg[0];
  assign fu_crossbar__send_data__rdy[0] = tile_out_or_link__recv_fu__rdy[0];
  assign tile_out_or_link__recv_fu__val[0] = fu_crossbar__send_data__val[0];
  assign tile_out_or_link__recv_xbar__msg[0] = routing_crossbar__send_data__msg[0];
  assign routing_crossbar__send_data__rdy[0] = tile_out_or_link__recv_xbar__rdy[0];
  assign tile_out_or_link__recv_xbar__val[0] = routing_crossbar__send_data__val[0];
  assign send_data__msg[0] = tile_out_or_link__send__msg[0];
  assign tile_out_or_link__send__rdy[0] = send_data__rdy[0];
  assign send_data__val[0] = tile_out_or_link__send__val[0];
  assign tile_out_or_link__recv_fu__msg[1] = fu_crossbar__send_data__msg[1];
  assign fu_crossbar__send_data__rdy[1] = tile_out_or_link__recv_fu__rdy[1];
  assign tile_out_or_link__recv_fu__val[1] = fu_crossbar__send_data__val[1];
  assign tile_out_or_link__recv_xbar__msg[1] = routing_crossbar__send_data__msg[1];
  assign routing_crossbar__send_data__rdy[1] = tile_out_or_link__recv_xbar__rdy[1];
  assign tile_out_or_link__recv_xbar__val[1] = routing_crossbar__send_data__val[1];
  assign send_data__msg[1] = tile_out_or_link__send__msg[1];
  assign tile_out_or_link__send__rdy[1] = send_data__rdy[1];
  assign send_data__val[1] = tile_out_or_link__send__val[1];
  assign tile_out_or_link__recv_fu__msg[2] = fu_crossbar__send_data__msg[2];
  assign fu_crossbar__send_data__rdy[2] = tile_out_or_link__recv_fu__rdy[2];
  assign tile_out_or_link__recv_fu__val[2] = fu_crossbar__send_data__val[2];
  assign tile_out_or_link__recv_xbar__msg[2] = routing_crossbar__send_data__msg[2];
  assign routing_crossbar__send_data__rdy[2] = tile_out_or_link__recv_xbar__rdy[2];
  assign tile_out_or_link__recv_xbar__val[2] = routing_crossbar__send_data__val[2];
  assign send_data__msg[2] = tile_out_or_link__send__msg[2];
  assign tile_out_or_link__send__rdy[2] = send_data__rdy[2];
  assign send_data__val[2] = tile_out_or_link__send__val[2];
  assign tile_out_or_link__recv_fu__msg[3] = fu_crossbar__send_data__msg[3];
  assign fu_crossbar__send_data__rdy[3] = tile_out_or_link__recv_fu__rdy[3];
  assign tile_out_or_link__recv_fu__val[3] = fu_crossbar__send_data__val[3];
  assign tile_out_or_link__recv_xbar__msg[3] = routing_crossbar__send_data__msg[3];
  assign routing_crossbar__send_data__rdy[3] = tile_out_or_link__recv_xbar__rdy[3];
  assign tile_out_or_link__recv_xbar__val[3] = routing_crossbar__send_data__val[3];
  assign send_data__msg[3] = tile_out_or_link__send__msg[3];
  assign tile_out_or_link__send__rdy[3] = send_data__rdy[3];
  assign send_data__val[3] = tile_out_or_link__send__val[3];
  assign tile_out_or_link__recv_fu__msg[4] = fu_crossbar__send_data__msg[4];
  assign fu_crossbar__send_data__rdy[4] = tile_out_or_link__recv_fu__rdy[4];
  assign tile_out_or_link__recv_fu__val[4] = fu_crossbar__send_data__val[4];
  assign tile_out_or_link__recv_xbar__msg[4] = routing_crossbar__send_data__msg[4];
  assign routing_crossbar__send_data__rdy[4] = tile_out_or_link__recv_xbar__rdy[4];
  assign tile_out_or_link__recv_xbar__val[4] = routing_crossbar__send_data__val[4];
  assign send_data__msg[4] = tile_out_or_link__send__msg[4];
  assign tile_out_or_link__send__rdy[4] = send_data__rdy[4];
  assign send_data__val[4] = tile_out_or_link__send__val[4];
  assign tile_out_or_link__recv_fu__msg[5] = fu_crossbar__send_data__msg[5];
  assign fu_crossbar__send_data__rdy[5] = tile_out_or_link__recv_fu__rdy[5];
  assign tile_out_or_link__recv_fu__val[5] = fu_crossbar__send_data__val[5];
  assign tile_out_or_link__recv_xbar__msg[5] = routing_crossbar__send_data__msg[5];
  assign routing_crossbar__send_data__rdy[5] = tile_out_or_link__recv_xbar__rdy[5];
  assign tile_out_or_link__recv_xbar__val[5] = routing_crossbar__send_data__val[5];
  assign send_data__msg[5] = tile_out_or_link__send__msg[5];
  assign tile_out_or_link__send__rdy[5] = send_data__rdy[5];
  assign send_data__val[5] = tile_out_or_link__send__val[5];
  assign tile_out_or_link__recv_fu__msg[6] = fu_crossbar__send_data__msg[6];
  assign fu_crossbar__send_data__rdy[6] = tile_out_or_link__recv_fu__rdy[6];
  assign tile_out_or_link__recv_fu__val[6] = fu_crossbar__send_data__val[6];
  assign tile_out_or_link__recv_xbar__msg[6] = routing_crossbar__send_data__msg[6];
  assign routing_crossbar__send_data__rdy[6] = tile_out_or_link__recv_xbar__rdy[6];
  assign tile_out_or_link__recv_xbar__val[6] = routing_crossbar__send_data__val[6];
  assign send_data__msg[6] = tile_out_or_link__send__msg[6];
  assign tile_out_or_link__send__rdy[6] = send_data__rdy[6];
  assign send_data__val[6] = tile_out_or_link__send__val[6];
  assign tile_out_or_link__recv_fu__msg[7] = fu_crossbar__send_data__msg[7];
  assign fu_crossbar__send_data__rdy[7] = tile_out_or_link__recv_fu__rdy[7];
  assign tile_out_or_link__recv_fu__val[7] = fu_crossbar__send_data__val[7];
  assign tile_out_or_link__recv_xbar__msg[7] = routing_crossbar__send_data__msg[7];
  assign routing_crossbar__send_data__rdy[7] = tile_out_or_link__recv_xbar__rdy[7];
  assign tile_out_or_link__recv_xbar__val[7] = routing_crossbar__send_data__val[7];
  assign send_data__msg[7] = tile_out_or_link__send__msg[7];
  assign tile_out_or_link__send__rdy[7] = send_data__rdy[7];
  assign send_data__val[7] = tile_out_or_link__send__val[7];
  assign register_cluster__recv_data_from_routing_crossbar__msg[0] = routing_crossbar__send_data__msg[8];
  assign routing_crossbar__send_data__rdy[8] = register_cluster__recv_data_from_routing_crossbar__rdy[0];
  assign register_cluster__recv_data_from_routing_crossbar__val[0] = routing_crossbar__send_data__val[8];
  assign register_cluster__recv_data_from_fu_crossbar__msg[0] = fu_crossbar__send_data__msg[8];
  assign fu_crossbar__send_data__rdy[8] = register_cluster__recv_data_from_fu_crossbar__rdy[0];
  assign register_cluster__recv_data_from_fu_crossbar__val[0] = fu_crossbar__send_data__val[8];
  assign register_cluster__recv_data_from_const__msg[0] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign register_cluster__recv_data_from_const__val[0] = 1'd0;
  assign element__recv_in__msg[0] = register_cluster__send_data_to_fu__msg[0];
  assign register_cluster__send_data_to_fu__rdy[0] = element__recv_in__rdy[0];
  assign element__recv_in__val[0] = register_cluster__send_data_to_fu__val[0];
  assign register_cluster__inport_opt = ctrl_mem__send_ctrl__msg;
  assign register_cluster__recv_data_from_routing_crossbar__msg[1] = routing_crossbar__send_data__msg[9];
  assign routing_crossbar__send_data__rdy[9] = register_cluster__recv_data_from_routing_crossbar__rdy[1];
  assign register_cluster__recv_data_from_routing_crossbar__val[1] = routing_crossbar__send_data__val[9];
  assign register_cluster__recv_data_from_fu_crossbar__msg[1] = fu_crossbar__send_data__msg[9];
  assign fu_crossbar__send_data__rdy[9] = register_cluster__recv_data_from_fu_crossbar__rdy[1];
  assign register_cluster__recv_data_from_fu_crossbar__val[1] = fu_crossbar__send_data__val[9];
  assign register_cluster__recv_data_from_const__msg[1] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign register_cluster__recv_data_from_const__val[1] = 1'd0;
  assign element__recv_in__msg[1] = register_cluster__send_data_to_fu__msg[1];
  assign register_cluster__send_data_to_fu__rdy[1] = element__recv_in__rdy[1];
  assign element__recv_in__val[1] = register_cluster__send_data_to_fu__val[1];
  assign register_cluster__recv_data_from_routing_crossbar__msg[2] = routing_crossbar__send_data__msg[10];
  assign routing_crossbar__send_data__rdy[10] = register_cluster__recv_data_from_routing_crossbar__rdy[2];
  assign register_cluster__recv_data_from_routing_crossbar__val[2] = routing_crossbar__send_data__val[10];
  assign register_cluster__recv_data_from_fu_crossbar__msg[2] = fu_crossbar__send_data__msg[10];
  assign fu_crossbar__send_data__rdy[10] = register_cluster__recv_data_from_fu_crossbar__rdy[2];
  assign register_cluster__recv_data_from_fu_crossbar__val[2] = fu_crossbar__send_data__val[10];
  assign register_cluster__recv_data_from_const__msg[2] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign register_cluster__recv_data_from_const__val[2] = 1'd0;
  assign element__recv_in__msg[2] = register_cluster__send_data_to_fu__msg[2];
  assign register_cluster__send_data_to_fu__rdy[2] = element__recv_in__rdy[2];
  assign element__recv_in__val[2] = register_cluster__send_data_to_fu__val[2];
  assign register_cluster__recv_data_from_routing_crossbar__msg[3] = routing_crossbar__send_data__msg[11];
  assign routing_crossbar__send_data__rdy[11] = register_cluster__recv_data_from_routing_crossbar__rdy[3];
  assign register_cluster__recv_data_from_routing_crossbar__val[3] = routing_crossbar__send_data__val[11];
  assign register_cluster__recv_data_from_fu_crossbar__msg[3] = fu_crossbar__send_data__msg[11];
  assign fu_crossbar__send_data__rdy[11] = register_cluster__recv_data_from_fu_crossbar__rdy[3];
  assign register_cluster__recv_data_from_fu_crossbar__val[3] = fu_crossbar__send_data__val[11];
  assign register_cluster__recv_data_from_const__msg[3] = { 32'd0, 1'd0, 1'd0, 1'd0 };
  assign register_cluster__recv_data_from_const__val[3] = 1'd0;
  assign element__recv_in__msg[3] = register_cluster__send_data_to_fu__msg[3];
  assign register_cluster__send_data_to_fu__rdy[3] = element__recv_in__rdy[3];
  assign element__recv_in__val[3] = register_cluster__send_data_to_fu__val[3];
  assign element__clear[0] = 1'd0;
  assign element__clear[1] = 1'd0;
  assign element__clear[2] = 1'd0;
  assign element__clear[3] = 1'd0;
  assign element__clear[4] = 1'd0;
  assign element__clear[5] = 1'd0;
  assign element__clear[6] = 1'd0;
  assign element__clear[7] = 1'd0;
  assign element__clear[8] = 1'd0;
  assign element__clear[9] = 1'd0;
  assign element__clear[10] = 1'd0;
  assign element__clear[11] = 1'd0;
  assign element__clear[12] = 1'd0;
  assign element__clear[13] = 1'd0;
  assign element__clear[14] = 1'd0;
  assign element__clear[15] = 1'd0;
  assign fu_crossbar__clear = 1'd0;
  assign routing_crossbar__clear = 1'd0;

endmodule