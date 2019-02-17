#!/bin/python
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
from pyhplib import *

import time

# format reg leaf entry
def regFmt(addrBase, addrLen, addrCells, sizeCells):         
    
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


def gen_riscv_dts(devices, nCpus, cpuFreq, timeBaseFreq, periphFreq, dtsPath):

    assert nCpus >= 1

    tmpStr = '''// DTS generated with gen_riscv_dts(...) 
// OpenPiton + Ariane framework
// Date: %s

/dts-v1/;

/ {
    #address-cells = <2>;
    #size-cells = <2>;
    compatible = "eth,ariane-bare-dev";
    model = "eth,ariane-bare";
    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        timebase-frequency = <%d>; 
    ''' % (time.strftime("%b %d %Y %H:%M:%S", time.localtime()), timeBaseFreq)

    for k in range(nCpus):
        tmpStr += '''    
        CPU%d: cpu@%d {
            clock-frequency = <%d>; 
            device_type = "cpu";
            reg = <%d>;
            status = "okay";
            compatible = "eth, ariane", "riscv";
            riscv,isa = "rv64imacsu";
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
        device_type = "memory";
        reg = <%s>;
    };
            ''' % (addrBase, regFmt(addrBase, addrLen, 2, 2))

    tmpStr += '''        
    soc {
        #address-cells = <2>;
        #size-cells = <2>;
        compatible = "eth,ariane-bare-soc", "simple-bus";
        ranges;
    '''

    # TODO: this needs to be extended
    # get the number of interrupt sources
    numIrqs = 0
    devWithIrq = ["uart", "net"];
    for i in range(len(devices)):
        if devices[i]["name"] in devWithIrq:
            numIrqs += 1
        

    # get the remaining periphs
    for i in range(len(devices)):
        # CLINT
        if devices[i]["name"] == "ariane_clint":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        clint@%08x {
            compatible = "riscv,clint0";
            interrupts-extended = <''' % (addrBase)
            for k in range(nCpus):
                tmpStr += "&CPU%d_intc 3 &CPU%d_intc 7 " % (k,k)
            tmpStr += '''>;
            reg = <%s>;
            reg-names = "control";
        };
            ''' % (regFmt(addrBase, addrLen, 2, 2))
        # PLIC
        if devices[i]["name"] == "ariane_plic":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        PLIC0: plic@%08x {
            #address-cells = <0>;
            #interrupt-cells = <1>;
            compatible = "sifive,plic-1.0.0", "riscv,plic0";
            interrupt-controller;
            interrupts-extended = <''' % (addrBase)
            for k in range(nCpus):
                tmpStr += "&CPU%d_intc 11 &CPU%d_intc 9 " % (k,k)
            tmpStr += '''>;
            reg = <%s>;
            reg-names = "control";
            riscv,max-priority = <7>;
            riscv,ndev = <%d>;
        };
            ''' % (regFmt(addrBase, addrLen, 2, 2), numIrqs)
        # DTM
        if devices[i]["name"] == "ariane_debug":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        debug-controller@%08x {
            compatible = "riscv,debug-013";
            interrupts-extended = <''' % (addrBase)
            for k in range(nCpus):
                tmpStr += "&CPU%d_intc 65535 " % (k)
            tmpStr += '''>;
            reg = <%s>;
            reg-names = "control";
        };
            ''' % (regFmt(addrBase, addrLen, 2, 2))
        # UART
        if devices[i]["name"] == "uart":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        uart@%08x {
            compatible = "ns16550";
            reg = <%s>;
            clock-frequency = <%d>;
            current-speed = <115200>;
            interrupt-parent = <&PLIC0>;
            interrupts = <1>;
            reg-shift = <1>; // regs are spaced on 8 bit boundary
            reg-io-width = <1>; // only 8-bit access are supported
        };
            ''' % (addrBase, regFmt(addrBase, addrLen, 2, 2), periphFreq)

        # Ethernet
        if devices[i]["name"] == "net":
            addrBase = devices[i]["base"]
            addrLen  = devices[i]["length"]
            tmpStr += '''
        eth: lowrisc-eth@%08x {
            compatible = "lowrisc-eth";
            device_type = "network";
            interrupt-parent = <&PLIC0>;
            interrupts = <3 0>;
            local-mac-address = [ee e1 e2 e3 e4 e5];
            reg = <%s>;
        };
            ''' % (addrBase, regFmt(addrBase, addrLen, 2, 2))

    tmpStr += '''    
    };
};
    '''    
    
    with open(dtsPath + '/ariane.dts','w') as file:
        file.write(tmpStr)
