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
vcs +mon0=cpu0:25 +mon1=ccx:10
*/
#ifndef _MEM_H_
#define _MEM_H_

// #define J_DEBUG 1

#include "veriuser.h"
#include "acc_user.h"
#include <stdio.h>
#include <stdlib.h>
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif

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
  return 0;
}
#endif
