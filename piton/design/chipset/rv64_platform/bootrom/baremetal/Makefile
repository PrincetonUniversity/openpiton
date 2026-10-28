bootrom_img = bootrom.img bootrom.sv

GCC=riscv64-unknown-elf-gcc
GCC_VERSION_GTEQ_12 = $(shell expr `$(GCC) -dumpversion | cut -f1 -d.` \>= 12)
OBJCOPY=riscv64-unknown-elf-objcopy
DTB=rv64_platform.dtb
PYTHON=python3
CFLAGS=-mabi=lp64d -Tlinker.ld -nostdlib -static -Wl,--no-gc-sections

ifeq "$(GCC_VERSION_GTEQ_12)" "1"
    CFLAGS += -march=rv64imafd_zicsr
else
	CFLAGS += -march=rv64imafd
endif

all: $(bootrom_img)

%.img: %.bin
	dd if=$< of=$@ bs=128

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf: %.S linker.ld $(DTB)
	$(GCC) $(CFLAGS) $< -o $@

rv64_platform.dts: FORCE
	$(PYTHON) ${DV_ROOT}/tools/bin/riscvlib.py

%.dtb: %.dts
	dtc -I dts $< -O dtb -o $@

%.sv: %.img
	$(PYTHON) ./gen_rom.py $<

clean:
	rm -f $(bootrom_img) $(DTB)

FORCE:
