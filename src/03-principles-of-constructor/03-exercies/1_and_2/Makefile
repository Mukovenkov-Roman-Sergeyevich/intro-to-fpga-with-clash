IVERILOG ?= iverilog
VVP ?= vvp
SOURCES = \
    pierce_operations/pierce_and.sv \
    pierce_operations/pierce_implication.sv \
    pierce_operations/pierce_not.sv \
    pierce_operations/pierce_or.sv \
    sheffer_operations/sheffer_and.sv \
    sheffer_operations/sheffer_implication.sv \
    sheffer_operations/sheffer_not.sv \
    sheffer_operations/sheffer_or.sv \
    testbenches/testbench.sv \
    ../../../02-combination-logic/02-exercies/logical_operations/pierce.sv \
    ../../../02-combination-logic/02-exercies/logical_operations/sheffer.sv
TOPMODULE = exercise_testbench
IVERILOG_FLAGS = -g2012

all: tests
build:
	mkdir -p build
	$(IVERILOG) $(IVERILOG_FLAGS) $(SOURCES) -s $(TOPMODULE) -o build/$(TOPMODULE)

tests: build
	$(VVP) build/$(TOPMODULE)

clean:
	$(RM) -R build

.PHONY: tests
.PHONY: clean
.PHONY: build
