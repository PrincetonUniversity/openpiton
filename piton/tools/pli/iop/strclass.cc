// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: strclass.cc
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

#include "strclass.h"
/*--------------------------------------
   remove leading spaces or tab.
   if found a carriage return, 
   return -1 to indicate an enpty string.
----------------------------------------*/
template<class T> int strclass<T>::rmSpace(char* buf, int index, int max){
  while((index < max) && (buf[index] == ' ' || buf[index] == '\t'))index++;
  return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*---------------------------------------
  replace char with space.
  ----------------------------------------*/
template<class T> void strclass<T>::replace(char* str)
{
  int i;
  for(i = 0; i < strlen(str);i++){
    if(
       str[i] == '(' ||
       str[i] == ')' ||
       str[i] == '-' ||
       str[i] == '>' ||
       str[i] == '"' ||
       str[i] == ',')str[i] = ' ';
  }
}
/*--------------------------------------
  convert ascii to hex array.
  ---------------------------------------*/
template<class T> void strclass<T>::copy(char* buf, int* idx,  char* cbuf)
{
  int ind;
  ind = 0;
  while((buf[*idx] != '\0') && 
	(buf[*idx] != '\n') &&
	(buf[*idx] != ' ')){
    cbuf[ind++] = buf[*idx];
    (*idx)++;
  }
  cbuf[ind] = '\0';
}
/*--------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
   ---------------------------------------*/
template<class T> T  strclass<T>::getEight(char *buf)
{
  int  i;
  T key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}
/*--------------------------------------
  remove hexa indicator
  ----------------------------------------*/
template<class T> void strclass<T>::rmhexa(char* buf){
  int i, j;
  
  for(i = 0;i < strlen(buf);i++){
    if(buf[i] == 'h' || buf[i] == 'x')break;
  }
  j  = 0;
  for(i = i+1;i < strlen(buf);i++){
    buf[j++] = buf[i];
  }
  buf[j] = '\0'; 
}
