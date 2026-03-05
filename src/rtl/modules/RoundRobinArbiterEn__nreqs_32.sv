module RoundRobinArbiterEn__nreqs_32
import cgra_pkg::*;
(
  input  logic [0:0] clk ,
  input  logic [0:0] en ,
  output logic [31:0] grants ,
  input  logic [31:0] reqs ,
  input  logic [0:0] reset 
);
  localparam logic [5:0] __const__nreqs_at_comb_reqs_int  = 6'd32;
  localparam logic [6:0] __const__nreqsX2_at_comb_reqs_int  = 7'd64;
  localparam logic [5:0] __const__nreqs_at_comb_grants  = 6'd32;
  localparam logic [5:0] __const__nreqs_at_comb_priority_int  = 6'd32;
  localparam logic [6:0] __const__nreqsX2_at_comb_priority_int  = 7'd64;
  localparam logic [6:0] __const__nreqsX2_at_comb_kills  = 7'd64;
  localparam logic [6:0] __const__nreqsX2_at_comb_grants_int  = 7'd64;
  logic [63:0] grants_int;
  logic [64:0] kills;
  logic [0:0] priority_en;
  logic [63:0] priority_int;
  logic [63:0] reqs_int;
  //-------------------------------------------------------------
  // Component priority_reg
  //-------------------------------------------------------------

  logic [0:0] priority_reg__clk;
  logic [0:0] priority_reg__en;
  logic [31:0] priority_reg__in_;
  logic [31:0] priority_reg__out;
  logic [0:0] priority_reg__reset;

  RegEnRst__Type_Bits32__reset_value_1 priority_reg
  (
    .clk( priority_reg__clk ),
    .en( priority_reg__en ),
    .in_( priority_reg__in_ ),
    .out( priority_reg__out ),
    .reset( priority_reg__reset )
  );

  //-------------------------------------------------------------
  // End of component priority_reg
  //-------------------------------------------------------------

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:118
  // @update
  // def comb_grants():
  //   for i in range( nreqs ):
  //     s.grants[i] @= s.grants_int[i] | s.grants_int[nreqs+i]
  
  always_comb begin : comb_grants
    for ( int unsigned i = 1'd0; i < 6'( __const__nreqs_at_comb_grants ); i += 1'd1 )
      grants[5'(i)] = grants_int[6'(i)] | grants_int[6'( __const__nreqs_at_comb_grants ) + 6'(i)];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:141
  // @update
  // def comb_grants_int():
  //   for i in range( nreqsX2 ):
  //     if s.priority_int[i]:
  //       s.grants_int[i] @= s.reqs_int[i]
  //     else:
  //       s.grants_int[i] @= ~s.kills[i] & s.reqs_int[i]
  
  always_comb begin : comb_grants_int
    for ( int unsigned i = 1'd0; i < 7'( __const__nreqsX2_at_comb_grants_int ); i += 1'd1 )
      if ( priority_int[6'(i)] ) begin
        grants_int[6'(i)] = reqs_int[6'(i)];
      end
      else
        grants_int[6'(i)] = ( ~kills[7'(i)] ) & reqs_int[6'(i)];
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:132
  // @update
  // def comb_kills():
  //   s.kills[0] @= 1
  //   for i in range( nreqsX2 ):
  //     if s.priority_int[i]:
  //       s.kills[i+1] @= s.reqs_int[i]
  //     else:
  //       s.kills[i+1] @= s.kills[i] | ( ~s.kills[i] & s.reqs_int[i] )
  
  always_comb begin : comb_kills
    kills[7'd0] = 1'd1;
    for ( int unsigned i = 1'd0; i < 7'( __const__nreqsX2_at_comb_kills ); i += 1'd1 )
      if ( priority_int[6'(i)] ) begin
        kills[7'(i) + 7'd1] = reqs_int[6'(i)];
      end
      else
        kills[7'(i) + 7'd1] = kills[7'(i)] | ( ( ~kills[7'(i)] ) & reqs_int[6'(i)] );
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:123
  // @update
  // def comb_priority_en():
  //   s.priority_en @= ( s.grants != 0 ) & s.en
  
  always_comb begin : comb_priority_en
    priority_en = ( grants != 32'd0 ) & en;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:127
  // @update
  // def comb_priority_int():
  //   s.priority_int[    0:nreqs  ] @= s.priority_reg.out
  //   s.priority_int[nreqs:nreqsX2] @= 0
  
  always_comb begin : comb_priority_int
    priority_int[6'd31:6'd0] = priority_reg__out;
    priority_int[6'd63:6'( __const__nreqs_at_comb_priority_int )] = 32'd0;
  end

  // PyMTL Update Block Source
  // At /WORK_REPO/venv/lib/python3.11/site-packages/pymtl3/stdlib/primitive/arbiters.py:113
  // @update
  // def comb_reqs_int():
  //   s.reqs_int [    0:nreqs  ] @= s.reqs
  //   s.reqs_int [nreqs:nreqsX2] @= s.reqs
  
  always_comb begin : comb_reqs_int
    reqs_int[6'd31:6'd0] = reqs;
    reqs_int[6'd63:6'( __const__nreqs_at_comb_reqs_int )] = reqs;
  end

  assign priority_reg__clk = clk;
  assign priority_reg__reset = reset;
  assign priority_reg__en = priority_en;
  assign priority_reg__in_[31:1] = grants[30:0];
  assign priority_reg__in_[0:0] = grants[31:31];

endmodule