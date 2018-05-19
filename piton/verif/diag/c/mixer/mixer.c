// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mixer.c
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
#include "mtclib.h"

extern unsigned int  rand_numbers;
extern void          (*indra_macros_start[])();
extern void          (*indra_macros_end[])();
extern unsigned char finish_mask_lock;
extern unsigned int  finish_mask;
extern unsigned char strm_unit_lock;
extern unsigned int  strm_unit_use_mask;
extern unsigned int  jbus4_io_src1_arr;
extern unsigned int  jbus4_io_src2_arr;
extern unsigned int  jbus4_io_dst_arr;
extern unsigned int  jbus4_io_scratch;
extern unsigned int  jbus5_io_src1_arr;
extern unsigned int  jbus5_io_src2_arr;
extern unsigned int  jbus5_io_dst_arr;
extern unsigned int  jbus5_io_scratch;
extern unsigned int  jbus_fake_dma_src1_arr;
extern unsigned int  jbus_fake_dma_src2_arr;
extern unsigned int  jbus_fake_dma_dst_arr;
extern unsigned int  jbus_fake_dma_scratch;
extern unsigned int  mem_dma_scratch;
extern unsigned int  ssi_io_src1_arr;
extern unsigned int  ssi_io_src2_arr;
extern unsigned int  ssi_io_dst_arr;
extern volatile unsigned char* common_counter;

volatile unsigned int init_done = 0;
volatile unsigned char monarch = (unsigned char)0xc0;
unsigned char arb_monarch = (unsigned char)0x00;
volatile unsigned int blocking_req = 0x0;

// =============================================
// Common utils
// =============================================
int 
lock_a_byte(unsigned char* addr, int timeout) {
    unsigned char value   = (unsigned char)0xff;
    int  counter = timeout;
    while(value == 0xff) {
        value = ldstub(addr);
        if(counter == 0 && value == 0xff) return 1;
        counter--;
    }
    return 0;
}
void 
unlock_a_byte(unsigned char* addr) {
    *addr = (unsigned char)0x0;
}


// ===========================================
// RANDOM NUM GENERATION
// ===========================================
/* Period parameters */  
#define N 624
#define M 397
#define MATRIX_A 0x9908b0df   /* constant vector a */
#define UPPER_MASK 0x80000000 /* most significant w-r bits */
#define LOWER_MASK 0x7fffffff /* least significant r bits */

/* Tempering parameters */   
#define TEMPERING_MASK_B 0x9d2c5680
#define TEMPERING_MASK_C 0xefc60000
#define TEMPERING_SHIFT_U(y)  (y >> 11)
#define TEMPERING_SHIFT_S(y)  (y << 7)
#define TEMPERING_SHIFT_T(y)  (y << 15)
#define TEMPERING_SHIFT_L(y)  (y >> 18)

typedef struct {
    unsigned char lock;
    unsigned char lock_owner;
    int           thrdid;
    unsigned char common_counter_val;

    unsigned long seed;
#ifdef C_RAND_GEN
    unsigned long mt[N]; /* the array for the state vector  */
    int           mti;
#endif
} rng;
void init_rng(rng* rng_ptr, unsigned long seed, int thrdid) {
        rng_ptr->lock       = (unsigned char)0;
        rng_ptr->lock_owner = (unsigned char)0;
        rng_ptr->thrdid     = thrdid;
        rng_ptr->common_counter_val = (unsigned char)0;
  
#ifdef C_RAND_GEN
        rng_ptr->seed       = seed;
        rng_ptr->mti=N+1; /* mti==N+1 means mt[N] is not initialized */

        /* setting initial seeds to mt[N] using         */
        /* the generator Line 25 of Table 1 in          */
        /* [KNUTH 1981, The Art of Computer Programming */
        /*    Vol. 2 (2nd Ed.), pp102]                  */
        rng_ptr->mt[0] = rng_ptr->seed & 0xffffffff;
        for (rng_ptr->mti=1; rng_ptr->mti<N; rng_ptr->mti++) 
            rng_ptr->mt[rng_ptr->mti] = (69069 * rng_ptr->mt[rng_ptr->mti-1]) & 0xffffffff;
#else 
        rng_ptr->seed       = 0;
#endif
}
unsigned int rand(rng* rng_ptr, unsigned int range) {
    unsigned long y;
#ifdef C_RAND_GEN
    static unsigned long mag01[2]={0x0, MATRIX_A};
    if (rng_ptr->mti >= N) { /* generate N words at one time */
        int kk;

        for (kk=0;kk<N-M;kk++) {
            y = (rng_ptr->mt[kk]&UPPER_MASK)|(rng_ptr->mt[kk+1]&LOWER_MASK);
            rng_ptr->mt[kk] = rng_ptr->mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
        }
        for (;kk<N-1;kk++) {
            y = (rng_ptr->mt[kk]&UPPER_MASK)|(rng_ptr->mt[kk+1]&LOWER_MASK);
            rng_ptr->mt[kk] = rng_ptr->mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
        }
        y = (rng_ptr->mt[N-1]&UPPER_MASK)|(rng_ptr->mt[0]&LOWER_MASK);
        rng_ptr->mt[N-1] = rng_ptr->mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        rng_ptr->mti = 0;
    }
  
    y = rng_ptr->mt[rng_ptr->mti++];
    y ^= TEMPERING_SHIFT_U(y);
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
    y ^= TEMPERING_SHIFT_L(y);
#else 
    y = (&rand_numbers + ((rng_ptr->thrdid*300)%10000))[(rng_ptr->seed++)%300];
#endif

   return (y%range);
}

// ============================================
// THREAD STATUS
// ============================================
typedef struct {
    unsigned char lock;
    unsigned char lock_owner;
    unsigned int  active_threads_mask;
    unsigned int  active_thread_count;
    unsigned int  active_threads_inuse;

    unsigned int  tick_cmpr_counter[32];
} sys_thrd_status;
void init_sys_thrd_status(sys_thrd_status* thrd_status_ptr) {
    thrd_status_ptr->active_threads_mask  = 0x0;
    thrd_status_ptr->active_thread_count  = 0x0;
    thrd_status_ptr->active_threads_inuse = 0x0;
    int i;
    for(i=0; i<32; i++) {
        thrd_status_ptr->tick_cmpr_counter[i] = 0;
    }
}
void mark_thrd_active(sys_thrd_status* thrd_status_ptr, int thrdid) {
    int lock_status = lock_a_byte(&thrd_status_ptr->lock, 0x1000);
    if(lock_status == 0) {
        thrd_status_ptr->active_threads_mask |= (0x1 << thrdid);
        thrd_status_ptr->active_thread_count++;
        unlock_a_byte(&thrd_status_ptr->lock);
    }
    else {
        printf("C%dT%d : ERROR: could not get lock on sys_thrd_status::lock = 0x%x\n", 
               thrdid/4, thrdid%4, &thrd_status_ptr->lock); 
        fail();
    }
    printf("C%dT%d : MARK_THRD_ACTIVE = %d, final_mask = %x\n", thrdid/4, thrdid%4, thrdid, 
            thrd_status_ptr->active_threads_mask);
}
void mark_thrd_inuse(sys_thrd_status* thrd_status_ptr, int thrdid) {
    int lock_status = lock_a_byte(&thrd_status_ptr->lock, 0x1000);
    if(lock_status == 0) {
        thrd_status_ptr->active_threads_inuse |= (0x1 << thrdid);
        unlock_a_byte(&thrd_status_ptr->lock);
    }
    else {
        printf("C%dT%d : ERROR: could not get lock on sys_thrd_status::lock = 0x%x\n", thrdid/4, thrdid%4, 
                &thrd_status_ptr->lock); 
        fail();
    }
    printf("C%dT%d : THRD_INUSE = %d, inuse_mask = %x\n", thrdid/4, thrdid%4, thrdid, thrd_status_ptr->active_threads_inuse);
}
int pick_active_avail_thrd(sys_thrd_status* thrd_status_ptr, rng* rng_ptr) {
    int lock_status = lock_a_byte(&thrd_status_ptr->lock, 0x1000);
    if(lock_status == 0) {
        unsigned int avail_thrds = thrd_status_ptr->active_threads_mask ^ 
                                   thrd_status_ptr->active_threads_inuse;
        int i;
        int avail_list[32];
        int avail_count = 0;
        for(i=0; i<32; i++) {
            if(avail_thrds & (0x1<<i)) {
                avail_list[avail_count] = i;
                avail_count++; 
            }
        }
        if(avail_count == 0){
            printf("C%dT%d : ERROR: could not pick an avail thrd active_threads_inuse= 0x%x\n",
                   rng_ptr->thrdid/4, rng_ptr->thrdid%4, thrd_status_ptr->active_threads_inuse); 
            fail();
        }
        else {
            int pick_idx = rand(rng_ptr, avail_count);
            int avail_thrd = avail_list[pick_idx];
            thrd_status_ptr->active_threads_inuse |= (0x1 << avail_thrd);
            printf("C%dT%d : THRD_INUSE = %d, inuse_mask = %x\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, avail_thrd, 
                    thrd_status_ptr->active_threads_inuse);
            unlock_a_byte(&thrd_status_ptr->lock);
            return avail_thrd;
        }
    }
    else {
        printf("C%dT%d : ERROR: could not get lock on sys_thrd_status::lock = 0x%x\n",rng_ptr->thrdid/4, rng_ptr->thrdid%4, 
                &thrd_status_ptr->lock); 
        fail();
    }
}


// =================================================
// Event generation
// =================================================
enum { FIRST_OPCODE, ADD_R, ADD_I, ADDcc_R, ADDcc_I, ADDC_R, ADDC_I, ADDCcc_R, ADDCcc_I,
                     LDX_R, LDX_I, 
                     LDF, LDDF, LDQF, LDFSR, LDXFSR,
                     LAST_OPCODE };
enum { first_trap, mem_addr_not_aligned, last_trap };
static unsigned char opcode_traps[LAST_OPCODE][last_trap] = {(unsigned char)0};
typedef struct {
        sys_thrd_status* thrd_status_ptr;
} event_generator;
void init_event_generator(event_generator* event_gen_ptr, 
                          sys_thrd_status* thrd_status_ptr) {
    event_gen_ptr->thrd_status_ptr = thrd_status_ptr;
    opcode_traps[LDX_R][mem_addr_not_aligned] = (unsigned char)1; 
    opcode_traps[LDX_I][mem_addr_not_aligned] = (unsigned char)1; 
}
int pick_rand_opcode(event_generator* event_gen_ptr, rng* rng_ptr, int trap_type) {
    int i;
    int hit_indexes[LAST_OPCODE];
    int hit_counter = 0;
    for(i=FIRST_OPCODE; i<LAST_OPCODE; i++) {
        if(opcode_traps[i][trap_type] == (unsigned char)1) {
            hit_indexes[hit_counter] = i;
            hit_counter++;
        }    
    }
    if(hit_counter == 0) {
        printf("C%dT%d : ERROR: could not find matching opcode\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
        fail();
        return LAST_OPCODE;
    }
    int rand_opcode_idx = rand(rng_ptr, hit_counter);
    int rand_opcode = hit_indexes[rand_opcode_idx];
    return rand_opcode;
}
void gen_e34_mem_addr_not_aligned(event_generator* event_gen_ptr, rng* rng_ptr) {
    int op_value =  pick_rand_opcode(event_gen_ptr, rng_ptr, mem_addr_not_aligned);
    int thrd     =  pick_active_avail_thrd(event_gen_ptr->thrd_status_ptr, rng_ptr);
    printf("C%dT%d : picked an opcode of %d for target thrd %d\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, op_value, thrd);
}
void gen_e28_div_by_zero(event_generator* event_gen_ptr, rng* rng_ptr) {
}

unsigned int op_load_fp(rng* rng_ptr, int op, int rd, int rs1, int i, int rs2_s13) {
    int op_p;
    switch (op) {
        case LDF    : op_p = 0x20; break;
        case LDDF   : op_p = 0x23; break;
        case LDQF   : op_p = 0x22; break;
        case LDFSR  : op_p = 0x21; break;
        case LDXFSR : op_p = 0x21; break;
        default : break;
    }
    unsigned int opcode  = (0x3                << 30); 
                 opcode |= ((rd      &   0x1f) << 25);  
                 opcode |= ((op_p    &   0x3f) << 19);
                 opcode |= ((rs1     &   0x1f) << 14);
                 opcode |= ((i       &    0x1) << 13);
                 opcode |= ((rs2_s13 & 0x1fff) <<  0);

    return (opcode);
}

void gen_load_fp(rng* rng_ptr) {
    unsigned int rand_data       = rand(rng_ptr, 0xffffffff);
    unsigned int* addr_rand_data = &rand_data; 

    int i   = rand(rng_ptr, 2);
    int rs1 = rand(rng_ptr, 32); 
    int rs2_or_s13;
    if(i == 0) {
       while((rs2_or_s13 = rand(rng_ptr, 32)) != rs1) {};
    }
    else {
       //rs2_or_s13 = (addr_rand_data & 0xfff);
       rs2_or_s13 = 0;
    }

    unsigned int opcode = op_load_fp(rng_ptr, LDF, 0, rs1, i, rs2_or_s13);
    execute_inst(opcode, rs1, addr_rand_data, rs2_or_s13, 0);
}

// =================================================
// Event checkers
// =================================================
sys_thrd_status    thread_status;
event_generator    event_gen;
void register_tick_cmpr_event() {
    int thrdid = get_thrdid();
    printf("C%dT%d : Got tick_cmpr_event\n", thrdid/4, thrdid%4);
}

// =================================================
// Common macros
// =================================================
unsigned long long pow_rec(unsigned int base, unsigned int power) {
    unsigned long long result;
    if(base == 0 || base == 1 || power == 1) {
        return base;
    }
    else if(power == 0) {
        return 1;
    }
    else if(power == 2) {
        return (base*base);
    }
    else if(power > 2) {
        result =  base * pow_rec(base, power-1);
        return (result);
    }
    else {
    }
}
unsigned long long pow_add(unsigned int base, unsigned int power) {
    int i,j;
    unsigned long long value  = 1;
    unsigned long long result = 0;
    if(base == 0 || base == 1) {
        return base;
    }
    for(i=0; i < power; i++) {
        result = 0;
        for(j=0; j < base; j++) {
            result += value;
        }
        value  = result;
    }
    return value;
}
void gen_recursion_macro(rng* rng_ptr) {
    unsigned int base  = rand(rng_ptr, 17);
    unsigned int power = rand(rng_ptr, 25);
    printf("C%dT%d : Try pow : base = %u, power = %u\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, base, power);
    unsigned long long int rec_value = pow_rec(base, power);
    unsigned long long int add_value = pow_add(base, power);
    if(rec_value != add_value) {
        printf("C%dT%d : ERROR: rec = %llu and add = %llu values don't match\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, 
                rec_value, add_value);
        fail();
    }
    else  {
        printf("C%dT%d : Multiply result OK : %u\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, rec_value);
    }
}

float float_pow_rec(float base, int power) {
    float result;
    if(base == 0.0 || base == 1.0 || power == 1) {
        return base;
    }
    else if(power == 0) {
        return 1.0;
    }
    else if(power == 2) {
        return (base*base);
    }
    else if(power > 2) {
        result = base * float_pow_rec(base, power-1);
        return (result);
    }
    else {
    }
}
float float_pow_add(float base, int power) {
    int i,j;
    float value  = 1.0;
    float result = 0.0;
    if(base == 0.0 || base == 1.0) {
        return base;
    }
    for(i=0; i < power; i++) {
        result = 0.0;
        for(j=0; j < (unsigned int)base; j++) {
            result += value;
        }
        result += (float)((float)base - (unsigned int)base)*(float)value; 
        value  = result; 
    }
    return value;
}
void gen_float_recursion_macro(rng* rng_ptr) {
    unsigned int base      = rand(rng_ptr,   7);
    unsigned int fraction  = rand(rng_ptr, 100);
    unsigned int power = rand(rng_ptr, 50);
    float       fbase  = (float)base + ((float)fraction/100.0);
    printf("C%dT%d : Try float pow : fbase = %f, power = %u\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, fbase, power);
    float rec_value = float_pow_rec(fbase, power);
    float add_value = float_pow_add(fbase, power);
    if(rec_value != add_value) {
        printf("C%dT%d : ERROR: float rec = %f and add = %f values don't match\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, 
                rec_value, add_value);
        //fail();
    }
    else  {
        printf("C%dT%d : Float Multiply result OK : %f\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, rec_value);
    }
}

void add_arrays(unsigned int* src_arr1, unsigned int* src_arr2, unsigned int* result_arr, unsigned int num_locations) {
    int i;
    for(i=0; i<num_locations; i++) {
        if(i%16 == 0) { 
            // on every cacheline switch do a prefetch.
            prefetch_for_read_many(&(src_arr1[i]));
            prefetch_for_read_many(&(src_arr2[i]));
            prefetch_for_write_many(&(result_arr[i]));
        }
        result_arr[i] = src_arr1[i] + src_arr2[i];
    }
}
void gen_array_add_macro(rng* rng_ptr) {
    unsigned int tmp_align[8];  // align stack
    unsigned int tmp_bls_src1[64]; // start of stack for alignment
    unsigned int tmp_bls_src2[64];
    unsigned int tmp_bld_dst[64];

    unsigned int mem_src_arr1[64];
    unsigned int mem_src_arr2[64];
    unsigned int mem_dst_arr[64];

    unsigned int rand_num1 = rand(rng_ptr, 0x3fffffff);
    unsigned int rand_num2 = rand(rng_ptr, 0x3fffffff);
    unsigned int expected_result = 0;
    unsigned int actual_result = 0;
    int i;
    unsigned int arr1_space =   (rand_num1 & 0xf)          %5;
    unsigned int arr2_space =  ((rand_num1 & 0xf0)   >>  4)%5;
    unsigned int dst_space  =  ((rand_num1 & 0xf00)  >>  8)%5;

    unsigned int read_type   =    (rand_num2 & 0xf)           %2; // 1:block op, 0:4-byte
    unsigned int write_type1 =   ((rand_num2 & 0xf0)   >>   4)%2; 
    unsigned int write_type2 =   ((rand_num2 & 0xf00)  >>   8)%2; 

    unsigned int num_locations = 64;
    if(arr1_space == 4 || arr2_space == 4 || dst_space == 4) {
        // reduce the size of iteration, if any of the space is ssi.
        if(write_type1 != 0 && arr1_space == 4) { write_type1 = 0; } 
        if(write_type2 != 0 && arr2_space == 4) { write_type2 = 0; } 
        if(read_type   != 0 && dst_space  == 4) { read_type   = 0; } 
        if(read_type != 0 || write_type1 != 0 || write_type2 != 0) {
            num_locations = 16;
        }
        else {
            num_locations = 3;
        }
    }
    printf("C%dT%d : gen_array_add started ... IO = %x type = %x\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4,  
                                                     ((dst_space<<8)|(arr2_space<<4)|arr1_space), 
                                                     ((read_type<<8)|(write_type2<<4)|write_type1));
    unsigned int* src1_ptr = (arr1_space == 0x0) ? mem_src_arr1 : 
                             (arr1_space == 0x1) ? (&jbus4_io_src1_arr      + (64*rng_ptr->thrdid)) :
                             (arr1_space == 0x2) ? (&jbus5_io_src1_arr      + (64*rng_ptr->thrdid)) : 
                             (arr1_space == 0x3) ? (&jbus_fake_dma_src1_arr + (64*rng_ptr->thrdid)) : 
                             (arr1_space == 0x4) ? (&ssi_io_src1_arr        + (64*rng_ptr->thrdid)) : 0x0;
    unsigned int* src2_ptr = (arr2_space == 0x0) ? mem_src_arr2 : 
                             (arr2_space == 0x1) ? (&jbus4_io_src2_arr      + (64*rng_ptr->thrdid)) :
                             (arr2_space == 0x2) ? (&jbus5_io_src2_arr      + (64*rng_ptr->thrdid)) : 
                             (arr2_space == 0x3) ? (&jbus_fake_dma_src2_arr + (64*rng_ptr->thrdid)) : 
                             (arr2_space == 0x4) ? (&ssi_io_src2_arr        + (64*rng_ptr->thrdid)) : 0x0;
    unsigned int* dst_ptr  = (dst_space  == 0x0) ? mem_dst_arr : 
                             (dst_space  == 0x1) ? (&jbus4_io_dst_arr       + (64*rng_ptr->thrdid))  :
                             (dst_space  == 0x2) ? (&jbus5_io_dst_arr       + (64*rng_ptr->thrdid))  :
                             (dst_space  == 0x3) ? (&jbus_fake_dma_dst_arr  + (64*rng_ptr->thrdid))  : 
                             (dst_space  == 0x4) ? (&ssi_io_dst_arr         + (64*rng_ptr->thrdid))  : 0x0;

    for(i=0; i<num_locations; i++) {
        unsigned int num1 =  rand_num1 ^ i; 
        unsigned int num2 =  rand_num2 ^ i; 
        expected_result  +=  num1 + num2;

        if(write_type1 != 0) { tmp_bls_src1[i] = num1; }
        else { src1_ptr[i] = num1; }

        if(write_type2 != 0) { tmp_bls_src2[i] = num2; }
        else { src2_ptr[i] = num2; }
    }

    if(write_type1 != 0) {
        memcopy(tmp_bls_src1, src1_ptr, num_locations*4);
    }
    if(write_type2 != 0) {
        memcopy(tmp_bls_src2, src2_ptr, num_locations*4);
    }

    add_arrays(src1_ptr, src2_ptr, dst_ptr, num_locations);

    if(read_type != 0) {
        memcopy(dst_ptr, tmp_bld_dst, num_locations*4);
    }
    for(i=0; i<num_locations; i++) {
        if(read_type != 0) {
            actual_result += tmp_bld_dst[i];
        }
        else {
            actual_result += dst_ptr[i];
        }
    }

    if(actual_result == expected_result) {
        printf("C%dT%d : gen_array_add result OK : %u\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, actual_result);
    }
    else {
        printf("C%dT%d : ERROR: gen_array_add actual = %u and expected = %u values don't match\n", 
                rng_ptr->thrdid/4, rng_ptr->thrdid%4, actual_result, expected_result);
        fail();
    }
}

// Avoid stack for stream-block
unsigned int strm_src_mem[32][128];
unsigned int strm_dst_mem[32][128];
void gen_strm_array_macro(rng* rng_ptr) {
    unsigned int rand_num = rand(rng_ptr, 0x3fffffff);
    unsigned int pre_init_mem = rand_num & 0x1;
    int i;
    printf("C%dT%d : gen_strm_array started ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    if(pre_init_mem == 1) {
        for(i=0; i<128; i++) {
            strm_src_mem[rng_ptr->thrdid][i] = rand_num ^ i; 
            strm_dst_mem[rng_ptr->thrdid][i] = i; 
        }
    }

    while((strm_unit_use_mask & (0x1 << rng_ptr->thrdid)) == 0) {
        lock_a_byte(&strm_unit_lock, 0x10000);
        if((strm_unit_use_mask & (0xf << (rng_ptr->thrdid & 0x3c))) == 0) {
            strm_unit_use_mask |= (0x1 << rng_ptr->thrdid);
        }
        unlock_a_byte(&strm_unit_lock);
    }

    prg_strm_ma_mpa_reg(rng_ptr->thrdid, &strm_src_mem[rng_ptr->thrdid][0]);
    if(pre_init_mem == 0) {
        for(i=0; i<128; i++) {
            strm_src_mem[rng_ptr->thrdid][i] = rand_num ^ i; 
            strm_dst_mem[rng_ptr->thrdid][i] = i; 
        }
    }
    prg_strm_ma_ctl_reg(rng_ptr->thrdid, 0, 63);
    // issue random reads
    int load_count = rand(rng_ptr, 20);
    int rnd_read_result = 0;
    for(i=0; i<load_count; i++) {
       rnd_read_result += strm_src_mem[rng_ptr->thrdid][rand(rng_ptr, 128)]; 
    }
    printf("C%dT%d : Doing random reads during strm read op, count = %d, res = %d\n", rng_ptr->thrdid/4, 
        rng_ptr->thrdid%4, load_count, rnd_read_result);

    // Now wait for strm op to finish, if not already
    strm_ctl_sync_wait(rng_ptr->thrdid);

    // Start stream write back
    prg_strm_ma_mpa_reg(rng_ptr->thrdid, &strm_dst_mem[rng_ptr->thrdid][0]);
    prg_strm_ma_ctl_reg(rng_ptr->thrdid, 1, 63);
    // issue random reads
#if (NO_SAS == 1)
    rnd_read_result = 0;
    for(i=0; i<load_count; i++) {
       rnd_read_result += strm_dst_mem[rng_ptr->thrdid][rand(rng_ptr, 128)]; 
    }
    printf("C%dT%d : Doing random reads during strm write op, count = %d, res = %d\n", rng_ptr->thrdid/4, 
        rng_ptr->thrdid%4, load_count, rnd_read_result);
#endif

    strm_ctl_sync_wait(rng_ptr->thrdid);
    for(i=0; i<128; i++) {
        if(strm_src_mem[rng_ptr->thrdid][i] != strm_dst_mem[rng_ptr->thrdid][i]) {
            printf("C%dT%d : ERROR: gen_strm_array actual = %u and expected = %u values don't match\n", rng_ptr->thrdid/4, 
                rng_ptr->thrdid%4, strm_src_mem[rng_ptr->thrdid][i], strm_dst_mem[rng_ptr->thrdid][i]);
            fail();
        }
    }

    while((strm_unit_use_mask & (0x1 << rng_ptr->thrdid)) != 0) {
        lock_a_byte(&strm_unit_lock, 0x10000);
        strm_unit_use_mask ^= (0x1 << rng_ptr->thrdid);
        unlock_a_byte(&strm_unit_lock);
    }

    printf("C%dT%d : gen_strm_array result OK\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
}

void gen_rand_number(rng* rng_ptr) {
    printf("C%dT%d : rand number = %d\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, rand(rng_ptr, 100));
}

void gen_idtlb_invld_all(rng* rng_ptr) {
    if(rand(rng_ptr, 2)) {
        printf("C%dT%d : gen_itlb_invld_all ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
        itlb_invld_all();
    }
    if(rand(rng_ptr, 2)) {
        printf("C%dT%d : gen_dtlb_invld_all ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
        dtlb_invld_all();
    }
}
void gen_idtlb_fill_entries(rng* rng_ptr) {
    unsigned int num_entries_to_fill = rand(rng_ptr, 100);

    if(rand(rng_ptr, 2)) {
        printf("C%dT%d : gen_itlb_fill %d times \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, num_entries_to_fill);
        itlb_fill_entries(rng_ptr->thrdid, num_entries_to_fill);
    }
    if(rand(rng_ptr, 2)) {
        printf("C%dT%d : gen_dtlb_fill %d times \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, num_entries_to_fill);
        dtlb_fill_entries(rng_ptr->thrdid, num_entries_to_fill);
    }
}

/*
void gen_interthrd_intr_macro(rng* rng_ptr) {
    printf("C%dT%d : gen_interthrd_intr_macro ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    int dest_thrdid = rand(rng_ptr, 32);
    int intr_vector = rand(rng_ptr, 64);
    unsigned int intr_data = (dest_thrdid << 8) | (intr_vector);
    asm("stxa intr_data, [%g0] 0x73");
}
*/

void gen_membar(rng* rng_ptr) {
    if(rand(rng_ptr, 2)) {
        printf("C%dT%d : gen_membar_sync ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
        membar_sync();
    }
    else {
        printf("C%dT%d : gen_membar_storeload ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
        membar_storeload();
    }
}

void gen_indra_macro(rng* rng_ptr) {
    int num_imacros = indra_macros_end - indra_macros_start;
    printf("C%dT%d : gen_indra_macro ... num_macros = %d\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, 
           num_imacros);
    int rand_imacro = rand(rng_ptr, num_imacros);
    (*(indra_macros_start[rand_imacro]))();
}

void gen_randomize_asi(rng* rng_ptr) {
    printf("C%dT%d : gen_randomize_asi ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    unsigned int asi = rand(rng_ptr, 0x100); 
    randomize_asi(rng_ptr->thrdid, asi);
    printf("C%dT%d : ASI is set to 0x%x\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, asi);
}

void gen_common_counter_inc(rng* rng_ptr) {
    printf("C%dT%d : gen_common_counter_inc ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    volatile unsigned char* my_byte_addr = (((volatile unsigned char *)&common_counter) + rng_ptr->thrdid);
    volatile unsigned char  my_byte = *my_byte_addr;
    if(my_byte != rng_ptr->common_counter_val) {
        printf("C%dT%d : ERROR: common_counter_val = %u does not match saved val = %u\n", 
                rng_ptr->thrdid/4, rng_ptr->thrdid%4, my_byte, rng_ptr->common_counter_val);
        fail();
    }
    int i;
    int increment = rand(rng_ptr, 50);
    for(i=0; i<increment; i++) {
       (*my_byte_addr)++; 
    }
    rng_ptr->common_counter_val = *my_byte_addr;
    printf("C%dT%d : Final value of common counter = %u\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, *my_byte_addr);
}
void gen_flush_common_counter(rng* rng_ptr) {
    printf("C%dT%d : gen_flush_common_counter ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    volatile unsigned char* addr = ((unsigned char *)&common_counter);
    int i;
    int increment = rand(rng_ptr, 50);
    for(i=0; i<increment; i++) {
       flush(addr++); 
    }
    printf("C%dT%d : Common counter flush done.\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
}

void gen_ssi_fetch_macro(rng* rng_ptr) {
    printf("C%dT%d : gen_ssi_fetch_macro ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    gen_ssi_fetch(rng_ptr->thrdid);
    printf("C%dT%d : SSI fetch done.\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
}

void gen_wrmrst_macro(rng* rng_ptr) {
    printf("C%dT%d : gen_wrmrst_macro ... \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
    int wrmrst_enabled = WRM_RST;
    gen_wrmrst(rng_ptr->thrdid, wrmrst_enabled);
}

void gen_blocking_float(rng* rng_ptr, volatile unsigned int* blocking_req_ptr) {
    unsigned int base      = rand(rng_ptr, 100);
    unsigned int fraction  = rand(rng_ptr, 100);
    float        fbase     = (float)base + ((float)fraction/100.0);

    unsigned int inc_base  = rand(rng_ptr, 100);
    unsigned int frac_base = rand(rng_ptr, 100);
    float        inc       = (float)inc_base + ((float)frac_base/100.0);

    while(*blocking_req_ptr == 1) {
        fbase += inc;
    }
    printf("C%dT%d : gen_blocking_float ending with %f \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, fbase);
}


void gen_tlb_macro(rng* rng_ptr) {
    unsigned int rand_num = rand(rng_ptr, 4);
    switch(rand_num) { 
        case 0  : gen_idtlb_invld_all(rng_ptr); break;

        case 1  :
        case 2  :
        case 3  : gen_idtlb_fill_entries(rng_ptr); break; 
        default : fail();
    }
}

void gen_io_macro(rng* rng_ptr) {
    unsigned int rand_num = rand(rng_ptr, 2);
    switch (rand_num) {
        case 0  : gen_wrmrst_macro(rng_ptr); break; 
        case 1  : gen_ssi_fetch_macro(rng_ptr); break; 
        default : fail();
    }
}

void gen_math_macro(rng* rng_ptr) {
    unsigned int rand_num = rand(rng_ptr, 4);
    switch (rand_num) {
        case 0  : gen_recursion_macro(rng_ptr); break; 
        case 1  : gen_float_recursion_macro(rng_ptr); break; 
        case 2  : gen_array_add_macro(rng_ptr); break; 
#if (NO_SAS == 1)
        case 3  : gen_strm_array_macro(rng_ptr); break;
#else   
        case 3  : printf("C%dT%d : stream macro not present! \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4); break;
#endif
        default : fail();
    }
}

void gen_misc_macro(rng* rng_ptr) {
    unsigned int rand_num = rand(rng_ptr, 5);
    switch (rand_num) {
        case 0  : gen_membar(rng_ptr); break; 
        case 1  : gen_common_counter_inc(rng_ptr); break; 
        case 2  : gen_flush_common_counter(rng_ptr); break; 
        case 3  : gen_randomize_asi(rng_ptr); break; 
        case 4  : gen_rand_number(rng_ptr); break; 
        default : fail();
    }
}

void gen_blocking_req(rng* rng_ptr) {
    int rand_num      = rand(rng_ptr, 0x1000);
    int blocking_type = (rand_num      & 0xf) % 14; 
    int prefetch_hit  = ((rand_num>>4) & 0xf) %  2;
    int mem_addr_type = ((rand_num>>8) & 0xf) %  4;
    unsigned int* addr_to_use = (mem_addr_type == 0) ? (&mem_dma_scratch       + (64*rng_ptr->thrdid)) : 
                                (mem_addr_type == 1) ? (&jbus4_io_scratch      + (64*rng_ptr->thrdid)) :
                                (mem_addr_type == 2) ? (&jbus5_io_scratch      + (64*rng_ptr->thrdid)) :
                                (mem_addr_type == 3) ? (&jbus_fake_dma_scratch + (64*rng_ptr->thrdid)) : 0x0;
    unsigned int* func_to_use;
    printf("C%dT%d : gen_blocking_req %d addr_type = %d \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4, blocking_type, mem_addr_type);
    if(blocking_type != 6) {
        blocking_req = 1;
    }
    switch(blocking_type) {
        case 0  :
                   gen_blocking_flush(rng_ptr->thrdid, &blocking_req);
                   break;
        case 1  : 
                   gen_blocking_intr(rng_ptr->thrdid, &blocking_req);
                   break;
        case 2  : 
                   gen_blocking_float(rng_ptr, &blocking_req);
                   break;
        case 3  : 
                   gen_blocking_prefetch(rng_ptr->thrdid, &blocking_req, prefetch_hit);
                   break;
        case 4  : 
                   if(mem_addr_type != 0) {
                       memcopy(&mem_dma_scratch, addr_to_use, 256);
                   }
                   gen_blocking_ldd(rng_ptr->thrdid, &blocking_req, addr_to_use);
                   break;
        case 5  : 
                   if(mem_addr_type != 0) {
                       memcopy(&mem_dma_scratch, addr_to_use, 256);
                   }
                   gen_blocking_bls(rng_ptr->thrdid, &blocking_req, addr_to_use);
                   break;
        case 6  : 
        case 7  : 
                   printf("C%dT%d : Generating inter_proc_int to monarch=%d\n", 
                          rng_ptr->thrdid/4, rng_ptr->thrdid%4, monarch);
                   gen_inter_proc_int_macro(rng_ptr->thrdid, monarch);
                   break; 
        case 8  :  gen_blocking_icache_loop(rng_ptr, &blocking_req); 
                   break;
        case 9  :  gen_blocking_dcache_loop(rng_ptr, &blocking_req); 
                   break;
        case 10 :  gen_blocking_dcache_st_loop(rng_ptr, &blocking_req); 
                   break;
        case 11 :  
                   func_to_use  = (mem_addr_type == 0) ? gen_blocking_req :
                                  (mem_addr_type == 1) ? rand             :
                                  (mem_addr_type == 2) ? gen_math_macro   :
                                  (mem_addr_type == 3) ? gen_indra_macro  : (unsigned int *)0x0;
                   gen_blocking_ex_cache_loop(rng_ptr, &blocking_req, func_to_use); 
                   break;
        case 12 :  gen_blocking_self_cache_loop(rng_ptr, &blocking_req); 
                   break;
        case 13 :  gen_blocking_self2_cache_loop(rng_ptr, &blocking_req); 
                   break;
        default :
                   printf("C%dT%d : undefined blocking_type\n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
                   fail();
                   break;
    }
    printf("C%dT%d : unblocked now! \n", rng_ptr->thrdid/4, rng_ptr->thrdid%4);
}

// =================================================
// The Main : All threads start from here.
// =================================================

unsigned int last_inter_proc_int_ctr[] = {0, 0, 0, 0};

int main(int argc, char** argvp) {

void (*gen_macros[])() = { gen_blocking_req, 
                           gen_tlb_macro,
                           gen_io_macro, 
                           gen_math_macro, 
                           gen_indra_macro,
                           gen_misc_macro
                         };
int total_macros = 6;

    int run_macros = 5;
    if(THREAD_COUNT < 16) {
        run_macros *= 2;
    }

/*  printf("size of gen_macros = %d\n", sizeof(*gen_macros));
    asm(".word 0x00000000");
    asm(".word 0x01000000");
    asm(".word 0x00000000");
    asm(".word 0x01000000");
    asm(".word 0x00000000");
*/
    if(argc < 3) { 
        printf("ERROR : argc is %d\n", argc);
        fail();
    }

    char* arg;
    arg = *(argvp+1);
    int thrdid = atoi(arg); 
    arg = *(argvp+2);
    int thrd_count = atoi(arg);
    printf("C%dT%d : thr_count = %d\n", thrdid/4, thrdid%4, thrd_count);

    rng                 rng_obj;
    rng*                rng_ptr          = &rng_obj;
    sys_thrd_status*    thrd_status_ptr  = &thread_status;
    event_generator*    event_gen_ptr    = &event_gen;

    while(monarch == (unsigned char)0xc0) {
        unsigned char* addr = &arb_monarch;
        unsigned char owner = ldstub(addr);    
        if(owner != (unsigned char)0xff) {
            printf("C%dT%d : is Monarch in pid = %d ....\n", thrdid/4, thrdid%4, get_pid());
            monarch = thrdid;
        }
    }

    if(thrdid == monarch) {
        init_rng(rng_ptr, (RAND_SEED+thrdid), thrdid);
        init_sys_thrd_status(thrd_status_ptr);
        init_event_generator(event_gen_ptr, thrd_status_ptr);
     
        mark_thrd_active(thrd_status_ptr, thrdid);
        // mark_thrd_inuse(thrd_status_ptr, thrdid);
        init_done = 1;
        // init_tick_and_intr_q(thrdid, (0x300+rand(rng_ptr,0x1000)));
    }
    else {
        init_rng(rng_ptr, (RAND_SEED+thrdid), thrdid);
        // init_tick_and_intr_q(thrdid, (0x300+rand(rng_ptr,0x1000)));
        while(init_done == 0) {
            // Wait here
        }
        mark_thrd_active(thrd_status_ptr, thrdid);
    }

    int i;
    for(i=0; i<run_macros; i++) {
        int rand_macro = rand(rng_ptr, total_macros);
        if(thrdid != monarch && blocking_req) rand_macro=0;
	if(thrdid == monarch) {
            if(blocking_req) blocking_req=0; 
            if(rand_macro == 0) rand_macro = 1;
        }
        (*(gen_macros[rand_macro]))(rng_ptr);
    }

    lock_a_byte(&finish_mask_lock, 0x10000);
    finish_mask |= (0x1 << thrdid);
    unlock_a_byte(&finish_mask_lock);

    if(thrdid == 0) {
        int finished_threads = 0;
        while(finished_threads != THREAD_COUNT) { 
            finished_threads = 0;
            for(i=0; i<32; i++) {
                if(finish_mask & (0x1 << i)) finished_threads++;
            }
	    if(thrdid == monarch) {
                if(blocking_req) blocking_req=0; 
            }
            printf("C%dT%d : Waiting for other threads to finish, mask = 0x%x !!!\n", thrdid/4, thrdid%4, finish_mask);
        }
    }

    while(thrdid == monarch && thrdid != 0) {
        if(blocking_req) blocking_req=0; 
    }
    printf("C%dT%d : Done !!!\n", thrdid/4, thrdid%4);
    pass();
}


