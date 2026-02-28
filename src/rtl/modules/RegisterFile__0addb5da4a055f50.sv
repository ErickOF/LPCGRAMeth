module RegisterFile__0addb5da4a055f50
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] raddr [0:0],
  output MemAccessPacket_3_32_512__62fa6e6064d885d7 rdata [0:0],
  input  logic [0:0] reset ,
  input  logic [0:0] waddr [0:0],
  input  MemAccessPacket_3_32_512__62fa6e6064d885d7 wdata [0:0],
  input  logic [0:0] wen [0:0]
);
  localparam logic [0:0] __const__rd_ports_at_up_rf_read  = 1'd1;
  localparam logic [0:0] __const__wr_ports_at_up_rf_write  = 1'd1;
  MemAccessPacket_3_32_512__62fa6e6064d885d7 regs [0:1];

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