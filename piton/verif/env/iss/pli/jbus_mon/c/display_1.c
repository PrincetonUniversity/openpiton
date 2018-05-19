// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: display_1.c
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
    // Have to do this conversion to pass the variable arg list to io_printf.
    //!!! not all possibilities are covered
    va_start(ap);
    for (p = fmt; *p; p++) {
      if (*p == '\n')
        newline = 1;
      if (*p == '%') {
        is_long = 0;
        for (; !done; p++) {
          buf[len++] = *p;
          switch (*p) {
          case 'd':
          case 'i':
          case 'o':
          case 'x':
          case 'X':
            if (is_long){
              llival = va_arg(ap, unsigned long long int);
              buf[len] = NULL;
              io_printf(buf, llival);
            }else{
              ival = va_arg(ap, int);
              buf[len] = NULL;
              io_printf(buf, ival);
            }
            done = 1;
            break;
          case 'l':
            is_long = 1;
            break;
          case 'f':
          case 'e':
          case 'E':
          case 'g':
          case 'G':
            dval = va_arg(ap, double);
            buf[len] = NULL;
            io_printf(buf, dval);
            done = TRUE;
            break;
          case 'c':
            cval = va_arg(ap, char);
            buf[len] = NULL;
            io_printf(buf, cval);
            done = TRUE;
            break;
          case 's':
            sval = va_arg(ap, char *);
            buf[len] = NULL;
            io_printf(buf, sval);
            {
              int len;
              len = strlen(sval);

            if (len > 0){
              if (sval[len-1] == '\n')
                newline = 1;
            }
            }
            done = TRUE;
            break;
          }
        }
        p--;
        buf[0] = NULL;
        len = 0;
        done = FALSE;
      } else {
        buf[len++] = *p;
      }
    }
    va_end(ap);
    // Flush the buffer.
    if (buf[0]) {
      buf[len] = NULL;
      io_printf(buf);
    }
