// ============================================================================
// Name:         cgra_monitor.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-04-12
// Description:  UVM monitor - samples CgraTemplateRTL write-address and
//      write-option handshake signals and publishes one transaction per
//      accepted transfer to the analysis port.
// ============================================================================

class cgra_monitor extends uvm_monitor;
    `uvm_component_utils(cgra_monitor)

    virtual cgra_if vif;
    int tx_log_fd;
    string tx_log_path;

    // Analysis port - broadcasts captured transactions to scoreboard &
    // coverage
    uvm_analysis_port #(cgra_seq_item) ap;

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the monitor instance and forwards arguments to
    //      the UVM base class constructor.
    //
    // Params:
    //   - name (input string): Instance name used by UVM hierarchy/reporting.
    //   - parent (input uvm_component): Parent component in UVM hierarchy.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // ------------------------------------------------------------------------
    // Function: build_phase
    //
    // Description: Creates analysis port, retrieves virtual interface, and
    //      opens optional transaction log file.
    //
    // Params:
    //   - phase (input uvm_phase): UVM build phase handle.
    // ------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);

        if (!uvm_config_db #(virtual cgra_if)::get(this, "", "vif", vif))
            `uvm_fatal(
                get_type_name(),
                "Virtual interface not found. Check uvm_config_db::set() call in tb_top.")

        tx_log_path = "cgra_transactions.log";
        void'($value$plusargs("CGRA_TX_LOG=%s", tx_log_path));
        tx_log_fd = $fopen(tx_log_path, "w");
        if (tx_log_fd == 0)
            `uvm_warning(get_type_name(),
                $sformatf("Failed to open transaction log file: %s", tx_log_path))
        else
            `uvm_info(get_type_name(),
                $sformatf("Transaction debug log enabled: %s", tx_log_path),
                UVM_LOW)
    endfunction

    // ------------------------------------------------------------------------
    // Task: run_phase
    //
    // Description: Samples DUT interface every clock cycle.  For each tile
    //      that completes a write handshake (en && rdy both high), a
    //      cgra_seq_item is built and broadcast to subscribers.
    //
    // Params:
    //   - phase (input uvm_phase): UVM run phase handle.
    // ------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        cgra_seq_item item;

        forever begin
            @(vif.monitor_cb);

            // Scan all 64 tiles for accepted transfers
            for (int i = 0; i < 64; i++) begin
                if (vif.monitor_cb.recv_waddr__en[i] &&
                    vif.monitor_cb.recv_waddr__rdy[i]) begin

                    item = cgra_seq_item::type_id::create("mon_item");
                    item.reset     = vif.monitor_cb.reset;
                    item.tile_id   = 6'(i);
                    item.waddr_en  = vif.monitor_cb.recv_waddr__en[i];
                    item.waddr_msg = vif.monitor_cb.recv_waddr__msg[i];
                    item.waddr_rdy = vif.monitor_cb.recv_waddr__rdy[i];
                    item.wopt_en   = vif.monitor_cb.recv_wopt__en[i];
                    item.wopt_msg  = vif.monitor_cb.recv_wopt__msg[i];
                    item.wopt_rdy  = vif.monitor_cb.recv_wopt__rdy[i];

                    if (tx_log_fd != 0)
                        $fdisplay(tx_log_fd,
                            "t=%0t WRITE_ACCEPTED tile=%0d waddr=%0h",
                            $time, i, item.waddr_msg);

                    `uvm_info(get_type_name(),
                        $sformatf("OBSERVE %s", item.convert2string()), UVM_HIGH)

                    ap.write(item);
                end
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Function: final_phase
    //
    // Description: Closes the transaction log file during final cleanup.
    //
    // Params:
    //   - phase (input uvm_phase): UVM final phase handle.
    // ------------------------------------------------------------------------
    function void final_phase(uvm_phase phase);
        if (tx_log_fd != 0)
            $fclose(tx_log_fd);
    endfunction
endclass : cgra_monitor
