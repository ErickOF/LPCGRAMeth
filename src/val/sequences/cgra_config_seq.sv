// ============================================================================
// Name:         cgra_config_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-11
// Last Modify:  2026-03-21
// Description:  CGRA configuration (SRAM load) UVM sequence for
//      CgraTemplateRTL.
// ============================================================================

class cgra_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_config_seq)

    // Set to 0 to suppress CMD_LAUNCH at the end (useful when chaining)
    bit do_launch = 1'b1;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the top-level CGRA programming orchestration
    //      sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_config_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Runs preload, per-tile configuration phases, and optional
    //      launch in the required order.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
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
