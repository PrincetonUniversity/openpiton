// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: device.cc
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
#include "device.h"
/*--------------------------------------
  constructor.
----------------------------------------*/
device::device()
{//we will add more thing here
}
/*--------------------------------------
  constructor.
----------------------------------------*/
void device::clean()
{//we will add more thing here
  for(int i = 0; i < PKT_SIZE; i++)j_pkt[i] = 0;
}
/*--------------------------------------
  constructor.
----------------------------------------*/
bool device::dec_wait()
{//we will add more thing here
  if(wait == 0)return 0;
  wait--;
  if(wait== 0){
    ready   = 1;   
    vld     = 1;
    odd     = 0;
  }
  return 1;
}
/*--------------------------------------
`define UCB_PKT_HI             3 
`define UCB_PKT_LO             0 j_pkt[5]

`UCB_THR_HI                    9 j_pkt[5]
`UCB_THR_LO                    4

`define UCB_ADDR_HI           54 
`define UCB_ADDR_LO           15

`define UCB_SIZE_HI           14
`define UCB_SIZE_LO           12

`define UCB_DATA_HI          127 
`define UCB_DATA_LO           64 -> j_pkt[2], j_pkt[3]
----------------------------------------*/
void device::xlation(pcx* pkt)
{
  //generate jbus
  clean();
  //Here, defined the common part for every device.
  //cpu and thrid
  j_pkt[5]  = pkt->thrid;
  j_pkt[5] |= (pkt->cpu_id << 6) & 0x7;
  //data part. 
  j_pkt[3]  = pkt->pkt[3];
  j_pkt[2]  = pkt->pkt[2];
  //size
  j_pkt[5] |= ((*pkt).size << 12);
  //address
  j_pkt[5] |= (pkt->addr  << 15);
  j_pkt[4]  = ((pkt->addr >> 17) & 0x7fffff);
  //delay
  wait      = random() & 7+2;
  // trin: turn off random
  wait      = 0;
  wait    = wait ? wait : 1;//at least one cycle delay.
  switch((*pkt).dev){
  case 1 ://dram
    j_pkt[5]|= (*pkt).rqtype == STORE_RQ ? UCB_WRITE_REQ : UCB_READ_REQ;//type
    ready   = 0;
    vld     = 0;
    num     = 1;//send jbi data 8 times.
    pointer = 5;
    io_printf("(%0d)Info: dram ucb packet addr(%llx) -> ", tf_gettime(), pkt->addr);
    break;
  case 2:
    j_pkt[5] |= (*pkt).rqtype == STORE_RQ ? UCB_WRITE_REQ : UCB_READ_REQ;//type
    ready   = 0;
    vld     = 0;
    num     = 1;//send jbi data 8 times.
    pointer = 5; 
    io_printf("(%0d)Info: jbi ucb packet addr(%llx) -> ", tf_gettime(), pkt->addr);
    break;
  }
  for(int i = num+1;i <= pointer;i++)io_printf("%08x",j_pkt[i]);
  io_printf("\n");
}
/*--------------------------------------
  send the jbi data
  order is 5, 4, 3, 2.
----------------------------------------*/
bool device::jbi_driver(int loc)
{
  tf_putp(loc, vld);//drive valid bit
  if(vld  == 0)return 1;
  if(odd){
    tf_putp(loc+1, (j_pkt[pointer] >> 16) & 0xffff);
    pointer--;
    odd = 0;
    if(pointer == num)vld = 0;
  }
  else{
    tf_putlongp(loc+1, j_pkt[pointer--], j_pkt[pointer--]);
    if(pointer == num)vld = 0;  
    //tf_putp(loc+1,  j_pkt[pointer] & 0xffff);
    //odd = 1;
  }
  return 0;
}
/*--------------------------------------
  send the jbi data
  order is 5, 4, 3, 2.
----------------------------------------*/
bool device::dram_driver(int loc)
{
  if(tf_getp(loc)){//stall is asserted.
    tf_putp(loc+1, 0);//valid off.
    return 0;
  }
  tf_putp(loc+1, vld);//drive valid bit
  if(vld  == 0)return 1;
  tf_putp(loc+2,  j_pkt[pointer] & 0xf);// 
  j_pkt[pointer] >>= 4;
  odd++;
  if(odd == 8){
    pointer--;
    odd = 0;
  }
  if(pointer == num)vld = 0;
  return 0;
}
