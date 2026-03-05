module RegEnRst__Type_Bits32__reset_value_1
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] en ,
  input  logic [31:0] in_ ,
  output logic [31:0] out ,
  input  logic [0:0] reset 
);
  localparam logic [0:0] __const__reset_value_at_up_regenrst  = 1'd1;

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/registers.py:55
  // @update_ff
  // def up_regenrst():
  //   if s.reset: s.out <<= reset_value
  //   elif s.en:  s.out <<= s.in_
  
  always_ff @(posedge clk) begin : up_regenrst
    if ( reset ) begin
      out <= 32'( __const__reset_value_at_up_regenrst );
    end
    else if ( en ) begin
      out <= in_;
    end
  end

endmodule