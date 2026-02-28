// ============================================================================
// File   : cgra_driver.sv
// Brief  : UVM driver – translates sequence items into DUT pin wiggles.
//          Currently drives the dummy DFF interface.
//
// TODO CGRA: In drive_item(), replace the two signal assignments with the full
//            handshake protocol for CgraTemplateRTL:
//              1.  Drive address_lower / address_upper / cgra_id once.
//              2.  For CPU_PKT items: assert recv_from_cpu_pkt__val,
//                  present recv_from_cpu_pkt__msg, wait for __rdy.
//              3.  For INTER_NOC items: same pattern on noc channel.
//              4.  For RESET items: assert DUT reset for N cycles.
//            Also update vif signal names to match cgra_if.sv.
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
            `uvm_fatal("NO_VIF",
                "cgra_driver: virtual interface not found. "
                "Check uvm_config_db::set() call in tb_top.")
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
    // Initialise DUT inputs to a known idle state
    // TODO CGRA: add all real DUT input defaults here
    // ------------------------------------------------------------------------
    task init_signals();
        @(vif.driver_cb);
        vif.driver_cb.reset   <= 1'b1;
        vif.driver_cb.data_in <= '0;
    endtask

    // ------------------------------------------------------------------------
    // Drive one sequence item onto the interface
    // TODO CGRA: replace with protocol-correct handshake logic
    // ------------------------------------------------------------------------
    task drive_item(cgra_seq_item item);
        @(vif.driver_cb);
        // TODO CGRA: drive real DUT signals here
        vif.driver_cb.reset   <= item.reset;
        vif.driver_cb.data_in <= item.data_in;
        `uvm_info(get_type_name(),
            $sformatf("DRIVE  %s", item.convert2string()), UVM_HIGH)
    endtask
endclass : cgra_driver
