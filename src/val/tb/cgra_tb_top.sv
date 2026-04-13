// ============================================================================
// Name:         cgra_tb_top.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  Top-level verification wrapper that instantiates DUT, binds
//      assertions, configures UVM virtual interface access, and  owns debug
//      dump/timeout behavior.
// ============================================================================

`timescale 1ns/1ps

module cgra_tb_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import cgra_uvm_pkg::*;
    import cgra_pkg::*;

    // ------------------------------------------------------------------------
    // Task: dump_tile_0
    //
    // Description: Prints non-X control memory contents for tile 0.
    // ------------------------------------------------------------------------
    task automatic dump_tile_0();
        $display("######### tile 0 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__0.ctrl_mem.reg_file.regs[i]))
                $display("tile0 ctrl[%0d] %0d", i, dut.u_top.tile__0.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_tile_1
    //
    // Description: Prints non-X control memory contents for tile 1.
    // ------------------------------------------------------------------------
    task automatic dump_tile_1();
        $display("######### tile 1 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__1.ctrl_mem.reg_file.regs[i]))
                $display("tile1 ctrl[%0d] %0d", i, dut.u_top.tile__1.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_tile_4
    //
    // Description: Prints non-X control memory contents for tile 4.
    // ------------------------------------------------------------------------
    task automatic dump_tile_4();
        $display("######### tile 4 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__4.ctrl_mem.reg_file.regs[i]))
                $display("tile4 ctrl[%0d] %0d", i, dut.u_top.tile__4.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_tile_5
    //
    // Description: Prints non-X control memory contents for tile 5.
    // ------------------------------------------------------------------------
    task automatic dump_tile_5();
        $display("######### tile 5 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__5.ctrl_mem.reg_file.regs[i]))
                $display("tile5 ctrl[%0d] %0d", i, dut.u_top.tile__5.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_tile_8
    //
    // Description: Prints non-X control memory contents for tile 8.
    // ------------------------------------------------------------------------
    task automatic dump_tile_8();
        $display("######### tile 8 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__8.ctrl_mem.reg_file.regs[i]))
                $display("tile8 ctrl[%0d] %0d", i, dut.u_top.tile__8.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_tile_9
    //
    // Description: Prints non-X control memory contents for tile 9.
    // ------------------------------------------------------------------------
    task automatic dump_tile_9();
        $display("######### tile 9 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.u_top.tile__9.ctrl_mem.reg_file.regs[i]))
                $display("tile9 ctrl[%0d] %0d", i, dut.u_top.tile__9.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: dump_data_memories
    //
    // Description: Prints non-X entries from the shared data memory.
    // ------------------------------------------------------------------------
    task automatic dump_data_memories();
        $display("************* data mem reg_file *************");
        for (int i = 0; i < 2; i++) begin
            if (!$isunknown(dut.u_top.data_mem.reg_file.regs[i]))
                $display("data_mem[%0d] payload=%0d pred=%0b",
                    i,
                    dut.u_top.data_mem.reg_file.regs[i].payload,
                    dut.u_top.data_mem.reg_file.regs[i].predicate);
        end
    endtask

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
        .clk            (clk                     ),
        .reset          (dut_if.reset            ),
        .recv_waddr__en (dut_if.recv_waddr__en   ),
        .recv_waddr__msg(dut_if.recv_waddr__msg  ),
        .recv_waddr__rdy(dut_if.recv_waddr__rdy  ),
        .recv_wopt__en  (dut_if.recv_wopt__en    ),
        .recv_wopt__msg (dut_if.recv_wopt__msg   ),
        .recv_wopt__rdy (dut_if.recv_wopt__rdy   )
    );

    // ------------------------------------------------------------------------
    // Assertion module bind
    // ------------------------------------------------------------------------
    bind CgraTemplateRTL cgra_assertions u_assertions (
        .clk            (clk            ),
        .reset          (reset          ),
        .recv_waddr__rdy(recv_waddr__rdy),
        .recv_wopt__rdy (recv_wopt__rdy )
    );

    // ------------------------------------------------------------------------
    // Pass virtual interface to all UVM components via config_db
    // ------------------------------------------------------------------------
    initial begin
        // Single global registration point: visible to any UVM component
        // and sequence that requests "vif".
        uvm_config_db #(virtual cgra_if)::set(
            null, "*", "vif", dut_if);

        dut_if.dump_enable = 1'b0;
        dut_if.dump_const_mem_enable = 1'b0;
        dut_if.dump_ctrl_mem_enable = 1'b0;
        dut_if.dump_data_mem_enable = 1'b0;
        dut_if.post_launch_wait_cycles = 0;
        dut_if.expected_result_count = 0;

        run_test();
    end

    // ------------------------------------------------------------------------
    // Simulation timeout watchdog
    // ------------------------------------------------------------------------
    initial begin
        #1_000_000;
        `uvm_fatal("TIMEOUT", "Simulation reached timeout limit")
    end

    final begin
        if (dut_if.dump_enable) begin
            $display("POST-RUN MEMORY DUMP BEGIN");

            if (dut_if.dump_const_mem_enable || dut_if.dump_ctrl_mem_enable) begin
                dump_tile_0();
                dump_tile_1();
                dump_tile_4();
                dump_tile_5();
                dump_tile_8();
                dump_tile_9();
            end

            if (dut_if.dump_data_mem_enable)
                dump_data_memories();

            $display("POST-RUN MEMORY DUMP END");
        end
    end
endmodule : cgra_tb_top
