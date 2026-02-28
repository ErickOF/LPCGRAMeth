module SwitchUnitRTL__559e235c7e27ff40
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c recv__msg [0:5] ,
  output logic [0:0] recv__rdy [0:5] ,
  input logic [0:0] recv__val [0:5] ,
  output IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [2:0] __const__num_inports_at_up_get_en  = 3'd6;
  //-------------------------------------------------------------
  // Component arbiter
  //-------------------------------------------------------------

  logic [0:0] arbiter__clk;
  logic [0:0] arbiter__en;
  logic [5:0] arbiter__grants;
  logic [5:0] arbiter__reqs;
  logic [0:0] arbiter__reset;

  RoundRobinArbiterEn__nreqs_6 arbiter
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
  logic [5:0] encoder__in_;
  logic [2:0] encoder__out;
  logic [0:0] encoder__reset;

  Encoder__in_nbits_6__out_nbits_3 encoder
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
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c mux__in_ [0:5];
  IntraCgraPacket_4_4x1_4_8_2_CgraPayload__11cd3f8c0d91825c mux__out;
  logic [0:0] mux__reset;
  logic [2:0] mux__sel;

  Mux__8c935bf8b6adc0e3 mux
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
    for ( int unsigned i = 1'd0; i < 3'( __const__num_inports_at_up_get_en ); i += 1'd1 )
      recv__rdy[3'(i)] = send__rdy & ( mux__sel == 3'(i) );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/SwitchUnitRTL.py:51
  // @update
  // def up_send_val():
  //   s.send.val @= s.arbiter.grants > 0
  
  always_comb begin : up_send_val
    send__val = arbiter__grants > 6'd0;
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

endmodule