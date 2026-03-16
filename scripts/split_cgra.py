"""
split_cgra.py

Parses a monolithic SystemVerilog/Verilog CGRA source file and splits it
into individual module files and a shared package file.

Given a single flat file (e.g. ``cgra.v``), this script:

1. Extracts all ``typedef struct`` and ``typedef enum`` definitions and
   writes them into ``<output_dir>/src/rtl/pkg/cgra_pkg.sv`` as a SystemVerilog package.
2. Extracts every ``module ... endmodule`` block and writes each one to a
   separate file under ``<output_dir>/src/rtl/modules/<ModuleName>.sv``, automatically
   inserting an ``import cgra_pkg::*;`` statement after the module header.

Usage::

    python split_cgra.py [input_file] [--output-dir OUTPUT_DIR]

The input file defaults to ``cgra.v`` in the current working directory when
no argument is given.

Requires Python 3.14+.
"""
import argparse
import re
import sys
from pathlib import Path


def split_systemverilog(input_file: str | Path, output_dir: str | Path = "src/rtl") -> None:
    """Split a monolithic SystemVerilog file into a package and per-module files.

    Reads *input_file*, extracts packed ``typedef struct``/``typedef enum``
    definitions into ``<output_dir>/pkg/cgra_pkg.sv``, then extracts each
    ``module ... endmodule`` block into its own file under
    ``<output_dir>/modules/``.  An ``import cgra_pkg::*;`` line is inserted
    immediately after the opening module declaration in every generated file.

    Args:
        input_file (str | Path): Path to the input ``.v`` or ``.sv`` file to parse.
        output_dir (str | Path): Root directory for generated output files.
            Defaults to ``src/rtl``.

    Returns:
        None

    Side Effects:
        Creates or overwrites ``<output_dir>/src/rtl/pkg/cgra_pkg.sv`` and one
        ``<output_dir>/src/rtl/modules/<ModuleName>.sv`` file per module found.
        Prints a confirmation message for each file written.
    """
    src = Path(input_file).read_text(encoding="utf-8")
    out = Path(output_dir)

    # 1. Extract all struct and enum type definitions
    # Match typedef struct / typedef enum blocks up to their closing };
    type_definitions: list[str] = re.findall(
        r"(typedef\s+(?:struct|enum)\s+packed\s*\{.*?\}(?:\s+\w+)?\s*;)",
        src,
        re.DOTALL,
    )

    # Build and write the cgra_pkg.sv package file
    pkg_body = "\n\n".join(type_definitions)
    pkg_content = f"package cgra_pkg;\n\n{pkg_body}\n\nendpackage\n"

    pkg_path = out / "src" / "rtl" / "pkg" / "cgra_pkg.sv"
    pkg_path.parent.mkdir(parents=True, exist_ok=True)
    pkg_path.write_text(pkg_content, encoding="utf-8")
    print(f"Created: {pkg_path}")

    # 2. Extract and split individual modules
    # This regex matches from 'module' to 'endmodule'
    # The module name is captured in group 2
    module_pattern = re.compile(r"(module\s+(\w+).*?endmodule)", re.DOTALL)

    for mod_content, mod_name in module_pattern.findall(src):
        new_lines: list[str] = []
        import_added = False

        for line in mod_content.splitlines():
            new_lines.append(line)
            # Insert the import statement after the module declaration line
            # Match the first occurrence of the module name (followed by parameters or ports)
            if not import_added and f"module {mod_name}" in line:
                new_lines.append("import cgra_pkg::*;")
                import_added = True

        mod_path = out / "src" / "rtl" / "modules" / f"{mod_name}.sv"
        mod_path.parent.mkdir(parents=True, exist_ok=True)
        mod_path.write_text("\n".join(new_lines), encoding="utf-8")
        print(f"Created: {mod_path}")


def _build_parser() -> argparse.ArgumentParser:
    """Build and return the argument parser for the CLI.

    Returns:
        argparse.ArgumentParser: Configured parser with an optional
        ``input_file`` positional argument.
    """
    parser = argparse.ArgumentParser(
        prog="split_cgra",
        description="Split a monolithic CGRA SystemVerilog file into per-module files.",
    )
    parser.add_argument(
        "input_file",
        nargs="?",
        default="cgra.v",
        type=Path,
        help="Path to the input .v / .sv file (default: cgra.v)",
    )
    parser.add_argument(
        "-o", "--output-dir",
        default=".",
        type=Path,
        metavar="OUTPUT_DIR",
        help="Root output directory; files are written under <OUTPUT_DIR>/src/rtl/ (default: .)",
    )

    return parser


def main() -> None:
    """CLI entry point: parse arguments and dispatch to :func:`split_systemverilog`.

    Uses a structural ``match`` statement (Python 3.10+) to handle the
    different filesystem states of the supplied path cleanly.
    """
    args = _build_parser().parse_args()
    input_path: Path = args.input_file
    output_dir: Path = args.output_dir

    # Structural pattern matching on the filesystem state of the input path
    match (input_path.exists(), input_path.is_file()):
        case (True, True):
            split_systemverilog(input_path, output_dir)
        case (True, False):
            print(f"Error: '{input_path}' is not a regular file.", file=sys.stderr)
            sys.exit(1)
        case _:
            print(f"Error: File '{input_path}' not found.", file=sys.stderr)
            sys.exit(1)


if __name__ == "__main__":
    main()
