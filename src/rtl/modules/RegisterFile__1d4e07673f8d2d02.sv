module RegisterFile__1d4e07673f8d2d02
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [2:0] raddr [0:0],
  output CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f rdata [0:0],
  input  logic [0:0] reset ,
  input  logic [2:0] waddr [0:0],
  input  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f wdata [0:0],
  input  logic [0:0] wen [0:0]
);
  localparam logic [0:0] __const__rd_ports_at_up_rf_read  = 1'd1;
  localparam logic [0:0] __const__wr_ports_at_up_rf_write  = 1'd1;
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f regs [0:7];

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/register_files.py:20
  // @update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] @= s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int unsigned i = 1'd0; i < 1'( __const__rd_ports_at_up_rf_read ); i += 1'd1 )
      rdata[1'(i)] = regs[raddr[1'(i)]];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/register_files.py:32
  // @update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int unsigned i = 1'd0; i < 1'( __const__wr_ports_at_up_rf_write ); i += 1'd1 )
      if ( wen[1'(i)] ) begin
        regs[waddr[1'(i)]] <= wdata[1'(i)];
      end
  end

endmodule