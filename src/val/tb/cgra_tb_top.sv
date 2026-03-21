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

    task automatic dump_tile_0();
        $display("######### tile 0 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__0.const_mem.reg_file.regs[i]))
                $display("tile0 const[%0d] %0d", i, dut.tile__0.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 0 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__0.ctrl_mem.reg_file.regs[i]))
                $display("tile0 ctrl[%0d] %0d", i, dut.tile__0.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_tile_1();
        $display("######### tile 1 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__1.const_mem.reg_file.regs[i]))
                $display("tile1 const[%0d] %0d", i, dut.tile__1.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 1 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__1.ctrl_mem.reg_file.regs[i]))
                $display("tile1 ctrl[%0d] %0d", i, dut.tile__1.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_tile_4();
        $display("######### tile 4 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__4.const_mem.reg_file.regs[i]))
                $display("tile4 const[%0d] %0d", i, dut.tile__4.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 4 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__4.ctrl_mem.reg_file.regs[i]))
                $display("tile4 ctrl[%0d] %0d", i, dut.tile__4.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_tile_5();
        $display("######### tile 5 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__5.const_mem.reg_file.regs[i]))
                $display("tile5 const[%0d] %0d", i, dut.tile__5.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 5 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__5.ctrl_mem.reg_file.regs[i]))
                $display("tile5 ctrl[%0d] %0d", i, dut.tile__5.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_tile_8();
        $display("######### tile 8 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__8.const_mem.reg_file.regs[i]))
                $display("tile8 const[%0d] %0d", i, dut.tile__8.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 8 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__8.ctrl_mem.reg_file.regs[i]))
                $display("tile8 ctrl[%0d] %0d", i, dut.tile__8.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_tile_9();
        $display("######### tile 9 const mem #################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__9.const_mem.reg_file.regs[i]))
                $display("tile9 const[%0d] %0d", i, dut.tile__9.const_mem.reg_file.regs[i]);
        end
        $display("######### tile 9 ctrl mem ##################");
        for (int i = 0; i < 8; i++) begin
            if (!$isunknown(dut.tile__9.ctrl_mem.reg_file.regs[i]))
                $display("tile9 ctrl[%0d] %0d", i, dut.tile__9.ctrl_mem.reg_file.regs[i]);
        end
    endtask

    task automatic dump_data_memories();
        $display("************* data mem 0 *************");
        for (int i = 0; i < 16; i++) begin
            if (!$isunknown(dut.data_mem.memory_wrapper__0.memory.regs[i]))
                $display("data_mem0[%0d] %0d", i, dut.data_mem.memory_wrapper__0.memory.regs[i]);
        end
        $display("************* data mem 1 *************");
        for (int i = 0; i < 16; i++) begin
            if (!$isunknown(dut.data_mem.memory_wrapper__1.memory.regs[i]))
                $display("data_mem1[%0d] %0d", i, dut.data_mem.memory_wrapper__1.memory.regs[i]);
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
        .clk                   (clk                   ),
        .reset                 (reset                 ),
        .recv_from_cpu_pkt__rdy(recv_from_cpu_pkt__rdy),
        .send_to_cpu_pkt__msg  (send_to_cpu_pkt__msg  ),
        .send_to_cpu_pkt__val  (send_to_cpu_pkt__val  ),
        .send_to_cpu_pkt__rdy  (send_to_cpu_pkt__rdy  )
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
