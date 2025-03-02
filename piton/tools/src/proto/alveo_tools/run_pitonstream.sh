
#To build app for basic Ariane design and load it via UART, in separate terminal:
#  $ cd $PITON_ROOT/
#  $ source piton/ariane_setup.sh # Piton tools setup (https://github.com/PrincetonUniversity/openpiton#environment-setup-1)
#  $ pitonstream --board alveou280 --design system --core ariane --x_tiles 1 --y_tiles 1 --port ttyUSB2 --file ./piton/verif/diag/c/riscv/ariane/test.list
#pitonstream compiles sources from test.list by folowing (taken from uart_piton.log or sims.log):
#  $ cd ./build
#  $ sims -sys=manycore -novcs_build -midas_only -midas_args="-DUART_DIV_LATCH=0x36 -DFPGA_HW -DCIOP -DNO_SLAN_INIT_SPC" hello_world.c -ariane -uart_dmw -x_tiles=1 -y_tiles=1

pcienum=`lspci -m -d 10ee:| cut -d' ' -f 1 | cut -d ':' -f 1`

# Here a path to Xilinx PCIe DMA driver binary should be applied
# export PATH=path_to_Xilinx_PCIe_drivers/QDMA/linux-kernel/bin/:$PATH

#PCIe GPIO bus: {Timeout_en(bit4), Bootrom_nOS(bit3), UartBoot_en(bit2), Ariane_rstn(bit1), System_rstn(bit0)}
dma-ctl qdma${pcienum}000 reg write bar 2 0x0 0x0 #Both resets
sleep 2
dma-ctl qdma${pcienum}000 reg write bar 2 0x0 0x1D #Release system reset, we must wait until the memory is filled with 0s
sleep 2
#pitonstream must be running and at this moment, it says "TEST_OUTPUT", and it is waiting for Arine reset to be released 
dma-ctl qdma${pcienum}000 reg write bar 2 0x0 0x1F #Release Ariane's reset
