module SwitchUnitRTL__51ac93e9c686b5af
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_3_32_512__62fa6e6064d885d7 recv__msg [0:2] ,
  output logic [0:0] recv__rdy [0:2] ,
  input logic [0:0] recv__val [0:2] ,
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [1:0] __const__num_inports_at_up_get_en  = 2'd3;
  //-------------------------------------------------------------
  // Component arbiter
  //-------------------------------------------------------------

  logic [0:0] arbiter__clk;
  logic [0:0] arbiter__en;
  logic [2:0] arbiter__grants;
  logic [2:0] arbiter__reqs;
  logic [0:0] arbiter__reset;

  RoundRobinArbiterEn__nreqs_3 arbiter
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
  logic [2:0] encoder__in_;
  logic [1:0] encoder__out;
  logic [0:0] encoder__reset;

  Encoder__in_nbits_3__out_nbits_2 encoder
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
  MemAccessPacket_3_32_512__62fa6e6064d885d7 mux__in_ [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 mux__out;
  logic [0:0] mux__reset;
  logic [1:0] mux__sel;

  Mux__Type_MemAccessPacket_3_32_512__62fa6e6064d885d7__ninputs_3 mux
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
    for ( int unsigned i = 1'd0; i < 2'( __const__num_inports_at_up_get_en ); i += 1'd1 )
      recv__rdy[2'(i)] = send__rdy & ( mux__sel == 2'(i) );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/router/SwitchUnitRTL.py:51
  // @update
  // def up_send_val():
  //   s.send.val @= s.arbiter.grants > 0
  
  always_comb begin : up_send_val
    send__val = arbiter__grants > 3'd0;
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

endmodule