// ============================================================================
// Name:         cgra_program_base_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-03-21
// Description:  Shared helper sequence for CGRA programming flows. Holds
//      common descriptors and packet-send helpers used by the step-specific
//      sequences.
// ============================================================================

class cgra_program_base_seq extends cgra_base_seq;

    cgra_data_entry_t data_entries[$];
    cgra_tile_cfg     tile_cfgs[$];
    logic [8:0]       cpu_src = 9'd0;
    virtual cgra_if   vif;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the shared programming helper sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_program_base_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Function: cmd_to_string
    //
    // Description: Converts command enum values into readable command names.
    //
    // Params:
    //   - cmd (input cgra_cmd_e): Command enum value.
    // Returns: string
    // ------------------------------------------------------------------------
    function string cmd_to_string(cgra_cmd_e cmd);
        case (cmd)
            CMD_LAUNCH:                       return "CMD_LAUNCH";
            CMD_CONFIG:                       return "CMD_CONFIG";
            CMD_CONFIG_PROLOGUE_FU:           return "CMD_CONFIG_PROLOGUE_FU";
            CMD_CONFIG_PROLOGUE_FU_CROSSBAR:  return "CMD_CONFIG_PROLOGUE_FU_CROSSBAR";
            CMD_CONFIG_PROLOGUE_ROUTING_XBAR: return "CMD_CONFIG_PROLOGUE_ROUTING_XBAR";
            CMD_CONFIG_TOTAL_CTRL_COUNT:      return "CMD_CONFIG_TOTAL_CTRL_COUNT";
            CMD_CONFIG_COUNT_PER_ITER:        return "CMD_CONFIG_COUNT_PER_ITER";
            CMD_STORE_REQUEST:                return "CMD_STORE_REQUEST";
            CMD_CONST:                        return "CMD_CONST";
            default:                          return $sformatf("CMD_UNKNOWN_%0d", cmd);
        endcase
    endfunction

    // ------------------------------------------------------------------------
    // Function: opcode_to_string
    //
    // Description: Converts opcode values into readable operation names.
    //
    // Params:
    //   - opcode (input logic [6:0]): FU operation opcode.
    // Returns: string
    // ------------------------------------------------------------------------
    function string opcode_to_string(logic [6:0] opcode);
        case (opcode)
            `OPT_NAH:       return "OPT_NAH";
            `OPT_ADD:       return "OPT_ADD";
            `OPT_MUL:       return "OPT_MUL";
            `OPT_LD:        return "OPT_LD";
            `OPT_DIV:       return "OPT_DIV";
            `OPT_REM:       return "OPT_REM";
            `OPT_ADD_CONST: return "OPT_ADD_CONST";
            `OPT_PHI_CONST: return "OPT_PHI_CONST";
            `OPT_EQ_CONST:  return "OPT_EQ_CONST";
            `OPT_EXT:       return "OPT_EXT";
            `OPT_BRH:       return "OPT_BRH";
            default:        return $sformatf("OPT_UNKNOWN_%0d", opcode);
        endcase
    endfunction

    // ------------------------------------------------------------------------
    // Function: summarize_pkt
    //
    // Description: Generates a one-line summary string for a full CPU packet
    //      including command, addressing, and control metadata.
    //
    // Params:
    //   - pkt (input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d):
    //     Packet to summarize.
    // Returns: string
    // ------------------------------------------------------------------------
    function string summarize_pkt(
        input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt
    );
        return $sformatf(
            "src=%0d dst=%0d cmd=%s(%0d) data_addr=%0d payload=0x%08h pred=%0b ctrl_addr=%0d op=%s(%0d) last=%0b",
            pkt.src,
            pkt.dst,
            cmd_to_string(pkt.payload.cmd),
            pkt.payload.cmd,
            pkt.payload.data_addr,
            pkt.payload.data.payload,
            pkt.payload.data.predicate,
            pkt.payload.ctrl_addr,
            opcode_to_string(pkt.payload.ctrl.operation),
            pkt.payload.ctrl.operation,
            pkt.payload.ctrl.is_last_ctrl);
    endfunction

    // ------------------------------------------------------------------------
    // Task: init_vif
    //
    // Description: Lazily retrieves and caches virtual interface handle for
    //      packet send helpers.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    task init_vif();
        if (vif != null)
            return;

        if (!uvm_config_db #(virtual cgra_if)::get(null, get_full_name(), "vif", vif))
            `uvm_fatal(get_type_name(),
                {"Virtual interface 'vif' not found. ",
                 "Ensure cgra_tb_top calls uvm_config_db::set()."})
    endtask

    // ------------------------------------------------------------------------
    // Function: build_base_pkt
    //
    // Description: Builds a zero-initialized packet with source, destination,
    //      and command fields populated.
    //
    // Params:
    //   - dst (input logic [8:0]): Destination tile ID.
    //   - cmd (input cgra_cmd_e): Command enum value.
    // Returns: IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d
    // ------------------------------------------------------------------------
    function IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d
        build_base_pkt(logic [8:0] dst, cgra_cmd_e cmd);

        IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt             = '0;
        pkt.src         = cpu_src;
        pkt.dst         = dst;
        pkt.payload.cmd = cmd;
        return pkt;
    endfunction

    // ------------------------------------------------------------------------
    // Task: send_store_request
    //
    // Description: Sends one CMD_STORE_REQUEST packet to preload tile SRAM.
    //
    // Params:
    //   - dst_tile (input logic [8:0]): Destination tile ID.
    //   - addr (input logic [8:0]): Data SRAM address.
    //   - data (input logic [31:0]): 32-bit data payload.
    //   - predicate (input logic [0:0]): Predicate bit.
    // ------------------------------------------------------------------------
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
        `uvm_info(get_type_name(),
            $sformatf("t=%0t SRAM_LOAD tile=%0d addr=%0d data=0x%08h pred=%0b",
                $time, dst_tile, addr, data, predicate),
            UVM_MEDIUM)
        send_cpu_pkt_with_handshake(pkt);
    endtask

    // ------------------------------------------------------------------------
    // Task: send_simple_cmd
    //
    // Description: Sends one simple command packet carrying scalar data and
    //      data address fields.
    //
    // Params:
    //   - dst_tile (input logic [8:0]): Destination tile ID.
    //   - cmd (input cgra_cmd_e): Command enum value.
    //   - data (input logic [31:0]): Data payload.
    //   - predicate (input logic [0:0]): Predicate bit.
    //   - data_addr (input logic [8:0]): Data address field.
    // ------------------------------------------------------------------------
    task send_simple_cmd(
        input logic [8:0]  dst_tile,
        input cgra_cmd_e   cmd,
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
        `uvm_info(get_type_name(),
            $sformatf("t=%0t PROGRAM_SIMPLE %s dst=%0d data_addr=%0d data=0x%08h pred=%0b",
                $time, cmd_to_string(cmd), dst_tile, data_addr, data, predicate),
            UVM_MEDIUM)
        send_cpu_pkt_with_handshake(pkt);
    endtask

    // ------------------------------------------------------------------------
    // Task: send_ctrl_config
    //
    // Description: Sends one control-memory configuration packet for a
    //      specific control-step address.
    //
    // Params:
    //   - dst_tile (input logic [8:0]): Destination tile ID.
    //   - cmd (input cgra_cmd_e): Command enum value.
    //   - step (input cgra_ctrl_step_cfg): Control-step descriptor object.
    //   - ctrl_addr (input logic [2:0]): Control memory address.
    // ------------------------------------------------------------------------
    task send_ctrl_config(
        input logic [8:0]        dst_tile,
        input cgra_cmd_e         cmd,
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

        `uvm_info(get_type_name(),
            $sformatf("t=%0t PROGRAM_CTRL dst=%0d cmd=%s ctrl_addr=%0d op=%s payload=0x%08h pred=%0b",
                $time,
                dst_tile,
                cmd_to_string(cmd),
                ctrl_addr,
                opcode_to_string(step.operation),
                step.data_payload,
                step.data_predicate),
            UVM_MEDIUM)

        send_cpu_pkt_with_handshake(pkt);
    endtask

    // ------------------------------------------------------------------------
    // Task: send_launch
    //
    // Description: Sends one launch command packet to start execution.
    //
    // Params:
    //   - dst_tile (input logic [8:0]): Destination tile ID.
    // ------------------------------------------------------------------------
    task send_launch(input logic [8:0] dst_tile);
        automatic IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt;
        pkt = build_base_pkt(dst_tile, CMD_LAUNCH);
        `uvm_info(get_type_name(),
            $sformatf("t=%0t PROGRAM_LAUNCH dst=%0d", $time, dst_tile),
            UVM_MEDIUM)
        send_cpu_pkt_with_handshake(pkt);
    endtask

    // ------------------------------------------------------------------------
    // Task: send_cpu_pkt_with_handshake
    //
    // Description: Drives a CPU packet and retries across cycles until DUT
    //      asserts ready, then logs acceptance.
    //
    // Params:
    //   - pkt (input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d):
    //     Packet to transmit.
    // ------------------------------------------------------------------------
    task send_cpu_pkt_with_handshake(
        input IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt
    );
        cgra_seq_item item;
        bit accepted;
        int unsigned n_attempts;

        init_vif();
        accepted = 1'b0;
        n_attempts = 0;

        `uvm_info(get_type_name(),
            $sformatf("t=%0t PKT_TX_START %s", $time, summarize_pkt(pkt)),
            UVM_HIGH)

        while (!accepted) begin
            n_attempts++;
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

            if (!accepted) begin
                `uvm_info(get_type_name(),
                    $sformatf("t=%0t PKT_TX_RETRY attempt=%0d dst=%0d cmd=%s",
                        $time, n_attempts, pkt.dst, cmd_to_string(pkt.payload.cmd)),
                    UVM_HIGH)
            end
        end

        `uvm_info(get_type_name(),
            $sformatf("t=%0t PKT_TX_ACCEPTED attempts=%0d %s",
                $time, n_attempts, summarize_pkt(pkt)),
            UVM_MEDIUM)
    endtask
endclass : cgra_program_base_seq
