
# Define the executables and flags
GHDL = ghdl
GHDL_FLAGS = --std=08
GTKWAVE = gtkwave

# Define source files
SOURCES = PulseController.vhd PulseController_tb.vhd

# Define the top-level entity for simulation
TOP_ENTITY = PulseController_tb

# Name of the saved GTKWave workspace file
WORKSPACE_FILE = wave.gtkw

# Define the VCD output file
VCD_FILE = pulse.vcd
SIM_TIME = 1ms

all: build sim

build:
	$(GHDL) -a $(GHDL_FLAGS) $(SOURCES)

sim:
	$(GHDL) -e $(GHDL_FLAGS) $(TOP_ENTITY)
	$(GHDL) -r $(GHDL_FLAGS) $(TOP_ENTITY) --vcd=$(VCD_FILE)
	$(TOP_ENTITY)--stop-time=$(SIM_TIME)

gtk:
	$(GTKWAVE) $(WORKSPACE_FILE)

clean:
	rm -f work-obj08.cf $(TOP_ENTITY) $(VCD_FILE)

.PHONY: all build sim gtk clean