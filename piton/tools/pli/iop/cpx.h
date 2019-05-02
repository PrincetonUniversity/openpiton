// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: cpx.h
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

#ifndef _CPX_H_
#define _CPX_H_
#include "global.h"
#include "pcx.h"
#define CPX_SIZE 4

#define INT_RET         0x7

class cpx{
 //start private funcs and variable here
private:
  int idx, cpx_wait, req_wait, cpu, pdata;  
  //packet field
  char req_sent, req;
  //cpx packet
  int cpx_pkt[5];
  
 //start funcs and variable here

public:
  //constructor
  char cpu_id, thrid;
  int true_id;
  cpx();
  void  xlation(pcx* pkt, char* data);
  int*  get_cpx();
  void  dec_wait();
  int   get_req_wait(){return (req_wait == 0) && (req_sent == 1);}
  int   get_cpx_wait(){return (cpx_wait == 0) && (req_sent == 2);}
  int   get_req();
  void  clean();
};
#endif
