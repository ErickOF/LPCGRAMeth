// ============================================================================
// File   : cgra_base_seq.sv
// Brief  : UVM base sequence - applies reset for n_reset_cycles clock cycles,
//          then de-asserts reset and idles for n_transactions clock cycles.
//          All input channels are kept idle (val=0) throughout.
// ============================================================================
class cgra_base_seq extends uvm_sequence #(cgra_seq_item);
    `uvm_object_utils(cgra_base_seq)

    // Number of cycles to hold reset high
    int unsigned n_reset_cycles  = 10;
    // Number of cycles to run after reset is released
    int unsigned n_transactions  = 10;

    function new(string name = "cgra_base_seq");
        super.new(name);
    endfunction

    virtual task body();
        cgra_seq_item item;

        // --------------------------------------------------------------------
        // 1. Assert reset for n_reset_cycles
        // --------------------------------------------------------------------
        repeat (n_reset_cycles) begin
            item = cgra_seq_item::type_id::create("reset_item");

            start_item(item);

            if (!item.randomize() with {
                reset                        == 1'b1;
                recv_from_cpu_pkt__val        == 1'b0;
                recv_from_inter_cgra_noc__val == 1'b0;
                send_to_cpu_pkt__rdy          == 1'b1;
                send_to_inter_cgra_noc__rdy   == 1'b1;
            })
                `uvm_fatal("RAND_FAIL", "reset item randomization failed")

            finish_item(item);
        end

        // --------------------------------------------------------------------
        // 2. De-assert reset and idle for n_transactions cycles
        // --------------------------------------------------------------------
        repeat (n_transactions) begin
            item = cgra_seq_item::type_id::create("idle_item");

            start_item(item);

            if (!item.randomize() with {
                reset                        == 1'b0;
                recv_from_cpu_pkt__val        == 1'b0;
                recv_from_inter_cgra_noc__val == 1'b0;
                send_to_cpu_pkt__rdy          == 1'b1;
                send_to_inter_cgra_noc__rdy   == 1'b1;
            })
                `uvm_fatal("RAND_FAIL", "idle item randomization failed")

            finish_item(item);
        end

        `uvm_info(get_type_name(),
            $sformatf("cgra_base_seq done: %0d reset cycles + %0d active cycles",
                      n_reset_cycles, n_transactions),
            UVM_MEDIUM)
    endtask
endclass : cgra_base_seq
