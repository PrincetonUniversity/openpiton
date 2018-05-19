// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mem.c
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
/*******************************************************************************
    mem_pli.c
********************************************************************************
Memory Read, write, init, dump;
handle = $mem_inst(filename);
$mem_read(handle, read_data, bank, way);
$mem_write(handle, write_data, bank, way);
$mem_dump(handle, filename);
vcs +mon0=cpu0:25 +mon1=ccx:10 +diserr=cerr:uerr +diswarn=abc:xyz
*/
#ifndef _MEM_H_
#define _MEM_H_

// #define J_DEBUG 1

#include "veriuser.h"
#include "acc_user.h"
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include "utility.h"

// define constants or symbolic variables
#define  INIT_MEM_ARG 2
#define  BUFFER       1024
#define  I_BUFFER     256
#define  BANK         7
#define  SHIFT_NUMBER 9
#define  ADDRESS      8
#define  TAG_ECC      6
avl_node_ptr search_node(avl_node_ptr* t_ptr, long long* addr);
//define global variable 
static int slam_val;
static int dram_type;
static avl_conf_ptr dram_tree;
int ch2;
/*-------------------------------------------------------------------------------
  create ecc data.
--------------------------------------------------------------------------------*/
void hamming(char *word,
	     char *ecc){

  int count, multc, tmpicount,  multresult, mult_count, tmpcount,
      divresult, divc, upper_test, parity1, parity2, parity3, parity4;
  int primitive;
  char ch;
  char hword[32];
  primitive = 0x13;//0b010011;
  parity1 = 0;
  parity2 = 0;
  parity3 = 0;
  parity4 = 0;
 
  /*
  primitive = 0x11d;//0b0100011101;
  for (count = 0; count < 16; count++) {
    multresult = 0;
    for (multc = 0; multc < 8; multc++) {
      tmpicount = ((word[count] >> multc) & 1);
      if (tmpicount == 1) {
	multresult = multresult ^ ((count + 1) << multc);
      }
    }
    divresult = multresult;
    for (divc = 0; divc < 8; divc++) {
      upper_test = divresult & 0xff00;//0b1111_1111_1111_0000_0000;
      if (upper_test != 0) {
	tmpicount = ((divresult >> (15 - divc)) & 1);
	if (tmpicount == 1) {
	  divresult = divresult ^ (primitive << (7 - divc));
	}
      }
    }
    parity0 = parity0 ^ divresult;
  }
  for (count = 0; count < 16; count++) {
    parity1 = parity1 ^ (word[count] & 0xff);    
  }
  ecc[1] = (parity0 >> 4 ) & 0xf;
  ecc[0] = (parity0)       & 0xf;
  ecc[3] = (parity1 >> 4 ) & 0xf;
  ecc[2] = (parity1)       & 0xf;
  */


  for (count = 0; count < 16; count++) {
    hword[31 - count*2-1]   = word[count] & 0xf;  
    hword[31 - count*2]     = (word[count] >> 4) & 0xf;  
  }
  for (count = 0; count != 32; count++) {
    if (count != 30) {
      multresult = 0;
      if (count > 14) { 
	if (count == 31) {
	  mult_count = 0;
	} else {
	  mult_count = count - 15;
        }
      } else {
	mult_count = count;
      }
      for (multc = 0; multc != 4; multc++) {
        tmpicount = ((hword[count] >> multc) & 1);
        if (tmpicount == 1) {
          multresult = multresult ^ ((mult_count + 1) << multc);
        }
      }
      divresult = multresult;
      for (divc = 0; divc != 4; divc++) {
        upper_test = divresult & 0xffff0; //0b1111_1111_1111_1111_0000;
        if (upper_test != 0) {
          tmpcount = ((divresult >> (7 - divc)) & 1);
          if (tmpcount == 1) {
            divresult = divresult ^ (primitive << (3 - divc));
          }
        }
      }
      parity1 = parity1 ^ divresult;
    } // if
  }
  for (count = 0; count != 15; count++) {
    parity2 = parity2 ^ hword[count];	
  }
  parity2 = parity2 ^ hword[30] ^ hword[31];
  for (count = 15; count != 32; count++) {
    parity3 = parity3 ^ hword[count];   
  }
  for (count = 0; count != 31; count++) {
      multresult = 0;
        if (count == 0 || count == 15 || count == 30 ) { mult_count = 0; }
        if (count == 1 || count == 16) { mult_count = 8; }
        if (count == 2 || count == 17) { mult_count = 13; }
        if (count == 3 || count == 18) { mult_count = 12; }
        if (count == 4 || count == 19) { mult_count = 10; }
        if (count == 5 || count == 20) { mult_count = 6; }
        if (count == 6 || count == 21) { mult_count = 5; }
        if (count == 7 || count == 22) { mult_count = 14; }
        if (count == 8 || count == 23) { mult_count = 1; }
        if (count == 9 || count == 24) { mult_count = 11; }
        if (count == 10 || count == 25) { mult_count = 4; }
        if (count == 11 || count == 26) { mult_count = 9; }
        if (count == 12 || count == 27) { mult_count = 3; }
        if (count == 13 || count == 28) { mult_count = 2; }
        if (count == 14 || count == 29) { mult_count = 7; }

      for (multc = 0; multc != 4; multc++) {
        tmpicount = ((hword[count] >> multc) & 1);
        if (tmpicount == 1) {
          multresult = multresult ^ ((mult_count + 1) << multc);
        }
      }
      divresult = multresult;
      for (divc = 0; divc != 4; divc++) {
        upper_test = divresult & 0xffff0; //0b11111111111111110000;
        if (upper_test != 0) {
          tmpcount = ((divresult >> (7 - divc)) & 1);
          if (tmpcount == 1) {
            divresult = divresult ^ (primitive << (3 - divc));
          }
        }
      }
      parity4 = parity4 ^ divresult;
  }
  ecc[1] = (parity1) & 0xf;
  ecc[0] = (parity2) & 0xf;
  ecc[3] = (parity3) & 0xf;
  ecc[2] = (parity4) & 0xf;
}
/*-------------------------------------------------------------------------------
 syndrome regenerated from hamming syndrome by XORing address parity.
--------------------------------------------------------------------------------*/
void addr_parity(char* data, long long addr, char* ecc, int start_bit,int ch2)
{
  int i; 
  char parity, addr_parity;
  addr_parity = 0;

#ifdef J_DEBUG
  io_printf("Info_J: (addr_parity) addr=%llx, start=%d, ch2=%d\n", addr, start_bit, ch2);
  io_printf("Info_J: - data=%x ", *data);
#endif
  /*io_printf("READ addr %llx and addr_parity %x \n", addr, addr_parity);*/
  //addr  >>= (8-start_bit);
  addr  >>= (8-(start_bit+ch2));
  //for(i = 0; i < (40-8));i++){
  for(i = 0; i < (40-(8-ch2));i++){
    addr_parity = addr_parity ^ (addr & 1);
    addr  >>= 1;
  }
  parity = addr_parity;
  for(i = 1; i < 8;i++){
    parity <<=1;
    parity = parity | addr_parity;
  }
  ecc[1] = (data[1] ^ parity) & 0xf; 
  ecc[0] = (data[0] ^ parity) & 0xf;
  ecc[3] = (data[3] ^ parity) & 0xf;
  ecc[2] = (data[2] ^ parity) & 0xf;
#ifdef J_DEBUG
  io_printf(", ecc=%x, parity=%x (%x)\n", *ecc, parity, addr_parity);
#endif
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
int check_at_symbol(char *buf, long long *addr, int *idx){
  int  i;
  *idx = 0;//for zero_bytes
  for(i = 0; buf[i] != '\0'; i++)
    if(buf[i] == '/'){
      *idx = i;
      for(i = i-1; i >= 0;i--)if(buf[i] >= '0' && buf[i] <= '9'){
        buf[i+1] = '\0';
        break;
      }
      break;
    }
  for(i = 0; buf[i] != '\0'; i++){
    if(buf[i] == '@'){
      i++;
      *addr = ato_long(buf, &i);
      return 1;
    }
  }
  return 0;
}

/*-------------------------------------------------------------------------------
   configure memory(address(bits) x datawidth(bits)).
--------------------------------------------------------------------------------*/
int config_mem_call(){
  int addr;
  unsigned int handle;
  avl_conf_ptr a_tree;

  if(tf_nump() < 2){
    tf_error("$config_mem_call requires at least two  arguments(address, data-width).");
    tf_dofinish();
  }
  a_tree              = (avl_conf_ptr)malloc(sizeof(struct avl_conf_node));
  a_tree->addr        = tf_getp(1);// get address size
  a_tree->half_byte   = a_tree->addr / 4;
  if((a_tree->addr % 4) != 0)a_tree->half_byte++;
  a_tree->size        = tf_getp(2);//get data width
  a_tree->word        = a_tree->size / 32;
  a_tree->dram        = 0;//dram
  if((a_tree->size % 32) != 0)a_tree->word++; 
  //pointer for avl tree set NULL
  a_tree->data        = 0;
  tf_putp(0, (unsigned int)a_tree);//reurn handle
  io_printf("Info -> Creating Memory(address width(%dbits) data width(%dbits)\n", 
	    a_tree->addr, a_tree->size);
}
/*-------------------------------------------------------------------------------
  set to an unintialized memory with random value.
--------------------------------------------------------------------------------*/
int check_zero_byte(long long addr)
{
  Q_node_ptr node;
  int found = 0;
  if(dram_tree->obj_on){
    setQ(dram_tree->obj);
    node = nextQ(dram_tree->obj);
    while(node){
      if(addr >= node->begin && addr < node->end){
	found = 1;
	break;
      } 
      node = nextQ(dram_tree->obj);
    }
  }
  return found;
}
/*-------------------------------------------------------------------------------
  set to an unintialized memory with random value.
--------------------------------------------------------------------------------*/
avl_node_ptr store_op(long long addr, int handle, int *byte_on)
{
  int i, bank, start, ind, i_bank, l;
  char d_buf[16], buf[16], ecc[4], pre_xor_ecc[4];
  state_node    f_val[1];
  avl_node_ptr  t_ptr;

  int  dexor_addr;
  int  b_new;

  int  addr_tmp;

#ifdef J_DEBUG
  io_printf("Info_J: (store_op) addr=%llx, handle=%d, byteon=%x\n", addr, handle, *byte_on);
#endif
  t_ptr    = search_node(&(dram_tree)->data, &addr);
  *byte_on = 0;
  //  io_printf("BYOUND %llx %d %d\n", addr, t_ptr, dram_tree->obj_on);
  // if((t_ptr == 0) && dram_tree->obj_on){
  if(dram_tree->obj_on){
    *byte_on = check_zero_byte(addr);
    //   io_printf("bytetime= %d BYTE %x %llx\n",tf_gettime(),  *byte_on, addr);
  }
  bank    = handle / 32;
  if(bank == 4){//when ecc read.
    handle -= 128;
    bank    = handle / 4;
  }
  start = bank * 32;
  if(t_ptr == 0 || ((t_ptr->val[0].bval[start] & 0xff) == 0xff)){
    if(t_ptr == 0){
      for(l = 0;l < 144; l++){
	f_val[0].aval.cval[l] = *byte_on ? 0xff : 0xff;
	f_val[0].bval[l]      = *byte_on ? 0xff : 0xff;
      }
    }
    for(i = 0; i < 16;i++)d_buf[i] = slam_val  && (*byte_on == 0)  ? random() & 0xff : 0;// get ram data
    ind = 0;
    for(i_bank = 0; i_bank < 8;i_bank++){
      buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
      buf[ind++] = d_buf[i_bank]        & 0xf;
    }
    for(i_bank = 0; i_bank < 16;i_bank++){
      if(t_ptr){
	(t_ptr)->val[0].aval.cval[start + i_bank] = buf[15-i_bank];
	(t_ptr)->val[0].bval[start + i_bank]      = 0;
      }
      else{
	f_val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	f_val[0].bval[start+i_bank]      = 0;
      }
    }
    start += 16;
    ind    = 0;
    for(i_bank = 8; i_bank < 16;i_bank++){
      buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
      buf[ind++] = d_buf[i_bank]        & 0xf;
    } 
    for(i_bank = 0; i_bank < 16;i_bank++){
      if(t_ptr){
	(t_ptr)->val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	(t_ptr)->val[0].bval[start+i_bank]      = 0;
      }
      else {
	f_val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	f_val[0].bval[start+i_bank]      = 0;
      }
    }
    hamming(d_buf, pre_xor_ecc);
    addr_tmp = addr & 0xffffffffff;
    // introduce this for 2 bits and 3 bits mode, bank x-oring algorithm
    if(dram_type & 0x1000) { // 3 bank bits
      
      if (ch2 == 0) {   // 4 channel + 3 bank
	//b1 =  (((addr & 0xffffffffff) >> 2) & 0x7);
	//b2 =  (((addr & 0xffffffffff) >> 12) & 0x7);
	//b3 =  (((addr & 0xffffffffff) >> 22) & 0x7);
	//b_new = b1^b2^b3;
	b_new = ( (((addr_tmp) >> 2) & 0x7) ^  (((addr_tmp ) >> 12) & 0x7) ^  (((addr_tmp ) >> 22) & 0x7) );
	//if (first) printf("'h%llx %x 8bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
	dexor_addr  = (   (addr & 0xffffffffe3) | (b_new << 2) ); 
	//if (first) printf("'h%llx\n", (addr & 0xffffffffff));
      } else {  // 2 channel + 3 bank
	b_new = ( (((addr_tmp ) >> 2) & 0x7) ^  (((addr_tmp ) >> 13) & 0x7) ^  (((addr_tmp ) >> 23) & 0x7) );
	//b_new = ( (((addr_tmp ) >> 1) & 0x7) ^  (((addr_tmp ) >> 12) & 0x7) ^  (((addr_tmp ) >> 22) & 0x7) );
	//if (first) printf("'h%llx %x 8bank  \n", (addr & 0xffffffffff),b_new);
	dexor_addr  = (   (addr & 0xffffffffe3) | (b_new << 2) ); 
	//dexor_addr  = (   (addr & 0xfffffffff1) | (b_new << 1) ); 
	//if (first) printf(" dexor addr 'h%llx\n", (dexor_addr & 0xffffffffff));
	
      }
      
    } else { //  2 banks
      
      if (ch2 == 0) { // 4channel + 2 bank
	b_new = ( (((addr_tmp ) >> 2) & 0x3) ^  (((addr_tmp ) >> 12) & 0x3) ^  (((addr_tmp ) >> 22) & 0x3) );
	//if (first) printf("'h%llx %x 4bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
	dexor_addr  = (   (addr & 0xfffffffff3) | (b_new << 2) ); 
	//if (first) printf("'h%llx\n", (addr & 0xffffffffff));
      } else {  // 2 channel + 2  banks
	b_new = ( (((addr_tmp ) >> 2) & 0x3) ^  (((addr_tmp ) >> 13) & 0x3) ^  (((addr_tmp ) >> 23) & 0x3) );
	//b_new = ( (((addr_tmp ) >> 1) & 0x3) ^  (((addr_tmp ) >> 12) & 0x3) ^  (((addr_tmp ) >> 22) & 0x3) );
	//if (first) printf("'h%llx %x 4bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
	dexor_addr  = (   (addr & 0xfffffffff3) | (b_new << 2) ); 
	//if (first) printf("'h%llx\n", (addr & 0xffffffffff));
      }
    }
    addr_parity(pre_xor_ecc, dexor_addr, ecc, 6, 0);
    //addr_parity(pre_xor_ecc, addr, ecc, 6, 0);
    start = 128 + bank * 4;
    for(i = 0; i < 4; i++){
      if(t_ptr){
	(t_ptr)->val[0].aval.cval[start+i] = ecc[i];
	(t_ptr)->val[0].bval[start+i]      = 0;
      }
      else {
	f_val[0].aval.cval[start+i] = ecc[i];
	f_val[0].bval[start+i]      = 0;
      }
    }
    io_printf("(%0d)Info: access an uninitialized address(%llx)\n", tf_gettime(), addr);
    io_printf("bank(%0d) data(", bank);
    for(i = 0; i < 16;i++)io_printf("%02x ", d_buf[i] & 0xff);
    io_printf(") ecc(%02x %02x %02x %02x)\n", ecc[0]  & 0xff, ecc[1] & 0xff, ecc[2] & 0xff, ecc[3] & 0xff);
    if(t_ptr == 0)insert_avl_node(&(dram_tree)->data,  &addr, f_val);
  }
  return t_ptr;
}
/*-------------------------------------------------------------------------------
  set to an unintialized memory with random value.
--------------------------------------------------------------------------------*/
avl_node_ptr store_no_search(long long addr, int handle, int *byte_on)
{
  int i, bank, start, ind, i_bank, l;
  char d_buf[16], buf[16], ecc[4], pre_xor_ecc[4];
  avl_node_ptr  t_ptr;

  int dexor_addr;
  int  b_new;
  int  addr_tmp;

#ifdef J_DEBUG
  io_printf("Info_J: (store_no_search) addr=%llx, handle=%d, byteon=%x\n", addr, handle, *byte_on);
#endif

  t_ptr = dram_tree->prev_ptr;
  bank  = handle / 32;
  if(bank == 4){//when ecc read.
    handle -= 128;
    bank    = handle / 4;
  }
  start = bank * 32;
  if((t_ptr->val[0].bval[start] & 0xff) != 0xff)return t_ptr;
  for(i = 0; i < 16;i++)d_buf[i] = slam_val  && (*byte_on == 0)  ? random() & 0xff : 0;// get ram data
  ind = 0;
  for(i_bank = 0; i_bank < 8;i_bank++){
    buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
    buf[ind++] = d_buf[i_bank]        & 0xf;
  }
  for(i_bank = 0; i_bank < 16;i_bank++){
    if(t_ptr){
      (t_ptr)->val[0].aval.cval[start + i_bank] = buf[15-i_bank];
      (t_ptr)->val[0].bval[start + i_bank]      = 0;
    }
  }
  start += 16;
  ind    = 0;
  for(i_bank = 8; i_bank < 16;i_bank++){
    buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
    buf[ind++] = d_buf[i_bank]        & 0xf;
  } 
  for(i_bank = 0; i_bank < 16;i_bank++){
    if(t_ptr){
      (t_ptr)->val[0].aval.cval[start+i_bank] = buf[15-i_bank];
      (t_ptr)->val[0].bval[start+i_bank]      = 0;
    }
  }
  hamming(d_buf, pre_xor_ecc);

  addr_tmp = addr & 0xffffffffff;
  // introduce this for 2 bits and 3 bits mode, bank x-oring algorithm
  if(dram_type & 0x1000) { // 3 bank bits

   if (ch2 == 0) {   // 4 channel + 3 bank
    //b1 =  (((addr & 0xffffffffff) >> 2) & 0x7);
    //b2 =  (((addr & 0xffffffffff) >> 12) & 0x7);
    //b3 =  (((addr & 0xffffffffff) >> 22) & 0x7);
    //b_new = b1^b2^b3;
    b_new = ( (((addr_tmp) >> 2) & 0x7) ^  (((addr_tmp) >> 12) & 0x7) ^  (((addr_tmp) >> 22) & 0x7) );
    //if (first) printf("'h%llx %x 8bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
    dexor_addr  = (   (addr & 0xffffffffe3) | (b_new << 2) ); 
    //if (first) printf("'h%llx\n", (addr & 0xffffffffff));
    } else {  // 2 channel + 3 bank
    b_new = ( (((addr_tmp) >> 2) & 0x7) ^  (((addr_tmp) >> 13) & 0x7) ^  (((addr_tmp) >> 23) & 0x7) );
    //b_new = ( (((addr_tmp) >> 1) & 0x7) ^  (((addr_tmp) >> 11) & 0x7) ^  (((addr_tmp) >> 21) & 0x7) );
    //if (first) printf("'h%llx %x 8bank  \n", (addr & 0xffffffffff),b_new);
    dexor_addr  = (   (addr & 0xffffffffe3) | (b_new << 2) ); 
    //dexor_addr  = (   (addr & 0xfffffffff1) | (b_new << 1) ); 
    //if (first) printf(" dexor_addr 'h%llx\n", (dexor_addr & 0xffffffffff));

    }

   } else { //  2 banks
     if (ch2 == 0) { // 4channel + 2 bank
       b_new = ( (((addr_tmp) >> 2) & 0x3) ^  (((addr_tmp) >> 12) & 0x3) ^  (((addr_tmp) >> 22) & 0x3) );
       //if (first) printf("'h%llx %x 4bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
       dexor_addr  = (   (addr & 0xfffffffff3) | (b_new << 2) ); 
       //if (first) printf("'h%llx\n", (addr & 0xffffffffff));
     } else {  // 2 channel + 2  banks
       b_new = ( (((addr_tmp) >> 1) & 0x3) ^  (((addr_tmp) >> 11) & 0x3) ^  (((addr_tmp) >> 21) & 0x3) );
       //if (first) printf("'h%llx %x 4bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
       dexor_addr  = (   (addr & 0xfffffffff9) | (b_new << 1) ); 
       //if (first) printf("'h%llx\n", (addr & 0xffffffffff));
     }
   }
   addr_parity(pre_xor_ecc, dexor_addr, ecc, 6, 0);
  //addr_parity(pre_xor_ecc, addr, ecc, 6, 0);
  start = 128 + bank * 4;
  for(i = 0; i < 4; i++){
    if(t_ptr){
      (t_ptr)->val[0].aval.cval[start+i] = ecc[i];
      (t_ptr)->val[0].bval[start+i]      = 0;
    }
  }
  io_printf("(%0d)Info: access an uninitialized address(%llx)\n", tf_gettime(), addr);
  io_printf("bank(%0d) data(", bank);
  for(i = 0; i < 16;i++)io_printf("%02x ", d_buf[i] & 0xff);
  io_printf(") ecc(%02x %02x %02x %02x)\n", ecc[0]  & 0xff, ecc[1] & 0xff, ecc[2] & 0xff, ecc[3] & 0xff);
  return t_ptr;
}
/*------------------------------------------
how percent.
 --------------------------------------------*/
int percent()
{
  int ret, num;
  ret = 0;
  if(dram_tree->dram_error_percent == 0)return ret;
  num = (random() % 100);

  if(num > dram_tree->dram_error_percent){//not taken
    if(dram_tree->not_taken == (100 -  dram_tree->dram_error_percent)){
      dram_tree->taken++;
      ret = 1;
    }
    else{
      dram_tree->not_taken++;
    }
  }
  else{
    if(dram_tree->taken == dram_tree->dram_error_percent){
      dram_tree->not_taken++;
    } 
    else{
      ret = 1;
      dram_tree->taken++;
    }
  }
  if((dram_tree->taken + dram_tree->not_taken) == 100){
    dram_tree->taken     = 0;
    dram_tree->not_taken = 0;
  }
  return ret;
}

/*-------------------------------------------------------------------------------
   $mem_read call routine.
   input:  handle, bank, way.
   output: read_data.
--------------------------------------------------------------------------------*/
void read_mem_call(){
  long long     addr;
  int           handled, low, high, byte_on, num, num1;
  avl_node_ptr  t_ptr;
  char          ch_temp;
  //handle        hand;
  if(dram_tree->spill == 0){
  handled = tf_getp(1);     // get this data base.
  //  hand    = acc_handle_tfarg(1);
  
  addr    = (long long)tf_getp(3);// get index.

#ifdef J_DEBUG
  io_printf("Info_J: (read_mem) addr=%llx, handled=%d\n", addr, handled);
#endif

  if(handled < 288 && handled >= 144){
    handled -= 144;
    addr   |= (2 << 28);
  }
  else if(handled < 432 && handled >= 288){
    handled -= 288;
    addr   |= (4 << 28);
  }
  else if(handled >= 432){
    handled -= 432;
    addr   |= (6 << 28);
  }

#ifdef J_DEBUG
  io_printf("Info_J: (read_mem) addr=%llx, handled=%d\n", addr, handled);
#endif
  //data in cache buffer.
  if(dram_tree->prev_ptr &&
     dram_tree->prev_addr == addr){
    t_ptr   = store_no_search(addr, handled, &byte_on); 
  }
  else {
    t_ptr  = store_op(addr, handled, &byte_on);
    if(t_ptr == 0)t_ptr = search_node(&(dram_tree)->data, &addr);
    dram_tree->prev_addr = addr;
    dram_tree->prev_ptr  = t_ptr;
    ch_temp = (t_ptr)->val[0].aval.cval[handled];
    dram_tree->dram_error_counter   = 0;
  }

  ch_temp = (t_ptr)->val[0].aval.cval[handled];
  switch(dram_tree->dram_error){
  case 1 : 
    if((dram_tree->dram_error_counter == 0) && percent()){
      num = random() & 3;
      (t_ptr)->val[0].aval.cval[handled] ^= (1 << num);
      if(random() & 1){
	num1 = random() & 3;
	if(num == num1){
	  num1++;
	  if(num1 == 4)num1-= 2;
	}
	(t_ptr)->val[0].aval.cval[handled] ^= (1 << num1);
      }
      dram_tree->dram_error_counter = 1;
      io_printf("Info:dram error injection addr(%llx) data(%x) flip(%x)\n",
		dram_tree->prev_addr, ch_temp & 0xff, 	(t_ptr)->val[0].aval.cval[handled] & 0xff);
    }
    break;
  case 2 :
    if((dram_tree->dram_error_counter < 2) && percent()){
      num = random() & 3;
      (t_ptr)->val[0].aval.cval[handled] ^= (1 << num);
      dram_tree->dram_error_counter++;
      io_printf("Info:dram double error injection addr(%llx) data(%x) flip(%x)\n",
		dram_tree->prev_addr, ch_temp & 0xff, 	(t_ptr)->val[0].aval.cval[handled] & 0xff);
    }
    break;
  case 3 :
    if(percent()){
      num = random() & 3;
      (t_ptr)->val[0].aval.cval[handled] ^= (1 << num);
      io_printf("Info:dram triple error injection addr(%llx) data(%x) flip(%x)\n",
		dram_tree->prev_addr, ch_temp & 0xff, 	(t_ptr)->val[0].aval.cval[handled] & 0xff);
    }
    break;
  }
  slam_memory((t_ptr)->val, dram_tree->word, 2, 1, handled);
  (t_ptr)->val[0].aval.cval[handled] = ch_temp;
  }
#ifdef J_DEBUG
  io_printf("Info_J: - (read_mem): dram_error=%x data=%x\n", dram_tree->dram_error, ch_temp & 0xff);
#endif
}
/*-------------------------------------------------------------------------------
 $write_mem call routine.
--------------------------------------------------------------------------------*/
void write_mem_call(){
  int low, high;
  long long    addr;
  state_node   nval[1];
  int          handle, l;
  avl_node_ptr t_ptr;
  if(dram_tree->spill == 0){
  addr   = (long long)tf_getp(3);
 
  handle = tf_getp(1); // get this data base.
 
  if(handle < 288 && handle >= 144){
    handle -= 144;
    addr |= (2 << 28);
  }
  else if(handle < 432 && handle >= 288){
    handle -= 288;
    addr |= (4 << 28);
  }
  else if(handle >= 432){
    handle -= 432;
    addr |= (6 << 28);
  }
  t_ptr  = search_node(&(dram_tree)->data, &addr);
 
  if(t_ptr == 0){
    for(l = 0;l < 144; l++){
      nval[0].aval.cval[l] = 0xff;
      nval[0].bval[l]      = 0xff;
    }
  }
  dump_memory(nval, dram_tree->word, 2, handle);
  if(t_ptr){
    t_ptr->val[0].aval.cval[handle] = nval[0].aval.cval[handle];
    t_ptr->val[0].bval[handle]      = nval[0].bval[handle];
  }
  else insert_avl_node(&(dram_tree)->data, &addr, nval);
  }
}
/*-------------------------------------------------------------------------------
   receive the phyical address from rtl.
   return 4 bytes to rtl.
--------------------------------------------------------------------------------*/
long long access_dram_call(long long addr)
{
  int cs, bank, i_bank, bank_s;//address
  long long  d_way, word;
  avl_node_ptr  t_ptr;

  if ((dram_type & 0x10) || (dram_type & 0x20) || \
      (dram_type & 0x8000) || (dram_type & 0x4000) \
          ) { //2-Channel (0&1 | 2&3) Mode; JH: add 03/21 comb
    // Mask the upper bits, and shift out bits 0-7
    if(dram_type & 0x100) d_way = (addr & 0xffffffffff) >> 7;
    else d_way = (addr & ((0xffffffffff) >> (8 - (dram_type & 0xf)))) >> 7;
    // Restore bit 4 & 5
    d_way = (d_way << 2) | ((addr >> 4) & 3);
    // Get CS from stack & rank bits
    if (dram_type & 0x100) { // Old stack bit position: 10
      switch (dram_type & 0xc0) {
      case 0x00: //unstacked dimm & rank 0 only
	cs = 0;
	break;
      case 0x40: // staked dimm & rank 0 only
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x3f) | ((d_way >> 7) << 6);
	  cs    = ((addr >> 11) & 1);
	} else { // 2 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	  cs    = ((addr >> 10) & 1);
	}
	break;
      case 0x80: //unstaked dimm & rank 1 present
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x3f) | ((d_way >> 7) << 6);
	  cs    = ((addr >> 10) & 2);
	} else { // 2 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	  cs    = ((addr >> 9) & 2);
	}
	break;
      case 0xc0: // staked dimm & rank1 preset
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x3f) | ((d_way >> 8) << 6);
	  cs    = ((addr >> 11) & 3);
	} else { // 2 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 7) << 5);
	  cs    = ((addr >> 10) & 3);
	}
	break;
      }
    } 
    else { // New stack & rank bit poitions Hi bit (right after row)
      if (dram_type & 0x40) cs = (addr >> (31 + (dram_type & 0xf))) & 3;
      else cs = (((addr >> (31 + (dram_type & 0xf))) & 1) << 1) & 2;
    }
    d_way |= (cs << 30);
    bank_s = (addr >> 6) & 0x1;
    bank   = (dram_type & 0x20) ? (64 + bank_s * 32) : bank_s * 32;
    if (dram_type & 0x8000) // JH: 2ch 03
        bank = (bank_s == 0) ? 0 : 32 * 3;
    if (dram_type & 0x4000) // JH: 2ch 21
        bank = (bank_s == 0) ? 32 * 2 : 32;
  } 
  else { // 4 channel (0, 1, 2, 3) mode
    // Mask the upper bits, and shift out bits 0-7
    if(dram_type & 0x100) d_way = (addr & 0xffffffffff) >> 8;
    else d_way = (addr & ((0xffffffffff) >> (8 - (dram_type & 0xf)))) >> 8;
    // Restore bit 4 & 5
    d_way = (d_way << 2) | ((addr >> 4) & 3);
    // Get CS from stack & rank bits
    if (dram_type & 0x100) { // Old stack bit position: 10
      switch (dram_type & 0xc0) {
      case 0x00: //unstacked dimm & rank 0 only
	cs = 0;
	break;
      case 0x40: // staked dimm & rank 0 only
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	  cs    = ((addr >> 11) & 1);
	} else { // 2 bank bits
	  d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	  cs    = ((addr >> 10) & 1);
	}
	break;
      case 0x80: //unstaked dimm & rank 1 present
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	  cs    = ((addr >> 10) & 2);
	} else { // 2 bank bits
	  d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	  cs    = ((addr >> 9) & 2);
	}
	break;
      case 0xc0: // staked dimm & rank1 preset
	if (dram_type & 0x2) { // 3 bank bits
	  d_way = (d_way & 0x1f) | ((d_way >> 7) << 5);
	  cs    = ((addr >> 11) & 3);
	} else { // 2 bank bits
	  d_way = (d_way & 0xf) | ((d_way >> 6) << 4);
	  cs    = ((addr >> 10) & 3);
	}
	break;
      }
    } 
    else { // New stack bit poition Hi bit (right after row)
      if (dram_type & 0x40) cs = (addr >> (32 + (dram_type & 0xf))) & 3;
      else cs = (((addr >> (32 + (dram_type & 0xf))) & 1) << 1) & 2;
    }
    d_way |= (cs << 29);
    bank_s = (addr  >> 6) & 0x3;
    bank   = bank_s * 32;
  } // 4-Channel mode
  if(addr & 0x8)bank += 16;
  t_ptr = (dram_tree)->data ? search_node(&(dram_tree)->data, &d_way) : 0;
  word  = 0;
  if(t_ptr){
    for (i_bank = 15; i_bank >= 0; i_bank--){
      word <<= 4;
      word  |=  (t_ptr)->val[0].aval.cval[bank+i_bank] & 0xf;
    }
  }
  return word;
}
/*-------------------------------------------------------------------------------
   receive the phyical address from rtl.
   return 4 bytes to rtl.
--------------------------------------------------------------------------------*/
void read_dram_call(){
  int low, high;//address
  long long addr, word;

  low    = tf_getlongp(&high, 1);//get address
  addr   = high;
  addr <<= 32;
  addr  |= low;
  word = access_dram_call(addr);
  tf_putlongp(0, word, word >> 32);
}
/*-------------------------------------------------------------------------------
   extract memory content from string and store data into memory.
--------------------------------------------------------------------------------*/
void write_dram_call(long long* addr,
		     char*      bytes)
{
  long long  d_way;
  int        bank, i_bank, i, j, l, bank_s, cs, l2line, six;
  state_node f_val[1];
  char 	     pre_xor_ecc[4], val[144], d_buf[16], ecc[16];
  avl_node_ptr  t_ptr;
  six = 0;
  ch2 = ( (dram_type & 0x10) || (dram_type & 0x20)); //2-Channel (0&1 | 2&3) Mode
  ch2 = ch2 || ( (dram_type & 0x8000) || (dram_type & 0x4000)); // JH: 2-Ch (0&3 | 2&1) Mode
  for(l2line = 0; l2line < 8; l2line++){
    i = 15;
    for(l = 0; l < 8;l++){
      d_buf[i--] = (bytes[six] >> 4) & 0xf;
      d_buf[i--] = bytes[six++] & 0xf;
    }
    if((dram_type & 0x10) || (dram_type & 0x20) || \
       (dram_type & 0x8000) || (dram_type & 0x4000) \
      ) { //2-Channel (0&1 | 2&3) Mode; JH: add 0&3, 2&1 comb
      // Mask the upper bits, and shift out bits 0-7
      if(dram_type & 0x100) d_way = (*addr & 0xffffffffff) >> 7;
      else d_way = ((*addr) & ((0xffffffffff) >> (8 - (dram_type & 0xf)))) >> 7;
      // Restore bit 4 & 5
      d_way = (d_way << 2) | (((*addr) >> 4) & 3);
      // Get CS from stack & rank bits
      if (dram_type & 0x100) { // Old stack bit position: 10
	switch (dram_type & 0xc0) {
	case 0x00: //unstacked dimm & rank 0 only
	  cs = 0;
	  break;
	case 0x40: // staked dimm & rank 0 only
	  if (dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x1f) | ((d_way >> 6) << 5); //j:
	    cs = (((*addr) >> 10) & 1);                   //j:
	  } 
	  else { // 2 bank bits
	    d_way = (d_way & 0x0f) | ((d_way >> 5) << 4); //j:
	    cs = (((*addr) >>  9) & 1);                   //j:
	  }
	  break;
	case 0x80: //unstaked dimm & rank 1 present
	  if (dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x3f) | ((d_way >> 6) << 5); //j:
	    cs = (((*addr) >> 9) & 2);                    //j:
	  } 
	  else { // 2 bank bits
	    d_way = (d_way & 0x0f) | ((d_way >> 5) << 4); //j:
	    cs = (((*addr) >> 8) & 2);                    //j:
	  }
	  break;
	case 0xc0: // staked dimm & rank1 preset
	  if(dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x3f) | ((d_way >> 7) << 5); //j:
	    cs = (((*addr) >> 10) & 3);                   //j:
	  } 
	  else { // 2 bank bits
	    d_way = (d_way & 0x1f) | ((d_way >> 6) << 4); //j:
	    cs = (((*addr) >>  9) & 3);                   //j:
	  }
	  break;
	}
      } 
      else { // New stack & rank bit poitions Hi bit (right after row)
	if (dram_type & 0x40) cs = ((*addr) >> (31 + (dram_type & 0xf))) & 3;
	else cs = ((((*addr) >> (31 + (dram_type & 0xf))) & 1) << 1) & 2;
      }
      d_way |= (cs << 29);
      bank_s = (*addr  >> 6) & 0x1;
      bank = (dram_type & 0x20) ? (64 + bank_s * 32) : bank_s * 32;
      if (dram_type & 0x8000) // JH: 2ch 03
          bank = (bank_s == 0) ? 0 : 32 * 3;
      if (dram_type & 0x4000) // JH: 2ch 21
          bank = (bank_s == 0) ? 32 * 2 : 32;
    } 
    else { // 4 channel (0, 1, 2, 3) mode
      // Mask the upper bits, and shift out bits 0-7
      if(dram_type & 0x100) d_way = (*addr & 0xffffffffff) >> 8;
      else d_way = ((*addr) & ((0xffffffffff) >> (8 - (dram_type & 0xf)))) >> 8;
      // Restore bit 4 & 5
      d_way = (d_way << 2) | (((*addr) >> 4) & 3);
      // Get CS from stack & rank bits
      if (dram_type & 0x100) { // Old stack bit position: 10
	switch (dram_type & 0xc0) {
	case 0x00: //unstacked dimm & rank 0 only
	  cs = 0;
	  break;
	case 0x40: // staked dimm & rank 0 only
	  if (dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	    cs = (((*addr) >> 11) & 1);
	  } else { // 2 bank bits
	    d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	    cs = (((*addr) >> 10) & 1);
	  }
	  break;
	case 0x80: //unstaked dimm & rank 1 present
	  if (dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	    cs = (((*addr) >> 10) & 2);
	  } else { // 2 bank bits
	    d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	    cs = (((*addr) >> 9) & 2);
	  }
	  break;
	case 0xc0: // staked dimm & rank1 preset
	  if (dram_type & 0x2) { // 3 bank bits
	    d_way = (d_way & 0x1f) | ((d_way >> 7) << 5);
	    cs = (((*addr) >> 11) & 3);
	  } else { // 2 bank bits
	    d_way = (d_way & 0xf) | ((d_way >> 6) << 4);
	    cs = (((*addr) >> 10) & 3);
	  }
	  break;
	}
      } else { // New stack bit poition Hi bit (right after row)
	if (dram_type & 0x40) cs = ((*addr) >> (32 + (dram_type & 0xf))) & 3;
	else cs = ((((*addr) >> (32 + (dram_type & 0xf))) & 1) << 1) & 2;
      }
      d_way |= (cs << 29);
      bank_s = (*addr  >> 6) & 0x3;
      bank   = bank_s * 32;
    } // 4-Channel mode
    //get node if exist.
    t_ptr = dram_tree->data ? search_node(&(dram_tree)->data, &d_way) : 0;
    if(t_ptr == 0){//new node
      for(l = 0;l < 144; l++){
	f_val[0].aval.cval[l] = 0xff;
	f_val[0].bval[l]      = 0xff;
      }
      for (i_bank = 0; i_bank < 16; i_bank++){
	f_val[0].aval.cval[bank+i_bank] = d_buf[15 - i_bank] & 0xf;
	f_val[0].bval[bank+i_bank]      = 0;
      }//save after ecc.
      insert_avl_node(&(dram_tree)->data, &d_way, f_val);
    }
    else{//node already exist.
      for (i_bank = 0; i_bank < 16; i_bank++){
	t_ptr->val[0].aval.cval[bank+i_bank] = d_buf[15 - i_bank] & 0xf;
	t_ptr->val[0].bval[bank+i_bank]      = 0;
      }
    }
    i_bank = ((*addr >> 3) & 1) * 8;
    j      = 0;
    for (i = i_bank; i < i_bank + 8; i++){
      ecc[i] = d_buf[j*2 + 1] | (d_buf[j*2] << 4);
      j++;
    }
    //save data here.
    if(i == 16) {
      t_ptr = search_node(&(dram_tree)->data, &d_way);
      hamming(ecc, pre_xor_ecc);
      addr_parity(pre_xor_ecc, *addr, d_buf, 0, ch2);
      if (dram_type & 0x20) bank = 128 + 8 + bank_s * 4;
      else           bank = 128 + bank_s * 4;
      if(t_ptr){
	for(i = 0; i < 4; i++){
	  t_ptr->val[0].aval.cval[bank+i] = d_buf[i];
	  t_ptr->val[0].bval[bank+i]      = 0;
	}
      }
    }
    addr += 8;
  }//for loop
}
/*-------------------------------------------------------------------------------
   get the ecc data from memory.
--------------------------------------------------------------------------------*/
void got_ecc(avl_node_ptr  t_ptr, char* ecc, int bank)
{
  int i, idx;
  idx = 7;
  for(i = bank - 16; i < bank;i += 2){
    ecc[idx]   = t_ptr->val[0].aval.cval[i+1];
    ecc[idx] <<= 4;
    ecc[idx]  |= t_ptr->val[0].aval.cval[i];
    idx--;
  }
  idx = 15;
  for(i = bank; i < (bank + 16);i += 2){
    ecc[idx]   = t_ptr->val[0].aval.cval[i+1];
    ecc[idx] <<= 4;
    ecc[idx]  |= t_ptr->val[0].aval.cval[i];
    idx--;
  }
}
/*-------------------------------------------------------------------------------
   calculate data structure pointer.
--------------------------------------------------------------------------------*/
long long cal_4channel(long long addr,
		       int* bank_s,
		       int* bank)
{
  long long d_way;
  int cs;
  int  b_new;
  long long addr_tmp;


  addr_tmp = addr & 0xffffffffff;
#ifdef J_DEBUG
  io_printf("Info_J: (cal_4ch) addr=%llx,", addr);
#endif

  // introduce this for 2 bits and 3 bits mode, bank x-oring algorithm
  if(dram_type & 0x1000) { // 3 bank bits
  //if(dram_type & 0x2) { // 3 bank bits
    //b1 =  (((addr & 0xffffffffff) >> 8) & 0x7);
    //b2 =  (((addr & 0xffffffffff) >> 18) & 0x7);
    //b3 =  (((addr & 0xffffffffff) >> 28) & 0x7);
    //b_new = b1^b2^b3;
    b_new = ( (((addr_tmp) >> 8) & 0x7) ^  (((addr_tmp) >> 18) & 0x7) ^  (((addr_tmp) >> 28) & 0x7) ); 
    //if (first) printf("'h%llx %x 8bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
    addr  = (   (addr & 0xfffffff8ff) | (b_new << 8) ); // 7,8,9 bank bits
    //if (first) printf("'h%llx\n", (addr & 0xffffffffff));
   } else {
    b_new = ( (((addr_tmp) >> 8) & 0x3) ^  (((addr_tmp) >> 18) & 0x3) ^  (((addr_tmp) >> 28) & 0x3) ); 
    //if (first) printf("'h%llx %x 4bank  %x, %x, %x\n", (addr & 0xffffffffff),b_new,b1,b2,b3 );
    addr  = (   (addr & 0xfffffffcff) | (b_new << 8) ); // 7,8,9 bank bits
    //if (first) printf("'h%llx\n", (addr & 0xffffffffff));
   }

  // Mask the upper bits, and shift out bits 0-7
  if(dram_type & 0x100) d_way = (addr & 0xffffffffff) >> 8;
  else d_way = (addr & ((0xffffffffff) >> (8 - (dram_type & 0xf)))) >> 8;
  // Restore bit 4 & 5
  d_way = (d_way << 2) | ((addr >> 4) & 3);
  // Get CS from stack & rank bits
  if (dram_type & 0x100) { // Old stack bit position: 10
    switch (dram_type & 0xc0) {
    case 0x00: //unstacked dimm & rank 0 only
      cs = 0;
      break;
    case 0x40: // staked dimm & rank 0 only
      if (dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	cs = ((addr >> 11) & 1);
      } else { // 2 bank bits
	d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	cs = ((addr >> 10) & 1);
      }
      break;
    case 0x80: //unstaked dimm & rank 1 present
      if (dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 6) << 5);
	cs = ((addr >> 10) & 2);
      } else { // 2 bank bits
	d_way = (d_way & 0xf) | ((d_way >> 5) << 4);
	cs = ((addr >> 9) & 2);
      }
      break;
    case 0xc0: // staked dimm & rank1 preset
      if (dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 7) << 5);
	cs = ((addr >> 11) & 3);
      } else { // 2 bank bits
	d_way = (d_way & 0xf) | ((d_way >> 6) << 4);
	cs = ((addr >> 10) & 3);
      }
      break;
    }
  }
  else { // New stack bit poition Hi bit (right after row)
    if (dram_type & 0x40) cs = (addr >> (32 + (dram_type & 0xf))) & 3;
    else cs = (((addr >> (32 + (dram_type & 0xf))) & 1) << 1) & 2;
  }
  d_way |= (cs << 29);
  *bank_s = (addr  >> 6) & 0x3;
  *bank   = *bank_s * 32;
#ifdef J_DEBUG
  io_printf("d_way=%llx,cs=%x\n", d_way, cs);
#endif
  return d_way;
}
/*-------------------------------------------------------------------------------
    calculate data structure pointer.
--------------------------------------------------------------------------------*/
long long cal_2channel(long long addr,
		       int* bank_s,
		       int* bank)
{
  long long d_way;
  unsigned int cs;  // int cs;
  int  b_new;
  long long addr_tmp;

  addr_tmp = addr & 0xffffffffff;

  d_way = 0;

#ifdef J_DEBUG
  io_printf("Info_J: (cal_2ch) addr=%llx, bank_s=%d, bank=%d\n", addr, *bank_s, *bank);
#endif

  // introduce this for 2 bits and 3 bits mode
  // J_NOTE: real_bank = bank (2/3 bits) ^ pa[18:20] ^ pa[28:30]
  if(dram_type & 0x1000) { // 3 bank bits
    b_new = ( (((addr_tmp) >> 7) & 0x7) ^  (((addr_tmp) >> 18) & 0x7) ^  (((addr_tmp) >> 28) & 0x7) ); 
    //if (first) printf("\'h%llx %x\n", (addr & 0xffffffffff),b_new );
    addr  = (   (addr & 0xfffffffc7f) | (b_new << 7) ); // 7,8,9 bank bits
    //if (first) printf("\'h%llx %x\n", (addr & 0xffffffffff));
   } else {
    b_new = ( (((addr_tmp) >> 7) & 0x3) ^  (((addr_tmp) >> 18) & 0x3) ^  (((addr_tmp) >> 28) & 0x3) ); 
    //if (first) printf("\'h%llx %x\n", (addr & 0xffffffffff),b_new );
    addr  = (   (addr & 0xfffffffe7f) | (b_new << 7) ); // 7,8 bank bits
    //if (first) printf("\'h%llx %x\n", (addr & 0xffffffffff));
   }

#ifdef J_DEBUG
  io_printf("Info_J: 0: d_way=%llx\n",d_way);
#endif
  // Mask the upper bits, and shift out bits 0-7
  if(dram_type & 0x100)d_way = (addr & 0xffffffffff) >> 7;
  else d_way = (addr & (0xffffffffff >> (9 - (dram_type & 0xf)))) >> 7;
#ifdef J_DEBUG
  io_printf("Info_J: 1: d_way=%llx\n",d_way);
#endif
  // Restore bit 4 & 5
  d_way = (d_way << 2) | ((addr >> 4) & 3);
  // J_NOTE: get rid of pa[6] and pa[3:0]
  //         d_way[1:0] -- pa[5:4]
  //         d_way[2:-] -- pa[7:-]
  // for !(dram_type & 0x100), i.e. upper rank/stack bit,
  //      rank/stack pa[31] or pa[32], get rid of them
#ifdef J_DEBUG
  io_printf("Info_J: 2: d_way=%llx\n",d_way);
#endif
  // Get CS from stack & rank bits
  if(dram_type & 0x100){ // Old stack bit position: 10
    switch (dram_type & 0xc0) {
    case 0x00: //unstacked dimm & rank 0 only
      cs = 0;
      break;
    case 0x40: // staked dimm & rank 0 only
      if(dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 6) << 5); //j: drop pa[10]/d_way[5]
	cs = ((addr >> 10) & 1);                      //j: pa[10] & 1'b1
      }else { // 2 bank bits
	d_way = (d_way & 0x0f) | ((d_way >> 5) << 4); //j: drop pa[9]/d_way[4]
	cs = ((addr >>  9) & 1);                      //j: pa[9]  & 1'b1
      }
      break;
    case 0x80: //unstaked dimm & rank 1 present
      if(dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 6) << 5); //j: drop pa[10]/d_way[5]
	cs = ((addr >> 9) & 2);                       //j: {pa[10],pa[9]} & 2'b10
        // J_NOTE:  get rid of d_way[5] == pa[10], need use ">>6)<<5"!!
        //          cs:  pa[10] -- rank
        //               need use ">>9)&2" ie. pa[-:9]& 2'b10-->pa[10]
      }else { // 2 bank bits
	d_way = (d_way & 0x0f) | ((d_way >> 5) << 4); //j: drop pa[9]/d_way[4]
	cs = ((addr >> 8) & 2);                       //j: {pa[9],pa[8]} & 2'b10
        // J_NOTE: get rid of d_way[4] == pa[9], need use ">>5)<<4"
        //         cs: pa[9] = rank/stack
        //             need use ">>8)&2", pa[-:8]&2'b10-->pa[9]
      }
      break;
    case 0xc0: // staked dimm & rank1 preset
      if (dram_type & 0x2) { // 3 bank bits
	d_way = (d_way & 0x3f) | ((d_way >> 7) << 5); //j: drop pa[11:10]/d_way[6:5]
	cs = ((addr >> 10) & 3);                      //j: pa[11:10]
      } else { // 2 bank bits
	d_way = (d_way & 0x1f) | ((d_way >> 6) << 4); //j: drop pa[10:9]
	cs = ((addr >> 9) & 3);                       //j: pa[10:9]
      }
      break;
#ifdef J_DEBUG
        io_printf("Info_J: 3: cs=%x,d_way=%llx\n",cs, d_way);
#endif
    }
  } else { // New stack & rank bit poitions Hi bit (right after row)
    if (dram_type & 0x40) cs = (addr >> (31 + (dram_type & 0xf))) & 3;
    else cs = (((addr >> (31 + (dram_type & 0xf))) & 1) << 1) & 2;
#ifdef J_DEBUG
        io_printf("Info_J: cs=%x\n",cs);
#endif
  }
  d_way |= (cs << 29);
  *bank_s = (addr  >> 6) & 0x1;
  *bank   = (dram_type & 0x20) ? (64 + *bank_s * 32) : *bank_s * 32;
  if (dram_type & 0x8000)  // JH: 2ch 03 comb: 0->0, 1->3
      *bank = (*bank_s == 0) ? 0 : 32 * 3;
  if (dram_type & 0x4000)  // JH: 2ch 21 comb: 0->2, 1->1
      *bank = (*bank_s == 0) ? 32 * 2 : 32;

#ifdef J_DEBUG
  io_printf("Info_J: -         bank_s=%d, bank=%d\n", *bank_s, *bank);
  io_printf("Info_J: -         addr=%llx, d_way=%llx\n", addr, d_way);
#endif
  return d_way;
}
/*--------------------------------------
  convert ascii to hex array.
  ---------------------------------------*/
void str_copy(char* buf, int idx,  char* cbuf)
{
  int ind;
  ind = 0;
  while((buf[idx] != '\0') && 
	(buf[idx] != '\n') &&
	(buf[idx] != ' ')){
    cbuf[ind++] = buf[idx];
    idx++;
  }
  cbuf[ind] = '\0';
}
/*--------------------------------------
  if not align by 64, do padding.
  ---------------------------------------*/
int align_64_front(long long addr)
{
  int num;
  num = addr % 64;
  if(num){
    addr -= addr;
  }
  return num;
}
/*--------------------------------------
  if not align by 64, do padding.
  ---------------------------------------*/
int check_alist(long long addr)
{
  int idx;
  for(idx = 0; idx < 4;idx++){
    if(addr == dram_tree->alist[idx]){
      return 0;
    }
  }
  dram_tree->alist[dram_tree->cptr] = addr;
  dram_tree->cptr = dram_tree->cptr == 3 ? 0 : dram_tree->cptr + 1;
  return 1;
}
/*-------------------------------------------------------------------------------
  Is there a single comment?
  Also, find the zero_byte number.
--------------------------------------------------------------------------------*/
void denali_data(long long addr, int size)
{
  long long addr_tmp;
  int        b_new, t_mask, idx, i;
  char 	     pre_xor_ecc[4], ecc[16], d_buf[4];

  for(idx = 0; idx < 16;idx++)ecc[idx] = 0;
  idx = 0;
  while(idx < size){
    hamming(ecc, pre_xor_ecc);
    addr_parity(pre_xor_ecc, addr, d_buf, 0, ch2);

    //denali format  'h801601f/7b59111111111111114f1111111111111150;
    t_mask   = (addr >> 28) & 0xfff;
    // bank hashing changes for denali
    addr_tmp = addr & 0xffffffffff;
    //fprintf(dram_tree->fp,"addr_tmp 1 = %llx %llx;\n",addr_tmp, addr);
    b_new     = ((((addr_tmp) >> 8) & 0x7) ^  (((addr_tmp) >> 18) & 0x7) ^  (((addr_tmp) >> 28) & 0x7) );
    addr_tmp  = ((addr_tmp & 0xfffffff8ff) | (b_new << 8) ); // 8,9,10 bank bits
    addr_tmp  = (addr_tmp >> 4)  & 0xfffffffff;
    //fprintf(dram_tree->fp,"addr_tmp 2 = %llx ;\n",addr_tmp);
    if(t_mask < 0x200){
      if(check_alist( addr_tmp)){
	fprintf(dram_tree->fp, "\'h%llx/%1x%x%x%x", (addr_tmp & 0xfffffffff), d_buf[1] & 0xf, d_buf[0] & 0xf,
		d_buf[3] & 0xf, d_buf[2] & 0xf);
	for(i = 0; i < 16;i++)fprintf(dram_tree->fp,"%02x",  ecc[i] & 0xff);
	fprintf(dram_tree->fp,";\n");
      }
    }
    addr += 16;
    idx  += 16;
  }
}
/*-------------------------------------------------------------------------------
  Is there a single comment?
  Also, find the zero_byte number.
--------------------------------------------------------------------------------*/
int check_single_comment(int idx, char* buf, long long *addr)
{
  int bank_s, bank;
  char cbuf[9];
  Q_node_ptr item; 

  if(strncmp(buf+idx, "//", 2) == 0){
    idx  = remove_leading_space(buf, idx+2, BUFFER);
    if(strncmp(buf+idx, "zero_bytes", 10) == 0){
      item       = (Q_node_ptr)malloc(sizeof(struct Q_node));
      item->addr = *addr;
      idx        = remove_leading_space(buf, idx+10, BUFFER);
      str_copy(buf, idx, cbuf);
      item->range  = atoi(cbuf);

      if((dram_type & 0x10) || (dram_type & 0x20))item->begin = cal_2channel(*addr, &bank_s, &bank);
      // JH: add code for 2ch mode :03 and 21 comb 
      else if((dram_type & 0x8000) || (dram_type & 0x4000))item->begin = cal_2channel(*addr, &bank_s, &bank);
      else item->begin = cal_4channel(*addr, &bank_s, &bank);

      *addr += (long long)item->range;
      if((dram_type & 0x10) || (dram_type & 0x20))item->end = cal_2channel(*addr, &bank_s, &bank);
      // JH: add code for 2ch mode :03 and 21 comb 
      else if((dram_type & 0x8000) || (dram_type & 0x4000))item->end = cal_2channel(*addr, &bank_s, &bank);
      else item->end= cal_4channel(*addr, &bank_s, &bank);

      enqueue(dram_tree->obj, &item);
      io_printf("Info:zero_bytes address(%llx) bytes(%d) dram_begin(%llx) dram_end(%llx)\n", 
		item->addr, item->range, item->begin, item->end);
      dram_tree->obj_on = 1;
      //create denali data
      if(dram_tree->spill)denali_data(item->addr, item->range);
    }
    return 1;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
   extract memory content from string.
   store data into memory.
dram channel bit 8:7
--------------------------------------------------------------------------------*/
void store_into_rdram(char *buf,    long long  *addr,  int index,  
	              char *d_buf,  int        *d_ind, int *num_bit, int* l_bit,
	              int  *b_ind,  char* ecc,  int wh){
  long long  d_way;
  int        bank, i_bank, i, j, l, bank_s, cs, t_mask, idx, sbank;
  state_node f_val[1];
  char 	     pre_xor_ecc[4], val[144];
  avl_node_ptr  t_ptr;
  int  b_new, already;
  long long  addr_tmp;

  ch2 = ( (wh & 0x10) || (wh & 0x20)); //2-Channel (0&1 | 2&3) Mode
  ch2 = ch2 || ( (wh & 0x8000) || (wh & 0x4000)); // JH: 2-Ch (0&3 | 2&1) Mode

#ifdef J_DEBUG
  io_printf("Info_J: (store_into_rdram) addr=%llx,2ch=%0d,ecc=%d\n",*addr, ch2,*ecc);
  io_printf("Info_J: - d_buf=%x,d_ind=%x,num_bit=%x,l_bit=%x,b_ind=%x\n", *d_buf, *d_ind, *num_bit, *l_bit, *b_ind);
#endif

  while((index = remove_leading_space(buf, index, BUFFER)) >= 0){
    if(check_single_comment(index, buf, addr))break;
    convert_a2b(buf, &index, d_buf, d_ind, num_bit);
    if (*num_bit >= 64) {
      //2-Channel (0&1 | 2&3) Mode; JH: add 0&3, 2&1 comb
      if ((wh&0x10) || (wh&0x20) || (wh&0x8000) || (wh&0x4000)) { 
	d_way = cal_2channel(*addr, &bank_s, &bank);
      } else { // 4 channel (0, 1, 2, 3) mode
	d_way = cal_4channel(*addr, &bank_s, &bank);
      } // 4-Channel mode
      //if (((*b_ind) & 0x1) == 1)bank += 16;
      if (((*addr) & 0x8) == 8)bank += 16;
      (*b_ind)++;
      (*b_ind) &= 0xf;

      if(dram_tree->spill == 0){//denali
	//get node if exist.
	t_ptr = dram_tree->data ? search_node(&(dram_tree)->data, &d_way) : 0;
	if(t_ptr == 0){//new node
	  for(l = 0;l < 144; l++){
	    f_val[0].aval.cval[l] = 0xff;
	    f_val[0].bval[l]      = 0xff;
	  }
	  for (i_bank = 0; i_bank < 16; i_bank++){
	    f_val[0].aval.cval[bank+i_bank] = d_buf[15 - i_bank] & 0xf;
	    f_val[0].bval[bank+i_bank]      = 0;
	    (*d_ind)--;
	  }//save after ecc.
	  insert_avl_node(&(dram_tree)->data, &d_way, f_val);
	  //io_printf("DATA addr %llx %llx\n", *addr, d_way);
#ifdef J_DEBUG
  io_printf("Info_J: - DATA addr=%llx,d_way=%llx\n",*addr, d_way);
#endif
	}
	else{//node already exist.
	  if((t_ptr->val[0].aval.cval[bank] == (unsigned char)0xff) &&
	     (t_ptr->val[0].bval[bank] == (unsigned char)0xff))already = 1;
	  else {
	    already = 0;
	    for (i_bank = 0; i_bank < 16; i_bank++){
	      t_ptr->val[0].aval.cval[bank+i_bank] = d_buf[15 - i_bank] & 0xf;
	      t_ptr->val[0].bval[bank+i_bank]      = 0;
	      (*d_ind)--;
	    }
	  }
	}
      }
      else (*d_ind) -= 16;
      i_bank = ((*addr >> 3) & 1) * 8;
      j      = 0;
      for (i = i_bank; i < i_bank + 8; i++){
  	ecc[i] = d_buf[j*2 + 1] | (d_buf[j*2] << 4);
	j++;
      }
      //save data here.
      if(i == 16) {
	if(t_ptr && (dram_tree->spill == 0))got_ecc(t_ptr, ecc, bank);
	hamming(ecc, pre_xor_ecc);
	addr_parity(pre_xor_ecc, *addr, d_buf, 0, ch2);
	if(dram_tree->spill == 0){
	  t_ptr = search_node(&(dram_tree)->data, &d_way);
	  if (wh & 0x20) bank = 128 + 8 + bank_s * 4;
          else if ( wh & 0x8000)  // JH: add for 2Ch 03 comb: 0->0,1->3
              bank = (bank_s ==0) ? 128 : 128 + 3*4;
          else if ( wh & 0x4000)  // JH: add for 2Ch 21 comb: 0->2,1->1
              bank = (bank_s ==0) ? 128 + 2*4 : 128 + 4;
	  else           bank = 128 + bank_s * 4;
	  if(t_ptr && (already == 0)){
	    for(i = 0; i < 4; i++){
	      t_ptr->val[0].aval.cval[bank+i] = d_buf[i];
	      t_ptr->val[0].bval[bank+i]      = 0;
	    }
	  }
	}
	if(dram_tree->spill){
	  //denali format  'h801601f/7b59111111111111114f1111111111111150;
	  t_mask = (*addr >> 28) & 0xfff;
          // bank hashing changes for denali
          addr_tmp = *addr & 0xffffffffff;
          //fprintf(dram_tree->fp,"addr_tmp 1 = %x ;\n",addr_tmp);
          b_new = ( (((addr_tmp) >> 8) & 0x7) ^  (((addr_tmp) >> 18) & 0x7) ^  (((addr_tmp) >> 28) & 0x7) );
          addr_tmp  = ((addr_tmp & 0xfffffff8ff) | (b_new << 8) ); // 8,9,10 bank bits
          addr_tmp  = (addr_tmp >> 4)  & 0xfffffffff;
          //fprintf(dram_tree->fp,"addr_tmp 2 = %x ;\n",addr_tmp);
	  
	  if(t_mask < 0x200){
	    if(check_alist(addr_tmp)){
	      fprintf(dram_tree->fp, "\'h%llx/%1x%x%x%x", (addr_tmp & 0xfffffffff), d_buf[1] & 0xf, d_buf[0] & 0xf,
		      d_buf[3] & 0xf, d_buf[2] & 0xf);
	      for(i = 0; i < 16;i++)fprintf(dram_tree->fp,"%02x",  ecc[i] & 0xff);
	      fprintf(dram_tree->fp,";\n");
	    }
	    else{
	      for(i = 0; i < 16;i++){
		if(ecc[i]){
		  fprintf(dram_tree->fp, "\'h%llx/%1x%x%x%x", (addr_tmp & 0xfffffffff), d_buf[1] & 0xf, d_buf[0] & 0xf,
			  d_buf[3] & 0xf, d_buf[2] & 0xf);
		  for(i = 0; i < 16;i++)fprintf(dram_tree->fp,"%02x",  ecc[i] & 0xff);
		  fprintf(dram_tree->fp,";\n");
		  break;
		}
	      }
	    }
	  }
	}
      }
      (*addr)  += 8;//data[0]-> size / ADDRESS;
      *num_bit -= 64;
    } // if (num_bit >= 64)
  }
#ifdef J_DEBUG
  io_printf("Info_J: - d_buf=%x,d_ind=%x,num_bit=%x,l_bit=%x,b_ind=%x\n", *d_buf, *d_ind, *num_bit, *l_bit, *b_ind);
  io_printf("Info_J: (store_into_rdram) END\n");
#endif
}
/*-------------------------------------------------------------------------------
   read mem.image and build memory.
--------------------------------------------------------------------------------*/
void padding(char* buf, int index)
{
  int num,  ind;
  char ch;
  ind = index;
  num = 0;
  
  while(num < 64){
    if(buf[ind] == ' '){
      ind++;
      continue;
    }
    if((buf[ind] == '\n') || (buf[ind] == '\0')){
      break;
    }
    ind++;
    num++;
  } 
  if(num < 64){//do padding
    ind--;
    if(buf[ind] != ' ')ind++;
    while(num < 64){
      if((num % 16) == 0){
	buf[ind] = ' ';
	ind++;
      }
      buf[ind] = '0';
      ind++;
      num++;
    }
    buf[ind] = '\n';
  }
}
/*-------------------------------------------------------------------------------
   read mem.image and build memory.
--------------------------------------------------------------------------------*/
void padding_front(char* buf, int tot)
{
  int num, ind;
  ind = 0;
  num = 0;
 
  while(num < tot){
    if(((num % 16) == 0) && num){
      buf[ind] = ' ';
      ind++;
    }
    buf[ind] = '0';
    ind++;
    num++;
  }
  buf[ind] = '\n';
}
/*-------------------------------------------------------------------------------
   read mem.image and build memory.
--------------------------------------------------------------------------------*/
void padding_zero(char* buf, long long *addr)
{ 

  int fill, len, ind, num, spc;
  if((*addr) % 64){
    fill   = (*addr) & 0x3f;    
    spc    = fill / 8;
    fill   <<= 1;
    *addr |= 0x3f;
    *addr ^= 0x3f;

    len   = strlen(buf); 
    for(ind = 0; ind < len;ind++)buf[fill+ind+spc] = buf[ind];
    buf[fill+ind+spc] = '\n';
    num = 0;
    ind = 0;
 
    while(num < fill){
      if(((num % 16) == 0) && num){
	buf[ind] = ' ';
	ind++;
      }
      buf[ind] = '0';
      ind++;
      num++;
    }
    buf[ind] = ' '; 
  }
}
/*-------------------------------------------------------------------------------
  check the address range based on dram config.
  if io space, not slam into dram.
--------------------------------------------------------------------------------*/
int check_address_range(long long addr)
{
  // if(addr & 0xe000000000){
  //   io_printf("Warning: phyical address out of range(%llx)\n", addr);
  //   return 0;
  // }
  return 1;
}
/*-------------------------------------------------------------------------------
   read mem.image,
   build dimm memory structure based on the dram configuration.
--------------------------------------------------------------------------------*/
void build_rdram(FILE *fp,  int wh){
  long long  addr, tmp_addr;
  char  buf[BUFFER], d_buf[BUFFER], ecc[16];
  int   index, d_ind, num_bit, l_bit, b_ind, out, outb, aidx, new_addr, zero, beg;
  new_addr = 0;
  addr = 0;d_ind   = 0;num_bit = 0;l_bit   = 0;b_ind = 0;out = 1;//initial
  beg  = 1;

// #ifdef J_DEBUG
  io_printf("Info_J: (build_rdram) dram_type=0x%x.\n",wh);
// #endif

  while(fgets(buf, BUFFER, fp)){
    index = remove_leading_space(buf, 0, BUFFER);
    if(index < 0)continue;
    if(strncmp(buf, "//", 2) == 0){//find zero_bytes
      zero     = check_single_comment(index, buf, &addr);
      tmp_addr = addr;
      continue;
    }
    tmp_addr = addr;
    outb     = out;
    if(check_at_symbol(buf, &addr, &aidx)){//get address
      out = check_address_range(addr);
      if(aidx)check_single_comment(aidx, buf, &addr);

      if((tmp_addr % 64) && outb){
	buf[0] = '\0';
	index  = 0; 
	padding(buf, index);
	store_into_rdram(buf, &tmp_addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, wh);
      }

      mask_value(dram_tree->addr, &addr);
      d_ind   = 0;num_bit = 0;l_bit   = 0;
      b_ind   = 0;

      if((addr & 0x3f) && dram_tree->spill && outb){
	tmp_addr  = addr;
	tmp_addr |= 0x3f;
	tmp_addr ^= 0x3f;
	buf[0]    =  '\0';
	padding_front(buf, 64);
	store_into_rdram(buf, &tmp_addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, wh);
      }

      new_addr = 1;
      continue;
    }
    if(out){
      padding(buf, index);
      if((dram_tree->spill == 0) && (new_addr || beg))padding_zero(buf, &addr); 
      store_into_rdram(buf, &addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, wh);
      new_addr = 0;
      zero     = 0;
      beg      = 0;
    }
  }
  if((addr % 64) && out){
    buf[0] = '\0';
    index  = 0; 
    padding(buf, index);
    store_into_rdram(buf, &addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, wh);
  }
}
/*-------------------------------------------------------------------------------
  initialize dram.
--------------------------------------------------------------------------------*/
void init_dram_call(){
  char         *str;
  FILE         *fp;
  io_printf("Info: reading mem.image\n");
  //allocate top tree.
  dram_tree              = (avl_conf_ptr)malloc(sizeof(struct avl_conf_node));
  dram_tree->addr        = 40;//address size;
  dram_tree->size        = 4;//tf_getp(2);//get data width
  dram_tree->word        = dram_tree->size / 32;
  dram_tree->dram        = 0;//dram
  dram_tree->obj         = (Q_head_ptr)malloc(sizeof(struct Q_head_node));
  dram_tree->obj->head_ptr = 0;
  dram_tree->obj->tail_ptr = 0;
  dram_tree->obj->next_ptr = 0;
  dram_tree->reg_flag      = 0;
  dram_tree->cptr          = 0;
  if((dram_tree->size % 32) != 0)dram_tree->word++; 
  //pointer for avl tree set NULL
  dram_tree->data        = 0;
  str                    = tf_getcstringp(1);  // get a file name.
  dram_type              = tf_getp(2);//get dram config
  dram_tree->prev_ptr    = 0;
  dram_tree->prev_addr   = 0;
  if((fp = fopen(str, "r")) == 0){
    tf_error("Error: $init_dram can not open file %s for reading\n", str);
    //tf_dofinish();
    return ;
  }

// #ifdef J_DEBUG
  io_printf("Info_J: (init_dram) open file %s to read.\n",str);
// #endif

  dram_tree->spill = 0;
  dram_tree->obj_on= 0;
  str      = mc_scan_plusargs ("spill_dram=");
  if(str != (char *) 0){
    dram_tree->spill = 1;
    if((dram_tree->fp = fopen(str, "w")) == 0){
      tf_error("Error: can not open file %s for denali data writing\n", str);
      tf_dofinish();
    }
  }
  build_rdram(fp, dram_type);
  fclose(fp);
  if(dram_tree->spill)fclose(dram_tree->fp);
  //slam value if not specified, randomly initialize.
  str      = mc_scan_plusargs ("slam_value="); 
  slam_val = 1;
  if(str != (char *) 0)slam_val = 0;
  //check dram run time error inject option.
  dram_tree->dram_error         = 0; 
  dram_tree->dram_error_counter = 0;
  dram_tree->taken              = 0;
  dram_tree->not_taken          = 0;
  str = mc_scan_plusargs ("dram_runtime_error=");
  if(str != (char *) 0)dram_tree->dram_error = atoi (str);

  dram_tree->dram_error_percent = 10;
  str = mc_scan_plusargs ("dram_runtime_percent=");
  if(str != (char *) 0)dram_tree->dram_error_percent = atoi (str);
}
/*-------------------------------------------------------------------------------
  $write_mem call routine.
--------------------------------------------------------------------------------*/
unsigned int in_order_call(){
  FILE*        fp;
  avl_conf_ptr handle;
  int          shft;
  char         *str;

  if(tf_nump() < 2){
    io_printf("arg %d\n", tf_nump());
    tf_error("$in_order call requires at least two arguments(address, datawidth).");
    tf_dofinish();
  }
  shft = -1;
  if(tf_nump() > 2){
    shft = tf_getp(3);
  }
  str = tf_getcstringp(2); 
  if((fp = fopen(str, "w")) == 0){
    tf_error("Error: $in_order can not open file %s for writing\n", str);
    tf_dofinish();
  }
  else{
    handle = (avl_conf_ptr) tf_getp(1);
    in_order(&(handle)->data, fp, &shft, &(handle)->size);
    fclose(fp);
  }
}
/*-------------------------------------------------------------------------------
  dump verilog instance contents.
--------------------------------------------------------------------------------*/
int v_set_delay_call(){
  handle hand;
  double rise, fall, toz;
  acc_initialize();
  acc_configure(accPathDelayCount, "3");
 
  hand = acc_handle_by_name(tf_getcstringp(1), 0);
  switch(acc_fetch_delay_mode(hand)){
  case accDelayModeNone : io_printf("none\n");break;
  case accDelayModePath : io_printf("path\n");
  }
  acc_replace_delays(hand, rise, fall, toz);
  acc_close();
}
/*-------------------------------------------------------------------------------
  dump verilog instance contents.
--------------------------------------------------------------------------------*/
int v_force_call(){

  handle hand;
  s_setval_value valStruct;
  s_setval_delay delStruct;
  s_acc_time     timStruct;

  acc_initialize();
  hand = acc_handle_by_name(tf_getcstringp(1), 0);
  if(!hand){
    io_printf("%0d : Info: Object not found %s\n", tf_gettime(), tf_getcstringp(1));
    acc_close();
    return 0;
  }
  valStruct.format    = accBinStrVal;
  valStruct.value.str = (char*)malloc(acc_fetch_size(hand));
  strcpy(valStruct.value.str, tf_getcstringp(2));

  switch(acc_fetch_type(hand)){
  case accNet : 
    delStruct.model = accForceFlag;
    break;
  case accRegister :
    timStruct.type  = accTime;
    timStruct.low   = 5;
    timStruct.high  = 0;
    delStruct.time  = timStruct;
    delStruct.model = accInertialDelay;
  }
  acc_set_value(hand, &valStruct, &delStruct);
  acc_close();
}
/*-------------------------------------------------------------------------------
  dump verilog instance contents.
--------------------------------------------------------------------------------*/
int v_dump_call(){
  handle hand;
  s_acc_value vector;
  int v_size, msb, lsb;
  acc_initialize();
  hand = acc_handle_by_name(tf_getcstringp(1), 0);
  if(!hand){
    io_printf("%0d : Info: Object not found %s\n", tf_gettime(), tf_getcstringp(1));
    acc_close();
    return 0;
  }
  switch(acc_fetch_type(hand)){
  case accRegister:
    io_printf("%0d : Info -> %s = 0x%s\n", tf_gettime(), tf_getcstringp(1), 
	      acc_fetch_value(hand, "%h", 0));
    break;
  case accNet :
    io_printf("%0d : Info -> %s = 0x%s\n", tf_gettime(), tf_getcstringp(1), 
	      acc_fetch_value(hand, "%h", 0));
    break;
  default : 
    v_size = acc_fetch_size(hand);
    acc_fetch_range(hand, &msb, &lsb);
  }
  acc_close();
}
/*-------------------------------------------------------------------------------
  initialize memory.
--------------------------------------------------------------------------------*/
void warm_specified(int val, int size, int arg_loc){
  char* avalPtr, *bvalPtr;
  int  word, ind, groups;
  s_tfnodeinfo node_info;

  ind = 0;
  tf_nodeinfo(arg_loc, &node_info);
  switch(node_info.node_type){
  case TF_MEMORY_NODE :
    if(size > node_info.node_mem_size)return;
    word    = node_info.node_ngroups * 2;
    avalPtr = node_info.node_value.memoryval_p + size * word;
    bvalPtr = avalPtr + node_info.node_ngroups;
    for(groups = node_info.node_ngroups - 1; groups >= 0;groups--){
      avalPtr[groups] =  val & 0xff;
      bvalPtr[groups] =  0;
      ind++;
    }
    break;
  case TF_REG_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      node_info.node_value.vecval_p[groups].avalbits = val & 0xff;
      node_info.node_value.vecval_p[groups].bvalbits = 0;
    }
    tf_propagatep(arg_loc);
    break;
  case TF_NETVECTOR_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      node_info.node_value.vecval_p[groups].avalbits = val & 0xff;
      node_info.node_value.vecval_p[groups].bvalbits = 0;
    }
    tf_propagatep(arg_loc);
    break;
  }
}
/*-------------------------------------------------------------------------------
  dump verilog instance contents.
--------------------------------------------------------------------------------*/
int slam_mem_call(){
  FILE *fp;
  char *str;
  int val, addr;

  str = tf_getcstringp(1);  // a get file name.
  if((fp = fopen(str, "r")) == 0){
    io_printf("Warning -> SPD not set(File not Found %s)\n", str);
    return 0;
  }
  while(fscanf(fp, "%x %x", &addr, &val) != EOF)warm_specified(val & 0xff, addr & 0xff, 2);
  fclose(fp);
}
/*-------------------------------------------------------------------------------
 syndrome for irf and frf.
--------------------------------------------------------------------------------*/
char syndrome(char* data, int fl)
{
  int   i, j, ind;
  char bits [64], ch, byte[8];
  int num = fl ? 4 : 8;
  ind     = 0;

  for(i = num - 1 ; i >= 0;i--){
    ch  = data[i];
    for(j = 0; j < 8;j++){
      bits[ind] = ch & 1;
      ind++;
      ch  >>= 1;
    }
  }

  if(fl){
    byte[0]  = bits[0]  ^ bits[1]  ^ bits[3]  ^ bits[4]  ^ bits[6]  ^
               bits[8]  ^ bits[10] ^ bits[11] ^ bits[13] ^ bits[15] ^
               bits[17] ^ bits[19] ^ bits[21] ^ bits[23] ^ bits[25] ^
               bits[26] ^ bits[28] ^ bits[30];

    byte[1]  = bits[0]  ^ bits[2]  ^ bits[3]  ^ bits[5]  ^ bits[6]  ^
               bits[9]  ^ bits[10] ^ bits[12] ^ bits[13] ^ bits[16] ^
               bits[17] ^ bits[20] ^ bits[21] ^ bits[24] ^ bits[25] ^
               bits[27] ^ bits[28] ^ bits[31];

    byte[2]  = bits[1]  ^ bits[2]  ^ bits[3]  ^ bits[7]  ^ bits[8]  ^
               bits[9]  ^ bits[10] ^ bits[14] ^ bits[15] ^ bits[16] ^
               bits[17] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25] ^
               bits[29] ^ bits[30] ^ bits[31]; 

    byte[3]  = bits[4]  ^ bits[5]  ^ bits[6]  ^ bits[7]  ^ bits[8]  ^
               bits[9]  ^ bits[10] ^ bits[18] ^ bits[19] ^ bits[20] ^
               bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25];
    
    byte[4]  = bits[11] ^ bits[12] ^ bits[13] ^ bits[14] ^ bits[15] ^
               bits[16] ^ bits[17] ^ bits[18] ^ bits[19] ^ bits[20] ^
               bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25];

    byte[5]  = bits[26] ^ bits[27] ^ bits[28] ^ bits[29] ^ bits[30] ^
               bits[31];

    byte[6]  = bits[0]  ^ bits[1]  ^ bits[2]  ^ bits[4]  ^ bits[5]  ^
               bits[7]  ^ bits[10] ^ bits[11] ^ bits[12] ^ bits[14] ^
               bits[17] ^ bits[18] ^ bits[21] ^ bits[23] ^ bits[24] ^
               bits[26] ^ bits[27] ^ bits[29];
    ch = 0;
    byte[1] <<= 1;byte[2] <<= 2;byte[3] <<= 3;
    byte[4] <<= 4;byte[5] <<= 5;byte[6] <<= 6;
    for(i = 0; i < 7; i++)ch |= byte[i];
  }
  else {
    byte[0]  = bits[0]  ^ bits[1]  ^ bits[3]  ^ bits[4]  ^ bits[6]  ^ bits[8]  ^ bits[10] ^
               bits[11] ^ bits[13] ^ bits[15] ^ bits[17] ^ bits[19] ^ bits[21] ^ bits[23] ^
               bits[25] ^ bits[26] ^ bits[28] ^ bits[30] ^ bits[32] ^ bits[34] ^ bits[36] ^
               bits[38] ^ bits[40] ^ bits[42] ^ bits[44] ^ bits[46] ^ bits[48] ^ bits[50] ^
               bits[52] ^ bits[54] ^ bits[56] ^ bits[57] ^ bits[59] ^ bits[61] ^ bits[63];

    byte[1]  = bits[0]  ^ bits[2]  ^ bits[3]  ^ bits[5]  ^ bits[6]  ^ bits[9]  ^ bits[10] ^
               bits[12] ^ bits[13] ^ bits[16] ^ bits[17] ^ bits[20] ^ bits[21] ^ bits[24] ^
               bits[25] ^ bits[27] ^ bits[28] ^ bits[31] ^ bits[32] ^ bits[35] ^ bits[36] ^
               bits[39] ^ bits[40] ^ bits[43] ^ bits[44] ^ bits[47] ^ bits[48] ^ bits[51] ^
               bits[52] ^ bits[55] ^ bits[56] ^ bits[58] ^ bits[59] ^ bits[62] ^ bits[63];

    byte[2]  = bits[1]  ^ bits[2]  ^ bits[3]  ^ bits[7]  ^ bits[8]  ^ bits[9]  ^ bits[10] ^
               bits[14] ^ bits[15] ^ bits[16] ^ bits[17] ^ bits[22] ^ bits[23] ^ bits[24] ^
               bits[25] ^ bits[29] ^ bits[30] ^ bits[31] ^ bits[32] ^ bits[37] ^ bits[38] ^
               bits[39] ^ bits[40] ^ bits[45] ^ bits[46] ^ bits[47] ^ bits[48] ^ bits[53] ^
               bits[54] ^ bits[55] ^ bits[56] ^ bits[60] ^ bits[61] ^ bits[62] ^ bits[63];
    
    byte[3]  = bits[4]  ^ bits[5]  ^ bits[6]  ^ bits[7]  ^ bits[8]  ^ bits[9]  ^ bits[10] ^
               bits[18] ^ bits[19] ^ bits[20] ^ bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^
               bits[25] ^ bits[33] ^ bits[34] ^ bits[35] ^ bits[36] ^ bits[37] ^ bits[38] ^
               bits[39] ^ bits[40] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^ bits[53] ^
               bits[54] ^ bits[55] ^ bits[56];

    byte[4]  = bits[11] ^ bits[12] ^ bits[13] ^ bits[14] ^ bits[15] ^ bits[16] ^
               bits[17] ^ bits[18] ^ bits[19] ^ bits[20] ^ bits[21] ^ bits[22] ^ bits[23] ^
               bits[24] ^ bits[25] ^ bits[41] ^ bits[42] ^ bits[43] ^ bits[44] ^ bits[45] ^
               bits[46] ^ bits[47] ^ bits[48] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^
               bits[53] ^ bits[54] ^ bits[55] ^ bits[56];

    byte[5]  = bits[26] ^ bits[27] ^ bits[28] ^ bits[29] ^ bits[30] ^ bits[31] ^
               bits[32] ^ bits[33] ^ bits[34] ^ bits[35] ^ bits[36] ^ bits[37] ^ bits[38] ^
               bits[39] ^ bits[40] ^ bits[41] ^ bits[42] ^ bits[43] ^ bits[44] ^ bits[45] ^
               bits[46] ^ bits[47] ^ bits[48] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^
               bits[53] ^ bits[54] ^ bits[55] ^ bits[56];

    byte[6]  = bits[57] ^ bits[58] ^ bits[59] ^ bits[60] ^ bits[61] ^ bits[62] ^ bits[63];
 
    byte[7]  = bits[0]  ^ bits[1]  ^ bits[2]  ^ bits[4]  ^ bits[5]  ^ bits[7]  ^ bits[10] ^ bits[11] ^
               bits[12] ^ bits[14] ^ bits[17] ^ bits[18] ^ bits[21] ^ bits[23] ^ bits[24] ^ bits[26] ^
               bits[27] ^ bits[29] ^ bits[32] ^ bits[33] ^ bits[36] ^ bits[38] ^ bits[39] ^ bits[41] ^
               bits[44] ^ bits[46] ^ bits[47] ^ bits[50] ^ bits[51] ^ bits[53] ^ bits[56] ^ bits[57] ^
               bits[58] ^ bits[60] ^ bits[63];
    ch = 0;
    byte[1] <<= 1;byte[2] <<= 2;byte[3] <<= 3;
    byte[4] <<= 4;byte[5] <<= 5;byte[6] <<= 6;byte[7] <<= 7;
    for(i = 0; i < 8; i++)ch |= byte[i];
  }
  return ch;
}
/*-------------------------------------------------------------------------------
  slam memory with random.
8: initial -> irf register
4; initial -> frf register
--------------------------------------------------------------------------------*/
int slam_random_call()
{
  int   size, num, word, groups, fl, ind, val, rnd;
  char* avalPtr, *bvalPtr, ch;
  char  data[8];
  char  *pargs;
  
  unsigned int seed;

  s_tfnodeinfo node_info;
  tf_nodeinfo(1, &node_info);
  pargs = mc_scan_plusargs ("tg_seed=");  
  if(pargs != (char *) 0) {
    seed = atoi(pargs);
    srand(seed);
    srandom(seed);
  }
  if(tf_getp(3) == 2){
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      node_info.node_value.vecval_p[groups].avalbits = random() & 0xffffffff;
      node_info.node_value.vecval_p[groups].bvalbits = 0;
    }
    tf_propagatep(1);
  }
  else{
    pargs  = mc_scan_plusargs ("slam_value="); 
    rnd    = 1;
    if(pargs != (char *) 0) {
      val  = atoi (pargs);
      rnd  = 0;
    }
    
    num  = tf_getp(2);
    fl   = tf_getp(3);
    word = node_info.node_ngroups * 2;
    for(size = 0;size < num;size++){
      avalPtr  = node_info.node_value.memoryval_p + size * word;
      bvalPtr  = avalPtr + node_info.node_ngroups;
      ind      = fl ? 3 : 7;
      for(groups = 0; groups < node_info.node_ngroups; groups++){
	if(ind < 0){
	  ch = syndrome(data, fl);
	  avalPtr[groups] = ch & 0xff;
	  bvalPtr[groups] = 0;
	  continue;
	}
	ch              = rnd ? random() & 0xff : val;
	avalPtr[groups] = ch;
	bvalPtr[groups] = 0;
	data[ind]     = ch;
	ind--;
      }
    }
  }
}
#endif
