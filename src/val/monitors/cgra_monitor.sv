// ============================================================================
// File   : cgra_monitor.sv
// Brief  : UVM monitor - samples CgraTemplateRTL signals and writes
//          transactions to the analysis port every clock cycle.
// ============================================================================
class cgra_monitor extends uvm_monitor;
    `uvm_component_utils(cgra_monitor)

    virtual cgra_if vif;

    // Analysis port - broadcasts captured transactions to scoreboard &
    // coverage
    uvm_analysis_port #(cgra_seq_item) ap;

    function new(string name = "cgra_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal(
                get_type_name(),
                "Virtual interface not found. Check uvm_config_db::set() call in tb_top.")
    endfunction

    task run_phase(uvm_phase phase);
        cgra_seq_item item;

        forever begin
            @(vif.monitor_cb);
            item = cgra_seq_item::type_id::create("mon_item");

            // Capture driven inputs
            item.reset                         = vif.monitor_cb.reset;
            item.address_lower                 = vif.monitor_cb.address_lower;
            item.address_upper                 = vif.monitor_cb.address_upper;
            item.cgra_id                       = vif.monitor_cb.cgra_id;
            item.recv_from_cpu_pkt__msg        = vif.monitor_cb.recv_from_cpu_pkt__msg;
            item.recv_from_cpu_pkt__val        = vif.monitor_cb.recv_from_cpu_pkt__val;
            item.recv_from_inter_cgra_noc__msg = vif.monitor_cb.recv_from_inter_cgra_noc__msg;
            item.recv_from_inter_cgra_noc__val = vif.monitor_cb.recv_from_inter_cgra_noc__val;
            item.send_to_cpu_pkt__rdy          = vif.monitor_cb.send_to_cpu_pkt__rdy;
            item.send_to_inter_cgra_noc__rdy   = vif.monitor_cb.send_to_inter_cgra_noc__rdy;

            // Capture DUT outputs
            item.recv_from_cpu_pkt__rdy        = vif.monitor_cb.recv_from_cpu_pkt__rdy;
            item.recv_from_inter_cgra_noc__rdy = vif.monitor_cb.recv_from_inter_cgra_noc__rdy;
            item.send_to_cpu_pkt__msg          = vif.monitor_cb.send_to_cpu_pkt__msg;
            item.send_to_cpu_pkt__val          = vif.monitor_cb.send_to_cpu_pkt__val;
            item.send_to_inter_cgra_noc__msg   = vif.monitor_cb.send_to_inter_cgra_noc__msg;
            item.send_to_inter_cgra_noc__val   = vif.monitor_cb.send_to_inter_cgra_noc__val;

            `uvm_info(get_type_name(),
                $sformatf("OBSERVE %s", item.convert2string()), UVM_HIGH)
            ap.write(item);
        end
    endtask
endclass : cgra_monitor
