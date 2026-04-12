module FlexibleFuRTL__9cb301226ddb80f2
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [1:0] recv_in_count [0:3],
  input logic [0:0] reset,
  input logic [0:0] from_mem_rdata__en [0:10],
  input CGRAData_32_1_1 from_mem_rdata__msg [0:10],
  output logic [0:0] from_mem_rdata__rdy [0:10],
  input logic [0:0] recv_const__en,
  input CGRAData_32_1_1 recv_const__msg,
  output logic [0:0] recv_const__rdy,
  input logic [0:0] recv_in__en [0:3],
  input CGRAData_32_1_1 recv_in__msg [0:3],
  output logic [0:0] recv_in__rdy [0:3],
  input logic [0:0] recv_opt__en,
  input CGRAConfig_6_4_10_12 recv_opt__msg,
  output logic [0:0] recv_opt__rdy,
  input logic [0:0] recv_predicate__en,
  input CGRAData_1_1 recv_predicate__msg,
  output logic [0:0] recv_predicate__rdy,
  output logic [0:0] send_out__en [0:1],
  output CGRAData_32_1_1 send_out__msg [0:1],
  input logic [0:0] send_out__rdy [0:1],
  output logic [0:0] to_mem_raddr__en [0:10],
  output logic [0:0] to_mem_raddr__msg [0:10],
  input logic [0:0] to_mem_raddr__rdy [0:10],
  output logic [0:0] to_mem_waddr__en [0:10],
  output logic [0:0] to_mem_waddr__msg [0:10],
  input logic [0:0] to_mem_waddr__rdy [0:10],
  output logic [0:0] to_mem_wdata__en [0:10],
  output CGRAData_32_1_1 to_mem_wdata__msg [0:10],
  input logic [0:0] to_mem_wdata__rdy [0:10]
);
  localparam logic [31:0] fu_list_size = 32'd11;
  localparam logic [31:0] __const__num_outports_at_comb_logic = 32'd2;
  localparam logic [31:0] __const__num_inports_at_comb_logic = 32'd4;
  //-------------------------------------------------------------
  // Component fu[0:10]
  //-------------------------------------------------------------

  logic [0:0] fu__clk [0:10] ;
  logic [0:0] fu__initial_carry_in [0:10] ;
  logic [0:0] fu__initial_carry_out [0:10] ;
  logic [1:0] fu__recv_in_count [0:10][0:3] ;
  logic [0:0] fu__reset [0:10] ;
  logic [0:0] fu__from_mem_rdata__en [0:10] ;
  CGRAData_32_1_1 fu__from_mem_rdata__msg [0:10] ;
  logic [0:0] fu__from_mem_rdata__rdy [0:10] ;
  logic [0:0] fu__recv_const__en [0:10] ;
  CGRAData_32_1_1 fu__recv_const__msg [0:10] ;
  logic [0:0] fu__recv_const__rdy [0:10] ;
  logic [0:0] fu__recv_in__en [0:10][0:3] ;
  CGRAData_32_1_1 fu__recv_in__msg [0:10][0:3] ;
  logic [0:0] fu__recv_in__rdy [0:10][0:3] ;
  logic [0:0] fu__recv_opt__en [0:10] ;
  CGRAConfig_6_4_10_12 fu__recv_opt__msg [0:10] ;
  logic [0:0] fu__recv_opt__rdy [0:10] ;
  logic [0:0] fu__recv_predicate__en [0:10] ;
  CGRAData_1_1 fu__recv_predicate__msg [0:10] ;
  logic [0:0] fu__recv_predicate__rdy [0:10] ;
  logic [0:0] fu__send_out__en [0:10][0:1] ;
  CGRAData_32_1_1 fu__send_out__msg [0:10][0:1] ;
  logic [0:0] fu__send_out__rdy [0:10][0:1] ;
  logic [0:0] fu__to_mem_raddr__en [0:10] ;
  logic [0:0] fu__to_mem_raddr__msg [0:10] ;
  logic [0:0] fu__to_mem_raddr__rdy [0:10] ;
  logic [0:0] fu__to_mem_waddr__en [0:10] ;
  logic [0:0] fu__to_mem_waddr__msg [0:10] ;
  logic [0:0] fu__to_mem_waddr__rdy [0:10] ;
  logic [0:0] fu__to_mem_wdata__en [0:10] ;
  CGRAData_32_1_1 fu__to_mem_wdata__msg [0:10] ;
  logic [0:0] fu__to_mem_wdata__rdy [0:10] ;

  PhiRTL__cf54288ae5eea774 fu__0
  (
    .clk( fu__clk[0] ),
    .initial_carry_in( fu__initial_carry_in[0] ),
    .initial_carry_out( fu__initial_carry_out[0] ),
    .recv_in_count( fu__recv_in_count[0] ),
    .reset( fu__reset[0] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[0] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[0] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[0] ),
    .recv_const__en( fu__recv_const__en[0] ),
    .recv_const__msg( fu__recv_const__msg[0] ),
    .recv_const__rdy( fu__recv_const__rdy[0] ),
    .recv_in__en( fu__recv_in__en[0] ),
    .recv_in__msg( fu__recv_in__msg[0] ),
    .recv_in__rdy( fu__recv_in__rdy[0] ),
    .recv_opt__en( fu__recv_opt__en[0] ),
    .recv_opt__msg( fu__recv_opt__msg[0] ),
    .recv_opt__rdy( fu__recv_opt__rdy[0] ),
    .recv_predicate__en( fu__recv_predicate__en[0] ),
    .recv_predicate__msg( fu__recv_predicate__msg[0] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[0] ),
    .send_out__en( fu__send_out__en[0] ),
    .send_out__msg( fu__send_out__msg[0] ),
    .send_out__rdy( fu__send_out__rdy[0] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[0] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[0] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[0] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[0] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[0] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[0] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[0] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[0] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[0] )
  );

  AdderRTL__cf54288ae5eea774 fu__1
  (
    .clk( fu__clk[1] ),
    .initial_carry_in( fu__initial_carry_in[1] ),
    .initial_carry_out( fu__initial_carry_out[1] ),
    .recv_in_count( fu__recv_in_count[1] ),
    .reset( fu__reset[1] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[1] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[1] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[1] ),
    .recv_const__en( fu__recv_const__en[1] ),
    .recv_const__msg( fu__recv_const__msg[1] ),
    .recv_const__rdy( fu__recv_const__rdy[1] ),
    .recv_in__en( fu__recv_in__en[1] ),
    .recv_in__msg( fu__recv_in__msg[1] ),
    .recv_in__rdy( fu__recv_in__rdy[1] ),
    .recv_opt__en( fu__recv_opt__en[1] ),
    .recv_opt__msg( fu__recv_opt__msg[1] ),
    .recv_opt__rdy( fu__recv_opt__rdy[1] ),
    .recv_predicate__en( fu__recv_predicate__en[1] ),
    .recv_predicate__msg( fu__recv_predicate__msg[1] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[1] ),
    .send_out__en( fu__send_out__en[1] ),
    .send_out__msg( fu__send_out__msg[1] ),
    .send_out__rdy( fu__send_out__rdy[1] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[1] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[1] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[1] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[1] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[1] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[1] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[1] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[1] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[1] )
  );

  ShifterRTL__cf54288ae5eea774 fu__2
  (
    .clk( fu__clk[2] ),
    .initial_carry_in( fu__initial_carry_in[2] ),
    .initial_carry_out( fu__initial_carry_out[2] ),
    .recv_in_count( fu__recv_in_count[2] ),
    .reset( fu__reset[2] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[2] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[2] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[2] ),
    .recv_const__en( fu__recv_const__en[2] ),
    .recv_const__msg( fu__recv_const__msg[2] ),
    .recv_const__rdy( fu__recv_const__rdy[2] ),
    .recv_in__en( fu__recv_in__en[2] ),
    .recv_in__msg( fu__recv_in__msg[2] ),
    .recv_in__rdy( fu__recv_in__rdy[2] ),
    .recv_opt__en( fu__recv_opt__en[2] ),
    .recv_opt__msg( fu__recv_opt__msg[2] ),
    .recv_opt__rdy( fu__recv_opt__rdy[2] ),
    .recv_predicate__en( fu__recv_predicate__en[2] ),
    .recv_predicate__msg( fu__recv_predicate__msg[2] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[2] ),
    .send_out__en( fu__send_out__en[2] ),
    .send_out__msg( fu__send_out__msg[2] ),
    .send_out__rdy( fu__send_out__rdy[2] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[2] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[2] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[2] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[2] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[2] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[2] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[2] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[2] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[2] )
  );

  MemUnitRTL__cf54288ae5eea774 fu__3
  (
    .clk( fu__clk[3] ),
    .initial_carry_in( fu__initial_carry_in[3] ),
    .initial_carry_out( fu__initial_carry_out[3] ),
    .recv_in_count( fu__recv_in_count[3] ),
    .reset( fu__reset[3] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[3] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[3] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[3] ),
    .recv_const__en( fu__recv_const__en[3] ),
    .recv_const__msg( fu__recv_const__msg[3] ),
    .recv_const__rdy( fu__recv_const__rdy[3] ),
    .recv_in__en( fu__recv_in__en[3] ),
    .recv_in__msg( fu__recv_in__msg[3] ),
    .recv_in__rdy( fu__recv_in__rdy[3] ),
    .recv_opt__en( fu__recv_opt__en[3] ),
    .recv_opt__msg( fu__recv_opt__msg[3] ),
    .recv_opt__rdy( fu__recv_opt__rdy[3] ),
    .recv_predicate__en( fu__recv_predicate__en[3] ),
    .recv_predicate__msg( fu__recv_predicate__msg[3] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[3] ),
    .send_out__en( fu__send_out__en[3] ),
    .send_out__msg( fu__send_out__msg[3] ),
    .send_out__rdy( fu__send_out__rdy[3] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[3] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[3] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[3] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[3] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[3] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[3] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[3] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[3] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[3] )
  );

  SelRTL__cf54288ae5eea774 fu__4
  (
    .clk( fu__clk[4] ),
    .initial_carry_in( fu__initial_carry_in[4] ),
    .initial_carry_out( fu__initial_carry_out[4] ),
    .recv_in_count( fu__recv_in_count[4] ),
    .reset( fu__reset[4] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[4] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[4] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[4] ),
    .recv_const__en( fu__recv_const__en[4] ),
    .recv_const__msg( fu__recv_const__msg[4] ),
    .recv_const__rdy( fu__recv_const__rdy[4] ),
    .recv_in__en( fu__recv_in__en[4] ),
    .recv_in__msg( fu__recv_in__msg[4] ),
    .recv_in__rdy( fu__recv_in__rdy[4] ),
    .recv_opt__en( fu__recv_opt__en[4] ),
    .recv_opt__msg( fu__recv_opt__msg[4] ),
    .recv_opt__rdy( fu__recv_opt__rdy[4] ),
    .recv_predicate__en( fu__recv_predicate__en[4] ),
    .recv_predicate__msg( fu__recv_predicate__msg[4] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[4] ),
    .send_out__en( fu__send_out__en[4] ),
    .send_out__msg( fu__send_out__msg[4] ),
    .send_out__rdy( fu__send_out__rdy[4] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[4] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[4] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[4] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[4] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[4] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[4] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[4] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[4] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[4] )
  );

  CompRTL__cf54288ae5eea774 fu__5
  (
    .clk( fu__clk[5] ),
    .initial_carry_in( fu__initial_carry_in[5] ),
    .initial_carry_out( fu__initial_carry_out[5] ),
    .recv_in_count( fu__recv_in_count[5] ),
    .reset( fu__reset[5] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[5] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[5] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[5] ),
    .recv_const__en( fu__recv_const__en[5] ),
    .recv_const__msg( fu__recv_const__msg[5] ),
    .recv_const__rdy( fu__recv_const__rdy[5] ),
    .recv_in__en( fu__recv_in__en[5] ),
    .recv_in__msg( fu__recv_in__msg[5] ),
    .recv_in__rdy( fu__recv_in__rdy[5] ),
    .recv_opt__en( fu__recv_opt__en[5] ),
    .recv_opt__msg( fu__recv_opt__msg[5] ),
    .recv_opt__rdy( fu__recv_opt__rdy[5] ),
    .recv_predicate__en( fu__recv_predicate__en[5] ),
    .recv_predicate__msg( fu__recv_predicate__msg[5] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[5] ),
    .send_out__en( fu__send_out__en[5] ),
    .send_out__msg( fu__send_out__msg[5] ),
    .send_out__rdy( fu__send_out__rdy[5] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[5] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[5] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[5] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[5] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[5] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[5] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[5] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[5] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[5] )
  );

  SeqMulAdderRTL__cf54288ae5eea774 fu__6
  (
    .clk( fu__clk[6] ),
    .initial_carry_in( fu__initial_carry_in[6] ),
    .initial_carry_out( fu__initial_carry_out[6] ),
    .recv_in_count( fu__recv_in_count[6] ),
    .reset( fu__reset[6] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[6] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[6] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[6] ),
    .recv_const__en( fu__recv_const__en[6] ),
    .recv_const__msg( fu__recv_const__msg[6] ),
    .recv_const__rdy( fu__recv_const__rdy[6] ),
    .recv_in__en( fu__recv_in__en[6] ),
    .recv_in__msg( fu__recv_in__msg[6] ),
    .recv_in__rdy( fu__recv_in__rdy[6] ),
    .recv_opt__en( fu__recv_opt__en[6] ),
    .recv_opt__msg( fu__recv_opt__msg[6] ),
    .recv_opt__rdy( fu__recv_opt__rdy[6] ),
    .recv_predicate__en( fu__recv_predicate__en[6] ),
    .recv_predicate__msg( fu__recv_predicate__msg[6] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[6] ),
    .send_out__en( fu__send_out__en[6] ),
    .send_out__msg( fu__send_out__msg[6] ),
    .send_out__rdy( fu__send_out__rdy[6] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[6] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[6] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[6] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[6] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[6] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[6] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[6] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[6] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[6] )
  );

  RetRTL__cf54288ae5eea774 fu__7
  (
    .clk( fu__clk[7] ),
    .initial_carry_in( fu__initial_carry_in[7] ),
    .initial_carry_out( fu__initial_carry_out[7] ),
    .recv_in_count( fu__recv_in_count[7] ),
    .reset( fu__reset[7] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[7] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[7] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[7] ),
    .recv_const__en( fu__recv_const__en[7] ),
    .recv_const__msg( fu__recv_const__msg[7] ),
    .recv_const__rdy( fu__recv_const__rdy[7] ),
    .recv_in__en( fu__recv_in__en[7] ),
    .recv_in__msg( fu__recv_in__msg[7] ),
    .recv_in__rdy( fu__recv_in__rdy[7] ),
    .recv_opt__en( fu__recv_opt__en[7] ),
    .recv_opt__msg( fu__recv_opt__msg[7] ),
    .recv_opt__rdy( fu__recv_opt__rdy[7] ),
    .recv_predicate__en( fu__recv_predicate__en[7] ),
    .recv_predicate__msg( fu__recv_predicate__msg[7] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[7] ),
    .send_out__en( fu__send_out__en[7] ),
    .send_out__msg( fu__send_out__msg[7] ),
    .send_out__rdy( fu__send_out__rdy[7] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[7] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[7] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[7] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[7] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[7] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[7] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[7] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[7] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[7] )
  );

  MulRTL__cf54288ae5eea774 fu__8
  (
    .clk( fu__clk[8] ),
    .initial_carry_in( fu__initial_carry_in[8] ),
    .initial_carry_out( fu__initial_carry_out[8] ),
    .recv_in_count( fu__recv_in_count[8] ),
    .reset( fu__reset[8] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[8] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[8] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[8] ),
    .recv_const__en( fu__recv_const__en[8] ),
    .recv_const__msg( fu__recv_const__msg[8] ),
    .recv_const__rdy( fu__recv_const__rdy[8] ),
    .recv_in__en( fu__recv_in__en[8] ),
    .recv_in__msg( fu__recv_in__msg[8] ),
    .recv_in__rdy( fu__recv_in__rdy[8] ),
    .recv_opt__en( fu__recv_opt__en[8] ),
    .recv_opt__msg( fu__recv_opt__msg[8] ),
    .recv_opt__rdy( fu__recv_opt__rdy[8] ),
    .recv_predicate__en( fu__recv_predicate__en[8] ),
    .recv_predicate__msg( fu__recv_predicate__msg[8] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[8] ),
    .send_out__en( fu__send_out__en[8] ),
    .send_out__msg( fu__send_out__msg[8] ),
    .send_out__rdy( fu__send_out__rdy[8] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[8] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[8] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[8] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[8] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[8] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[8] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[8] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[8] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[8] )
  );

  LogicRTL__cf54288ae5eea774 fu__9
  (
    .clk( fu__clk[9] ),
    .initial_carry_in( fu__initial_carry_in[9] ),
    .initial_carry_out( fu__initial_carry_out[9] ),
    .recv_in_count( fu__recv_in_count[9] ),
    .reset( fu__reset[9] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[9] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[9] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[9] ),
    .recv_const__en( fu__recv_const__en[9] ),
    .recv_const__msg( fu__recv_const__msg[9] ),
    .recv_const__rdy( fu__recv_const__rdy[9] ),
    .recv_in__en( fu__recv_in__en[9] ),
    .recv_in__msg( fu__recv_in__msg[9] ),
    .recv_in__rdy( fu__recv_in__rdy[9] ),
    .recv_opt__en( fu__recv_opt__en[9] ),
    .recv_opt__msg( fu__recv_opt__msg[9] ),
    .recv_opt__rdy( fu__recv_opt__rdy[9] ),
    .recv_predicate__en( fu__recv_predicate__en[9] ),
    .recv_predicate__msg( fu__recv_predicate__msg[9] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[9] ),
    .send_out__en( fu__send_out__en[9] ),
    .send_out__msg( fu__send_out__msg[9] ),
    .send_out__rdy( fu__send_out__rdy[9] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[9] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[9] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[9] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[9] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[9] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[9] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[9] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[9] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[9] )
  );

  BranchRTL__cf54288ae5eea774 fu__10
  (
    .clk( fu__clk[10] ),
    .initial_carry_in( fu__initial_carry_in[10] ),
    .initial_carry_out( fu__initial_carry_out[10] ),
    .recv_in_count( fu__recv_in_count[10] ),
    .reset( fu__reset[10] ),
    .from_mem_rdata__en( fu__from_mem_rdata__en[10] ),
    .from_mem_rdata__msg( fu__from_mem_rdata__msg[10] ),
    .from_mem_rdata__rdy( fu__from_mem_rdata__rdy[10] ),
    .recv_const__en( fu__recv_const__en[10] ),
    .recv_const__msg( fu__recv_const__msg[10] ),
    .recv_const__rdy( fu__recv_const__rdy[10] ),
    .recv_in__en( fu__recv_in__en[10] ),
    .recv_in__msg( fu__recv_in__msg[10] ),
    .recv_in__rdy( fu__recv_in__rdy[10] ),
    .recv_opt__en( fu__recv_opt__en[10] ),
    .recv_opt__msg( fu__recv_opt__msg[10] ),
    .recv_opt__rdy( fu__recv_opt__rdy[10] ),
    .recv_predicate__en( fu__recv_predicate__en[10] ),
    .recv_predicate__msg( fu__recv_predicate__msg[10] ),
    .recv_predicate__rdy( fu__recv_predicate__rdy[10] ),
    .send_out__en( fu__send_out__en[10] ),
    .send_out__msg( fu__send_out__msg[10] ),
    .send_out__rdy( fu__send_out__rdy[10] ),
    .to_mem_raddr__en( fu__to_mem_raddr__en[10] ),
    .to_mem_raddr__msg( fu__to_mem_raddr__msg[10] ),
    .to_mem_raddr__rdy( fu__to_mem_raddr__rdy[10] ),
    .to_mem_waddr__en( fu__to_mem_waddr__en[10] ),
    .to_mem_waddr__msg( fu__to_mem_waddr__msg[10] ),
    .to_mem_waddr__rdy( fu__to_mem_waddr__rdy[10] ),
    .to_mem_wdata__en( fu__to_mem_wdata__en[10] ),
    .to_mem_wdata__msg( fu__to_mem_wdata__msg[10] ),
    .to_mem_wdata__rdy( fu__to_mem_wdata__rdy[10] )
  );

  //-------------------------------------------------------------
  // End of component fu[0:10]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/fu/flexible/FlexibleFuRTL.py:53
  // @s.update
  // def comb_logic():
  // 
  //   for j in range( num_outports ):
  //     s.send_out[j].en = b1( 0 )
  // 
  //   for i in range( s.fu_list_size ):
  // 
  //     # const connection
  //     s.fu[i].recv_const.msg = s.recv_const.msg
  //     s.fu[i].recv_const.en  = s.recv_const.en
  //     s.recv_const.rdy       = s.recv_const.rdy or s.fu[i].recv_const.rdy
  // 
  //     for j in range( num_inports):
  //       s.fu[i].recv_in_count[j] = s.recv_in_count[j]
  // 
  //     # opt connection
  //     s.fu[i].recv_opt.msg = s.recv_opt.msg
  //     s.fu[i].recv_opt.en  = s.recv_opt.en
  //     s.recv_opt.rdy       = s.fu[i].recv_opt.rdy or s.recv_opt.rdy
  // 
  //     # Note that the predication for a combined FU should be identical/shareable,
  //     # which means the computation in different basic block cannot be combined.
  //     s.fu[i].recv_opt.msg.predicate = s.recv_opt.msg.predicate
  //     s.fu[i].recv_predicate.en      = s.recv_predicate.en
  //     s.recv_predicate.rdy           = s.fu[i].recv_predicate.rdy or s.recv_predicate.rdy
  //     s.fu[i].recv_predicate.msg     = s.recv_predicate.msg
  // 
  //     # send_out connection
  //     for j in range( num_outports ):
  //       if s.fu[i].send_out[j].en:
  //         s.send_out[j].msg     = s.fu[i].send_out[j].msg
  //         s.send_out[j].en      = s.fu[i].send_out[j].en
  //       s.fu[i].send_out[j].rdy = s.send_out[j].rdy
  // 
  // 
  //   for j in range( num_inports ):
  //     s.recv_in[j].rdy = b1( 0 )
  // 
  //   for i in range( s.fu_list_size ):
  //     # recv_in connection
  //     for j in range( num_inports ):
  //       s.fu[i].recv_in[j].msg = s.recv_in[j].msg
  //       s.fu[i].recv_in[j].en  = s.recv_in[j].en
  //       s.recv_in[j].rdy       = s.fu[i].recv_in[j].rdy or s.recv_in[j].rdy
  
  always_comb begin : comb_logic
    for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 )
      send_out__en[j] = 1'd0;
    for ( int i = 0; i < fu_list_size; i += 1 ) begin
      fu__recv_const__msg[i] = recv_const__msg;
      fu__recv_const__en[i] = recv_const__en;
      recv_const__rdy = recv_const__rdy || fu__recv_const__rdy[i];
      for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 )
        fu__recv_in_count[i][j] = recv_in_count[j];
      fu__recv_opt__msg[i] = recv_opt__msg;
      fu__recv_opt__en[i] = recv_opt__en;
      recv_opt__rdy = fu__recv_opt__rdy[i] || recv_opt__rdy;
      fu__recv_opt__msg[i].predicate = recv_opt__msg.predicate;
      fu__recv_predicate__en[i] = recv_predicate__en;
      recv_predicate__rdy = fu__recv_predicate__rdy[i] || recv_predicate__rdy;
      fu__recv_predicate__msg[i] = recv_predicate__msg;
      for ( int j = 0; j < __const__num_outports_at_comb_logic; j += 1 ) begin
        if ( fu__send_out__en[i][j] ) begin
          send_out__msg[j] = fu__send_out__msg[i][j];
          send_out__en[j] = fu__send_out__en[i][j];
        end
        fu__send_out__rdy[i][j] = send_out__rdy[j];
      end
    end
    for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 )
      recv_in__rdy[j] = 1'd0;
    for ( int i = 0; i < fu_list_size; i += 1 )
      for ( int j = 0; j < __const__num_inports_at_comb_logic; j += 1 ) begin
        fu__recv_in__msg[i][j] = recv_in__msg[j];
        fu__recv_in__en[i][j] = recv_in__en[j];
        recv_in__rdy[j] = fu__recv_in__rdy[i][j] || recv_in__rdy[j];
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
  assign to_mem_raddr__en[0] = fu__to_mem_raddr__en[0];
  assign to_mem_raddr__msg[0] = fu__to_mem_raddr__msg[0];
  assign fu__to_mem_raddr__rdy[0] = to_mem_raddr__rdy[0];
  assign fu__from_mem_rdata__en[0] = from_mem_rdata__en[0];
  assign fu__from_mem_rdata__msg[0] = from_mem_rdata__msg[0];
  assign from_mem_rdata__rdy[0] = fu__from_mem_rdata__rdy[0];
  assign to_mem_waddr__en[0] = fu__to_mem_waddr__en[0];
  assign to_mem_waddr__msg[0] = fu__to_mem_waddr__msg[0];
  assign fu__to_mem_waddr__rdy[0] = to_mem_waddr__rdy[0];
  assign to_mem_wdata__en[0] = fu__to_mem_wdata__en[0];
  assign to_mem_wdata__msg[0] = fu__to_mem_wdata__msg[0];
  assign fu__to_mem_wdata__rdy[0] = to_mem_wdata__rdy[0];
  assign to_mem_raddr__en[1] = fu__to_mem_raddr__en[1];
  assign to_mem_raddr__msg[1] = fu__to_mem_raddr__msg[1];
  assign fu__to_mem_raddr__rdy[1] = to_mem_raddr__rdy[1];
  assign fu__from_mem_rdata__en[1] = from_mem_rdata__en[1];
  assign fu__from_mem_rdata__msg[1] = from_mem_rdata__msg[1];
  assign from_mem_rdata__rdy[1] = fu__from_mem_rdata__rdy[1];
  assign to_mem_waddr__en[1] = fu__to_mem_waddr__en[1];
  assign to_mem_waddr__msg[1] = fu__to_mem_waddr__msg[1];
  assign fu__to_mem_waddr__rdy[1] = to_mem_waddr__rdy[1];
  assign to_mem_wdata__en[1] = fu__to_mem_wdata__en[1];
  assign to_mem_wdata__msg[1] = fu__to_mem_wdata__msg[1];
  assign fu__to_mem_wdata__rdy[1] = to_mem_wdata__rdy[1];
  assign to_mem_raddr__en[2] = fu__to_mem_raddr__en[2];
  assign to_mem_raddr__msg[2] = fu__to_mem_raddr__msg[2];
  assign fu__to_mem_raddr__rdy[2] = to_mem_raddr__rdy[2];
  assign fu__from_mem_rdata__en[2] = from_mem_rdata__en[2];
  assign fu__from_mem_rdata__msg[2] = from_mem_rdata__msg[2];
  assign from_mem_rdata__rdy[2] = fu__from_mem_rdata__rdy[2];
  assign to_mem_waddr__en[2] = fu__to_mem_waddr__en[2];
  assign to_mem_waddr__msg[2] = fu__to_mem_waddr__msg[2];
  assign fu__to_mem_waddr__rdy[2] = to_mem_waddr__rdy[2];
  assign to_mem_wdata__en[2] = fu__to_mem_wdata__en[2];
  assign to_mem_wdata__msg[2] = fu__to_mem_wdata__msg[2];
  assign fu__to_mem_wdata__rdy[2] = to_mem_wdata__rdy[2];
  assign to_mem_raddr__en[3] = fu__to_mem_raddr__en[3];
  assign to_mem_raddr__msg[3] = fu__to_mem_raddr__msg[3];
  assign fu__to_mem_raddr__rdy[3] = to_mem_raddr__rdy[3];
  assign fu__from_mem_rdata__en[3] = from_mem_rdata__en[3];
  assign fu__from_mem_rdata__msg[3] = from_mem_rdata__msg[3];
  assign from_mem_rdata__rdy[3] = fu__from_mem_rdata__rdy[3];
  assign to_mem_waddr__en[3] = fu__to_mem_waddr__en[3];
  assign to_mem_waddr__msg[3] = fu__to_mem_waddr__msg[3];
  assign fu__to_mem_waddr__rdy[3] = to_mem_waddr__rdy[3];
  assign to_mem_wdata__en[3] = fu__to_mem_wdata__en[3];
  assign to_mem_wdata__msg[3] = fu__to_mem_wdata__msg[3];
  assign fu__to_mem_wdata__rdy[3] = to_mem_wdata__rdy[3];
  assign to_mem_raddr__en[4] = fu__to_mem_raddr__en[4];
  assign to_mem_raddr__msg[4] = fu__to_mem_raddr__msg[4];
  assign fu__to_mem_raddr__rdy[4] = to_mem_raddr__rdy[4];
  assign fu__from_mem_rdata__en[4] = from_mem_rdata__en[4];
  assign fu__from_mem_rdata__msg[4] = from_mem_rdata__msg[4];
  assign from_mem_rdata__rdy[4] = fu__from_mem_rdata__rdy[4];
  assign to_mem_waddr__en[4] = fu__to_mem_waddr__en[4];
  assign to_mem_waddr__msg[4] = fu__to_mem_waddr__msg[4];
  assign fu__to_mem_waddr__rdy[4] = to_mem_waddr__rdy[4];
  assign to_mem_wdata__en[4] = fu__to_mem_wdata__en[4];
  assign to_mem_wdata__msg[4] = fu__to_mem_wdata__msg[4];
  assign fu__to_mem_wdata__rdy[4] = to_mem_wdata__rdy[4];
  assign to_mem_raddr__en[5] = fu__to_mem_raddr__en[5];
  assign to_mem_raddr__msg[5] = fu__to_mem_raddr__msg[5];
  assign fu__to_mem_raddr__rdy[5] = to_mem_raddr__rdy[5];
  assign fu__from_mem_rdata__en[5] = from_mem_rdata__en[5];
  assign fu__from_mem_rdata__msg[5] = from_mem_rdata__msg[5];
  assign from_mem_rdata__rdy[5] = fu__from_mem_rdata__rdy[5];
  assign to_mem_waddr__en[5] = fu__to_mem_waddr__en[5];
  assign to_mem_waddr__msg[5] = fu__to_mem_waddr__msg[5];
  assign fu__to_mem_waddr__rdy[5] = to_mem_waddr__rdy[5];
  assign to_mem_wdata__en[5] = fu__to_mem_wdata__en[5];
  assign to_mem_wdata__msg[5] = fu__to_mem_wdata__msg[5];
  assign fu__to_mem_wdata__rdy[5] = to_mem_wdata__rdy[5];
  assign to_mem_raddr__en[6] = fu__to_mem_raddr__en[6];
  assign to_mem_raddr__msg[6] = fu__to_mem_raddr__msg[6];
  assign fu__to_mem_raddr__rdy[6] = to_mem_raddr__rdy[6];
  assign fu__from_mem_rdata__en[6] = from_mem_rdata__en[6];
  assign fu__from_mem_rdata__msg[6] = from_mem_rdata__msg[6];
  assign from_mem_rdata__rdy[6] = fu__from_mem_rdata__rdy[6];
  assign to_mem_waddr__en[6] = fu__to_mem_waddr__en[6];
  assign to_mem_waddr__msg[6] = fu__to_mem_waddr__msg[6];
  assign fu__to_mem_waddr__rdy[6] = to_mem_waddr__rdy[6];
  assign to_mem_wdata__en[6] = fu__to_mem_wdata__en[6];
  assign to_mem_wdata__msg[6] = fu__to_mem_wdata__msg[6];
  assign fu__to_mem_wdata__rdy[6] = to_mem_wdata__rdy[6];
  assign to_mem_raddr__en[7] = fu__to_mem_raddr__en[7];
  assign to_mem_raddr__msg[7] = fu__to_mem_raddr__msg[7];
  assign fu__to_mem_raddr__rdy[7] = to_mem_raddr__rdy[7];
  assign fu__from_mem_rdata__en[7] = from_mem_rdata__en[7];
  assign fu__from_mem_rdata__msg[7] = from_mem_rdata__msg[7];
  assign from_mem_rdata__rdy[7] = fu__from_mem_rdata__rdy[7];
  assign to_mem_waddr__en[7] = fu__to_mem_waddr__en[7];
  assign to_mem_waddr__msg[7] = fu__to_mem_waddr__msg[7];
  assign fu__to_mem_waddr__rdy[7] = to_mem_waddr__rdy[7];
  assign to_mem_wdata__en[7] = fu__to_mem_wdata__en[7];
  assign to_mem_wdata__msg[7] = fu__to_mem_wdata__msg[7];
  assign fu__to_mem_wdata__rdy[7] = to_mem_wdata__rdy[7];
  assign to_mem_raddr__en[8] = fu__to_mem_raddr__en[8];
  assign to_mem_raddr__msg[8] = fu__to_mem_raddr__msg[8];
  assign fu__to_mem_raddr__rdy[8] = to_mem_raddr__rdy[8];
  assign fu__from_mem_rdata__en[8] = from_mem_rdata__en[8];
  assign fu__from_mem_rdata__msg[8] = from_mem_rdata__msg[8];
  assign from_mem_rdata__rdy[8] = fu__from_mem_rdata__rdy[8];
  assign to_mem_waddr__en[8] = fu__to_mem_waddr__en[8];
  assign to_mem_waddr__msg[8] = fu__to_mem_waddr__msg[8];
  assign fu__to_mem_waddr__rdy[8] = to_mem_waddr__rdy[8];
  assign to_mem_wdata__en[8] = fu__to_mem_wdata__en[8];
  assign to_mem_wdata__msg[8] = fu__to_mem_wdata__msg[8];
  assign fu__to_mem_wdata__rdy[8] = to_mem_wdata__rdy[8];
  assign to_mem_raddr__en[9] = fu__to_mem_raddr__en[9];
  assign to_mem_raddr__msg[9] = fu__to_mem_raddr__msg[9];
  assign fu__to_mem_raddr__rdy[9] = to_mem_raddr__rdy[9];
  assign fu__from_mem_rdata__en[9] = from_mem_rdata__en[9];
  assign fu__from_mem_rdata__msg[9] = from_mem_rdata__msg[9];
  assign from_mem_rdata__rdy[9] = fu__from_mem_rdata__rdy[9];
  assign to_mem_waddr__en[9] = fu__to_mem_waddr__en[9];
  assign to_mem_waddr__msg[9] = fu__to_mem_waddr__msg[9];
  assign fu__to_mem_waddr__rdy[9] = to_mem_waddr__rdy[9];
  assign to_mem_wdata__en[9] = fu__to_mem_wdata__en[9];
  assign to_mem_wdata__msg[9] = fu__to_mem_wdata__msg[9];
  assign fu__to_mem_wdata__rdy[9] = to_mem_wdata__rdy[9];
  assign to_mem_raddr__en[10] = fu__to_mem_raddr__en[10];
  assign to_mem_raddr__msg[10] = fu__to_mem_raddr__msg[10];
  assign fu__to_mem_raddr__rdy[10] = to_mem_raddr__rdy[10];
  assign fu__from_mem_rdata__en[10] = from_mem_rdata__en[10];
  assign fu__from_mem_rdata__msg[10] = from_mem_rdata__msg[10];
  assign from_mem_rdata__rdy[10] = fu__from_mem_rdata__rdy[10];
  assign to_mem_waddr__en[10] = fu__to_mem_waddr__en[10];
  assign to_mem_waddr__msg[10] = fu__to_mem_waddr__msg[10];
  assign fu__to_mem_waddr__rdy[10] = to_mem_waddr__rdy[10];
  assign to_mem_wdata__en[10] = fu__to_mem_wdata__en[10];
  assign to_mem_wdata__msg[10] = fu__to_mem_wdata__msg[10];
  assign fu__to_mem_wdata__rdy[10] = to_mem_wdata__rdy[10];

endmodule