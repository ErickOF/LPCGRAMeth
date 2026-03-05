// ============================================================================
// File   : cgra_base_seq.sv
// Brief  : UVM base sequence - provides the minimal foundation for all CGRA
//          sequences. The default body drives n_transactions idle clock cycles
//          (reset de-asserted, all channels quiet) so it can be used stand-
//          alone after a reset sequence or as a simple passthrough base.
//          Extend this class to add protocol-specific stimulus.
// ============================================================================
class cgra_base_seq extends uvm_sequence #(cgra_seq_item);
    `uvm_object_utils(cgra_base_seq)

    // Number of idle cycles to drive in the default body
    int unsigned n_transactions = 10;

    function new(string name = "cgra_base_seq");
        super.new(name);
    endfunction

    virtual task body();
        cgra_seq_item item;

        repeat (n_transactions) begin
            item = cgra_seq_item::type_id::create("idle_item");

            start_item(item);

            if (!item.randomize() with {
                reset                         == 1'b0;
                recv_from_cpu_pkt__val        == 1'b0;
                recv_from_inter_cgra_noc__val == 1'b0;
                send_to_cpu_pkt__rdy          == 1'b1;
                send_to_inter_cgra_noc__rdy   == 1'b1;
            })
                `uvm_fatal("RAND_FAIL", "idle_item randomization failed")

            finish_item(item);
        end

        `uvm_info(get_type_name(),
            $sformatf("cgra_base_seq done: %0d idle cycles", n_transactions),
            UVM_MEDIUM)
    endtask
endclass : cgra_base_seq
