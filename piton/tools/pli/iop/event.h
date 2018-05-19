// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: event.h
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
#ifndef _EVENT_H_
#define _EVENT_H_

#include "global.h"
#include "pcx.h"
#include "list.h"
#include "strclass.h"
//Here we keep the pc events
class event : public strclass<KeyType>{
private:
  //temporary variables
  int idx, kind, event_type;
  //event list.
  List<event_record>*      event_list;
  //event key
  KeyType pc, key;
  pcx *pcx_pkt;
  //variable for window register memory
  s_tfnodeinfo node_info; 
  char* avalPtr, *bvalPtr;
  long long val;
  int       size, groups;
  void clear();
  int get_reg(char* buf);
  //drives
  void drive_warmrst();
  void drive_extint();
  void drive_temptrig();
  void drive_clkstretch();
  void drive_cpxstall();
  void drive_pcxstall();
  //event variables
  int warmrst,  warm_ready,     warmrst_delay;
  int extint,   extint_ready,   extint_delay;
  int clkstretch,   clkstretch_ready,   clkstretch_delay;
  int temptrig, temptrig_ready, temptrig_delay;
  int cpxstall, cpxstall_ready, cpxstall_delay[8], cpx_done;
  int pcxstall, pcxstall_ready, pcxstall_delay[8], pcx_done;
public:
  //event list.
  avl<List<event_record> > pc_event;
  event_record_ptr         one_event; 
  //constructor.
  event();
  event(char* str);
  //read diag.ev file
  void read_evfile(char* );
  //void read(char* str);
  void xlation(event_record* src, pcx*);
  int hit_pc(long long pc);
  int which_event();
  //printhex and dec event.
  void print(int thrid, int wind);
  //set even variable
  void set_warm();
  void set_extint(int);
  void set_temptrig(int);
  void set_clkstretch(int);
  void set_cpxstall(int wait, int cpu);
  void set_pcxstall(int wait, int cpu);
  //Is it any pending request?
  void checker();
  void cpx_checker();
};
#endif
