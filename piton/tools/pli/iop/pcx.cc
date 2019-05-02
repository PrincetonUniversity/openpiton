// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: pcx.cc
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
#include "pcx.h"
/*------------------------------------------
  constructor.
--------------------------------------------*/
pcx::pcx(int* p)
{
  wait = random() & 0x7;
  for(idx = 0; idx < 4;idx++)pkt[idx] = p[idx];
}
/*------------------------------------------
  clean paket.
--------------------------------------------*/
void pcx::clean()
{
  for(idx = 0; idx < 4;idx++)pkt[idx] = 0;
}
