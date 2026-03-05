// ============================================================================
// File   : cgra_tb_top.sv
// Brief  : Top-level testbench module.
//          Instantiates CgraTemplateRTL, the interface, and starts UVM.
// ============================================================================
`timescale 1ns/1ps

module cgra_tb_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import cgra_uvm_pkg::*;
    import cgra_pkg::*;

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
    // DUT instantiation - CgraTemplateRTL
    // ------------------------------------------------------------------------
    CgraTemplateRTL dut (
        .clk                          (clk                                 ),
        .reset                        (dut_if.reset                        ),
        .address_lower                (dut_if.address_lower                ),
        .address_upper                (dut_if.address_upper                ),
        .cgra_id                      (dut_if.cgra_id                      ),
        .recv_from_cpu_pkt__msg       (dut_if.recv_from_cpu_pkt__msg       ),
        .recv_from_cpu_pkt__val       (dut_if.recv_from_cpu_pkt__val       ),
        .recv_from_cpu_pkt__rdy       (dut_if.recv_from_cpu_pkt__rdy       ),
        .recv_from_inter_cgra_noc__msg(dut_if.recv_from_inter_cgra_noc__msg),
        .recv_from_inter_cgra_noc__val(dut_if.recv_from_inter_cgra_noc__val),
        .recv_from_inter_cgra_noc__rdy(dut_if.recv_from_inter_cgra_noc__rdy),
        .send_to_cpu_pkt__msg         (dut_if.send_to_cpu_pkt__msg         ),
        .send_to_cpu_pkt__rdy         (dut_if.send_to_cpu_pkt__rdy         ),
        .send_to_cpu_pkt__val         (dut_if.send_to_cpu_pkt__val         ),
        .send_to_inter_cgra_noc__msg  (dut_if.send_to_inter_cgra_noc__msg  ),
        .send_to_inter_cgra_noc__rdy  (dut_if.send_to_inter_cgra_noc__rdy  ),
        .send_to_inter_cgra_noc__val  (dut_if.send_to_inter_cgra_noc__val  )
    );

    // ------------------------------------------------------------------------
    // Assertion module bind
    // ------------------------------------------------------------------------
    bind CgraTemplateRTL cgra_assertions u_assertions (
        .clk                          (clk                          ),
        .reset                        (reset                        ),
        .recv_from_cpu_pkt__rdy       (recv_from_cpu_pkt__rdy       ),
        .recv_from_inter_cgra_noc__rdy(recv_from_inter_cgra_noc__rdy),
        .send_to_cpu_pkt__val         (send_to_cpu_pkt__val         ),
        .send_to_cpu_pkt__rdy         (send_to_cpu_pkt__rdy         ),
        .send_to_inter_cgra_noc__val  (send_to_inter_cgra_noc__val  ),
        .send_to_inter_cgra_noc__rdy  (send_to_inter_cgra_noc__rdy  )
    );

    // ------------------------------------------------------------------------
    // Pass virtual interface to all UVM components via config_db
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
