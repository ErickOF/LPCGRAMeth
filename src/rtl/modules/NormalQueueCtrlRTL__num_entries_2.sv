module NormalQueueCtrlRTL__num_entries_2
(
  input logic [0:0] clk,
  output logic [1:0] count,
  input logic [0:0] deq_en,
  output logic [0:0] deq_rdy,
  input logic [0:0] enq_en,
  output logic [0:0] enq_rdy,
  output logic [0:0] raddr,
  input logic [0:0] reset,
  output logic [0:0] waddr,
  output logic [0:0] wen
);
  localparam logic [0:0] last_idx = 1'd1;
  localparam logic [1:0] num_entries = 2'd2;
  logic [0:0] deq_xfer ;
  logic [0:0] enq_xfer ;
  logic [0:0] head ;
  logic [0:0] tail ;

  // PyMTL Lambda Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:86
  // s.deq_rdy //= lambda: ~s.reset & ( s.count > CountType(0) )
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_deq_rdy
    deq_rdy = ( ~reset ) & ( count > 2'd0 );
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:89
  // s.deq_xfer //= lambda: s.deq_en & s.deq_rdy
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_deq_xfer
    deq_xfer = deq_en & deq_rdy;
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:85
  // s.enq_rdy //= lambda: ~s.reset & ( s.count < s.num_entries )
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_enq_rdy
    enq_rdy = ( ~reset ) & ( count < num_entries );
  end

  // PyMTL Lambda Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:88
  // s.enq_xfer //= lambda: s.enq_en & s.enq_rdy
  
  always_comb begin : _lambda__s_dut_tile_0__channel_0__queues_0__ctrl_enq_xfer
    enq_xfer = enq_en & enq_rdy;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.7/site-packages/pymtl3/stdlib/rtl/queues.py:91
  // @s.update_ff
  // def up_reg():
  // 
  //   if s.reset:
  //     s.head  <<= PtrType(0)
  //     s.tail  <<= PtrType(0)
  //     s.count <<= CountType(0)
  // 
  //   else:
  //     if s.deq_xfer:
  //       s.head <<= s.head + PtrType(1) if s.head < s.last_idx else PtrType(0)
  // 
  //     if s.enq_xfer:
  //       s.tail <<= s.tail + PtrType(1) if s.tail < s.last_idx else PtrType(0)
  // 
  //     if s.enq_xfer & ~s.deq_xfer:
  //       s.count <<= s.count + CountType(1)
  //     if ~s.enq_xfer & s.deq_xfer:
  //       s.count <<= s.count - CountType(1)
  
  always_ff @(posedge clk) begin : up_reg
    if ( reset ) begin
      head <= 1'd0;
      tail <= 1'd0;
      count <= 2'd0;
    end
    else begin
      if ( deq_xfer ) begin
        head <= ( head < last_idx ) ? head + 1'd1 : 1'd0;
      end
      if ( enq_xfer ) begin
        tail <= ( tail < last_idx ) ? tail + 1'd1 : 1'd0;
      end
      if ( enq_xfer & ( ~deq_xfer ) ) begin
        count <= count + 2'd1;
      end
      if ( ( ~enq_xfer ) & deq_xfer ) begin
        count <= count - 2'd1;
      end
    end
  end

  assign wen = enq_xfer;
  assign waddr = tail;
  assign raddr = head;

endmodule