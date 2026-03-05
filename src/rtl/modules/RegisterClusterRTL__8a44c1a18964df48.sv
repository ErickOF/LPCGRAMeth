module RegisterClusterRTL__8a44c1a18964df48
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f inport_opt ,
  input  logic [0:0] reset ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data_from_const__msg [0:3] ,
  output logic [0:0] recv_data_from_const__rdy [0:3] ,
  input logic [0:0] recv_data_from_const__val [0:3] ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data_from_fu_crossbar__msg [0:3] ,
  output logic [0:0] recv_data_from_fu_crossbar__rdy [0:3] ,
  input logic [0:0] recv_data_from_fu_crossbar__val [0:3] ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_data_from_routing_crossbar__msg [0:3] ,
  output logic [0:0] recv_data_from_routing_crossbar__rdy [0:3] ,
  input logic [0:0] recv_data_from_routing_crossbar__val [0:3] ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_data_to_fu__msg [0:3] ,
  input logic [0:0] send_data_to_fu__rdy [0:3] ,
  output logic [0:0] send_data_to_fu__val [0:3] 
);
  localparam logic [2:0] __const__num_reg_banks_at_update_msgs_signals  = 3'd4;
  //-------------------------------------------------------------
  // Component reg_bank[0:3]
  //-------------------------------------------------------------

  logic [0:0] reg_bank__clk [0:3];
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f reg_bank__inport_opt [0:3];
  logic [0:0] reg_bank__inport_valid [0:3][0:2];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_bank__inport_wdata [0:3][0:2];
  logic [0:0] reg_bank__reset [0:3];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_bank__send_data_to_fu__msg [0:3];
  logic [0:0] reg_bank__send_data_to_fu__rdy [0:3];
  logic [0:0] reg_bank__send_data_to_fu__val [0:3];

  RegisterBankRTL__875c77c0f9073b7c reg_bank__0
  (
    .clk( reg_bank__clk[0] ),
    .inport_opt( reg_bank__inport_opt[0] ),
    .inport_valid( reg_bank__inport_valid[0] ),
    .inport_wdata( reg_bank__inport_wdata[0] ),
    .reset( reg_bank__reset[0] ),
    .send_data_to_fu__msg( reg_bank__send_data_to_fu__msg[0] ),
    .send_data_to_fu__rdy( reg_bank__send_data_to_fu__rdy[0] ),
    .send_data_to_fu__val( reg_bank__send_data_to_fu__val[0] )
  );

  RegisterBankRTL__e5fa866620bad084 reg_bank__1
  (
    .clk( reg_bank__clk[1] ),
    .inport_opt( reg_bank__inport_opt[1] ),
    .inport_valid( reg_bank__inport_valid[1] ),
    .inport_wdata( reg_bank__inport_wdata[1] ),
    .reset( reg_bank__reset[1] ),
    .send_data_to_fu__msg( reg_bank__send_data_to_fu__msg[1] ),
    .send_data_to_fu__rdy( reg_bank__send_data_to_fu__rdy[1] ),
    .send_data_to_fu__val( reg_bank__send_data_to_fu__val[1] )
  );

  RegisterBankRTL__7af232d7d9d1d953 reg_bank__2
  (
    .clk( reg_bank__clk[2] ),
    .inport_opt( reg_bank__inport_opt[2] ),
    .inport_valid( reg_bank__inport_valid[2] ),
    .inport_wdata( reg_bank__inport_wdata[2] ),
    .reset( reg_bank__reset[2] ),
    .send_data_to_fu__msg( reg_bank__send_data_to_fu__msg[2] ),
    .send_data_to_fu__rdy( reg_bank__send_data_to_fu__rdy[2] ),
    .send_data_to_fu__val( reg_bank__send_data_to_fu__val[2] )
  );

  RegisterBankRTL__01c957f3d2dd8862 reg_bank__3
  (
    .clk( reg_bank__clk[3] ),
    .inport_opt( reg_bank__inport_opt[3] ),
    .inport_valid( reg_bank__inport_valid[3] ),
    .inport_wdata( reg_bank__inport_wdata[3] ),
    .reset( reg_bank__reset[3] ),
    .send_data_to_fu__msg( reg_bank__send_data_to_fu__msg[3] ),
    .send_data_to_fu__rdy( reg_bank__send_data_to_fu__rdy[3] ),
    .send_data_to_fu__val( reg_bank__send_data_to_fu__val[3] )
  );

  //-------------------------------------------------------------
  // End of component reg_bank[0:3]
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/register_cluster/RegisterClusterRTL.py:45
  // @update
  // def update_msgs_signals():
  //   # Initializes signals.
  //   for i in range(num_reg_banks):
  //     s.send_data_to_fu[i].msg @= DataType()
  //     s.recv_data_from_routing_crossbar[i].rdy @= 0
  //     s.recv_data_from_fu_crossbar[i].rdy @= 0
  //     s.recv_data_from_const[i].rdy @= 0
  //     s.send_data_to_fu[i].val @= 0
  // 
  //   for i in range(num_reg_banks):
  //     if s.recv_data_from_routing_crossbar[i].val:
  //       s.send_data_to_fu[i].msg @= \
  //         s.recv_data_from_routing_crossbar[i].msg
  //     else:
  //       s.send_data_to_fu[i].msg @= \
  //         s.reg_bank[i].send_data_to_fu.msg
  // 
  //     s.send_data_to_fu[i].val @= \
  //         s.recv_data_from_routing_crossbar[i].val | \
  //         s.reg_bank[i].send_data_to_fu.val
  //     s.reg_bank[i].send_data_to_fu.rdy @= s.send_data_to_fu[i].rdy
  // 
  //     s.recv_data_from_routing_crossbar[i].rdy @= s.send_data_to_fu[i].rdy
  //     s.recv_data_from_fu_crossbar[i].rdy @= 1
  //     s.recv_data_from_const[i].rdy @= 1
  
  always_comb begin : update_msgs_signals
    for ( int unsigned i = 1'd0; i < 3'( __const__num_reg_banks_at_update_msgs_signals ); i += 1'd1 ) begin
      send_data_to_fu__msg[2'(i)] = { 32'd0, 1'd0, 1'd0, 1'd0 };
      recv_data_from_routing_crossbar__rdy[2'(i)] = 1'd0;
      recv_data_from_fu_crossbar__rdy[2'(i)] = 1'd0;
      recv_data_from_const__rdy[2'(i)] = 1'd0;
      send_data_to_fu__val[2'(i)] = 1'd0;
    end
    for ( int unsigned i = 1'd0; i < 3'( __const__num_reg_banks_at_update_msgs_signals ); i += 1'd1 ) begin
      if ( recv_data_from_routing_crossbar__val[2'(i)] ) begin
        send_data_to_fu__msg[2'(i)] = recv_data_from_routing_crossbar__msg[2'(i)];
      end
      else
        send_data_to_fu__msg[2'(i)] = reg_bank__send_data_to_fu__msg[2'(i)];
      send_data_to_fu__val[2'(i)] = recv_data_from_routing_crossbar__val[2'(i)] | reg_bank__send_data_to_fu__val[2'(i)];
      reg_bank__send_data_to_fu__rdy[2'(i)] = send_data_to_fu__rdy[2'(i)];
      recv_data_from_routing_crossbar__rdy[2'(i)] = send_data_to_fu__rdy[2'(i)];
      recv_data_from_fu_crossbar__rdy[2'(i)] = 1'd1;
      recv_data_from_const__rdy[2'(i)] = 1'd1;
    end
  end

  assign reg_bank__clk[0] = clk;
  assign reg_bank__reset[0] = reset;
  assign reg_bank__clk[1] = clk;
  assign reg_bank__reset[1] = reset;
  assign reg_bank__clk[2] = clk;
  assign reg_bank__reset[2] = reset;
  assign reg_bank__clk[3] = clk;
  assign reg_bank__reset[3] = reset;
  assign reg_bank__inport_opt[0] = inport_opt;
  assign reg_bank__inport_wdata[0][0] = recv_data_from_routing_crossbar__msg[0];
  assign reg_bank__inport_wdata[0][1] = recv_data_from_fu_crossbar__msg[0];
  assign reg_bank__inport_wdata[0][2] = recv_data_from_const__msg[0];
  assign reg_bank__inport_valid[0][0] = recv_data_from_routing_crossbar__val[0];
  assign reg_bank__inport_valid[0][1] = recv_data_from_fu_crossbar__val[0];
  assign reg_bank__inport_valid[0][2] = recv_data_from_const__val[0];
  assign reg_bank__inport_opt[1] = inport_opt;
  assign reg_bank__inport_wdata[1][0] = recv_data_from_routing_crossbar__msg[1];
  assign reg_bank__inport_wdata[1][1] = recv_data_from_fu_crossbar__msg[1];
  assign reg_bank__inport_wdata[1][2] = recv_data_from_const__msg[1];
  assign reg_bank__inport_valid[1][0] = recv_data_from_routing_crossbar__val[1];
  assign reg_bank__inport_valid[1][1] = recv_data_from_fu_crossbar__val[1];
  assign reg_bank__inport_valid[1][2] = recv_data_from_const__val[1];
  assign reg_bank__inport_opt[2] = inport_opt;
  assign reg_bank__inport_wdata[2][0] = recv_data_from_routing_crossbar__msg[2];
  assign reg_bank__inport_wdata[2][1] = recv_data_from_fu_crossbar__msg[2];
  assign reg_bank__inport_wdata[2][2] = recv_data_from_const__msg[2];
  assign reg_bank__inport_valid[2][0] = recv_data_from_routing_crossbar__val[2];
  assign reg_bank__inport_valid[2][1] = recv_data_from_fu_crossbar__val[2];
  assign reg_bank__inport_valid[2][2] = recv_data_from_const__val[2];
  assign reg_bank__inport_opt[3] = inport_opt;
  assign reg_bank__inport_wdata[3][0] = recv_data_from_routing_crossbar__msg[3];
  assign reg_bank__inport_wdata[3][1] = recv_data_from_fu_crossbar__msg[3];
  assign reg_bank__inport_wdata[3][2] = recv_data_from_const__msg[3];
  assign reg_bank__inport_valid[3][0] = recv_data_from_routing_crossbar__val[3];
  assign reg_bank__inport_valid[3][1] = recv_data_from_fu_crossbar__val[3];
  assign reg_bank__inport_valid[3][2] = recv_data_from_const__val[3];

endmodule