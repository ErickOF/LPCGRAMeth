// ============================================================================
// File   : cgra_seq_item.sv
// Brief  : UVM sequence item - transaction descriptor for CgraTemplateRTL.
// ============================================================================
class cgra_seq_item extends uvm_sequence_item;
    `uvm_object_utils(cgra_seq_item)

    // ------------------------------------------------------------------------
    // Driven fields  (DUT inputs, set by the driver each cycle)
    // ------------------------------------------------------------------------
    rand logic       reset;
    rand logic [8:0] address_lower;
    rand logic [8:0] address_upper;
    rand logic [1:0] cgra_id;

    // CPU receive channel
    IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv_from_cpu_pkt__msg;
    rand logic recv_from_cpu_pkt__val;

    // Inter-CGRA NoC receive channel
    InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_from_inter_cgra_noc__msg;
    rand logic recv_from_inter_cgra_noc__val;

    // Back-pressure signals driven by TB toward DUT output channels
    rand logic send_to_cpu_pkt__rdy;
    rand logic send_to_inter_cgra_noc__rdy;

    // ------------------------------------------------------------------------
    // Observed fields  (DUT outputs, filled by monitor - not randomized)
    // ------------------------------------------------------------------------
    logic recv_from_cpu_pkt__rdy;
    logic recv_from_inter_cgra_noc__rdy;

    IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send_to_cpu_pkt__msg;
    logic send_to_cpu_pkt__val;

    InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_to_inter_cgra_noc__msg;
    logic send_to_inter_cgra_noc__val;

    // ------------------------------------------------------------------------
    // Constraints
    // ------------------------------------------------------------------------
    // Keep channels idle by default; override in specialized sequences
    constraint c_channels_idle {
        recv_from_cpu_pkt__val        == 1'b0;
        recv_from_inter_cgra_noc__val == 1'b0;
    }
    // Accept all DUT output traffic by default (no back-pressure)
    constraint c_accept_all {
        send_to_cpu_pkt__rdy        == 1'b1;
        send_to_inter_cgra_noc__rdy == 1'b1;
    }
    // Reset de-asserted most of the time in random stimulus
    constraint c_reset_rare { reset dist { 1'b0 := 95, 1'b1 := 5 }; }

    // ------------------------------------------------------------------------
    function new(string name = "cgra_seq_item");
        super.new(name);
    endfunction

    function string convert2string();
        return $sformatf(
            "reset=%0b addr_lo=0x%03h addr_hi=0x%03h cgra_id=%0d ",
            reset, address_lower, address_upper, cgra_id)
            + $sformatf(
            "cpu_val=%0b noc_val=%0b cpu_rdy_out=%0b send_cpu_val=%0b",
            recv_from_cpu_pkt__val, recv_from_inter_cgra_noc__val,
            recv_from_cpu_pkt__rdy, send_to_cpu_pkt__val);
    endfunction
endclass : cgra_seq_item
