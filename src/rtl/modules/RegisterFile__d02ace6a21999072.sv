module RegisterFile__d02ace6a21999072
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] raddr [0:0],
  output IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d rdata [0:0],
  input  logic [0:0] reset ,
  input  logic [0:0] waddr [0:0],
  input  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d wdata [0:0],
  input  logic [0:0] wen [0:0]
);
  localparam logic [0:0] __const__rd_ports_at_up_rf_read  = 1'd1;
  localparam logic [0:0] __const__wr_ports_at_up_rf_write  = 1'd1;
  IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d regs [0:1];

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