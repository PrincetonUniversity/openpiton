// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bw_lib.c
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

#include <stdio.h>
#include <string.h>
#include "bw_lib.h"
/*-------------------------------------------------------------------------------
     remove leading space or tab.
     if found carriage return, return -1 to indicate anenpty string.
--------------------------------------------------------------------------------*/
int rmSpace(char* buf, int index, int max){
    while((index < max) && (buf[index] == ' ' || buf[index] == '\t'))index++;
    return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*-------------------------------------------------------------------------------
     check the address symbol that is "@".
     if symbol there, return address.
--------------------------------------------------------------------------------*/
unsigned long long getEight(char *buf, int idx)
{
    int  i;
    unsigned long long addr = 0;

    for(i = idx;  buf[i] != '\0';i++){
        addr <<= 4;
        addr  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
    }
    return addr;
}
/*-------------------------------------------------------------------------------
     check the address symbol that is "@".
     if symbol there, return address.
--------------------------------------------------------------------------------*/
int getAddr(char *buf, unsigned long long *addr, int idx){
    int i;

    for(i = idx; buf[i] != '\0'; i++)
        if(buf[i] == '/'){
            for(i = i-1; i >= 0;i--)
    if(buf[i] >= '0' && buf[i] <= '9'){
        buf[i+1] = '\0';
        break;
    }
            break;
        }
    for(i = idx; buf[i] != '\0'; i++){
        if(buf[i] == '@'){
            i++;
            *addr = getEight(buf, i);//ato_long(buf, &i); 
            return 1;
        }
    }
    return 0;
}
/*-------------------------------------------------------------------------------
    convert ascii to hex array.
--------------------------------------------------------------------------------*/
void a2h(char* buf,int idx,  char* cbuf, int* cidx){

    char ch;

    while((buf[idx] != '\0') && (buf[idx] != '\n')){
        if(buf[idx] == ' '){ 
            idx++;
            continue;
        }
        ch  = buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
        ch <<= 4;
        idx++;
        if(buf[idx] == '\0' ||  buf[idx] == '\n'){
            cbuf[*cidx] = ch;
            (*cidx)++;
            break;
        }
        ch  |= buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
        cbuf[*cidx] = ch;
        idx++;
        (*cidx)++;
    }
}
/*-------------------------------------------------------------------------------
    convert ascii to hex array.
--------------------------------------------------------------------------------*/
int align_buf(char* cbuf, int cidx){
    int i;

    if(cidx < 64)return cidx;
    for(i = 64; i < cidx;i++)cbuf[i-64] = cbuf[i];
    return 64;
} 
/*-------------------------------------------------------------------------------
    1). only use 40 bits
    2). line size 64 bytes.
--------------------------------------------------------------------------------*/
KeyType mask_addr (KeyType addr){

    addr >>= 6;
    addr  &= 0x3ffffffff;
    return addr;
}
/*------------------------------------------
 initiliaze jbus handle.
-------------------------------------------*/
void read_mem(char*              str, 
                b_tree_node_ptr*   root)
{
    FILE *fp;
    char  buf [BUFFER];
    char  cbuf[BUFFER];
    int   idx, cidx;
    KeyType  addr, t_addr;
    b_tree_atom_ptr atom;//node for b-tree.
    int dev, zero;

    if((fp = fopen(str, "r")) == 0){
        #ifndef PITON_DPI
        io_printf((char *)"Error:  can not open file %s for reading\n", str);
        tf_dofinish();
        #else
        printf("Error:  can not open file %s for reading\n", str);
        #endif
    }

    cidx = 0;
    addr = 0;
    zero = 0;

    while(fgets(buf, BUFFER, fp)){
        idx = rmSpace(buf, 0, BUFFER);
        if(idx < 0 || strncmp (buf, "//", 2) == 0){
            idx  = rmSpace(buf, idx+2, BUFFER);
            if(strncmp(buf+idx, "zero_bytes", 10) == 0)
                zero = 1;
            continue;//empty string
        }

        t_addr = addr;

        if(getAddr(buf, &addr, idx)){//get address
            if(cidx){
                atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
                for(idx = 0;idx < cidx;idx++)atom->data[idx] = cbuf[idx];
                atom->data[cidx] = '\0'; 
                atom->key        = mask_addr(t_addr);
                atom->size       = cidx;

                // io_printf("iob: adding address %llx\n", atom->key << 6);

                b_insert(root, &atom);
                dev  = (int)(t_addr >> 28);
                dev &= 0xfff;
                zero = 0;
            }
            cidx = addr & 0x3f;
            continue;
        }

        a2h(buf, idx,  cbuf, &cidx);
        while(cidx >= 64){
            atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
            for(idx = 0;idx < 64;idx++)atom->data[idx] = cbuf[idx];
            atom->data[64] = '\0';
            atom->key      = mask_addr(addr);
                // io_printf("iob: adding address %llx\n", atom->key << 6);
            atom->size     = 64; 
            b_insert(root, &atom);
            dev  = (int)(addr >> 28);
            dev &= 0xfff;
            //generate the next address
            cidx -= align_buf(cbuf, cidx);      
            addr += 64;
        }
    }
    fclose(fp);
}
/*------------------------------------------
set random seed
-------------------------------------------*/
#ifndef PITON_DPI
void set_random()
{
    char  *pargs;
    unsigned int seed;
    pargs = mc_scan_plusargs ((char *)"tg_seed=");  
    if(pargs != (char *) 0) {
        seed = atoi(pargs);
        srand(seed);
        srandom(seed);
    }
}
#endif
