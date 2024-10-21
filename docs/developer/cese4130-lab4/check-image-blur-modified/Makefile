include ../utils/rt.mk
BUILDDIR = $(CURDIR)/build

clean:
	rm -f *.o $(BUILDDIR)/test
	rm -f *.txt output_image.png
	make -C ../../../.. TARGETS=my_system MODULES=$(CURDIR) clean

all:
	mkdir -p $(BUILDDIR)
	riscv64-unknown-elf-gcc -o $(BUILDDIR)/test main-check-and-dump.s $(RT_SRCS) $(RT_FLAGS)

gvsoc:
	make -C ../../../.. TARGETS=my_system MODULES=$(CURDIR) build

run:
	../../../../install/bin/gvsoc  --target-dir=$(CURDIR) --target=my_system --work-dir=$(BUILDDIR) --binary=$(BUILDDIR)/test run $(runner_args) > data.txt

image:
	python3 redraw.py