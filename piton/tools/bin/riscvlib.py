#!/usr/bin/env python3
# Modified by Barcelona Supercomputing Center on March 3rd, 2022
# Copyright 2019 ETH Zurich and University of Bologna.
# Copyright and related rights are licensed under the Solderpad Hardware
# License, Version 0.51 (the "License"); you may not use this file except in
# compliance with the License.  You may obtain a copy of the License at
# http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
# or agreed to in writing, software, hardware and materials distributed under
# this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
# Date: 04.02.2019
# Description: Device tree generation script for OpenPiton+Ariane.


import pyhplib
import os
import subprocess
from pyhplib import *
import time

# this prints some system information, to be printed by the bootrom at power-on
def get_bootrom_info(devices, nCpus, cpuFreq, timeBaseFreq, periphFreq, dtsPath, timeStamp):

    gitver_cmd = "git log | grep commit -m1 | LD_LIBRARY_PATH= awk -e '{print $2;}'"
    piton_ver  = subprocess.check_output([gitver_cmd], shell=True)
    ariane_ver = subprocess.check_output(["cd %s && %s" % (os.environ['ARIANE_ROOT'], gitver_cmd)], shell=True)

    # get length of memory
    memLen  = 0
    for i in range(len(devices)):
        if devices[i]["name"] == "mem":
            memLen  = devices[i]["length"]

    if 'PROTOSYN_RUNTIME_BOARD' in os.environ:
        boardName = os.environ['PROTOSYN_RUNTIME_BOARD']
        if not boardName:
            boardName = 'None (Simulation)'
    else:
        boardName = 'None (Simulation)'

    if 'CONFIG_SYS_FREQ' in os.environ:
        sysFreq = os.environ['CONFIG_SYS_FREQ']
        sysFreq = "%d MHz" % int(float(int(sysFreq))/1e6)
    else:
        sysFreq = "Unknown"

    tmpStr = '''// Info string generated with get_bootrom_info(...)
// OpenPiton + Ariane framework
// Date: %s

const char info[] = {
"\\r\\n\\r\\n"
"----------------------------------------\\r\\n"
"--     OpenPiton+Ariane Platform      --\\r\\n"
"----------------------------------------\\r\\n"
"OpenPiton Version: %s                   \\r\\n"
"Ariane Version:    %s                   \\r\\n"
"                                        \\r\\n"
"FPGA Board:        %s                   \\r\\n"
"Build Date:        %s                   \\r\\n"
"                                        \\r\\n"
"#X-Tiles:          %d                   \\r\\n"
"#Y-Tiles:          %d                   \\r\\n"
"#Cores:            %d                   \\r\\n"
"Core Freq:         %s                   \\r\\n"
"Network:           %s                   \\r\\n"
"DRAM Size:         %d MB                \\r\\n"
"                                        \\r\\n"
"L1I Size / Assoc:  %3d kB / %d          \\r\\n"
"L1D Size / Assoc:  %3d kB / %d          \\r\\n"
"L15 Size / Assoc:  %3d kB / %d          \\r\\n"
"L2  Size / Assoc:  %3d kB / %d          \\r\\n"
"----------------------------------------\\r\\n\\r\\n\\r\\n"
};

''' % (timeStamp,
       piton_ver[0:8],
       ariane_ver[0:8],
       boardName,
       timeStamp,
       int(os.environ['PITON_X_TILES']),
       int(os.environ['PITON_Y_TILES']),
       int(os.environ['PITON_NUM_TILES']),
       sysFreq,
       os.environ['PITON_NETWORK_CONFIG'],
       int(memLen/1024/1024),
       int(os.environ['CONFIG_L1I_SIZE'])/1024,
       int(os.environ['CONFIG_L1I_ASSOCIATIVITY']),
       int(os.environ['CONFIG_L1D_SIZE'])/1024,
       int(os.environ['CONFIG_L1D_ASSOCIATIVITY']),
       int(os.environ['CONFIG_L15_SIZE'])/1024,
       int(os.environ['CONFIG_L15_ASSOCIATIVITY']),
       int(os.environ['CONFIG_L2_SIZE'] )/1024,
       int(os.environ['CONFIG_L2_ASSOCIATIVITY'] ))

    with open(dtsPath + '/info.h','w') as file:
        file.write(tmpStr)


# format reg leaf entry
def _reg_fmt(addrBase, addrLen, addrCells, sizeCells):

    assert addrCells >= 1 or addrCells <= 2
    assert sizeCells >= 0 or sizeCells <= 2

    tmpStr = " "

    if addrCells >= 2:
        tmpStr += "0x%08x " % (addrBase >> 32)

    if addrCells >= 1:
        tmpStr += "0x%08x " % (addrBase & 0xFFFFFFFF)

    if sizeCells >= 2:
        tmpStr += "0x%08x " % (addrLen >> 32)

    if sizeCells >= 1:
        tmpStr += "0x%08x " % (addrLen & 0xFFFFFFFF)

    return tmpStr

def gen_riscv_dts(devices, nCpus, cpuFreq, timeBaseFreq, periphFreq, dtsPath, timeStamp):

    assert nCpus >= 1

    # get UART base
    uartBase = 0xDEADBEEF
    for i in range(len(devices)):
        if devices[i]["name"] == "uart":
            uartBase = devices[i]["base"]


    tmpStr = '''// DTS generated with gen_riscv_dts(...)
// OpenPiton + Ariane framework
// Date: %s

/dts-v1/;

/ {
    #address-cells = <2>;
    #size-cells = <2>;
    u-boot,dm-pre-reloc;
    compatible = "openpiton,cva6platform";

    chosen {
    u-boot,dm-pre-reloc;
    stdout-path = "uart0:115200";
    };

    aliases {
        u-boot,dm-pre-reloc;
        console = &uart0;
        serial0 = &uart0;
    };

    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        u-boot,dm-pre-reloc;
        timebase-frequency = <%d>;
    ''' % (timeStamp, timeBaseFreq)

    for k in range(nCpus):
        tmpStr += '''
        CPU%d: cpu@%d {
            clock-frequency = <%d>;
            u-boot,dm-pre-reloc;
            device_type = "cpu";
            reg = <%d>;
            status = "okay";
            compatible = "openhwgroup, cva6", "riscv";
            riscv,isa = "rv64imafdc";
            mmu-type = "riscv,sv39";
            tlb-split;
            // HLIC - hart local interrupt controller
            CPU%d_intc: interrupt-controller {
                #interrupt-cells = <1>;
                interrupt-controller;
                compatible = "riscv,cpu-intc";
            };
        };
        ''' % (k,k,cpuFreq,k,k)

    tmpStr += '''
    };
    '''

    # this parses the device structure read from the OpenPiton devices*.xml file
    # only get main memory ranges here
    for i in range(len(devices)):
        if devices[i]["name"] == "mem":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
    memory@%08x {
        u-boot,dm-pre-reloc;
        device_type = "memory";
        reg = <%s>;
    };
            ''' % (addrBase, _reg_fmt(addrBase, addrLen, 2, 2))

    for i in range(len(devices)):
        if devices[i]["name"] == "dma_pool":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            # Small hack to be able to access the whole space defined in the devices.xml file
            # but still using just a fragment (256M) for particular dma pool.
            addrFrag  = devices[i]["fragment"]
            addrOnic  = addrBase + addrLen - addrFrag
            tmpStr += '''
    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;
        
        eth_pool: eth_pool_node {
            reg = <%s>;
            compatible = "shared-dma-pool";
        }; 
        onic_pool: onic_pool_node {
            reg = <%s>;
            compatible = "shared-dma-pool";
        }; 
    };
            ''' % (_reg_fmt(addrBase, addrFrag, 2, 2),
                   _reg_fmt(addrOnic, addrFrag, 2, 2))
            #''' % (addrBase, _reg_fmt(addrBase, addrLen, 2, 2))

    tmpStr += '''
    eth0_clk: eth0_clk {
        compatible = "fixed-clock";
        #clock-cells = <0>;
        clock-frequency = <156250000>;
    };
    '''

    # TODO: this needs to be extended
    # get the number of interrupt sources
    # When using Ethernet + DMA, the number of IRQs for Ethernet is 2 instead of 1
    # TODO: Make a difference in the devices_$(core).xml between "net" and "dma_net", as the number of interrupts is different.
    # TODO: An alternative is to add a field in the device xml file that holds the number of interrupts.
    numIrqs = 0
    devWithIrq = ["uart", "net"];
    for i in range(len(devices)):
        if devices[i]["name"] in devWithIrq:
            numIrqs += 1
            if devices[i]["name"] == "net":
                numIrqs += 1


    # get the remaining periphs
    ioDeviceNr=1
    for i in range(len(devices)):
        # CLINT
        if devices[i]["name"] == "ariane_clint":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        clint@%08x {
            u-boot,dm-pre-reloc;
            compatible = "riscv,clint0";
            interrupts-extended = <''' % (addrBase)
            for k in range(nCpus):
                tmpStr += "&CPU%d_intc 3 &CPU%d_intc 7 " % (k,k)
            tmpStr += '''>;
            reg = <%s>;
            reg-names = "control";
        };
            ''' % (_reg_fmt(addrBase, addrLen, 2, 2))
        # PLIC
        if devices[i]["name"] == "ariane_plic":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        PLIC0: plic@%08x {
            u-boot,dm-pre-reloc;
            #address-cells = <0>;
            #interrupt-cells = <1>;
            compatible = "riscv,plic0";
            interrupt-controller;
            interrupts-extended = <''' % (addrBase)
            for k in range(nCpus):
                tmpStr += "&CPU%d_intc 11 &CPU%d_intc 9 " % (k,k)
            tmpStr += '''>;
            reg = <%s>;
            riscv,max-priority = <7>;
            riscv,ndev = <%d>;
        };
            ''' % (_reg_fmt(addrBase, addrLen, 2, 2), numIrqs)

        # UART
        # TODO: update uart sequence numbers
        if devices[i]["name"] == "uart":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        uart0: uart@%08x {
            u-boot,dm-pre-reloc;
            compatible = "ns16550";
            reg = <%s>;
            clock-frequency = <%d>;
            current-speed = <115200>;
            interrupt-parent = <&PLIC0>;
            interrupts = <%d>;
            reg-shift = <0>; // regs are spaced on 8 bit boundary (modified from Xilinx UART16550 to be ns16550 compatible)
        };
            ''' % (addrBase, _reg_fmt(addrBase, addrLen, 2, 2), periphFreq, ioDeviceNr)
            ioDeviceNr+=1

        # sd card
        if devices[i]["name"] == "sd":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        sdhci_0: sdhci@%08x {
            u-boot,dm-pre-reloc;
            status = "okay";
            compatible = "openpiton,piton-mmc";
            reg = <%s>;
        };
            ''' %(addrBase, _reg_fmt(addrBase, addrLen, 2, 2))

        # Ethernet
        if devices[i]["name"] == "net":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            dmaChannelMM2S = addrBase + 0x0
            dmaChannelS2MM = addrBase + 0x30
            tmpStr += '''
        ethernet0 {
            xlnx,rxmem = <0x5f2>;
            carv,mtu = <0x5dc>;
            carv,no-mac;
            device_type = "network";       
            local-mac-address = [00 0a 35 23 07 84];
            axistream-connected = <0xfe>;
            compatible = "xlnx,xxv-ethernet-1.0-carv";
            memory-region = <&eth_pool>;
        };
        
        dma_eth: dma@%08x {
            xlnx,include-dre;
            phandle = <0xfe>;
            #dma-cells = <1>;
            compatible = "xlnx,axi-dma-1.00.a";
            clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_aclk", "m_axi_sg_aclk";
            clocks = <&eth0_clk>, <&eth0_clk>, <&eth0_clk>, <&eth0_clk>;
            reg = <%s>;
            interrupt-names = "mm2s_introut", "s2mm_introut";
            interrupt-parent = <&PLIC0>;
            interrupts = <%d %d>;
            xlnx,addrwidth = <0x28>;
            xlnx,include-sg;
            xlnx,sg-length-width = <0x17>;
            
            dma-channel@%08x {
                compatible = "xlnx,axi-dma-mm2s-channel";
                dma-channels = <1>;
                interrupts = <%d>;
                xlnx,datawidth = <0x40>;
                xlnx,device-id = <0x00>;
                xlnx,include-dre;                        
            };
            
            dma-channel@%08x {
                compatible = "xlnx,axi-dma-s2mm-channel";
                dma-channels = <1>;
                interrupts = <%d>;
                xlnx,datawidth = <0x40>;
                xlnx,device-id = <0x00>;
                xlnx,include-dre;            
            };
        };
            ''' % (addrBase, _reg_fmt(addrBase, addrLen, 2, 2), ioDeviceNr, ioDeviceNr+1, dmaChannelMM2S, ioDeviceNr, dmaChannelS2MM, ioDeviceNr+1)
            ioDeviceNr+=2                       

    tmpStr += '''
};
    '''

    # this needs to match
    assert ioDeviceNr-1 == numIrqs

    with open(dtsPath + '/rv64_platform.dts','w+') as file:
        file.write(tmpStr)

def main():
    devices = pyhplib.ReadDevicesXMLFile()

    # just use a default frequency for device tree generation if not defined
    sysFreq = 50000000
    if 'CONFIG_SYS_FREQ' in os.environ:
        sysFreq = int(os.environ['CONFIG_SYS_FREQ'])

    timeStamp = time.strftime("%b %d %Y %H:%M:%S", time.localtime())
    gen_riscv_dts(devices, PITON_NUM_TILES, sysFreq, sysFreq/128, sysFreq, os.environ['DV_ROOT']+"/design/chipset/rv64_platform/bootrom/", timeStamp)
    get_bootrom_info(devices, PITON_NUM_TILES, sysFreq, sysFreq/128, sysFreq, os.environ['DV_ROOT']+"/design/chipset/rv64_platform/bootrom/", timeStamp)

if __name__ == "__main__":
    main()
