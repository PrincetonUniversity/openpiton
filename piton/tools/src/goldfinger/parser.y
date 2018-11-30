// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: parser.y
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
%{
  #include <stdio.h>
  #include <inttypes.h>
  #include "app.h"
  #include "block.h"
  #include "tsb.h"
  #include "tsb_link.h"
  #include "gf_error.h"

extern void set_block_tsbcsm_clump_num (uint64_t clump_num) ;
extern void set_tsbcsm_num_entries (uint64_t num_entries) ;
extern void set_tsbcsm_size_bits (uint64_t size_bits) ;
extern void set_tsbcsm_split (uint64_t split) ;
extern void set_tsbcsm_link_area (char *link_area) ;
extern void set_tsbcsm_link_start_addr (uint64_t start_addr) ;
extern void set_tsb_link_start_addr(uint64_t start_addr);
extern void set_tsb_link_srcfile(char * srcfile);
extern void set_tsb_link_srcline(int srcline);

  int lineno = 1;

  extern int yyerror(char *msg);
  extern int yylex(void);

%}

%union {
    char *string;
    unsigned long long int num;
};

%token SEP END APP BLOCK TSBCSM TSB LINKAREA  PASIZE
%token SPLIT TSBCSMLINK TSBLINK STARTADDR NUMENTRIES PAGESIZE SIZEBITS 
%token ELFFILE SRCFILE SRCLINE LINKSECTION SECTIONNAME SEGMENTNAME
%token COMPRESS INIMAGE OBJECT
%token VA RA PA
%token STARTLABEL ENDVA ENDLABEL NOENDRANGECHECK
%token TSBNAME TAGBASE DATABASE  VAINDEX TAGADDR TTETAGADDR DATAADDR
%token CLUMPNUM 
%token BLOCKTSB BLOCKTSBCSM RAEQVA PAEQVA
%token <string> QSTRING ID
%token <num> NUM

%%

start:  items
	;

items:
	| items app
	| items tsb
    | items tsbcsm
	| items tsb_link
    | items tsbcsm_link
	| items global_setting
	;

global_setting: PASIZE '=' NUM SEP { set_pa_size($3); }
	;

app: app_begin app_contents app_end
	;

app_begin: APP ID { open_new_app($2, lineno); }
	;

app_end: END APP { close_app(lineno); }
	;

app_contents:
	| app_contents app_elem
	;

app_elem: ELFFILE '=' QSTRING SEP { set_app_elf_file($3); }
	| SRCFILE '=' QSTRING SEP { set_app_srcfile($3); }
	| SRCLINE '=' NUM SEP     { set_app_srcline((int) $3); }
	| block
	;

block: block_begin block_contents block_end
	;

block_begin: BLOCK ID { open_new_block($2, lineno); }
	;

block_end: END BLOCK { close_block(lineno); }
	;

block_contents:
	| block_contents block_elem
	;

block_elem: SECTIONNAME '=' QSTRING SEP { set_block_section_name($3); }
	|   SEGMENTNAME '=' QSTRING SEP { set_block_segment_name($3); }
	|   LINKSECTION '=' QSTRING SEP { set_block_link_section($3); }
	|   SRCFILE     '=' QSTRING SEP { set_block_srcfile($3); }
	|   SRCLINE     '=' NUM SEP     { set_block_srcline((int) $3); }
	|   COMPRESS    '=' NUM SEP     { set_block_compress((int) $3); }
	|   COMPRESS            SEP     { set_block_compress(1); }
	|   INIMAGE     '=' NUM SEP     { set_block_in_image((int) $3); }
	|   INIMAGE             SEP     { set_block_in_image(1); }
	|   VA          '=' NUM SEP     { set_block_va($3);}
	|   RA          '=' NUM SEP     { set_block_ra($3);}
	|   PA          '=' NUM SEP     { set_block_pa($3);}
        |   RAEQVA      '=' NUM SEP     { set_block_ra_eq_va($3 ? 1 : 0); }
	|   RAEQVA              SEP     { set_block_ra_eq_va(1); }
        |   PAEQVA      '=' NUM SEP     { set_block_pa_eq_va($3 ? 1 : 0); }
        |   PAEQVA              SEP     { set_block_pa_eq_va(1); }
	|   STARTLABEL  '=' QSTRING SEP	{ set_block_start_label($3); }
	|   ENDVA       '=' NUM     SEP	{ set_block_end_va($3); }
	|   ENDLABEL    '=' QSTRING SEP	{ set_block_end_label($3); }
	|   NOENDRANGECHECK '=' NUM SEP { set_block_no_end_range_check($3 ?
								       1 : 0);}
	|   NOENDRANGECHECK         SEP { set_block_no_end_range_check(1);}
        |   block_tsb
        |   block_tsb_csm
	;

block_tsb: block_tsb_begin block_tsb_contents block_tsb_end
	;

block_tsb_begin: BLOCKTSB ID { open_new_block_tsb($2, lineno); }
	;

block_tsb_end: END BLOCKTSB { close_block_tsb(lineno); }
	;

block_tsb_contents:
	| block_tsb_contents block_tsb_line
	;

block_tsb_line:  TAGBASE '=' NUM SEP 	{ set_block_tsb_tag_base($3); }
	|  DATABASE '=' NUM SEP 	{ set_block_tsb_data_base($3); }
	|  PAGESIZE '=' NUM SEP 	{ set_block_tsb_page_size($3); }
	|  VAINDEX  '=' NUM ':' NUM SEP	{ set_block_tsb_va_index_bits($3,$5); }
	|  TAGADDR  '=' NUM ':' NUM SEP	{ set_block_tsb_tag_addr_bits($3,$5); }
	|  TTETAGADDR  '=' NUM ':' NUM SEP { set_block_tsb_tte_tag_addr_bits($3,$5); }
	|  DATAADDR '=' NUM ':' NUM SEP { set_block_tsb_data_addr_bits($3,$5);}
	|  SRCFILE  '=' QSTRING SEP     { set_block_tsb_srcfile($3); }
	|  SRCLINE  '=' NUM SEP         { set_block_tsb_srcline((int) $3); }
	;


tsb: tsb_begin tsb_contents tsb_end
	;

tsb_begin:  TSB ID { open_new_tsb($2, lineno); }
	;

tsb_end:    END TSB { close_tsb(lineno); }
	;

tsb_contents: tsb_lines
	;

tsb_lines:
	| tsb_lines tsb_line
	;

tsb_line: NUMENTRIES '=' NUM SEP       { set_tsb_num_entries($3); }
	| STARTADDR  '=' NUM SEP       { set_tsb_start_addr($3); }
	| SIZEBITS   '=' NUM SEP       { set_tsb_size_bits($3); }
	| SPLIT      '=' NUM SEP       { set_tsb_split($3); }
	| SPLIT              SEP       { set_tsb_split(1); }
	| LINKAREA   '=' ID  SEP       { set_tsb_link_area($3); }
	| SRCFILE    '=' QSTRING SEP   { set_tsb_srcfile($3); }
	| SRCLINE    '=' NUM SEP       { set_tsb_srcline($3); }
	;
          

tsb_link: tsb_link_begin tsb_link_contents tsb_link_end
	;

tsb_link_begin: TSBLINK ID { open_new_tsb_link($2, lineno); }
	;

tsb_link_end:   END TSBLINK { close_tsb_link(lineno); }
	;

tsb_link_contents: tsb_link_lines
	;

tsb_link_lines:
	| tsb_link_lines tsb_link_line
	;

tsb_link_line: STARTADDR  '=' NUM     SEP   { set_tsb_link_start_addr($3); }
	|      SRCFILE    '=' QSTRING SEP   { set_tsb_link_srcfile($3); }
	|      SRCLINE    '=' NUM SEP       { set_tsb_link_srcline($3); }
	;

block_tsb_csm: block_tsbcsm_begin block_tsbcsm_contents block_tsbcsm_end
	;

block_tsbcsm_begin: BLOCKTSBCSM ID { open_new_block_tsbcsm($2, lineno); }
	;

block_tsbcsm_end: END BLOCKTSBCSM { close_block_tsbcsm(lineno); }
	;

block_tsbcsm_contents:
	| block_tsbcsm_contents block_tsbcsm_line
	;

block_tsbcsm_line:   CLUMPNUM '=' NUM SEP { set_block_tsbcsm_clump_num((uint64_t) $3);}
	;


tsbcsm: tsbcsm_begin tsbcsm_contents tsbcsm_end
	;

tsbcsm_begin:  TSBCSM ID { open_new_tsbcsm($2, lineno); }
	;

tsbcsm_end:    END TSBCSM { close_tsbcsm(lineno); }
	;

tsbcsm_contents: tsbcsm_lines
	;

tsbcsm_lines:
	| tsbcsm_lines tsbcsm_line
	;

tsbcsm_line: NUMENTRIES '=' NUM SEP       { set_tsbcsm_num_entries($3); }
	| STARTADDR  '=' NUM SEP       { set_tsbcsm_start_addr($3); }
	| SIZEBITS   '=' NUM SEP       { set_tsbcsm_size_bits($3); }
	| SPLIT      '=' NUM SEP       { set_tsbcsm_split($3); }
	| SPLIT              SEP       { set_tsbcsm_split(1); }
	| LINKAREA   '=' ID  SEP       { set_tsbcsm_link_area($3); }
	| SRCFILE    '=' QSTRING SEP   { set_tsbcsm_srcfile($3); }
	| SRCLINE    '=' NUM SEP       { set_tsbcsm_srcline($3); }
	;
          

tsbcsm_link: tsbcsm_link_begin tsbcsm_link_contents tsbcsm_link_end
	;

tsbcsm_link_begin: TSBCSMLINK ID { open_new_tsbcsm_link($2, lineno); }
	;

tsbcsm_link_end:   END TSBCSMLINK { close_tsbcsm_link(lineno); }
	;

tsbcsm_link_contents: tsbcsm_link_lines
	;

tsbcsm_link_lines:
	| tsbcsm_link_lines tsbcsm_link_line
	;

tsbcsm_link_line: STARTADDR  '=' NUM     SEP   { set_tsbcsm_link_start_addr($3); }
	|      SRCFILE    '=' QSTRING SEP   { set_tsbcsm_link_srcfile($3); }
	|      SRCLINE    '=' NUM SEP       { set_tsbcsm_link_srcline($3); }
	;

%%
