//simpledram.c

#include <malloc.h>
#include <map>
#include "global.h"

#include "simpledram.h"

extern "C" void simpledram_test_call();
// extern "C" void simpledram_create();

// map <unsigned long long, 

void simpledram_test_call(){
	int number = tf_getp(1);
	io_printf("The number you want is %d", number);
}

// /*-------------------------------------------------------------------------------
//      remove leading space or tab.
//      if found carriage return, return -1 to indicate anenpty string.
// --------------------------------------------------------------------------------*/
// int rmSpace(char* buf, int index, int max){
//     while((index < max) && (buf[index] == ' ' || buf[index] == '\t'))index++;
//     return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
// }
// // adapted from bw_lib.c
// void read_mem(){
// {
//     FILE *fp;
//     char  buf [BUFFER];
//     char  cbuf[BUFFER];
//     int   idx, cidx;
//     KeyType  addr, t_addr;
//     b_tree_atom_ptr atom;//node for b-tree.
//     int dev, zero;

//     if((fp = fopen(str, "r")) == 0){
//         io_printf("Error:  can not open file %s for reading\n", str);
//         tf_dofinish();
//     }

//     cidx = 0;
//     addr = 0;
//     zero = 0;

//     while(fgets(buf, BUFFER, fp)){
//         idx = rmSpace(buf, 0, BUFFER);
//         if(idx < 0 || strncmp (buf, "//", 2) == 0){
//             idx  = rmSpace(buf, idx+2, BUFFER);
//             if(strncmp(buf+idx, "zero_bytes", 10) == 0)
//                 zero = 1;
//             continue;//empty string
//         }

//         t_addr = addr;

//         if(getAddr(buf, &addr, idx)){//get address
//             if(cidx){
//                 atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
//                 for(idx = 0;idx < cidx;idx++)atom->data[idx] = cbuf[idx];
//                 atom->data[cidx] = '\0'; 
//                 atom->key        = mask_addr(t_addr);
//                 atom->size       = cidx;

//                 io_printf("iob: adding address %x\n", atom->key);

//                 b_insert(root, &atom);
//                 dev  = (int)(t_addr >> 28);
//                 dev &= 0xfff;
//                 //if next data is zero byte, don't store address into list.
//                 if(dev < 0x200){
//                 //save address for l2warm
//                     if(zero == 0){
//                         addr_ptr       = (addr_record_ptr)malloc(sizeof(struct addr_record));
//                         addr_ptr->addr = t_addr;
//                         addr_list->append(addr_ptr);
//                     }
//                 }
//                 zero = 0;
//             }
//             cidx = addr & 0x3f;
//             continue;
//         }

//         a2h(buf, idx,  cbuf, &cidx);
//         while(cidx >= 64){
//             atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
//             for(idx = 0;idx < 64;idx++)atom->data[idx] = cbuf[idx];
//             atom->data[64] = '\0';
//             atom->key      = mask_addr(addr);
//                 io_printf("iob: adding address %x\n", atom->key);
//             atom->size     = 64; 
//             b_insert(root, &atom);
//             dev  = (int)(addr >> 28);
//             dev &= 0xfff;
//             if(dev < 0x200){
//                 if(zero == 0){
//                     //save address
//                     addr_ptr       = (addr_record_ptr)malloc(sizeof(struct addr_record));
//                     addr_ptr->addr = addr;
//                     addr_list->append(addr_ptr);
//                 }
//             }
//             //generate the next address
//             cidx -= align_buf(cbuf, cidx);      
//             addr += 64;
//         }
//     }
//     fclose(fp);
// }

// void simpledram_create(){
// 	char  *str;
// 	char  buf[BUFFER];
// 	int   idx;
// 	sysMem              = b_create();//create
// 	read_mem(str, &sysMem, &pli_var.addr_list);//read memory

// }