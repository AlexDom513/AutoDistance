GHDL 						= ghdl
GHDL_FLAGS 			= --std=08
GTKWAVE 				= gtkwave
GHW 						= ghw

SOURCE_DIR 			= source/
SOURCES 				= $(SOURCE_DIR)MovingAvg.vhd $(SOURCE_DIR)PulseController.vhd $(SOURCE_DIR)PidController.vhd $(SOURCE_DIR)StepperController.vhd $(SOURCE_DIR)autoDistance_top.vhd
SIM_DIR					= simulation/
SIM_SOURCES 		= $(SIM_DIR)PulseController_tb.vhd $(SIM_DIR)PidController_tb.vhd $(SIM_DIR)StepperController_tb.vhd

SELECTION  			= PidController
TOP_ENTITY			= $(SELECTION)_tb
WORKSPACE_FILE  = $(SIM_DIR)$(SELECTION).gtkw
GHW_FILE 				= $(SIM_DIR)$(SELECTION).ghw
SIM_TIME 				= 8ms

all: build sim gtk

build:
	$(GHDL) -a $(GHDL_FLAGS) $(SOURCES)
	$(GHDL) -a $(GHDL_FLAGS) $(SIM_SOURCES)

sim:
	$(GHDL) -e $(GHDL_FLAGS) $(TOP_ENTITY)
	$(GHDL) -r $(GHDL_FLAGS) $(TOP_ENTITY) --wave=$(GHW_FILE) --stop-time=$(SIM_TIME)

gtk:
	$(GTKWAVE) $(WORKSPACE_FILE)

.PHONY: all build sim gtk