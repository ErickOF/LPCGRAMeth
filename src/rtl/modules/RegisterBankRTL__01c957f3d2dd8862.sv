module RegisterBankRTL__01c957f3d2dd8862
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f inport_opt ,
  input  logic [0:0] inport_valid [0:2],
  input  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 inport_wdata [0:2],
  input  logic [0:0] reset ,
  output CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 send_data_to_fu__msg  ,
  input logic [0:0] send_data_to_fu__rdy  ,
  output logic [0:0] send_data_to_fu__val  
);
  localparam logic [1:0] __const__reg_bank_id_at_access_registers  = 2'd3;
  localparam logic [1:0] __const__reg_bank_id_at_update_send_val  = 2'd3;
  //-------------------------------------------------------------
  // Component reg_file
  //-------------------------------------------------------------

  logic [0:0] reg_file__clk;
  logic [3:0] reg_file__raddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_file__rdata [0:0];
  logic [0:0] reg_file__reset;
  logic [3:0] reg_file__waddr [0:0];
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 reg_file__wdata [0:0];
  logic [0:0] reg_file__wen [0:0];

  RegisterFile__84f0703fd9bfd535 reg_file
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
  logic [1:0] __tmpvar__access_registers_write_reg_from;

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/register_cluster/RegisterBankRTL.py:41
  // @update
  // def access_registers():
  //   # Initializes signals.
  //   s.reg_file.raddr[0] @= AddrType()
  //   s.send_data_to_fu.msg @= DataType()
  //   s.reg_file.waddr[0] @= AddrType()
  //   s.reg_file.wdata[0] @= DataType()
  //   s.reg_file.wen[0] @= 0
  // 
  //   if s.inport_opt.read_reg_from[reg_bank_id]:
  //     s.reg_file.raddr[0] @= s.inport_opt.read_reg_idx[reg_bank_id]
  //     s.send_data_to_fu.msg @= s.reg_file.rdata[0]
  // 
  //   write_reg_from = s.inport_opt.write_reg_from[reg_bank_id]
  //   if ~s.reset & (write_reg_from > 0):
  //     if s.inport_valid[write_reg_from - 1]:
  //       s.reg_file.waddr[0] @= s.inport_opt.write_reg_idx[reg_bank_id]
  //       s.reg_file.wdata[0] @= s.inport_wdata[write_reg_from - 1]
  //       s.reg_file.wen[0] @= 1
  
  always_comb begin : access_registers
    reg_file__raddr[1'd0] = 4'd0;
    send_data_to_fu__msg = { 32'd0, 1'd0, 1'd0, 1'd0 };
    reg_file__waddr[1'd0] = 4'd0;
    reg_file__wdata[1'd0] = { 32'd0, 1'd0, 1'd0, 1'd0 };
    reg_file__wen[1'd0] = 1'd0;
    if ( inport_opt.read_reg_from[2'( __const__reg_bank_id_at_access_registers )] ) begin
      reg_file__raddr[1'd0] = inport_opt.read_reg_idx[2'( __const__reg_bank_id_at_access_registers )];
      send_data_to_fu__msg = reg_file__rdata[1'd0];
    end
    __tmpvar__access_registers_write_reg_from = inport_opt.write_reg_from[2'( __const__reg_bank_id_at_access_registers )];
    if ( ( ~reset ) & ( __tmpvar__access_registers_write_reg_from > 2'd0 ) ) begin
      if ( inport_valid[__tmpvar__access_registers_write_reg_from - 2'd1] ) begin
        reg_file__waddr[1'd0] = inport_opt.write_reg_idx[2'( __const__reg_bank_id_at_access_registers )];
        reg_file__wdata[1'd0] = inport_wdata[__tmpvar__access_registers_write_reg_from - 2'd1];
        reg_file__wen[1'd0] = 1'd1;
      end
    end
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/CGRA-Flow/VectorCGRA/mem/register_cluster/RegisterBankRTL.py:61
  // @update
  // def update_send_val():
  //   s.send_data_to_fu.val @= 0
  //   if ~s.reset & s.inport_opt.read_reg_from[reg_bank_id]:
  //     s.send_data_to_fu.val @= 1
  
  always_comb begin : update_send_val
    send_data_to_fu__val = 1'd0;
    if ( ( ~reset ) & inport_opt.read_reg_from[2'( __const__reg_bank_id_at_update_send_val )] ) begin
      send_data_to_fu__val = 1'd1;
    end
  end

  assign reg_file__clk = clk;
  assign reg_file__reset = reset;

endmodule