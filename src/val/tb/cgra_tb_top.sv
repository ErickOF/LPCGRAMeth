// ============================================================================
// File   : cgra_tb_top.sv
// Brief  : Top-level testbench module.
//          Instantiates the dummy DUT, the interface, and starts UVM.
//
// TODO CGRA: Replace the dut_dummy instantiation with CgraTemplateRTL:
//   1. Import cgra_pkg at the top of this file.
//   2. Update the cgra_if instantiation to use the real signal widths.
//   3. Connect every DUT port to the matching interface signal, e.g.:
//        CgraTemplateRTL dut (
//          .clk                   (clk                          ),
//          .reset                 (dut_if.reset                 ),
//          .address_lower         (dut_if.address_lower         ),
//          .address_upper         (dut_if.address_upper         ),
//          .cgra_id               (dut_if.cgra_id               ),
//          .recv_from_cpu_pkt__msg(dut_if.recv_from_cpu_pkt__msg),
//          .recv_from_cpu_pkt__val(dut_if.recv_from_cpu_pkt__val),
//          .recv_from_cpu_pkt__rdy(dut_if.recv_from_cpu_pkt__rdy),
//          ...
//        );
//   4. Update the bind statement to use the real DUT port names.
// ============================================================================
`timescale 1ns/1ps

module cgra_tb_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import cgra_uvm_pkg::*;

    // ------------------------------------------------------------------------
    // Clock generation  (100 MHz)
    // ------------------------------------------------------------------------
    logic clk;
    initial   clk = 1'b0;
    always #5 clk = ~clk;

    // ------------------------------------------------------------------------
    // Interface instantiation
    // ------------------------------------------------------------------------
    cgra_if dut_if (.clk(clk));

    // ------------------------------------------------------------------------
    // DUT instantiation – dummy DFF
    // TODO CGRA: replace with CgraTemplateRTL (see header comment)
    // ------------------------------------------------------------------------
    dut_dummy dut (
        .clk     (clk            ),
        .reset   (dut_if.reset   ),
        .data_in (dut_if.data_in ),
        .data_out(dut_if.data_out)
    );

    // ------------------------------------------------------------------------
    // Assertion module bind
    // TODO CGRA: update port connections to match CgraTemplateRTL signals
    // ------------------------------------------------------------------------
    bind dut_dummy cgra_assertions u_assertions (
        .clk     (clk     ),
        .reset   (reset   ),
        .data_in (data_in ),
        .data_out(data_out)
    );

    // ------------------------------------------------------------------------
    // Pass virtual interface to all UVM components via config_db
    // TODO CGRA: if using multiple interfaces, call set() once per interface
    //            with a unique path, e.g. "uvm_test_top.m_env.m_cpu_agent.*"
    // ------------------------------------------------------------------------
    initial begin
        uvm_config_db #(virtual cgra_if)::set(
            null, "uvm_test_top.*", "vif", dut_if);

        run_test();
    end

    // ------------------------------------------------------------------------
    // Simulation timeout watchdog
    // ------------------------------------------------------------------------
    initial begin
        #1_000_000;
        `uvm_fatal("TIMEOUT", "Simulation reached timeout limit")
    end

endmodule : cgra_tb_top
