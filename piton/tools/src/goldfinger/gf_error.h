// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: gf_error.h
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
#ifndef _GF_ERROR_H_
#define _GF_ERROR_H_

/*
 * gf_error.h
 *
 * This file defines error codes and function prototypes for
 * error-handling functions, as well as some general-purpose utility
 * functions.
 */

#include <stdlib.h>
#include <inttypes.h>

/*
  IMPORTANT!

  Need to keep this consistent with Midas::Error since error codes are passed
  through to midas!

*/

#define M_NOERROR         0
#define M_MISC            1
#define M_CODE            2
#define M_DIR             3
#define M_FILE            4
#define M_CMDFAIL         5
#define M_SECSYNTAX       6
#define M_ATTRSYNTAX      7
#define M_MISSINGPARAM    8
#define M_ILLEGALPARAM    9
#define M_OUTOFRANGE      10
#define M_NOTNUM          11
#define M_VACOLLIDE       12
#define M_PACOLLIDE       13
#define M_DIRECTIVESYNTAX 14
#define M_GENFAIL         15
#define M_ASMFAIL         16
#define M_CCFAIL          17
#define M_LINKFAIL        18
#define M_CPPFAIL         19
#define M_M4FAIL          20
#define M_BADCONFIG       21
#define M_EVENTERR        22
#define M_ARGERR          23
#define M_NOSEC           24
#define M_BADTSB          25
#define M_BADALIGN        26
#define M_EMPTYSECTION    27
#define M_TSBSYNTAX       28

#define M_APPSYNTAX       29
#define M_MEMORY          30
#define M_GOLDFINGERPARSE 31
#define M_GOLDFINGERARG   32
#define M_ELF             33
#define M_BADLABEL        34
#define M_GOLDFINGERMISC  35
#define M_GOLDFINGERVERSION 36
#define M_DUPLICATETAG    37
#define M_BLOCKSYNTAX     38

/* Needs to be one greater than highest error code */
#define SENTINEL_ERROR 39

/* Verbosity level */
#define VERBOSE_SILENT 0
#define VERBOSE_NORMAL 1
#define VERBOSE_CHATTY 2
#define VERBOSE_DEBUG  3

extern char *Errstrings[];    /* array of messages, indexed by error code */
extern char *Srcfile;         /* file we're parsing */
extern char *Prefix;          /* string to prepend to normal output lines */

/* Sets verbose level to one of the VERBOSE_* levels */
extern void set_verbose_level(int level);

extern void set_pa_size(int size);
extern int get_pa_size(void);

/* When called, will disable all error printing.  Mainly used when
   testing error conditions and you don't want to pollute stderr */
extern void disable_error_print(void);

/* Fatal error.  Print out code's message (should be one of the M_*
   codes).  Then, do a fprintf to stderr with fmt and args.  Finally
   exit with status code. */
extern void gf_error(int code, char *fmt, ...);
/* If verbose_level is >= the set verbose level (see
   set_verbose_level()), then do a printf of fmt and args */
extern void gf_say(int verbose_lvl, char *fmt, ...);

/* Malloc and call gf_error(M_MEMORY, ...) if it fails */
extern void *gf_malloc(size_t size);

/* Misc utilities */
/* log2 is a library function, hack around it for now */
#include <math.h>
#define log2 gf_log2
extern uint64_t log2(uint64_t num);  /* num must be power-of-2 */
extern int is_pow2(uint64_t num);
extern int is_aligned(uint64_t num, uint64_t alignment); /* num must be
							    power-of-2 */

#define FLINE_f "At file '%s', line %d:\n"

#define SRC_FLINE(_obj)       ((_obj)->srcfile ?			\
			       (_obj)->srcfile : Srcfile), 		\
                              ((_obj)->srcfile ?			\
			       (_obj)->srcline : (_obj)->lineno)

#define GF_FILNE(_obj)        Srcfile, (_obj)->lineno
#define GF_FLINE_NUM(_line)   Srcfile, (_line)


#endif
