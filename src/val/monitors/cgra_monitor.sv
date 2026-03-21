// ============================================================================
// Name:         cgra_monitor.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-03-21
// Description:  UVM monitor - samples CgraTemplateRTL signals and writes
//      transactions to the analysis port every clock cycle.
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
    // Function: cmd_to_string
    //
    // Description: Converts command field values into readable command names.
    //
    // Params:
    //   - cmd (input logic [4:0]): Command code from packet payload.
    // Returns: string
    // ------------------------------------------------------------------------
    function string cmd_to_string(logic [4:0] cmd);
        case (cmd)
            5'd0:  return "CMD_LAUNCH";
            5'd3:  return "CMD_CONFIG";
            5'd4:  return "CMD_CONFIG_PROLOGUE_FU";
            5'd5:  return "CMD_CONFIG_PROLOGUE_FU_CROSSBAR";
            5'd6:  return "CMD_CONFIG_PROLOGUE_ROUTING_XBAR";
            5'd7:  return "CMD_CONFIG_TOTAL_CTRL_COUNT";
            5'd8:  return "CMD_CONFIG_COUNT_PER_ITER";
            5'd12: return "CMD_STORE_REQUEST";
            5'd13: return "CMD_CONST";
            default: return $sformatf("CMD_UNKNOWN_%0d", cmd);
        endcase
    endfunction

    // ------------------------------------------------------------------------
    // Function: log_tx
    //
    // Description: Emits a formatted transaction log entry to UVM report and
    //      to the optional external transaction log file.
    //
    // Params:
    //   - text (input string): Preformatted message to log.
    //   - verbosity (input uvm_verbosity): UVM verbosity threshold.
    // ------------------------------------------------------------------------
    function void log_tx(string text, uvm_verbosity verbosity = UVM_MEDIUM);
        `uvm_info(get_type_name(), text, verbosity)
        if (tx_log_fd != 0)
            $fdisplay(tx_log_fd, "%s", text);
    endfunction

    // ------------------------------------------------------------------------
    // Task: run_phase
    //
    // Description: Samples DUT interface activity each cycle, builds observed
    //      sequence items, logs key handshakes, and publishes items to
    //      subscribers.
    //
    // Params:
    //   - phase (input uvm_phase): UVM run phase handle.
    // ------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        cgra_seq_item item;
        localparam int CPU_PKT_W = $bits(IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d);
        localparam int NOC_PKT_W = $bits(InterCgraPacket_4_4x1_256_8_4_CgraPayload__0bc91b9c3f724b0b);
        logic [CPU_PKT_W-1:0] cpu_in_bits;
        logic [CPU_PKT_W-1:0] cpu_out_bits;
        logic [NOC_PKT_W-1:0] noc_in_bits;
        logic [NOC_PKT_W-1:0] noc_out_bits;

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

            cpu_in_bits = item.recv_from_cpu_pkt__msg;
            cpu_out_bits = item.send_to_cpu_pkt__msg;
            noc_in_bits = item.recv_from_inter_cgra_noc__msg;
            noc_out_bits = item.send_to_inter_cgra_noc__msg;

            if (item.recv_from_cpu_pkt__val && item.recv_from_cpu_pkt__rdy) begin
                log_tx($sformatf(
                    "t=%0t CPU_IN  src=%0d dst=%0d cmd=%s(%0d) data_addr=%0d payload=0x%08h pred=%0b raw=0x%0h",
                    $time,
                    item.recv_from_cpu_pkt__msg.src,
                    item.recv_from_cpu_pkt__msg.dst,
                    cmd_to_string(item.recv_from_cpu_pkt__msg.payload.cmd),
                    item.recv_from_cpu_pkt__msg.payload.cmd,
                    item.recv_from_cpu_pkt__msg.payload.data_addr,
                    item.recv_from_cpu_pkt__msg.payload.data.payload,
                    item.recv_from_cpu_pkt__msg.payload.data.predicate,
                    cpu_in_bits),
                    UVM_MEDIUM);
            end

            if (item.send_to_cpu_pkt__val && item.send_to_cpu_pkt__rdy) begin
                log_tx($sformatf(
                    "t=%0t CPU_OUT src=%0d dst=%0d payload=0x%08h pred=%0b raw=0x%0h",
                    $time,
                    item.send_to_cpu_pkt__msg.src,
                    item.send_to_cpu_pkt__msg.dst,
                    item.send_to_cpu_pkt__msg.payload.data.payload,
                    item.send_to_cpu_pkt__msg.payload.data.predicate,
                    cpu_out_bits),
                    UVM_MEDIUM);
            end

            if (item.recv_from_inter_cgra_noc__val && item.recv_from_inter_cgra_noc__rdy) begin
                log_tx($sformatf(
                    "t=%0t NOC_IN  raw=0x%0h",
                    $time,
                    noc_in_bits),
                    UVM_MEDIUM);
            end

            if (item.send_to_inter_cgra_noc__val && item.send_to_inter_cgra_noc__rdy) begin
                log_tx($sformatf(
                    "t=%0t NOC_OUT raw=0x%0h",
                    $time,
                    noc_out_bits),
                    UVM_MEDIUM);
            end

            ap.write(item);
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
