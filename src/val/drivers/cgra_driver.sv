// ============================================================================
// File   : cgra_driver.sv
// Brief  : UVM driver - translates sequence items into DUT pin wiggles.
//          Drives all CgraTemplateRTL input ports each cycle.
// ============================================================================
class cgra_driver extends uvm_driver #(cgra_seq_item);
    `uvm_component_utils(cgra_driver)

    virtual cgra_if vif;

    function new(string name = "cgra_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal(
                get_type_name(),
                "Virtual interface not found. Check uvm_config_db::set() call in tb_top.")
    endfunction

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
    // Initialize DUT inputs to a safe idle state (reset asserted)
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
    // Drive one sequence item onto the interface (one clock cycle)
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
