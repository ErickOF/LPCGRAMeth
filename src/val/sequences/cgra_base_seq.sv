// ============================================================================
// File   : cgra_base_seq.sv
// Brief  : UVM base sequence – drives a short burst through the DUT.
//
// TODO CGRA: Specialize with configuration, data, and control sequences that
//            match the CgraTemplateRTL protocol (config load, data injection
//            via CPU channel, NoC stimulus, etc.).
// ============================================================================
class cgra_base_seq extends uvm_sequence #(cgra_seq_item);
    `uvm_object_utils(cgra_base_seq)

    // Number of random transactions in the body
    int unsigned n_transactions = 10;

    function new(string name = "cgra_base_seq");
        super.new(name);
    endfunction

    virtual task body();
        cgra_seq_item item;

        // --------------------------------------------------------------------
        // 1. Apply reset
        // --------------------------------------------------------------------
        item = cgra_seq_item::type_id::create("reset_item");

        start_item(item);

        if (!item.randomize() with { reset == 1'b1; })
            `uvm_fatal("RAND_FAIL", "reset item randomization failed")

        finish_item(item);

        // --------------------------------------------------------------------
        // 2. De-assert reset and send random data
        // TODO CGRA: replace the loop body with protocol-correct
        //            sequence items (e.g. config words before data)
        // --------------------------------------------------------------------
        repeat (n_transactions) begin
            item = cgra_seq_item::type_id::create("data_item");

            start_item(item);

            if (!item.randomize() with { reset == 1'b0; })
                `uvm_fatal("RAND_FAIL", "data item randomization failed")

            finish_item(item);
        end

        `uvm_info(get_type_name(),
            $sformatf("cgra_base_seq: sent %0d transactions", n_transactions),
            UVM_MEDIUM)
    endtask
endclass : cgra_base_seq
