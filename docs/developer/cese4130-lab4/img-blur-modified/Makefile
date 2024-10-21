include ../utils/rt.mk
BUILDDIR = $(CURDIR)/build

clean:
	rm -f *.o $(BUILDDIR)/test
	rm -f *.log
	make -C ../../../.. TARGETS=my_system MODULES=$(CURDIR) clean

all:
	mkdir -p $(BUILDDIR)
	riscv64-unknown-elf-gcc -o $(BUILDDIR)/test main.s $(RT_SRCS) $(RT_FLAGS)

gvsoc:
	make -C ../../../.. TARGETS=my_system MODULES=$(CURDIR) build

run:
	../../../../install/bin/gvsoc  --target-dir=$(CURDIR) --target=my_system --work-dir=$(BUILDDIR) --binary=$(BUILDDIR)/test run $(runner_args)

count-cycles:
	../../../../install/bin/gvsoc  --target-dir=$(CURDIR) --target=my_system --work-dir=$(BUILDDIR) --binary=$(BUILDDIR)/test run --trace=host/insn > out.log
	python3 process.py