// ============================================================================
// Name:         cgra_driver.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-04-12
// Description:  UVM driver - translates sequence items into DUT pin wiggles.
//      Drives CgraTemplateRTL write-address and write-option input ports
//      for a single targeted tile per transaction.
// ============================================================================

class cgra_driver extends uvm_driver #(cgra_seq_item);
    `uvm_component_utils(cgra_driver)

    virtual cgra_if vif;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the driver instance and forwards arguments to
    //      the UVM base class constructor.
    //
    // Params:
    //   - name (input string): Instance name used by UVM hierarchy/reporting.
    //   - parent (input uvm_component): Parent component in UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Retrieves the virtual interface handle from UVM config_db.
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal(
                get_type_name(),
                "Virtual interface not found. Check uvm_config_db::set() call in tb_top.")
    endfunction

    // ------------------------------------------------------------------------
    // Task: run_phase
    //
    // Description: Initializes interface outputs and continuously drives
    //      sequence items obtained from the sequencer.
    //
    // Params:
    //   - phase (input uvm_phase): UVM run phase handle.
    // ------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        cgra_seq_item item;

        init_signals();

        forever begin
            seq_item_port.get_next_item(item);
            drive_item(item);
            seq_item_port.item_done();
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: init_signals
    //
    // Description: Drives a known-safe idle/reset state on all DUT input
    //      signals before normal traffic begins.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    task init_signals();
        @(vif.driver_cb);
        vif.driver_cb.reset <= 1'b1;
        for (int i = 0; i < 64; i++) begin
            vif.driver_cb.recv_waddr__en[i]  <= 1'b0;
            vif.driver_cb.recv_waddr__msg[i] <= '0;
            vif.driver_cb.recv_wopt__en[i]   <= 1'b0;
            vif.driver_cb.recv_wopt__msg[i]  <= '0;
        end
    endtask

    // ------------------------------------------------------------------------
    // Task: drive_item
    //
    // Description: Applies one transaction item to the DUT interface for one
    //      clock cycle.  All tiles are held idle; only item.tile_id receives
    //      the driven en/msg signals.
    //
    // Params:
    //   - item (input cgra_seq_item): Sequence item to drive.
    // ------------------------------------------------------------------------
    task drive_item(cgra_seq_item item);
        @(vif.driver_cb);
        vif.driver_cb.reset <= item.reset;
        // Default all tiles to idle
        for (int i = 0; i < 64; i++) begin
            vif.driver_cb.recv_waddr__en[i]  <= 1'b0;
            vif.driver_cb.recv_waddr__msg[i] <= '0;
            vif.driver_cb.recv_wopt__en[i]   <= 1'b0;
            vif.driver_cb.recv_wopt__msg[i]  <= '0;
        end
        // Drive the targeted tile
        vif.driver_cb.recv_waddr__en[item.tile_id]  <= item.waddr_en;
        vif.driver_cb.recv_waddr__msg[item.tile_id] <= item.waddr_msg;
        vif.driver_cb.recv_wopt__en[item.tile_id]   <= item.wopt_en;
        vif.driver_cb.recv_wopt__msg[item.tile_id]  <= item.wopt_msg;
        `uvm_info(get_type_name(),
            $sformatf("DRIVE  %s", item.convert2string()), UVM_HIGH)
    endtask
endclass : cgra_driver
