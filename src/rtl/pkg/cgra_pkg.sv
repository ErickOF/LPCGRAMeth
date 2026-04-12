package cgra_pkg;

typedef struct packed {
  logic [5:0] ctrl ;
  logic [0:0] predicate ;
  logic [3:0][2:0] fu_in ;
  logic [11:0][3:0] outport ;
  logic [9:0][0:0] predicate_in ;
} CGRAConfig_6_4_10_12;

typedef struct packed {
  logic [31:0] payload ;
  logic [0:0] predicate ;
  logic [0:0] bypass ;
} CGRAData_32_1_1;

typedef struct packed {
  logic [0:0] payload ;
  logic [0:0] predicate ;
} CGRAData_1_1;

endpackage
