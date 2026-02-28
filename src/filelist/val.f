# =============================================================================
# val.f – VCS filelist for the CGRA UVM testbench
#
# Compilation order:
#   1. +incdir  declarations for `include resolution inside cgra_uvm_pkg
#   2. UVM package (contains all TB classes via `include)
#   3. Interface
#   4. Assertion bind module
#   5. Dummy DUT (remove when connecting real RTL via rtl.f)
#   6. Testbench top
#
# TODO CGRA: When switching to the real DUT:
#   - Remove src/val/tb/dut_dummy.sv
#   - The RTL sources are already covered by rtl.f (-f src/filelist/rtl.f)
# =============================================================================

# +incdir for `include resolution inside cgra_uvm_pkg.sv
+incdir+src/val/sequences
+incdir+src/val/drivers
+incdir+src/val/monitors
+incdir+src/val/agents
+incdir+src/val/scoreboards
+incdir+src/val/coverage
+incdir+src/val/env
+incdir+src/val/tests

# UVM package (all TB classes in compilation order)
src/val/pkg/cgra_uvm_pkg.sv

# Interface
src/val/tb/intf/cgra_if.sv

# Assertion module
src/val/assertions/cgra_assertions.sv

# Dummy DUT
# TODO CGRA: remove this line once CgraTemplateRTL is used via rtl.f
src/val/tb/dut_dummy.sv

# Testbench top
src/val/tb/cgra_tb_top.sv
