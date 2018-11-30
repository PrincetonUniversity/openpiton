// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: include.c
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
 *	include [-i "{string}"]  [ {FILE} ]
 *		recursively expands files included in {FILE}, where "inclusion"
 *		is specified by
 *			^{include_cmd} "file", or
 *			^{include_cmd} <file>
 *		{include_cmd} is {string} if -i option used, or
 *		              is default to '#include'.
 *			  
 */


#include	<stdio.h>
#include	<string.h>
#include	<stdlib.h>
#include	<ctype.h>

#define		YES			1
#define		NO			0
#define		streq(a,b)		!strcmp(a,b)
#define		strleq(a,b)		!strncmp(a,b, strlen(a))
#define		skip_to_eoln(in)	while(getc(in) != '\n')

typedef enum {
	M_NORMAL,
	M_PAL,
	M_last
	} MODE;
MODE	mode= M_NORMAL;

char	ABSOLUTE_PATH= 1;
char	ignore=NO;		/*ignore missing file, continue to process*/
char	*incCmd= "#include";
char	*comment= "//";
int	len_incCmd;
char	*incDir[80]={"."};		/*first to search is current dir*/
int	last_incDir= 0;			/*incDir[0] is .*/
char	*directory();
/* char	*directory(char	*name, char *dir); */
int include(char *, FILE *, FILE *, int);
void print_NOT_FOUND();

void usage_and_exit(msg1, msg2)
char	*msg1, *msg2;
{
if(msg1 != NULL) {
   char	format[256];
   if(msg2 && *msg2) {	sprintf(format, "%s\n", msg1);
			fprintf(stderr, format, msg2);
   }else {	fprintf(stderr, "%s\n", msg1);
		}
   }
fprintf(stderr, "usage: include [{options}] [{FILE}]\n");
fprintf(stderr, "options: [default]\n");
fprintf(stderr, "\t -i {string}: use {string} as include_cmd. [#include]\n");
fprintf(stderr, "\t 	where include_cmd is used as follows: \n");
fprintf(stderr, "\t 		^{include_cmd} \"{file}\",or \n");
fprintf(stderr, "\t 		^{include_cmd} <{file}> \n");
fprintf(stderr, "\t 		^{include_cmd} {file} \n");
fprintf(stderr, "\t -pal:           print line number and file name for pal.\n");
fprintf(stderr, "\t -I {directory}: include files directory for search after .\n");
fprintf(stderr, "\t -o {outFile}:   output to file {outFile}. [stdout]\n");
fprintf(stderr, "\t -abs|-rel:   include file uses absolute or relative paths. [absolute=%d]\n",
				ABSOLUTE_PATH);
exit(0);
}

int main(argc, argv)
int	argc;
char	*argv[];
{
FILE	*in, *out;
int	idx=1;
char	*outfile=0, *infile;
char	dir[100];			/*prefix to a relative path*/

if(argc <= 1) usage_and_exit("");

while(argv[idx][0] == '-') {
	if(streq(argv[idx], "-h") ) {
		usage_and_exit("");
	}else if(streq(argv[idx], "-c") && argc>=idx+2) {	//comment prefix
		comment= argv[idx+1];
		idx+= 2;
	}else if(streq(argv[idx], "-I") ) {			//include dir
		incDir[++last_incDir]= argv[idx+1];
		idx+= 2;
	}else if(streq(argv[idx], "-i") && argc>=idx+2) {	//include prefix
		incCmd= argv[idx+1];
		idx+= 2;
	}else if(streq(argv[idx], "-o") && argc>=idx+2) {
		outfile= argv[idx+1];
		idx+= 2;
	}else if(streq(argv[idx], "-pal") ) {
		mode= M_PAL;
		idx+= 1;
	}else if(streq(argv[idx], "-abs")) {
		ABSOLUTE_PATH= 1;
		idx+= 1;
	}else if(streq(argv[idx], "-rel")) {
		ABSOLUTE_PATH= 0;
		idx+= 1;
	}else{	usage_and_exit("illegal arguments:%s", argv[idx]);
		}
	}
if(argc == idx) {
	infile= (char*) strdup("stdin");
	in=stdin;
	incDir[0]= ".";
}else{	
	infile= (char*) strdup(argv[idx]);
	in= fopen(argv[idx], "r");
	if(in == NULL)	usage_and_exit("in file '%s' not found!", argv[idx]);
	directory(argv[idx], dir);
	incDir[0]= dir;
	}
if(outfile == NULL) { out= stdout;
}else{	out= fopen(outfile, "w");
	if(out == NULL) usage_and_exit("can't open output file: %s!", outfile);
	}
len_incCmd= strlen(incCmd);
include(infile, in, out, 1);

print_NOT_FOUND();
exit(0);
}

void
DirName(path, dirname)			//path: in; dirname: out
char	*path, *dirname;
{
    int	i;
    strcpy(dirname, path);
    for(i= strlen(dirname); i>=0; --i) {
	if(dirname[i] == '/') {
	    dirname[i+1]= 0;
	    return;
	}
    }
    dirname[0]= 0;
}


int include(currFile, in, out, depth)
char	*currFile;
FILE	*in;
FILE	*out;
int	depth;
{
char	*oldDir;
char	newDir[100];	/*directory for the include file X, which is needed*/
			/* for files included in X using relative path*/
char	dirname[100];

#define	FNAME_LEN	200
char	line[256], incFile[FNAME_LEN], closing;
FILE	*inc_fd, *find_and_open_file();
int	linenum=0, return_from_include=0, missingFile;

if(mode==M_PAL)
	fprintf(out, "# line 1 %s\n", currFile);
DirName(currFile, dirname);

while( fgets(line, 256, in) ) {
   int	i, j=0;
   ++ linenum;
   if( !strncmp(incCmd, line, len_incCmd) &&    /*match starting 1st column*/
	(line[i=len_incCmd]==' ' || line[i]=='\t') ) {
	while(line[++i]== ' ' || line[i]=='\t') ;		/*skip more ws*/
	/*
	 * if(line[i] != '"' && line[i]!='<')
	 *     usage_and_exit("illegal syntax of 'include_cmd': %s !!", line);
	 * closing= line[i] == '"' ? '"' : '>';
	*/
	if(ABSOLUTE_PATH==0) {			//relative path in include file
	     strcpy(incFile, dirname);
	     j= strlen(incFile);
	}
	if(line[i] != '"' && line[i]!='<') incFile[j++]= line[i];
	while(line[++i] != '"' && line[i] != '>' && !isspace(line[i]) && line[i]) {
	    if(i>=FNAME_LEN)
	       usage_and_exit("include file name too long (>FNAME_LEN): %s!", line);
	    incFile[j++]= line[i];
	    }
	
	if(mode != M_PAL) {
		fprintf(out, "###depth=%d include ==> %s", depth, line);
		}
	/*ignore the rest of the line*/
	incFile[j]= 0;
	inc_fd= find_and_open_file(incFile, newDir);
	if(inc_fd==0 && mode==M_PAL) {
		fprintf(stderr, "\t     %s\n", incFile);
		fprintf(stderr, "\t ^-- %s\n", currFile);
		return(1);
		}

	oldDir= incDir[0];		/*save current directory before*/
	incDir[0]= newDir;		/* move to newDir*/
	missingFile= include(incFile, inc_fd, out, depth+1);	/*recursively include*/
	if(missingFile && mode==M_PAL) {
		fprintf(stderr, "\t ^-- %s\n", currFile);
		return(1);
		}
	
	incDir[0]= oldDir;

	return_from_include= 1;
   }else{
	if(mode==M_PAL && return_from_include)
		fprintf(out, "# line %d %s\n", linenum, currFile);
	return_from_include= 0;
	fprintf(out, "%s%s", strleq(comment,line)? "" :
			     ABSOLUTE_PATH? "": dirname, line);
	}
   }

return(0);				/*OK*/
}

#include	<stdio.h>
#include	<sys/types.h>
#include	<sys/stat.h>

#define	MAX_NOT_FOUND		100
char	*NOT_FOUND[MAX_NOT_FOUND];
int	last_NOT_FOUND= -1;

void
print_NOT_FOUND()
{
int	i;
if(last_NOT_FOUND < 0)	return;
for(i=0; i<=last_NOT_FOUND; ++i) {
	fprintf(stderr, "file not found: %s.\n", NOT_FOUND[i]);
	}
usage_and_exit("");
}


FILE
*find_and_open_file(file, newDir)
char	*file, *newDir;
{
int	i;
FILE	*fd;
char	incFile[100];

//if(file[0] == '/') {			/*absolute path, use no parent dirInfo*/
fd= fopen(file, "r");
if(fd){ directory(file, newDir);	/*obtain dir info from file*/
	return(fd);			/*found, done*/
}
//}else
for(i=0; i<=last_incDir; ++i) {	  /*include file has a relative path*/
	sprintf(incFile, "%s/%s", incDir[i], file);
	fd= fopen(incFile, "r");
	if(fd){ directory(incFile, newDir);
		return(fd);			/*found, done*/
		}
	}

fprintf(stderr, "include ERR: file not found: %s.\n", file);
exit(1);

if(0) {
  if(++ last_NOT_FOUND >= MAX_NOT_FOUND) {
	print_NOT_FOUND();
  } else {
	NOT_FOUND[last_NOT_FOUND]= (char*) malloc( strlen(file)+ 1);
	strcpy(NOT_FOUND[last_NOT_FOUND], file);
	}
  }
return(NULL);
}


char
*directory(name, dir)	/*return directory part of a path*/
char	*name;
char	*dir;
{					/* and write '*dir'*/
extern char	*strchr();
char	*ptr, *q;			/*ptr points to next '/', q char after*/
strcpy(dir, name);
q= dir;
while( ptr=strchr(q,'/') ) {	q= ptr+1; }
if(q == dir) {			/*not moved at all, i.e. no '/' in path*/
	strcpy(dir, ".");		/*directory of root file is . */
}else{	*(q-1)= 0;			/*cut dir from last '/'*/
	}
return(dir);
}

