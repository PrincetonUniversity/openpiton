// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: l2warm.cc
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
#include "l2warm.h"
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
l2warm::l2warm()
{
  int i,j;

  tag_num  = 0;
  vuad_num = 0;
  data_num = 0;
  turn_on_valid = 1;
  turn_on_dirty = 0;
  turn_off_dirty= 1;
  err_enjection = 0;
  warm_all      = 0;
  replace       = 0;
  warm          = 0;
  //mark blackboard.
  for(i = 0; i < 12; i++){
    for(j = 0; j < 1024; j++){
      blackboard[0][i][j] = 0;
      blackboard[1][i][j] = 0;
      blackboard[2][i][j] = 0;
      blackboard[3][i][j] = 0;
    }
  }
  for(i = 0; i < 4; i++){
    round_robin[i] = 0;
    last_addr[i]   = 0;
    for(j = 0;j < 1024;j++){
      tag_table[i][j] = 0;
      data_table[i][j] = 0;
    }
   }
  l2run_error   = 0;
  cpu_invalid   = 0;
  uncorrect_err = 0; 
  tag_pend      = 0;
  data_pend     = 0;
  tag_pend_now  = 0;
  data_pend_now = 0;
 
  taken_d       = 0;
  taken_t       = 0;
  not_taken_d   = 0;
  not_taken_t   = 0;
  l2run_percent = 0;
  rcheck_range  = 0;
  cycle         = 0;
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l2warm::set()
{
  int idx, i, j;
  int loc  = 1;//argment should be 1.

  for(bank = 0; bank < 4; bank++){
    for(i = 0; i < TAG; i++){//get tag
      idx = bank * TAG + i;
      tf_nodeinfo(loc, &node_info);
      if(tag_num == 0)tag_num = node_info.node_ngroups;
      tag_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }
    for(i = 0; i < VUAD; i++){//get vuad
      idx = bank * VUAD + i;
      tf_nodeinfo(loc, &node_info);
      if(vuad_num == 0)vuad_num = node_info.node_ngroups;
      vuad_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }
    for(i = 0; i < DDATA; i++){//get data
      idx = bank * DDATA + i;
      tf_nodeinfo(loc, &node_info);
      if(data_num == 0)data_num = node_info.node_ngroups;
      data_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }
  }
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
int l2warm::copy(char* buf, char* cbuf, int idx)
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
long long  l2warm::getEight(char *buf)
{
  int  i;
  long long  key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}
/*--------------------------------------------
get options from command line.
l2range=10000:20000
--------------------------------------------*/
void l2warm::option()
{
  char*  pargs, cbuf[17];
  int idx;

  pargs = mc_scan_plusargs ("l2valid=");
  if(pargs != (char *) 0)turn_on_valid = 1;
  pargs = mc_scan_plusargs ("l2dirty=");
  if(pargs != (char *) 0)turn_on_dirty = 1;
  pargs = mc_scan_plusargs ("l2dirty_off=");
  if(pargs != (char *) 0)turn_off_dirty= 1;
  pargs = mc_scan_plusargs ("err_enjection_on");
  if(pargs != (char *) 0)err_enjection = 1;
  //replace
  pargs = mc_scan_plusargs ("replace_way=");
  if(pargs != (char *) 0)replace = 1;
  //warm all the cache line.
  pargs = mc_scan_plusargs ("warm_all=");
  if(pargs != (char *) 0)warm_all = 1;
  pargs = mc_scan_plusargs ("l2warm=");
  if(pargs != (char *) 0)warm = atoi(pargs);
  pargs = mc_scan_plusargs ("uncorrectable_err=");
  if(pargs != (char *) 0)uncorrect_err = atoi(pargs);
  if(uncorrect_err)err_enjection = 1;
  pargs = mc_scan_plusargs ("l2range=");
  check_range = 0;

  if(pargs != (char *) 0){
    check_range = 1;
    idx = copy(pargs, cbuf, 0);
    up_bound  = getEight(cbuf);
    copy(pargs, cbuf, idx);
    low_bound = getEight(cbuf);
    io_printf("Info:L2warm range %llx:%llx\n", up_bound, low_bound);
  }
  //run time error
  pargs = mc_scan_plusargs ("l2run_error=");
  if(pargs != (char *) 0)l2run_error = 1;
  pargs = mc_scan_plusargs ("l2run_percent=");
  if(pargs != (char *) 0){
    l2run_percent = atoi(pargs);
    io_printf("Info: L2 runtime percent %d\n", l2run_percent);
  }
  pargs = mc_scan_plusargs ("l2run_range=");
  
  if(pargs != (char *) 0){
    rcheck_range = 1;
    idx = copy(pargs, cbuf, 0);
    rup_bound  = getEight(cbuf);
    copy(pargs, cbuf, idx);
    rlow_bound = getEight(cbuf);
    io_printf("Info:L2run_error range %llx:%llx\n", rup_bound, rlow_bound);
  }
}
/*--------------------------------------------
clear vuad array.
not valid, not dirty, not used and not alloc.
--------------------------------------------*/
void l2warm::l2_clear_vuad(int bank)
{

  //for(int bank = 0; bank < BANK; bank++){
  for(int vuad = 0; vuad < VUAD;vuad++){
    int idx = bank * VUAD + vuad;
    for(int size = 0; size < 32;size++){
      avalPtr  = vuad_avalPtr[idx] + size * vuad_num * 2;
      bvalPtr  = avalPtr + vuad_num;
      for(int groups = 0; groups < vuad_num;groups++){
	avalPtr[groups] = 0;
	bvalPtr[groups] = 0;
      }
    }
  }
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l2warm::even_parity(int data, int num)
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
int l2warm::range(int max)
{
  int num = random() & 0xff;
  return num % max;
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
void l2warm::error_enject(char* bits, int low, int high, int parity)
{
  int num;

  if(err_enjection){
    num = range(high - low);
    if(num == parity)num = 0;
    bits[low+num] ^= 1;//flip bit
  }
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
void l2warm::error_enject(int* bits, int low, int high)
{
  int num;

  if(err_enjection){
    num    = range(high - low);
    *bits ^= (1 << num);//flip bit
  }
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
int l2warm::error_enject(int bits)
{
  int num    = range(28);
  bits      ^= (1 << num);//flip bit
  return bits;
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
long long  l2warm::error_enject(long long bits)
{
  int num    = range(38);
  bits      ^= (1 << num);//flip bit
  return bits;
}
/*--------------------------------------------
check parity
--------------------------------------------*/
int l2warm::check_parity(long long bits, int num)
{
  int p = 0;
  for(int i = 0; i < num; i++){
    p     ^= bits & 1;
    bits >>= 1;
  }
  return p;
}
/*--------------------------------------------
check parity
--------------------------------------------*/
int l2warm::check_parity()
{
  char ch;
  int p = 0;
  for(int j = 0; j < 19;j++){
    ch = slam_data[j];
    for(int i = 0; i < 8; i++){
      p     ^= ch& 1;
      ch >>= 1;
    }
  }
  ch = slam_data[19];
  for(int i = 0; i < 4; i++){
      p   ^= ch& 1;
      ch >>= 1;
  }
  return p;
}
/*--------------------------------------------
// This task generates the 7b ECC for a 32b data segment.
// The input is a 32b data segment.
// The output is {1b_parity, 6b_ecc}.
--------------------------------------------*/
int l2warm::decc(int data){
  char d[32], dcc[7];
  int i;

  for(i = 0; i < 32;i++){//unpack
    d[i]   = data & 1;
    data >>= 1;
  }
  // parity bit
  dcc[6] = d[0]  ^ d[1]  ^ d[2]  ^ d[4]  ^ d[5]  ^ d[7]  ^ d[10] ^
           d[11] ^ d[12] ^ d[14] ^ d[17] ^ d[18] ^ d[21] ^ d[23] ^ 
           d[24] ^ d[26] ^ d[27] ^ d[29];
  // ecc bits
  dcc[5] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26];
  dcc[4] = d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^
           d[19] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^
           d[13] ^ d[12] ^ d[11];

  dcc[3] = d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^
           d[19] ^ d[18] ^ d[10] ^ d[9]  ^ d[8]  ^ d[7]  ^
           d[6]  ^ d[5]  ^ d[4];

  dcc[2] = d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^
           d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[10] ^ d[9]  ^ d[8]  ^ 
           d[7]  ^ d[3]  ^ d[2]  ^ d[1];

  dcc[1] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]  ^ d[6]  ^ d[9]  ^ d[10] ^
           d[12] ^ d[13] ^ d[16] ^ d[17] ^ d[20] ^ d[21] ^ d[24] ^ 
           d[25] ^ d[27] ^ d[28] ^ d[31];

  dcc[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]  ^ d[6]  ^ d[8]  ^ d[10] ^
           d[11] ^ d[13] ^ d[15] ^ d[17] ^ d[19] ^ d[21] ^ d[23] ^ 
           d[25] ^ d[26] ^ d[28] ^ d[30];

  //pack binarty to hexa.
  int ecc = 0;
  for(i = 6; i >= 0; i--){
    ecc <<= 1;
    ecc  |= dcc[i];
  }
  return ecc;
}
/*--------------------------------------------
// This function generates the 6b ECC for a 22b tag.

// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
int l2warm::tecc(int tag){
  char t[22], tcc[6];
  int  i;

  //unpack
  for(i = 0; i < 22;i++){
    t[i]  = tag & 1;
    tag >>= 1;
  }
  // parity bit
  tcc[0] = t[0]  ^ t[1]  ^ t[2]  ^ t[4]  ^ t[5]  ^ t[7]  ^ t[10] ^
           t[11] ^ t[12] ^ t[14] ^ t[17] ^ t[18] ^ t[21];
  // ecc bits
  tcc[1] = t[0]  ^ t[1]  ^ t[3]  ^ t[4]  ^ t[6]  ^ t[8]  ^ t[10] ^
           t[11] ^ t[13] ^ t[15] ^ t[17] ^ t[19] ^ t[21];

  tcc[2] = t[0]  ^ t[2]  ^ t[3]  ^ t[5]  ^ t[6]  ^ t[9]  ^ t[10] ^
           t[12] ^ t[13] ^ t[16] ^ t[17] ^ t[20] ^ t[21];

  tcc[3] = t[17] ^ t[16] ^ t[15] ^ t[14] ^ t[10] ^ t[9] ^ t[8] ^
           t[7]  ^ t[3]  ^ t[2]  ^ t[1];

  tcc[4] = t[21] ^ t[20] ^ t[19] ^ t[18] ^ t[10] ^ t[9] ^ t[8] ^
           t[7]  ^ t[6]  ^ t[5]  ^ t[4];

  tcc[5] = t[21] ^ t[20] ^ t[19] ^ t[18] ^ t[17] ^ t[16] ^ t[15] ^
           t[14] ^ t[13] ^ t[12] ^ t[11];
  int ecc = 0;
  for(i = 5; i >= 0; i--){
    ecc <<= 1;
    ecc  |= tcc[i];
  }
  return ecc;
}
/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
void l2warm::slam_value(int num)
{
  for(int groups = 0; groups < num;groups++){
    avalPtr[groups] = slam_data[groups];
    bvalPtr[groups] = 0;
  }
}
/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
int l2warm::used(int vuad)
{
  vuad &= 0xfff;
  //do here
  vuad |= (even_parity(vuad, 12) << 12);
  return vuad;
}
/*--------------------------------------------
initilally, alloc bit reseted.
--------------------------------------------*/
int l2warm::alloc(int vuad)
{
 vuad &= 0xfff;
 //do here
 vuad |= (even_parity(vuad, 12) << 12);
 return vuad;
}
/*--------------------------------------------
turn on the valid bit used the way index.
--------------------------------------------*/
int l2warm::valid(int vuad)
{
  //set valid
  vuad |= (valid_bit << way);
  vuad &= 0xfff;
  vuad |= (even_parity(vuad, 12) << 12);
  return vuad;
}
/*--------------------------------------------
initilally, alloc bit reseted.
--------------------------------------------*/
int l2warm::dirty(int vuad)
{
 vuad &= 0xfff;
 vuad |= (dirty_bit << way);
 //do here
 vuad |= (even_parity(vuad, 12) << 12);
 return vuad;
}
/*--------------------------------------------
unpack char array into binary format.
data layout:
RTL:bit [107:0]
C++:word[0].....word[13]
--------------------------------------------*/
void l2warm::unpack()
{
  char ch;
  int i, j, idx;
 
  idx = 0;
  for(i = 0; i < vuad_num - 1;i++){
    ch = slam_data[i];
    for(j = 0; j < 8;j++){
      vuad_unpk[idx++] = ch & 1;
      ch             >>= 1;
    }
  }
  //process the last 4 bits.
  ch = slam_data[i];
  for(j = 0; j < 4;j++){
    vuad_unpk[idx++] = ch & 1;
    ch             >>= 1;
  }
}
/*--------------------------------------------
pack binary format to char foramy.
--------------------------------------------*/
void l2warm::pack()
{
  char ch;
  int i, j, idx;
 
  idx = 0;
  for(i = 0; i < vuad_num - 1;i++){
    ch = 0;
    for(j = 0; j < 8;j++)ch |= vuad_unpk[idx++] << j;
    slam_data[i] = ch;
  }
  ch  = 0;
  for(j = 0; j < 4;j++)ch |= vuad_unpk[idx++] << j;
  slam_data[i] = ch;
}
/*--------------------------------------------
{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}
--------------------------------------------*/
void l2warm::extract_vuad(int vuad_idx)
{
  int i;

  low_vuad = 0;
  for(i  = 48; i >= 0;i -= 4){//get alloc and dirty.
    low_vuad <<= 1;
    low_vuad  |= vuad_unpk[i + vuad_idx];
  } 
  up_vuad = 0;
  for(i  = 100; i >= 52;i -= 4){//get used and valid
    up_vuad <<= 1;
    up_vuad  |= vuad_unpk[i + vuad_idx];
  } 
}
/*--------------------------------------------
{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}
--------------------------------------------*/
void l2warm::integrate_vuad(int vuad_idx)
{
  int i;

  for(i  = 0; i < 52;i += 4){//get alloc and dirty.
    vuad_unpk[i + vuad_idx] = low_vuad & 1;
    low_vuad              >>= 1;
  } 
  for(i  = 52; i < 104;i += 4){//get used and valid
   vuad_unpk[i + vuad_idx] = up_vuad & 1;
   up_vuad >>= 1;
  } 
}
/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
void l2warm::updated_ua(int idx, int vuadarray, int vuad)
{
  //get the pointer of ua
  avalPtr = vuad_avalPtr[idx]  + vuadarray * vuad_num * 2;
  bvalPtr = avalPtr + vuad_num;
  //read vuad data.
  //used and alloc data field
  for(int groups = 0; groups < vuad_num;groups++)slam_data[groups] = avalPtr[groups];
  unpack();
  extract_vuad(vuad);
  //modify fields.
  up_vuad  = used(up_vuad);
  low_vuad = alloc(low_vuad);
  integrate_vuad(vuad);
  pack();
  slam_value(vuad_num);
}
/*--------------------------------------------
set valid/dirty bit randomly.
vuadarray is index of 32 array.

--------------------------------------------*/
void l2warm::updated_vd(int idx, int vuadarray, int vuad)
{
  //valid and dirty data field
  avalPtr = vuad_avalPtr[idx+8] + vuadarray * vuad_num * 2;
  bvalPtr = avalPtr + vuad_num;
  //get 108 bits.
  //ascending order.
  for(int groups = 0; groups < vuad_num;groups++)slam_data[groups] = avalPtr[groups];
  unpack();//unpacke hexa to binary
  extract_vuad(vuad);
  //modify fields.
  up_vuad  = valid(up_vuad);
  low_vuad = dirty(low_vuad);  
  integrate_vuad(vuad);
  pack();
  slam_value(vuad_num);
}
/*--------------------------------------------
layout:
{cache_data_out_c5[31:0],   cache_ecc_out_c5[6:0]}     = cache_decc_out_c5[38:0];
{cache_data_out_c5[63:32],  cache_ecc_out_c5[13:7]}    = cache_decc_out_c5[77:39];
{cache_data_out_c5[95:64],  cache_ecc_out_c5[20:14]}   = cache_decc_out_c5[116:78];
{cache_data_out_c5[127:96], cache_ecc_out_c5[27:21]}   = cache_decc_out_c5[155:117];

{cache_data_out_c5[159:128], cache_ecc_out_c5[34:28]}  = cache_decc_out_c5[194:156];
{cache_data_out_c5[191:160], cache_ecc_out_c5[41:35]}  = cache_decc_out_c5[233:195];
{cache_data_out_c5[223:192], cache_ecc_out_c5[48:42]}  = cache_decc_out_c5[272:234];
{cache_data_out_c5[255:224], cache_ecc_out_c5[55:49]}  = cache_decc_out_c5[311:273];

{cache_data_out_c5[287:256], cache_ecc_out_c5[62:56]}  = cache_decc_out_c5[350:312];
{cache_data_out_c5[319:288], cache_ecc_out_c5[69:63]}  = cache_decc_out_c5[389:351];
{cache_data_out_c5[351:320], cache_ecc_out_c5[76:70]}  = cache_decc_out_c5[428:390];
{cache_data_out_c5[383:352], cache_ecc_out_c5[83:77]}  = cache_decc_out_c5[467:429];

{cache_data_out_c5[415:384], cache_ecc_out_c5[90:84]}   = cache_decc_out_c5[506:468];
{cache_data_out_c5[447:416], cache_ecc_out_c5[97:91]}   = cache_decc_out_c5[545:507];
{cache_data_out_c5[479:448], cache_ecc_out_c5[104:98]}  = cache_decc_out_c5[584:546];
{cache_data_out_c5[511:480], cache_ecc_out_c5[111:105]} = cache_decc_out_c5[623:585];

data:unpack ascending order.
--------------------------------------------*/
void l2warm::adjust_data()
{
  char ch, unpk[156], temp[128];
  int i, j;

  //unpack 
  int idx = 0;
  for(i = 15; i >= 0; i--){
    ch = l1line[i];
    for(j = 0; j < 8;j++){
      temp[idx++] = ch & 1;
      ch        >>= 1;
    }
  }
  //insert ecc into data.
  ch  = ecc[0];//first four bytes
  idx = 124;
  for(i = 96;i < 128;i++)unpk[idx++] = temp[i];
  for(i = 117; i < 124;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }
  error_enject(unpk, 117, 155, 6);
  //the second four bytes
  ch  = ecc[1];
  idx = 85;
  for(i = 64;i  < 96;i++)unpk[idx++] = temp[i];
  for(i = 78; i < 85;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }
  error_enject(unpk, 78, 116, 6);
  //the third four bytes
  ch  = ecc[2];
  idx = 46;
  for(i = 32;i < 64;i++)unpk[idx++] = temp[i];
  for(i = 39; i < 46;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }
  error_enject(unpk, 39, 77, 6);
  //last 4 bytes
  ch  = ecc[3];
  idx = 7;
  for(i = 0;i < 32;i++)unpk[idx++] = temp[i];
  for(i = 0;i < 7;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }  
  error_enject(unpk, 0, 38, 6);

  if(uncorrect_err){//flip bit
    switch(range(4)){
    case 0 :
      error_enject(unpk, 117, 155, 6);
      break;
    case 1 :
      error_enject(unpk, 78, 116, 6);
      break;
    case 2 :
      error_enject(unpk, 39, 77, 6);
      break;
    case 3 :
      error_enject(unpk, 0, 38, 6);
      break;
    }
  }
  //pack binaray data to hexa
  idx = 0;
  for(i = 0; i < 19;i++){
    slam_data[i] = 0;
    for(j = 0; j < 8; j++)slam_data[i] |= unpk[idx++] << j;
  }
  slam_data[i] = 0;
  for(j = 0; j < 4; j++)slam_data[i] |= unpk[idx++] << j;
}
/*--------------------------------------------
slam data into data array.
index          :address[17:8]
sub bank select:address<5:4>->the same as l1 cache size
way            :12
sub-bank includes:
block_5 : way_sel[1:0]
block_4 : way_sel[3:2]
........
block_4 : way_sel[11:10]
--------------------------------------------*/
void l2warm::slam_real_data(char* data)
{
  int l1bank, fbyte[4], i, sub;
  int idx  = bank * DDATA;//place the pointer on the target bank.
  int didx = 0;//start from the first byte

  for(l1bank = 3; l1bank >= 0;l1bank--){//process data by l1 cache size
    //get 16 bytes
    for(i = 0;i < 16; i++){      
      l1line[i]      = data[didx++];
      fbyte[i / 4] <<= 8;
      fbyte[i / 4]  |= l1line[i] & 0xff;

    }
    for(i = 0; i < 4;i++)ecc[i] = decc(fbyte[i]);
    adjust_data();
    sub     = 3-subbank;
    avalPtr = data_avalPtr[idx + sub * SUBBANK + way] + index * data_num * 2;
    bvalPtr = avalPtr + data_num;
    slam_value(data_num);
    subbank++;
    if(subbank == 4)subbank = 0;
    
  }
}
/*--------------------------------------------
slam vuad into vuad array.
vuad memory:[107:0] vuad [31:0]

ua->51:26                            valid           dirty   
  <51-39>         <38-26>           <25-13>          <12-0>
{parity, 11-0} {parity, 11-0}   {parity, 11- 0} {parity, 11- 0}
array0:                          array8:
array1:                          array9:
array2:                          array10:
array3:                          array11:
array4:                          array12:
array5:                          array13:
array6:                          array14:
array7:                          array15:

layout of vuad:
index[9:8]  ->be used as an index of vuad.
index[14:10]->be used as an index of vuad array.
index[17:15]->be used as an index of subarray.
{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}
--------------------------------------------*/
void l2warm::slam_vuad()
{
  //generate the subsript for vuad access based on index.
  int subarray  = (index >> 7) & 0x7;//8 inq_arry
  int vuadarray = (index >> 2) & 0x1f;//32 array
  int vuad      = index & 0x3;//4 words
  int idx       = bank * VUAD + subarray;
  int vd        = random() & 3;

  valid_bit = vd & 1;
  dirty_bit = (vd >> 1) & 1;
  if(turn_on_valid)valid_bit  = 1;
  if(turn_on_dirty)dirty_bit  = 1;
  if(turn_off_dirty)dirty_bit = 0;
  if(!valid_bit && !dirty_bit)valid_bit = 1;
  updated_vd(idx, vuadarray, vuad);
}
/*--------------------------------------------
slam tag into tag array.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm::slam_tag()
{
  int idx  = bank * TAG + way;
  avalPtr  = tag_avalPtr[idx] + index * tag_num * 2;
  bvalPtr  = avalPtr + tag_num;

  //compute the tag ecc.
  tag_data = tag << 6 | tecc(tag);
  error_enject(&tag_data, 1, 25);
  //  tag_data ^= 0x1fffffff;//make inverse
  for(int groups = 0; groups < tag_num;groups++){
    avalPtr[groups] = tag_data & 0xff;
    bvalPtr[groups] = 0;
    tag_data      >>= 8;
  }
}
/*------------------------------------------
main routine of l2 warm
slam tag, data, vuad into rtl.
l1bank[5:4]
l2bank[7:6]
index[17:8]
tag[39:18]
--------------------------------------------*/
bool l2warm::slam(KeyType addr, char* data)
{  
  if(check_range == 0 || 
     check_range && (addr < up_bound) && (addr >= low_bound)){
    addr &= 0xffffffffc0;
    //generate the variables of l2 cache.
    bank     = (int)((addr >> 6)  & 0x3);//l2bank 
    index    = (int)((addr >> 8)  & 0x3ff);
    tag      = (int)((addr >> 18) & 0x3fffff);
    subbank  = (int)((addr >> 4)  & 0x3); //l1 bank
 
    if(replace){
      way = round_robin[bank]++;
      if(way > 11){//round robin way
	way               = 0;
	round_robin[bank] = 0;
      }
    }
    else{
      way = random() & 0xf;
      way = way > 11 ? random() & 3 : way;
    }
    //slam start here
    blackboard[bank][way][index] = 1;
    slam_tag(); //process tag
    slam_vuad();//process vuad
    slam_real_data(data);//process data
    last_addr[bank] = addr;
    if(valid_bit & dirty_bit){
      //save address
      addr_ptr       = (addr_record_ptr)malloc(sizeof(struct addr_record));
      addr_ptr->addr = addr;
      addr_list[bank].append(addr_ptr);
    }
    if(valid_bit)return 1;
  }
  return 0;
}
/*------------------------------------------
warm cache line which is not in mem.image
--------------------------------------------*/
void l2warm::warm_all_cache(b_tree_node_ptr* mem)
{
  b_tree_atom_ptr  data;//b-tree node.
  KeyType          mask_addr;
  char             rdata[64];

  for(int i= 0; i < 4;i++){
    while(1){
      last_addr[i] += (KeyType)1 << 18;
      mask_addr = (last_addr[i] >> 6) & 0x3ffffffff;
      data      = b_Find(mem, &mask_addr);
      if(data == 0){
	warm_tag[i] = (int)((last_addr[i] >> 18) & 0x3fffff);
	break;
      }
    }
  }
  turn_on_dirty = 1;//on dirty bit.
  for(bank = 0; bank < 4; bank++){
    tag = warm_tag[bank];
    for(way = 0; way < 12;way++){
      for(index = 0; index < 1024; index++){
	subbank = 0;
	if(blackboard[bank][way][index])continue;
	for(int i = 0; i < 64;i++)rdata[i] = random() & 0xff;
	slam_tag(); //process tag
	slam_vuad();//process vuad
	slam_real_data(rdata);//process data
      }
    }
  }
}
/*------------------------------------------
how percent.
 --------------------------------------------*/
int l2warm::percent(int& taken, int& not_taken)
{

  if(l2run_percent == 0)return 1;
  int num = range(100);
  int ret = 1;
  if(num > l2run_percent){//not taken
    if(not_taken == (100 -  l2run_percent)){
      taken++;
    }
    else{
      ret = 0;
      not_taken++;
    }
  }
  else{
    if(taken == l2run_percent){
      not_taken++;
      ret = 0;
    } 
    else{
      taken++;
    }
  }
  if((taken + not_taken) == 100){
    taken     = 0;
    not_taken = 0;
  }
  return ret;
}
/*------------------------------------------
dynamicaly inject error int l2 tag or data.
1). tag wenable, 1 bit
2). tag index    10 bits
3). tag way ->2'b10:way0, 2'b10:way1 2bits
 --------------------------------------------*/
void l2warm::l2_tag_update( int loc)
{
  long long pos;
  int idx, tidx, num;

  if(percent(taken_t, not_taken_t)){
    for(idx = 0; idx < 6;idx++){
      if((wren & 1) && (way & 3))break;
      wren >>= 1;
      way  >>= 2;
    }
    way &= 3;
    pos  = get_long(loc+1);//arg 2 index
    tidx = (pos >> (idx * 10)) & 0x3ff;//get memory index
    tag_pend      |= (1 << bank);
    tag_pidx[bank] = tidx;
    tag_pos[bank]  = (idx << 1) + loc + 3;//arg 4
    if(way & 2)tag_pos[bank]++;
 
    if((tag_pend_now & (1 << bank))          &&
       (tag_pidx[bank] == tag_pidx_now[bank])&&
       (tag_pos[bank]  == tag_pos_now[bank] ))tag_pend_now ^= (1 << bank);
  }
}
/*--------------------------------------------
slam tag into tag array with dynamic error injection.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm::slam_tag_error()
{
  int groups, err;
  int pos;

  for(bank = 0; bank < 4; bank++){
    index = tag_pidx_now[bank];
    pos   = tag_pos_now[bank] - (bank * 71 + 4); 
    if(!(tag_pend_now & ( 1 << bank)) || pos > 11 || pos < 0){
      if(pos > 11 || pos < 0){
	io_printf("(%d):Info PLI Argment error(%d) bank(%d)\n", tf_gettime(), pos, bank);
      }
      continue;
    }
    tf_nodeinfo(tag_pos_now[bank] , &node_info);
    avalPtr  = node_info.node_value.memoryval_p + index * tag_num * 2;
    bvalPtr  = avalPtr + tag_num;
    tag_data = 0;
    for(groups = tag_num - 1; groups >= 0;groups--){
      tag_data <<= 8;
      tag_data  |= avalPtr[groups] & 0xff;
    } 
    tag_data &= 0xfffffff;
    if(check_parity(tag_data, 28))continue;
    err = error_enject(tag_data);
    io_printf("Info(%0d): L2_Tag error injection L2_bank(%d) way(%d) index(%d)  original_tag(%x) after_tag(%x)\n",
	      tf_gettime(), bank, pos, index, tag_data, err);

    for(groups = 0; groups < tag_num;groups++){
      avalPtr[groups] = err & 0xff;
      bvalPtr[groups] = 0;
      err           >>= 8;
    }
  }
  tag_pend_now = 0;
}
/*------------------------------------------
dynamicaly inject error int l2 tag or data.
4). data subbank0:wenable 2'b01:way0_decc, 2'b10:way1_decc
5). data subbank0:index
 --------------------------------------------*/
void l2warm::l2_data_update(int wren, int loc)
{
  long long pos;
  int idx, way;
  if(percent(taken_d, not_taken_d)){
    pos  = get_long(loc+1);
    for(idx = 0; idx < 6;idx++){
      if(wren & 3)break;
      wren >>= 2;
      pos  >>= 10;
    }
    data_pend      |= (1 << bank);
    data_pidx[bank] = pos & 0x3ff;
    data_pos[bank]  = (idx << 1) + loc + 3;//
    if(wren & 2)tag_pos[bank]++;
    if((data_pend_now & (1 << bank))            &&
       (data_pidx[bank] == data_pidx_now[bank])&&
       (data_pos[bank]  == data_pos_now[bank] ))data_pend_now ^= (1 << bank);
  }
}
/*--------------------------------------------
slam tag into tag array with dynamic error injection.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.

{cache_data_out_c5[31:0],   cache_ecc_out_c5[6:0]}     = cache_decc_out_c5[38:0];
{cache_data_out_c5[63:32],  cache_ecc_out_c5[13:7]}    = cache_decc_out_c5[77:39];
{cache_data_out_c5[95:64],  cache_ecc_out_c5[20:14]}   = cache_decc_out_c5[116:78];
{cache_data_out_c5[127:96], cache_ecc_out_c5[27:21]}   = cache_decc_out_c5[155:117];
groups0[4:0] {38, 37, 36, 35, 34, 33, 32}
groups1[9:5] {77, 76, 75, 74, 73, 72}
groups2[15:10]
groups3[19:16]
--------------------------------------------*/
void l2warm::slam_data_error()
{
  int groups, idx, elapse;

  for(bank = 0; bank < 4; bank++){
    if(!(data_pend_now & ( 1 << bank)))continue;
     tf_nodeinfo(data_pos_now[bank] , &node_info);
     index    = data_pidx_now[bank]; 
     if(1){
       avalPtr  = node_info.node_value.memoryval_p + index * data_num * 2;
       bvalPtr  = avalPtr + data_num;
       for(groups = tag_num - 1; groups >= 0;groups--)slam_data[groups] = avalPtr[groups];
       if(check_parity())continue;
       switch(range(4)){
       case 0 :
	 temp_val = slam_data[4] & 0x7f;
	 for(idx = 3; idx >= 0;idx--){
	   temp_val <<= 8;
	   temp_val  |= slam_data[idx] & 0xff;
	 }
	 if(!check_parity(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), bank, data_way_now[bank], data_pidx_now[bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val = error_enject(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   for(idx = 0; idx < 4;idx++){
	     slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   slam_data[4] &= 0x80;
	   slam_data[4] |= temp_val & 0x7f;
	 }
	 break;
       case 1 :
	 temp_val = slam_data[9] & 0x3f;
	 for(idx = 8; idx >= 5;idx--){
	   temp_val <<= 8;
	   temp_val  |= slam_data[idx] & 0xff;
	 }
	 temp_val <<= 1;
	 temp_val  |= slam_data[4] & 0x80 ? 1 : 0;
	 if(!check_parity(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), bank, data_way_now[bank], data_pidx_now[bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = error_enject(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   slam_data[4] &= 0x7f;
	   slam_data[4] |= temp_val & 1 ? 0x80 : 0;
	   temp_val    >>= 1;
	   for(idx = 5; idx < 10;idx++){
	     slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   slam_data[9] &= 0xc0;
	   slam_data[9] |= temp_val & 0x3f;
	 }
	 break;
       case 2:
	 temp_val = slam_data[14] & 0x1f;
	 for(idx = 13; idx >= 10;idx--){
	   temp_val <<= 8;
	   temp_val  |= slam_data[idx] & 0xff;
	 }
	 temp_val <<= 2;
	 temp_val  |= (slam_data[9] >> 6) & 3;
	 if(!check_parity(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), bank, data_way_now[bank], data_pidx_now[bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = error_enject(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   slam_data[9] &= 0x3f;
	   slam_data[9] |= ((temp_val & 3) << 6);
	   temp_val >>= 2;
	   for(idx = 10; idx < 14;idx++){
	     slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   slam_data[14] &= 0xe0;
	   slam_data[14] |= temp_val & 0x1f;
	 }
	 break;
       case 3 :
	 temp_val = slam_data[19] & 0xf;
	 for(idx = 18; idx >= 15;idx--){
	   temp_val <<= 8;
	   temp_val  |= slam_data[idx] & 0xff;
	 }
	 temp_val <<= 3;
	 temp_val |= (slam_data[14] >> 5) & 7;
	 if(!check_parity(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), bank, data_way_now[bank], data_pidx_now[bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = error_enject(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   slam_data[14] &= 0x1f;
	   slam_data[14] |= ((temp_val & 7) << 5);
	   for(idx = 15; idx < 19;idx++){
	     slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   slam_data[19] |= temp_val & 0xf;
	 }
	 break;
       }
       //slam
       for(groups = tag_num - 1; groups >= 0;groups--){
	  avalPtr[groups] = slam_data[groups];
	 bvalPtr[groups] = 0;
       }
     }
  }
  data_pend_now = 0;
}
/*------------------------------------------
  inject error.
 --------------------------------------------*/
void l2warm::error_enject()
{
  int sub;
  int loc = 1;
  // save the previous write to avoid the confliction between
  // the current and the previous update.

  if(tag_pend){
    tag_pend_now = tag_pend;
    for(sub = 0; sub < 4; sub++){
      tag_pidx_now[sub] = tag_pidx[sub];
      tag_pos_now[sub]  = tag_pos[sub]; 
    }
    tag_pend = 0;
  }
  if(data_pend){
    data_pend_now = data_pend;
    for(sub = 0; sub < 4; sub++){
      data_pidx_now[sub] = data_pidx[sub];
      data_pos_now[sub]  = data_pos[sub];
      data_way_now[sub]  = data_way[sub];
    }
    data_pend = 0;
  }

  //Are there Tag or data updated?
  for(bank = 0; bank < BANK; bank++){
    wren = tf_getp(loc);//arg 1
    way  = tf_getp(loc+2);//arg 3 way
    if(wren && way)l2_tag_update(loc);//arg 1
    loc   += 15;//move loc to data. arg 16
    for(sub = 0; sub < 4; sub++){//16
      if(tf_getp(loc))l2_data_update(tf_getp(loc), loc);//pass 16
      loc += 14;//30
    }
  }

  if(tag_pend_now)slam_tag_error();
  if(data_pend_now)slam_data_error();
}
/*------------------------------------------
invalidate icache
--------------------------------------------*/
void l2warm::clean_reg(int loc)
{

#ifdef USE_ACC
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  delay_s.model = accNoDelay;
  char* outdata = new char[10];
#endif

  int groups;

#ifdef USE_ACC
    sprintf(outdata,"0");
    acc_initialize();
    tmphandle = acc_handle_tfarg(loc);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);

#else
  tf_nodeinfo(loc, &node_info);
  for(groups = 0; groups < node_info.node_ngroups ; groups++){
      node_info.node_value.vecval_p[groups].avalbits = 0;
  }
  tf_propagatep(loc);
#endif
}
/*--------------------------------------------
slam tag into tag array.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm::get_tag()
{
  int idx  = bank * TAG + way;
  avalPtr  = tag_avalPtr[idx] + index * tag_num * 2;
  bvalPtr  = avalPtr + tag_num;
  tag_data = 0;
  for(int groups = tag_num - 1; groups >= 0;groups--){
    tag_data <<= 8;
    tag_data  |= avalPtr[groups] & 0xff;
  }
  tag >>= 6;//6bit ecc
  tag  &= 0x3ffff;//22 bit
}
/*--------------------------------------------
pack 4 bytes.
--------------------------------------------*/
void l2warm::pack_4bytes(int idx, char* unpk){

  int i, j;

  for(i = 0; i < 4; i++){
    staledata[stale_idx] = 0;
    for(j = 0; j < 8; j++){
      staledata[stale_idx] <<= 1;
      staledata[stale_idx]  |= unpk[idx--];
    }
    stale_idx++;
  }
}
/*--------------------------------------------
pack 16 bytes.
--------------------------------------------*/
void l2warm::pack_data(char* unpk)
{
  pack_4bytes(155, unpk);
  pack_4bytes(116, unpk);
  pack_4bytes(77, unpk);
  pack_4bytes(38, unpk);
}
/*--------------------------------------------
read data from scdat.
--------------------------------------------*/
void l2warm::get_data()
{
  int l1bank,i, j, pkidx, groups ;
  int idx  = bank * DDATA;//place the pointer on the target bank.
  char ch, unpk[156];
  
  stale_idx = 0;
  for(l1bank = 3; l1bank >= 0;l1bank--){//process data by l1 cache size
    avalPtr = data_avalPtr[idx + l1bank * SUBBANK + way] + index * data_num * 2;
    pkidx   = 0;
    for(groups = 0; groups < data_num;groups++){
      ch  = avalPtr[groups];
      for(j = 0; j < 8;j++){
	unpk[pkidx++] = ch & 1;
	ch          >>= 1;
      }
    }
    pack_data(unpk);
  }
}
/*-------------------------------------------------------------------------------
 get 64 bits.
--------------------------------------------------------------------------------*/
long long l2warm::get_long(int loc){
  int       low, high;
  long long val;

  low  = tf_getlongp(&high, loc);
  val   = high;
  val <<= 32;
  val  |= low;
  return val;
}
/*------------------------------------------
l2bank[7:6]
index[17:8]
tag[39:18]
--------------------------------------------*/
void l2warm::gen_addr()
{
  mask_addr  = 0;
  mask_addr |= tag   << 18;
  mask_addr |= index << 8;
  mask_addr |= bank  << 6;
}
/*------------------------------------------
invalidate cache.
--------------------------------------------*/
void l2warm::l2_invalidate(int bank)
{
//generate the subsript for vuad access based on index.
  int subarray, vuadarray, vuad, idx;

  this->bank = bank;
  for(index = 0; index < INDEX; index++){
    subarray  = (index >> 7) & 0x7;
    vuadarray = (index >> 2) & 0x1f;//32 array
    vuad      = index & 0x3;//4 words
    idx       = bank * VUAD + subarray;
    //valid and dirty data field
    avalPtr = vuad_avalPtr[idx+8] + vuadarray * vuad_num * 2;
    bvalPtr = avalPtr + vuad_num;
    //get 108 bits.
    //ascending order.
    for(int groups = 0; groups < vuad_num;groups++)slam_data[groups] = avalPtr[groups];
    unpack();//unpack hexa to binary
    extract_vuad(vuad);
    for(way = 0; way < WAY; way++){
      if((up_vuad & 1) && (low_vuad & 1)){
	get_tag();
	get_data();
	gen_addr();	  
	write_dram_call(&mask_addr, staledata);
	}
      up_vuad  >>= 1;
      low_vuad >>= 1;
    }
  }
  //after writeback
  l2_clear_vuad(bank);
}
/*------------------------------------------
enject error during run time.
--------------------------------------------*/
void l2warm::l1_invalidate(int ivld, int dvld, int cpu)
{
  clean_reg(dvld);
  clean_reg(ivld);
  //mark uninvalid cpu.
  cpu_invalid ^= 1 << cpu;
  io_printf("%0d:Info Invalidated L1cache core(%0d)\n",tf_gettime(), cpu);
}
/*------------------------------------------
When l2_bypass is deasserted, slam dram memory.
--------------------------------------------*/
void l2warm::stale_data(int loc)
{
  int i;
  bank     = tf_getp(loc);
  addr_ptr = addr_list[bank].shift();

  while(addr_ptr){
    mask_addr = addr_ptr->addr;
    for(i = 0; i < 64;i++)staledata[i] = random() & 0xff;
    write_dram_call(&mask_addr, staledata);
    addr_ptr = addr_list[bank].shift();
  }
}
