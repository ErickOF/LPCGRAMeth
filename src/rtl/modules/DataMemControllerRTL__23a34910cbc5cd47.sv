module DataMemControllerRTL__23a34910cbc5cd47
import cgra_pkg::*;
(
  input  logic [8:0] address_lower ,
  input  logic [8:0] address_upper ,
  input  logic [1:0] cgra_id ,
  input  logic [0:0] clk ,
  input  logic [0:0] reset ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_from_noc_load_request__msg  ,
  output logic [0:0] recv_from_noc_load_request__rdy  ,
  input logic [0:0] recv_from_noc_load_request__val  ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_from_noc_load_response_pkt__msg  ,
  output logic [0:0] recv_from_noc_load_response_pkt__rdy  ,
  input logic [0:0] recv_from_noc_load_response_pkt__val  ,
  input InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_from_noc_store_request__msg  ,
  output logic [0:0] recv_from_noc_store_request__rdy  ,
  input logic [0:0] recv_from_noc_store_request__val  ,
  input logic [8:0] recv_raddr__msg [0:30] ,
  output logic [0:0] recv_raddr__rdy [0:30] ,
  input logic [0:0] recv_raddr__val [0:30] ,
  input logic [8:0] recv_waddr__msg [0:30] ,
  output logic [0:0] recv_waddr__rdy [0:30] ,
  input logic [0:0] recv_waddr__val [0:30] ,
  input CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 recv_wdata__msg [0:30] ,
  output logic [0:0] recv_wdata__rdy [0:30] ,
  input logic [0:0] recv_wdata__val [0:30] ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_rdata__msg [0:30] ,
  input logic [0:0] send_rdata__rdy [0:30] ,
  output logic [0:0] send_rdata__val [0:30] ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_to_noc_load_request_pkt__msg  ,
  input logic [0:0] send_to_noc_load_request_pkt__rdy  ,
  output logic [0:0] send_to_noc_load_request_pkt__val  ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_to_noc_load_response_pkt__msg  ,
  input logic [0:0] send_to_noc_load_response_pkt__rdy  ,
  output logic [0:0] send_to_noc_load_response_pkt__val  ,
  output InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_to_noc_store_pkt__msg  ,
  input logic [0:0] send_to_noc_store_pkt__rdy  ,
  output logic [0:0] send_to_noc_store_pkt__val  
);
  localparam logic [5:0] __const__num_xbar_in_rd_ports_at_assemble_xbar_pkt  = 6'd32;
  localparam logic [5:0] __const__num_xbar_in_wr_ports_at_assemble_xbar_pkt  = 6'd32;
  localparam logic [4:0] __const__num_rd_tiles_at_assemble_xbar_pkt  = 5'd31;
  localparam logic [2:0] __const__per_bank_addr_nbits_at_assemble_xbar_pkt  = 3'd5;
  localparam logic [1:0] __const__num_banks_per_cgra_at_assemble_xbar_pkt  = 2'd2;
  localparam logic [4:0] __const__num_wr_tiles_at_assemble_xbar_pkt  = 5'd31;
  localparam logic [4:0] __const__num_rd_tiles_at_update_all  = 5'd31;
  localparam logic [4:0] __const__num_wr_tiles_at_update_all  = 5'd31;
  localparam logic [5:0] __const__num_xbar_in_rd_ports_at_update_all  = 6'd32;
  localparam logic [5:0] __const__num_xbar_in_wr_ports_at_update_all  = 6'd32;
  localparam logic [3:0] __const__CMD_LOAD_RESPONSE  = 4'd11;
  localparam logic [1:0] __const__num_banks_per_cgra_at_update_all  = 2'd2;
  localparam logic [3:0] __const__CMD_LOAD_REQUEST  = 4'd10;
  localparam logic [3:0] __const__CMD_STORE_REQUEST  = 4'd12;
  logic [1:0] idTo2d_x_lut [0:3];
  logic [0:0] idTo2d_y_lut [0:3];
  MemAccessPacket_32_3_512__0e5e373c0405ceef rd_pkt [0:31];
  MemAccessPacket_32_3_512__0e5e373c0405ceef wr_pkt [0:31];
  //-------------------------------------------------------------
  // Component memory_wrapper[0:1]
  //-------------------------------------------------------------

  logic [0:0] memory_wrapper__clk [0:1];
  logic [0:0] memory_wrapper__reset [0:1];
  MemAccessPacket_32_3_512__0e5e373c0405ceef memory_wrapper__recv_rd__msg [0:1];
  logic [0:0] memory_wrapper__recv_rd__rdy [0:1];
  logic [0:0] memory_wrapper__recv_rd__val [0:1];
  MemAccessPacket_32_3_512__0e5e373c0405ceef memory_wrapper__recv_wr__msg [0:1];
  logic [0:0] memory_wrapper__recv_wr__rdy [0:1];
  logic [0:0] memory_wrapper__recv_wr__val [0:1];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 memory_wrapper__send__msg [0:1];
  logic [0:0] memory_wrapper__send__rdy [0:1];
  logic [0:0] memory_wrapper__send__val [0:1];

  DataMemWrapperRTL__231814237f3337b4 memory_wrapper__0
  (
    .clk( memory_wrapper__clk[0] ),
    .reset( memory_wrapper__reset[0] ),
    .recv_rd__msg( memory_wrapper__recv_rd__msg[0] ),
    .recv_rd__rdy( memory_wrapper__recv_rd__rdy[0] ),
    .recv_rd__val( memory_wrapper__recv_rd__val[0] ),
    .recv_wr__msg( memory_wrapper__recv_wr__msg[0] ),
    .recv_wr__rdy( memory_wrapper__recv_wr__rdy[0] ),
    .recv_wr__val( memory_wrapper__recv_wr__val[0] ),
    .send__msg( memory_wrapper__send__msg[0] ),
    .send__rdy( memory_wrapper__send__rdy[0] ),
    .send__val( memory_wrapper__send__val[0] )
  );

  DataMemWrapperRTL__231814237f3337b4 memory_wrapper__1
  (
    .clk( memory_wrapper__clk[1] ),
    .reset( memory_wrapper__reset[1] ),
    .recv_rd__msg( memory_wrapper__recv_rd__msg[1] ),
    .recv_rd__rdy( memory_wrapper__recv_rd__rdy[1] ),
    .recv_rd__val( memory_wrapper__recv_rd__val[1] ),
    .recv_wr__msg( memory_wrapper__recv_wr__msg[1] ),
    .recv_wr__rdy( memory_wrapper__recv_wr__rdy[1] ),
    .recv_wr__val( memory_wrapper__recv_wr__val[1] ),
    .send__msg( memory_wrapper__send__msg[1] ),
    .send__rdy( memory_wrapper__send__rdy[1] ),
    .send__val( memory_wrapper__send__val[1] )
  );

  //-------------------------------------------------------------
  // End of component memory_wrapper[0:1]
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component read_crossbar
  //-------------------------------------------------------------

  logic [0:0] read_crossbar__clk;
  logic [0:0] read_crossbar__reset;
  MemAccessPacket_32_3_512__0e5e373c0405ceef read_crossbar__recv__msg [0:31];
  logic [0:0] read_crossbar__recv__rdy [0:31];
  logic [0:0] read_crossbar__recv__val [0:31];
  MemAccessPacket_32_3_512__0e5e373c0405ceef read_crossbar__send__msg [0:2];
  logic [0:0] read_crossbar__send__rdy [0:2];
  logic [0:0] read_crossbar__send__val [0:2];

  XbarBypassQueueRTL__1b5921410712b1fe read_crossbar
  (
    .clk( read_crossbar__clk ),
    .reset( read_crossbar__reset ),
    .recv__msg( read_crossbar__recv__msg ),
    .recv__rdy( read_crossbar__recv__rdy ),
    .recv__val( read_crossbar__recv__val ),
    .send__msg( read_crossbar__send__msg ),
    .send__rdy( read_crossbar__send__rdy ),
    .send__val( read_crossbar__send__val )
  );

  //-------------------------------------------------------------
  // End of component read_crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component response_crossbar
  //-------------------------------------------------------------

  logic [0:0] response_crossbar__clk;
  logic [0:0] response_crossbar__reset;
  MemAccessPacket_3_32_512__62fa6e6064d885d7 response_crossbar__recv__msg [0:2];
  logic [0:0] response_crossbar__recv__rdy [0:2];
  logic [0:0] response_crossbar__recv__val [0:2];
  MemAccessPacket_3_32_512__62fa6e6064d885d7 response_crossbar__send__msg [0:31];
  logic [0:0] response_crossbar__send__rdy [0:31];
  logic [0:0] response_crossbar__send__val [0:31];

  XbarBypassQueueRTL__60b105be9bc00068 response_crossbar
  (
    .clk( response_crossbar__clk ),
    .reset( response_crossbar__reset ),
    .recv__msg( response_crossbar__recv__msg ),
    .recv__rdy( response_crossbar__recv__rdy ),
    .recv__val( response_crossbar__recv__val ),
    .send__msg( response_crossbar__send__msg ),
    .send__rdy( response_crossbar__send__rdy ),
    .send__val( response_crossbar__send__val )
  );

  //-------------------------------------------------------------
  // End of component response_crossbar
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component write_crossbar
  //-------------------------------------------------------------

  logic [0:0] write_crossbar__clk;
  logic [0:0] write_crossbar__reset;
  MemAccessPacket_32_3_512__0e5e373c0405ceef write_crossbar__recv__msg [0:31];
  logic [0:0] write_crossbar__recv__rdy [0:31];
  logic [0:0] write_crossbar__recv__val [0:31];
  MemAccessPacket_32_3_512__0e5e373c0405ceef write_crossbar__send__msg [0:2];
  logic [0:0] write_crossbar__send__rdy [0:2];
  logic [0:0] write_crossbar__send__val [0:2];

  XbarBypassQueueRTL__1b5921410712b1fe write_crossbar
  (
    .clk( write_crossbar__clk ),
    .reset( write_crossbar__reset ),
    .recv__msg( write_crossbar__recv__msg ),
    .recv__rdy( write_crossbar__recv__rdy ),
    .recv__val( write_crossbar__recv__val ),
    .send__msg( write_crossbar__send__msg ),
    .send__rdy( write_crossbar__send__rdy ),
    .send__val( write_crossbar__send__val )
  );

  //-------------------------------------------------------------
  // End of component write_crossbar
  //-------------------------------------------------------------
  logic [8:0] __tmpvar__assemble_xbar_pkt_recv_raddr;
  logic [1:0] __tmpvar__assemble_xbar_pkt_bank_index_load_local;
  logic [8:0] __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc;
  logic [1:0] __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc;
  logic [8:0] __tmpvar__assemble_xbar_pkt_recv_waddr;
  logic [1:0] __tmpvar__assemble_xbar_pkt_bank_index_store_local;
  logic [8:0] __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 __tmpvar__assemble_xbar_pkt_recv_wdata_from_noc;
  logic [1:0] __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc;
  logic [1:0] __tmpvar__update_all_from_cgra_id;
  logic [8:0] __tmpvar__update_all_from_tile_id;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemControllerRTL.py:159
  //  @update
  //  def assemble_xbar_pkt():
  //    for i in range(num_xbar_in_rd_ports):
  //      s.rd_pkt[i] @= MemReadPktType(i, 0, 0, DataType(0, 0, 0, 0), 0, 0, i, 0, 0, 0)
  // 
  //    for i in range(num_xbar_in_wr_ports):
  //      s.wr_pkt[i] @= MemWritePktType(i, 0, 0, DataType(0, 0, 0, 0), 0, 0, i, 0, 0, 0)
  // 
  //    for i in range(num_rd_tiles):
  //      recv_raddr = s.recv_raddr[i].msg
  //      # Calculates the target bank index for load.
  //      if (recv_raddr >= s.address_lower) & (recv_raddr <= s.address_upper):
  //        bank_index_load_local = trunc((recv_raddr - s.address_lower) >> per_bank_addr_nbits, XbarOutRdType)
  //      else:
  //        bank_index_load_local = XbarOutRdType(num_banks_per_cgra)
  //      # FIXME: change to exact tile id.
  //      s.rd_pkt[i] @= MemReadPktType(i,                       # src
  //                                    bank_index_load_local,   # dst
  //                                    recv_raddr,              # addr
  //                                    DataType(0, 0, 0, 0),    # data
  //                                    s.cgra_id,               # src_cgra
  //                                    0,                       # src_tile
  //                                    i,                       # remote_src_port
  //                                    0,                       # streaming_rd
  //                                    0,                       # streaming_rd_stride
  //                                    0)                       # streaming_rd_end_addr
  // 
  //    recv_raddr_from_noc = s.recv_from_noc_load_request.msg.payload.data_addr
  //    # Calculates the target bank index.
  //    if (recv_raddr_from_noc >= s.address_lower) & (recv_raddr_from_noc <= s.address_upper):
  //      bank_index_load_from_noc = trunc((recv_raddr_from_noc - s.address_lower) >> per_bank_addr_nbits, XbarOutRdType)
  //    else:
  //      bank_index_load_from_noc = XbarOutRdType(num_banks_per_cgra)
  //    s.rd_pkt[num_rd_tiles] @= MemReadPktType(num_rd_tiles,                                     # src
  //                                             bank_index_load_from_noc,                         # dst
  //                                             recv_raddr_from_noc,                              # addr
  //                                             DataType(0, 0, 0, 0),                             # data
  //                                             s.recv_from_noc_load_request.msg.src,             # src_cgra
  //                                             s.recv_from_noc_load_request.msg.src_tile_id,     # src_tile
  //                                             s.recv_from_noc_load_request.msg.remote_src_port, # remote_src_port
  //                                             0,                                                # streaming_rd
  //                                             0,                                                # streaming_rd_stride
  //                                             0)                                                # streaming_rd_end_addr
  // 
  // 
  //    for i in range(num_wr_tiles):
  //      recv_waddr = s.recv_waddr[i].msg
  //      # Calculates the target bank index for store.
  //      if (recv_waddr >= s.address_lower) & (recv_waddr <= s.address_upper):
  //        bank_index_store_local = trunc((recv_waddr - s.address_lower) >> per_bank_addr_nbits, XbarOutWrType)
  //      else:
  //        bank_index_store_local = XbarOutWrType(num_banks_per_cgra)
  //      s.wr_pkt[i] @= MemWritePktType(i,                       # src
  //                                     bank_index_store_local,  # dst
  //                                     recv_waddr,              # addr
  //                                     s.recv_wdata[i].msg,     # data
  //                                     0,                       # src_cgra
  //                                     0,                       # src_tile
  //                                     i,                       # remote_src_port
  //                                     0,                       # streaming_rd
  //                                     0,                       # streaming_rd_stride
  //                                     0)                       # streaming_rd_end_addr
  // 
  // 
  //    recv_waddr_from_noc = s.recv_from_noc_store_request.msg.payload.data_addr
  //    recv_wdata_from_noc = s.recv_from_noc_store_request.msg.payload.data
  //    if (recv_waddr_from_noc >= s.address_lower) & (recv_waddr_from_noc <= s.address_upper):
  //      bank_index_store_from_noc = trunc((recv_waddr_from_noc - s.address_lower) >> per_bank_addr_nbits, XbarOutWrType)
  //    else:
  //      bank_index_store_from_noc = XbarOutWrType(num_banks_per_cgra)
  //    s.wr_pkt[num_wr_tiles] @= MemWritePktType(num_wr_tiles,               # src
  //                                              bank_index_store_from_noc,  # dst
  //                                              recv_waddr_from_noc,        # addr
  //                                              recv_wdata_from_noc,        # data
  //                                              0,                          # src_cgra
  //                                              0,                          # src_tile
  //                                              num_wr_tiles,               # remote_src_port
  //                                              0,                       # streaming_rd
  //                                              0,                       # streaming_rd_stride
  //                                              0)                       # streaming_rd_end_addr
  
  always_comb begin : assemble_xbar_pkt
    for ( int unsigned i = 1'd0; i < 6'( __const__num_xbar_in_rd_ports_at_assemble_xbar_pkt ); i += 1'd1 )
      rd_pkt[5'(i)] = { 5'(i), 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 9'd0, 5'(i), 1'd0, 9'd0, 9'd0 };
    for ( int unsigned i = 1'd0; i < 6'( __const__num_xbar_in_wr_ports_at_assemble_xbar_pkt ); i += 1'd1 )
      wr_pkt[5'(i)] = { 5'(i), 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 9'd0, 5'(i), 1'd0, 9'd0, 9'd0 };
    for ( int unsigned i = 1'd0; i < 5'( __const__num_rd_tiles_at_assemble_xbar_pkt ); i += 1'd1 ) begin
      __tmpvar__assemble_xbar_pkt_recv_raddr = recv_raddr__msg[5'(i)];
      if ( ( __tmpvar__assemble_xbar_pkt_recv_raddr >= address_lower ) & ( __tmpvar__assemble_xbar_pkt_recv_raddr <= address_upper ) ) begin
        __tmpvar__assemble_xbar_pkt_bank_index_load_local = 2'(( __tmpvar__assemble_xbar_pkt_recv_raddr - address_lower ) >> 3'( __const__per_bank_addr_nbits_at_assemble_xbar_pkt ));
      end
      else
        __tmpvar__assemble_xbar_pkt_bank_index_load_local = 2'd2;
      rd_pkt[5'(i)] = { 5'(i), __tmpvar__assemble_xbar_pkt_bank_index_load_local, __tmpvar__assemble_xbar_pkt_recv_raddr, { 32'd0, 1'd0, 1'd0, 1'd0 }, cgra_id, 9'd0, 5'(i), 1'd0, 9'd0, 9'd0 };
    end
    __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc = recv_from_noc_load_request__msg.payload.data_addr;
    if ( ( __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc >= address_lower ) & ( __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc <= address_upper ) ) begin
      __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc = 2'(( __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc - address_lower ) >> 3'( __const__per_bank_addr_nbits_at_assemble_xbar_pkt ));
    end
    else
      __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc = 2'd2;
    rd_pkt[5'( __const__num_rd_tiles_at_assemble_xbar_pkt )] = { 5'( __const__num_rd_tiles_at_assemble_xbar_pkt ), __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc, __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc, { 32'd0, 1'd0, 1'd0, 1'd0 }, recv_from_noc_load_request__msg.src, recv_from_noc_load_request__msg.src_tile_id, recv_from_noc_load_request__msg.remote_src_port, 1'd0, 9'd0, 9'd0 };
    for ( int unsigned i = 1'd0; i < 5'( __const__num_wr_tiles_at_assemble_xbar_pkt ); i += 1'd1 ) begin
      __tmpvar__assemble_xbar_pkt_recv_waddr = recv_waddr__msg[5'(i)];
      if ( ( __tmpvar__assemble_xbar_pkt_recv_waddr >= address_lower ) & ( __tmpvar__assemble_xbar_pkt_recv_waddr <= address_upper ) ) begin
        __tmpvar__assemble_xbar_pkt_bank_index_store_local = 2'(( __tmpvar__assemble_xbar_pkt_recv_waddr - address_lower ) >> 3'( __const__per_bank_addr_nbits_at_assemble_xbar_pkt ));
      end
      else
        __tmpvar__assemble_xbar_pkt_bank_index_store_local = 2'd2;
      wr_pkt[5'(i)] = { 5'(i), __tmpvar__assemble_xbar_pkt_bank_index_store_local, __tmpvar__assemble_xbar_pkt_recv_waddr, recv_wdata__msg[5'(i)], 2'd0, 9'd0, 5'(i), 1'd0, 9'd0, 9'd0 };
    end
    __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc = recv_from_noc_store_request__msg.payload.data_addr;
    __tmpvar__assemble_xbar_pkt_recv_wdata_from_noc = recv_from_noc_store_request__msg.payload.data;
    if ( ( __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc >= address_lower ) & ( __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc <= address_upper ) ) begin
      __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc = 2'(( __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc - address_lower ) >> 3'( __const__per_bank_addr_nbits_at_assemble_xbar_pkt ));
    end
    else
      __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc = 2'd2;
    wr_pkt[5'( __const__num_wr_tiles_at_assemble_xbar_pkt )] = { 5'( __const__num_wr_tiles_at_assemble_xbar_pkt ), __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc, __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc, __tmpvar__assemble_xbar_pkt_recv_wdata_from_noc, 2'd0, 9'd0, 5'( __const__num_wr_tiles_at_assemble_xbar_pkt ), 1'd0, 9'd0, 9'd0 };
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/data/DataMemControllerRTL.py:242
  // @update
  // def update_all():
  //   # Initializes the signals.
  //   for i in range(num_rd_tiles):
  //     s.recv_raddr[i].rdy @= 0
  //   s.recv_from_noc_load_request.rdy @= 0
  // 
  //   for i in range(num_wr_tiles):
  //     s.recv_waddr[i].rdy @= 0
  //     # s.recv_wdata_bypass_q[i].send.rdy @= 0
  //   s.recv_from_noc_store_request.rdy @= 0
  //   # s.recv_wdata_bypass_q[num_wr_tiles].send.rdy @= 0
  // 
  //   for i in range(num_rd_tiles):
  //     s.send_rdata[i].val @= 0
  //     s.send_rdata[i].msg @= DataType()
  //   s.send_to_noc_load_response_pkt.val @= 0
  // 
  //   s.send_to_noc_load_response_pkt.msg @= \
  //       NocPktType(0, # src
  //                  0, # dst
  //                  0, # src_x
  //                  0, # src_y
  //                  0, # dst_x
  //                  0, # dst_y
  //                  0, # src_tile_id
  //                  0, # dst_tile_id
  //                  0, # remote_src_port
  //                  0, # opaque
  //                  0, # vc_id
  //                  CgraPayloadType(0, 0, 0, 0, 0))
  // 
  // 
  //   for i in range(num_wr_tiles):
  //     s.recv_wdata[i].rdy @= 0
  // 
  //   s.send_to_noc_store_pkt.msg @= \
  //       NocPktType(0, # src
  //                  0, # dst
  //                  0, # src_x
  //                  0, # src_y
  //                  0, # dst_x
  //                  0, # dst_y
  //                  0, # src_tile_id
  //                  0, # dst_tile_id
  //                  0, # remote_src_port
  //                  0, # opaque
  //                  0, # vc_id
  //                  CgraPayloadType(0, 0, 0, 0, 0))
  // 
  //   s.send_to_noc_store_pkt.val @= 0
  // 
  //   for i in range(num_xbar_in_rd_ports):
  //     s.read_crossbar.recv[i].val @= 0
  //     s.read_crossbar.recv[i].msg @= MemReadPktType(0, 0, 0, DataType(0, 0, 0, 0), 0, 0, 0, 0, 0, 0)
  // 
  //   s.recv_from_noc_load_response_pkt.rdy @= 0
  // 
  //   for i in range(num_xbar_in_wr_ports):
  //     s.write_crossbar.recv[i].val @= 0
  //     s.write_crossbar.recv[i].msg @= MemWritePktType(0, 0, 0, DataType(0, 0, 0, 0), 0, 0, 0, 0, 0, 0)
  // 
  //   s.send_to_noc_load_request_pkt.msg @= \
  //       NocPktType(0, # src
  //                  0, # dst
  //                  0, # src_x
  //                  0, # src_y
  //                  0, # dst_x
  //                  0, # dst_y
  //                  0, # src_tile_id
  //                  0, # dst_tile_id
  //                  0, # remote_src_port
  //                  0, # opaque
  //                  0, # vc_id
  //                  CgraPayloadType(0, 0, 0, 0, 0))
  // 
  //   s.send_to_noc_load_request_pkt.val @= 0
  // 
  //   # Connects the load request ports (from tiles and NoC) to the xbar targetting memory and NoC.
  //   for i in range(num_rd_tiles):
  //       s.read_crossbar.recv[i].val @= s.recv_raddr[i].val
  //       s.read_crossbar.recv[i].msg @= s.rd_pkt[i]
  //       s.recv_raddr[i].rdy @= s.read_crossbar.recv[i].rdy
  //   s.read_crossbar.recv[num_rd_tiles].val @= s.recv_from_noc_load_request.val
  //   s.read_crossbar.recv[num_rd_tiles].msg @= s.rd_pkt[num_rd_tiles]
  //   s.recv_from_noc_load_request.rdy @= s.read_crossbar.recv[num_rd_tiles].rdy
  //   
  //   # Connects the store request ports (from tiles and NoC) to the xbar targetting memory and NoC.
  //   for i in range(num_wr_tiles):
  //     s.write_crossbar.recv[i].val @= s.recv_waddr[i].val
  //     s.write_crossbar.recv[i].msg @= s.wr_pkt[i]
  //     s.recv_waddr[i].rdy @= s.write_crossbar.recv[i].rdy
  //     s.recv_wdata[i].rdy @= s.write_crossbar.recv[i].rdy
  //   s.write_crossbar.recv[num_wr_tiles].val @= s.recv_from_noc_store_request.val
  //   s.write_crossbar.recv[num_wr_tiles].msg @= s.wr_pkt[num_wr_tiles]
  //   s.recv_from_noc_store_request.rdy @= s.write_crossbar.recv[num_wr_tiles].rdy
  // 
  //   # Connects the response ports to tiles and NoC from the xbar.
  //   # Number of load responses is expected to be the same as the number of load requests.
  //   for i in range(num_xbar_in_rd_ports):
  //     if i < num_rd_tiles:
  //       s.send_rdata[RdTileIdType(i)].msg @= s.response_crossbar.send[i].msg.data
  //       s.send_rdata[RdTileIdType(i)].val @= s.response_crossbar.send[i].val
  //       s.response_crossbar.send[i].rdy @= s.send_rdata[RdTileIdType(i)].rdy
  //     else:
  //       from_cgra_id = s.response_crossbar.send[i].msg.src_cgra
  //       from_tile_id = s.response_crossbar.send[i].msg.src_tile
  //       s.send_to_noc_load_response_pkt.msg @= \
  //             NocPktType(
  //                 s.cgra_id, # src_cgra_id
  //                 from_cgra_id, # dst_cgra_id
  //                 s.idTo2d_x_lut[s.cgra_id], # src_cgra_x
  //                 s.idTo2d_y_lut[s.cgra_id], # src_cgra_y
  //                 s.idTo2d_x_lut[from_cgra_id], # dst_cgra_x
  //                 s.idTo2d_y_lut[from_cgra_id], # dst_cgra_y
  //                 0, # src_tile_id set as 0 as it is from memory rather than a specific tile.
  //                 from_tile_id, # dst_tile_id
  //                 s.response_crossbar.send[i].msg.remote_src_port, # remote_src_port, carries the original source port id towards the src.
  //                 0, # opaque
  //                 0, # vc_id
  //                 CgraPayloadType(
  //                     CMD_LOAD_RESPONSE,
  //                     s.response_crossbar.send[i].msg.data,
  //                     s.response_crossbar.send[i].msg.addr, 0, 0))
  // 
  //       s.send_to_noc_load_response_pkt.val @= s.response_crossbar.send[i].val
  //       s.response_crossbar.send[i].rdy @= s.send_to_noc_load_response_pkt.rdy
  // 
  //   # Handles the request (not response) towards the others via the NoC. The dst would be
  //   # updated in the controller.
  //   s.send_to_noc_load_request_pkt.msg @= \
  //       NocPktType(s.cgra_id, # src
  //                   0, # dst
  //                   s.idTo2d_x_lut[s.cgra_id], # src_x
  //                   s.idTo2d_y_lut[s.cgra_id], # src_y
  //                   0, # dst_x
  //                   0, # dst_y
  //                   0, # src_tile_id
  //                   0, # dst_tile_id
  //                   s.read_crossbar.send[num_banks_per_cgra].msg.src, # remote_src_port
  //                   0, # opaque
  //                   0, # vc_id
  //                   CgraPayloadType(
  //                       CMD_LOAD_REQUEST,
  //                       0,
  //                       s.read_crossbar.send[num_banks_per_cgra].msg.addr, 0, 0))
  // 
  //   s.send_to_noc_load_request_pkt.val @= s.read_crossbar.send[num_banks_per_cgra].val 
  //   # TODO: https://github.com/tancheng/VectorCGRA/issues/26 -- Modify this part for non-blocking access.
  //   # 'val` indicates the data is arbitrated successfully.
  //   s.recv_from_noc_load_response_pkt.rdy @= s.response_crossbar.recv[num_banks_per_cgra].rdy
  //   s.response_crossbar.recv[num_banks_per_cgra].val @= s.recv_from_noc_load_response_pkt.val
  //   s.response_crossbar.recv[num_banks_per_cgra].msg @= \
  //       MemResponsePktType(num_banks_per_cgra,
  //                          s.recv_from_noc_load_response_pkt.msg.remote_src_port,
  //                          s.recv_from_noc_load_response_pkt.msg.payload.data_addr,
  //                          s.recv_from_noc_load_response_pkt.msg.payload.data,
  //                          s.recv_from_noc_load_response_pkt.msg.src,
  //                          s.recv_from_noc_load_response_pkt.msg.src_tile_id,
  //                          0,
  //                          0,                       # streaming_rd
  //                          0,                       # streaming_rd_stride
  //                          0)                       # streaming_rd_end_addr
  // 
  //   # Allows other load request towards NoC when the previous one is not responded. There
  //   # could be out-of-order load response, i.e., potential consistency issue.
  //   s.read_crossbar.send[num_banks_per_cgra].rdy @= s.send_to_noc_load_request_pkt.rdy
  // 
  //   # Handles the write port towards the NoC.
  //   s.send_to_noc_store_pkt.msg @= \
  //       NocPktType(s.cgra_id, # src
  //                   0, # dst
  //                   s.idTo2d_x_lut[s.cgra_id], # src_x
  //                   s.idTo2d_y_lut[s.cgra_id], # src_y
  //                   0, # dst_x
  //                   0, # dst_y
  //                   0, # src_tile_id
  //                   0, # dst_tile_id
  //                   s.write_crossbar.send[num_banks_per_cgra].msg.src, # remote_src_port
  //                   0, # opaque
  //                   0, # vc_id
  //                   CgraPayloadType(
  //                       CMD_STORE_REQUEST,
  //                       s.write_crossbar.send[num_banks_per_cgra].msg.data,
  //                       s.write_crossbar.send[num_banks_per_cgra].msg.addr, 0, 0))
  // 
  //   s.send_to_noc_store_pkt.val @= s.write_crossbar.send[num_banks_per_cgra].val
  //   s.write_crossbar.send[num_banks_per_cgra].rdy @= s.send_to_noc_store_pkt.rdy
  
  always_comb begin : update_all
    for ( int unsigned i = 1'd0; i < 5'( __const__num_rd_tiles_at_update_all ); i += 1'd1 )
      recv_raddr__rdy[5'(i)] = 1'd0;
    recv_from_noc_load_request__rdy = 1'd0;
    for ( int unsigned i = 1'd0; i < 5'( __const__num_wr_tiles_at_update_all ); i += 1'd1 )
      recv_waddr__rdy[5'(i)] = 1'd0;
    recv_from_noc_store_request__rdy = 1'd0;
    for ( int unsigned i = 1'd0; i < 5'( __const__num_rd_tiles_at_update_all ); i += 1'd1 ) begin
      send_rdata__val[5'(i)] = 1'd0;
      send_rdata__msg[5'(i)] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    end
    send_to_noc_load_response_pkt__val = 1'd0;
    send_to_noc_load_response_pkt__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 9'd0, 9'd0, 5'd0, 8'd0, 2'd0, { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 } };
    for ( int unsigned i = 1'd0; i < 5'( __const__num_wr_tiles_at_update_all ); i += 1'd1 )
      recv_wdata__rdy[5'(i)] = 1'd0;
    send_to_noc_store_pkt__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 9'd0, 9'd0, 5'd0, 8'd0, 2'd0, { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 } };
    send_to_noc_store_pkt__val = 1'd0;
    for ( int unsigned i = 1'd0; i < 6'( __const__num_xbar_in_rd_ports_at_update_all ); i += 1'd1 ) begin
      read_crossbar__recv__val[5'(i)] = 1'd0;
      read_crossbar__recv__msg[5'(i)] = { 5'd0, 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 9'd0, 5'd0, 1'd0, 9'd0, 9'd0 };
    end
    recv_from_noc_load_response_pkt__rdy = 1'd0;
    for ( int unsigned i = 1'd0; i < 6'( __const__num_xbar_in_wr_ports_at_update_all ); i += 1'd1 ) begin
      write_crossbar__recv__val[5'(i)] = 1'd0;
      write_crossbar__recv__msg[5'(i)] = { 5'd0, 2'd0, 9'd0, { 32'd0, 1'd0, 1'd0, 1'd0 }, 2'd0, 9'd0, 5'd0, 1'd0, 9'd0, 9'd0 };
    end
    send_to_noc_load_request_pkt__msg = { 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 9'd0, 9'd0, 5'd0, 8'd0, 2'd0, { 5'd0, 35'd0, 9'd0, 139'd0, 3'd0 } };
    send_to_noc_load_request_pkt__val = 1'd0;
    for ( int unsigned i = 1'd0; i < 5'( __const__num_rd_tiles_at_update_all ); i += 1'd1 ) begin
      read_crossbar__recv__val[5'(i)] = recv_raddr__val[5'(i)];
      read_crossbar__recv__msg[5'(i)] = rd_pkt[5'(i)];
      recv_raddr__rdy[5'(i)] = read_crossbar__recv__rdy[5'(i)];
    end
    read_crossbar__recv__val[5'( __const__num_rd_tiles_at_update_all )] = recv_from_noc_load_request__val;
    read_crossbar__recv__msg[5'( __const__num_rd_tiles_at_update_all )] = rd_pkt[5'( __const__num_rd_tiles_at_update_all )];
    recv_from_noc_load_request__rdy = read_crossbar__recv__rdy[5'( __const__num_rd_tiles_at_update_all )];
    for ( int unsigned i = 1'd0; i < 5'( __const__num_wr_tiles_at_update_all ); i += 1'd1 ) begin
      write_crossbar__recv__val[5'(i)] = recv_waddr__val[5'(i)];
      write_crossbar__recv__msg[5'(i)] = wr_pkt[5'(i)];
      recv_waddr__rdy[5'(i)] = write_crossbar__recv__rdy[5'(i)];
      recv_wdata__rdy[5'(i)] = write_crossbar__recv__rdy[5'(i)];
    end
    write_crossbar__recv__val[5'( __const__num_wr_tiles_at_update_all )] = recv_from_noc_store_request__val;
    write_crossbar__recv__msg[5'( __const__num_wr_tiles_at_update_all )] = wr_pkt[5'( __const__num_wr_tiles_at_update_all )];
    recv_from_noc_store_request__rdy = write_crossbar__recv__rdy[5'( __const__num_wr_tiles_at_update_all )];
    for ( int unsigned i = 1'd0; i < 6'( __const__num_xbar_in_rd_ports_at_update_all ); i += 1'd1 )
      if ( 5'(i) < 5'( __const__num_rd_tiles_at_update_all ) ) begin
        send_rdata__msg[5'( 5'(i) )] = response_crossbar__send__msg[5'(i)].data;
        send_rdata__val[5'( 5'(i) )] = response_crossbar__send__val[5'(i)];
        response_crossbar__send__rdy[5'(i)] = send_rdata__rdy[5'( 5'(i) )];
      end
      else begin
        __tmpvar__update_all_from_cgra_id = response_crossbar__send__msg[5'(i)].src_cgra;
        __tmpvar__update_all_from_tile_id = response_crossbar__send__msg[5'(i)].src_tile;
        send_to_noc_load_response_pkt__msg = { cgra_id, __tmpvar__update_all_from_cgra_id, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], idTo2d_x_lut[__tmpvar__update_all_from_cgra_id], idTo2d_y_lut[__tmpvar__update_all_from_cgra_id], 9'd0, __tmpvar__update_all_from_tile_id, response_crossbar__send__msg[5'(i)].remote_src_port, 8'd0, 2'd0, { 5'( __const__CMD_LOAD_RESPONSE ), response_crossbar__send__msg[5'(i)].data, response_crossbar__send__msg[5'(i)].addr, 139'd0, 3'd0 } };
        send_to_noc_load_response_pkt__val = response_crossbar__send__val[5'(i)];
        response_crossbar__send__rdy[5'(i)] = send_to_noc_load_response_pkt__rdy;
      end
    send_to_noc_load_request_pkt__msg = { cgra_id, 2'd0, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], 2'd0, 1'd0, 9'd0, 9'd0, read_crossbar__send__msg[2'( __const__num_banks_per_cgra_at_update_all )].src, 8'd0, 2'd0, { 5'( __const__CMD_LOAD_REQUEST ), 35'd0, read_crossbar__send__msg[2'( __const__num_banks_per_cgra_at_update_all )].addr, 139'd0, 3'd0 } };
    send_to_noc_load_request_pkt__val = read_crossbar__send__val[2'( __const__num_banks_per_cgra_at_update_all )];
    recv_from_noc_load_response_pkt__rdy = response_crossbar__recv__rdy[2'( __const__num_banks_per_cgra_at_update_all )];
    response_crossbar__recv__val[2'( __const__num_banks_per_cgra_at_update_all )] = recv_from_noc_load_response_pkt__val;
    response_crossbar__recv__msg[2'( __const__num_banks_per_cgra_at_update_all )] = { 2'( __const__num_banks_per_cgra_at_update_all ), recv_from_noc_load_response_pkt__msg.remote_src_port, recv_from_noc_load_response_pkt__msg.payload.data_addr, recv_from_noc_load_response_pkt__msg.payload.data, recv_from_noc_load_response_pkt__msg.src, recv_from_noc_load_response_pkt__msg.src_tile_id, 5'd0, 1'd0, 9'd0, 9'd0 };
    read_crossbar__send__rdy[2'( __const__num_banks_per_cgra_at_update_all )] = send_to_noc_load_request_pkt__rdy;
    send_to_noc_store_pkt__msg = { cgra_id, 2'd0, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], 2'd0, 1'd0, 9'd0, 9'd0, write_crossbar__send__msg[2'( __const__num_banks_per_cgra_at_update_all )].src, 8'd0, 2'd0, { 5'( __const__CMD_STORE_REQUEST ), write_crossbar__send__msg[2'( __const__num_banks_per_cgra_at_update_all )].data, write_crossbar__send__msg[2'( __const__num_banks_per_cgra_at_update_all )].addr, 139'd0, 3'd0 } };
    send_to_noc_store_pkt__val = write_crossbar__send__val[2'( __const__num_banks_per_cgra_at_update_all )];
    write_crossbar__send__rdy[2'( __const__num_banks_per_cgra_at_update_all )] = send_to_noc_store_pkt__rdy;
  end

  assign memory_wrapper__clk[0] = clk;
  assign memory_wrapper__reset[0] = reset;
  assign memory_wrapper__clk[1] = clk;
  assign memory_wrapper__reset[1] = reset;
  assign read_crossbar__clk = clk;
  assign read_crossbar__reset = reset;
  assign write_crossbar__clk = clk;
  assign write_crossbar__reset = reset;
  assign response_crossbar__clk = clk;
  assign response_crossbar__reset = reset;
  assign idTo2d_x_lut[0] = 2'd0;
  assign idTo2d_y_lut[0] = 1'd0;
  assign idTo2d_x_lut[1] = 2'd1;
  assign idTo2d_y_lut[1] = 1'd0;
  assign idTo2d_x_lut[2] = 2'd2;
  assign idTo2d_y_lut[2] = 1'd0;
  assign idTo2d_x_lut[3] = 2'd3;
  assign idTo2d_y_lut[3] = 1'd0;
  assign memory_wrapper__recv_rd__msg[0] = read_crossbar__send__msg[0];
  assign read_crossbar__send__rdy[0] = memory_wrapper__recv_rd__rdy[0];
  assign memory_wrapper__recv_rd__val[0] = read_crossbar__send__val[0];
  assign memory_wrapper__recv_wr__msg[0] = write_crossbar__send__msg[0];
  assign write_crossbar__send__rdy[0] = memory_wrapper__recv_wr__rdy[0];
  assign memory_wrapper__recv_wr__val[0] = write_crossbar__send__val[0];
  assign response_crossbar__recv__msg[0] = memory_wrapper__send__msg[0];
  assign memory_wrapper__send__rdy[0] = response_crossbar__recv__rdy[0];
  assign response_crossbar__recv__val[0] = memory_wrapper__send__val[0];
  assign memory_wrapper__recv_rd__msg[1] = read_crossbar__send__msg[1];
  assign read_crossbar__send__rdy[1] = memory_wrapper__recv_rd__rdy[1];
  assign memory_wrapper__recv_rd__val[1] = read_crossbar__send__val[1];
  assign memory_wrapper__recv_wr__msg[1] = write_crossbar__send__msg[1];
  assign write_crossbar__send__rdy[1] = memory_wrapper__recv_wr__rdy[1];
  assign memory_wrapper__recv_wr__val[1] = write_crossbar__send__val[1];
  assign response_crossbar__recv__msg[1] = memory_wrapper__send__msg[1];
  assign memory_wrapper__send__rdy[1] = response_crossbar__recv__rdy[1];
  assign response_crossbar__recv__val[1] = memory_wrapper__send__val[1];

endmodule