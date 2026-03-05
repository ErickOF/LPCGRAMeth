# =============================================================================
# val.f - VCS filelist for the CGRA UVM testbench
#
# Compilation order:
#   1. +incdir  declarations for `include resolution inside cgra_uvm_pkg
#   2. UVM package (contains all TB classes via `include)
#   3. Interface
#   4. Assertion bind module
#   5. Testbench top
#
# NOTE: RTL sources (including cgra_pkg) must be compiled first via rtl.f:
#         vcs -f src/filelist/rtl.f -f src/filelist/val.f ...
# =============================================================================

# +incdir for `include resolution inside cgra_uvm_pkg.sv and cgra_assertions.sv
+incdir+src/val/sequences
+incdir+src/val/drivers
+incdir+src/val/properties
+incdir+src/val/assertions
+incdir+src/val/monitors
+incdir+src/val/agents
+incdir+src/val/scoreboards
+incdir+src/val/coverage
+incdir+src/val/env
+incdir+src/val/tests

# UVM package (all TB classes in compilation order)
src/val/pkg/cgra_uvm_pkg.sv

# Interface
src/val/intf/cgra_if.sv

# Assertion module
src/val/assertions/cgra_assertions.sv

# Testbench top
src/val/tb/cgra_tb_top.sv
