// ============================================================================
// File   : cgra_config_seq.sv
// Brief  : CGRA configuration (SRAM load) UVM sequence for CgraTemplateRTL.
//
// Programs one or more tiles by sending IntraCgra packets through the CPU
// receive channel (recv_from_cpu_pkt).  Back-pressure
// (recv_from_cpu_pkt__rdy == 0) is respected: the same packet is re-driven
// every clock cycle until the DUT asserts rdy (VAL/RDY handshake).
//
// Configuration protocol executed inside body() (per tile, in order):
//
//   Phase 1 - Data SRAM preload (one CMD_STORE_REQUEST per entry):
//     cmd = 5'd12  CMD_STORE_REQUEST  - write a 32-bit word to data SRAM
//
//   Phase 2 - Per-tile control-memory configuration:
//     cmd = 5'd13  CMD_CONST                      - constant register value
//     cmd = 5'd8   CMD_CONFIG_COUNT_PER_ITER      - # control steps per loop
//     cmd = 5'd7   CMD_CONFIG_TOTAL_CTRL_COUNT    - total control steps
//     cmd = 5'd3   CMD_CONFIG                     - one config word per step
//     cmd = 5'd4   CMD_CONFIG_PROLOGUE_FU         - prologue FU config
//     cmd = 5'd6   CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR
//     cmd = 5'd5   CMD_CONFIG_PROLOGUE_FU_CROSSBAR
//
//   Phase 3 - Execution launch (optional, see do_launch):
//     cmd = 5'd0   CMD_LAUNCH
//
// Command codes mirror localparams of ControllerRTL__5c69f8e556492ab7.
//
// Packet type: IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d
// Ctrl type  : CGRAConfig_7_4_2_8_8_3__603a41f5d0e2436f
//              (12-port routing_xbar_outport [11:0][3:0],
//               12-port fu_xbar_outport      [11:0][1:0],
//               ctrl_addr 3-bit, data_addr 9-bit)
//
// Depends on (included before this file in cgra_uvm_pkg):
//   cgra_data_entry_t  - typedef struct in cgra_uvm_pkg
//   cgra_ctrl_step_cfg - class in cgra_ctrl_step_cfg.sv
//   cgra_tile_cfg      - class in cgra_tile_cfg.sv
// ============================================================================

// ----------------------------------------------------------------------------
// cgra_config_seq
// ----------------------------------------------------------------------------
class cgra_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_config_seq)

    // Set to 0 to suppress CMD_LAUNCH at the end (useful when chaining)
    bit do_launch = 1'b1;

    // ------------------------------------------------------------------
    function new(string name = "cgra_config_seq");
        super.new(name);
    endfunction

    // ==================================================================
    // SEQUENCE BODY
    // ==================================================================
    virtual task body();
        cgra_preload_seq preload_seq;
        cgra_const_load_seq const_load_seq;
        cgra_loop_config_seq loop_config_seq;
        cgra_operation_map_seq operation_map_seq;
        cgra_prologue_config_seq prologue_config_seq;
        cgra_launch_seq launch_seq;

        init_vif();

        `uvm_info(get_type_name(), $sformatf(
            "cgra_config_seq orchestrating split phases - %0d preload entries, %0d tile cfgs",
            data_entries.size(), tile_cfgs.size()), UVM_MEDIUM)

        preload_seq = cgra_preload_seq::type_id::create("preload_seq");
        preload_seq.data_entries = data_entries;
        preload_seq.tile_cfgs = tile_cfgs;
        preload_seq.cpu_src = cpu_src;
        preload_seq.start(m_sequencer, this);

        const_load_seq = cgra_const_load_seq::type_id::create("const_load_seq");
        const_load_seq.tile_cfgs = tile_cfgs;
        const_load_seq.cpu_src = cpu_src;
        const_load_seq.start(m_sequencer, this);

        loop_config_seq = cgra_loop_config_seq::type_id::create("loop_config_seq");
        loop_config_seq.tile_cfgs = tile_cfgs;
        loop_config_seq.cpu_src = cpu_src;
        loop_config_seq.start(m_sequencer, this);

        operation_map_seq = cgra_operation_map_seq::type_id::create("operation_map_seq");
        operation_map_seq.tile_cfgs = tile_cfgs;
        operation_map_seq.cpu_src = cpu_src;
        operation_map_seq.start(m_sequencer, this);

        prologue_config_seq = cgra_prologue_config_seq::type_id::create("prologue_config_seq");
        prologue_config_seq.tile_cfgs = tile_cfgs;
        prologue_config_seq.cpu_src = cpu_src;
        prologue_config_seq.start(m_sequencer, this);

        if (do_launch) begin
            launch_seq = cgra_launch_seq::type_id::create("launch_seq");
            launch_seq.tile_cfgs = tile_cfgs;
            launch_seq.cpu_src = cpu_src;
            launch_seq.start(m_sequencer, this);
        end

        `uvm_info(get_type_name(), "cgra_config_seq done", UVM_MEDIUM)
    endtask
endclass : cgra_config_seq
