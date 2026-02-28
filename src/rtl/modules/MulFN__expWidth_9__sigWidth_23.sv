module MulFN__expWidth_9__sigWidth_23
import cgra_pkg::*;
(
  input  logic [31:0] a ,
  input  logic [31:0] b ,
  input  logic [0:0] clk ,
  output logic [31:0] out ,
  input  logic [0:0] reset ,
  input  logic [2:0] roundingMode 
);
  logic [32:0] conv_a;
  logic [32:0] conv_b;
  logic [4:0] exception_flags;
  //-------------------------------------------------------------
  // Component multiplier
  //-------------------------------------------------------------

  logic [32:0] multiplier_a;
  logic [32:0] multiplier_b;
  logic [0:0] multiplier_clk;
  logic [0:0] multiplier_control;
  logic [4:0] multiplier_exceptionFlags;
  logic [32:0] multiplier_out;
  logic [0:0] multiplier_reset;
  logic [2:0] multiplier_roundingMode;

  MulRecFN__expWidth_9__sigWidth_23 multiplier
  (
    .a( multiplier_a ),
    .b( multiplier_b ),
    .clk( multiplier_clk ),
    .control( multiplier_control ),
    .exceptionFlags( multiplier_exceptionFlags ),
    .out( multiplier_out ),
    .reset( multiplier_reset ),
    .roundingMode( multiplier_roundingMode )
  );

  //-------------------------------------------------------------
  // End of component multiplier
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
  assign multiplier_clk = clk;
  assign multiplier_reset = reset;
  assign std_to_rec_conv_a_in_ = a;
  assign conv_a = std_to_rec_conv_a_out;
  assign std_to_rec_conv_b_in_ = b;
  assign conv_b = std_to_rec_conv_b_out;
  assign multiplier_control = 1'd1;
  assign multiplier_a = conv_a;
  assign multiplier_b = conv_b;
  assign multiplier_roundingMode = roundingMode;
  assign exception_flags = multiplier_exceptionFlags;
  assign rec_to_std_conv_in_ = multiplier_out;
  assign out = rec_to_std_conv_out;

endmodule