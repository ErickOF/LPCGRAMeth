module LinkOrRTL__a54ca58e7852ace8
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_fu__msg  ,
  output logic [0:0] recv_fu__rdy  ,
  input logic [0:0] recv_fu__val  ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_xbar__msg  ,
  output logic [0:0] recv_xbar__rdy  ,
  input logic [0:0] recv_xbar__val  ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/LinkOrRTL.py:28
  // @update
  // def process():
  //   # Initializes the delivered message.
  //   s.send.msg @= DataType()
  // 
  //   # The messages from two sources (i.e., xbar and FU) won't be valid
  //   # simultaneously (confliction would be caused if they both are valid),
  //   # which is guaranteed by the compiler/software.
  //   s.send.msg.predicate @= s.recv_fu.msg.predicate | s.recv_xbar.msg.predicate
  //   s.send.msg.payload @= s.recv_xbar.msg.payload | s.recv_fu.msg.payload
  // 
  //   # FIXME: bypass won't be necessary any more with separate xbar design.
  //   # s.send.msg.bypass @= 0
  //   # s.send.msg.delay @= s.recv_fu.msg.delay | s.recv_xbar.msg.delay
  // 
  //   # s.send.val @= s.send.rdy & (s.recv_fu.val | s.recv_xbar.val)
  //   s.send.val @= s.recv_fu.val | s.recv_xbar.val
  //   s.recv_fu.rdy @= s.send.rdy
  //   s.recv_xbar.rdy @= s.send.rdy
  
  always_comb begin : process
    send__msg = { 32'd0, 1'd0, 1'd0, 1'd0 };
    send__msg.predicate = recv_fu__msg.predicate | recv_xbar__msg.predicate;
    send__msg.payload = recv_xbar__msg.payload | recv_fu__msg.payload;
    send__val = recv_fu__val | recv_xbar__val;
    recv_fu__rdy = send__rdy;
    recv_xbar__rdy = send__rdy;
  end

endmodule