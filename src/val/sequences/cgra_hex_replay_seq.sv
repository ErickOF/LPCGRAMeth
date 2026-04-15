// ============================================================================
// Name:         cgra_hex_replay_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-20
// Last Modify:  2026-04-12
// Description:  Replays pre-encoded write transactions from a hex file.
//
//      File format (one transaction per line, fields space-separated):
//        <tile_id_hex>  <waddr_hex>  <wopt_hex>
//
//      Where:
//        tile_id_hex : 2 hex digits  (6-bit tile index, 0-63)
//        waddr_hex   : 1 hex digit   (3-bit ctrl-mem slot address)
//        wopt_hex    : 20 hex digits (77-bit CGRAConfig_6_4_10_12)
//
//      Lines starting with '#' or empty lines are ignored.
// ============================================================================

class cgra_hex_replay_seq extends cgra_program_base_seq;
    `uvm_object_utils(cgra_hex_replay_seq)

    string packet_hex_file = "src/gen/uvm_packet_stream.hex";

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the hex-replay sequence.
    //
    // Params:
    //   - name (input string): Sequence instance name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_hex_replay_seq");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Task: body
    //
    // Description: Reads write-transaction lines from hex file and drives each
    //      one to the DUT via send_write_with_handshake.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        int          fd;
        int          line_num;
        int          sent_count;
        string       line;
        logic [7:0]  tile_id_raw;
        logic [3:0]  waddr_raw;
        logic [76:0] wopt_raw;   // CGRAConfig_6_4_10_12 is 77 bits
        logic [5:0]  tile_id;
        logic [2:0]  waddr;
        CGRAConfig_6_4_10_12 wopt_msg;

        init_vif();

        fd = $fopen(packet_hex_file, "r");
        if (fd == 0)
            `uvm_fatal(get_type_name(),
                $sformatf("Cannot open hex file: %s", packet_hex_file))

        `uvm_info(get_type_name(),
            $sformatf("Replaying writes from %s", packet_hex_file), UVM_MEDIUM)

        line_num   = 0;
        sent_count = 0;

        while (!$feof(fd)) begin
            line = "";
            void'($fgets(line, fd));
            line_num++;

            // Skip blank lines and comments
            if (line.len() == 0 || line[0] == "#" || line[0] == "\n")
                continue;

            if ($sscanf(line, "%h %h %h", tile_id_raw, waddr_raw, wopt_raw) == 3) begin
                tile_id  = tile_id_raw[5:0];
                waddr    = waddr_raw[2:0];
                wopt_msg = CGRAConfig_6_4_10_12'(wopt_raw);
                send_write_with_handshake(tile_id, waddr, wopt_msg);
                sent_count++;
            end
        end

        $fclose(fd);

        `uvm_info(get_type_name(),
            $sformatf("Replayed %0d write(s) from %s", sent_count, packet_hex_file),
            UVM_LOW)
    endtask
endclass : cgra_hex_replay_seq
