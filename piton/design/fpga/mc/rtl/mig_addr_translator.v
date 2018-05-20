// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
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
// ========== Copyright Header End ============================================

`include "uart16550_define.vh"
`include "mc_define.h"

module mig_addr_translator (
  input   [`PC_ADDR_WIDTH-1:0]      va_byte_addr,

  output  [`MIG_APP_ADDR_WIDTH-1:0] pa_mig_addr
);
wire  [`PC_ADDR_WIDTH-1:0]        boot_va_byte_offset;
wire  [`MIG_APP_ADDR_WIDTH-1:0]   boot_va_mig_offset;
wire  [`PC_ADDR_WIDTH-1:0]        disk_va_byte_offset;
wire  [`MIG_APP_ADDR_WIDTH-1:0]   disk_va_mig_offset;
wire  [`MIG_APP_ADDR_WIDTH-1:0]   va_mig_addr;


assign boot_va_byte_offset = va_byte_addr - `VA_BOOT_BASE;
assign boot_va_mig_offset  = {boot_va_byte_offset[`PC_ADDR_WIDTH-1:6],3'b000};

assign disk_va_byte_offset = va_byte_addr - `VA_DISK_BASE;
assign disk_va_mig_offset  = {disk_va_byte_offset[`PC_ADDR_WIDTH-1:6],3'b000};

assign va_mig_addr    = {va_byte_addr[`PC_ADDR_WIDTH-1:6],3'b000};

assign pa_mig_addr  = (va_byte_addr >= `VA_BOOT_BASE) & (va_byte_addr < `VA_DISK_BASE)  ? `MIG_BOOT_BASE + boot_va_mig_offset :
                       va_byte_addr >= `VA_DISK_BASE                                    ? `MIG_DISK_BASE + disk_va_mig_offset :  va_mig_addr; 


endmodule