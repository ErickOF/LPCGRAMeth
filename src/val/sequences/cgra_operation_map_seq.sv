// ============================================================================
// Name:         cgra_operation_map_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-03-21
// Description:  Phase sequence for main operation/control mapping (CMD_CONFIG).
// ============================================================================

class cgra_operation_map_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_operation_map_seq)

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the operation-mapping phase sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_operation_map_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Sends CMD_CONFIG control words for each control step of
    //      each configured tile.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2c: operation mapping", UVM_MEDIUM)

        foreach (tile_cfgs[i]) begin
            for (int s = 0; s < tile_cfgs[i].ctrl_steps.size(); s++) begin
                if (tile_cfgs[i].ctrl_steps[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: ctrl_steps[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_ctrl_config(tile_cfgs[i].tile_id, CMD_CONFIG,
                    tile_cfgs[i].ctrl_steps[s], s[2:0]);
            end
        end
    endtask
endclass : cgra_operation_map_seq
