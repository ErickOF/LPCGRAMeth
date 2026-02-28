// ============================================================================
// File   : cgra_monitor.sv
// Brief  : UVM monitor – samples DUT signals and writes transactions to the
//          analysis port every clock cycle.
//          Currently observes the dummy DFF interface.
//
// TODO CGRA: In run_phase(), sample the real DUT output channels:
//              - Capture send_to_cpu_pkt__msg / __val / __rdy
//              - Capture send_to_inter_cgra_noc__msg / __val / __rdy
//            Only write() an item when a valid handshake is detected
//            (val && rdy) rather than every clock edge.
// ============================================================================
class cgra_monitor extends uvm_monitor;
    `uvm_component_utils(cgra_monitor)

    virtual cgra_if vif;

    // Analysis port – broadcasts captured transactions to scoreboard & coverage
    uvm_analysis_port #(cgra_seq_item) ap;

    function new(string name = "cgra_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal("NO_VIF",
                "cgra_monitor: virtual interface not found. "
                "Check uvm_config_db::set() call in tb_top.")
    endfunction

    task run_phase(uvm_phase phase);
        cgra_seq_item item;

        forever begin
            @(vif.monitor_cb);
            item = cgra_seq_item::type_id::create("mon_item");

            // TODO CGRA: replace with real DUT signal capture
            item.reset    = vif.monitor_cb.reset;
            item.data_in  = vif.monitor_cb.data_in;
            item.data_out = vif.monitor_cb.data_out;

            `uvm_info(get_type_name(),
                $sformatf("OBSERVE %s", item.convert2string()), UVM_HIGH)
            ap.write(item);
        end
    endtask
endclass : cgra_monitor
