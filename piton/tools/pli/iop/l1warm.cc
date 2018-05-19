// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: l1warm.cc
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
#include "l1warm.h"
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
l1warm::l1warm()
{
  idir_num = 0;
  ddir_num = 0;
  //slam icache & dcache 50%, respectively. 
  icache   = 50;
  dcache   = 50;
  idone    = 0;
  ddone    = 0;
  dcache_num = 0;
  icache_num = 0;
  dtag_num   = 0;
  itag_num   = 0;
  ivalid_num = 0;
  dvalid_num = 0;
  for(int i = 0; i < 16 * BANK; i++){
    dir_ivalid[i] = 0;
    dir_dvalid[i] = 0;
    dir_iparity[i] = 0;
    dir_dparity[i] = 0;
  }
  //debug
  l1_debug    = 0;
  check_irange = 0;
  check_drange = 0;
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
int l1warm::copy(char* buf, char* cbuf, int idx)
{
  int ind = 0;
  while((buf[idx] != '\0') && 
	(buf[idx] != ':')  &&
	(buf[idx] != ' ')  &&
	(ind < 16))cbuf[ind++] = buf[idx++];
  cbuf[ind] = '\0';
  return ++idx;
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
long long  l1warm::getEight(char *buf)
{
  int  i;
  long long  key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}
/*-------------------------------------------
check whether it is invalidate_all.
---------------------------------------------*/
long long l1warm::get_long(int loc){
  int       low, high;
  long long sixty;

  low     = tf_getlongp(&high, loc);
  sixty   = high;
  sixty <<= 32;
  sixty  |= low;
  return sixty;
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l1warm::set()
{
  int i;
  int arg = 2;//start argument
  int idx = 0;//array index;

#ifdef USE_ACC
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  delay_s.model = accNoDelay;
  char* outdata = new char[10];
#endif


  //get dcache directory pointer
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_nodeinfo(arg, &node_info);
	  if(ddir_num == 0)ddir_num = node_info.node_ngroups;
	  dir_darray[idx]  = node_info.node_value.memoryval_p;
	  arg += 3;
	  idx++;
	}
      }
    }
  }
  //icache directory
  //64for each memory
  idx = 0;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_nodeinfo(arg, &node_info);
	  if(idir_num == 0)idir_num = node_info.node_ngroups;
	  dir_iarray[idx]  = node_info.node_value.memoryval_p;
	  arg += 3;
	  idx++;
	}
      }
    }
  }
  //i$ & D$
  for(idx = 0;idx < 8;idx++){
    if(cpu_status & (1 << idx)){//if instantiate, do it.
      //get the dcache pointer.
      for(i = 0; i < 4;i++){
	tf_nodeinfo(arg++, &node_info);
	dcache_w[i][idx] = node_info.node_value.memoryval_p;//way and core
	if(dcache_num == 0)dcache_num  = node_info.node_ngroups;
      }
      //tag
      tf_nodeinfo(arg++, &node_info);
      if(dtag_num == 0)dtag_num  = node_info.node_ngroups;
      dcache_tag[idx] = node_info.node_value.memoryval_p;
     
      //valid
      //slam valid to zero.
      dcache_vld[idx] = arg;

#ifdef USE_ACC
    sprintf(outdata,"0");
    acc_initialize();
    tmphandle = acc_handle_tfarg(arg);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
#else
      tf_nodeinfo(arg++, &node_info);
      for(i = 0; i < node_info.node_ngroups;i++){
	node_info.node_value.vecval_p[i].avalbits = 0;
	node_info.node_value.vecval_p[i].bvalbits = 0;
      }
      tf_propagatep(dcache_vld[idx]);
#endif
      //get icache pointer
      //icache data
      tf_nodeinfo(arg++, &node_info);
      if(icache_num == 0)icache_num = node_info.node_ngroups;
      icache_data[idx] = node_info.node_value.memoryval_p;
      
      //icache tag
      tf_nodeinfo(arg++, &node_info);
      icache_tag[idx] = node_info.node_value.memoryval_p;
      if(itag_num == 0)itag_num  = node_info.node_ngroups;
      //slam valid to zero.
      icache_vld[idx] = arg;
#ifdef USE_ACC
    sprintf(outdata,"0");
    acc_initialize();
    tmphandle = acc_handle_tfarg(arg);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
#else
      tf_nodeinfo(arg++, &node_info);
      for(i = 0; i < node_info.node_ngroups;i++){
	node_info.node_value.vecval_p[i].avalbits = 0;
	node_info.node_value.vecval_p[i].bvalbits = 0;
      }
      tf_propagatep(icache_vld[idx]);
#endif
    }
  }

  //set options.
  char*  pargs, cbuf[16];
  pargs = mc_scan_plusargs ("l1_debug=");
  if(pargs != (char *) 0)l1_debug = 1;

  pargs = mc_scan_plusargs ("l1_irange=");
  if(pargs != (char *) 0){
    check_irange = 1;
    idx         = copy(pargs, cbuf, 0);
    up_ibound   = getEight(cbuf);
    copy(pargs, cbuf, idx);
    low_ibound   = getEight(cbuf);
    io_printf("Info:L1_islam range %llx:%llx\n", up_ibound, low_ibound);
  }
  pargs = mc_scan_plusargs ("l1_drange=");
  if(pargs != (char *) 0){
    check_drange = 1;
    idx          = copy(pargs, cbuf, 0);
    up_dbound    = getEight(cbuf);
    copy(pargs, cbuf, idx);
    low_dbound   = getEight(cbuf);
    io_printf("Info:L1_dslam range %llx:%llx\n", up_dbound, low_dbound);
  }
}
/*--------------------------------------------
after slam tag, save valid & parity into memory.
--------------------------------------------*/
void l1warm::store_parity()
{
 
  int arg = 4;//start argument
  int idx = 0;//array index;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_putlongp(arg++, dir_dvalid[idx],  dir_dvalid[idx] >> 32);
	  tf_putlongp(arg++, dir_dparity[idx], dir_dparity[idx] >> 32);
	  arg++;//jump array
	  idx++;
	}
      }
    }
  }
  idx = 0;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_putlongp(arg++, dir_ivalid[idx],  dir_ivalid[idx]  >> 32);
	  tf_putlongp(arg++, dir_iparity[idx], dir_iparity[idx] >> 32);
	  arg++;//jump array
	  idx++;
	}
      }
    }
  }
}
/*--------------------------------------------
after slam tag, save valid.
--------------------------------------------*/
void l1warm::store_valid()
{
 
  int arg = 2;//start argument
  int idx = 0;//array index;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_putlongp(arg, dir_dvalid[idx],  dir_dvalid[idx] >> 32);
	  arg++;
	  idx++;
	}
      }
    }
  }
  idx = 0;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_putlongp(arg, dir_ivalid[idx],  dir_ivalid[idx]  >> 32);
	  arg++;
	  idx++;
	}
      }
    }
  }
}
/*--------------------------------------------
got the predecode information.
--------------------------------------------*/
int l1warm::predecoder(int inst)
{
  int out, op, op1, op2, op3;
  op  = (inst >> 30 ) & 0x3; 
  out = 0;
  if(op == 1)out = 1;//call
  else if(op == 0){//branch, sethi, nop
    op1 = (inst >> 22) & 0x7;
    if(op1 == 0x4)out = 0; // nop/sethi
    else out = 1;// branch
  }
  else if(op == 2){// arith, shift, mem#, mov
    op1 = (inst >> 23) & 0x3;
    if(op1 == 3)out = 1;// wrpr, vis, save, jmpl
    else if((op1 & 2) == 0){// arith
      op2 = (inst >> 22) & 0x3;
      op3 = (inst >> 19) & 0x3;
      if((op2 & 1) == 0)out = 0;// alu op
      else if((op2 & 1) && (op3 == 0))out = 0;// subc or addc
      else out = 1;// mul, div
    }
    else{// if (in[24:23] == 2'b10)  shft, mov, rdpr, tag
      op2 = (inst >> 19) & 0xf;
      if(op2 == 4)out = 1; // mulscc
      else if((op2 & 0x8) == 0)out = 0;
      else if((op2 == 0xc) ||(op2 == 0xf)) out = 0;// mov
      else out = 1;// rdsr, mem#, popc, flushw, rdpr
    }
  }
  else{// ld st
    op1 = (inst >> 19) & 0x3f;
    op2 = (inst >> 21) & 0x3;
    if(op1 & 0x20 || op1 & 0x10 || (op1 & 0x4) == 0)out = 1; // fp, alt space or ld
    else if (((op1 & 0x10) == 0) &&((op1& 0xf) == 0xe)) out = 0; // stx
    else if (op2 == 1)out = 0;  // other st
    else out = 1;
  }
  return out;
}
/*--------------------------------------------
deceide which cache is slammed at this time.
--------------------------------------------*/
int l1warm::which_cache()
{
  int which = random() & 1 + 1;
  if(which == 1){//dcache
    if(ddone == dcache){
      idone++;
      which = 2;
    }
    else ddone++;
  }
  else {//icache
    if(idone == icache){
      ddone++;
      which = 1;
    }
    else idone++;
  }
  if((icache == idone) && (dcache == ddone)){
    idone = 0;
    ddone = 0;
  }
  return which;
}
/*--------------------------------------------
choose the way to be slammed.
--------------------------------------------*/
int l1warm::which_way(KeyType addr)
{
  long long lword;
  int       gidx, sidx, idx;
  int       addr_idx, i, j, avld;
  int       etag;

  itag       = (addr >> 12) & 0xfffffff;//28 bits addr[39:12]
  addr_idx   = (addr >> 5)  & 0x7f;
  addr_idx <<= 2;
  tf_nodeinfo(icache_vld[cpu], &node_info);
  for(i = 0; i < 4;i++){
    idx  = addr_idx + i;
    gidx = idx / 32;
    sidx = idx % 32;
    avld = node_info.node_value.vecval_p[gidx].avalbits;
    if((avld & ( 1 << sidx)) == 0)continue;
    avalPtr    = icache_tag[cpu] + idx * itag_num * 2;
    for(j = itag_num - 1; j >= 0;j--){
      lword <<= 8;
      lword  |= avalPtr[j] & 0xff;
    }
    etag = (lword >> 1) & 0xfffffff;
    if(itag == etag){
      way = i;
      return 1;
    }
  }
  if(i == 4)way = random() & 0x3;
  return 0;
}
/*--------------------------------------------
count how many cores are turned on.
--------------------------------------------*/
void l1warm::set_cpu(int stat)
{
  cpu_status = stat;
  cpu_num    = 0;
  for(int i = 0; i < 8;i++){
    if(stat & 1)cpu_ptr[cpu_num++] = i;
    stat >>= 1;
  }
  io_printf("Info Core_status(%x) number(%d)\n", cpu_status, cpu_num);
}
/*--------------------------------------------
choose the core to be slammed.
--------------------------------------------*/
void l1warm::core(int num)
{
  cpu = cpu_chose[num];
}
/*--------------------------------------------
choose the followings to be slammed:
1. how many core.
2. which core.
--------------------------------------------*/
int l1warm::howmany_cpu()
{
  int chose, status = 0;
  int num  = random() % cpu_num + 1;

  for(int i = 0; i < num;i++){
    while(1){
      chose = random() % cpu_num;
      if((status & ( 1 << chose)) == 0){
	status      |= (1 << chose);
	cpu_chose[i] = cpu_ptr[chose];
	break;
      }
    }
  }
  return num;
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l1warm::even_parity(int data, int num)
{
  int parity = 0;
  for(int i = 0; i < num;i++){
    parity ^= (data & 1);
    data  >>= 1;
  }
  return parity;
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l1warm::even_parity(long long data, int num)
{

  int parity = 0;
  for(int i = 0; i < num;i++){
    parity ^= (data & 1);
    data  >>= 1;
  }
  return parity;
}
/*--------------------------------------------
get options from command line.
--------------------------------------------*/
void l1warm::option()
{
  char*  pargs;

  pargs = mc_scan_plusargs ("icache=");
  if(pargs != (char *) 0)icache = atoi(pargs);
  pargs = mc_scan_plusargs ("dcache=");
  if(pargs != (char *) 0)dcache = atoi(pargs);
}
/*--------------------------------------------
slam data into cache.

--------------------------------------------*/
void l1warm::slam_tag(int word, int size)
{

  for(int groups = 0; groups < size;groups++){
    avalPtr[groups] = word & 0xff;
    bvalPtr[groups] = 0;
    word           >>= 8;
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void l1warm::slam_data(long long word, int size)
{
 
  for(int groups = 0; groups < size;groups++){
    avalPtr[groups] = word & 0xff;
    bvalPtr[groups] = 0;
    word          >>= 8;
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void l1warm::slam_data(char* word, int size)
{
  for(int groups = 0; groups < size;groups++){
    avalPtr[groups] = word[groups] & 0xff;
    bvalPtr[groups] = 0;
  }
}
/*--------------------------------------------
set valid bit.
--------------------------------------------*/
void l1warm::find_location(int idx,int *vld )
{
  s_tfexprinfo expr_info;

  // tf_nodeinfo(vld[cpu], &node_info);
  tf_exprinfo(vld[cpu], &expr_info);
  int gidx = idx / 32;
  int sidx = idx % 32;
  int word = expr_info.expr_value_p[gidx].avalbits;
  word    |= (1 << sidx);
  expr_info.expr_value_p[gidx].avalbits = word;
  tf_propagatep(vld[cpu]);
}
/*--------------------------------------------
extract 4 bytes from memory buffer.
--------------------------------------------*/
int l1warm::get_word(char*data, int num)
{
  int word = 0;
  for(int i = num; i < (num+4);i++){
    word <<= 8;
    word |= data[i] & 0xff;
  }
  return word;
}
/*--------------------------------------------
create icache data to be slammed into icd.
1). generate predecoder bit.
2). parity bit.
--------------------------------------------*/
long long l1warm::make_icache_data(int word)
{
  long long lparity, lword = word & 0xffffffff;
  lword <<= 1;  
  if(predecoder(word))lword  |= 1;
  if(even_parity(lword, 33)){
    lparity   = 1;
    lparity <<= 33;
    lword    |=  lparity;
  }
  return lword;
}
/*--------------------------------------------
slam data inti icd.
--------------------------------------------*/
void l1warm::slam_l1idata(KeyType addr, char* data, int num)
{ 
  int word;
  int addr_idx = addr & 0xff0;
  addr_idx    |=  way;
  //word 0;
  avalPtr = icache_data[cpu] + addr_idx * icache_num * 2;
  bvalPtr = avalPtr + icache_num;
  word    = get_word(data, num);
  slam_data(make_icache_data(word), icache_num);
  //word 1;
  avalPtr = icache_data[cpu] + (addr_idx + 4) * icache_num * 2;
  bvalPtr = avalPtr + icache_num;
  word    = get_word(data, 4+num);
  slam_data(make_icache_data(word), icache_num);
 //word 0;
  avalPtr = icache_data[cpu] + (addr_idx + 8) * icache_num * 2;
  bvalPtr = avalPtr + icache_num;
  word    = get_word(data, 8+num);
  slam_data(make_icache_data(word), icache_num);
  //word 1;
  avalPtr = icache_data[cpu] + (addr_idx + 12) * icache_num * 2;
  bvalPtr = avalPtr + icache_num;
  word    = get_word(data, 12+num);
  slam_data(make_icache_data(word), icache_num);
}
/*--------------------------------------------
 assign wr_index0 = {index_f[11:4], 2'b00, wrway_f};
 assign wr_index1 = {index_f[11:4], 2'b01, wrway_f};
 assign wr_index2 = {index_f[11:4], 2'b10, wrway_f};
 assign wr_index3 = {index_f[11:4], 2'b11, wrway_f};
//tag 
{4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}
--------------------------------------------*/
void l1warm::slam_icache(KeyType addr, char* data, int num)
{
 int       addr_idx;
 long long lword;
 //slam data
 slam_l1idata(addr, data, num);
 slam_l1idata(addr+16, data, num+16);
 
 //slam tag
 itag       = (addr >> 12) & 0xfffffff;//28 bits addr[39:12]
 addr_idx   = (addr >> 5)  & 0x7f;
 addr_idx <<= 2;
 addr_idx  |= way;
 
 avalPtr    = icache_tag[cpu] + addr_idx * itag_num * 2;
 bvalPtr    = avalPtr + itag_num;
 itag      |= (even_parity(itag, 28) << 28);
 lword      = itag;
 //io_printf("addr %llx TAG tag = %x addr_idx %x way=%d \n", addr, itag, addr_idx, way);
 slam_data(lword, itag_num);
 //valid bit
 find_location(addr_idx, icache_vld);
}
/*--------------------------------------------
slam l2 directory of l1 icache.
l2 bank 7:6
entry<cpu_id[2:0],way[1:0], addr[8]>
row<addr[5], addr[11]>
--------------------------------------------*/
void l1warm::slam_idirectory(KeyType addr_tmp)
{
  int index;
  tag    = (addr_tmp >> 10) & 0x3fffffff;//30 bits
  //make entry index.
  entry  = (addr_tmp >> 8) & 1;
  entry |= (way << 1);
  entry |= (cpu << 3);
  //get l2 bank
  bank   = (addr_tmp >> 6)  & 0x3;
  col    = (addr_tmp >> 9)  & 0x3;
  row    = addr_tmp  & 0x800 ? 1 : 0;
  if(addr_tmp & 0x20)row |= 2;//bit5
  //get the pointer of valid and parity.
  index      = bank * BANK_NUM + row * ROW_NUM + col;
  avalPtr    = dir_iarray[index]  + entry * idir_num * 2;
  bvalPtr    = avalPtr + idir_num;
  slam_tag(tag, idir_num);
  temp_val            = (even_parity(tag, 30) << entry);
  dir_iparity[index] |= temp_val;
  temp_val            = (1 <<  entry);
  dir_ivalid[index]  |= temp_val;
}
/*--------------------------------------------
slam data inti icm.
index for dcm_array:dcache_rwaddr_e[10:4]
--------------------------------------------*/
void l1warm::slam_l1ddata(KeyType addr, char* data, int num)
{  
  char l1size[18];
  int  parity, idx, word;
  int  addr_idx = ((addr >> 4) & 0x7f);

  avalPtr = dcache_w[way][cpu] + addr_idx * dcache_num * 2;
  bvalPtr = avalPtr + dcache_num;
  parity  = 0;
  idx     = 17;
  //create parity bits
  for(int i = 0 ; i < 16;i++){
    word        = data[num+i];
    l1size[idx] = data[num+i];
    parity     |= (even_parity(word, 8) << (15-i));
    idx--;
  }
  l1size[1] = (parity >> 8) & 0xff;
  l1size[0] = parity & 0xff;
  slam_data(l1size, dcache_num);
}
/*--------------------------------------------
tag: lmq_ld_addr[39:11];
76 75 74 73 72 71 70 69 68 67 66 65 64
12 11 10  9  8  7  6  5  4  3  2  1  0
--------------------------------------------*/
void l1warm::slam_dcache(KeyType addr, char* data, int num)
{
  int addr_idx;
  long long lword;
  //slam l1 dcache
  slam_l1ddata(addr, data, num);
  //tag
  dtag       = (addr >> 11) & 0x1fffffff;
  addr_idx   = ((addr >> 4) & 0x7f);
  addr_idx <<= 2;
  addr_idx  |= way;
 
  avalPtr    = dcache_tag[cpu] + addr_idx * dtag_num * 2;
  bvalPtr    = avalPtr + dtag_num;
  dtag      |= (even_parity(dtag, 29) << 29);
  lword      = dtag;
  slam_data(lword, dtag_num);
  //valid
  find_location(addr_idx, dcache_vld);
  //io_printf(" addr %llx DTAG tag = %x addr_idx %x way=%d\n", addr, dtag, addr_idx, way);
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void l1warm::slam_ddirectory(KeyType addr_tmp)
{  
  int index;
  tag    = (addr_tmp >> 10) & 0x3fffffff;//30 bits
  //make entry index.
  int parity = even_parity(tag, 30);
  //make entry index.
  entry  = (addr_tmp >> 8) & 1;
  entry |= (way << 1);
  entry |= (cpu << 3);
  //get l2 bank
  bank   = (addr_tmp >> 6)  & 0x3;
  col    = (addr_tmp >> 9)  & 0x3;
  //row
  row        = (addr_tmp >> 4) & 0x3;
  index      = bank * BANK_NUM + row * ROW_NUM + col;
  avalPtr    = dir_darray[index] + entry * ddir_num * 2;
  bvalPtr    = avalPtr + ddir_num;
  slam_tag(tag, ddir_num);

  temp_val            = parity ? ( 1 << entry) : 0;
  dir_dparity[index] |= temp_val;
  temp_val            = (1 <<  entry);
  dir_dvalid[index]  |= temp_val;
  // io_printf("DIER addr=%llx entry = %d row = %d col = %d bank = %d index = %d %llx %llx tag %x\n",
  //	    addr_tmp, entry, row, col, bank, index, dir_dparity[index], dir_dvalid[index], dtag);
}
/*--------------------------------------------
slam icache and dcache
data format to dcm:
[32:0] { addr<39:10>, addr<8>, parity, valid}
reg   [29:0]  addr_array[63:0]
dcache:
l1dcache: 16 bytes.

<10 9 8 7 6  5 4>
  ^      ^    ^
  |      |    |
 col    bank  row

index <cpu_id, way, 8> -> 64 entries
icache:
l1icache: 32 bytes
--------------------------------------------*/
void l1warm::slam_ionly(KeyType addr, char* data)
{
  int num, i, j;
  KeyType addr_tmp;
  num   = howmany_cpu();

  for(j = 0; j < num;j++){
    core(j);//which core
    which_way(addr);//which way
    addr_tmp = addr;
    if(l1_debug){
      io_printf("Info: l1icache  slam address %llx\n", addr);
      io_printf("data-->");
      for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
      io_printf("\n");
    }
    for(i = 0; i < 2; i++){
      slam_icache(addr_tmp, data, i * 32);
      slam_idirectory(addr_tmp);
      addr_tmp += 32;
    }
  }
}
/*--------------------------------------------
check range.
--------------------------------------------*/
int l1warm::islam(KeyType addr, char* data)
{
  if(addr >= low_ibound && 
     addr <   up_ibound){
    slam_ionly(addr, data);
    return 1;
  }
  return 0;
}
/*--------------------------------------------
slam dcahe.
--------------------------------------------*/
void l1warm::slam_donly(KeyType addr, char* data)
{
  int num, i, j;
  KeyType addr_tmp;
  num   = howmany_cpu();
  for(j = 0; j < num;j++){
    core(j);//which core
    which_way(addr);//which way
    addr_tmp = addr;
    if(l1_debug){
      io_printf("Info: l1dcache  slam address %llx\n", addr);
      io_printf("data-->");
      for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
      io_printf("\n");
    }
    for(i = 0; i < 4;i++){
      slam_dcache(addr_tmp, data, i * 16);
      slam_ddirectory(addr_tmp);
      addr_tmp += 16;
    }
  }
}
/*--------------------------------------------
check range.
--------------------------------------------*/
int l1warm::dslam(KeyType addr, char* data)
{

  if(addr >= low_dbound && 
     addr <  up_dbound){
    slam_donly(addr, data);
    return 1;
  }
  return 0;
}
/*--------------------------------------------
slam l1 caches
--------------------------------------------*/
int l1warm::slam(KeyType addr, char* data)
{
  int i, num;
  KeyType addr_tmp;
  //common thing
  addr &= 0xffffffffc0;//always 64 bytes aligment.
  tag   = (addr >> 10) & 0x3fffffff;//30 bits

  if(check_irange && islam(addr, data))return 1;
  if(check_drange && dslam(addr, data))return 1;
  if(check_irange == 0  &&  check_drange == 0){
    num   = howmany_cpu();
    for(int j = 0; j < num;j++){
      core(j);//which core
      which_way(addr);//which way
      addr_tmp = addr;
      switch(which_cache()){//which cache
      case 1 ://dcache
	//first 16 bytes
	if(l1_debug){
	  io_printf("Info: l1dcache  slam address %llx\n", addr);
	  io_printf("data-->");
	  for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
	  io_printf("\n");
	}
	for(i = 0; i < 4;i++){
	  slam_dcache(addr_tmp, data, i * 16);
	  slam_ddirectory(addr_tmp);
	  addr_tmp += 16;
	}
	break;
      case 2 ://do icache operation.
	//first 16 bytes
	if(l1_debug){
	  io_printf("Info: l1icache  slam address %llx\n", addr);
	  io_printf("data-->");
	  for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
	  io_printf("\n");
	}
	for(i = 0; i < 2; i++){
	  slam_icache(addr_tmp, data, i * 32);
	  slam_idirectory(addr_tmp);
	  addr_tmp += 32;
	}
	break;
      }
    }
  }
  return 0;
}
