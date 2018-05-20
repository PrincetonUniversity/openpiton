#ifndef ICARUS_COMPAT_H
#define ICARUS_COMPAT_H

// from veriuser.h
typedef struct t_vecval
{
    int avalbits;
    int bvalbits;
} s_vecval, *p_vecval;

extern struct t_tfnodeinfo* tf_nodeinfo(PLI_INT32 a, struct t_tfnodeinfo*ip);

extern int tf_strdelputp(int nparam, int bitlength, int format_char, char *value_p, int delay, int delaytype);

extern int tf_propagatep(int pnum);


//from acc_user.h
#define accRegister  accReg

/* delay modes */
#define accDelayModeNone 0
#define accDelayModePath 1

#define accPathDelayCount      1
#define accPathDelimStr        2

extern int acc_fetch_delay_mode(handle object_p);
extern int acc_replace_delays (handle object, ...);
extern handle acc_next_child (handle mod_handle, handle child);
#endif
