// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_sys.cc
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
#include "bw_sys.h"
/*-----------------------------------------
  constructor.
  -----------------------------------------*/
int bw_sys::manual_init(b_tree_node_ptr* mem)
{ 
  sysMem = mem;
  //start bit for ssi.
  start_bit  = 0;
  sso_ready  = 0;  
  off_random = 0;
  dont_kill  = 0;
  return 0;
}
/*-----------------------------------------
read options
 -----------------------------------------*/
void bw_sys::option(char* str)
{
  char*  pargs;
  pargs = mc_scan_plusargs("off_random_sys=");
  if(pargs != (char*) 0)off_random = 1;
  else off_random = 0;
  io_printf("Info->off_random_sys=%d\n", off_random); 
  read_evfile(str);
  pargs = mc_scan_plusargs("ignore_ssi_parity=");
  if(pargs != (char*) 0)dont_kill = 1;
}
/*--------------------------------------
 !$EV  ssi_error(num, phyical address);
----------------------------------------*/
void bw_sys::read_evfile(char* str)
{
  char  buf [BUFFER];
  char  cbuf[BUFFER];//temp variable for intermiate data
  FILE *fp;
  int num;

  if((fp = fopen(str, "r")) == NULL){
    tf_error("Error: cannot open the file %s for reading\n", str);
    tf_dofinish();
  } 
  //read a file.
  while(fgets(buf, BUFFER, fp)){
    idx = rmSpace(buf, 0, BUFFER);//remove leading spaces
    replace(buf);
    if(strncmp(buf, "ssi_error ", 10))continue;//comment or space line.
    idx = rmSpace(buf, 10, BUFFER);   
    copy(buf, &idx, cbuf);
    rmhexa(cbuf);
    key = getEight(cbuf);
     //save event on the data structure.
    one_event       = new event_record;      
    one_event->type = 1;//error enjection.
    //save an event on the event tree.
    if(event_list = phy_event.search(key))event_list->append(one_event);
    else{//push event on the list
      event_list = new List<event_record>;
      event_list->append(one_event);
      phy_event.insert(event_list, key);
      io_printf("Info->ssi_error(%llx)\n", key);
    }
  }
  fclose(fp);
}
/*----------------------------------
  Is it hit?
We need to mask out address.
Just support 40bit in n1.
  -----------------------------------*/
void  bw_sys::hit_addr()
{
  key = addr & 0xffffffffff;
  if(event_list = phy_event.search(key)){
    one_event   = event_list->shift();
    hit = 1;
    io_printf("%0d:info-> ssi request parity error event->addresss(%llx)\n",
	      tf_gettime(), key);
  }
  else hit = 0;
}
/*-----------------------------------------
compute an even parity of data.
 -----------------------------------------*/
bool bw_sys::parity(char* buf, int num)
{
  char pty = 0;
  for(idx = 0; idx < num;idx++)pty ^= buf[idx];
  pty ^= 1;
  return pty;
}
/*-----------------------------------------
merged serial data to integer.
  -----------------------------------------*/
int bw_sys::merged(char* sr, int st, int en)
{
  int tmp = 0;

  for(idx = st; idx >= en;idx--){
    tmp <<= 1;
    tmp |= sr[idx];
  }
  return tmp;
} 
/*-----------------------------------------
merged serial data to integer.
  -----------------------------------------*/
long long  bw_sys::mergedl(char* sr, int st, int en)
{
  long long tmp = 0;

  for(idx = st; idx >= en;idx--){
    tmp <<= 1;
    tmp |= sr[idx];
  }
  return tmp;
} 
/*-----------------------------------------
  convert 8 bytes to 64 bit serial data.
  -----------------------------------------*/
void bw_sys::get_data(char* serial, int ridx, int sz)
{
  int sv    = ridx;
  int mask  = addr & 0x38;
  //need 8bytes
  for(idx = 7; idx >= 0;idx--){
    ch = data->data[mask+idx] & 0xff;
    for(int i = 0; i < 8;i++){//1 byte
      serial[ridx] = ch & 1;
      ch         >>= 1;
      ridx--;
    }
  }
  //align address
  int ind = (addr & 0x7) * 8;
  ridx    = 0;
  if(ind){
    for(int i = ind; i <= sv;i++){
      serial[ridx] = serial[i];
      ridx++;
    }
  }
} 
/*-----------------------------------------
translate pcx to cpx packet.
data order:[0:7]
 -----------------------------------------*/
void bw_sys::write(int sz)
{ 
  int idx, size, sidx;
  char ch_array[8];
  b_tree_atom_ptr atom;//node for b-tree.
  int mask  = addr & 0x3f;
  size      = 1 << sz;
  sidx      = 8 - size;

  //unpack
  for(idx = 0; idx < 8; idx++){
    ch_array[idx] = write_data & 0xff;
    write_data  >>= 8;
  }
  //save data  
  mask_addr = (addr >> 6) & 0x3ffffffff;
  data      = b_Find(sysMem, &mask_addr);
  if(data){//updated data
    for(idx = 0; idx < size;idx++){
      data->data[mask+size - idx - 1] = ch_array[idx+sidx];
    }
  }
  else{
    atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
    for(idx = 0;idx < 64;idx++)atom->data[idx] = 0;
    atom->data[idx] = '\0'; 
    atom->key        = mask_addr;
    atom->size       = 64;
    // for(idx = 0; idx < size;idx++)atom->data[mask+idx] = ch_array[idx+sidx];
    for(idx = 0; idx < size;idx++)atom->data[mask+size-idx-1] = ch_array[idx+sidx];
    b_insert(sysMem, &atom);
  }
}
/*-----------------------------------------
translate pcx to cpx packet.
cmd[2]:0 for write, 1 for read.
cmd[1:0]
  2'b00 : 1 byte
  2'b01 : 2 byte
  2'b10 : 4 byte
  2'b11 : 8 byte
read:  1 start bit, 8-64 data bits, parity bit
write: 1 start bit and parity bit  
  -----------------------------------------*/
void bw_sys::xlation()
{
  sso_record_ptr t_tmp = new sso_record;
  int sz      = merged(rcv, 93, 92);
  addr        = merged(rcv, 91, 64);
  addr       |= (0xfff << 28);//recover boot rom address
  t_tmp->wait = off_random ? 3 : rand() & 0x3 + 1;
  
  switch(rcv[94]){
  case 0 : //write to bootrom
    //write into
    t_tmp->num       = 3;
    t_tmp->serial[0] = 1;
    t_tmp->serial[1] = 1;
    t_tmp->serial[2] = 0;
    write_data       = mergedl(rcv, 63, 0);
    io_printf("(%0d)Info-> write_request size(%d) address(%llx) data(%0llx)\n", 
	      tf_gettime(), sz, addr, write_data);
    write(sz);
    break;
  case 1 : //read data from bootrom
    io_printf("(%0d)Info-> read_request size(%d) address(%llx) \n",
	      tf_gettime(), sz, addr);
    mask_addr = (addr >> 6) & 0x3ffffffff;
    data      = b_Find(sysMem, &mask_addr);
    if(!data){
      io_printf("(%0d)Error:ssi access an uninitialize Location\n", tf_gettime());
      io_printf("%d:Simulation -> FAIL(ssi access uninit Location)\n", tf_gettime()); 
      tf_dofinish();
    }
    get_data(t_tmp->serial, 63, sz);
    hit_addr();
    switch(sz){
    case 0 :
      t_tmp->serial[8] = parity(t_tmp->serial, 8);
      t_tmp->num       = 9;
      if(hit)t_tmp->serial[8] = t_tmp->serial[8] ? 0 : 1;
      break;
    case 1 :
      t_tmp->serial[16] = parity(t_tmp->serial, 16);
      t_tmp->num        = 17;
      if(hit)t_tmp->serial[16] = t_tmp->serial[16] ? 0 : 1;
      break;
    case 2 :
      t_tmp->serial[32] = parity(t_tmp->serial, 32);
      t_tmp->num        = 33;
      if(hit)t_tmp->serial[32] = t_tmp->serial[32] ? 0 : 1;
      break;
    case 3 :
      t_tmp->serial[64] = parity(t_tmp->serial, 64);
      t_tmp->num        = 65;
      if(hit)t_tmp->serial[64] = t_tmp->serial[64] ? 0 : 1;
      break;	
    }
   break;
  }
  sso_Q.append(t_tmp);
}
/*-----------------------------------------
read serial data from jbi.
  -----------------------------------------*/
void bw_sys::ssi(int loc)
{
  ch = tf_getp(loc);
  if(ch || start_bit){//start bit on.
    if(!start_bit){
      ssi_idx    = SSI_NUM;
      start_bit  = 1;
    }
    else if(ssi_idx == 0){//data
      if(parity(rcv, 95) != ch){
	if(dont_kill){
	  io_printf("(%0d):Error->ssi parity error in receiving data", tf_gettime());
	}
	else{
	  io_printf("(%0d):Error->ssi parity error", tf_gettime());
	  tf_dofinish();
	}
      }
      xlation();
      io_printf("(%0d):Info:io received ssi request -> ", tf_gettime());
      for(int idx = 94; idx >= 0; idx--)io_printf("%01x", rcv[idx]);io_printf("\n");
      start_bit = 0;
    }
    else{
      ssi_idx--;
      rcv[ssi_idx] = ch;
    }
  }
}
/*-----------------------------------------------------
send serial data to jbi.
------------------------------------------------------*/
void bw_sys::sso(int loc)
{
  if(sso_Q.empty() == 0 || sso_ready){
    if(sso_ready){
      tf_putp(loc, sso_r->serial[sso_r->idx]);
      sso_r->idx++;
      if(sso_r->num == sso_r->idx){
	sso_ready = 0;	
	delete sso_r;
      }
    }
    else {
      sso_r = sso_Q.front();
      if(sso_r->wait)sso_r->wait--;
      if(sso_r->wait == 0){
	sso_r      = sso_Q.shift();	
	sso_ready  = 1;
	sso_r->idx = 0;
	io_printf("(%0d):Info: io sending data to jbi -> ", tf_gettime());
	for(int idx = 0; idx < sso_r->num; idx++)io_printf("%01x", sso_r->serial[idx] & 1);
	io_printf("\n");
	tf_putp(loc, 1);//start bit
	if(sso_r->num == 3)sso_r->idx = 1;
      }
      else tf_putp(loc, 0);//turn off
    }
  }
  else tf_putp(loc, 0);//turn off
}
