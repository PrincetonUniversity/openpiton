// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: slam.h
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

#ifndef _SLAM_H_
#define _SLAM_H_
#include "global.h"

class slam{
private:
  FILE *fp;//file pointer
  int cpu_status; 
  //poniter
  s_tfnodeinfo node_info;
  char *avalPtr, *bvalPtr;
  int pos;//current argment location.

  //dcache
  int  dcache_num, dtag_num, dvalid_num;
  char *dcache_w[4][8];
  char *dcache_tag[8];
  int  dcache_vld[8];
  //icache
  int  icache_num, itag_num, ivalid_num;
  char *icache_data[8];
  char *icache_tag[8];
  int  icache_vld[8];
  /*
  char      *dir_iarray[16 * BANK];
  long long  dir_ivalid[16 * BANK];
  long long  dir_iparity[16* BANK];
  
  char      *dir_darray[16 * BANK];
  long long dir_dvalid[16 * BANK];
  long long dir_dparity[16* BANK];
  int ddir_num,  dir_num;
  */
  //set l1 cache args
  //way and inde
  int way, index, cpu, row, bank, pair, panel;
  long long tag;

  void l1arg(int pos);
  void slam_l1ddata(char* data);
  void slam_data(char* word, int size);
  void slam_data(long long word, int size);
  void find_location(int *vld );
  void slam_dcache(char* data, int num);

public:
  //constructor
  slam();

  //l1 slam routine
  void l1slam(char *file);
  //l2 slam routine
  void l2slam(char *file);
};
#endif
