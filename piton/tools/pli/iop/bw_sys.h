// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bw_sys.h
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

#ifndef _BW_SYS_H_
#define _BW_SYS_H_
#include "global.h"
#include "list.h"
#include "strclass.h"
//This class include all the system interface.

class bw_sys : public strclass<KeyType> {
private:
  avl<List<event_record> > phy_event;
  event_record_ptr         one_event; 
  List<event_record>*      event_list;
  //random off
  int off_random;
  //private variable
  bool start_bit, sso_ready;
  int  ssi_idx, idx;
  bool hit;
  char rcv[SSI_NUM];
  KeyType addr, mask_addr, write_data, key;
  List<sso_record> sso_Q;
  sso_record_ptr   sso_r;
  char ch;
  bool dont_kill;
  //system memory.
  b_tree_node_ptr* sysMem;  
  b_tree_atom_ptr  data; //keep system data
  void get_data(char* serial, int num, int sz);
  //check parity of ssi data.
  bool parity(char* buf, int num);
  //translate sso data
  void xlation();
  //merge serial data.
  int merged(char* sr, int st,int en);
  long long  mergedl(char* sr, int st, int en);
  void write(int sz);
  void read_evfile(char* str);
  //Hit or not.
  void  hit_addr();
  //public domain
public:
  //constructor
  int manual_init(b_tree_node_ptr* mem);
  //ssi interface 
  void ssi(int);
  void sso(int);
  void option(char* str);
};
#endif
