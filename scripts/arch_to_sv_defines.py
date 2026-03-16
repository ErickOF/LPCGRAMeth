"""
arch_to_sv_defines.py

Generate SystemVerilog `define macros from an architecture YAML file.

The script reads a YAML file from `spec/arch/` (or any user-provided path) and
emits a `.svh` defines file under `src/gen/` by default.

Usage::

    python scripts/arch_to_sv_defines.py
    python scripts/arch_to_sv_defines.py spec/arch/arch_vector_cgra_16x16.yaml
    python scripts/arch_to_sv_defines.py spec/arch/arch_vector_cgra_16x16.yaml -o src/gen/cgra_arch_defines.svh
"""

import argparse
import re
import sys
from pathlib import Path
from typing import Any

try:
    import yaml
except ImportError as exc:
    raise SystemExit(
        "PyYAML is required. Install it with: pip install pyyaml"
    ) from exc


def _to_macro_name(path_parts: list[str]) -> str:
    """Convert nested YAML key parts into an uppercase macro name."""
    cleaned = [re.sub(r"[^a-zA-Z0-9]+", "_", p).strip("_") for p in path_parts]
    return "CGRA_" + "_".join(part.upper() for part in cleaned if part)


def _sv_literal(value: Any) -> str:
    """Convert a Python scalar into a SystemVerilog-friendly literal."""
    if isinstance(value, bool):
        return "1" if value else "0"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        return repr(value)
    if isinstance(value, str):
        escaped = value.replace("\\", "\\\\").replace('"', '\\"')
        return f'"{escaped}"'
    raise TypeError(f"Unsupported scalar type for macro value: {type(value).__name__}")


def _emit_scalars(node: Any, prefix: list[str], out_lines: list[str]) -> None:
    """Walk nested dictionaries and emit macros for scalar values."""
    if isinstance(node, dict):
        for key, value in node.items():
            _emit_scalars(value, [*prefix, str(key)], out_lines)
        return

    if isinstance(node, list):
        # Lists are handled separately for architecture-specific generation.
        return

    macro = _to_macro_name(prefix)
    out_lines.append(f"`define {macro} {_sv_literal(node)}")


def generate_sv_defines(input_yaml: str | Path, output_file: str | Path) -> Path:
    """Generate a SystemVerilog defines file from the provided YAML file.

    Args:
        input_yaml: Path to the architecture YAML source file.
        output_file: Path to the output `.svh` file.

    Returns:
        Path to the generated file.
    """
    input_path = Path(input_yaml)
    output_path = Path(output_file)

    with input_path.open("r", encoding="utf-8") as fh:
        data = yaml.safe_load(fh)

    if not isinstance(data, dict):
        raise ValueError("Root YAML node must be a mapping/object.")

    lines: list[str] = []
    lines.append("`ifndef CGRA_ARCH_DEFINES_SVH")
    lines.append("`define CGRA_ARCH_DEFINES_SVH")
    lines.append("")
    lines.append(f"// Auto-generated from: {input_path.as_posix()}")
    lines.append("// Do not edit manually.")
    lines.append("")

    _emit_scalars(data, [], lines)

    lines.append("")
    lines.append("`endif // CGRA_ARCH_DEFINES_SVH")
    lines.append("")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines), encoding="utf-8")
    return output_path


def _build_parser() -> argparse.ArgumentParser:
    """Build command-line parser."""
    parser = argparse.ArgumentParser(
        prog="arch_to_sv_defines",
        description="Generate SystemVerilog `define macros from a YAML architecture file.",
    )
    parser.add_argument(
        "input_yaml",
        nargs="?",
        default=Path("arch/arch_vector_cgra_16x16.yaml"),
        type=Path,
        help="Input YAML file path (default: arch/arch_vector_cgra_16x16.yaml)",
    )
    parser.add_argument(
        "-o",
        "--output",
        default=Path("src/gen/cgra_arch_defines.svh"),
        type=Path,
        metavar="OUTPUT_FILE",
        help="Output SystemVerilog defines file (default: src/gen/cgra_arch_defines.svh)",
    )
    return parser


def main() -> None:
    """CLI entry point."""
    args = _build_parser().parse_args()
    input_yaml: Path = args.input_yaml
    output_file: Path = args.output

    if not input_yaml.exists():
        print(f"Error: Input file not found: {input_yaml}", file=sys.stderr)
        sys.exit(1)
    if not input_yaml.is_file():
        print(f"Error: Input path is not a file: {input_yaml}", file=sys.stderr)
        sys.exit(1)

    try:
        generated = generate_sv_defines(input_yaml, output_file)
    except Exception as exc:  # pragma: no cover
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(1)

    print(f"Created: {generated}")


if __name__ == "__main__":
    main()
