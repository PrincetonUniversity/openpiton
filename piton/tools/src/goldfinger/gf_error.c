// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: gf_error.c
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


/* 
 * gf_error.c
 *
 * Functions to deal with error handling, and other miscellaneous
 * stuff.
 */
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "gf_error.h"

int Disable_error = 0;

char *Errstrings[] = 
  {
   "M_NOERROR: No error",
   "M_MISC: Miscellaneous error",
   "M_CODE: Error in midas code",
   "M_DIR: Directory error",
   "M_FILE: File error",
   "M_CMDFAIL: Command failed",
   "M_SECSYNTAX: Error in section syntax",
   "M_ATTRSYNTAX: Error in attr syntax",
   "M_MISSINGPARAM: Missing parameter",
   "M_ILLEGALPARAM: Illegal parameter",
   "M_OUTOFRANGE: Out of range",
   "M_NOTNUM: Not a number",
   "M_VACOLLIDE: VA collision",
   "M_PACOLLIDE: PA collision",
   "M_DIRECTIVESYNTAX: Directive syntax error",
   "M_GENFAIL: File generation failed",
   "M_ASMFAIL: Assembler failed",
   "M_CCFAIL: C compiler failed",
   "M_LINKFAIL: Linker failed",
   "M_CPPFAIL: CPP failed",
   "M_M4FAIL: M4 preprocessor failed",
   "M_BADCONFIG: Bad configuration",
   "M_EVENTERR: Event parsing error",
   "M_ARGERR: Argument error",
   "M_NOSEC: Undefined section",
   "M_BADTSB: Bad TSB",
   "M_BADALIGN: Bad Alignment",
   "M_EMPTYSECTION: Empty section",
   "M_TSBSYNTAX: Error in tsb syntax",
   "M_APPSYNTAX: Error in app syntax",
   "M_MEMORY: Memory error",
   "M_GOLDFINGERPARSE: Goldfinger parse error",
   "M_GOLDFINGERARG: Goldfinger arg error",
   "M_ELF: ELF error",
   "M_BADLABEL: Bad label",
   "M_GOLDFINGERMISC: Uncategorized goldfinger error",
   "M_GOLDFINGERVERSION: Bad version of goldfinger",
   "M_DUPLICATETAG: Duplicate tags in TSB",
   "M_BLOCKSYNTAX: Error defining goldfinger BLOCK",

   "SENTINEL_ERROR",
  };

char *Srcfile = "<stdin>";
char *Prefix = "";
static int Verbose = 1;
static int Pa_size = 40;

void
set_verbose_level(int level) {
  Verbose = level;
  if(Verbose < VERBOSE_SILENT) {
    Verbose = VERBOSE_SILENT;
  } else if(Verbose > VERBOSE_DEBUG) {
    Verbose = VERBOSE_DEBUG;
  }
}

void
disable_error_print(void) {
  Disable_error = 1;
}

#define SBUFSIZE 16384
void
gf_error(int code, char *fmt, ...) {
  if(! Disable_error) {
    char stringbuf[SBUFSIZE];
    int index;
    char *errmsg;
    char *ptr;
    va_list ap;
    va_start(ap, fmt);
    errmsg = ((code >= 0) && (code < SENTINEL_ERROR)) ? Errstrings[code] :
      "<unknown>";

    snprintf(stringbuf, SBUFSIZE, "ERROR %d (%s):\n", code, errmsg);
    index = strlen(stringbuf);
    if(index < SBUFSIZE) {
      vsnprintf(stringbuf + index, SBUFSIZE-index, fmt, ap);
    }

    ptr = strtok(stringbuf, "\n");
    while(ptr) {
      fprintf(stderr, "goldfinger: %s\n", ptr);
      ptr = strtok(NULL, "\n");
    }

    va_end(ap);
  }
  exit(code);
}

void
gf_say(int verbose_lvl, char *fmt, ...) {
  if(Verbose >= verbose_lvl) {
    va_list ap;
    va_start(ap, fmt);
    fprintf(stdout, "%sgoldfinger: ", Prefix);
    vfprintf(stdout, fmt, ap);
    va_end(ap);
  }
}


void *
gf_malloc(size_t size) {
  void *ptr = malloc(size);
  if(!ptr) {
    gf_error(M_MEMORY, "Could not malloc %ld bytes!\n", size);
  }
  return ptr;
}

/* only guaranteed to work if num is a power of 2 */
uint64_t
log2(uint64_t num) {
  uint64_t log = 0;
  
  if(num < 2) return 0;

  while(num > 1) {
    log++;
    num >>=1;
  }

  return log;
}

int is_pow2(uint64_t num) {
  uint64_t log, test;  

  log = log2(num);
  test = 1 << log;
  return (test == num);
}

int
is_aligned(uint64_t num, uint64_t alignment) {

  if(!is_pow2(alignment)) {
    gf_error(M_CODE, "Can't check alignment of non-power-of-2 '0x%llx'\n",
	     alignment);
  }
  
  return ( num & (alignment-1) ) == 0;

}


int get_pa_size(void) {
  return Pa_size;
}

void set_pa_size(int size) {
  if((size <= 0) || (size > 64)) {
    gf_error(M_GOLDFINGERPARSE,
	     "Can't set PA size to %d, must be 1-64 (in num bits)\n", size);
  }
  Pa_size = size;
}
