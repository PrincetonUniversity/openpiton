#include "pli_replacement.h"

// CONSTRUCTORS
pli_replacement::pli_replacement() {
    sysMem = b_create();//create
    read_mem("mem.image", &sysMem);//read memory
    for(int idx = 0; idx < 32; idx++)last_addr[idx] = 0;
}

vluint64_t pli_replacement::get_eight_byte(char* data, KeyType key)
{
  vluint64_t  val;
  int mask  = key & 0x38;
  val       = 0;

  for(int i = 0; i < 8; i++){
    val <<= 8;
    val  |= data[mask+i] & 0xff;
  }
  return val;
}

void pli_replacement::write_eight_byte(char* data, KeyType key, vluint64_t val)
{
  unsigned first = val >> 32;
  unsigned second = val & 0xffff0000;
  //io_printf("iob_main.cc writing 0x%x%x to 0x%x\n", first, second, key);
  int mask  = key & 0x38;

  for(int i = 7; i >=0; i--){
    data[mask+i] = val & 0xff;
    val >>= 8;
  }
  // val = data[mask+i]
  // first = val >> 32;
  // second = val & 0xffff0000;
  // io_printf("iob_main.cc wrote 0x%x%x\n", val, key);
  return;
}

// get 64b of data from memory
vluint64_t pli_replacement::read_64b_call(vluint64_t key_var)
{
    KeyType key = key_var;
    KeyType   mask_addr;
    mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);
    
    if(last_addr[0] == mask_addr){
        return get_eight_byte(data[0]->data, key);
    }
    else {
        // trin
        b_tree_atom_ptr data_ptr = b_Find(&sysMem, &mask_addr);
        if(data_ptr){
            data[0]      = data_ptr;
            last_addr[0] = mask_addr;

            return get_eight_byte(data[0]->data, key);
        }
        else{
            // io_printf("iob_main.cc: cache line not found at address 0x%llx\n", mask_addr << 6);
            // io_printf("iob_main.cc1: key was 0x%llx\n", key);
            // io_printf("iob_main.cc1: high was 0x%x\n", high);
            // io_printf("iob_main.cc1: low was 0x%x\n", low);
            return 0;
        }
    }
}

// get 64b of data from memory
void pli_replacement::write_64b_call(vluint64_t key_var, vluint64_t val)
{
  KeyType key = key_var;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);


  if(last_addr[0] == mask_addr){
    //io_printf("iob_main.cc: invaling cache\n");
    // invalidate cached data
    last_addr[0] = 0;
  }

  b_tree_atom_ptr data_ptr = b_Find(&sysMem, &mask_addr);
  if(data_ptr){
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);
    data[0]      = data_ptr;
    last_addr[0] = mask_addr;
    write_eight_byte(data[0]->data, key, val);
    return;
  }
  else{
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);

    b_tree_atom_ptr atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
    for (int i = 0; i < ATOM_DATA_SIZE; i++)
      atom->data[i] = 0; // clear data

    write_eight_byte(atom->data, key, val);
    atom->key        = mask_addr;
    atom->size       = 64;

    b_insert(&sysMem, &atom);
    return;
  }
}
