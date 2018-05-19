// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: value.c
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
    value.c - Reads command line arguments and return their value,
    based on the new Verilog spec.
    Grab the latest from http://chris.spear.net

    Copyright (C) 1999 Christian B. Spear
    Hey - let's not be formal, you can call me Chris!

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


Edit history
Who When     Version What
ae  11/03/00 1.5     Return 0 if arg not found
ajk 11/03/00 1.5     But don't give an error message
lj  03/24/00 1.4     Change comments from // to / * * /
ms  09/15/99 1.3     Final MTI fixes
ms  09/08/99 1.2     More MTI fixes
ms  09/07/99 1.1     Added MTI support (Magnus Soderberg), fixed includes
cbs 07/29/99 1.0     Initial attempt

ae  - Andrew Elms
ajk - Adam J. Krolnik
lj  - D Lee Jones
ms  - Magnus Soderberg
cbs - Chris Spear

Compile with -DDEBUG to get debug information

********************************************************************************

[The following documentation is from Adam Krolnik ]

$value$plusargs (string, variable)

This system function searches the list of plusargs (like the $test$plusargs
system function) for a user specified string. If a string is found, the
remainder of the string is converted to the type specified in the
user string and the resulting value stored in the variable provided. If
a string is found the function returns the value 1'b1. If no string
is found matching, the function returns the value 1'b0 and the variable
provided is not modified.

The user string must be of the form: "'plusarg_string''format_string'". 
The plusarg string is a name followed by either = or +  The
format strings are the same as the $display system tasks. These
are the only valid ones (upper and lower case as well as a leading 0
forms are valid): 

%b  - binary conversion
%d  - decimal conversion
%e  - real exponential conversion
%f  - real decimal conversion
%g  - real decimal or exponential conversion
%h  - hexadecimal conversion
%o  - octal conversion
%s  - string (no conversion)
%x  - (undergound equivalent for %h)

The first string, from the list of plusargs provided to the simuator,
that matches the plusarg_string portion of the string specified
by the user will be the plusarg string available for conversion.
The remainder string of the matching plusarg (the remainder is the
part of the plusarg string after the portion that matches the users
plusarg_string) will be converted from a string into the format
indicated by the format string and stored in the variable provided.
If the size of the variable is larger than the value after conversion,
the value stored is zero padded to the width of the variable. If the
variable can not contain the value after conversion, the
value will be truncated. If the value is negative, the value shall be
considered larger than the variable provided. If characters exist in
the string available for conversion that are illegal for the
specified conversion, the register should be written with the value 'bx.




Examples:

<simulator> +FINISH=10000 +TESTNAME=this_test +FREQ=5.6666 +FREQUENCY


// Get clock to terminate simulation if specified.
if ($value$plusargs("FINISH=%d", stop_clock))
  begin
  repeat (stop_clock) @(posedge clk);
  $finish;
  end

// Get testname from plusarg.
if ($value$plusargs("TESTNAME=%s", testname))
  begin
  $display("Running test %0s.", testname);
  startTest();
  end
  
// Get frequency from command line; set default if not specified. 
if (!$value$plusargs("FREQ=%0F", frequency))
  frequency = 8.33333; // 166MHz;
  
  forever begin
  #frequency clk = 0;
  #frequency clk = 1;
  end

This code would have the following effects:

1. The variable 'stop_clock' obtains the value 10000.
2. The variable 'testname' obtains the value 'this_test'.
3. The variable 'frequency' obtains the value '5.6666'; note
   the final plusarg +FREQUENCY does not affect the value of
   the variable 'frequency'
   

For Verilog-XL use the veriuser.tfs entry:


    {userfunction, 1, value_check, 0, value_call, 0, "$value$plusargs", 1},

For Modelsim do:
 This is for Solaris, but the procedure is similar for other UNIXes.
 See chapter 9 resp 5 for ver 5.2e and previous resp. ver 5.3 (and later) 
 in the Modelsim manual for details.
 IMPORTANT:
 It was not possible to compile with SUNs compiler but gcc works fine,
 even if you should expect warnings both during compilation and linking. 
 Linking on the other hand only worked with SUNs ld and not with GNU
 Modelsim v5.3 may have problems with the name $value$plusargs, so use 
 $value instead. (May be a task vs. function problem)

 ->gcc -c -DMTI -I/<modelsim_install_path>/include value.c 
 ->ld -G -B symbolic -o value.so value.o
 ->cp value.so /<modelsim_install_path>/<your_os>/

 add value.so to the modelsim.ini file like:
 Veriuser = value.so myotherpli.so athirdpli.so


*/
#ifdef MTI
#include "veriuser.h"
#else
#include "veriuser.h"
#endif
#include "acc_user.h"
#include "malloc.h"
#include "string.h"
#include "ctype.h"  /* for toupper */
#include "stdio.h"  /* for sscanf.h */


#define MAX_STRING_LEN 1000
#define ARG0 0
#define ARG1 1
#define ARG2 2


/* Type of format, as in %b, %d, ... */
enum VALUE_TYPE {
  VALUE_B, VALUE_D, VALUE_E, VALUE_F, VALUE_G, VALUE_H, VALUE_O, VALUE_S
};


typedef struct t_fmt
{
  enum VALUE_TYPE type;  /* Type of format */
  char *string;          /* Name of plusarg */
} s_fmt, *p_fmt;



/************************************************************************/
/* $value$plusargs check routine                                        */
/************************************************************************/
void value_check(int data, int reason)
{
   int i, len, upper;
   enum VALUE_TYPE type;
   char *string, *name, *ptr, ch;
   p_fmt fmt;

   /* Requires two arguments */
  if (tf_nump() != ARG2) {
      tf_error("$value$plusargs requires two arguments, string and value");
      tf_dofinish();
      return;
   }

   /*  First argument to $value$plusargs() must be "string" */
   if (tf_typep(ARG1) != tf_string) {
      tf_error("First argument to $value$plusargs must be a string");
      tf_dofinish();
   }

   /*  Second argument to $value$plusargs() must be writeable */
   if ((tf_typep(ARG2) != tf_readwrite) && 
       (tf_typep(ARG2) != tf_readwritereal)) {
      tf_error("Second argument to $value$plusargs must be a reg or real");
      tf_dofinish();
   }

   /* Get the format string "NAME=%[0]{d,o,h,x,b,e,f,g,s}"*/
   string = tf_getcstringp(ARG1);
#ifdef DEBUG
   io_printf("tf_getcstringp returned '%s'\n", string);
#endif

   /* Check the first character to see if it is a '+' */
   if (string[0] == '+') {
     tf_warning("Do not put a '+' in the $value$plusargs format argument");
     string++;
   }

   /* Look for NAME= */
   if ((string[0] == '=') || (string[0] == '+')) {
        tf_error("No name specified in format (%s) in $value$plusargs ", string);
	tf_dofinish();
   }
   ptr = string;
   i = 0;
   len = strlen (string);
   while ((string[i] != '=') && (string[i] != '+') && (i < len))
     i++;
   if (i == len) {
        tf_error("Format (%s) in $value$plusargs must be NAME=%v", string);
	tf_dofinish();
   }
   i++;

   /* Save the 'name=' into a string */
   name = strncpy ((char *)malloc(i+1), string, i);
   name[i] = 0;
#ifdef DEBUG
   io_printf("value_check: name= '%s'\n", name);
#endif

   /* Look for % */
   if (string[i] != '%') {
        tf_error("Format (%s) in $value$plusargs did not contain an '%%'", string);
	tf_dofinish();
   }

   /* Look for optional zero, as in ARG=%0d */
   i++;
   if (string[i] == '0') i++;

   /* Convert format character to value */
   /* ??? This is probably broken for case conversion */
   upper = toupper(string[i]);

   if (upper == 'B') 
     type = VALUE_B;
   else if (upper == 'D') 
     type = VALUE_D;
   else if (upper == 'E') 
     type = VALUE_E;
   else if (upper == 'F') 
     type = VALUE_F;
   else if (upper == 'G') 
     type = VALUE_G;
   else if (upper == 'H') 
     type = VALUE_H;
   else if (upper == 'O') 
     type = VALUE_O;
   else if (upper == 'S') 
     type = VALUE_S;
   else if (upper == 'X') 
     type = VALUE_H;
   else {
     tf_error("Unrecognized format in $value$plusargs ('%s'), %%b, %%d, %%e, %%f, %%g, %%h, %%o, %%s supported", string);
     tf_dofinish();
   }

   /* Create and store the format block */
   fmt = (p_fmt) malloc(sizeof(s_fmt));
   memset((void*)fmt, 0, sizeof(s_fmt));
   fmt->type = type;
   fmt->string = name;
   tf_setworkarea ((char *) fmt);


} /* value_check */




/************************************************************************/
/* $value$plusargs call routine                                         */
/* ??? Possible Bug - should put an 'x' to reg on error,                */
/* currently just write 0                                               */
/************************************************************************/

void value_call(int data, int reason)
{
    char *ptr;
    float argf;
    p_fmt fmt = (p_fmt) tf_getworkarea();
    static s_acc_value avalue = {accIntVal};    /* Holds argument value */
    static s_setval_delay delay_s = {{0}, accNoDelay};


    /* Get the string AFTER the value & check if it was found */
    if (!(ptr = mc_scan_plusargs(fmt->string))) {
        tf_putp(ARG0, 0);  /* Return 0, don't change arg */
        return;
    }

    /* Save the string read from the command line */
    avalue.value.str = ptr;
#ifdef DEBUG
    io_printf("value_call: value is '%s'\n", ptr);
#endif

    switch (fmt->type) {
    case VALUE_B: {
      /* Write the binary string into the register */
      avalue.format = accBinStrVal;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %b */

    case VALUE_D: {
      /* Write the decimal string into the register */
      avalue.format = accDecStrVal;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %d */

    case VALUE_E: {
      /* Write the floating string into the register */
      sscanf(ptr, "%e", &argf);
      avalue.format = accRealVal;
      avalue.value.real = argf;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %e */

    case VALUE_F: {
      /* Write the floating string into the register */
      sscanf(ptr, "%f", &argf);
      avalue.format = accRealVal;
      avalue.value.real = argf;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %f */

    case VALUE_G: {
      /* Write the floating string into the register */
      sscanf(ptr, "%g", &argf);
      avalue.format = accRealVal;
      avalue.value.real = argf;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %g */

    case VALUE_H: {
      /* Write the hexadecimal string into the register */
      avalue.format = accHexStrVal;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %h */

    case VALUE_O: {
      /* Write the octal string into the register */
      /* I'll give you a buck for anyone who still uses octal */
      avalue.format = accOctStrVal;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %o */

    case VALUE_S: {
      /* Write the string into the register */
      avalue.format = accStringVal;
      acc_set_value(acc_handle_tfarg(ARG2), &avalue, &delay_s);
      break;
    } /* %s */

    default: {
      tf_error("Internal error in $value$plusargs, fmt->type = %d", fmt->type);
      tf_dofinish();
    } /* default */

    } /* switch fmt->type */

    tf_putp(ARG0, 1);

    return;
}
#ifdef MTI
s_tfcell veriusertfs[] = {
  /*** Template for an entry:
    { usertask|userfunction, data,
        checktf(), sizetf(), calltf(), misctf(),
        "$tfname", forwref?, Vtool?, ErrMsg? },
    Example:
    { userfunction, 0, my_check, 0, my_func, my_misctf, "$my_task" },
    ***/
	{userfunction, 1, value_check, 0, value_call, 0, "$value$plusargs", 1},
    {0}                           /*** final entry must be 0 ***/
};

void init_usertfs()
{
  p_tfcell usertf;
  
  for (usertf = veriusertfs;usertf;usertf++) {
    if (usertf->type == 0)
      return;
    mti_RegisterUserTF(usertf);
  }
}
#endif
/* end of value.c */
