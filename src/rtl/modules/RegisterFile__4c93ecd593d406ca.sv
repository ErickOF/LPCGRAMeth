module RegisterFile__4c93ecd593d406ca
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [2:0] raddr [0:0],
  output CGRAConfig_6_4_10_12 rdata [0:0],
  input logic [0:0] reset,
  input logic [2:0] waddr [0:0],
  input CGRAConfig_6_4_10_12 wdata [0:0],
  input logic [0:0] wen [0:0]
);
  localparam logic [31:0] __const__rd_ports_at_up_rf_read = 32'd1;
  localparam logic [31:0] __const__wr_ports_at_up_rf_write = 32'd1;
  CGRAConfig_6_4_10_12 regs [0:7] ;

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:20
  // @s.update
  // def up_rf_read():
  //   for i in range( rd_ports ):
  //     s.rdata[i] = s.regs[ s.raddr[i] ]
  
  always_comb begin : up_rf_read
    for ( int i = 0; i < __const__rd_ports_at_up_rf_read; i += 1 )
      rdata[i] = regs[raddr[i]];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/RegisterFile.py:32
  // @s.update_ff
  // def up_rf_write():
  //   for i in range( wr_ports ):
  //     if s.wen[i]:
  //       s.regs[ s.waddr[i] ] <<= s.wdata[i]
  
  always_ff @(posedge clk) begin : up_rf_write
    for ( int i = 0; i < __const__wr_ports_at_up_rf_write; i += 1 )
      if ( wen[i] ) begin
        regs[waddr[i]] <= wdata[i];
      end
  end

endmodule