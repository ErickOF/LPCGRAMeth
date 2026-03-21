// ============================================================================
// Name:         cgra_driver.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM driver - translates sequence items into DUT pin wiggles.
//      Drives all CgraTemplateRTL input ports each cycle.
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
        vif.driver_cb.reset                         <= 1'b1;
        vif.driver_cb.address_lower                 <= '0;
        vif.driver_cb.address_upper                 <= '0;
        vif.driver_cb.cgra_id                       <= '0;
        vif.driver_cb.recv_from_cpu_pkt__msg        <= '0;
        vif.driver_cb.recv_from_cpu_pkt__val        <= 1'b0;
        vif.driver_cb.recv_from_inter_cgra_noc__msg <= '0;
        vif.driver_cb.recv_from_inter_cgra_noc__val <= 1'b0;
        vif.driver_cb.send_to_cpu_pkt__rdy          <= 1'b1;
        vif.driver_cb.send_to_inter_cgra_noc__rdy   <= 1'b1;
    endtask

    // ------------------------------------------------------------------------
    // Task: drive_item
    //
    // Description: Applies one transaction item to the DUT interface for one
    //      clock cycle.
    //
    // Params:
    //   - item (input cgra_seq_item): Sequence item to drive.
    // ------------------------------------------------------------------------
    task drive_item(cgra_seq_item item);
        @(vif.driver_cb);
        vif.driver_cb.reset                         <= item.reset;
        vif.driver_cb.address_lower                 <= item.address_lower;
        vif.driver_cb.address_upper                 <= item.address_upper;
        vif.driver_cb.cgra_id                       <= item.cgra_id;
        vif.driver_cb.recv_from_cpu_pkt__msg        <= item.recv_from_cpu_pkt__msg;
        vif.driver_cb.recv_from_cpu_pkt__val        <= item.recv_from_cpu_pkt__val;
        vif.driver_cb.recv_from_inter_cgra_noc__msg <= item.recv_from_inter_cgra_noc__msg;
        vif.driver_cb.recv_from_inter_cgra_noc__val <= item.recv_from_inter_cgra_noc__val;
        vif.driver_cb.send_to_cpu_pkt__rdy          <= item.send_to_cpu_pkt__rdy;
        vif.driver_cb.send_to_inter_cgra_noc__rdy   <= item.send_to_inter_cgra_noc__rdy;
        `uvm_info(get_type_name(),
            $sformatf("DRIVE  %s", item.convert2string()), UVM_HIGH)
    endtask
endclass : cgra_driver
