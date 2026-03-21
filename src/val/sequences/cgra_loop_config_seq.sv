// ============================================================================
// File   : cgra_loop_config_seq.sv
// Brief  : Phase sequence for loop-related control configuration.
//          Sends CMD_CONFIG_COUNT_PER_ITER and CMD_CONFIG_TOTAL_CTRL_COUNT.
// ============================================================================
class cgra_loop_config_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_loop_config_seq)

    function new(string name = "cgra_loop_config_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 2b: loop configuration", UVM_MEDIUM)

        foreach (tile_cfgs[i]) begin
            send_simple_cmd(tile_cfgs[i].tile_id, CMD_CONFIG_COUNT_PER_ITER,
                tile_cfgs[i].count_per_iter, 1'b1, 9'd0);
            send_simple_cmd(tile_cfgs[i].tile_id, CMD_CONFIG_TOTAL_CTRL_COUNT,
                tile_cfgs[i].total_ctrl_count, 1'b1, 9'd0);
        end
    endtask
endclass : cgra_loop_config_seq
