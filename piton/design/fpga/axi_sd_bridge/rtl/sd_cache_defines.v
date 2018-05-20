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

//==================================================================================================
//  Filename      : sd_cache_defines.v
//  Created On    : 2015-04-20
//  Last Modified : 2016-01-26 16:46:33
//  Revision      :
//  Author        : Matthew Matl
//  Company       : Princeton University
//  Email         : mmatl@princeton.edu
//
//  Description   : Definitions for SD block cache
//==================================================================================================

`define AXI_DATA_WIDTH     `NOC_DATA_WIDTH
`define AXI_ADDR_WIDTH     `NOC_DATA_WIDTH
`define AXI_RESP_WIDTH     2
`define AXI_RESP_OKAY      2'b00
`define AXI_RESP_ERROR     2'b10

`define BLK_BYTES          512
`define BLK_WORDS          `BLK_BYTES*8/`NOC_DATA_WIDTH
`define BLK_ADDR_WIDTH      9
`define BLK_ADDR_BITS      `AXI_ADDR_WIDTH-1:`BLK_ADDR_WIDTH
`define N_BLK_ADDR_BITS    `AXI_ADDR_WIDTH-`BLK_ADDR_WIDTH
`define N_ENTRIES          4
`define ENTRY_BITS         2

`define SD_WB_BLK_RD       1'b0
`define SD_WB_BLK_WR       1'b1
