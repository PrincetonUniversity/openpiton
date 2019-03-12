#include "global.h"
#include "b_ary.h"
#include "bw_lib.h"
#include "list.h"
#include "verilated.h"

class pli_replacement {
public:
    b_tree_node_ptr sysMem;//b_try for memory
    b_tree_atom_ptr data[32];
    KeyType      last_addr[32];
    // CONSTRUCTORS
    pli_replacement();
    ~pli_replacement() {}
    // METHODS
    // This function will be called from a instance created in Verilog
    inline vluint32_t my_math(vluint32_t in) {}

    vluint64_t get_eight_byte(char* data, KeyType key);
    
    void write_eight_byte(char* data, KeyType key, vluint64_t val);

    vluint64_t read_64b_call(vluint64_t key_var);
    
    void write_64b_call(vluint64_t key_var, vluint64_t val);
};
