// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: vpi_user.c
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

/* dummy VPI file */

#include "acc_user.h"
#include "vpi_user.h"
#include "vpi_user_cds.h"
#include "stdio.h"

int tf_vpi()
{
}

register_vpi()
{ 
  s_vpi_systf_data func; 
  p_vpi_systf_data pfunc = &(func);
  func.type = vpiSysTask;
  func.tfname = (char *) malloc(20);
  strcpy(func.tfname,"$dummy_vpi");
  pfunc->calltf = (int(*) ()) tf_vpi;
  pfunc->compiletf= NULL;
  /* vpi_register_systf(pfunc); */
}


void (*vlog_startup_routines[VPI_MAXARRAY])() = 
{
  register_vpi,
  0 
};

