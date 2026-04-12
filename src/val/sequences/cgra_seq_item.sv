// ============================================================================
// Name:         cgra_seq_item.sv
// Author:       Obregon Fonseca, Erick
// Create Date:  2026-02-28
// Last Modify:  2026-04-12
// Description:  UVM sequence item - transaction descriptor for
//      CgraTemplateRTL.
//
//      Each item represents one clock cycle of stimulus targeting a single
//      tile's write-address and write-option channels, plus sampled ready
//      outputs from that tile.
// ============================================================================

class cgra_seq_item extends uvm_sequence_item;
    `uvm_object_utils(cgra_seq_item)

    // ------------------------------------------------------------------------
    // Driven fields  (DUT inputs, set by the driver each cycle)
    // ------------------------------------------------------------------------
    rand logic       reset;
    rand logic [5:0] tile_id;          // target tile index (0-63)

    // Write-address channel for the targeted tile
    rand logic       waddr_en;
    rand logic [2:0] waddr_msg;        // ctrl-mem word address

    // Write-option channel for the targeted tile
    rand logic              wopt_en;
    rand CGRAConfig_6_4_10_12 wopt_msg;  // one CGRAConfig to program

    // ------------------------------------------------------------------------
    // Observed fields  (DUT outputs, filled by monitor - not randomized)
    // ------------------------------------------------------------------------
    logic waddr_rdy;
    logic wopt_rdy;

    // ------------------------------------------------------------------------
    // Constraints
    // ------------------------------------------------------------------------
    // Keep channels idle by default; override in programming sequences
    constraint c_default_idle {
        waddr_en == 1'b0;
        wopt_en  == 1'b0;
    }
    // Reset de-asserted most of the time in random stimulus
    constraint c_reset_rare { reset dist { 1'b0 := 95, 1'b1 := 5 }; }
    // Tile index must be within the DUT's 64-tile range
    constraint c_tile_range { tile_id inside { [0:63] }; }

    // ------------------------------------------------------------------------
    // Function: new
    //
    // Description: Constructs the sequence item object.
    //
    // Params:
    //   - name (input string): Sequence item object name.
    // ------------------------------------------------------------------------
    function new(string name = "cgra_seq_item");
        super.new(name);
    endfunction

    // ------------------------------------------------------------------------
    // Function: convert2string
    //
    // Description: Returns a compact string summary of key stimulus and
    //      observed handshake fields.
    //
    // Params:
    //   - none
    // Returns: string
    // ------------------------------------------------------------------------
    function string convert2string();
        return $sformatf(
            "reset=%0b tile=%0d waddr_en=%0b waddr=%0h wopt_en=%0b waddr_rdy=%0b wopt_rdy=%0b",
            reset, tile_id, waddr_en, waddr_msg, wopt_en, waddr_rdy, wopt_rdy);
    endfunction
endclass : cgra_seq_item
