// ============================================================================
// Name:         cgra_base_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM base sequence - provides the minimal foundation for all
//      CGRA sequences. The default body drives n_transactions idle clock
//      cycles (reset de-asserted, all channels quiet) so it can be used
//      stand-alone after a reset sequence or as a simple passthrough base.
//      Extend this class to add protocol-specific stimulus.
// ============================================================================

class cgra_base_seq extends uvm_sequence #(cgra_seq_item);
    `uvm_object_utils(cgra_base_seq)

    // Number of idle cycles to drive in the default body
    int unsigned n_transactions = 10;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the base sequence object.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_base_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Drives a configurable number of idle transactions with
    //      reset de-asserted and channels quiescent.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
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
