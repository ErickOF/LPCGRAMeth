// ============================================================================
// File   : cgra_const_load_seq.sv
// Brief  : Phase sequence for tile constant load (CMD_CONST).
// ============================================================================
class cgra_const_load_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_const_load_seq)

    function new(string name = "cgra_const_load_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2a: constant load", UVM_MEDIUM)

        foreach (tile_cfgs[i])
            send_simple_cmd(tile_cfgs[i].tile_id, CMD_CONST,
                tile_cfgs[i].const_val, 1'b1, 9'd0);
    endtask
endclass : cgra_const_load_seq