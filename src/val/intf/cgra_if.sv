// ============================================================================
// Name:         cgra_if.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  SystemVerilog interface for the CgraTemplateRTL testbench.
// ============================================================================

`timescale 1ns/1ps

// ----------------------------------------------------------------------------
// Interface: cgra_if
//
// Description: Shared testbench interface for CGRA DUT connectivity. Groups
//      all driven inputs, observed outputs, and clocking blocks used by UVM
//      driver and monitor components.
//
// Params:
//   - clk (input logic): Interface clock used by driver/monitor clocking
//     blocks.
// ----------------------------------------------------------------------------
interface cgra_if (input logic clk);
    import cgra_pkg::*;

    // ------------------------------------------------------------------------
    // Static configuration inputs
    // ------------------------------------------------------------------------
    logic [8:0] address_lower;
    logic [8:0] address_upper;
    logic [1:0] cgra_id;
    logic       reset;

    // ------------------------------------------------------------------------
    // CPU receive channel  (DUT input: msg/val; DUT output: rdy)
    // ------------------------------------------------------------------------
    IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d recv_from_cpu_pkt__msg;
    logic recv_from_cpu_pkt__val;
    logic recv_from_cpu_pkt__rdy;

    // ------------------------------------------------------------------------
    // Inter-CGRA NoC receive channel  (DUT input: msg/val; DUT output: rdy)
    // ------------------------------------------------------------------------
    InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b recv_from_inter_cgra_noc__msg;
    logic recv_from_inter_cgra_noc__val;
    logic recv_from_inter_cgra_noc__rdy;

    // ------------------------------------------------------------------------
    // CPU send channel  (DUT output: msg/val; TB drives back-pressure: rdy)
    // ------------------------------------------------------------------------
    IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d send_to_cpu_pkt__msg;
    logic send_to_cpu_pkt__val;
    logic send_to_cpu_pkt__rdy;

    // ------------------------------------------------------------------------
    // Inter-CGRA NoC send channel  (DUT output: msg/val; TB drives: rdy)
    // ------------------------------------------------------------------------
    InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b send_to_inter_cgra_noc__msg;
    logic send_to_inter_cgra_noc__val;
    logic send_to_inter_cgra_noc__rdy;

    // ------------------------------------------------------------------------
    // TB-only post-run controls
    // ------------------------------------------------------------------------
    logic dump_enable;
    logic dump_const_mem_enable;
    logic dump_ctrl_mem_enable;
    logic dump_data_mem_enable;
    int unsigned post_launch_wait_cycles;
    int unsigned expected_result_count;
    logic [31:0] expected_result_payloads [0:15];

    // ------------------------------------------------------------------------
    // Clocking block - driver  (active stimulus, aligned to posedge)
    // ------------------------------------------------------------------------
    clocking driver_cb @(posedge clk);
        default input #1step output #1;
        // DUT inputs driven by TB
        output reset;
        output address_lower;
        output address_upper;
        output cgra_id;
        output recv_from_cpu_pkt__msg;
        output recv_from_cpu_pkt__val;
        output recv_from_inter_cgra_noc__msg;
        output recv_from_inter_cgra_noc__val;
        output send_to_cpu_pkt__rdy;
        output send_to_inter_cgra_noc__rdy;
        // DUT outputs sampled by TB
        input  recv_from_cpu_pkt__rdy;
        input  recv_from_inter_cgra_noc__rdy;
        input  send_to_cpu_pkt__msg;
        input  send_to_cpu_pkt__val;
        input  send_to_inter_cgra_noc__msg;
        input  send_to_inter_cgra_noc__val;
    endclocking

    // ------------------------------------------------------------------------
    // Clocking block - monitor (passive observation, aligned to posedge)
    // ------------------------------------------------------------------------
    clocking monitor_cb @(posedge clk);
        default input #1step;
        input reset;
        input address_lower;
        input address_upper;
        input cgra_id;
        input recv_from_cpu_pkt__msg;
        input recv_from_cpu_pkt__val;
        input recv_from_cpu_pkt__rdy;
        input recv_from_inter_cgra_noc__msg;
        input recv_from_inter_cgra_noc__val;
        input recv_from_inter_cgra_noc__rdy;
        input send_to_cpu_pkt__msg;
        input send_to_cpu_pkt__val;
        input send_to_cpu_pkt__rdy;
        input send_to_inter_cgra_noc__msg;
        input send_to_inter_cgra_noc__val;
        input send_to_inter_cgra_noc__rdy;
    endclocking

    // ------------------------------------------------------------------------
    // Modports
    // ------------------------------------------------------------------------
    modport driver_mp  (clocking driver_cb,  input clk);
    modport monitor_mp (clocking monitor_cb, input clk);
endinterface : cgra_if
