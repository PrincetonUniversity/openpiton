// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob.h
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

#ifndef _IOB_H_
#define _IOB_H_
#include <map>
#include <list>
#include "global.h"
#include "pcx.h"
#include "cpx.h"
#include "bw_lib.h"
#include <string.h>
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif
//do iob operations

class iob {
  //start private funcs and variable here
private:
  //event flag
  char  *pargs;// argument variable
  b_tree_atom_ptr data;
  //pc event variables
  event_record_ptr         one_event; 
  std::list<event_record*>*      event_list;
  std::map<KeyType, std::list<event_record*> > inst_event;
  
  //cpx request variable
  //no request zero. One hot
  char grant, req, thrid;
  //flag for cpx packet.
  int pkt_vld, next_req, next_cpx;
  // ccx qsel
  int Qsel[8];
  //index 
  int groups, idx;
  //low and high byte for tf_getlongp
  int low, high; 
  //event key
  KeyType pc, key;
  //keep pcx packet in the pcx list.
  int pcx_pkt[4];
  std::list<pcx*> pcx_list;
  std::list<pcx*> pcx_heap;
  std::list<cpx*> cpx_list;
  std::list<cpx*> cpx_heap;
  //temporary pcx packet.
  pcx pcx_inst, *p_pkt;
  cpx cpx_inst, *c_pkt;
  //tf variable for cpx packet.
#ifndef PITON_DPI
  s_tfnodeinfo node_info;
#endif // ifndef PITON_DPI
  int *ptr;
  //interrupt register

  //routines
  void boot();
  void get_event(char* ev);
  void handle_pcx();  
  void handle_cpx();  
  void gen_event();
#ifndef PITON_DPI
  //drive signals, which is less than 32 bits.
  void trig_pc_event();
#endif // ifndef PITON_DPI
  void replace(char* str);
  void copy(char* buf, int* idx,  char* cbuf);
  KeyType getEight(char *buf);
  void rmhexa(char* buf);
public:
  //constructor
  int manual_init(char *ev);
  //iob functions
  void do_iob();
#ifndef PITON_DPI
  void drive_cpx(int loc);
#else // ifndef PITON_DPI
  int drive_cpx();
  int get_cpx_word(int index);
  void trig_pc_event(unsigned long long thread_pc);
#endif // ifndef PITON_DPI
  void drive_req();
};
#endif
