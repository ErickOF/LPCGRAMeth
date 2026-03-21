// ============================================================================
// Name:         cgra_prologue_config_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-03-21
// Description:  Phase sequence for prologue FU / routing / FU-crossbar config.
// ============================================================================

class cgra_prologue_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_prologue_config_seq)

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the prologue configuration phase sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_prologue_config_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Sends all configured prologue FU, routing, and FU-crossbar
    //      control steps for each tile.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2d: prologue configuration", UVM_MEDIUM)

        foreach (tile_cfgs[i]) begin
            for (int s = 0; s < tile_cfgs[i].prologue_fu.size(); s++) begin
                if (tile_cfgs[i].prologue_fu[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_fu[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_ctrl_config(tile_cfgs[i].tile_id, CMD_CONFIG_PROLOGUE_FU,
                    tile_cfgs[i].prologue_fu[s], s[2:0]);
            end

            for (int s = 0; s < tile_cfgs[i].prologue_routing.size(); s++) begin
                if (tile_cfgs[i].prologue_routing[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_routing[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_ctrl_config(tile_cfgs[i].tile_id, CMD_CONFIG_PROLOGUE_ROUTING_XBAR,
                    tile_cfgs[i].prologue_routing[s], s[2:0]);
            end

            for (int s = 0; s < tile_cfgs[i].prologue_fu_xbar.size(); s++) begin
                if (tile_cfgs[i].prologue_fu_xbar[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_fu_xbar[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_ctrl_config(tile_cfgs[i].tile_id, CMD_CONFIG_PROLOGUE_FU_CROSSBAR,
                    tile_cfgs[i].prologue_fu_xbar[s], s[2:0]);
            end
        end
    endtask
endclass : cgra_prologue_config_seq
