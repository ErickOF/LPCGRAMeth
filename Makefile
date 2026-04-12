# =============================================================================
# Makefile - CGRA Simulation (Synopsys VCS + DVE/Verdi)
#
# -- RTL-only (syntax / elaboration check, static browser) --------------------
#   make compile_rtl              	compile + elaborate CgraTemplateRTL,
#					             	generate KDB
#   make browse_rtl               	open RTL hierarchy in Verdi (no simulation)
#   make browse_rtl VIEWER=dve    	open RTL hierarchy in DVE
#
# -- RTL + UVM Testbench ------------------------------------------------------
#   make compile                  	compile TB (val.f) - alias for compile_val
#   make compile_val              	compile RTL + UVM TB
#   make sim                      	generate src/gen + compile_val + run
#									(TEST=cgra_basic_test)
#   make sim TEST=<name>          	run a specific UVM test
#   make sim ARCH=<name> MAP=<name> use spec/arch/<name>.yaml and
#									spec/map/<name>.json
#   make sim SEED=<n>             	run with a fixed random seed
#
# -- Waveforms (RTL+TB simulation) --------------------------------------------
#   make waves                    	sim + open viewer (VIEWER=verdi default)
#   make waves VIEWER=dve         	sim + open DVE (VPD)
#   make waves VIEWER=verdi       	sim + open Verdi (FSDB)
#   make waves_dve                	sim + dump VPD + open DVE
#   make waves_verdi              	sim + dump FSDB + open Verdi
#
# -- Inspection (open existing waveform without re-running) -------------------
#   make inspect                  	open last waveform (VIEWER=verdi default)
#   make inspect VIEWER=dve       	open last VPD in DVE
#   make inspect VIEWER=verdi     	open last FSDB in Verdi
#
# -- Misc ---------------------------------------------------------------------
#   make clean                    	remove generated artifacts (including
#									src/gen outputs)
#   make help                     	print this message
# =============================================================================

# -----------------------------------------------------------------------------
# Tool configuration - override from command line or environment as needed
# -----------------------------------------------------------------------------
VCS      ?= $(shell echo $$VCS_HOME)/bin/vcs
DVE      ?= $(shell echo $$DVE_HOME)/bin/dve
VERDI    ?= $(shell echo $$VERDI_HOME)/bin/verdi
SEED     ?= 1
TEST     ?= cgra_basic_test
UVM_HOME ?= $(shell echo $$UVM_HOME)
# Default waveform viewer: verdi | dve
VIEWER   ?= verdi
PYTHON   ?= python

# Specification-driven generation inputs
ARCH_DIR ?= spec/arch
MAP_DIR  ?= $(if $(wildcard spec/map),spec/map,spec/maps)
ARCH     ?= default
MAP      ?= default

# ARCH/MAP are treated as names only; full paths are inferred automatically.
# This accepts values like "foo", "foo.yaml", or "dir/foo.yaml" and normalizes
# to "$(ARCH_DIR)/foo.yaml". Same rule applies to MAP with .json.
ARCH_NAME := $(basename $(notdir $(ARCH)))
MAP_NAME  := $(basename $(notdir $(MAP)))
ARCH_FILE := $(ARCH_DIR)/$(ARCH_NAME).yaml
MAP_FILE  := $(MAP_DIR)/$(MAP_NAME).json

# -----------------------------------------------------------------------------
# Directories
# -----------------------------------------------------------------------------
SIM_DIR      := sim_out
LOG_DIR      := $(SIM_DIR)/logs
GEN_DIR      := src/gen
FILELIST_DIR := src/filelist
RTL_FILELIST := $(FILELIST_DIR)/rtl.f
VAL_FILELIST := $(FILELIST_DIR)/val.f
TOP_RTL_FILE := src/rtl/top/CgraTemplateRTL.sv
CGRA_IF_FILE := src/val/intf/cgra_if.sv

# Waveform output paths
VPD_FILE          := $(SIM_DIR)/wave.vpd
FSDB_FILE         := $(SIM_DIR)/wave.fsdb
ARCH_DEFINES_FILE := $(GEN_DIR)/cgra_arch_defines.svh
IMEM_FILE         := $(GEN_DIR)/imem.hex
OPCODE_JSON_FILE  := spec/opcodes.json
OPCODE_SVH_FILE   := $(GEN_DIR)/cgra_opcodes.svh

# KDB directories produced by VCS -kdb (name follows the -o output binary)
RTL_KDB_DIR := $(SIM_DIR)/simv_rtl.kdb
VAL_KDB_DIR := $(SIM_DIR)/simv.kdb

# -----------------------------------------------------------------------------
# Common VCS flags shared by both RTL-only and RTL+TB compilations
# -----------------------------------------------------------------------------
VCS_COMMON := \
    -full64            \
    -sverilog          \
    -timescale=1ns/1ps \
    -debug_access+all  \
    -kdb

# -----------------------------------------------------------------------------
# RTL-only compilation flags  (no UVM, no TB)
# -----------------------------------------------------------------------------
RTL_FLAGS := \
    $(VCS_COMMON)                 \
    -f src/filelist/rtl.f         \
    -l $(LOG_DIR)/compile_rtl.log \
    -o $(SIM_DIR)/simv_rtl

# -----------------------------------------------------------------------------
# RTL + UVM TB compilation flags
# -----------------------------------------------------------------------------
VAL_FLAGS := \
    $(VCS_COMMON)                 \
    -ntb_opts uvm-1.2             \
    +incdir+$(UVM_HOME)/src       \
    $(UVM_HOME)/src/uvm_pkg.sv    \
    -f src/filelist/rtl.f         \
    -f src/filelist/val.f         \
    +define+UVM_NO_DPI            \
    -l $(LOG_DIR)/compile_val.log \
    -o $(SIM_DIR)/simv

# -----------------------------------------------------------------------------
# Simulation flags (UVM)
# -----------------------------------------------------------------------------
SIM_FLAGS := \
    +UVM_TESTNAME=$(TEST)     \
    +UVM_VERBOSITY=UVM_MEDIUM \
    +ntb_random_seed=$(SEED)  \
    -l $(LOG_DIR)/sim_$(TEST)_$(SEED).log

# -----------------------------------------------------------------------------
# Targets
# -----------------------------------------------------------------------------
.PHONY: all validate_inputs gen_opcodes gen_from_spec gen_cgra_if \
		gen_filelists compile_rtl browse_rtl compile compile_val sim waves \
		waves_dve waves_verdi inspect inspect_dve inspect_verdi clean help

all: sim

$(SIM_DIR) $(LOG_DIR) $(GEN_DIR) $(FILELIST_DIR):
	mkdir -p $@

# -----------------------------------------------------------------------------
# Filelist auto-generation
# -----------------------------------------------------------------------------
gen_filelists: gen_cgra_if | $(FILELIST_DIR)
	@echo "[INFO] Regenerating filelists: $(RTL_FILELIST), $(VAL_FILELIST)"
	@{ \
	  echo "# ============================================================================="; \
	  echo "# rtl.f - AUTO-GENERATED by Makefile target 'gen_filelists'"; \
	  echo "# Compilation order:"; \
	  echo "# - packages"; \
	  echo "# - modules"; \
	  echo "# - top"; \
	  echo "# ============================================================================="; \
	  echo; \
	  echo "# ---------------------------------------------------------------------------"; \
	  echo "# Packages"; \
	  echo "# ---------------------------------------------------------------------------"; \
	  if [ -f src/rtl/pkg/cgra_pkg.sv ]; then echo "src/rtl/pkg/cgra_pkg.sv"; fi; \
	  echo; \
	  echo "# ---------------------------------------------------------------------------"; \
	  echo "# Modules (alphabetical)"; \
	  echo "# ---------------------------------------------------------------------------"; \
	  if [ -d src/rtl/modules ]; then find src/rtl/modules -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	  echo; \
	  echo "# ---------------------------------------------------------------------------"; \
	  echo "# RTL top"; \
	  echo "# ---------------------------------------------------------------------------"; \
	  if [ -d src/rtl/top ]; then find src/rtl/top -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	} > $(RTL_FILELIST)
	@{ \
	  echo "# ============================================================================="; \
	  echo "# val.f - AUTO-GENERATED by Makefile target 'gen_filelists'"; \
	  echo "# ============================================================================="; \
	  echo; \
	  echo '# +incdir for `include resolution'; \
	  if [ -d src/val ]; then \
	    find src/val -mindepth 1 -maxdepth 1 -type d ! -name pkg ! -name intf ! -name assertions ! -name tb | sort | sed 's#^#+incdir+#'; \
	  fi; \
	  echo "+incdir+src/gen"; \
	  echo; \
	  echo "# UVM package(s)"; \
	  if [ -d src/val/pkg ]; then find src/val/pkg -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	  echo; \
	  echo "# Interface(s)"; \
	  if [ -d src/val/intf ]; then find src/val/intf -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	  echo; \
	  echo "# Assertion module(s)"; \
	  if [ -d src/val/assertions ]; then find src/val/assertions -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	  echo; \
	  echo "# Testbench top(s)"; \
	  if [ -d src/val/tb ]; then find src/val/tb -maxdepth 1 -type f -name '*.sv' | sort; fi; \
	} > $(VAL_FILELIST)

# -----------------------------------------------------------------------------
# Interface auto-generation
# -----------------------------------------------------------------------------
gen_cgra_if: $(TOP_RTL_FILE)
	@echo "[INFO] Regenerating interface: $(CGRA_IF_FILE)"
	$(PYTHON) scripts/gen_cgra_if.py --top $(TOP_RTL_FILE) -o $(CGRA_IF_FILE)

# -----------------------------------------------------------------------------
# Opcode auto-generation
# -----------------------------------------------------------------------------
gen_opcodes: $(wildcard src/rtl/modules/*.sv) $(TOP_RTL_FILE) | $(GEN_DIR)
	@echo "[INFO] Regenerating opcodes: $(OPCODE_JSON_FILE) + $(OPCODE_SVH_FILE)"
	$(PYTHON) scripts/rtl_to_opcodes.py --rtl-dir src/rtl \
		-o $(OPCODE_JSON_FILE) --svh $(OPCODE_SVH_FILE)

# -----------------------------------------------------------------------------
# Spec generation targets (ARCH + MAP)
# -----------------------------------------------------------------------------
validate_inputs:
	@test -f $(ARCH_FILE) \
		|| (echo "[ERROR] ARCH file not found: $(ARCH_FILE)" && exit 1)
	@test -f $(MAP_FILE) \
		|| (echo "[ERROR] MAP file not found: $(MAP_FILE)" && exit 1)

gen_from_spec: validate_inputs gen_opcodes | $(GEN_DIR)
	$(PYTHON) scripts/arch_to_sv_defines.py $(ARCH_FILE) -o $(ARCH_DEFINES_FILE)
	$(PYTHON) scripts/json_to_imem.py $(MAP_FILE) -o $(IMEM_FILE) \
		--packet-dump $(GEN_DIR)/packet_stream.hex \
		--opcodes $(OPCODE_JSON_FILE) \
		--uvm-packet-dump $(GEN_DIR)/uvm_packet_stream.hex

# -----------------------------------------------------------------------------
# RTL-only targets
# -----------------------------------------------------------------------------
## Compile + elaborate RTL; -kdb (in VCS_COMMON) produces the KDB for Verdi.
compile_rtl: gen_filelists gen_cgra_if gen_opcodes | $(SIM_DIR) $(LOG_DIR)
	$(VCS) $(RTL_FLAGS) -top CgraTemplateRTL

## Open RTL hierarchy in Verdi (static browser, no simulation required)
## Runs compile_rtl first to ensure the KDB is up to date.
## Verdi flags: -kdb enables KDB mode; -ssdir points to the pre-built KDB.
browse_rtl: compile_rtl
ifeq ($(VIEWER),verdi)
	$(VERDI) -kdb -ssdir $(RTL_KDB_DIR) \
	         -top CgraTemplateRTL       \
	         -nologo &
else
	$(DVE) -vpd $(VPD_FILE) -full64 & \
	  || echo "[INFO] DVE static browse: compile with 'waves_dve'."
endif

# -----------------------------------------------------------------------------
# RTL + UVM TB targets
# -----------------------------------------------------------------------------
## Compile RTL + UVM TB (alias kept for backward compatibility)
compile: compile_val

compile_val: gen_filelists gen_cgra_if gen_opcodes | $(SIM_DIR) $(LOG_DIR)
	$(VCS) $(VAL_FLAGS) -top cgra_tb_top

## Compile + run UVM simulation
sim: gen_from_spec compile_val
	$(SIM_DIR)/simv $(SIM_FLAGS)

# -----------------------------------------------------------------------------
# Waveform targets  (RTL + TB simulation)
# -----------------------------------------------------------------------------
## Generic dispatcher (respects VIEWER variable)
waves:
	$(MAKE) waves_$(VIEWER)

## Simulate, dump VPD, then open DVE
waves_dve: gen_from_spec compile_val
	$(SIM_DIR)/simv $(SIM_FLAGS) \
	    +vpdfile+$(VPD_FILE)     \
	    +vpdon
	$(DVE) -vpd $(VPD_FILE) -full64 &

## Simulate, dump FSDB, then open Verdi
## -kdb / -debug_access+all already set at compile time (VAL_FLAGS).
waves_verdi: gen_from_spec compile_val
	$(SIM_DIR)/simv $(SIM_FLAGS)    \
	    +fsdbDumpvars+0+cgra_tb_top \
	    +fsdbDumpSVA
	$(VERDI) -ssf $(FSDB_FILE) -nologo &

# -----------------------------------------------------------------------------
# Inspection targets  (open last waveform without re-running simulation)
# -----------------------------------------------------------------------------
## Generic dispatcher
inspect:
	$(MAKE) inspect_$(VIEWER)

inspect_dve:
	@test -f $(VPD_FILE) \
		|| (echo "[ERROR] No VPD found: run 'make waves_dve'." && exit 1)
	$(DVE) -vpd $(VPD_FILE) -full64 &

inspect_verdi:
	@test -f $(FSDB_FILE) \
		|| (echo "[ERROR] No FSDB found: run 'make waves_verdi'." && exit 1)
	$(VERDI) -ssf $(FSDB_FILE) -nologo &

# -----------------------------------------------------------------------------
# Housekeeping
# -----------------------------------------------------------------------------
clean:
	rm -rf $(SIM_DIR) csrc vc_hdrs.h ucli.key *.log DVEfiles novas.* verdiLog \
	       $(ARCH_DEFINES_FILE) $(IMEM_FILE) $(OPCODE_SVH_FILE) \
		   $(OPCODE_JSON_FILE) $(GEN_DIR)/uvm_packet_stream.hex

help:
	@echo ""
	@echo "  -- RTL only -----------------------------------------------------"
	@echo "  make compile_rtl          	 	Compile RTL (syntax/elab check)"
	@echo "  make browse_rtl           	 	Open RTL in Verdi static browser"
	@echo "  make browse_rtl VIEWER=dve	 	Open RTL in DVE"
	@echo ""
	@echo "  -- RTL + UVM TB -------------------------------------------------"
	@echo "  make compile                	Compile RTL + UVM TB"
	@echo "  make sim ARCH=<arch> MAP=<map> Generate src/gen + compile_val + run"
	@echo "                                 (name-only; paths are inferred)"
	@echo "  make sim                    	Compile_val + run (TEST=$(TEST), ARCH=$(ARCH), MAP=$(MAP))"
	@echo "  make sim TEST=<name>        	Run a specific UVM test"
	@echo "  make sim ARCH=<name>        	Uses: $(ARCH_DIR)/<name>.yaml"
	@echo "  make sim MAP=<name>         	Uses: $(MAP_DIR)/<name>.json"
	@echo "  make sim SEED=<n>           	Use a fixed random seed"
	@echo ""
	@echo "  -- Waveforms ----------------------------------------------------"
	@echo "  make waves                  	Sim + open viewer (VIEWER=$(VIEWER))"
	@echo "  make waves VIEWER=dve       	Sim + open DVE (VPD)"
	@echo "  make waves VIEWER=verdi     	Sim + open Verdi (FSDB)"
	@echo "  make waves_dve              	Sim + dump VPD + open DVE"
	@echo "  make waves_verdi            	Sim + dump FSDB + open Verdi"
	@echo ""
	@echo "  -- Inspection (no re-run) ---------------------------------------"
	@echo "  make inspect                	Open last wave (VIEWER=$(VIEWER))"
	@echo "  make inspect VIEWER=dve     	Open last VPD in DVE"
	@echo "  make inspect VIEWER=verdi   	Open last FSDB in Verdi"
	@echo ""
	@echo "  make clean                  	Remove all generated files"
	@echo ""
	@echo "  make waves_dve         	 	Sim + open DVE directly"
	@echo "  make waves_verdi       	 	Sim + open Verdi directly"
	@echo "  make clean             	 	Remove all generated files"
	@echo ""
