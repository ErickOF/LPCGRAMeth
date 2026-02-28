module AddFN__expWidth_9__sigWidth_23
import cgra_pkg::*;
(
  input  logic [31:0] a ,
  input  logic [31:0] b ,
  input  logic [0:0] clk ,
  output logic [31:0] out ,
  input  logic [0:0] reset ,
  input  logic [2:0] roundingMode ,
  input  logic [0:0] subOp 
);
  logic [32:0] conv_a;
  logic [32:0] conv_b;
  logic [4:0] exception_flags;
  //-------------------------------------------------------------
  // Component adder
  //-------------------------------------------------------------

  logic [32:0] adder_a;
  logic [32:0] adder_b;
  logic [0:0] adder_clk;
  logic [0:0] adder_control;
  logic [4:0] adder_exceptionFlags;
  logic [32:0] adder_out;
  logic [0:0] adder_reset;
  logic [2:0] adder_roundingMode;
  logic [0:0] adder_subOp;

  AddRecFN__expWidth_9__sigWidth_23 adder
  (
    .a( adder_a ),
    .b( adder_b ),
    .clk( adder_clk ),
    .control( adder_control ),
    .exceptionFlags( adder_exceptionFlags ),
    .out( adder_out ),
    .reset( adder_reset ),
    .roundingMode( adder_roundingMode ),
    .subOp( adder_subOp )
  );

  //-------------------------------------------------------------
  // End of component adder
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component rec_to_std_conv
  //-------------------------------------------------------------

  logic [0:0] rec_to_std_conv_clk;
  logic [32:0] rec_to_std_conv_in_;
  logic [31:0] rec_to_std_conv_out;
  logic [0:0] rec_to_std_conv_reset;

  RecFNToFN__expWidth_9__sigWidth_23 rec_to_std_conv
  (
    .clk( rec_to_std_conv_clk ),
    .in_( rec_to_std_conv_in_ ),
    .out( rec_to_std_conv_out ),
    .reset( rec_to_std_conv_reset )
  );

  //-------------------------------------------------------------
  // End of component rec_to_std_conv
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component std_to_rec_conv_a
  //-------------------------------------------------------------

  logic [0:0] std_to_rec_conv_a_clk;
  logic [31:0] std_to_rec_conv_a_in_;
  logic [32:0] std_to_rec_conv_a_out;
  logic [0:0] std_to_rec_conv_a_reset;

  FNToRecFN__expWidth_9__sigWidth_23 std_to_rec_conv_a
  (
    .clk( std_to_rec_conv_a_clk ),
    .in_( std_to_rec_conv_a_in_ ),
    .out( std_to_rec_conv_a_out ),
    .reset( std_to_rec_conv_a_reset )
  );

  //-------------------------------------------------------------
  // End of component std_to_rec_conv_a
  //-------------------------------------------------------------

  //-------------------------------------------------------------
  // Component std_to_rec_conv_b
  //-------------------------------------------------------------

  logic [0:0] std_to_rec_conv_b_clk;
  logic [31:0] std_to_rec_conv_b_in_;
  logic [32:0] std_to_rec_conv_b_out;
  logic [0:0] std_to_rec_conv_b_reset;

  FNToRecFN__expWidth_9__sigWidth_23 std_to_rec_conv_b
  (
    .clk( std_to_rec_conv_b_clk ),
    .in_( std_to_rec_conv_b_in_ ),
    .out( std_to_rec_conv_b_out ),
    .reset( std_to_rec_conv_b_reset )
  );

  //-------------------------------------------------------------
  // End of component std_to_rec_conv_b
  //-------------------------------------------------------------

  assign std_to_rec_conv_a_clk = clk;
  assign std_to_rec_conv_a_reset = reset;
  assign std_to_rec_conv_b_clk = clk;
  assign std_to_rec_conv_b_reset = reset;
  assign rec_to_std_conv_clk = clk;
  assign rec_to_std_conv_reset = reset;
  assign adder_clk = clk;
  assign adder_reset = reset;
  assign std_to_rec_conv_a_in_ = a;
  assign conv_a = std_to_rec_conv_a_out;
  assign std_to_rec_conv_b_in_ = b;
  assign conv_b = std_to_rec_conv_b_out;
  assign adder_control = 1'd1;
  assign adder_a = conv_a;
  assign adder_b = conv_b;
  assign adder_roundingMode = roundingMode;
  assign adder_subOp = subOp;
  assign exception_flags = adder_exceptionFlags;
  assign rec_to_std_conv_in_ = adder_out;
  assign out = rec_to_std_conv_out;

endmodule