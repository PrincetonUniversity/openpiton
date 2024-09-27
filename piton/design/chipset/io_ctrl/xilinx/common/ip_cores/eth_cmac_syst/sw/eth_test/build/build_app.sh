# The script to build test Ethernet application, last updated for Vitis/Vivado-2023.2

rm ./eth_test

echo ""
echo "----- Extracting hw definitions from BD tcl script to create C-header file"
# vivado -mode batch -nolog -nojournal -notrace -source ./xparams_eth.tcl
tclsh ./xparams_eth.tcl
# extraction of SOC address definitions from devices.xml, please comment if SOC is different from ACME(meep_openpiton)
tclsh ./xparams_soc.tcl

# Taking some DMA driver sources to edit and for reference
cp $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma_g.c ./
cp $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma_bdring.c ../src/syst_hw/
sed -i 's|#define XPAR_AXIDMA_0_INCLUDE_SG|//#define XPAR_AXIDMA_0_INCLUDE_SG|g' ./xaxidma_g.c

echo "----- Checking if hw is implemented under MEEP_SHELL:"
# SG_MEM_CACHED and TXRX_MEM_CACHED defines are suitable only for Ariane-based design
# DEF_DMA_MEM_HBM="-DDMA_MEM_HBM -DSG_MEM_CACHED -DTXRX_MEM_CACHED"
if grep "ETHERNET,yes.*hbm" ../../../../../../../../../../../meep_shell/accelerator_def.csv ||
   grep "ETHERNET,yes.*ddr" ../../../../../../../../../../../meep_shell/accelerator_def.csv
then
  echo "----- Eth DMA memory is HBM-based in hw design, setting its addresses accordingly"
  DEF_DMA_MEM_HBM="-DDMA_MEM_HBM"
elif grep "AURORA,yes.*hbm" ../../../../../../../../../../../meep_shell/accelerator_def.csv ||
     grep "AURORA,yes.*ddr" ../../../../../../../../../../../meep_shell/accelerator_def.csv
then
  echo "----- Aurora DMA memory is HBM-based in hw design, setting its addresses accordingly"
  DEF_DMA_MEM_HBM="-DAURORA -DDMA_MEM_HBM"
else
  echo "----- Eth/Aurora DMA memory is SRAM-based in hw design, setting its addresses accordingly"
  DEF_DMA_MEM_HBM=""
fi
echo ""

# -DDEBUG for enabling Xilinx debug output
riscv64-unknown-linux-gnu-gcc -Wall -Og -D__aarch64__ $DEF_DMA_MEM_HBM -o ./eth_test \
                              -I./ \
                              -I../src/syst_hw \
                              -I$XILINX_VITIS/data/embeddedsw/lib/sw_apps/imgsel/misc \
                              -I$XILINX_VITIS/data/embeddedsw/lib/bsp/standalone_v9_1/src/common \
                              -I$XILINX_VITIS/data/embeddedsw/lib/bsp/standalone_v9_1/src/arm/cortexa9 \
                              -I$XILINX_VITIS/data/embeddedsw/lib/bsp/standalone_v9_1/src/arm/common/gcc \
                              -I$XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src \
                              -I$XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src \
                              -I$XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/gpio_v4_11/src \
                              -I$XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axis_switch_v1_7/src \
                                $XILINX_VITIS/data/embeddedsw/lib/bsp/standalone_v9_1/src/common/xil_assert.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src/xtmrctr.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src/xtmrctr_l.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src/xtmrctr_sinit.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src/xtmrctr_selftest.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_12/src/xtmrctr_g.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma_bd.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma_sinit.c \
                                $XILINX_VITIS/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_18/src/xaxidma_selftest.c \
                                ./xaxidma_g.c \
                                ../src/syst_hw/xaxidma_bdring.cpp \
                                ../src/syst_hw/EthSyst.cpp \
                                ../src/app/ping_test.cpp \
                                ../src/app/eth_test.cpp
