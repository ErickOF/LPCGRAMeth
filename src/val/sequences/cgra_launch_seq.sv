// ============================================================================
// Name:         cgra_launch_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-03-21
// Description:  Phase sequence for CMD_LAUNCH.
// ============================================================================

class cgra_launch_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_launch_seq)

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the launch phase sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_launch_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Sends launch packets for all configured tiles.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 3: launch", UVM_MEDIUM)

        foreach (tile_cfgs[i]) send_launch(tile_cfgs[i].tile_id);
    endtask
endclass : cgra_launch_seq
