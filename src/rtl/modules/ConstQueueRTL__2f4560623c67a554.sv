module ConstQueueRTL__2f4560623c67a554
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  output logic [0:0] send_const__en,
  output CGRAData_32_1_1 send_const__msg,
  input logic [0:0] send_const__rdy
);
  localparam CGRAData_32_1_1 const_queue [0:0] = '{ { 32'd0, 1'd0, 1'd0 } };
  localparam logic [31:0] __const__num_const_at_update_raddr = 32'd1;
  logic [0:0] cur ;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueRTL.py:37
  // @s.update
  // def load():
  //   s.send_const.msg = s.const_queue[ s.cur ]
  
  always_comb begin : load
    send_const__msg = const_queue[cur];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueRTL.py:41
  // @s.update
  // def update_en():
  //   s.send_const.en = s.send_const.rdy
  
  always_comb begin : update_en
    send_const__en = send_const__rdy;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/const/ConstQueueRTL.py:45
  // @s.update_ff
  // def update_raddr():
  //   if s.send_const.rdy:
  //     if s.cur + AddrType( 1 )  >= AddrType( num_const ):
  //       s.cur <<= AddrType( 0 )
  //     else:
  //       s.cur <<= s.cur + AddrType( 1 )
  
  always_ff @(posedge clk) begin : update_raddr
    if ( send_const__rdy ) begin
      if ( ( cur + 1'd1 ) >= 1'd1 ) begin
        cur <= 1'd0;
      end
      else
        cur <= cur + 1'd1;
    end
  end

endmodule