module DataMemRTL__16e627fe25c0c2a2
import cgra_pkg::*;
(
  input logic [0:0] clk,
  input logic [0:0] reset,
  input logic [0:0] recv_raddr__en [0:7],
  input logic [0:0] recv_raddr__msg [0:7],
  output logic [0:0] recv_raddr__rdy [0:7],
  input logic [0:0] recv_waddr__en [0:7],
  input logic [0:0] recv_waddr__msg [0:7],
  output logic [0:0] recv_waddr__rdy [0:7],
  input logic [0:0] recv_wdata__en [0:7],
  input CGRAData_32_1_1 recv_wdata__msg [0:7],
  output logic [0:0] recv_wdata__rdy [0:7],
  output logic [0:0] send_rdata__en [0:7],
  output CGRAData_32_1_1 send_rdata__msg [0:7],
  input logic [0:0] send_rdata__rdy [0:7]
);
  localparam logic [31:0] __const__rd_ports_at_update_read_without_init = 32'd8;
  localparam logic [31:0] __const__wr_ports_at_update_read_without_init = 32'd8;
  localparam logic [31:0] __const__rd_ports_at_update_init = 32'd8;
  localparam logic [31:0] __const__wr_ports_at_update_init = 32'd8;
  localparam logic [31:0] __const__rd_ports_at_update_signal = 32'd8;
  localparam logic [31:0] __const__wr_ports_at_update_signal = 32'd8;
  logic [0:0] initWrites [0:1] ;
  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk ;
  logic [0:0] reg_file__raddr [0:7] ;
  CGRAData_32_1_1 reg_file__rdata [0:7] ;
  logic [0:0] reg_file__reset ;
  logic [0:0] reg_file__waddr [0:15] ;
  CGRAData_32_1_1 reg_file__wdata [0:15] ;
  logic [0:0] reg_file__wen [0:15] ;

  RegisterFile__c3c6554272304d54 reg_file
  (
    .clk( reg_file__clk ),
    .raddr( reg_file__raddr ),
    .rdata( reg_file__rdata ),
    .reset( reg_file__reset ),
    .waddr( reg_file__waddr ),
    .wdata( reg_file__wdata ),
    .wen( reg_file__wen )
  );

  //-------------------------------------------------------------
  // End of component reg_file
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemRTL.py:37
  // @s.update
  // def update_read_without_init():
  //   for i in range( rd_ports ):
  //     s.reg_file.wen[wr_ports + i] = b1(0)
  //     s.reg_file.raddr[i] = s.recv_raddr[i].msg
  //     s.send_rdata[i].msg = s.reg_file.rdata[i]
  // 
  //   for i in range( wr_ports ):
  //     if s.recv_waddr[i].en == b1(1):
  //       s.reg_file.waddr[i] = s.recv_waddr[i].msg
  //       s.reg_file.wdata[i] = s.recv_wdata[i].msg
  //       s.reg_file.wen[i]   = s.recv_wdata[i].en and s.recv_waddr[i].en
  
  always_comb begin : update_read_without_init
    for ( int i = 0; i < __const__rd_ports_at_update_read_without_init; i += 1 ) begin
      reg_file__wen[__const__wr_ports_at_update_read_without_init + i] = 1'd0;
      reg_file__raddr[i] = recv_raddr__msg[i];
      send_rdata__msg[i] = reg_file__rdata[i];
    end
    for ( int i = 0; i < __const__wr_ports_at_update_read_without_init; i += 1 )
      if ( recv_waddr__en[i] == 1'd1 ) begin
        reg_file__waddr[i] = recv_waddr__msg[i];
        reg_file__wdata[i] = recv_wdata__msg[i];
        reg_file__wen[i] = recv_wdata__en[i] && recv_waddr__en[i];
      end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemRTL.py:86
  // @s.update
  // def update_signal():
  //   for i in range( rd_ports ):
  //     s.recv_raddr[i].rdy = s.send_rdata[i].rdy
  //                           # b1( 1 ) # s.send_rdata[i].rdy
  //     s.send_rdata[i].en  = s.recv_raddr[i].en
  //                           # s.send_rdata[i].rdy # s.recv_raddr[i].en
  //   for i in range( wr_ports ):
  //     s.recv_waddr[i].rdy = Bits1( 1 )
  //     s.recv_wdata[i].rdy = Bits1( 1 )
  
  always_comb begin : update_signal
    for ( int i = 0; i < __const__rd_ports_at_update_signal; i += 1 ) begin
      recv_raddr__rdy[i] = send_rdata__rdy[i];
      send_rdata__en[i] = recv_raddr__en[i];
    end
    for ( int i = 0; i < __const__wr_ports_at_update_signal; i += 1 ) begin
      recv_waddr__rdy[i] = 1'd1;
      recv_wdata__rdy[i] = 1'd1;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemRTL.py:77
  // @s.update_ff
  // def update_init():
  //   for i in range( rd_ports ):
  //     if s.recv_raddr[i].en == b1(1):
  //       s.initWrites[s.recv_raddr[i].msg] <<= s.initWrites[s.recv_raddr[i].msg] | b1(1)
  //   for i in range( wr_ports ):
  //     if s.recv_waddr[i].en == b1(1):
  //       s.initWrites[s.recv_waddr[i].msg] <<= s.initWrites[s.recv_waddr[i].msg] | b1(1)
  
  always_ff @(posedge clk) begin : update_init
    for ( int i = 0; i < __const__rd_ports_at_update_init; i += 1 )
      if ( recv_raddr__en[i] == 1'd1 ) begin
        initWrites[recv_raddr__msg[i]] <= initWrites[recv_raddr__msg[i]] | 1'd1;
      end
    for ( int i = 0; i < __const__wr_ports_at_update_init; i += 1 )
      if ( recv_waddr__en[i] == 1'd1 ) begin
        initWrites[recv_waddr__msg[i]] <= initWrites[recv_waddr__msg[i]] | 1'd1;
      end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;

endmodule