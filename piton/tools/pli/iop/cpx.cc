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
CPX layout
cpx_pkt[1-4] contains 128 bits data.
--------------------------------------------*/
void cpx::get_data(char* data)
{
 int mask, i, j, tmp; 

 mask  = addr & 0x30;
 if(data == 0){
   io_printf("(%0d):access unitialized location addres(%llx)", tf_gettime(), addr);
   for(i = 1; i < 5;i++){
     cpx_pkt[i] = random();
     io_printf("%08x",cpx_pkt[i]); 
   }
   io_printf("\n");
 }
 else{
   for(i = 1; i < 5;i++){
   tmp = 0;//merge 4 bytes
   for(j = 0; j < 4;j++){
     tmp <<= 8;
     if(mask >= 64){
       io_printf("(%0d):info out of bound %llx %x\n", tf_gettime(), addr, mask);
     }
     else tmp  |= (data[mask++] & 0xff);
   }
   cpx_pkt[i] = tmp;
   }
 }
}
/*------------------------------------------
CPX layout
cpx_pkt[1-4] contains 128 bits data.
--------------------------------------------*/
void cpx::core_avail(int avail)
{
 int i;

 //io_printf("(%0d):info send core available data (%llx)", tf_gettime(), addr);
 for(i = 1; i < 4;i++){
   cpx_pkt[i] = 0;
   io_printf("%08x",cpx_pkt[i]);
 } 
 cpx_pkt[i] = avail;
 io_printf("%08x",cpx_pkt[i]);
}
/*------------------------------------------
CPX layout
cpx_pkt[1-4] contains 128 bits data.
--------------------------------------------*/
void cpx::ucb_data(int* data)
{
 for(int i = 0; i < 2;i++){
   cpx_pkt[i+1]   = data[i];
   cpx_pkt[i+3]   = data[i];
 }
}
/*------------------------------------------
  translate pcx to cpx packet.
--------------------------------------------*/
void cpx::xlation(pcx* pkt, char* data)
{    
  clean();//clean cpx packet
  req      = 1 << (*pkt).cpu_id;
  req_sent = 1;
  atom     = 0;
  thrid   = (*pkt).thrid;
  nc      = (*pkt).nc;
  way     = (*pkt).way;
  cpu_id  = (*pkt).cpu_id;
  way_vld = (*pkt).way_vld;
  bf_id   = (*pkt).bf_id;
  pa_10_6 = (*pkt).pa_10_6;
  size    = (*pkt).size;
  addr    = (*pkt).addr;

  //mim delay at least 2
  //one for request and implement way.
  switch((*pkt).rqtype){
  case IMISS_RQ :
    rqtype    = IFILL_RET; 
    atom      = 0;
    get_data(data);
    break;
  case LOAD_RQ  :
    rqtype =  LOAD_RET; 
    if((*pkt).aval)core_avail((*pkt).available);
    else  get_data(data);
    way    = 0;
    bf_id  = 0;
    atom   = 0;
    break;
  case INT_RQ :
   rqtype      = INT_RET;
   cpx_pkt[4]  = (*pkt).pkt[3];
   break;
  case STORE_RQ :
    rqtype     = ST_ACK;
    break;
  }
  //delay
  req_wait = random() & 7;
  cpx_wait = req_wait + 1;
  
 }
/*------------------------------------------
  translate pcx to cpx packet.
--------------------------------------------*/
void cpx::xlation(pcx* pkt, int* data)
{    
  clean();//clean cpx packet
  req      = 1 << (*pkt).cpu_id;
  req_sent = 1;
  atom     = 0;
  thrid   = (*pkt).thrid;
  nc      = (*pkt).nc;
  way     = (*pkt).way;
  cpu_id  = (*pkt).cpu_id;
  way_vld = (*pkt).way_vld;
  bf_id   = (*pkt).bf_id;
  pa_10_6 = (*pkt).pa_10_6;
  size    = (*pkt).size;
  addr    = (*pkt).addr;

  //put data on cpx data field.
  switch((*pkt).rqtype){
   case LOAD_RQ  :
    rqtype =  LOAD_RET; 
    ucb_data(data);
    way    = 0;
    bf_id  = 0;
    atom   = 0;
    break;  
  } 
  //delay
  req_wait = random() & 3;
  cpx_wait = req_wait + 1;
}

/*------------------------------------------
  make interrupt packet from iob dispatcher.
--------------------------------------------*/
void cpx::xlation(pcx* pkt)
{   
  clean();//clean cpx packet
  cpu_id   = ((*pkt).pkt[3] >> 10);//cpu and thread
  cpu_id  &= 0x7;
  thrid    = cpu_id & 0x3;
  req      = 1 << cpu_id;
  req_sent = 1;
  nc       = 0;
  way      = 0;
  bf_id    = 0;
  atom     = 0;
  //interrupt vector.
  rqtype      = INT_RET;
  cpx_pkt[4]  = (*pkt).pkt[3];
  //delay
  req_wait = random() & 3;
  cpx_wait = req_wait + 1;
}
/*------------------------------------------
  translate pcx to cpx packet.
--------------------------------------------*/
void cpx::jxlation(pcx* pkt, int* data)
{    
  clean();//clean cpx packet
  req      = 1 << (*pkt).cpu_id;
  req_sent = 1;
  atom     = 0;
  thrid   = (*pkt).thrid;
  nc      = (*pkt).nc;
  way     = (*pkt).way;
  cpu_id  = (*pkt).cpu_id;
  true_id = (*pkt).true_id;
  way_vld = (*pkt).way_vld;
  bf_id   = (*pkt).bf_id;
  pa_10_6 = (*pkt).pa_10_6;
  size    = (*pkt).size;
  addr    = (*pkt).addr;

  //put data on cpx data field.
  rqtype =  LOAD_RET; 
  way    = 0;
  bf_id  = 0;
  atom   = 0;
  idx    = 1;
  for(int i = 7; i > 4; i -= 2){
    pdata   = data[i-1];
    pdata <<= 16;
    pdata  |= data[i];
    cpx_pkt[idx+1] = pdata;
    cpx_pkt[idx+3] = pdata;
    idx--;
  }
  //delay
  req_wait = random() & 3;
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

  cpx_pkt[0] |= (rqtype << 12);//request & error
  cpx_pkt[0] |= (nc << 8);
 
  cpx_pkt[0] |= (thrid << 6);  //thrid
  cpx_pkt[0] |= ((way & 1) << 5);
  cpx_pkt[0] |= way_vld;
  cpx_pkt[0] |= (atom << 1);
  cpx_pkt[0] |= (bf_id << 3);
  cpx_pkt[0] &= 0xfffffffe;//clear bit 128 always
  //set special field
  switch(rqtype){
  case ST_ACK :
    cpx_pkt[0] |= (1 << 8);//set nc 1
    cpx_pkt[0] &= 0xfffffff3;
    cpx_pkt[0] |= (way << 2);
    cpx_pkt[1] |= (pa_10_6 << 16);
    cpx_pkt[1] |= (cpu_id << 22);
    // reflect pcx[109] to cpx[125] for blk-st/binit-st
    // 32 * 4 = 128 buf_id
    cpx_pkt[1] |= ((bf_id & 1) << 28);
    break;
  case STRLOAD_RET :
    cpx_pkt[0] |= (1 << 8);//set nc 1
    cpx_pkt[0] &= 0xfffffff9;
    cpx_pkt[0] |= ((size >> 1) << 1);
    cpx_pkt[1] |= (pa_10_6 << 16);
    cpx_pkt[1] |= (cpu_id << 22);
    break;
  case LOAD_RET :
    cpx_pkt[0] |= (1 << 8);//set nc 1

    break; 
  case STRST_ACK :
    cpx_pkt[0] |= (1 << 8);//set nc 1
    cpx_pkt[0] &= 0xfffffffd;
    cpx_pkt[0] |= ((way >> 1) << 2);
    break;
  case IFILL_RET :  
    cpx_pkt[0]  |= 4;//set bit 130 for imiss ret
    cpx_pkt[0]  &= 0xffffffdf;//clear bit 133.
    break;
  case INT_RET :
    cpx_pkt[0] &= 0x17000;
    break;
  }
  //print cpx packet
  io_printf("(%0d)Info: cpx packet from iob ->", tf_gettime());
  io_printf("%x", cpx_pkt[0] & 0x1ffff);
  for(idx = 1; idx < 5;idx++)io_printf("%08x", cpx_pkt[idx]);
  io_printf("\n");
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
