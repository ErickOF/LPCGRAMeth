// ============================================================================
// File   : cgra_preload_seq.sv
// Brief  : Phase sequence for init/data preload into the CGRA data SRAM.
// ============================================================================
class cgra_preload_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_preload_seq)

    function new(string name = "cgra_preload_seq");
        super.new(name);
    endfunction

    virtual task body();
        init_vif();
        `uvm_info(get_type_name(), "Phase 1: init and data preload", UVM_MEDIUM)

        foreach (data_entries[i])
            send_store_request(
                data_entries[i].dst_tile,
                data_entries[i].addr,
                data_entries[i].data,
                data_entries[i].predicate);
    endtask
endclass : cgra_preload_seq