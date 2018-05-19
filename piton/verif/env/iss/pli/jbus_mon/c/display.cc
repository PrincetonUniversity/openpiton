// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: display.cc
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
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)display.cc
***
***  Version Date:  03/10/99
***
****************************************************************************/
#include "stdio.h"
#include "veriuser.h"
#ifdef USE_VCS_COMMANDS
#include "tf_proto_cc.h"
#else
extern "C" int io_printf(...);
#define tf_gettime sim_info.get_sim_time
#define tf_mipname sim_info.get_inst_name
#endif
#include "string.h"
// General routines used by all classes.
#define VRLG_FINISH 0
#define VRLG_STOP 1
#include "threaded_pli_interface.h"
#define tf_dostop()   terminate
#define tf_dofinish() terminate

static int newline = 1;
static int maxerr = 1;
static int maxwarn = 25;
static int doerr = VRLG_FINISH; // 0 is finish, 1 is stop.
static int dowarn = VRLG_FINISH;
static int errcnt = 0;
static int warncnt = 0;
static int msgactive[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		    -1, -1, -1, -1, -1, -1, -1, 1, 1 };


/** ----------------------------------------------------------------------------
 */
extern void C_dispmon(char *unit, int indx, char *fmt, ...)
{
  va_list ap;
  char buf[2048];
  char *p;
  char *sval;
  char cval;
  unsigned long long llival;
  int is_long;
  int ival;
  int dval;
  int done = FALSE;
  int len = 0;

  buf[0] = NULL;
  // Check if the tag is enabled.
  if (msgactive[indx] == 1) {
      if ((indx >= 0) && (indx <= 20)) {
	io_printf("%d: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if ((indx >= 21) && (indx <= 30)) {
	io_printf("%d: DBG: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if (indx == 48) {
	io_printf("%d: WARNING: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if (indx == 49) {
	io_printf("%d: ERROR: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      }
  #include "display_1.c"

    io_printf("\n");
  #include "display_2.c"
  newline = 1;
}
extern void C_writemon(char *unit, int indx, char *fmt, ...)
{
  va_list ap;
  char buf[2048];
  char *p;
  char *sval;
  char cval;
  int ival;
  unsigned long long llival;
  int is_long;
  int dval;
  int done = FALSE;
  int len = 0;

  buf[0] = NULL;
  // Check if the tag is enabled.
  if (msgactive[indx] == 1) {
    if (newline == 1){
      if ((indx >= 0) && (indx <= 20)) {
	io_printf("%d: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if ((indx >= 21) && (indx <= 30)) {
	io_printf("%d: DBG: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if (indx == 48) {
	io_printf("%d: WARNING: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      } else if (indx == 49) {
	io_printf("%d: ERROR: %s(%s): ", tf_gettime(), tf_mipname(), unit);
      }
    }
    newline = 0;
    #include "display_1.c"
  #include "display_2.c"

}
