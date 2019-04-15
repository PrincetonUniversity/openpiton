// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cpx.cc
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
#include "cpx.h"
/*------------------------------------------
  constructor.
--------------------------------------------*/
cpx::cpx()
{
  req_sent    = 0;

}
/*------------------------------------------
 clear cpx packet holder.
--------------------------------------------*/
void cpx::clean()
{
  for(idx = 0; idx < 5; idx++)cpx_pkt[idx] = 0;
}
/*------------------------------------------
  translate pcx to cpx packet.
--------------------------------------------*/
void cpx::xlation(pcx* pkt, char* data)
{    
  clean();//clean cpx packet
  req      = 1 << (*pkt).cpu_id;
  req_sent = 1;
  thrid   = (*pkt).thrid;
  cpu_id  = (*pkt).cpu_id;

  //mim delay at least 2
  //one for request and implement way.
  cpx_pkt[4]  = (*pkt).pkt[3];
  //delay
  req_wait = random() & 7;
  cpx_wait = req_wait + 1;
  
 }
/*------------------------------------------
  request[143:140] : pkt[0]
  NC[136]          : pkt[0]
  thrid[135:134]   : pkt[0]
  way[132:131]     : pkt[0]
  imiss_ret[130]   : CPX_P_LO
  data[127:0]      : pkt[0]

  cpx layout:
  pkt[144-128], pkt[1-4]
  
--------------------------------------------*/
int* cpx::get_cpx()
{
  cpx_pkt[0]  = (1 << 16);       //valid bit

  cpx_pkt[0] |= (INT_RET << 12);//request & error
 
  cpx_pkt[0] |= (thrid << 6);  //thrid
  cpx_pkt[0] &= 0xfffffffe;//clear bit 128 always
  //set special field
  //switch(rqtype){
  //case INT_RET :
    cpx_pkt[0] &= 0x17000;
  //print cpx packet
#ifndef PITON_DPI
  io_printf((char *)"(%0d)Info: cpx packet from iob ->", tf_gettime());
#else // ifndef PITON_DPI
  io_printf((char *)"Info: cpx packet from iob ->");
#endif // ifndef PITON_DPI
  io_printf((char *)"%x", cpx_pkt[0] & 0x1ffff);
  for(idx = 1; idx < 5;idx++)io_printf((char *)"%08x", cpx_pkt[idx]);
  io_printf((char *)"\n");
  return cpx_pkt;
}
/*------------------------------------------
 return cpx request. 
--------------------------------------------*/
int cpx::get_req()
{
  req_sent = 2;//go to the next state.
  if(cpx_wait == 0)cpx_wait = 1;
  return req;
}
/*------------------------------------------
 dec delay.
--------------------------------------------*/
void cpx::dec_wait()
{
  if(req_wait)req_wait--;
  if(cpx_wait)cpx_wait--;
}
