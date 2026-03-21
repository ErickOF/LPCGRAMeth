// ============================================================================
// Name:         cgra_preload_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-03-21
// Description:  Phase sequence for init/data preload into the CGRA data SRAM.
// ============================================================================

class cgra_preload_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_preload_seq)

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the SRAM preload phase sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_preload_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Sends one data SRAM store request per entry in
    //      `data_entries`.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
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
