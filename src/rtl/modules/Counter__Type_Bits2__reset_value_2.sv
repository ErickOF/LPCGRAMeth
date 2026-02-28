module Counter__Type_Bits2__reset_value_2
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  output logic [1:0] count ,
  input  logic [0:0] decr ,
  input  logic [0:0] incr ,
  input  logic [0:0] load ,
  input  logic [1:0] load_value ,
  input  logic [0:0] reset 
);
  localparam logic [1:0] __const__reset_value_at_up_count  = 2'd2;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/noc/PyOCN/pymtl3_net/ocnlib/rtl/Counter.py:28
  // @update_ff
  // def up_count():
  // 
  //   if s.reset:
  //     s.count <<= reset_value
  // 
  //   elif s.load:
  //     s.count <<= s.load_value
  // 
  //   elif s.incr & ~s.decr:
  //     s.count <<= s.count + 1
  // 
  //   elif ~s.incr & s.decr:
  //     s.count <<= s.count - 1
  
  always_ff @(posedge clk) begin : up_count
    if ( reset ) begin
      count <= 2'( __const__reset_value_at_up_count );
    end
    else if ( load ) begin
      count <= load_value;
    end
    else if ( incr & ( ~decr ) ) begin
      count <= count + 2'd1;
    end
    else if ( ( ~incr ) & decr ) begin
      count <= count - 2'd1;
    end
  end

endmodule