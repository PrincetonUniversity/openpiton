// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pcx.h
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

#ifndef _PCX_H_
#define _PCX_H_
#include "global.h"
#define PCX_SIZE 4

class pcx{
 //start private funcs and variable here
private:
  int idx;

public:
  //public pcx packet field vaiable
  char  cpu_id; 
  char  thrid;
  int true_id;

  char  wait ;
  //pkt holds the pcx packet.
  int pkt[4];
  //constructor
  pcx(int* pkt);
  pcx(){wait = random() & 0x7;}//no initialize
  int  get_delay(){--wait;return wait;}
  void set_delay(){wait = 1;}
  //clean
  void clean();
};
#endif
