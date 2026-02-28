module FlexibleFuRTL__59f466375d9ce40e
import cgra_pkg::*;
(
  input  logic [0:0] clear [0:15],
  input  logic [0:0] clk ,
  input  logic [2:0] ctrl_addr_inport ,
  input  logic [2:0] prologue_count_inport ,
  input  logic [0:0] reset ,
  input  logic [8:0] tile_id ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 from_mem_rdata__msg [0:15] ,
  output logic [0:0] from_mem_rdata__rdy [0:15] ,
  input logic [0:0] from_mem_rdata__val [0:15] ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_const__msg  ,
  output logic [0:0] recv_const__rdy  ,
  input logic [0:0] recv_const__val  ,
  input MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f recv_from_ctrl_mem__msg  ,
  output logic [0:0] recv_from_ctrl_mem__rdy  ,
  input logic [0:0] recv_from_ctrl_mem__val  ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_in__msg [0:3] ,
  output logic [0:0] recv_in__rdy [0:3] ,
  input logic [0:0] recv_in__val [0:3] ,
  input CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f recv_opt__msg  ,
  output logic [0:0] recv_opt__rdy  ,
  input logic [0:0] recv_opt__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_out__msg [0:1] ,
  input logic [0:0] send_out__rdy [0:1] ,
  output logic [0:0] send_out__val [0:1] ,
  output MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f send_to_ctrl_mem__msg  ,
  input logic [0:0] send_to_ctrl_mem__rdy  ,
  output logic [0:0] send_to_ctrl_mem__val  ,
  output logic [8:0] to_mem_raddr__msg [0:15] ,
  input logic [0:0] to_mem_raddr__rdy [0:15] ,
  output logic [0:0] to_mem_raddr__val [0:15] ,
  output logic [8:0] to_mem_waddr__msg [0:15] ,
  input logic [0:0] to_mem_waddr__rdy [0:15] ,
  output logic [0:0] to_mem_waddr__val [0:15] ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 to_mem_wdata__msg [0:15] ,
  input logic [0:0] to_mem_wdata__rdy [0:15] ,
  output logic [0:0] to_mem_wdata__val [0:15] 
);
  localparam logic [1:0] __const__num_outports_at_comb_logic  = 2'd2;
  localparam logic [6:0] __const__OPT_NAH  = 7'd1;
  localparam logic [2:0] __const__num_inports_at_comb_logic  = 3'd4;
  logic [15:0] fu_recv_const_rdy_vector;
  logic [15:0] fu_recv_in_rdy_vector [0:3];
  logic [15:0] fu_recv_opt_rdy_vector;
  logic [15:0] recv_from_controller_rdy_vector;
  //-------------------------------------------------------------
  // Component fu[0:15]
  //-------------------------------------------------------------

  logic [0:0] fu__clear [0:15];
  logic [0:0] fu__clk [0:15];
  logic [2:0] fu__ctrl_addr_inport [0:15];
  logic [0:0] fu__reset [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu__from_mem_rdata__msg [0:15];
  logic [0:0] fu__from_mem_rdata__rdy [0:15];
  logic [0:0] fu__from_mem_rdata__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu__recv_const__msg [0:15];
  logic [0:0] fu__recv_const__rdy [0:15];
  logic [0:0] fu__recv_const__val [0:15];
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f fu__recv_from_ctrl_mem__msg [0:15];
  logic [0:0] fu__recv_from_ctrl_mem__rdy [0:15];
  logic [0:0] fu__recv_from_ctrl_mem__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu__recv_in__msg [0:15][0:3];
  logic [0:0] fu__recv_in__rdy [0:15][0:3];
  logic [0:0] fu__recv_in__val [0:15][0:3];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f fu__recv_opt__msg [0:15];
  logic [0:0] fu__recv_opt__rdy [0:15];
  logic [0:0] fu__recv_opt__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu__send_out__msg [0:15][0:1];
  logic [0:0] fu__send_out__rdy [0:15][0:1];
  logic [0:0] fu__send_out__val [0:15][0:1];
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f fu__send_to_ctrl_mem__msg [0:15];
  logic [0:0] fu__send_to_ctrl_mem__rdy [0:15];
  logic [0:0] fu__send_to_ctrl_mem__val [0:15];
  logic [8:0] fu__to_mem_raddr__msg [0:15];
  logic [0:0] fu__to_mem_raddr__rdy [0:15];
  logic [0:0] fu__to_mem_raddr__val [0:15];
  logic [8:0] fu__to_mem_waddr__msg [0:15];
  logic [0:0] fu__to_mem_waddr__rdy [0:15];
  logic [0:0] fu__to_mem_waddr__val [0:15];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 fu__to_mem_wdata__msg [0:15];
  logic [0:0] fu__to_mem_wdata__rdy [0:15];
  logic [0:0] fu__to_mem_wdata__val [0:15];

  FpMulRTL__7e2720d75d12a6d7 fu__0
  (
    .clear( fu__clear[0] ),
    .clk( fu__clk[0] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[0] ),
    .reset( fu__reset[0] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[0] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[0] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[0] ),
    .recv_const__msg( fu__recv_const__msg[0] ),
    .recv_const__rdy( fu__recv_const__rdy[0] ),
    .recv_const__val( fu__recv_const__val[0] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[0] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[0] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[0] ),
    .recv_in__msg( fu__recv_in__msg[0] ),
    .recv_in__rdy( fu__recv_in__rdy[0] ),
    .recv_in__val( fu__recv_in__val[0] ),
    .recv_opt__msg( fu__recv_opt__msg[0] ),
    .recv_opt__rdy( fu__recv_opt__rdy[0] ),
    .recv_opt__val( fu__recv_opt__val[0] ),
    .send_out__msg( fu__send_out__msg[0] ),
    .send_out__rdy( fu__send_out__rdy[0] ),
    .send_out__val( fu__send_out__val[0] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[0] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[0] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[0] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[0] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[0] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[0] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[0] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[0] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[0] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[0] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[0] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[0] )
  );

  SelRTL__fa096d180efec193 fu__1
  (
    .clear( fu__clear[1] ),
    .clk( fu__clk[1] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[1] ),
    .reset( fu__reset[1] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[1] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[1] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[1] ),
    .recv_const__msg( fu__recv_const__msg[1] ),
    .recv_const__rdy( fu__recv_const__rdy[1] ),
    .recv_const__val( fu__recv_const__val[1] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[1] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[1] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[1] ),
    .recv_in__msg( fu__recv_in__msg[1] ),
    .recv_in__rdy( fu__recv_in__rdy[1] ),
    .recv_in__val( fu__recv_in__val[1] ),
    .recv_opt__msg( fu__recv_opt__msg[1] ),
    .recv_opt__rdy( fu__recv_opt__rdy[1] ),
    .recv_opt__val( fu__recv_opt__val[1] ),
    .send_out__msg( fu__send_out__msg[1] ),
    .send_out__rdy( fu__send_out__rdy[1] ),
    .send_out__val( fu__send_out__val[1] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[1] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[1] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[1] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[1] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[1] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[1] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[1] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[1] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[1] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[1] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[1] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[1] )
  );

  PhiRTL__fa096d180efec193 fu__2
  (
    .clear( fu__clear[2] ),
    .clk( fu__clk[2] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[2] ),
    .reset( fu__reset[2] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[2] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[2] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[2] ),
    .recv_const__msg( fu__recv_const__msg[2] ),
    .recv_const__rdy( fu__recv_const__rdy[2] ),
    .recv_const__val( fu__recv_const__val[2] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[2] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[2] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[2] ),
    .recv_in__msg( fu__recv_in__msg[2] ),
    .recv_in__rdy( fu__recv_in__rdy[2] ),
    .recv_in__val( fu__recv_in__val[2] ),
    .recv_opt__msg( fu__recv_opt__msg[2] ),
    .recv_opt__rdy( fu__recv_opt__rdy[2] ),
    .recv_opt__val( fu__recv_opt__val[2] ),
    .send_out__msg( fu__send_out__msg[2] ),
    .send_out__rdy( fu__send_out__rdy[2] ),
    .send_out__val( fu__send_out__val[2] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[2] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[2] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[2] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[2] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[2] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[2] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[2] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[2] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[2] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[2] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[2] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[2] )
  );

  MemUnitRTL__fa096d180efec193 fu__3
  (
    .clear( fu__clear[3] ),
    .clk( fu__clk[3] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[3] ),
    .reset( fu__reset[3] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[3] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[3] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[3] ),
    .recv_const__msg( fu__recv_const__msg[3] ),
    .recv_const__rdy( fu__recv_const__rdy[3] ),
    .recv_const__val( fu__recv_const__val[3] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[3] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[3] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[3] ),
    .recv_in__msg( fu__recv_in__msg[3] ),
    .recv_in__rdy( fu__recv_in__rdy[3] ),
    .recv_in__val( fu__recv_in__val[3] ),
    .recv_opt__msg( fu__recv_opt__msg[3] ),
    .recv_opt__rdy( fu__recv_opt__rdy[3] ),
    .recv_opt__val( fu__recv_opt__val[3] ),
    .send_out__msg( fu__send_out__msg[3] ),
    .send_out__rdy( fu__send_out__rdy[3] ),
    .send_out__val( fu__send_out__val[3] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[3] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[3] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[3] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[3] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[3] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[3] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[3] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[3] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[3] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[3] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[3] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[3] )
  );

  FpAddRTL__7e2720d75d12a6d7 fu__4
  (
    .clear( fu__clear[4] ),
    .clk( fu__clk[4] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[4] ),
    .reset( fu__reset[4] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[4] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[4] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[4] ),
    .recv_const__msg( fu__recv_const__msg[4] ),
    .recv_const__rdy( fu__recv_const__rdy[4] ),
    .recv_const__val( fu__recv_const__val[4] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[4] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[4] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[4] ),
    .recv_in__msg( fu__recv_in__msg[4] ),
    .recv_in__rdy( fu__recv_in__rdy[4] ),
    .recv_in__val( fu__recv_in__val[4] ),
    .recv_opt__msg( fu__recv_opt__msg[4] ),
    .recv_opt__rdy( fu__recv_opt__rdy[4] ),
    .recv_opt__val( fu__recv_opt__val[4] ),
    .send_out__msg( fu__send_out__msg[4] ),
    .send_out__rdy( fu__send_out__rdy[4] ),
    .send_out__val( fu__send_out__val[4] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[4] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[4] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[4] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[4] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[4] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[4] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[4] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[4] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[4] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[4] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[4] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[4] )
  );

  LoopControlRTL__fa096d180efec193 fu__5
  (
    .clear( fu__clear[5] ),
    .clk( fu__clk[5] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[5] ),
    .reset( fu__reset[5] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[5] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[5] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[5] ),
    .recv_const__msg( fu__recv_const__msg[5] ),
    .recv_const__rdy( fu__recv_const__rdy[5] ),
    .recv_const__val( fu__recv_const__val[5] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[5] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[5] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[5] ),
    .recv_in__msg( fu__recv_in__msg[5] ),
    .recv_in__rdy( fu__recv_in__rdy[5] ),
    .recv_in__val( fu__recv_in__val[5] ),
    .recv_opt__msg( fu__recv_opt__msg[5] ),
    .recv_opt__rdy( fu__recv_opt__rdy[5] ),
    .recv_opt__val( fu__recv_opt__val[5] ),
    .send_out__msg( fu__send_out__msg[5] ),
    .send_out__rdy( fu__send_out__rdy[5] ),
    .send_out__val( fu__send_out__val[5] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[5] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[5] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[5] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[5] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[5] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[5] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[5] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[5] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[5] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[5] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[5] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[5] )
  );

  LogicRTL__fa096d180efec193 fu__6
  (
    .clear( fu__clear[6] ),
    .clk( fu__clk[6] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[6] ),
    .reset( fu__reset[6] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[6] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[6] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[6] ),
    .recv_const__msg( fu__recv_const__msg[6] ),
    .recv_const__rdy( fu__recv_const__rdy[6] ),
    .recv_const__val( fu__recv_const__val[6] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[6] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[6] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[6] ),
    .recv_in__msg( fu__recv_in__msg[6] ),
    .recv_in__rdy( fu__recv_in__rdy[6] ),
    .recv_in__val( fu__recv_in__val[6] ),
    .recv_opt__msg( fu__recv_opt__msg[6] ),
    .recv_opt__rdy( fu__recv_opt__rdy[6] ),
    .recv_opt__val( fu__recv_opt__val[6] ),
    .send_out__msg( fu__send_out__msg[6] ),
    .send_out__rdy( fu__send_out__rdy[6] ),
    .send_out__val( fu__send_out__val[6] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[6] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[6] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[6] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[6] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[6] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[6] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[6] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[6] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[6] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[6] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[6] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[6] )
  );

  AdderRTL__fa096d180efec193 fu__7
  (
    .clear( fu__clear[7] ),
    .clk( fu__clk[7] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[7] ),
    .reset( fu__reset[7] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[7] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[7] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[7] ),
    .recv_const__msg( fu__recv_const__msg[7] ),
    .recv_const__rdy( fu__recv_const__rdy[7] ),
    .recv_const__val( fu__recv_const__val[7] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[7] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[7] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[7] ),
    .recv_in__msg( fu__recv_in__msg[7] ),
    .recv_in__rdy( fu__recv_in__rdy[7] ),
    .recv_in__val( fu__recv_in__val[7] ),
    .recv_opt__msg( fu__recv_opt__msg[7] ),
    .recv_opt__rdy( fu__recv_opt__rdy[7] ),
    .recv_opt__val( fu__recv_opt__val[7] ),
    .send_out__msg( fu__send_out__msg[7] ),
    .send_out__rdy( fu__send_out__rdy[7] ),
    .send_out__val( fu__send_out__val[7] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[7] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[7] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[7] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[7] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[7] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[7] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[7] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[7] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[7] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[7] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[7] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[7] )
  );

  RetRTL__fa096d180efec193 fu__8
  (
    .clear( fu__clear[8] ),
    .clk( fu__clk[8] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[8] ),
    .reset( fu__reset[8] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[8] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[8] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[8] ),
    .recv_const__msg( fu__recv_const__msg[8] ),
    .recv_const__rdy( fu__recv_const__rdy[8] ),
    .recv_const__val( fu__recv_const__val[8] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[8] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[8] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[8] ),
    .recv_in__msg( fu__recv_in__msg[8] ),
    .recv_in__rdy( fu__recv_in__rdy[8] ),
    .recv_in__val( fu__recv_in__val[8] ),
    .recv_opt__msg( fu__recv_opt__msg[8] ),
    .recv_opt__rdy( fu__recv_opt__rdy[8] ),
    .recv_opt__val( fu__recv_opt__val[8] ),
    .send_out__msg( fu__send_out__msg[8] ),
    .send_out__rdy( fu__send_out__rdy[8] ),
    .send_out__val( fu__send_out__val[8] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[8] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[8] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[8] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[8] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[8] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[8] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[8] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[8] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[8] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[8] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[8] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[8] )
  );

  ExclusiveDivRTL__a007a9f9d00e72b1 fu__9
  (
    .clear( fu__clear[9] ),
    .clk( fu__clk[9] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[9] ),
    .reset( fu__reset[9] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[9] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[9] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[9] ),
    .recv_const__msg( fu__recv_const__msg[9] ),
    .recv_const__rdy( fu__recv_const__rdy[9] ),
    .recv_const__val( fu__recv_const__val[9] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[9] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[9] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[9] ),
    .recv_in__msg( fu__recv_in__msg[9] ),
    .recv_in__rdy( fu__recv_in__rdy[9] ),
    .recv_in__val( fu__recv_in__val[9] ),
    .recv_opt__msg( fu__recv_opt__msg[9] ),
    .recv_opt__rdy( fu__recv_opt__rdy[9] ),
    .recv_opt__val( fu__recv_opt__val[9] ),
    .send_out__msg( fu__send_out__msg[9] ),
    .send_out__rdy( fu__send_out__rdy[9] ),
    .send_out__val( fu__send_out__val[9] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[9] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[9] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[9] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[9] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[9] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[9] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[9] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[9] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[9] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[9] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[9] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[9] )
  );

  CompRTL__fa096d180efec193 fu__10
  (
    .clear( fu__clear[10] ),
    .clk( fu__clk[10] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[10] ),
    .reset( fu__reset[10] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[10] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[10] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[10] ),
    .recv_const__msg( fu__recv_const__msg[10] ),
    .recv_const__rdy( fu__recv_const__rdy[10] ),
    .recv_const__val( fu__recv_const__val[10] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[10] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[10] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[10] ),
    .recv_in__msg( fu__recv_in__msg[10] ),
    .recv_in__rdy( fu__recv_in__rdy[10] ),
    .recv_in__val( fu__recv_in__val[10] ),
    .recv_opt__msg( fu__recv_opt__msg[10] ),
    .recv_opt__rdy( fu__recv_opt__rdy[10] ),
    .recv_opt__val( fu__recv_opt__val[10] ),
    .send_out__msg( fu__send_out__msg[10] ),
    .send_out__rdy( fu__send_out__rdy[10] ),
    .send_out__val( fu__send_out__val[10] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[10] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[10] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[10] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[10] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[10] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[10] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[10] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[10] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[10] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[10] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[10] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[10] )
  );

  ShifterRTL__fa096d180efec193 fu__11
  (
    .clear( fu__clear[11] ),
    .clk( fu__clk[11] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[11] ),
    .reset( fu__reset[11] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[11] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[11] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[11] ),
    .recv_const__msg( fu__recv_const__msg[11] ),
    .recv_const__rdy( fu__recv_const__rdy[11] ),
    .recv_const__val( fu__recv_const__val[11] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[11] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[11] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[11] ),
    .recv_in__msg( fu__recv_in__msg[11] ),
    .recv_in__rdy( fu__recv_in__rdy[11] ),
    .recv_in__val( fu__recv_in__val[11] ),
    .recv_opt__msg( fu__recv_opt__msg[11] ),
    .recv_opt__rdy( fu__recv_opt__rdy[11] ),
    .recv_opt__val( fu__recv_opt__val[11] ),
    .send_out__msg( fu__send_out__msg[11] ),
    .send_out__rdy( fu__send_out__rdy[11] ),
    .send_out__val( fu__send_out__val[11] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[11] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[11] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[11] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[11] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[11] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[11] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[11] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[11] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[11] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[11] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[11] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[11] )
  );

  GrantRTL__fa096d180efec193 fu__12
  (
    .clear( fu__clear[12] ),
    .clk( fu__clk[12] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[12] ),
    .reset( fu__reset[12] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[12] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[12] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[12] ),
    .recv_const__msg( fu__recv_const__msg[12] ),
    .recv_const__rdy( fu__recv_const__rdy[12] ),
    .recv_const__val( fu__recv_const__val[12] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[12] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[12] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[12] ),
    .recv_in__msg( fu__recv_in__msg[12] ),
    .recv_in__rdy( fu__recv_in__rdy[12] ),
    .recv_in__val( fu__recv_in__val[12] ),
    .recv_opt__msg( fu__recv_opt__msg[12] ),
    .recv_opt__rdy( fu__recv_opt__rdy[12] ),
    .recv_opt__val( fu__recv_opt__val[12] ),
    .send_out__msg( fu__send_out__msg[12] ),
    .send_out__rdy( fu__send_out__rdy[12] ),
    .send_out__val( fu__send_out__val[12] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[12] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[12] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[12] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[12] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[12] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[12] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[12] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[12] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[12] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[12] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[12] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[12] )
  );

  ConstRTL__fa096d180efec193 fu__13
  (
    .clear( fu__clear[13] ),
    .clk( fu__clk[13] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[13] ),
    .reset( fu__reset[13] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[13] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[13] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[13] ),
    .recv_const__msg( fu__recv_const__msg[13] ),
    .recv_const__rdy( fu__recv_const__rdy[13] ),
    .recv_const__val( fu__recv_const__val[13] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[13] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[13] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[13] ),
    .recv_in__msg( fu__recv_in__msg[13] ),
    .recv_in__rdy( fu__recv_in__rdy[13] ),
    .recv_in__val( fu__recv_in__val[13] ),
    .recv_opt__msg( fu__recv_opt__msg[13] ),
    .recv_opt__rdy( fu__recv_opt__rdy[13] ),
    .recv_opt__val( fu__recv_opt__val[13] ),
    .send_out__msg( fu__send_out__msg[13] ),
    .send_out__rdy( fu__send_out__rdy[13] ),
    .send_out__val( fu__send_out__val[13] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[13] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[13] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[13] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[13] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[13] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[13] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[13] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[13] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[13] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[13] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[13] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[13] )
  );

  MulRTL__fa096d180efec193 fu__14
  (
    .clear( fu__clear[14] ),
    .clk( fu__clk[14] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[14] ),
    .reset( fu__reset[14] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[14] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[14] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[14] ),
    .recv_const__msg( fu__recv_const__msg[14] ),
    .recv_const__rdy( fu__recv_const__rdy[14] ),
    .recv_const__val( fu__recv_const__val[14] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[14] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[14] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[14] ),
    .recv_in__msg( fu__recv_in__msg[14] ),
    .recv_in__rdy( fu__recv_in__rdy[14] ),
    .recv_in__val( fu__recv_in__val[14] ),
    .recv_opt__msg( fu__recv_opt__msg[14] ),
    .recv_opt__rdy( fu__recv_opt__rdy[14] ),
    .recv_opt__val( fu__recv_opt__val[14] ),
    .send_out__msg( fu__send_out__msg[14] ),
    .send_out__rdy( fu__send_out__rdy[14] ),
    .send_out__val( fu__send_out__val[14] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[14] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[14] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[14] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[14] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[14] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[14] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[14] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[14] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[14] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[14] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[14] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[14] )
  );

  NahRTL__fa096d180efec193 fu__15
  (
    .clear( fu__clear[15] ),
    .clk( fu__clk[15] ),
    .ctrl_addr_inport( fu__ctrl_addr_inport[15] ),
    .reset( fu__reset[15] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[15] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[15] ),
    .from_mem_rdata__val( fu__from_mem_rdata__val[15] ),
    .recv_const__msg( fu__recv_const__msg[15] ),
    .recv_const__rdy( fu__recv_const__rdy[15] ),
    .recv_const__val( fu__recv_const__val[15] ),
    .recv_from_ctrl_mem__msg( fu__recv_from_ctrl_mem__msg[15] ),
    .recv_from_ctrl_mem__rdy( fu__recv_from_ctrl_mem__rdy[15] ),
    .recv_from_ctrl_mem__val( fu__recv_from_ctrl_mem__val[15] ),
    .recv_in__msg( fu__recv_in__msg[15] ),
    .recv_in__rdy( fu__recv_in__rdy[15] ),
    .recv_in__val( fu__recv_in__val[15] ),
    .recv_opt__msg( fu__recv_opt__msg[15] ),
    .recv_opt__rdy( fu__recv_opt__rdy[15] ),
    .recv_opt__val( fu__recv_opt__val[15] ),
    .send_out__msg( fu__send_out__msg[15] ),
    .send_out__rdy( fu__send_out__rdy[15] ),
    .send_out__val( fu__send_out__val[15] ),
    .send_to_ctrl_mem__msg( fu__send_to_ctrl_mem__msg[15] ),
    .send_to_ctrl_mem__rdy( fu__send_to_ctrl_mem__rdy[15] ),
    .send_to_ctrl_mem__val( fu__send_to_ctrl_mem__val[15] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[15] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[15] ),
    .to_mem_raddr__val( fu__to_mem_raddr__val[15] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[15] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[15] ),
    .to_mem_waddr__val( fu__to_mem_waddr__val[15] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[15] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[15] ),
    .to_mem_wdata__val( fu__to_mem_wdata__val[15] )
  );

  //-------------------------------------------------------------
  // End of component fu[0:15]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/flexible/FlexibleFuRTL.py:109
  // @update
  // def comb_logic():
  //   for j in range(num_outports):
  //     s.send_out[j].val @= b1(0)
  //     s.send_out[j].msg @= DataType()
  // 
  //   for i in range(s.fu_list_size):
  //     # const connection.
  //     s.fu[i].recv_const.msg @= s.recv_const.msg
  //     s.fu[i].recv_const.val @= s.recv_const.val
  //     s.fu_recv_const_rdy_vector[i] @= s.fu[i].recv_const.rdy
  // 
  //     # opt connection.
  //     s.fu[i].recv_opt.msg @= s.recv_opt.msg
  //     # Sets each FU's op code as NAH when prologue execution is not completed.
  //     # As they are supposed to do nothing during that prologue cycles.
  //     if s.prologue_count_inport != 0:
  //       s.fu[i].recv_opt.msg.operation @= OPT_NAH
  //     s.fu[i].recv_opt.val @= s.recv_opt.val
  //     s.fu_recv_opt_rdy_vector[i] @= s.fu[i].recv_opt.rdy
  // 
  //     # send_out connection.
  //     for j in range(num_outports):
  //       # FIXME: need reduce_or here: https://github.com/tancheng/VectorCGRA/issues/51.
  //       if s.fu[i].send_out[j].val:
  //         s.send_out[j].msg @= s.fu[i].send_out[j].msg
  //         s.send_out[j].val @= s.fu[i].send_out[j].val
  //       s.fu[i].send_out[j].rdy @= s.send_out[j].rdy
  // 
  //   s.recv_const.rdy @= reduce_or(s.fu_recv_const_rdy_vector)
  //   # Operation (especially mem access) won't perform more than once, because once the
  //   # operation is performance (i.e., the recv_opt.rdy would be set), the `element_done`
  //   # register would be set and be respected.
  //   s.recv_opt.rdy @= reduce_or(s.fu_recv_opt_rdy_vector) | (s.prologue_count_inport != 0)
  // 
  //   for j in range(num_inports):
  //     s.recv_in[j].rdy @= b1(0)
  // 
  //   # recv_in connection.
  //   for port in range(num_inports):
  //     for i in range(s.fu_list_size):
  //       s.fu[i].recv_in[port].msg @= s.recv_in[port].msg
  //       s.fu[i].recv_in[port].val @= s.recv_in[port].val
  //       # s.recv_in[j].rdy       @= s.fu[i].recv_in[j].rdy | s.recv_in[j].rdy
  //       s.fu_recv_in_rdy_vector[port][i] @= s.fu[i].recv_in[port].rdy
  //     s.recv_in[port].rdy @= reduce_or(s.fu_recv_in_rdy_vector[port])
  
  always_comb begin : comb_logic
    for ( int unsigned j = 1'd0; j < 2'( __const__num_outports_at_comb_logic ); j += 1'd1 ) begin
      send_out__val[1'(j)] = 1'd0;
      send_out__msg[1'(j)] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    end
    for ( int unsigned i = 1'd0; i < 5'd16; i += 1'd1 ) begin
      fu__recv_const__msg[4'(i)] = recv_const__msg;
      fu__recv_const__val[4'(i)] = recv_const__val;
      fu_recv_const_rdy_vector[4'(i)] = fu__recv_const__rdy[4'(i)];
      fu__recv_opt__msg[4'(i)] = recv_opt__msg;
      if ( prologue_count_inport != 3'd0 ) begin
        fu__recv_opt__msg[4'(i)].operation = 7'( __const__OPT_NAH );
      end
      fu__recv_opt__val[4'(i)] = recv_opt__val;
      fu_recv_opt_rdy_vector[4'(i)] = fu__recv_opt__rdy[4'(i)];
      for ( int unsigned j = 1'd0; j < 2'( __const__num_outports_at_comb_logic ); j += 1'd1 ) begin
        if ( fu__send_out__val[4'(i)][1'(j)] ) begin
          send_out__msg[1'(j)] = fu__send_out__msg[4'(i)][1'(j)];
          send_out__val[1'(j)] = fu__send_out__val[4'(i)][1'(j)];
        end
        fu__send_out__rdy[4'(i)][1'(j)] = send_out__rdy[1'(j)];
      end
    end
    recv_const__rdy = ( | fu_recv_const_rdy_vector );
    recv_opt__rdy = ( | fu_recv_opt_rdy_vector ) | ( prologue_count_inport != 3'd0 );
    for ( int unsigned j = 1'd0; j < 3'( __const__num_inports_at_comb_logic ); j += 1'd1 )
      recv_in__rdy[2'(j)] = 1'd0;
    for ( int unsigned port = 1'd0; port < 3'( __const__num_inports_at_comb_logic ); port += 1'd1 ) begin
      for ( int unsigned i = 1'd0; i < 5'd16; i += 1'd1 ) begin
        fu__recv_in__msg[4'(i)][2'(port)] = recv_in__msg[2'(port)];
        fu__recv_in__val[4'(i)][2'(port)] = recv_in__val[2'(port)];
        fu_recv_in_rdy_vector[2'(port)][4'(i)] = fu__recv_in__rdy[4'(i)][2'(port)];
      end
      recv_in__rdy[2'(port)] = ( | fu_recv_in_rdy_vector[2'(port)] );
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/flexible/FlexibleFuRTL.py:91
  // @update
  // def connect_to_controller():
  //   for i in range(s.fu_list_size):
  //     # const connection.
  //     s.fu[i].recv_from_ctrl_mem.msg @= s.recv_from_ctrl_mem.msg
  //     s.fu[i].recv_from_ctrl_mem.val @= s.recv_from_ctrl_mem.val
  //     s.recv_from_controller_rdy_vector[i] @= s.fu[i].recv_from_ctrl_mem.rdy
  //   s.recv_from_ctrl_mem.rdy @= reduce_or(s.recv_from_controller_rdy_vector)
  // 
  //   s.send_to_ctrl_mem.msg @= CgraPayloadType(0, 0, 0, 0, 0)
  //   s.send_to_ctrl_mem.val @= 0
  //   for i in range(s.fu_list_size):
  //     if s.fu[i].send_to_ctrl_mem.val:
  //       s.send_to_ctrl_mem.msg @= s.fu[i].send_to_ctrl_mem.msg
  //       s.send_to_ctrl_mem.val @= s.fu[i].send_to_ctrl_mem.val
  //     s.fu[i].send_to_ctrl_mem.rdy @= s.send_to_ctrl_mem.rdy
  //     s.fu[i].ctrl_addr_inport @= s.ctrl_addr_inport
  
  always_comb begin : connect_to_controller
    for ( int unsigned i = 1'd0; i < 5'd16; i += 1'd1 ) begin
      fu__recv_from_ctrl_mem__msg[4'(i)] = recv_from_ctrl_mem__msg;
      fu__recv_from_ctrl_mem__val[4'(i)] = recv_from_ctrl_mem__val;
      recv_from_controller_rdy_vector[4'(i)] = fu__recv_from_ctrl_mem__rdy[4'(i)];
    end
    recv_from_ctrl_mem__rdy = ( | recv_from_controller_rdy_vector );
    send_to_ctrl_mem__msg = { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 };
    send_to_ctrl_mem__val = 1'd0;
    for ( int unsigned i = 1'd0; i < 5'd16; i += 1'd1 ) begin
      if ( fu__send_to_ctrl_mem__val[4'(i)] ) begin
        send_to_ctrl_mem__msg = fu__send_to_ctrl_mem__msg[4'(i)];
        send_to_ctrl_mem__val = fu__send_to_ctrl_mem__val[4'(i)];
      end
      fu__send_to_ctrl_mem__rdy[4'(i)] = send_to_ctrl_mem__rdy;
      fu__ctrl_addr_inport[4'(i)] = ctrl_addr_inport;
    end
  end

  assign fu__clk[0] = clk;
  assign fu__reset[0] = reset;
  assign fu__clk[1] = clk;
  assign fu__reset[1] = reset;
  assign fu__clk[2] = clk;
  assign fu__reset[2] = reset;
  assign fu__clk[3] = clk;
  assign fu__reset[3] = reset;
  assign fu__clk[4] = clk;
  assign fu__reset[4] = reset;
  assign fu__clk[5] = clk;
  assign fu__reset[5] = reset;
  assign fu__clk[6] = clk;
  assign fu__reset[6] = reset;
  assign fu__clk[7] = clk;
  assign fu__reset[7] = reset;
  assign fu__clk[8] = clk;
  assign fu__reset[8] = reset;
  assign fu__clk[9] = clk;
  assign fu__reset[9] = reset;
  assign fu__clk[10] = clk;
  assign fu__reset[10] = reset;
  assign fu__clk[11] = clk;
  assign fu__reset[11] = reset;
  assign fu__clk[12] = clk;
  assign fu__reset[12] = reset;
  assign fu__clk[13] = clk;
  assign fu__reset[13] = reset;
  assign fu__clk[14] = clk;
  assign fu__reset[14] = reset;
  assign fu__clk[15] = clk;
  assign fu__reset[15] = reset;
  assign to_mem_raddr__msg[0] = fu__to_mem_raddr__msg[0];
  assign fu__to_mem_raddr__rdy[0] = to_mem_raddr__rdy[0];
  assign to_mem_raddr__val[0] = fu__to_mem_raddr__val[0];
  assign fu__from_mem_rdata__msg[0] = from_mem_rdata__msg[0];
  assign from_mem_rdata__rdy[0] = fu__from_mem_rdata__rdy[0];
  assign fu__from_mem_rdata__val[0] = from_mem_rdata__val[0];
  assign to_mem_waddr__msg[0] = fu__to_mem_waddr__msg[0];
  assign fu__to_mem_waddr__rdy[0] = to_mem_waddr__rdy[0];
  assign to_mem_waddr__val[0] = fu__to_mem_waddr__val[0];
  assign to_mem_wdata__msg[0] = fu__to_mem_wdata__msg[0];
  assign fu__to_mem_wdata__rdy[0] = to_mem_wdata__rdy[0];
  assign to_mem_wdata__val[0] = fu__to_mem_wdata__val[0];
  assign fu__clear[0] = clear[0];
  assign to_mem_raddr__msg[1] = fu__to_mem_raddr__msg[1];
  assign fu__to_mem_raddr__rdy[1] = to_mem_raddr__rdy[1];
  assign to_mem_raddr__val[1] = fu__to_mem_raddr__val[1];
  assign fu__from_mem_rdata__msg[1] = from_mem_rdata__msg[1];
  assign from_mem_rdata__rdy[1] = fu__from_mem_rdata__rdy[1];
  assign fu__from_mem_rdata__val[1] = from_mem_rdata__val[1];
  assign to_mem_waddr__msg[1] = fu__to_mem_waddr__msg[1];
  assign fu__to_mem_waddr__rdy[1] = to_mem_waddr__rdy[1];
  assign to_mem_waddr__val[1] = fu__to_mem_waddr__val[1];
  assign to_mem_wdata__msg[1] = fu__to_mem_wdata__msg[1];
  assign fu__to_mem_wdata__rdy[1] = to_mem_wdata__rdy[1];
  assign to_mem_wdata__val[1] = fu__to_mem_wdata__val[1];
  assign fu__clear[1] = clear[1];
  assign to_mem_raddr__msg[2] = fu__to_mem_raddr__msg[2];
  assign fu__to_mem_raddr__rdy[2] = to_mem_raddr__rdy[2];
  assign to_mem_raddr__val[2] = fu__to_mem_raddr__val[2];
  assign fu__from_mem_rdata__msg[2] = from_mem_rdata__msg[2];
  assign from_mem_rdata__rdy[2] = fu__from_mem_rdata__rdy[2];
  assign fu__from_mem_rdata__val[2] = from_mem_rdata__val[2];
  assign to_mem_waddr__msg[2] = fu__to_mem_waddr__msg[2];
  assign fu__to_mem_waddr__rdy[2] = to_mem_waddr__rdy[2];
  assign to_mem_waddr__val[2] = fu__to_mem_waddr__val[2];
  assign to_mem_wdata__msg[2] = fu__to_mem_wdata__msg[2];
  assign fu__to_mem_wdata__rdy[2] = to_mem_wdata__rdy[2];
  assign to_mem_wdata__val[2] = fu__to_mem_wdata__val[2];
  assign fu__clear[2] = clear[2];
  assign to_mem_raddr__msg[3] = fu__to_mem_raddr__msg[3];
  assign fu__to_mem_raddr__rdy[3] = to_mem_raddr__rdy[3];
  assign to_mem_raddr__val[3] = fu__to_mem_raddr__val[3];
  assign fu__from_mem_rdata__msg[3] = from_mem_rdata__msg[3];
  assign from_mem_rdata__rdy[3] = fu__from_mem_rdata__rdy[3];
  assign fu__from_mem_rdata__val[3] = from_mem_rdata__val[3];
  assign to_mem_waddr__msg[3] = fu__to_mem_waddr__msg[3];
  assign fu__to_mem_waddr__rdy[3] = to_mem_waddr__rdy[3];
  assign to_mem_waddr__val[3] = fu__to_mem_waddr__val[3];
  assign to_mem_wdata__msg[3] = fu__to_mem_wdata__msg[3];
  assign fu__to_mem_wdata__rdy[3] = to_mem_wdata__rdy[3];
  assign to_mem_wdata__val[3] = fu__to_mem_wdata__val[3];
  assign fu__clear[3] = clear[3];
  assign to_mem_raddr__msg[4] = fu__to_mem_raddr__msg[4];
  assign fu__to_mem_raddr__rdy[4] = to_mem_raddr__rdy[4];
  assign to_mem_raddr__val[4] = fu__to_mem_raddr__val[4];
  assign fu__from_mem_rdata__msg[4] = from_mem_rdata__msg[4];
  assign from_mem_rdata__rdy[4] = fu__from_mem_rdata__rdy[4];
  assign fu__from_mem_rdata__val[4] = from_mem_rdata__val[4];
  assign to_mem_waddr__msg[4] = fu__to_mem_waddr__msg[4];
  assign fu__to_mem_waddr__rdy[4] = to_mem_waddr__rdy[4];
  assign to_mem_waddr__val[4] = fu__to_mem_waddr__val[4];
  assign to_mem_wdata__msg[4] = fu__to_mem_wdata__msg[4];
  assign fu__to_mem_wdata__rdy[4] = to_mem_wdata__rdy[4];
  assign to_mem_wdata__val[4] = fu__to_mem_wdata__val[4];
  assign fu__clear[4] = clear[4];
  assign to_mem_raddr__msg[5] = fu__to_mem_raddr__msg[5];
  assign fu__to_mem_raddr__rdy[5] = to_mem_raddr__rdy[5];
  assign to_mem_raddr__val[5] = fu__to_mem_raddr__val[5];
  assign fu__from_mem_rdata__msg[5] = from_mem_rdata__msg[5];
  assign from_mem_rdata__rdy[5] = fu__from_mem_rdata__rdy[5];
  assign fu__from_mem_rdata__val[5] = from_mem_rdata__val[5];
  assign to_mem_waddr__msg[5] = fu__to_mem_waddr__msg[5];
  assign fu__to_mem_waddr__rdy[5] = to_mem_waddr__rdy[5];
  assign to_mem_waddr__val[5] = fu__to_mem_waddr__val[5];
  assign to_mem_wdata__msg[5] = fu__to_mem_wdata__msg[5];
  assign fu__to_mem_wdata__rdy[5] = to_mem_wdata__rdy[5];
  assign to_mem_wdata__val[5] = fu__to_mem_wdata__val[5];
  assign fu__clear[5] = clear[5];
  assign to_mem_raddr__msg[6] = fu__to_mem_raddr__msg[6];
  assign fu__to_mem_raddr__rdy[6] = to_mem_raddr__rdy[6];
  assign to_mem_raddr__val[6] = fu__to_mem_raddr__val[6];
  assign fu__from_mem_rdata__msg[6] = from_mem_rdata__msg[6];
  assign from_mem_rdata__rdy[6] = fu__from_mem_rdata__rdy[6];
  assign fu__from_mem_rdata__val[6] = from_mem_rdata__val[6];
  assign to_mem_waddr__msg[6] = fu__to_mem_waddr__msg[6];
  assign fu__to_mem_waddr__rdy[6] = to_mem_waddr__rdy[6];
  assign to_mem_waddr__val[6] = fu__to_mem_waddr__val[6];
  assign to_mem_wdata__msg[6] = fu__to_mem_wdata__msg[6];
  assign fu__to_mem_wdata__rdy[6] = to_mem_wdata__rdy[6];
  assign to_mem_wdata__val[6] = fu__to_mem_wdata__val[6];
  assign fu__clear[6] = clear[6];
  assign to_mem_raddr__msg[7] = fu__to_mem_raddr__msg[7];
  assign fu__to_mem_raddr__rdy[7] = to_mem_raddr__rdy[7];
  assign to_mem_raddr__val[7] = fu__to_mem_raddr__val[7];
  assign fu__from_mem_rdata__msg[7] = from_mem_rdata__msg[7];
  assign from_mem_rdata__rdy[7] = fu__from_mem_rdata__rdy[7];
  assign fu__from_mem_rdata__val[7] = from_mem_rdata__val[7];
  assign to_mem_waddr__msg[7] = fu__to_mem_waddr__msg[7];
  assign fu__to_mem_waddr__rdy[7] = to_mem_waddr__rdy[7];
  assign to_mem_waddr__val[7] = fu__to_mem_waddr__val[7];
  assign to_mem_wdata__msg[7] = fu__to_mem_wdata__msg[7];
  assign fu__to_mem_wdata__rdy[7] = to_mem_wdata__rdy[7];
  assign to_mem_wdata__val[7] = fu__to_mem_wdata__val[7];
  assign fu__clear[7] = clear[7];
  assign to_mem_raddr__msg[8] = fu__to_mem_raddr__msg[8];
  assign fu__to_mem_raddr__rdy[8] = to_mem_raddr__rdy[8];
  assign to_mem_raddr__val[8] = fu__to_mem_raddr__val[8];
  assign fu__from_mem_rdata__msg[8] = from_mem_rdata__msg[8];
  assign from_mem_rdata__rdy[8] = fu__from_mem_rdata__rdy[8];
  assign fu__from_mem_rdata__val[8] = from_mem_rdata__val[8];
  assign to_mem_waddr__msg[8] = fu__to_mem_waddr__msg[8];
  assign fu__to_mem_waddr__rdy[8] = to_mem_waddr__rdy[8];
  assign to_mem_waddr__val[8] = fu__to_mem_waddr__val[8];
  assign to_mem_wdata__msg[8] = fu__to_mem_wdata__msg[8];
  assign fu__to_mem_wdata__rdy[8] = to_mem_wdata__rdy[8];
  assign to_mem_wdata__val[8] = fu__to_mem_wdata__val[8];
  assign fu__clear[8] = clear[8];
  assign to_mem_raddr__msg[9] = fu__to_mem_raddr__msg[9];
  assign fu__to_mem_raddr__rdy[9] = to_mem_raddr__rdy[9];
  assign to_mem_raddr__val[9] = fu__to_mem_raddr__val[9];
  assign fu__from_mem_rdata__msg[9] = from_mem_rdata__msg[9];
  assign from_mem_rdata__rdy[9] = fu__from_mem_rdata__rdy[9];
  assign fu__from_mem_rdata__val[9] = from_mem_rdata__val[9];
  assign to_mem_waddr__msg[9] = fu__to_mem_waddr__msg[9];
  assign fu__to_mem_waddr__rdy[9] = to_mem_waddr__rdy[9];
  assign to_mem_waddr__val[9] = fu__to_mem_waddr__val[9];
  assign to_mem_wdata__msg[9] = fu__to_mem_wdata__msg[9];
  assign fu__to_mem_wdata__rdy[9] = to_mem_wdata__rdy[9];
  assign to_mem_wdata__val[9] = fu__to_mem_wdata__val[9];
  assign fu__clear[9] = clear[9];
  assign to_mem_raddr__msg[10] = fu__to_mem_raddr__msg[10];
  assign fu__to_mem_raddr__rdy[10] = to_mem_raddr__rdy[10];
  assign to_mem_raddr__val[10] = fu__to_mem_raddr__val[10];
  assign fu__from_mem_rdata__msg[10] = from_mem_rdata__msg[10];
  assign from_mem_rdata__rdy[10] = fu__from_mem_rdata__rdy[10];
  assign fu__from_mem_rdata__val[10] = from_mem_rdata__val[10];
  assign to_mem_waddr__msg[10] = fu__to_mem_waddr__msg[10];
  assign fu__to_mem_waddr__rdy[10] = to_mem_waddr__rdy[10];
  assign to_mem_waddr__val[10] = fu__to_mem_waddr__val[10];
  assign to_mem_wdata__msg[10] = fu__to_mem_wdata__msg[10];
  assign fu__to_mem_wdata__rdy[10] = to_mem_wdata__rdy[10];
  assign to_mem_wdata__val[10] = fu__to_mem_wdata__val[10];
  assign fu__clear[10] = clear[10];
  assign to_mem_raddr__msg[11] = fu__to_mem_raddr__msg[11];
  assign fu__to_mem_raddr__rdy[11] = to_mem_raddr__rdy[11];
  assign to_mem_raddr__val[11] = fu__to_mem_raddr__val[11];
  assign fu__from_mem_rdata__msg[11] = from_mem_rdata__msg[11];
  assign from_mem_rdata__rdy[11] = fu__from_mem_rdata__rdy[11];
  assign fu__from_mem_rdata__val[11] = from_mem_rdata__val[11];
  assign to_mem_waddr__msg[11] = fu__to_mem_waddr__msg[11];
  assign fu__to_mem_waddr__rdy[11] = to_mem_waddr__rdy[11];
  assign to_mem_waddr__val[11] = fu__to_mem_waddr__val[11];
  assign to_mem_wdata__msg[11] = fu__to_mem_wdata__msg[11];
  assign fu__to_mem_wdata__rdy[11] = to_mem_wdata__rdy[11];
  assign to_mem_wdata__val[11] = fu__to_mem_wdata__val[11];
  assign fu__clear[11] = clear[11];
  assign to_mem_raddr__msg[12] = fu__to_mem_raddr__msg[12];
  assign fu__to_mem_raddr__rdy[12] = to_mem_raddr__rdy[12];
  assign to_mem_raddr__val[12] = fu__to_mem_raddr__val[12];
  assign fu__from_mem_rdata__msg[12] = from_mem_rdata__msg[12];
  assign from_mem_rdata__rdy[12] = fu__from_mem_rdata__rdy[12];
  assign fu__from_mem_rdata__val[12] = from_mem_rdata__val[12];
  assign to_mem_waddr__msg[12] = fu__to_mem_waddr__msg[12];
  assign fu__to_mem_waddr__rdy[12] = to_mem_waddr__rdy[12];
  assign to_mem_waddr__val[12] = fu__to_mem_waddr__val[12];
  assign to_mem_wdata__msg[12] = fu__to_mem_wdata__msg[12];
  assign fu__to_mem_wdata__rdy[12] = to_mem_wdata__rdy[12];
  assign to_mem_wdata__val[12] = fu__to_mem_wdata__val[12];
  assign fu__clear[12] = clear[12];
  assign to_mem_raddr__msg[13] = fu__to_mem_raddr__msg[13];
  assign fu__to_mem_raddr__rdy[13] = to_mem_raddr__rdy[13];
  assign to_mem_raddr__val[13] = fu__to_mem_raddr__val[13];
  assign fu__from_mem_rdata__msg[13] = from_mem_rdata__msg[13];
  assign from_mem_rdata__rdy[13] = fu__from_mem_rdata__rdy[13];
  assign fu__from_mem_rdata__val[13] = from_mem_rdata__val[13];
  assign to_mem_waddr__msg[13] = fu__to_mem_waddr__msg[13];
  assign fu__to_mem_waddr__rdy[13] = to_mem_waddr__rdy[13];
  assign to_mem_waddr__val[13] = fu__to_mem_waddr__val[13];
  assign to_mem_wdata__msg[13] = fu__to_mem_wdata__msg[13];
  assign fu__to_mem_wdata__rdy[13] = to_mem_wdata__rdy[13];
  assign to_mem_wdata__val[13] = fu__to_mem_wdata__val[13];
  assign fu__clear[13] = clear[13];
  assign to_mem_raddr__msg[14] = fu__to_mem_raddr__msg[14];
  assign fu__to_mem_raddr__rdy[14] = to_mem_raddr__rdy[14];
  assign to_mem_raddr__val[14] = fu__to_mem_raddr__val[14];
  assign fu__from_mem_rdata__msg[14] = from_mem_rdata__msg[14];
  assign from_mem_rdata__rdy[14] = fu__from_mem_rdata__rdy[14];
  assign fu__from_mem_rdata__val[14] = from_mem_rdata__val[14];
  assign to_mem_waddr__msg[14] = fu__to_mem_waddr__msg[14];
  assign fu__to_mem_waddr__rdy[14] = to_mem_waddr__rdy[14];
  assign to_mem_waddr__val[14] = fu__to_mem_waddr__val[14];
  assign to_mem_wdata__msg[14] = fu__to_mem_wdata__msg[14];
  assign fu__to_mem_wdata__rdy[14] = to_mem_wdata__rdy[14];
  assign to_mem_wdata__val[14] = fu__to_mem_wdata__val[14];
  assign fu__clear[14] = clear[14];
  assign to_mem_raddr__msg[15] = fu__to_mem_raddr__msg[15];
  assign fu__to_mem_raddr__rdy[15] = to_mem_raddr__rdy[15];
  assign to_mem_raddr__val[15] = fu__to_mem_raddr__val[15];
  assign fu__from_mem_rdata__msg[15] = from_mem_rdata__msg[15];
  assign from_mem_rdata__rdy[15] = fu__from_mem_rdata__rdy[15];
  assign fu__from_mem_rdata__val[15] = from_mem_rdata__val[15];
  assign to_mem_waddr__msg[15] = fu__to_mem_waddr__msg[15];
  assign fu__to_mem_waddr__rdy[15] = to_mem_waddr__rdy[15];
  assign to_mem_waddr__val[15] = fu__to_mem_waddr__val[15];
  assign to_mem_wdata__msg[15] = fu__to_mem_wdata__msg[15];
  assign fu__to_mem_wdata__rdy[15] = to_mem_wdata__rdy[15];
  assign to_mem_wdata__val[15] = fu__to_mem_wdata__val[15];
  assign fu__clear[15] = clear[15];

endmodule