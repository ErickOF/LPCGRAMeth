package cgra_pkg;

typedef struct packed {
  logic [31:0] payload;
  logic [0:0] predicate;
  logic [0:0] bypass;
  logic [0:0] delay;
} CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1;

typedef struct packed {
  logic [6:0] operation;
  logic [3:0][2:0] fu_in;
  logic [11:0][3:0] routing_xbar_outport;
  logic [11:0][1:0] fu_xbar_outport;
  logic [2:0] vector_factor_power;
  logic [0:0] is_last_ctrl;
  logic [3:0][1:0] write_reg_from;
  logic [3:0][3:0] write_reg_idx;
  logic [3:0][0:0] read_reg_from;
  logic [3:0][3:0] read_reg_idx;
} CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f;

typedef struct packed {
  logic [4:0] cmd;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 data;
  logic [8:0] data_addr;
  CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f ctrl;
  logic [2:0] ctrl_addr;
} MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f;

typedef struct packed {
  logic [1:0] src;
  logic [1:0] dst;
  logic [1:0] src_x;
  logic [0:0] src_y;
  logic [1:0] dst_x;
  logic [0:0] dst_y;
  logic [8:0] src_tile_id;
  logic [8:0] dst_tile_id;
  logic [4:0] remote_src_port;
  logic [7:0] opaque;
  logic [1:0] vc_id;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f payload;
} InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b;

typedef struct packed {
  logic [8:0] src;
  logic [8:0] dst;
  logic [1:0] src_cgra_id;
  logic [1:0] dst_cgra_id;
  logic [1:0] src_cgra_x;
  logic [0:0] src_cgra_y;
  logic [1:0] dst_cgra_x;
  logic [0:0] dst_cgra_y;
  logic [7:0] opaque;
  logic [0:0] vc_id;
  MultiCgraPayload_Cmd_Data_DataAddr_Ctrl_CtrlAddr__a0427cd98cfcae6f payload;
} IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d;

typedef struct packed {
  logic [0:0] dst;
  InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b inter_cgra_pkt;
} ControllerNocXbarPacket_InterCgraPktType__4cecb651ad7cb757;

typedef struct packed {
  logic [4:0] src;
  logic [1:0] dst;
  logic [8:0] addr;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 data;
  logic [1:0] src_cgra;
  logic [8:0] src_tile;
  logic [4:0] remote_src_port;
  logic [0:0] streaming_rd;
  logic [8:0] streaming_rd_stride;
  logic [8:0] streaming_rd_end_addr;
} MemAccessPacket_32_3_512__0e5e373c0405ceef;

typedef struct packed {
  logic [1:0] src;
  logic [4:0] dst;
  logic [8:0] addr;
  CgraData_32_1_1_1__payload_32__predicate_1__bypass_1__delay_1 data;
  logic [1:0] src_cgra;
  logic [8:0] src_tile;
  logic [4:0] remote_src_port;
  logic [0:0] streaming_rd;
  logic [8:0] streaming_rd_stride;
  logic [8:0] streaming_rd_end_addr;
} MemAccessPacket_3_32_512__62fa6e6064d885d7;

endpackage
