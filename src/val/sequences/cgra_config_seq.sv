// ============================================================================
// Name:         cgra_config_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-04-12
// Description:  CGRA configuration orchestration sequence. Runs the full
//      programming pipeline via the recv_waddr / recv_wopt direct-write
//      interface: preload (no-op), const load (no-op), loop config (no-op),
//      operation mapping, prologue config, launch (no-op).
// ============================================================================

class cgra_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_config_seq)

    // Set to 0 to suppress the launch sub-sequence call (which is itself a no-op)
    bit do_launch = 1'b1;

    function new(string name = "cgra_config_seq");
        super.new(name);
    endfunction

    virtual task body();
        cgra_preload_seq        preload_seq;
        cgra_const_load_seq     const_load_seq;
        cgra_loop_config_seq    loop_config_seq;
        cgra_operation_map_seq  operation_map_seq;
        cgra_prologue_config_seq prologue_config_seq;
        cgra_launch_seq         launch_seq;

        init_vif();

        `uvm_info(get_type_name(), $sformatf(
            "cgra_config_seq: programming %0d tile(s)", tile_cfgs.size()), UVM_MEDIUM)

        preload_seq = cgra_preload_seq::type_id::create("preload_seq");
        preload_seq.tile_cfgs = tile_cfgs;
        preload_seq.start(m_sequencer, this);

        const_load_seq = cgra_const_load_seq::type_id::create("const_load_seq");
        const_load_seq.tile_cfgs = tile_cfgs;
        const_load_seq.start(m_sequencer, this);

        loop_config_seq = cgra_loop_config_seq::type_id::create("loop_config_seq");
        loop_config_seq.tile_cfgs = tile_cfgs;
        loop_config_seq.start(m_sequencer, this);

        operation_map_seq = cgra_operation_map_seq::type_id::create("operation_map_seq");
        operation_map_seq.tile_cfgs = tile_cfgs;
        operation_map_seq.start(m_sequencer, this);

        prologue_config_seq = cgra_prologue_config_seq::type_id::create("prologue_config_seq");
        prologue_config_seq.tile_cfgs = tile_cfgs;
        prologue_config_seq.start(m_sequencer, this);

        if (do_launch) begin
            launch_seq = cgra_launch_seq::type_id::create("launch_seq");
            launch_seq.tile_cfgs = tile_cfgs;
            launch_seq.start(m_sequencer, this);
        end

        `uvm_info(get_type_name(), "cgra_config_seq done", UVM_MEDIUM)
    endtask
endclass : cgra_config_seq
