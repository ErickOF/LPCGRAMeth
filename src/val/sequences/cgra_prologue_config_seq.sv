// ============================================================================
// Name:         cgra_prologue_config_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-04-12
// Description:  Phase sequence for prologue control-step programming. Writes
//      prologue_fu[], prologue_routing[], and prologue_fu_xbar[] entries for
//      each tile via the recv_waddr / recv_wopt direct-write interface.
// ============================================================================

class cgra_prologue_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_prologue_config_seq)

    function new(string name = "cgra_prologue_config_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2d: prologue configuration", UVM_MEDIUM)

        foreach (tile_cfgs[i]) begin
            for (int s = 0; s < tile_cfgs[i].prologue_fu.size(); s++) begin
                if (tile_cfgs[i].prologue_fu[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_fu[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_write_with_handshake(
                    tile_cfgs[i].tile_id,
                    logic'(s[2:0]),
                    tile_cfgs[i].prologue_fu[s].to_cfg_word());
            end

            for (int s = 0; s < tile_cfgs[i].prologue_routing.size(); s++) begin
                if (tile_cfgs[i].prologue_routing[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_routing[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_write_with_handshake(
                    tile_cfgs[i].tile_id,
                    logic'(s[2:0]),
                    tile_cfgs[i].prologue_routing[s].to_cfg_word());
            end

            for (int s = 0; s < tile_cfgs[i].prologue_fu_xbar.size(); s++) begin
                if (tile_cfgs[i].prologue_fu_xbar[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: prologue_fu_xbar[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_write_with_handshake(
                    tile_cfgs[i].tile_id,
                    logic'(s[2:0]),
                    tile_cfgs[i].prologue_fu_xbar[s].to_cfg_word());
            end
        end
    endtask
endclass : cgra_prologue_config_seq
