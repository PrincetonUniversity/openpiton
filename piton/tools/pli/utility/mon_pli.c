// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mon_pli.c
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
    mon_pli.c
********************************************************************************
$mon_init();

Monitor activation example:

vcs +mon0=cpu0:25 +mon1=ccx:10

*/

#include "veriuser.h"
#include "acc_user.h"
#include <stdlib.h>
#include "string.h"
#include "ctype.h"  /* for toupper */
#include "stdio.h"  /* for sscanf.h */


#define MAX_STRING_LEN 1000
#define ARG0 0
#define ARG1 1
#define ARG2 2


static char mon_name_buf[64];
static char *mon_inst_path[128];
static int  mon_level[128];
static int mon_path_num;

static int monInit_done = 0 ;

char format_buffer[4096];

static void
get_time (int *ms, int *us, int *ns, int *ps)
{
  unsigned long long llx, lly;
  int time_lo, time_hi;

  time_lo = tf_getlongtime (&time_hi);
  llx = time_lo; llx = (llx << 32) >> 32;
  lly = time_hi; lly = (lly << 32);
  lly |= llx;

  *ps = lly % 1000; lly /= 1000;
  *ns = lly % 1000; lly /= 1000;
  *us = lly % 1000; lly /= 1000;
  *ms = lly;
}

/*
 * format function
 */
char *format(char *mipname)
{
  int num_args, cur_arg, len, i, j;
  char *fmt_str, *ptr, c;

  num_args = tf_nump();
  cur_arg = 3;
  len = sprintf (format_buffer, " ");
  fmt_str = tf_getcstringp(ARG2);

  ptr = format_buffer + len;
  while (1) {
    c = *fmt_str++;
    if (c == 0)      break;
    if (c == '%') {
      c = *fmt_str++;
      switch (c) {
	case 'b':
	  len = sprintf (ptr, "%s", tf_strgetp(cur_arg, 'b'));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'o':
	  len = sprintf (ptr, "%s", tf_strgetp(cur_arg, 'o'));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'd':
	  len = sprintf (ptr, "%s", tf_strgetp(cur_arg, 'd'));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'h':
	  len = sprintf (ptr, "%s", tf_strgetp(cur_arg, 'h'));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'e':
	  len = sprintf (ptr, "%e", tf_getrealp(cur_arg));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'f':
	  len = sprintf (ptr, "%e", tf_getrealp(cur_arg));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 't':
	  len = sprintf (ptr, "%d", tf_gettime());
	  ptr = ptr + len;
	  break;

	case 's':
	  len = sprintf (ptr, "%s", tf_strgetp(cur_arg, 'e'));
	  ptr = ptr + len;
	  cur_arg++;
	  break;

	case 'm':
	  len = sprintf (ptr, "%s", mipname);
	  ptr = ptr + len;
	  break;

	case '%':
	  *ptr++ = '%';
	  break;
      }
    }
    else {
      *ptr++ = c;
    }
  }
  *ptr++ = '\0';
  return format_buffer;
}


/************************************************************************/
/* $monInit check routine                                        */
/************************************************************************/
void monInit_check(int data, int reason)
{
   int i;
   char *string, *name, *ptr, ch;

   if (monInit_done) return ;
   monInit_done = 1 ;

   /* 
    * plus args for info.
    * +mon0=cpu0:25 +mon1=ccx:35
    */

   mon_path_num = 0;
   while (1) {
     sprintf (mon_name_buf, "mon%d=\0", mon_path_num);
     string = mc_scan_plusargs(mon_name_buf);
     if (string != 0) {
       strcpy(mon_name_buf, string);
       ptr = strtok (mon_name_buf, ":");
       if (ptr == 0) {
	 tf_error("Syntax error in mon%i plus arg (instance path)\n", mon_path_num);
	 tf_dofinish();
	 return;
       }
       mon_inst_path[mon_path_num] = strdup (ptr);
       ptr = strtok (NULL, ":");
       if (ptr == 0) {
	 tf_error("Syntax error in mon%i plus arg (level)\n", mon_path_num);
	 tf_dofinish();
	 return;
       }
       mon_level[mon_path_num] = atoi (ptr);
     }
     else {
       break;
     }
     mon_path_num++;
   }
}

/************************************************************************/
/* $monInit call routine                                         */
/************************************************************************/

void monInit_call(int data, int reason)
{
    return;
}
