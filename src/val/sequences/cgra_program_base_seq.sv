// ============================================================================
// File   : cgra_program_base_seq.sv
// Brief  : Shared helper sequence for CGRA programming flows.
//          Holds common descriptors and packet-send helpers used by the
//          step-specific sequences.
// ============================================================================
class cgra_program_base_seq extends cgra_base_seq;

    localparam logic [4:0] CMD_LAUNCH                       = 5'd0;
    localparam logic [4:0] CMD_CONFIG                       = 5'd3;
    localparam logic [4:0] CMD_CONFIG_PROLOGUE_FU           = 5'd4;
    localparam logic [4:0] CMD_CONFIG_PROLOGUE_FU_CROSSBAR  = 5'd5;
    localparam logic [4:0] CMD_CONFIG_PROLOGUE_ROUTING_XBAR = 5'd6;
    localparam logic [4:0] CMD_CONFIG_TOTAL_CTRL_COUNT      = 5'd7;
    localparam logic [4:0] CMD_CONFIG_COUNT_PER_ITER        = 5'd8;
    localparam logic [4:0] CMD_STORE_REQUEST                = 5'd12;
    localparam logic [4:0] CMD_CONST                        = 5'd13;

    cgra_data_entry_t data_entries[$];
    cgra_tile_cfg     tile_cfgs[$];
    logic [8:0]       cpu_src = 9'd0;
    virtual cgra_if   vif;

    function new(string name = "cgra_program_base_seq");
        super.new(name);
    endfunction

    task init_vif();
        if (vif != null)
            return;

        if (!uvm_config_db #(virtual cgra_if)::get(null, get_full_name(), "vif", vif))
            `uvm_fatal(get_type_name(),
                {"Virtual interface 'vif' not found. ",
                 "Ensure cgra_tb_top calls uvm_config_db::set()."})
    endtask

    function IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d
        build_base_pkt(logic [8:0] dst, logic [4:0] cmd);

        IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt             = '0;
        pkt.src         = cpu_src;
        pkt.dst         = dst;
        pkt.payload.cmd = cmd;
        return pkt;
    endfunction

    task send_store_request(
        input logic [8:0]  dst_tile,
        input logic [8:0]  addr,
        input logic [31:0] data,
        input logic [0:0]  predicate
    );
        automatic IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt = build_base_pkt(dst_tile, CMD_STORE_REQUEST);
        pkt.payload.data.payload   = data;
        pkt.payload.data.predicate = predicate;
        pkt.payload.data.bypass    = 1'b0;
        pkt.payload.data.delay     = 1'b0;
        pkt.payload.data_addr      = addr;
        send_cpu_pkt_with_handshake(pkt);
    endtask

    task send_simple_cmd(
        input logic [8:0]  dst_tile,
        input logic [4:0]  cmd,
        input logic [31:0] data,
        input logic [0:0]  predicate,
        input logic [8:0]  data_addr
    );
        automatic IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt = build_base_pkt(dst_tile, cmd);
        pkt.payload.data.payload   = data;
        pkt.payload.data.predicate = predicate;
        pkt.payload.data.bypass    = 1'b0;
        pkt.payload.data.delay     = 1'b0;
        pkt.payload.data_addr      = data_addr;
        send_cpu_pkt_with_handshake(pkt);
    endtask

    task send_ctrl_config(
        input logic [8:0]        dst_tile,
        input logic [4:0]        cmd,
        input cgra_ctrl_step_cfg step,
        input logic [2:0]        ctrl_addr
    );
        automatic IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt = build_base_pkt(dst_tile, cmd);

        pkt.payload.ctrl_addr                  = ctrl_addr;
        pkt.payload.ctrl.operation             = step.operation;
        pkt.payload.ctrl.fu_in                 = step.fu_in;
        pkt.payload.ctrl.routing_xbar_outport  = step.routing_xbar_outport;
        pkt.payload.ctrl.fu_xbar_outport       = step.fu_xbar_outport;
        pkt.payload.ctrl.vector_factor_power   = step.vector_factor_power;
        pkt.payload.ctrl.is_last_ctrl          = step.is_last_ctrl;
        pkt.payload.ctrl.write_reg_from        = step.write_reg_from;
        pkt.payload.ctrl.write_reg_idx         = step.write_reg_idx;
        pkt.payload.ctrl.read_reg_from         = step.read_reg_from;
        pkt.payload.ctrl.read_reg_idx          = step.read_reg_idx;

        pkt.payload.data.payload               = step.data_payload;
        pkt.payload.data.predicate             = step.data_predicate;
        pkt.payload.data.bypass                = 1'b0;
        pkt.payload.data.delay                 = 1'b0;

        send_cpu_pkt_with_handshake(pkt);
    endtask

    task send_launch(input logic [8:0] dst_tile);
        automatic IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt = build_base_pkt(dst_tile, CMD_LAUNCH);
        send_cpu_pkt_with_handshake(pkt);
    endtask

    task send_cpu_pkt_with_handshake(
        input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt
    );
        cgra_seq_item item;
        bit accepted;

        init_vif();
        accepted = 1'b0;

        while (!accepted) begin
            item = cgra_seq_item::type_id::create("cfg_item");
            start_item(item);

            item.reset                         = 1'b0;
            item.address_lower                 = '0;
            item.address_upper                 = '0;
            item.cgra_id                       = '0;
            item.recv_from_cpu_pkt__msg        = pkt;
            item.recv_from_cpu_pkt__val        = 1'b1;
            item.recv_from_inter_cgra_noc__msg = '0;
            item.recv_from_inter_cgra_noc__val = 1'b0;
            item.send_to_cpu_pkt__rdy          = 1'b1;
            item.send_to_inter_cgra_noc__rdy   = 1'b1;

            finish_item(item);
            accepted = vif.driver_cb.recv_from_cpu_pkt__rdy;
        end
    endtask
endclass : cgra_program_base_seq
