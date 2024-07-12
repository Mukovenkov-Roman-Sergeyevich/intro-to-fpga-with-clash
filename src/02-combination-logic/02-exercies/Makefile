IVERILOG ?= iverilog
VVP ?= vvp
SOURCES = logical_operations/nimplication.sv logical_operations/implication.sv logical_operations/pierce.sv logical_operations/sheffer.sv testbenches/testbench.sv
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
