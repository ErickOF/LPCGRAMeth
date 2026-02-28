// ============================================================================
// File   : cgra_seq_item.sv
// Brief  : UVM sequence item – transaction descriptor.
//          Currently carries 8-bit data for the dummy DFF DUT.
//
// TODO CGRA: Add fields for all DUT channels, e.g.:
//              - IntraCgraPacket_*   cpu_pkt;
//              - InterCgraPacket_*   inter_noc_pkt;
//              - logic [1:0]         cgra_id;
//              - logic [8:0]         address_lower / address_upper;
//            Add matching rand constraints.
// ============================================================================
class cgra_seq_item extends uvm_sequence_item;
    `uvm_object_utils(cgra_seq_item)

    // ------------------------------------------------------------------------
    // Randomisable fields
    // TODO CGRA: replace / extend with real DUT transaction fields
    // ------------------------------------------------------------------------
    rand logic       reset;
    rand logic [7:0] data_in;

    // Observed output (filled by monitor, not driven)
    logic [7:0] data_out;

    // ------------------------------------------------------------------------
    // Constraints
    // ------------------------------------------------------------------------
    // Keep reset de-asserted most of the time
    constraint c_reset_rare { reset dist { 1'b0 := 95, 1'b1 := 5 }; }

    // ------------------------------------------------------------------------
    function new(string name = "cgra_seq_item");
        super.new(name);
    endfunction

    function string convert2string();
        return $sformatf("reset=%0b data_in=0x%02h data_out=0x%02h",
                         reset, data_in, data_out);
    endfunction
endclass : cgra_seq_item
