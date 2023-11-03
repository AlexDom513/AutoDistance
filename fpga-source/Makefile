GHDL = ghdl
GHDL_FLAGS = --std=08
GTKWAVE = gtkwave
GHW = ghw
SOURCES = PulseController.vhd PulseController_tb.vhd
TOP_ENTITY = PulseController_tb
WORKSPACE_FILE = wave.gtkw
GHW_FILE = pulse.ghw
SIM_TIME = 200ms

all: build sim gtk

build:
	$(GHDL) -a $(GHDL_FLAGS) $(SOURCES)

sim:
	$(GHDL) -e $(GHDL_FLAGS) $(TOP_ENTITY)
	$(GHDL) -r $(GHDL_FLAGS) $(TOP_ENTITY) --wave=$(GHW_FILE) --stop-time=$(SIM_TIME)

gtk:
	$(GTKWAVE) $(WORKSPACE_FILE)

clean:
	rm -f work-obj08.cf $(TOP_ENTITY) $(GHW_FILE)

.PHONY: all build sim gtk clean