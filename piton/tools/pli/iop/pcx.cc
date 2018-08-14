// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: pcx.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
#include "pcx.h"
/*------------------------------------------
  constructor.
--------------------------------------------*/
pcx::pcx(int* p)
{
  wait = random() & 0x7;
  for(idx = 0; idx < 4;idx++)pkt[idx] = p[idx];
}
/*------------------------------------------
  clean paket.
--------------------------------------------*/
void pcx::clean()
{
  for(idx = 0; idx < 4;idx++)pkt[idx] = 0;
}
/*------------------------------------------
PCX: vld[123]
     rq[122:118]
     nc[117]
     cpu[116:114]
     thread[113:112]
     size[106:104]
     pa_10_6[75:70]
     addr[103:64]
     pcx[123:96], pcx[95:64], pcx[63:32], pcx[31:0]    
-------------------------------------------*/
void pcx::chop_pkt(int* pcx_pkt, int avail)
{
  char str[10];
  rqtype    = (pcx_pkt[0] >> 22) & 0x1f;
  nc        = (pcx_pkt[0] >> 21) & 0x1;
  cpu_id    = (pcx_pkt[0] >> 18) & 0x7;
  thrid     = (pcx_pkt[0] >> 16) & 0x3;  
  true_id   = (pcx_pkt[2] << 14) | (pcx_pkt[3] >> 18); //Should probably only use this if rqtype is 01001 (interrupt)
  bf_id     = (pcx_pkt[0] >> 13) & 0x7;
  way       = (pcx_pkt[0] >> 11) & 0x3;
  size      = (pcx_pkt[0] >> 8)  & 0x7;
  
  pa_10_6   = (pcx_pkt[1] >> 6)  & 0x3f;

  way_vld   = 1;
  addr      = (pcx_pkt[0] & 0xff);
  addr    <<= 32;
  addr     |= pcx_pkt[1];
  low       = pcx_pkt[1];//long long type addr
  mask_addr = (addr >> 6)  & 0x3ffffffff;
  up        = (addr >> 28) & 0xfff;
  //delay 
  wait      = 3;//random() & 0x7;
  //comment for debug.
  switch(rqtype){
  case(IMISS_RQ): 
    strcpy(str, "ifill");
    break;
  case(STORE_RQ) :
    strcpy(str, "store");
    break;
  case(LOAD_RQ)  :
    strcpy(str, "load");
    break;
  default : 
    strcpy(str, "");
    break;
  }
  io_printf("(%0d):Info iob pcx %s packet -> ", tf_gettime(), str);
  for(idx = 0;idx < 4;idx++){
    pkt[idx] = pcx_pkt[idx];
    io_printf("%08x",  pkt[idx]);
  }
  io_printf("\n");
 }


