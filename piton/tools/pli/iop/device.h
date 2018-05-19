// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: device.h
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
#ifndef _DEVICE_H_
#define _DEVICE_H_
#include "global.h"
#include "pcx.h"
#define  PKT_SIZE 6
class device{
private:
  int wait, vld, pointer;
  int num, odd;
  char buf[10];
  //hold the io device data.
  int j_pkt[PKT_SIZE];
  void clean();
 
public:
  int ready;
  //constructor
  device();
  void xlation(pcx* pkt);
  bool dec_wait();
  bool dram_driver(int loc);
  bool jbi_driver(int loc);
};
#endif
