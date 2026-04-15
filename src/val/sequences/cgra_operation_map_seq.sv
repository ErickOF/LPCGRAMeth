// ============================================================================
// Name:         cgra_operation_map_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-04-12
// Description:  Phase sequence for main control-step programming. Writes one
//      CGRAConfig_6_4_10_12 word per ctrl_steps[] entry for each tile via
//      the recv_waddr / recv_wopt direct-write interface.
// ============================================================================

class cgra_operation_map_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_operation_map_seq)

    function new(string name = "cgra_operation_map_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2c: operation mapping", UVM_MEDIUM)

        foreach (tile_cfgs[i]) begin
            for (int s = 0; s < tile_cfgs[i].ctrl_steps.size(); s++) begin
                if (tile_cfgs[i].ctrl_steps[s] == null)
                    `uvm_fatal(get_type_name(),
                        $sformatf("Tile %0d: ctrl_steps[%0d] is null",
                            tile_cfgs[i].tile_id, s))
                send_write_with_handshake(
                    tile_cfgs[i].tile_id,
                    logic'(s[2:0]),
                    tile_cfgs[i].ctrl_steps[s].to_cfg_word());
            end
        end
    endtask
endclass : cgra_operation_map_seq
