/* Modified by Princeton University on June 9th, 2015 */
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lexer.l
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

#include <stdlib.h>
#include <strings.h>
#include "parser.tab.h"
#include "gf_error.h"

extern int lineno;

extern int yyerror(char *msg);
extern int yylex(void);


%}

ws      [ \t]+
qstring \"[^\"\n]*[\"\n]
id      [a-zA-Z\.][a-zA-Z0-9_\.]*
num     (0[xX][0-9a-fA-F]+)|([0-9]+)
nl      \n
comment  \#.*\n
sep      \;

%%

{ws}    ;


end|END                   { return END; }
app|APP                   { return APP; }
elf_file|ELF_FILE         { return ELFFILE; }

block|BLOCK               { return BLOCK; }
src_file|SRC_FILE         { return SRCFILE; }
src_line|SRC_LINE         { return SRCLINE; }
link_section|LINK_SECTION { return LINKSECTION; }
section_name|SECTION_NAME { return SECTIONNAME; }
segment_name|SEGMENT_NAME { return SEGMENTNAME; }
compress|COMPRESS         { return COMPRESS; }
va|VA                     { return VA; }
ra|RA                     { return RA; }
pa|PA                     { return PA; }
in_image|IN_IMAGE         { return INIMAGE; }

start_label|START_LABEL  { return STARTLABEL; }
end_va|END_VA            { return ENDVA; }
end_label|END_LABEL      { return ENDLABEL; }
tsb_name|TSB_NAME        { return TSBNAME; }
tag_base|TAG_BASE        { return TAGBASE; }
data_base|DATA_BASE      { return DATABASE; }
size_bits|SIZE_BITS      { return SIZEBITS; }
no_end_range_check|NO_END_RANGE_CHECK { return NOENDRANGECHECK; }
va_index_bits|VA_INDEX_BITS { return VAINDEX; }
tag_addr_bits|TAG_ADDR_BITS { return TAGADDR; }
tte_tag_addr_bits|TTE_TAG_ADDR_BITS { return TTETAGADDR; }
data_addr_bits|DATA_ADDR_BITS { return DATAADDR; }

pa_size|PA_SIZE          { return PASIZE; }
ra_eq_va|RA_EQ_VA        { return RAEQVA; }
pa_eq_va|PA_EQ_VA        { return PAEQVA; }

tsb|TSB                  { return TSB; }
tsb_csm|TSB_CSM          { return TSBCSM; }
tsb_link|TSB_LINK        { return TSBLINK; }
tsb_csm_link|TSB_CSM_LINK { return TSBCSMLINK; }
num_entries|NUM_ENTRIES  { return NUMENTRIES; }
page_size|PAGE_SIZE      { return PAGESIZE; }
split|SPLIT              { return SPLIT; }
link_area|LINK_AREA      { return LINKAREA; }
start_addr|START_ADDR    { return STARTADDR; }
block_tsb|BLOCK_TSB      { return BLOCKTSB; }
block_tsb_csm|BLOCK_TSB_CSM { return BLOCKTSBCSM; }
clump_num|CLUMP_NUM      {return CLUMPNUM; }

{qstring} { 
	    yylval.string = strdup(yytext+1); /* skip open quote */
	    if(yylval.string[yyleng-2] != '"') { /*"*/
		yyerror("Unterminated quoted string.");
            }
	    yylval.string[yyleng-2] = '\0';
	    return QSTRING;
	  }

{num}     {
            yylval.num = strtoull(yytext, NULL, 0);
            return NUM;
          }

{id}      {
	    yylval.string = strdup(yytext);
            return ID;
          }


{nl}      { lineno++; }
{comment} { lineno++; }
{sep}     { return SEP; }

.         { return yytext[0]; }

%%

int
yyerror(char *msg) {
        gf_error(M_GOLDFINGERPARSE,
		 "%s, line %d: %s at '%s'\n", Srcfile,
		 lineno, msg, yytext);
}

int
yywrap(void) {
   return 1;
}
