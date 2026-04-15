// ============================================================================
// Name:         cgra_reset_seq.sv
// Author:        Obregon Fonseca, Erick
// Create Date:  2026-03-05
// Last Modify:  2026-03-21
// Description:  Reset sequence for CgraTemplateRTL. Holds reset at
//      reset=reset_assert_val for n_reset_cycles clock cycles, keeping all
//      input channels idle throughout. Extend or start this sequence before
//      any stimulus sequence to bring the DUT into a known state.
// ============================================================================

class cgra_reset_seq extends cgra_base_seq;
    `uvm_object_utils(cgra_reset_seq)

    // Number of cycles to hold reset high
    int unsigned n_reset_cycles = 10;
    // Value of reset signal to apply during the reset sequence
    logic reset_assert_val = 1'b1;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the reset sequence object.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_reset_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Drives reset transactions for `n_reset_cycles` with all
    //      traffic channels held idle.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        cgra_seq_item item;

        repeat (n_reset_cycles) begin
            item = cgra_seq_item::type_id::create("reset_item");

            start_item(item);

            if (!item.randomize() with {
                reset    == reset_assert_val;
                waddr_en == 1'b0;
                wopt_en  == 1'b0;
            })
                `uvm_fatal("RAND_FAIL", "reset_item randomization failed")

            finish_item(item);
        end

        `uvm_info(get_type_name(),
            $sformatf("cgra_reset_seq done: reset=%0d during %0d reset cycles",
                      reset_assert_val, n_reset_cycles),
            UVM_MEDIUM)
    endtask
endclass : cgra_reset_seq
