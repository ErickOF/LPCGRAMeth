"""json_to_imem.py

Convert a JSON operation map into IMEM words consumable by the SV flow.

Input format:
- A list of map entries (like ``spec/map/vector.json``), each containing
  ``x``, ``y``, ``cycle``, ``opt``, ``predicate``, and ``out_0..out_7``.

Output:
- ``src/gen/imem.hex`` by default, one 32-bit instruction per line.
- Optional packet dump file (one 185-bit packet hex per line).

The generated IMEM sequence mirrors ``sv_test/header*.sv`` packet printing
style used to serialize one packet into RISC-V instructions.
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Any

DEFAULT_OPCODE_MAP: dict[str, int] = {
    "OPT_NAH": 1,
    "OPT_ADD": 2,
    "OPT_MUL": 7,
    "OPT_LD": 12,
    "OPT_DIV": 26,
    "OPT_ADD_CONST": 25,
    "OPT_PHI_CONST": 32,
    "OPT_EQ_CONST": 33,
    "OPT_REM": 44,
    # Values below are project-specific and may differ across variants.
    "OPT_EXT": 12,
    "OPT_BRH": 1,
}
DEFAULT_OPCODE_FILE = Path("spec/opcodes.json")

# Normalize map operation names that appear in exported JSON but map to the
# same hardware opcodes in this CGRA RTL.
OP_ALIASES: dict[str, str] = {
    "OPT_UDIV": "OPT_DIV",
    "OPT_UREM": "OPT_REM",
    "OPT_SDIV": "OPT_DIV",
    "OPT_SREM": "OPT_REM",
}

CMD_CONFIG = 3
PACKET_WIDTH = 185
UVM_PACKET_WIDTH = 228


def _append_field(acc: int, value: int, width: int) -> int:
    """Append one field to an MSB-first packed integer."""
    return (acc << width) | (value & ((1 << width) - 1))


def _parse_selector(value: Any) -> int:
    """Parse routing selector values from JSON."""
    if isinstance(value, str) and value.lower() == "none":
        return 0
    return int(value) & 0x7


def _load_opcode_map(opcode_file: str | Path) -> dict[str, int]:
    """Load opcode definitions from JSON, creating defaults when missing."""
    path = Path(opcode_file)

    if not path.exists():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(DEFAULT_OPCODE_MAP, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    raw = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(raw, dict):
        raise ValueError(f"Opcode file must contain a JSON object: {path}")

    result: dict[str, int] = {}
    for k, v in raw.items():
        result[str(k)] = int(v)

    return result


def _emit_opcode_svh(opcode_map: dict[str, int], output_file: str | Path) -> Path:
    """Emit a shared SystemVerilog opcode macro header."""
    out = Path(output_file)
    lines: list[str] = [
        "`ifndef CGRA_OPCODE_DEFINES_SVH",
        "`define CGRA_OPCODE_DEFINES_SVH",
        "",
        "// Auto-generated from spec/opcodes.json",
        "// Shared opcode source for scripts and SV testbench.",
        "",
    ]

    for name in sorted(opcode_map):
        lines.append(f"`define {name} 7'd{opcode_map[name]}")

    lines.extend(["", "`endif // CGRA_OPCODE_DEFINES_SVH", ""])

    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(lines), encoding="utf-8")
    return out


def _encode_operation(raw_opt: str, opcode_map: dict[str, int]) -> tuple[int, str | None]:
    """Map operation string to opcode; return warning text when fallback is used."""
    canonical = OP_ALIASES.get(raw_opt, raw_opt)
    if canonical in opcode_map:
        return opcode_map[canonical], None

    # Handle strings like: "Unfamiliar Op: udiv"
    if ":" in raw_opt:
        _, rhs = raw_opt.split(":", 1)
        maybe = f"OPT_{rhs.strip().upper()}"
        canonical = OP_ALIASES.get(maybe, maybe)
        if canonical in opcode_map:
            return opcode_map[canonical], None

    nop_name = "OPT_START" if "OPT_START" in opcode_map else "OPT_NAH"
    nop_val  = opcode_map.get(nop_name, 0)
    return nop_val, f"Unsupported op '{raw_opt}' -> using {nop_name} ({nop_val})"


def _build_packet(entry: dict[str, Any], mesh_cols: int, opcode_map: dict[str, int]) -> tuple[int, list[str]]:
    """Build one legacy 185-bit IntraCgra packet from a JSON map entry."""
    warnings: list[str] = []

    x = int(entry["x"])
    y = int(entry["y"])
    cycle = int(entry["cycle"])
    predicate = int(entry.get("predicate", 0)) & 0x1

    tile_id = y * mesh_cols + x
    opcode, warn = _encode_operation(str(entry.get("opt", "OPT_START")), opcode_map)
    if warn is not None:
        warnings.append(f"tile={tile_id} cycle={cycle}: {warn}")

    # Control payload defaults
    fu_in = [0, 0, 0, 0]
    routing = [_parse_selector(entry.get(f"out_{i}", "none")) for i in range(8)]
    fu_xbar = [0] * 8
    vector_factor_power = 0
    is_last_ctrl = 0
    write_reg_from = [0, 0, 0, 0]
    write_reg_idx = [0, 0, 0, 0]
    read_reg_from = [0, 0, 0, 0]
    read_reg_idx = [0, 0, 0, 0]

    pkt = 0

    # Intra header (legacy 4_2x2_16_8_2 flavor used by sv_test)
    pkt = _append_field(pkt, 0, 5)  # src
    pkt = _append_field(pkt, tile_id, 5)  # dst
    pkt = _append_field(pkt, 0, 2)  # src_cgra_id
    pkt = _append_field(pkt, 0, 2)  # dst_cgra_id
    pkt = _append_field(pkt, 0, 1)  # src_cgra_x
    pkt = _append_field(pkt, 0, 1)  # src_cgra_y
    pkt = _append_field(pkt, 0, 1)  # dst_cgra_x
    pkt = _append_field(pkt, 0, 1)  # dst_cgra_y
    pkt = _append_field(pkt, 0, 8)  # opaque
    pkt = _append_field(pkt, 0, 1)  # vc_id

    # MultiCgra payload
    pkt = _append_field(pkt, CMD_CONFIG, 5)  # cmd
    pkt = _append_field(pkt, 0, 32)  # data.payload
    pkt = _append_field(pkt, predicate, 1)  # data.predicate
    pkt = _append_field(pkt, 0, 1)  # data.bypass
    pkt = _append_field(pkt, 0, 1)  # data.delay
    pkt = _append_field(pkt, 0, 7)  # data_addr

    # CGRAConfig fields
    pkt = _append_field(pkt, opcode, 7)  # operation
    for sel in fu_in:
        pkt = _append_field(pkt, sel, 3)
    for sel in routing:
        pkt = _append_field(pkt, sel, 3)
    for sel in fu_xbar:
        pkt = _append_field(pkt, sel, 2)
    pkt = _append_field(pkt, vector_factor_power, 3)
    pkt = _append_field(pkt, is_last_ctrl, 1)
    for v in write_reg_from:
        pkt = _append_field(pkt, v, 2)
    for v in write_reg_idx:
        pkt = _append_field(pkt, v, 4)
    for v in read_reg_from:
        pkt = _append_field(pkt, v, 1)
    for v in read_reg_idx:
        pkt = _append_field(pkt, v, 4)

    pkt = _append_field(pkt, cycle, 4)  # ctrl_addr

    return pkt, warnings


def _build_uvm_packet(entry: dict[str, Any], mesh_cols: int, opcode_map: dict[str, int]) -> tuple[int, list[str]]:
    """Build one 228-bit UVM packet matching IntraCgraPacket_4_4x1_256_8_2."""
    warnings: list[str] = []

    x = int(entry["x"])
    y = int(entry["y"])
    cycle = int(entry["cycle"])
    predicate = int(entry.get("predicate", 0)) & 0x1

    tile_id = y * mesh_cols + x
    opcode, warn = _encode_operation(str(entry.get("opt", "OPT_START")), opcode_map)
    if warn is not None:
        warnings.append(f"tile={tile_id} cycle={cycle}: {warn}")

    fu_in = [0, 0, 0, 0]
    routing8 = [_parse_selector(entry.get(f"out_{i}", "none")) for i in range(8)]
    routing12 = [*routing8, 0, 0, 0, 0]
    fu_xbar12 = [0] * 12
    vector_factor_power = 0
    is_last_ctrl = 0
    write_reg_from = [0, 0, 0, 0]
    write_reg_idx = [0, 0, 0, 0]
    read_reg_from = [0, 0, 0, 0]
    read_reg_idx = [0, 0, 0, 0]

    pkt = 0

    # Intra header
    pkt = _append_field(pkt, 0, 9)  # src
    pkt = _append_field(pkt, tile_id, 9)  # dst
    pkt = _append_field(pkt, 0, 2)  # src_cgra_id
    pkt = _append_field(pkt, 0, 2)  # dst_cgra_id
    pkt = _append_field(pkt, 0, 2)  # src_cgra_x
    pkt = _append_field(pkt, 0, 1)  # src_cgra_y
    pkt = _append_field(pkt, 0, 2)  # dst_cgra_x
    pkt = _append_field(pkt, 0, 1)  # dst_cgra_y
    pkt = _append_field(pkt, 0, 8)  # opaque
    pkt = _append_field(pkt, 0, 1)  # vc_id

    # Payload
    pkt = _append_field(pkt, CMD_CONFIG, 5)  # cmd
    pkt = _append_field(pkt, 0, 32)  # data.payload
    pkt = _append_field(pkt, predicate, 1)  # data.predicate
    pkt = _append_field(pkt, 0, 1)  # data.bypass
    pkt = _append_field(pkt, 0, 1)  # data.delay
    pkt = _append_field(pkt, 0, 9)  # data_addr

    pkt = _append_field(pkt, opcode, 7)  # operation
    for sel in fu_in:
        pkt = _append_field(pkt, sel, 3)
    for sel in routing12:
        pkt = _append_field(pkt, sel, 4)
    for sel in fu_xbar12:
        pkt = _append_field(pkt, sel, 2)
    pkt = _append_field(pkt, vector_factor_power, 3)
    pkt = _append_field(pkt, is_last_ctrl, 1)
    for v in write_reg_from:
        pkt = _append_field(pkt, v, 2)
    for v in write_reg_idx:
        pkt = _append_field(pkt, v, 4)
    for v in read_reg_from:
        pkt = _append_field(pkt, v, 1)
    for v in read_reg_idx:
        pkt = _append_field(pkt, v, 4)

    pkt = _append_field(pkt, cycle, 3)  # ctrl_addr

    return pkt, warnings


def _emit_chunk_load_store(words: list[str], value64: int, rd: int, store_inst: str) -> None:
    """Emit the 8 instruction sequence used in sv_test/header*.sv for one 64b chunk."""
    hi32 = (value64 >> 32) & 0xFFFFFFFF
    lo32 = value64 & 0xFFFFFFFF

    # Build x<rd> from hi32: LUI + ADDI + SLLI + SLLI
    hi_lui_imm = ((hi32 >> 12) + ((hi32 >> 11) & 0x1)) & 0xFFFFF
    hi_addi_imm = hi32 & 0xFFF

    # Build x31 from lo32: LUI + ADDI
    lo_lui_imm = ((lo32 >> 12) + ((lo32 >> 11) & 0x1)) & 0xFFFFF
    lo_addi_imm = lo32 & 0xFFF

    if rd == 7:
        words.append(f"{hi_lui_imm:05x}3b7")
        words.append(f"{hi_addi_imm:03x}38393")
        words.append("01039393")
        words.append("01039393")
        words.append(f"{lo_lui_imm:05x}fb7")
        words.append(f"{lo_addi_imm:03x}f8f93")
        words.append("01f383b3")
    elif rd == 8:
        words.append(f"{hi_lui_imm:05x}437")
        words.append(f"{hi_addi_imm:03x}40413")
        words.append("01041413")
        words.append("01041413")
        words.append(f"{lo_lui_imm:05x}fb7")
        words.append(f"{lo_addi_imm:03x}f8f93")
        words.append("01f40433")
    elif rd == 10:
        words.append(f"{hi_lui_imm:05x}537")
        words.append(f"{hi_addi_imm:03x}50513")
        words.append("01051513")
        words.append("01051513")
        words.append(f"{lo_lui_imm:05x}fb7")
        words.append(f"{lo_addi_imm:03x}f8f93")
        words.append("01f50533")
    else:
        raise ValueError(f"Unsupported target register x{rd}")

    words.append(store_inst)


def _packet_to_imem_words(packet: int) -> list[str]:
    """Convert one 185-bit packet into the header-compatible IMEM instruction sequence."""
    mask64 = (1 << 64) - 1
    w0 = packet & mask64
    w1 = (packet >> 64) & mask64
    w2 = (packet >> 128) & ((1 << 57) - 1)  # top chunk is only 57 bits

    words: list[str] = []
    _emit_chunk_load_store(words, w0, rd=7, store_inst="0070b023")
    _emit_chunk_load_store(words, w1, rd=8, store_inst="0080b423")
    _emit_chunk_load_store(words, w2, rd=10, store_inst="00a0b823")
    words.append("01808093")  # addi x1, x1, 24
    return words


def generate_imem_from_map(
    input_json: str | Path,
    output_hex: str | Path,
    packet_dump: str | Path | None = None,
    opcode_file: str | Path = DEFAULT_OPCODE_FILE,
    opcode_svh: str | Path | None = None,
    uvm_packet_dump: str | Path | None = None,
) -> tuple[Path, int, int]:
    """Generate IMEM words from map JSON.

    Returns:
        Tuple of (output_path, packet_count, warning_count).
    """
    in_path = Path(input_json)
    out_path = Path(output_hex)
    opcode_map = _load_opcode_map(opcode_file)

    data = json.loads(in_path.read_text(encoding="utf-8"))
    if not isinstance(data, list):
        raise ValueError("Input JSON must be a list of map entries.")

    entries = [e for e in data if isinstance(e, dict)]
    entries.sort(key=lambda e: (int(e.get("cycle", 0)), int(e.get("y", 0)), int(e.get("x", 0))))

    max_x = max((int(e.get("x", 0)) for e in entries), default=0)
    mesh_cols = max_x + 1

    imem_words: list[str] = []
    packet_lines: list[str] = []
    uvm_packet_lines: list[str] = []
    warnings: list[str] = []

    for entry in entries:
        packet, warn_list = _build_packet(entry, mesh_cols, opcode_map)
        warnings.extend(warn_list)

        packet_lines.append(f"{packet:055x}")
        imem_words.extend(_packet_to_imem_words(packet))

        if uvm_packet_dump is not None:
            uvm_packet, uvm_warn = _build_uvm_packet(entry, mesh_cols, opcode_map)
            warnings.extend(uvm_warn)
            uvm_packet_lines.append(f"{uvm_packet:057x}")

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(imem_words) + ("\n" if imem_words else ""), encoding="utf-8")

    if packet_dump is not None:
        pkt_path = Path(packet_dump)
        pkt_path.parent.mkdir(parents=True, exist_ok=True)
        pkt_path.write_text("\n".join(packet_lines) + ("\n" if packet_lines else ""), encoding="utf-8")

    if uvm_packet_dump is not None:
        uvm_path = Path(uvm_packet_dump)
        uvm_path.parent.mkdir(parents=True, exist_ok=True)
        uvm_path.write_text("\n".join(uvm_packet_lines) + ("\n" if uvm_packet_lines else ""), encoding="utf-8")

    if opcode_svh is not None:
        _emit_opcode_svh(opcode_map, opcode_svh)

    for w in warnings:
        print(f"[WARN] {w}", file=sys.stderr)

    return out_path, len(packet_lines), len(warnings)


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="json_to_imem",
        description="Convert a map JSON file to an IMEM hex stream for SV tests.",
    )
    parser.add_argument(
        "input_json",
        nargs="?",
        default=Path("spec/map/vector.json"),
        type=Path,
        help="Input map JSON (default: spec/map/vector.json)",
    )
    parser.add_argument(
        "-o",
        "--output",
        default=Path("src/gen/imem.hex"),
        type=Path,
        help="Output IMEM hex file (default: src/gen/imem.hex)",
    )
    parser.add_argument(
        "--packet-dump",
        default=Path("src/gen/packet_stream.hex"),
        type=Path,
        help="Optional 185-bit packet dump (default: src/gen/packet_stream.hex)",
    )
    parser.add_argument(
        "--uvm-packet-dump",
        default=Path("src/gen/uvm_packet_stream.hex"),
        type=Path,
        help="Optional 228-bit UVM packet dump (default: src/gen/uvm_packet_stream.hex)",
    )
    parser.add_argument(
        "--opcodes",
        default=DEFAULT_OPCODE_FILE,
        type=Path,
        help="Shared opcode JSON file (default: spec/opcodes.json)",
    )
    parser.add_argument(
        "--opcode-svh",
        default=Path("src/gen/cgra_opcodes.svh"),
        type=Path,
        help="Generated shared SV opcode header (default: src/gen/cgra_opcodes.svh)",
    )
    return parser


def main() -> None:
    args = _build_parser().parse_args()
    input_json: Path = args.input_json
    output_hex: Path = args.output
    packet_dump: Path | None = args.packet_dump
    uvm_packet_dump: Path | None = args.uvm_packet_dump
    opcode_file: Path = args.opcodes
    opcode_svh: Path | None = args.opcode_svh

    if not input_json.exists():
        print(f"Error: Input file not found: {input_json}", file=sys.stderr)
        sys.exit(1)
    if not input_json.is_file():
        print(f"Error: Input path is not a file: {input_json}", file=sys.stderr)
        sys.exit(1)

    try:
        out_path, pkt_count, warn_count = generate_imem_from_map(
            input_json,
            output_hex,
            packet_dump,
            opcode_file,
            opcode_svh,
            uvm_packet_dump,
        )
    except Exception as exc:
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(1)

    print(f"Created: {out_path}")
    print(f"Packets encoded: {pkt_count}")
    if packet_dump is not None:
        print(f"Packet dump: {packet_dump}")
    if uvm_packet_dump is not None:
        print(f"UVM packet dump: {uvm_packet_dump}")
    if opcode_svh is not None:
        print(f"Opcode header: {opcode_svh}")
    if warn_count:
        print(f"Warnings: {warn_count}")


if __name__ == "__main__":
    main()
