// ============================================================================
// Name:         cgra_program_base_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-12
// Last Modify:  2026-04-12
// Description:  Shared helper sequence for CGRA programming flows.
//      Provides send_write_with_handshake() to drive one
//      (tile_id, waddr_msg, wopt_msg) transfer on the DUT's
//      recv_waddr / recv_wopt channels, retrying until the DUT asserts
//      both ready signals.
// ============================================================================

class cgra_program_base_seq extends cgra_base_seq;

    cgra_tile_cfg     tile_cfgs[$];
    virtual cgra_if   vif;

    // ------------------------------------------------------------------------
    // Function: new
    // ------------------------------------------------------------------------
    function new(string name = "cgra_program_base_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: init_vif
    //
    // Description: Lazily retrieves and caches virtual interface handle.
    // ------------------------------------------------------------------------
    task init_vif();
        if (vif != null)
            return;
        if (!uvm_config_db #(virtual cgra_if)::get(null, get_full_name(), "vif", vif))
            `uvm_fatal(get_type_name(),
                {"Virtual interface 'vif' not found. ",
                 "Ensure cgra_tb_top calls uvm_config_db::set()."})
    endtask

    // ------------------------------------------------------------------------
    // Task: send_write_with_handshake
    //
    // Description: Drives a (waddr_msg, wopt_msg) write to the specified tile
    //      and retries on consecutive clock cycles until the DUT asserts
    //      recv_waddr__rdy[tile_id].  Both waddr and wopt are driven
    //      simultaneously in every attempt.
    //
    // Params:
    //   - tile_id  (input logic [5:0]):          Target tile index (0-63).
    //   - waddr    (input logic [2:0]):           Ctrl-mem word address.
    //   - wopt_msg (input CGRAConfig_6_4_10_12): Configuration word.
    // ------------------------------------------------------------------------
    task send_write_with_handshake(
        input logic [5:0]           tile_id,
        input logic [2:0]           waddr,
        input CGRAConfig_6_4_10_12  wopt_msg
    );
        cgra_seq_item item;
        bit accepted;
        int unsigned n_attempts;

        init_vif();
        accepted   = 1'b0;
        n_attempts = 0;

        `uvm_info(get_type_name(),
            $sformatf("t=%0t WRITE_START tile=%0d addr=%0h", $time, tile_id, waddr),
            UVM_HIGH)

        while (!accepted) begin
            n_attempts++;
            item = cgra_seq_item::type_id::create("cfg_item");
            start_item(item);

            item.reset     = 1'b0;
            item.tile_id   = tile_id;
            item.waddr_en  = 1'b1;
            item.waddr_msg = waddr;
            item.wopt_en   = 1'b1;
            item.wopt_msg  = wopt_msg;

            finish_item(item);
            // Ready is sampled after the clock edge driven by finish_item
            accepted = vif.driver_cb.recv_waddr__rdy[tile_id];

            if (!accepted)
                `uvm_info(get_type_name(),
                    $sformatf("t=%0t WRITE_RETRY tile=%0d addr=%0h attempt=%0d",
                        $time, tile_id, waddr, n_attempts),
                    UVM_HIGH)
        end

        `uvm_info(get_type_name(),
            $sformatf("t=%0t WRITE_ACCEPTED tile=%0d addr=%0h attempts=%0d",
                $time, tile_id, waddr, n_attempts),
            UVM_MEDIUM)
    endtask

    // ------------------------------------------------------------------------
    // Task: program_tile_step
    //
    // Description: Convenience wrapper that builds a CGRAConfig_6_4_10_12
    //      from discrete fields and calls send_write_with_handshake.
    //
    // Params:
    //   - tile_id       : Target tile index (0-63).
    //   - ctrl_addr     : Ctrl-mem slot address (3 bits).
    //   - ctrl          : 6-bit control field.
    //   - predicate     : 1-bit predicate field.
    //   - fu_in         : 4x3-bit FU input selector array.
    //   - outport       : 12x4-bit output port selector array.
    //   - predicate_in  : 10x1-bit predicate input array.
    // ------------------------------------------------------------------------
    task program_tile_step(
        input logic [5:0]           tile_id,
        input logic [2:0]           ctrl_addr,
        input logic [5:0]           ctrl,
        input logic [0:0]           predicate,
        input logic [3:0][2:0]      fu_in,
        input logic [11:0][3:0]     outport,
        input logic [9:0][0:0]      predicate_in
    );
        CGRAConfig_6_4_10_12 cfg;
        cfg.ctrl         = ctrl;
        cfg.predicate    = predicate;
        cfg.fu_in        = fu_in;
        cfg.outport      = outport;
        cfg.predicate_in = predicate_in;
        send_write_with_handshake(tile_id, ctrl_addr, cfg);
    endtask

endclass : cgra_program_base_seq
