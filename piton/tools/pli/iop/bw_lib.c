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

#include <malloc.h>
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
                b_tree_node_ptr*   root,
                List<addr_record>* addr_list)
{
    FILE *fp;
    char  buf [BUFFER];
    char  cbuf[BUFFER];
    int   idx, cidx;
    KeyType  addr, t_addr;
    b_tree_atom_ptr atom;//node for b-tree.
    addr_record_ptr addr_ptr;
    int dev, zero;

    if((fp = fopen(str, "r")) == 0){
        io_printf("Error:  can not open file %s for reading\n", str);
        tf_dofinish();
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
                //if next data is zero byte, don't store address into list.
                if(dev < 0x200){
                //save address for l2warm
                    if(zero == 0){
                        addr_ptr       = (addr_record_ptr)malloc(sizeof(struct addr_record));
                        addr_ptr->addr = t_addr;
                        addr_list->append(addr_ptr);
                    }
                }
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
            if(dev < 0x200){
                if(zero == 0){
                    //save address
                    addr_ptr       = (addr_record_ptr)malloc(sizeof(struct addr_record));
                    addr_ptr->addr = addr;
                    addr_list->append(addr_ptr);
                }
            }
            //generate the next address
            cidx -= align_buf(cbuf, cidx);      
            addr += 64;
        }
    }
    fclose(fp);
}
/*------------------------------------------
read address bus(J_AD).
J_AD[127:64] byte enable
J_AD[47:43]  transaction type
J_AD[42:0]   address

layout of J_AD:index<0-3>
J_AD[127:96], J_AD[95:64], J_AD[63:32], J_AD[31:0]
-------------------------------------------*/
void get_j_ad(int* trans, 
                KeyType* addr,
                unsigned int* j_ad)
{
    int idx, groups;
    s_tfnodeinfo node_info;    
    tf_nodeinfo(J_AD, &node_info);

    idx = 0;
    for(groups = (node_info.node_ngroups - 1); groups >= 0; groups--)
        j_ad[idx++]  = node_info.node_value.vecval_p[groups].avalbits;
    //get transaction type
    *trans = (j_ad[2] >> 11) & 0x1f;
    //get address
    *addr   = j_ad[2] & 0x7ff;
    *addr <<= 32;
    *addr  |= (KeyType)j_ad[3];
}
/*------------------------------------------
address cycle
-------------------------------------------*/
void addr_cycle(){
    int trans;  
    unsigned int j_ad[4];
    KeyType      addr;
    get_j_ad(&trans, &addr, j_ad);

    switch(trans){
    case IDLE:
        io_printf("REQUEST is idle\n");
        break;
    case RDS:
        break;
    case RDSA:
        break;
    case WRI:
        break;
    case WRIS:
        break;
    case NCRD:
        break; 
    case NCBRD:
        break; 
    case NCWR:
        io_printf("REQUEST is NCWR\n");
        break;
    case NCBWR:
        break;
    case INT:
        break; 
    }
}
/*------------------------------------------
address cycle
-------------------------------------------*/
void data_cycle(){

}
/*------------------------------------------
use acc_routine to deposit value.
-------------------------------------------*/
void jbus_slam(int arg, char* val){ 
    handle jbus_handle;
    s_setval_value valuePtr;
    s_setval_delay delayPtr;

    delayPtr.model     = accNoDelay;
    valuePtr.format    = accHexStrVal;
    valuePtr.value.str = val;
    jbus_handle        = acc_handle_tfarg(arg);
    acc_set_value(jbus_handle, &valuePtr, &delayPtr);
}
/*------------------------------------------
address cycle
deposit-delay:0
delay mode:0 for inertial
-------------------------------------------*/
void jbus_putp(int arg, int size, char* buf){
    tf_strdelputp(arg, size, 'H', buf, 0, 0);
}
/*------------------------------------------
monitor L2 cache.
-------------------------------------------*/
void jbus_output(int j_id, jbus_node_ptr jbus_root ){ 
    
    if(j_id == 4){
        if(jbus_root->active_4)jbus_slam(J_AD_R, jbus_root->j4_ad_val);
        else                   jbus_slam(J_AD_R, jbus_root->ad_idle);
        jbus_putp(J_ADTYPE_R, J_ADTYPE_WIDTH, jbus_root->j4_adtype);
        jbus_putp(J_PACK4_R,  J_PACK_WIDTH,   jbus_root->j_pack4);
    }
    else if(j_id == 5){
        if(jbus_root->active_5)jbus_slam(J_AD_R, jbus_root->j5_ad_val);
        else                   jbus_slam(J_AD_R, jbus_root->ad_idle);
        jbus_putp(J_ADTYPE_R, J_ADTYPE_WIDTH, jbus_root->j5_adtype);
        jbus_putp(J_PACK5_R,  J_PACK_WIDTH,   jbus_root->j_pack5);
    }
}

/*------------------------------------------
set random seed
-------------------------------------------*/
void set_random()
{
    char  *pargs;
    unsigned int seed;
    pargs = mc_scan_plusargs ("tg_seed=");  
    if(pargs != (char *) 0) {
        seed = atoi(pargs);
        srand(seed);
        srandom(seed);
    }
}
