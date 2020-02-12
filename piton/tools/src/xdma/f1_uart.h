
// Copyright (c) 2019 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef _UART_H
#define _UART_H

/*
 * Hypervisor UART console definitions
 */

#define RBR_ADDR UINT32_C(0x1000)
#define THR_ADDR UINT32_C(0x1000)
#define IER_ADDR UINT32_C(0x1004)
#define IIR_ADDR UINT32_C(0x1008)
#define FCR_ADDR UINT32_C(0x1008)
#define LCR_ADDR UINT32_C(0x100c)
#define MCR_ADDR UINT32_C(0x1010)
#define LSR_ADDR UINT32_C(0x1014)
#define MSR_ADDR UINT32_C(0x1018)
#define SCR_ADDR UINT32_C(0x101c)
#define DLL_ADDR UINT32_C(0x1000)
#define DLM_ADDR UINT32_C(0x1004)

/*                      
 * Some Line Status Register (FCR) bits
 */

#define LSR_DRDY UINT32_C(0x1)
#define LSR_BINT UINT32_C(0x10)
#define LSR_THRE UINT32_C(0x20)
#define LSR_TEMT UINT32_C(0x40)

/*
 * Some FIFO Control Register (FCR) bits
 */

#define FCR_FIFO_ENABLE UINT32_C(0x1)
#define FCR_RCVR_RESET  UINT32_C(0x2)
#define FCR_XMIT_RESET  UINT32_C(0x4)

/*
 * Line Control Register settings
 */

#define LCR_DLAB UINT32_C(0x80)
#define LCR_8N1  UINT32_C(0x3)

/*
 * Baud rate settings for Divisor Latch Low (DLL) and Most (DLM)
 */

#define DLL_9600 UINT32_C(0x24)
#define DLM_9600 UINT32_C(0x0)

#define DLL_115200 UINT32_C(0x01)
#define DLM_115200 UINT32_C(0x0)

#endif /* _UART_H */               
