# =============================================================================
# Makefile – CGRA Simulation (Synopsys VCS + DVE/Verdi)
#
# -- RTL-only (syntax / elaboration check, static browser) --------------------
#   make compile_rtl              compile CgraTemplateRTL from rtl.f
#   make elab_rtl                 elaborate RTL and generate KDB
#   make browse_rtl               open RTL hierarchy in Verdi (no simulation)
#   make browse_rtl VIEWER=dve    open RTL hierarchy in DVE
#
# -- RTL + UVM Testbench ------------------------------------------------------
#   make compile                  compile TB (val.f) – alias for compile_val
#   make compile_val              compile RTL + UVM TB
#   make sim                      compile_val + run (TEST=cgra_smoke_test)
#   make sim TEST=<name>          run a specific UVM test
#   make sim SEED=<n>             run with a fixed random seed
#
# -- Waveforms (RTL+TB simulation) --------------------------------------------
#   make waves                    sim + open viewer (VIEWER=verdi default)
#   make waves VIEWER=dve         sim + open DVE (VPD)
#   make waves VIEWER=verdi       sim + open Verdi (FSDB)
#   make waves_dve                sim + dump VPD + open DVE
#   make waves_verdi              sim + dump FSDB + open Verdi
#
# -- Inspection (open existing waveform without re-running) -------------------
#   make inspect                  open last waveform (VIEWER=verdi default)
#   make inspect VIEWER=dve       open last VPD in DVE
#   make inspect VIEWER=verdi     open last FSDB in Verdi
#
# -- Misc ---------------------------------------------------------------------
#   make clean                    remove all generated artifacts
#   make help                     print this message
# =============================================================================

# -----------------------------------------------------------------------------
# Tool configuration – override from command line or environment as needed
# -----------------------------------------------------------------------------
VCS      ?= $(shell echo $$VCS_HOME)/bin/vcs
DVE      ?= $(shell echo $$DVE_HOME)/bin/dve
VERDI    ?= $(shell echo $$VERDI_HOME)/bin/verdi
SEED     ?= 1
TEST     ?= cgra_smoke_test
UVM_HOME ?= $(shell echo $$UVM_HOME)
# Default waveform viewer: verdi | dve
VIEWER   ?= verdi

# -----------------------------------------------------------------------------
# Directories
# -----------------------------------------------------------------------------
SIM_DIR := sim_out
LOG_DIR := $(SIM_DIR)/logs

# Waveform output paths
VPD_FILE  := $(SIM_DIR)/wave.vpd
FSDB_FILE := $(SIM_DIR)/wave.fsdb

# KDB directory (used by Verdi for static RTL browsing)
KDB_DIR := $(SIM_DIR)/simv.kdb

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
# TODO CGRA: rtl.f must be up-to-date (run: make rtl.f update if needed)
# -----------------------------------------------------------------------------
RTL_FLAGS := \
    $(VCS_COMMON)                 \
    -f src/filelist/rtl.f         \
    -l $(LOG_DIR)/compile_rtl.log \
    -o $(SIM_DIR)/simv_rtl

# -----------------------------------------------------------------------------
# RTL + UVM TB compilation flags
# TODO CGRA: remove dut_dummy.sv from val.f once CgraTemplateRTL is the DUT
# TODO CGRA: add  -f src/filelist/rtl.f  here once real DUT is wired in
# -----------------------------------------------------------------------------
VAL_FLAGS := \
    $(VCS_COMMON)                 \
    -ntb_opts uvm-1.2             \
    +incdir+$(UVM_HOME)/src       \
    $(UVM_HOME)/src/uvm_pkg.sv    \
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
.PHONY: all \
        compile_rtl elab_rtl browse_rtl   \
        compile compile_val sim           \
        waves waves_dve waves_verdi       \
        inspect inspect_dve inspect_verdi \
        clean help

all: sim

$(SIM_DIR) $(LOG_DIR):
	mkdir -p $@

# -----------------------------------------------------------------------------
# RTL-only targets
# -----------------------------------------------------------------------------
## Compile RTL sources for syntax / elaboration checking
compile_rtl: | $(SIM_DIR) $(LOG_DIR)
	$(VCS) $(RTL_FLAGS) -top CgraTemplateRTL

## Elaborate RTL and write KDB (needed for Verdi static browse)
elab_rtl: | $(SIM_DIR) $(LOG_DIR)
	$(VCS) $(RTL_FLAGS) -top CgraTemplateRTL -elaborate

## Open RTL hierarchy in Verdi (static browser, no simulation required)
## Uses the KDB generated by elab_rtl; falls back to source files if absent.
browse_rtl: elab_rtl
ifeq ($(VIEWER),verdi)
	$(VERDI) -f src/filelist/rtl.f \
	         -top CgraTemplateRTL  \
	         -kdb $(KDB_DIR)       \
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

compile_val: | $(SIM_DIR) $(LOG_DIR)
	$(VCS) $(VAL_FLAGS) -top cgra_tb_top

## Compile + run UVM simulation
sim: compile_val
	$(SIM_DIR)/simv $(SIM_FLAGS)

# -----------------------------------------------------------------------------
# Waveform targets  (RTL + TB simulation)
# -----------------------------------------------------------------------------
## Generic dispatcher (respects VIEWER variable)
waves:
	$(MAKE) waves_$(VIEWER)

## Simulate, dump VPD, then open DVE
waves_dve: compile_val
	$(SIM_DIR)/simv $(SIM_FLAGS) \
	    +vpdfile+$(VPD_FILE)     \
	    +vpdon
	$(DVE) -vpd $(VPD_FILE) -full64 &

## Simulate, dump FSDB, then open Verdi
## -kdb / -debug_access+all already set at compile time (VAL_FLAGS).
waves_verdi: compile_val
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
	rm -rf $(SIM_DIR) csrc vc_hdrs.h ucli.key *.log DVEfiles novas.* verdiLog

help:
	@echo ""
	@echo "  -- RTL only -----------------------------------------------------"
	@echo "  make compile_rtl          	 Compile RTL (syntax/elab check)"
	@echo "  make elab_rtl             	 Elaborate RTL and generate KDB"
	@echo "  make browse_rtl           	 Open RTL in Verdi static browser"
	@echo "  make browse_rtl VIEWER=dve	 Open RTL in DVE"
	@echo ""
	@echo "  -- RTL + UVM TB -------------------------------------------------"
	@echo "  make compile                Compile RTL + UVM TB"
	@echo "  make sim                    Compile + run (TEST=$(TEST))"
	@echo "  make sim TEST=<name>        Run a specific UVM test"
	@echo "  make sim SEED=<n>           Use a fixed random seed"
	@echo ""
	@echo "  -- Waveforms ----------------------------------------------------"
	@echo "  make waves                  Sim + open viewer (VIEWER=$(VIEWER))"
	@echo "  make waves VIEWER=dve       Sim + open DVE (VPD)"
	@echo "  make waves VIEWER=verdi     Sim + open Verdi (FSDB)"
	@echo "  make waves_dve              Sim + dump VPD + open DVE"
	@echo "  make waves_verdi            Sim + dump FSDB + open Verdi"
	@echo ""
	@echo "  -- Inspection (no re-run) ---------------------------------------"
	@echo "  make inspect                Open last wave (VIEWER=$(VIEWER))"
	@echo "  make inspect VIEWER=dve     Open last VPD in DVE"
	@echo "  make inspect VIEWER=verdi   Open last FSDB in Verdi"
	@echo ""
	@echo "  make clean                  Remove all generated files"
	@echo ""
	@echo "  make waves_dve         	 Sim + open DVE directly"
	@echo "  make waves_verdi       	 Sim + open Verdi directly"
	@echo "  make clean             	 Remove all generated files"
	@echo ""
