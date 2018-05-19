// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: split.h
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
#ifndef _SPLIT_H_
#define _SPLIT_H_

/*
 * splitsec.h
 *
 * Exports a function that splits input_file into sections, which are
 * each written as an assembly file in dest_dir.  All midas directives
 * are written to midas_file, also in dest_dir.
 *
 * A midas directive is any line where the first non-whitespace
 * characters are MIDAS_ or SECTION.  Also, if the first whitespace
 * characters are attr_<something> followed by a curly-brace-delimited
 * block (which may span multiple lines), it is also considered a
 * midas directive.
 *
 * At the end of midas_file, write lines beginning with SPLITSEC that
 * describe the file names to which it wrote each section.
 */

extern void splitsec(char *input_file, char *dest_dir, char *midas_file);

#endif
