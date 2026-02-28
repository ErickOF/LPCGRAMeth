// ============================================================================
// File   : cgra_if.sv
// Brief  : SystemVerilog interface for the testbench.
//          Currently wired to the dummy DUT (8-bit DFF).
//
// TODO CGRA: Replace the signal declarations below with the actual
//            CgraTemplateRTL port list from cgra_pkg.sv:
//              - recv_from_cpu_pkt__msg / val / rdy
//              - recv_from_inter_cgra_noc__msg / val / rdy
//              - send_to_cpu_pkt__msg / val / rdy
//              - send_to_inter_cgra_noc__msg / val / rdy
//              - address_lower / address_upper / cgra_id
//            Update driver_cb and monitor_cb directions accordingly.
// ============================================================================
`timescale 1ns/1ps

interface cgra_if (input logic clk);

    // ------------------------------------------------------------------------
    // DUT signals (dummy DFF)
    // TODO CGRA: delete these four lines and add real DUT ports
    // ------------------------------------------------------------------------
    logic       reset;
    logic [7:0] data_in;
    logic [7:0] data_out;

    // ------------------------------------------------------------------------
    // Clocking block – driver  (active stimulus, aligned to posedge)
    // ------------------------------------------------------------------------
    clocking driver_cb @(posedge clk);
        default input #1step output #1;
        // TODO CGRA: replace with real DUT input ports
        output reset;
        output data_in;
        input  data_out;
    endclocking

    // ------------------------------------------------------------------------
    // Clocking block – monitor (passive observation, aligned to posedge)
    // ------------------------------------------------------------------------
    clocking monitor_cb @(posedge clk);
        default input #1step;
        // TODO CGRA: replace with real DUT ports (all inputs for monitor)
        input reset;
        input data_in;
        input data_out;
    endclocking

    // ------------------------------------------------------------------------
    // Modports
    // ------------------------------------------------------------------------
    modport driver_mp  (clocking driver_cb,  input clk);
    modport monitor_mp (clocking monitor_cb, input clk);
endinterface : cgra_if
