// ============================================================================
// File   : cgra_launch_seq.sv
// Brief  : Phase sequence for CMD_LAUNCH.
// ============================================================================
class cgra_launch_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_launch_seq)

    function new(string name = "cgra_launch_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 3: launch", UVM_MEDIUM)

        foreach (tile_cfgs[i])
            send_launch(tile_cfgs[i].tile_id);
    endtask
endclass : cgra_launch_seq
