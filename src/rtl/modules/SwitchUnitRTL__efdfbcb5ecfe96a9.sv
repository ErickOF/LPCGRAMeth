module SwitchUnitRTL__efdfbcb5ecfe96a9
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_32_3_512__0e5e373c0405ceef recv__msg [0:31] ,
  output logic [0:0] recv__rdy [0:31] ,
  input logic [0:0] recv__val [0:31] ,
  output MemAccessPacket_32_3_512__0e5e373c0405ceef send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [5:0] __const__num_inports_at_up_get_en  = 6'd32;
  //-------------------------------------------------------------
  // Component arbiter
  //-------------------------------------------------------------

  logic [0:0] arbiter__clk;
  logic [0:0] arbiter__en;
  logic [31:0] arbiter__grants;
  logic [31:0] arbiter__reqs;
  logic [0:0] arbiter__reset;

  RoundRobinArbiterEn__nreqs_32 arbiter
  (
    .clk( arbiter__clk ),
    .en( arbiter__en ),
    .grants( arbiter__grants ),
    .reqs( arbiter__reqs ),
    .reset( arbiter__reset )
  );

  //-------------------------------------------------------------
  // End of component arbiter
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component encoder
  //-------------------------------------------------------------

  logic [0:0] encoder__clk;
  logic [31:0] encoder__in_;
  logic [4:0] encoder__out;
  logic [0:0] encoder__reset;

  Encoder__in_nbits_32__out_nbits_5 encoder
  (
    .clk( encoder__clk ),
    .in_( encoder__in_ ),
    .out( encoder__out ),
    .reset( encoder__reset )
  );

  //-------------------------------------------------------------
  // End of component encoder
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component mux
  //-------------------------------------------------------------

  logic [0:0] mux__clk;
  MemAccessPacket_32_3_512__0e5e373c0405ceef mux__in_ [0:31];
  MemAccessPacket_32_3_512__0e5e373c0405ceef mux__out;
  logic [0:0] mux__reset;
  logic [4:0] mux__sel;

  Mux__c22975805c9abe20 mux
  (
    .clk( mux__clk ),
    .in_( mux__in_ ),
    .out( mux__out ),
    .reset( mux__reset ),
    .sel( mux__sel )
  );

  //-------------------------------------------------------------
  // End of component mux
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/SwitchUnitRTL.py:56
  // @update
  // def up_get_en():
  //   for i in range( num_inports ):
  //     s.recv[i].rdy @= s.send.rdy & ( s.mux.sel == i )
  
  always_comb begin : up_get_en
    for ( int unsigned i = 1'd0; i < 6'( __const__num_inports_at_up_get_en ); i += 1'd1 )
      recv__rdy[5'(i)] = send__rdy & ( mux__sel == 5'(i) );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/SwitchUnitRTL.py:51
  // @update
  // def up_send_val():
  //   s.send.val @= s.arbiter.grants > 0
  
  always_comb begin : up_send_val
    send__val = arbiter__grants > 32'd0;
  end

  assign arbiter__clk = clk;
  assign arbiter__reset = reset;
  assign arbiter__en = 1'd1;
  assign mux__clk = clk;
  assign mux__reset = reset;
  assign send__msg = mux__out;
  assign encoder__clk = clk;
  assign encoder__reset = reset;
  assign encoder__in_ = arbiter__grants;
  assign mux__sel = encoder__out;
  assign arbiter__reqs[0:0] = recv__val[0];
  assign mux__in_[0] = recv__msg[0];
  assign arbiter__reqs[1:1] = recv__val[1];
  assign mux__in_[1] = recv__msg[1];
  assign arbiter__reqs[2:2] = recv__val[2];
  assign mux__in_[2] = recv__msg[2];
  assign arbiter__reqs[3:3] = recv__val[3];
  assign mux__in_[3] = recv__msg[3];
  assign arbiter__reqs[4:4] = recv__val[4];
  assign mux__in_[4] = recv__msg[4];
  assign arbiter__reqs[5:5] = recv__val[5];
  assign mux__in_[5] = recv__msg[5];
  assign arbiter__reqs[6:6] = recv__val[6];
  assign mux__in_[6] = recv__msg[6];
  assign arbiter__reqs[7:7] = recv__val[7];
  assign mux__in_[7] = recv__msg[7];
  assign arbiter__reqs[8:8] = recv__val[8];
  assign mux__in_[8] = recv__msg[8];
  assign arbiter__reqs[9:9] = recv__val[9];
  assign mux__in_[9] = recv__msg[9];
  assign arbiter__reqs[10:10] = recv__val[10];
  assign mux__in_[10] = recv__msg[10];
  assign arbiter__reqs[11:11] = recv__val[11];
  assign mux__in_[11] = recv__msg[11];
  assign arbiter__reqs[12:12] = recv__val[12];
  assign mux__in_[12] = recv__msg[12];
  assign arbiter__reqs[13:13] = recv__val[13];
  assign mux__in_[13] = recv__msg[13];
  assign arbiter__reqs[14:14] = recv__val[14];
  assign mux__in_[14] = recv__msg[14];
  assign arbiter__reqs[15:15] = recv__val[15];
  assign mux__in_[15] = recv__msg[15];
  assign arbiter__reqs[16:16] = recv__val[16];
  assign mux__in_[16] = recv__msg[16];
  assign arbiter__reqs[17:17] = recv__val[17];
  assign mux__in_[17] = recv__msg[17];
  assign arbiter__reqs[18:18] = recv__val[18];
  assign mux__in_[18] = recv__msg[18];
  assign arbiter__reqs[19:19] = recv__val[19];
  assign mux__in_[19] = recv__msg[19];
  assign arbiter__reqs[20:20] = recv__val[20];
  assign mux__in_[20] = recv__msg[20];
  assign arbiter__reqs[21:21] = recv__val[21];
  assign mux__in_[21] = recv__msg[21];
  assign arbiter__reqs[22:22] = recv__val[22];
  assign mux__in_[22] = recv__msg[22];
  assign arbiter__reqs[23:23] = recv__val[23];
  assign mux__in_[23] = recv__msg[23];
  assign arbiter__reqs[24:24] = recv__val[24];
  assign mux__in_[24] = recv__msg[24];
  assign arbiter__reqs[25:25] = recv__val[25];
  assign mux__in_[25] = recv__msg[25];
  assign arbiter__reqs[26:26] = recv__val[26];
  assign mux__in_[26] = recv__msg[26];
  assign arbiter__reqs[27:27] = recv__val[27];
  assign mux__in_[27] = recv__msg[27];
  assign arbiter__reqs[28:28] = recv__val[28];
  assign mux__in_[28] = recv__msg[28];
  assign arbiter__reqs[29:29] = recv__val[29];
  assign mux__in_[29] = recv__msg[29];
  assign arbiter__reqs[30:30] = recv__val[30];
  assign mux__in_[30] = recv__msg[30];
  assign arbiter__reqs[31:31] = recv__val[31];
  assign mux__in_[31] = recv__msg[31];

endmodule