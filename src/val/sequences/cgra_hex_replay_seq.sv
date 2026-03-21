// ============================================================================
// Name:         cgra_hex_replay_seq.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-03-20
// Last Modify:  2026-03-21
// Description:  Replays pre-encoded packet hex lines into the DUT.
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
    // Description: Reads packed packet lines from hex file and transmits each
    //      packet with CPU-channel handshake.
    //
    // Params:
    //   - none
    // ------------------------------------------------------------------------
    virtual task body();
        typedef IntraCgraPacket_4_4x1_256_8_2_CgraPayload__7c76b76106625f8d pkt_t;
        localparam int PKT_W = $bits(pkt_t);

        int fd;
        int line_num;
        int sent_count;
        string line;
        logic [PKT_W-1:0] packed;
        pkt_t pkt;

        init_vif();

        fd = $fopen(packet_hex_file, "r");
        if (fd == 0)
            `uvm_fatal(get_type_name(),
                $sformatf("Cannot open packet hex file: %s", packet_hex_file))

        `uvm_info(get_type_name(),
            $sformatf("Replaying packets from %s", packet_hex_file), UVM_MEDIUM)

        line_num = 0;
        sent_count = 0;

        while (!$feof(fd)) begin
            line = "";
            void'($fgets(line, fd));
            line_num++;

            if ($sscanf(line, "%h", packed) == 1) begin
                pkt = pkt_t'(packed);
                send_cpu_pkt_with_handshake(pkt);
                sent_count++;
            end
        end

        $fclose(fd);

        `uvm_info(get_type_name(),
            $sformatf("Replayed %0d packet(s) from %s", sent_count, packet_hex_file),
            UVM_LOW)
    endtask
endclass : cgra_hex_replay_seq
