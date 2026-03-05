module DataMemWrapperRTL__0e77cbd1e0ed857e
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input MemAccessPacket_4_3_512__8e5c7af30d36e757 recv_rd__msg  ,
  output logic [0:0] recv_rd__rdy  ,
  input logic [0:0] recv_rd__val  ,
  input MemAccessPacket_4_3_512__8e5c7af30d36e757 recv_wr__msg  ,
  output logic [0:0] recv_wr__rdy  ,
  input logic [0:0] recv_wr__val  ,
  output MemAccessPacket_3_4_512__8e5c7af30d36e757 send__msg  ,
  input logic [0:0] send__rdy  ,
  output logic [0:0] send__val  
);
  localparam logic [5:0] __const__per_bank_data_mem_size_at_request_memory  = 6'd32;
  logic [8:0] streaming_rd_addr;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 streaming_rd_read_reqeust;
  logic [0:0] streaming_rd_status;
  //-------------------------------------------------------------
  // Component channel_rd
  //-------------------------------------------------------------

  logic [0:0] channel_rd__clk;
  logic [0:0] channel_rd__reset;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 channel_rd__recv__msg;
  logic [0:0] channel_rd__recv__rdy;
  logic [0:0] channel_rd__recv__val;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 channel_rd__send__msg;
  logic [0:0] channel_rd__send__rdy;
  logic [0:0] channel_rd__send__val;

  ChannelRTL__c512bc5b9ecd188f channel_rd
  (
    .clk( channel_rd__clk ),
    .reset( channel_rd__reset ),
    .recv__msg( channel_rd__recv__msg ),
    .recv__rdy( channel_rd__recv__rdy ),
    .recv__val( channel_rd__recv__val ),
    .send__msg( channel_rd__send__msg ),
    .send__rdy( channel_rd__send__rdy ),
    .send__val( channel_rd__send__val )
  );

  //-------------------------------------------------------------
  // End of component channel_rd
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component channel_wr
  //-------------------------------------------------------------

  logic [0:0] channel_wr__clk;
  logic [0:0] channel_wr__reset;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 channel_wr__recv__msg;
  logic [0:0] channel_wr__recv__rdy;
  logic [0:0] channel_wr__recv__val;
  MemAccessPacket_4_3_512__8e5c7af30d36e757 channel_wr__send__msg;
  logic [0:0] channel_wr__send__rdy;
  logic [0:0] channel_wr__send__val;

  ChannelRTL__c512bc5b9ecd188f channel_wr
  (
    .clk( channel_wr__clk ),
    .reset( channel_wr__reset ),
    .recv__msg( channel_wr__recv__msg ),
    .recv__rdy( channel_wr__recv__rdy ),
    .recv__val( channel_wr__recv__val ),
    .send__msg( channel_wr__send__msg ),
    .send__rdy( channel_wr__send__rdy ),
    .send__val( channel_wr__send__val )
  );

  //-------------------------------------------------------------
  // End of component channel_wr
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component memory
  //-------------------------------------------------------------

  logic [0:0] memory__clk;
  logic [4:0] memory__raddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 memory__rdata [0:0];
  logic [0:0] memory__reset;
  logic [4:0] memory__waddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 memory__wdata [0:0];
  logic [0:0] memory__wen [0:0];

  RegisterFile__217468e476601edf memory
  (
    .clk( memory__clk ),
    .raddr( memory__raddr ),
    .rdata( memory__rdata ),
    .reset( memory__reset ),
    .waddr( memory__waddr ),
    .wdata( memory__wdata ),
    .wen( memory__wen )
  );

  //-------------------------------------------------------------
  // End of component memory
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemWrapperRTL.py:76
  // @update
  // def compose_send_msg():
  //   s.send.msg @= MemResponseType(0, 0, 0, DataType(0, 0, 0, 0), 0, 0, 0, 0, 0, 0)
  //   # TODO: change to pipe's out's wen.
  //   # Streaming read example:
  //   # At cycle 0, s.channel_rd issues one single streaming read request (indicated by 
  //   # s.channel_rd.send.msg.streaming_rd = 1) with s.channel_rd.send.msg.addr = 2, 
  //   # s.channel_rd.send.msg.streaming_rd_stride = 2, and s.channel_rd.send.msg.streaming_rd_end_addr = 6.
  //   # Then s.send will return the multiple response data from addr=2, addr=4, and addr=6 
  //   # at cycle 0, cycle 1, and cycle 2, respectively.
  //   if s.streaming_rd_status:
  //     s.send.msg.src                @= s.streaming_rd_read_reqeust.dst
  //     s.send.msg.dst                @= s.streaming_rd_read_reqeust.src
  //     s.send.msg.addr               @= s.streaming_rd_addr
  //     s.send.msg.data               @= s.memory.rdata[0]
  //     s.send.msg.src_cgra           @= s.streaming_rd_read_reqeust.src_cgra
  //     s.send.msg.src_tile           @= s.streaming_rd_read_reqeust.src_tile
  //     s.send.msg.remote_src_port    @= s.streaming_rd_read_reqeust.remote_src_port
  //   elif s.channel_rd.send.val:
  //     s.send.msg.src                @= s.channel_rd.send.msg.dst
  //     s.send.msg.dst                @= s.channel_rd.send.msg.src
  //     s.send.msg.addr               @= s.channel_rd.send.msg.addr
  //     s.send.msg.data               @= s.memory.rdata[0]
  //     s.send.msg.src_cgra           @= s.channel_rd.send.msg.src_cgra
  //     s.send.msg.src_tile           @= s.channel_rd.send.msg.src_tile
  //     s.send.msg.remote_src_port    @= s.channel_rd.send.msg.remote_src_port
  
  always_comb begin : compose_send_msg
    send__msg = { 2'd0, 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 3'd0, 2'd0, 1'd0, 9'd0, 9'd0 };
    if ( streaming_rd_status ) begin
      send__msg.src = streaming_rd_read_reqeust.dst;
      send__msg.dst = streaming_rd_read_reqeust.src;
      send__msg.addr = streaming_rd_addr;
      send__msg.data = memory__rdata[1'd0];
      send__msg.src_cgra = streaming_rd_read_reqeust.src_cgra;
      send__msg.src_tile = streaming_rd_read_reqeust.src_tile;
      send__msg.remote_src_port = streaming_rd_read_reqeust.remote_src_port;
    end
    else if ( channel_rd__send__val ) begin
      send__msg.src = channel_rd__send__msg.dst;
      send__msg.dst = channel_rd__send__msg.src;
      send__msg.addr = channel_rd__send__msg.addr;
      send__msg.data = memory__rdata[1'd0];
      send__msg.src_cgra = channel_rd__send__msg.src_cgra;
      send__msg.src_tile = channel_rd__send__msg.src_tile;
      send__msg.remote_src_port = channel_rd__send__msg.remote_src_port;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemWrapperRTL.py:123
  // @update
  // def notify_channel_rdy():
  //   # TODO: change to SRAM's rdy when replacing register file
  //   # with SRAM.
  //   if s.streaming_rd_status:
  //     # Issue one streaming request at one time.
  //     s.channel_rd.send.rdy @= 0
  //   else:
  //     s.channel_rd.send.rdy @= s.send.rdy
  //   s.channel_wr.send.rdy @= 1
  
  always_comb begin : notify_channel_rdy
    if ( streaming_rd_status ) begin
      channel_rd__send__rdy = 1'd0;
    end
    else
      channel_rd__send__rdy = send__rdy;
    channel_wr__send__rdy = 1'd1;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemWrapperRTL.py:134
  // @update
  // def notify_send_val():
  //   # TODO: change to SRAM's valid when replacing register file
  //   # with SRAM.
  //   if s.streaming_rd_status:
  //     # Keep sending read data during streaming status.
  //     s.send.val @= 1
  //   else:
  //     s.send.val @= s.channel_rd.send.val
  
  always_comb begin : notify_send_val
    if ( streaming_rd_status ) begin
      send__val = 1'd1;
    end
    else
      send__val = channel_rd__send__val;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemWrapperRTL.py:103
  // @update
  // def request_memory():
  //   # Default values.
  //   s.memory.wen[0]   @= 0
  //   s.memory.raddr[0] @= PerBankAddrType(0)
  //   s.memory.waddr[0] @= PerBankAddrType(0)
  //   s.memory.wdata[0] @= DataType(0, 0, 0, 0)
  // 
  //   if s.streaming_rd_status:
  //     s.memory.raddr[0] @= \
  //       trunc(s.streaming_rd_addr % per_bank_data_mem_size, PerBankAddrType)
  //   if s.channel_rd.send.val:
  //     s.memory.raddr[0] @= \
  //       trunc(s.channel_rd.send.msg.addr % per_bank_data_mem_size, PerBankAddrType)
  //   if s.channel_wr.send.val:
  //     s.memory.waddr[0] @= \
  //       trunc(s.channel_wr.send.msg.addr % per_bank_data_mem_size, PerBankAddrType)
  //     s.memory.wdata[0] @= s.channel_wr.send.msg.data
  //     s.memory.wen[0]   @= 1
  
  always_comb begin : request_memory
    memory__wen[1'd0] = 1'd0;
    memory__raddr[1'd0] = 5'd0;
    memory__waddr[1'd0] = 5'd0;
    memory__wdata[1'd0] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    if ( streaming_rd_status ) begin
      memory__raddr[1'd0] = 5'(streaming_rd_addr % 9'( __const__per_bank_data_mem_size_at_request_memory ));
    end
    if ( channel_rd__send__val ) begin
      memory__raddr[1'd0] = 5'(channel_rd__send__msg.addr % 9'( __const__per_bank_data_mem_size_at_request_memory ));
    end
    if ( channel_wr__send__val ) begin
      memory__waddr[1'd0] = 5'(channel_wr__send__msg.addr % 9'( __const__per_bank_data_mem_size_at_request_memory ));
      memory__wdata[1'd0] = channel_wr__send__msg.data;
      memory__wen[1'd0] = 1'd1;
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemWrapperRTL.py:63
  // @update_ff
  // def update_streaming_rd_regs():
  //   if s.channel_rd.send.val & s.channel_rd.send.msg.streaming_rd:
  //     s.streaming_rd_status <<= 1
  //     s.streaming_rd_addr <<= s.channel_rd.send.msg.addr + s.channel_rd.send.msg.streaming_rd_stride
  //     s.streaming_rd_read_reqeust <<= s.channel_rd.send.msg
  //   elif s.streaming_rd_addr == s.streaming_rd_read_reqeust.streaming_rd_end_addr:
  //     s.streaming_rd_status <<= 0
  //     s.streaming_rd_addr <<= GlobalAddrType(0)
  //     s.streaming_rd_read_reqeust <<= MemReadType()
  //   else:
  //     s.streaming_rd_addr <<= s.streaming_rd_addr + s.streaming_rd_read_reqeust.streaming_rd_stride
  
  always_ff @(posedge clk) begin : update_streaming_rd_regs
    if ( channel_rd__send__val & channel_rd__send__msg.streaming_rd ) begin
      streaming_rd_status <= 1'd1;
      streaming_rd_addr <= channel_rd__send__msg.addr + channel_rd__send__msg.streaming_rd_stride;
      streaming_rd_read_reqeust <= channel_rd__send__msg;
    end
    else if ( streaming_rd_addr == streaming_rd_read_reqeust.streaming_rd_end_addr ) begin
      streaming_rd_status <= 1'd0;
      streaming_rd_addr <= 9'd0;
      streaming_rd_read_reqeust <= { 2'd0, 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 3'd0, 2'd0, 1'd0, 9'd0, 9'd0 };
    end
    else
      streaming_rd_addr <= streaming_rd_addr + streaming_rd_read_reqeust.streaming_rd_stride;
  end

  assign memory__clk = clk;
  assign memory__reset = reset;
  assign channel_rd__clk = clk;
  assign channel_rd__reset = reset;
  assign channel_wr__clk = clk;
  assign channel_wr__reset = reset;
  assign channel_rd__recv__msg = recv_rd__msg;
  assign recv_rd__rdy = channel_rd__recv__rdy;
  assign channel_rd__recv__val = recv_rd__val;
  assign channel_wr__recv__msg = recv_wr__msg;
  assign recv_wr__rdy = channel_wr__recv__rdy;
  assign channel_wr__recv__val = recv_wr__val;

endmodule