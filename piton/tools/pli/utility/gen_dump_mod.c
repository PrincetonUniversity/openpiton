// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: gen_dump_mod.c
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
    gen_dump_mod.c
********************************************************************************
$mon_init();
$info (level, farmat-string, args ...);
$error (tag-string, farmat-string, args ...);
$warn (tag-string, farmat-string, args ...);

$infow (level, farmat-string, args ...);
will not add newline after print.

Monitor activation example:

vcs +mon0=cpu0:25 +mon1=ccx:10 +diserr=cerr:uerr +diswarn=abc:xyz

*/

#include "veriuser.h"
#include "acc_user.h"
#include <stdlib.h>
#include "malloc.h"
#include "string.h"
#include "ctype.h"  /* for toupper */
#include <stdio.h>  /* for sscanf.h */


FILE *fp;

/************************************************************************/
/* $genDumpMod_check check routine                                        */
/************************************************************************/
void genDumpMod_check(int data, int reason)
{
  return;
}

handle next_level(handle h, int l)
{
  handle child_handle;

  if (l == 0) return null;

  child_handle = null;

  while (child_handle = acc_next_child (h, child_handle)) {
    next_level (child_handle, l-1);
    fprintf (fp, "%s\n", acc_fetch_fullname (child_handle));
  }
}



/************************************************************************/
/* genDumpMod_call routine                                         */
/************************************************************************/

void genDumpMod_call(int data, int reason)
{
  handle child_handle, module_handle;
  char   *pargs, *ptr, *mod_name;
  int    pargs_found, level;
  char   buf[128];

  pargs = mc_scan_plusargs ("gen_dump_module="); 

  pargs_found = 0;
  if (pargs != (char *)0) {
    strcpy(buf, pargs);
    mod_name = strtok (buf, ":");
    ptr = strtok (NULL, " \n");
    level = atoi (ptr);
    if (level > 0 ) {pargs_found = 1;}
  }

  if (pargs_found == 0) return;
  io_printf ("%s %d\n", mod_name, level);
  
  if ((fp = fopen("dump.mod", "w")) == 0)
    tf_error ("can't open dump.mod file\n");

  acc_initialize();

  module_handle = acc_handle_object (mod_name);
  child_handle = null;

  next_level (module_handle, level);
  acc_close();
  fclose (fp);
  tf_dofinish();
}

