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
#include "stdio.h"  /* for sscanf.h */


#define MAX_STRING_LEN 1000
#define ARG0 0
#define ARG1 1
#define ARG2 2


static char mon_name_buf[64];
static char *mon_inst_path[128];
static int  mon_level[128];
static int mon_path_num;

static char *diserr_arr[64];
static char *diswarn_arr[64];
static int diserr_num;
static int diswarn_num;
static int monInit_done = 0 ;
static int error_disable = 0 ;

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


/*
 * string match function
 */
int strmatch (char* s0, char* s1)
{
  char *p0;

  p0 = strstr (s1, s0);
  if (p0 == NULL) return 1;
  else return 0;
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

   /* 
    * plus args for diserr.
    * +diserr=uce:cer:xyz
    */
   diserr_num = 0;
   string = mc_scan_plusargs("diserr=");
   if (string != 0) {
     ptr = strtok (string, ":");
     if (ptr == 0) {
       tf_error("Syntax error in diserr plus arg\n");
       tf_dofinish();
       return;
     }
     while (1) {
       diserr_arr[diserr_num] = strdup (ptr);
       diserr_num++;
       ptr = strtok (NULL, ":");
       if (ptr == 0) break;
     }
   }

   /* 
    * plus args for diswarn.
    * +diswarn=mem0:mem3
    */
   diswarn_num = 0;
   string = mc_scan_plusargs("diswarn=");
   if (string != 0) {
     ptr = strtok (string, ":");
     if (ptr == 0) {
       tf_error("Syntax error in diswarn plus arg\n");
       tf_dofinish();
       return;
     }
     while (1) {
       diswarn_arr[diswarn_num] = strdup (ptr);
       diswarn_num++;
       ptr = strtok (NULL, ":");
       if (ptr == 0) break;
     }
   }
}

/************************************************************************/
/* $monInit call routine                                         */
/************************************************************************/

void monInit_call(int data, int reason)
{
    return;
}


/************************************************************************/
/* $info check routine                                        */
/************************************************************************/
void info_check(int data, int reason)
{
  return;
}

/************************************************************************/
/* $info call routine                                         */
/************************************************************************/

void infow_call(int data, int reason)
{
    char *ptr_mipname;
    int i, level;

    int ms, us, ns, ps;
    get_time (&ms, &us, &ns, &ps);

    ptr_mipname =  tf_mipname();

   /* Requires at least two arguments */
  if (tf_nump() < ARG2) {
      tf_error("$info requires at least two arguments, info-level and format-string");
      tf_dofinish();
      return;
   }

   /*  First argument to $info() must be a value */
   if (tf_typep(ARG1) != tf_readonly) {
      tf_error("First argument to $info must be a value");
      tf_dofinish();
   }

   /*  Second argument to $info() must be a string */
   if (tf_typep(ARG2) != tf_string) {
      tf_error("Second argument to $info must be a formating string");
      tf_dofinish();
   }

   level = tf_getp(ARG1);
   if (level == 0) {
       io_printf ("%05d.%03d.%03d.%03d: INFO (%d): %s:%s",  ms,us,ns,ps, level, ptr_mipname, format(ptr_mipname));
   }
   else {
     for (i = 0; i < mon_path_num; i++) {
       if ((level <= mon_level[i]) &&
	   (strmatch (mon_inst_path[i], ptr_mipname) == 0)
	   ) {
	 io_printf ("%05d.%03d.%03d.%03d: INFO (%d): %s:%s",  ms,us,ns,ps, level, ptr_mipname, format(ptr_mipname));
       }
     }
   }
    return;
}

void info_call(int data, int reason)
{
    char *ptr_mipname;
    int i, level;

    int ms, us, ns, ps;
    get_time (&ms, &us, &ns, &ps);
	 
    ptr_mipname =  tf_mipname();

   /* Requires at least two arguments */
  if (tf_nump() < ARG2) {
      tf_error("$info requires at least two arguments, info-level and format-string");
      tf_dofinish();
      return;
   }

   /*  First argument to $info() must be a value */
   if (tf_typep(ARG1) != tf_readonly) {
      tf_error("First argument to $info must be a value");
      tf_dofinish();
   }

   /*  Second argument to $info() must be a string */
   if (tf_typep(ARG2) != tf_string) {
      tf_error("Second argument to $info must be a formating string");
      tf_dofinish();
   }

   level = tf_getp(ARG1);

   if (level == 0) {
     io_printf ("%05d.%03d.%03d.%03d: INFO(%d): %s:%s\n",  ms,us,ns,ps, level, ptr_mipname, format(ptr_mipname));
   }
   else {
     for (i = 0; i < mon_path_num; i++) {
       if ((level <= mon_level[i]) &&
	   (strmatch (mon_inst_path[i], ptr_mipname) == 0)
	   ) {
	 io_printf ("%05d.%03d.%03d.%03d: INFO(%d): %s:%s\n",  ms,us,ns,ps, level, ptr_mipname, format(ptr_mipname));
       }
     }
   }
    return;
}

/************************************************************************/
/* $error check routine                                        */
/************************************************************************/
void error_check(int data, int reason)
{
   return;
}

/************************************************************************/
/* $error call routine                                         */
/************************************************************************/

void error_call(int data, int reason)
{
  char *ptr_mipname;
  char *ptr;
  int i;

  int ms, us, ns, ps;

  get_time (&ms, &us, &ns, &ps);

  ptr_mipname =  tf_mipname();

  /* Requires at least two arguments */
  if (tf_nump() < ARG2) {
      tf_error("$error requires at least two arguments, error-disable-tag, and format-string");
      tf_dofinish();
      return;
   }

   /*  First argument to $error() must be a string */
   if (tf_typep(ARG1) != tf_string) {
      tf_error("First argument to $error must be a value");
      tf_dofinish();
   }

   /*  Second argument to $error() must be a string */
   if (tf_typep(ARG2) != tf_string) {
      tf_error("Second argument to $error must be a formating string");
      tf_dofinish();
   }

   for (i = 0; i < diserr_num; i++) {
     ptr = strchr(diserr_arr[i], '.');
     if (ptr == NULL) {
       if (strcmp (tf_getcstringp(ARG1), diserr_arr[i]) == 0) {
	   io_printf ("%05d.%03d.%03d.%03d: ERROR: %s:%s\n",  ms,us,ns,ps, ptr_mipname, format(ptr_mipname));
	 return;
       }
     }
     else {
       sprintf (format_buffer, "%s.%s\0", tf_getcstringp(ARG1), ptr_mipname);
       if (strcmp (format_buffer, diserr_arr[i]) == 0) {
	 io_printf ("%05d.%03d.%03d.%03d: ERROR: %s:%s\n",  ms,us,ns,ps, ptr_mipname, format(ptr_mipname));
	 return;
       }
     }
   }
   io_printf ("%05d.%03d.%03d.%03d: ERROR: %s:%s\n",  ms,us,ns,ps, ptr_mipname, format(ptr_mipname));
   if (!error_disable) tf_dofinish();

   return;
}

/************************************************************************/
/* $warn check routine                                        */
/************************************************************************/
void warn_check(int data, int reason)
{
   return;
}

/************************************************************************/
/* $warn call routine                                         */
/************************************************************************/

void warn_call(int data, int reason)
{
  char *ptr_mipname;
  int i;

  int ms, us, ns, ps;
  get_time (&ms, &us, &ns, &ps);

  ptr_mipname =  tf_mipname();

  /* Requires at least two arguments */
  if (tf_nump() < ARG2) {
      tf_error("$warn requires at least two arguments, warn-disable-tag, and format-string");
      tf_dofinish();
      return;
   }

   /*  First argument to $warn() must be a string */
   if (tf_typep(ARG1) != tf_string) {
      tf_error("First argument to $warn must be a value");
      tf_dofinish();
   }

   /*  Second argument to $warn() must be a string */
   if (tf_typep(ARG2) != tf_string) {
      tf_error("Second argument to $warn must be a formating string");
      tf_dofinish();
   }

   for (i = 0; i < diswarn_num; i++) {
     if (strcmp (tf_getcstringp(ARG1), diswarn_arr[i]) == 0) return;
   }
   io_printf ("%05d.%03d.%03d.%03d: WARN: %s:%s\n",  ms,us,ns,ps, ptr_mipname, format(ptr_mipname));

   return;
}

/************************************************************************/
/* disable exit on error during runtime                                 */
/************************************************************************/

void monErrorDisable_call ()
{
  error_disable = 1 ;
}

/************************************************************************/
/* enable exit on error during runtime                                 */
/************************************************************************/

void monErrorEnable_call ()
{
  error_disable = 0 ;
}






