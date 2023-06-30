bootrom_img = bootrom.img bootrom.sv

GCC=riscv64-unknown-elf-gcc
OBJCOPY=riscv64-unknown-elf-objcopy
DTB=rv64_platform.dtb
PYTHON=python3

all: $(bootrom_img)

%.img: %.bin
	dd if=$< of=$@ bs=128

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf: %.S linker.ld $(DTB)
	$(GCC) -Tlinker.ld $< -nostdlib -static -Wl,--no-gc-sections -o $@

#rv64_platform.dts: FORCE
#	$(PYTHON) ${DV_ROOT}/tools/bin/riscvlib.py

%.dtb: %.dts
	dtc -I dts $< -O dtb -o $@

%.sv: %.img
	$(PYTHON) ./gen_rom.py $<

clean:
	rm -f $(bootrom_img) $(DTB)

FORCE:
