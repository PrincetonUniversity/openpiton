dnl start_threads
dnl rdth_id 	// returns thread id in %o1
dnl rdth_id_p	// returns thread id in %o1
dnl rdth_id_h	// returns thread id in %g3
dnl wrth_attr(%reg)
dnl wrth_attr_p(%reg)
dnl th_join(instance, shared-counter-asddress, %reg1, %reg2, time-out)
dnl th_sync(instance, shared_counter, timmer)
dnl th_fork(label)
dnl
dnl th_wr_pcontext_p(val13,%reg0,%reg1)
dnl th_wr_scontext_p(val13,%reg0,%reg1)
dnl th_wr_pcontext(val13,%reg0,%reg1)
dnl th_wr_scontext(val13,%reg0,%reg1)
dnl
dnl th_setx(val64,%reg0,%reg1,stride)
dnl
dnl k_svc[1,2,3,4](func_num, arg1, ...) ! args in %o0, %o1 etc.

#ifndef THREAD_START_X
#define THREAD_START_X 1
#endif

#ifndef THREAD_START_Y
#define THREAD_START_Y 1
#endif

changequote([, ])dnl

define([M4_thread_mask], THREAD_MASK)dnl

define([M4_thread_mask_minus_lsb],[ifelse([0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000001,16), 0x1,                                [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000001,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000002,16), 0x2,                                [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000002,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000004,16), 0x4,                                [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000004,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000008,16), 0x8,                                [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000008,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000010,16), 0x10,                               [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000010,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000020,16), 0x20,                               [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000020,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000040,16), 0x40,                               [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000040,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000080,16), 0x80,                               [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000080,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000100,16), 0x100,                              [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000100,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000200,16), 0x200,                              [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000200,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000400,16), 0x400,                              [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000400,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000000800,16), 0x800,                              [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000000800,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000001000,16), 0x1000,                             [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000001000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000002000,16), 0x2000,                             [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000002000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000004000,16), 0x4000,                             [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000004000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000008000,16), 0x8000,                             [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000008000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000010000,16), 0x10000,                            [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000010000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000020000,16), 0x20000,                            [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000020000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000040000,16), 0x40000,                            [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000040000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000080000,16), 0x80000,                            [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000080000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000100000,16), 0x100000,                           [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000100000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000200000,16), 0x200000,                           [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000200000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000400000,16), 0x400000,                           [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000400000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000000800000,16), 0x800000,                           [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000000800000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000001000000,16), 0x1000000,                          [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000001000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000002000000,16), 0x2000000,                          [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000002000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000004000000,16), 0x4000000,                          [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000004000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000008000000,16), 0x8000000,                          [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000008000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000010000000,16), 0x10000000,                         [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000010000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000020000000,16), 0x20000000,                         [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000020000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000040000000,16), 0x40000000,                         [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000040000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000080000000,16), 0x80000000,                         [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000080000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000100000000,16), 0x100000000,                        [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000100000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000200000000,16), 0x200000000,                        [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000200000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000400000000,16), 0x400000000,                        [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000400000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000000800000000,16), 0x800000000,                        [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000000800000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000001000000000,16), 0x1000000000,                       [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000001000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000002000000000,16), 0x2000000000,                       [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000002000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000004000000000,16), 0x4000000000,                       [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000004000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000008000000000,16), 0x8000000000,                       [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000008000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000010000000000,16), 0x10000000000,                      [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000010000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000020000000000,16), 0x20000000000,                      [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000020000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000040000000000,16), 0x40000000000,                      [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000040000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000080000000000,16), 0x80000000000,                      [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000080000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000100000000000,16), 0x100000000000,                     [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000100000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000200000000000,16), 0x200000000000,                     [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000200000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000400000000000,16), 0x400000000000,                     [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000400000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000000800000000000,16), 0x800000000000,                     [0x]mpeval(THREAD_MASK ^ 0x00000000000000000000800000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000001000000000000,16), 0x1000000000000,                    [0x]mpeval(THREAD_MASK ^ 0x00000000000000000001000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000002000000000000,16), 0x2000000000000,                    [0x]mpeval(THREAD_MASK ^ 0x00000000000000000002000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000004000000000000,16), 0x4000000000000,                    [0x]mpeval(THREAD_MASK ^ 0x00000000000000000004000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000008000000000000,16), 0x8000000000000,                    [0x]mpeval(THREAD_MASK ^ 0x00000000000000000008000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000010000000000000,16), 0x10000000000000,                   [0x]mpeval(THREAD_MASK ^ 0x00000000000000000010000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000020000000000000,16), 0x20000000000000,                   [0x]mpeval(THREAD_MASK ^ 0x00000000000000000020000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000040000000000000,16), 0x40000000000000,                   [0x]mpeval(THREAD_MASK ^ 0x00000000000000000040000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000080000000000000,16), 0x80000000000000,                   [0x]mpeval(THREAD_MASK ^ 0x00000000000000000080000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000100000000000000,16), 0x100000000000000,                  [0x]mpeval(THREAD_MASK ^ 0x00000000000000000100000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000200000000000000,16), 0x200000000000000,                  [0x]mpeval(THREAD_MASK ^ 0x00000000000000000200000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000400000000000000,16), 0x400000000000000,                  [0x]mpeval(THREAD_MASK ^ 0x00000000000000000400000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000000800000000000000,16), 0x800000000000000,                  [0x]mpeval(THREAD_MASK ^ 0x00000000000000000800000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000001000000000000000,16), 0x1000000000000000,                 [0x]mpeval(THREAD_MASK ^ 0x00000000000000001000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000002000000000000000,16), 0x2000000000000000,                 [0x]mpeval(THREAD_MASK ^ 0x00000000000000002000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000004000000000000000,16), 0x4000000000000000,                 [0x]mpeval(THREAD_MASK ^ 0x00000000000000004000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000008000000000000000,16), 0x8000000000000000,                 [0x]mpeval(THREAD_MASK ^ 0x00000000000000008000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000010000000000000000,16), 0x10000000000000000,                [0x]mpeval(THREAD_MASK ^ 0x00000000000000010000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000020000000000000000,16), 0x20000000000000000,                [0x]mpeval(THREAD_MASK ^ 0x00000000000000020000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000040000000000000000,16), 0x40000000000000000,                [0x]mpeval(THREAD_MASK ^ 0x00000000000000040000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000080000000000000000,16), 0x80000000000000000,                [0x]mpeval(THREAD_MASK ^ 0x00000000000000080000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000100000000000000000,16), 0x100000000000000000,               [0x]mpeval(THREAD_MASK ^ 0x00000000000000100000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000200000000000000000,16), 0x200000000000000000,               [0x]mpeval(THREAD_MASK ^ 0x00000000000000200000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000400000000000000000,16), 0x400000000000000000,               [0x]mpeval(THREAD_MASK ^ 0x00000000000000400000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000000800000000000000000,16), 0x800000000000000000,               [0x]mpeval(THREAD_MASK ^ 0x00000000000000800000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000001000000000000000000,16), 0x1000000000000000000,              [0x]mpeval(THREAD_MASK ^ 0x00000000000001000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000002000000000000000000,16), 0x2000000000000000000,              [0x]mpeval(THREAD_MASK ^ 0x00000000000002000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000004000000000000000000,16), 0x4000000000000000000,              [0x]mpeval(THREAD_MASK ^ 0x00000000000004000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000008000000000000000000,16), 0x8000000000000000000,              [0x]mpeval(THREAD_MASK ^ 0x00000000000008000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000010000000000000000000,16), 0x10000000000000000000,             [0x]mpeval(THREAD_MASK ^ 0x00000000000010000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000020000000000000000000,16), 0x20000000000000000000,             [0x]mpeval(THREAD_MASK ^ 0x00000000000020000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000040000000000000000000,16), 0x40000000000000000000,             [0x]mpeval(THREAD_MASK ^ 0x00000000000040000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000080000000000000000000,16), 0x80000000000000000000,             [0x]mpeval(THREAD_MASK ^ 0x00000000000080000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000100000000000000000000,16), 0x100000000000000000000,            [0x]mpeval(THREAD_MASK ^ 0x00000000000100000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000200000000000000000000,16), 0x200000000000000000000,            [0x]mpeval(THREAD_MASK ^ 0x00000000000200000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000400000000000000000000,16), 0x400000000000000000000,            [0x]mpeval(THREAD_MASK ^ 0x00000000000400000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000000800000000000000000000,16), 0x800000000000000000000,            [0x]mpeval(THREAD_MASK ^ 0x00000000000800000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000001000000000000000000000,16), 0x1000000000000000000000,           [0x]mpeval(THREAD_MASK ^ 0x00000000001000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000002000000000000000000000,16), 0x2000000000000000000000,           [0x]mpeval(THREAD_MASK ^ 0x00000000002000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000004000000000000000000000,16), 0x4000000000000000000000,           [0x]mpeval(THREAD_MASK ^ 0x00000000004000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000008000000000000000000000,16), 0x8000000000000000000000,           [0x]mpeval(THREAD_MASK ^ 0x00000000008000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000010000000000000000000000,16), 0x10000000000000000000000,          [0x]mpeval(THREAD_MASK ^ 0x00000000010000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000020000000000000000000000,16), 0x20000000000000000000000,          [0x]mpeval(THREAD_MASK ^ 0x00000000020000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000040000000000000000000000,16), 0x40000000000000000000000,          [0x]mpeval(THREAD_MASK ^ 0x00000000040000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000080000000000000000000000,16), 0x80000000000000000000000,          [0x]mpeval(THREAD_MASK ^ 0x00000000080000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000100000000000000000000000,16), 0x100000000000000000000000,         [0x]mpeval(THREAD_MASK ^ 0x00000000100000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000200000000000000000000000,16), 0x200000000000000000000000,         [0x]mpeval(THREAD_MASK ^ 0x00000000200000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000400000000000000000000000,16), 0x400000000000000000000000,         [0x]mpeval(THREAD_MASK ^ 0x00000000400000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000000800000000000000000000000,16), 0x800000000000000000000000,         [0x]mpeval(THREAD_MASK ^ 0x00000000800000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000001000000000000000000000000,16), 0x1000000000000000000000000,        [0x]mpeval(THREAD_MASK ^ 0x00000001000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000002000000000000000000000000,16), 0x2000000000000000000000000,        [0x]mpeval(THREAD_MASK ^ 0x00000002000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000004000000000000000000000000,16), 0x4000000000000000000000000,        [0x]mpeval(THREAD_MASK ^ 0x00000004000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000008000000000000000000000000,16), 0x8000000000000000000000000,        [0x]mpeval(THREAD_MASK ^ 0x00000008000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000010000000000000000000000000,16), 0x10000000000000000000000000,       [0x]mpeval(THREAD_MASK ^ 0x00000010000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000020000000000000000000000000,16), 0x20000000000000000000000000,       [0x]mpeval(THREAD_MASK ^ 0x00000020000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000040000000000000000000000000,16), 0x40000000000000000000000000,       [0x]mpeval(THREAD_MASK ^ 0x00000040000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000080000000000000000000000000,16), 0x80000000000000000000000000,       [0x]mpeval(THREAD_MASK ^ 0x00000080000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000100000000000000000000000000,16), 0x100000000000000000000000000,      [0x]mpeval(THREAD_MASK ^ 0x00000100000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000200000000000000000000000000,16), 0x200000000000000000000000000,      [0x]mpeval(THREAD_MASK ^ 0x00000200000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000400000000000000000000000000,16), 0x400000000000000000000000000,      [0x]mpeval(THREAD_MASK ^ 0x00000400000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00000800000000000000000000000000,16), 0x800000000000000000000000000,      [0x]mpeval(THREAD_MASK ^ 0x00000800000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00001000000000000000000000000000,16), 0x1000000000000000000000000000,     [0x]mpeval(THREAD_MASK ^ 0x00001000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00002000000000000000000000000000,16), 0x2000000000000000000000000000,     [0x]mpeval(THREAD_MASK ^ 0x00002000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00004000000000000000000000000000,16), 0x4000000000000000000000000000,     [0x]mpeval(THREAD_MASK ^ 0x00004000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00008000000000000000000000000000,16), 0x8000000000000000000000000000,     [0x]mpeval(THREAD_MASK ^ 0x00008000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00010000000000000000000000000000,16), 0x10000000000000000000000000000,    [0x]mpeval(THREAD_MASK ^ 0x00010000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00020000000000000000000000000000,16), 0x20000000000000000000000000000,    [0x]mpeval(THREAD_MASK ^ 0x00020000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00040000000000000000000000000000,16), 0x40000000000000000000000000000,    [0x]mpeval(THREAD_MASK ^ 0x00040000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00080000000000000000000000000000,16), 0x80000000000000000000000000000,    [0x]mpeval(THREAD_MASK ^ 0x00080000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00100000000000000000000000000000,16), 0x100000000000000000000000000000,   [0x]mpeval(THREAD_MASK ^ 0x00100000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00200000000000000000000000000000,16), 0x200000000000000000000000000000,   [0x]mpeval(THREAD_MASK ^ 0x00200000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00400000000000000000000000000000,16), 0x400000000000000000000000000000,   [0x]mpeval(THREAD_MASK ^ 0x00400000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x00800000000000000000000000000000,16), 0x800000000000000000000000000000,   [0x]mpeval(THREAD_MASK ^ 0x00800000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x01000000000000000000000000000000,16), 0x1000000000000000000000000000000,  [0x]mpeval(THREAD_MASK ^ 0x01000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x02000000000000000000000000000000,16), 0x2000000000000000000000000000000,  [0x]mpeval(THREAD_MASK ^ 0x02000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x04000000000000000000000000000000,16), 0x4000000000000000000000000000000,  [0x]mpeval(THREAD_MASK ^ 0x04000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x08000000000000000000000000000000,16), 0x8000000000000000000000000000000,  [0x]mpeval(THREAD_MASK ^ 0x08000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x10000000000000000000000000000000,16), 0x10000000000000000000000000000000, [0x]mpeval(THREAD_MASK ^ 0x10000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x20000000000000000000000000000000,16), 0x20000000000000000000000000000000, [0x]mpeval(THREAD_MASK ^ 0x20000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x40000000000000000000000000000000,16), 0x40000000000000000000000000000000, [0x]mpeval(THREAD_MASK ^ 0x40000000000000000000000000000000,16),
        [0x]mpeval(THREAD_MASK & 0x80000000000000000000000000000000,16), 0x80000000000000000000000000000000, [0x]mpeval(THREAD_MASK ^ 0x80000000000000000000000000000000,16))])

#ifdef USER_TEXT_MT_MAP
define([M4_user_text_mask], THREAD_MASK)dnl
#else 
define([M4_user_text_mask], 0x00000000000000000000000000000001)dnl
#endif

#ifdef USER_DATA_MT_MAP
define([M4_user_data_mask], THREAD_MASK)dnl
#else 
define([M4_user_data_mask], 0x00000000000000000000000000000001)dnl
#endif

! M4 Mask values
! thread_mask_minus_lsb    M4_thread_mask_minus_lsb
! thread_mask    M4_thread_mask
! user_text_mask M4_user_text_mask
! user_data_mask M4_user_data_mask

define([forloop],
	[pushdef([$1], [$2])_forloop([$1], [$2], [$3], [$4])popdef([$1])])dnl
define([_forloop],
	[$4[]ifelse($1, [$3], ,
		[define([$1], incr($1))_forloop([$1], [$2], [$3], [$4])])])dnl

dnl This macro enumerates from zero to the mask width.  It only expands the user's
dnl expression if the corresponding bit in the mask is set to one.
dnl i = index, counts from 0 to mask_width
dnl Usage  : foreachbit([i], mask_width, hex_mask, [your code with i as index])
dnl Example: foreachbit([i], 32, 0x88facef6, [[my_label]i ])

define([foreachbit],
	[pushdef([$1], 0)_foreachbit([$1], [$2], [$3], [$4])popdef([$1])])dnl

define([_foreachbit],
	[ifelse(mpeval(($3 >> $1) & 0x1, 16), 1, [$4])[]ifelse($1, [$2], ,
							[define([$1], incr($1))_foreachbit([$1], [$2], [$3], [$4])])])dnl

ifelse(mpeval(THREAD_COUNT), 1, ,
define([start_th_expand],
#ifdef CIOP


dnl Get core id for parallel processor, and skip thread spawn if not 0
    setx    0xba00000000[[`,']] %g1[[`,']] %g2
    ldx [[[%g2]]][[`,']] %l1            ! %l1 has coreid
    sub %l1[[`,']] 0[[`,']] %l1
    brnz    %l1[[`,']] skip_start_th

dnl Tri: old T1 routine for getting coreid, does not work
	! determine if current thread is the bootstrap thread (first avail thread)
	! if not; skip over all start_th code
	setx	0x9800000830[[`,']] %g1[[`,']] %g2
	ldx	[[[%g2]]][[`,']] %g3			! %g3 has coreavail
	rd      %asr26[[`,']] %l1
        set     0x1f00[[`,']] %g1
        and     %l1[[`,']] %g1[[`,']] %l1
        srlx    %l1[[`,']] 8[[`,']] %l1             	! %l1 has thread ID


	mov	63[[`,']] %g1
	sub	%g1[[`,']] %l1[[`,']] %g1
	sllx	%g3[[`,']] %g1[[`,']] %g3
	sllx	%g3[[`,']] 1[[`,']] %g3			! Total shift of (64-thread ID) bits
    ! brnz    %g3[[`,']] skip_start_th


    ! Tri: for some reason coreavail value at g3 is not working
    ! basically skip start thread if id not equal to 0

    sub %l1[[`,']] 0[[`,']] %l1
    brnz    %l1[[`,']] skip_start_th

	! set up constants for start_th
	setx	0x0000010001[[`,']] %g1[[`,']] %g2	! type=reset traptype=POR
	setx	0x9800000800[[`,']] %g1[[`,']] %g3	! PA of INT_VEC_DIS
#endif
foreachbit([i], 128, M4_thread_mask_minus_lsb, [
[[$1_]]eval(i):
#ifndef CIOP
	nop	! $EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.[[$1_]]eval(i)) + (4*((THREAD_START_X * i) % THREAD_START_Y)), 16, 16)) -> intp(eval(i,16), 1, 1)
#else
    mov eval(i,16)[[`,']] %g1
#ifdef PORTABLE_CORE
	add	%g1[[`,']] %l1[[`,']] %g1
#endif
	sllx	%g1[[`,']] 8[[`,']] %g1
	or	%g1[[`,']] %g2[[`,']] %g1	! %g1 contains the command for INT_VEC_DIS
	stx	%g1[[`,']] [[[%g3]]]		! write to INT_VEC_DIS
    !stxa %g1[[`,']] [[[%g3]]] 0x73        ! write to INT_VEC_DIS
#endif
])
skip_start_th:
))dnl


ifelse(mpeval(THREAD_COUNT), 1, ,
define([th_expand], start_th_expand(`$1')))dnl

dnl ****************************************

#ifdef SEQ_THREADS

define([local_tmp1], 0)

define([start_fork_expand],
foreachbit([i], 128, M4_thread_mask, [
	cmp	 [[%o1, ]]eval(i)
	be	[[$1_]]eval(local_tmp1)
	nop
    pushdef([local_tmp1], incr(local_tmp1)) 
])
)dnl

define([local_tmp2], 0)

define([start_fork_expand_jmp],
foreachbit([i], 128, M4_thread_mask, [
	cmp	 [[%o1, ]]eval(i)
	setx	[[$1_]]eval(local_tmp2)[[, %g2, %g3]]
	[[be,a	.+8]]
	jmp	%g3
	nop
    pushdef([local_tmp2], incr(local_tmp2)) 
])
)dnl

#else

define([start_fork_expand],
foreachbit([i], 128, M4_thread_mask, [
	cmp	 [[%o1, ]]eval(i)
	be	[[$1_]]eval(i)
	nop
])
)dnl


define([start_fork_expand_jmp],
foreachbit([i], 128, M4_thread_mask, [
	cmp	 [[%o1, ]]eval(i)
	setx	[[$1_]]eval(i)[[, %g2, %g3]]
	[[be,a	.+8]]
	jmp	%g3
	nop
])
)dnl


#endif

define([fork_expand], start_fork_expand(`$1'))dnl
define([fork_expand_jmp], start_fork_expand_jmp(`$1'))dnl

changequote(`,')dnl

dnl ****************************************

ifelse(mpeval(THREAD_COUNT), 1, 
define(`start_threads', `! single thread'),
define(`start_threads', th_expand(start_th))
)dnl

ifelse(mpeval(THREAD_COUNT), 1,
define(`sync_threads', `! single thread'),
define(`sync_threads', `
        setx	sync_thr_counter, %l1, %l0   
sync_thr_wait_for_inc:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all
        nop
')
)dnl


! trin extra syncs
ifelse(mpeval(THREAD_COUNT), 1,
define(`sync_threads_2', `! single thread'),
define(`sync_threads_2', `
        setx  sync_thr_counter_2, %l1, %l0   
sync_thr_wait_for_inc_2:
        ldstub  [%l0], %l1
        cmp %l1, 0xff
        be  sync_thr_wait_for_inc_2
        nop
        inc %l1       
        stub  %l1, [%l0]

sync_thr_wait_for_all_2:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_2
        nop
')
)dnl




dnl: thread-to-get-intp (in hex without 0x), section, label, offset
define(start_thread_1, `
	! $EV trig_pc_d(1,expr(@VA(.$2.$3) + $4, 16, 16)) -> intp($1, 1, 1)
')dnl

dnl	setx	[[$1]]+i [[, %g1, %g2]]
dnl	be	+8

dnl read-thread-id from user mode 0..31
define(rdth_id,`
	ta      T_RD_THID
')dnl

dnl read-thread-id from priv mode 0..31
define(rdth_id_p,`
	ta      T_RD_THID
')dnl

dnl read-thread-id from hyper mode 0..31
define(rdth_id_h,`
	rd      %asr26, %g3
#ifdef PORTABLE_CORE
        sllx    %g3, 54, %g3
        srlx    %g3, 62, %g3
#else
        sllx    %g3, 51, %g3
        srlx    %g3, 59, %g3
#endif
')dnl


dnl read-thread-id from user mode 0..31
define(wrth_attr,`
	ta      T_CHANGE_HPRIV
	wr      %g0, $1, %asr26
	ta      T_CHANGE_NONHPRIV
')dnl



dnl read-thread-id from priv mode 0..31
define(wrth_attr_p,`
	wr      %g0, $1, %asr26
')dnl

define(th_join, `
	ta	T_MUTEX_LOCK
	setx	$2, $3, $4
	ldsb	[$4], $3
	add	1, $3, $3
	stub	$3, [$4]
	ta	T_MUTEX_UNLOCK
	set	$5, %i0
	subcc	%i0, 1, %i0
	te	T_BAD_TRAP
	cmp	$3, THREAD_COUNT
	bl	.-12
	ldsb	[$4], $3
')dnl

define(th_sync_old, `
	! sync_macro
	nop
	ta      T_SYNC
	mov	$1, %o1
	ta	T_MUTEX_LOCK
	ldsb	[%g4+$2], %g3
	add	1, %g3, %g3
	stub	%g3, [%g4+$2]
	ta	T_MUTEX_UNLOCK
	sethi	%hi($3), %g1
	or	%lo($3), %g0, %g1
	subcc	%g1, 1, %g1
	te	T_BAD_TRAP
	cmp	%g3, THREAD_COUNT
	bl,a	.-12
	ldsb	[%g4+$2], %g3
	done
	nop
')dnl

define(th_sync, `
        ! sync_macro
        nop
        ta      T_SYNC                     ! GL = 2
        mov     $1, %g7
        mov     $2, %g6
        sethi   %hi($3), %g5
        or      %lo($3), %g0, %g5
        ta      T_MUTEX_LOCK               ! GL = 2
        nop
        nop
        ta      T_MUTEX_UNLOCK             ! GL = 2
        nop
        ta      T_SYNC
        nop
')dnl  


dnl	rd	%asr26, %g1
dnl	set	0x1f00, $2
dnl	and	%g1, $2, %g1
dnl	srlx 	%g1, 8, %g1

define(th_fork, `
    rdth_id
    fork_expand($1)
    nop
    ta T_BAD_TRAP
')dnl

define(th_fork_jmp, `
	rdth_id
	fork_expand_jmp($1)
	ta T_BAD_TRAP
')dnl

define(th_fork_jmp_p, `
	rdth_id_p
	fork_expand_jmp($1)
	ta T_BAD_TRAP
')dnl

define(th_setx, `
	setx	$1, $2, $3
	rdth_id(`$1',`$2')dnl
	smul	$2, $4, $2
	add	$2, %g0, $3
')dnl


define(th_wr_pcontext, `
	ta      T_CHANGE_PRIV
	set	$1, $2
	mov 	8, $3
	stxa 	$2, [$3] 0x58
	ta      T_CHANGE_NONPRIV
')dnl

define(th_wr_scontext, `
	ta      T_CHANGE_PRIV
	set	$1, $2
	mov 	16, $3
	stxa 	$2, [$3] 0x58
	ta      T_CHANGE_NONPRIV
')dnl


define(th_wr_pcontext_p, `
	set	$1, $2
	mov 	8, $3
	stxa 	$2, [$3] 0x58
')dnl

define(th_wr_scontext_p, `
	set	$1, $2
	mov 	16, $3
	stxa 	$2, [$3] 0x58
')dnl



define(k_svc, `
	mov	$1, %i0
	ta	T_FUNCTION
')dnl
	
define(k_svc1, `
	setx	$2, $1, %i1
	mov	$1, %i0
	ta	T_FUNCTION
')dnl
	
define(k_svc2, `
	setx	$3, $1, %i2
	setx	$2, $1, %i1
	mov	$1, %i0
	ta	T_FUNCTION
')dnl
	
define(k_svc3, `
	setx	$4, $1, %i3
	setx	$3, $1, %i2
	setx	$2, $1, %i1
	mov	$1, %i0
	ta	T_FUNCTION
')dnl
	
define(k_svc4, `
	setx	$5, $1, %i4
	setx	$4, $1, %i3
	setx	$3, $1, %i2
	setx	$2, $1, %i1
	mov	$1, %i0
	ta	T_FUNCTION
')dnl
	
define(make_reg, `%$1')dnl
	

define(itlb_demap_ctx_forever, `
     rdth_id_p

     cmp    %o1, $1
     bne     %xcc, .itlb_demap_ctx_end
     nop

     setx $2, %g1, %g4
     or   %g4, 0x10, %g4
     ! if thread-id == $1; i-tlb-demap; loop

.itlb_demap_ctx_loop0:
     ! i-dmap ctx
     stxa   %g0, [%g4] 0x57
     mov    $3, %g3
.itlb_demap_ctx_loop1:
     cmp    %g3, 0
     bne    %xcc, .itlb_demap_ctx_loop1
     subcc  %g3, 1, %g3
     ba     .itlb_demap_ctx_loop0
     nop
.itlb_demap_ctx_end:
')dnl

define(dtlb_demap_ctx_forever, `
     rdth_id_p

     cmp    %o1, $1
     be     %xcc, .dtlb_demap_ctx_end
     nop

     setx $2, %g1, %g4
     or   %g4, 0x10, %g4
     ! if thread-id == $1; i-tlb-demap; loop

.dtlb_demap_ctx_loop0:
     ! i-dmap ctx
     stxa   %g0, [%g4] 0x5f
     mov    $3, %g3
.dtlb_demap_ctx_loop1:
     cmp    %g3, 0
     bne    %xcc, .dtlb_demap_ctx_loop1
     subcc  %g3, 1, %g3
     ba     .dtlb_demap_ctx_loop0
     nop
.dtlb_demap_ctx_end:
')dnl

define(th_set_barrier, `
	! set_barrier_macro
	mov	1, %r1
	stub	%r1, [$2+$1]
')dnl


define(th_clear_barrier, `
	! clear_barrier_macro
	stub	%r0, [$2+$1]
')dnl

define(th_wait_for_barrier_clear, `
	! wait_for_barrier_clear_macro
	ldub	[$2+$1], %r1
	brnz	%r1, .-4
        nop
')dnl


define(init_mem,
	`define( `init_val', $1)       
	 define( `data_size', mpeval($3))		
	 define( `blk_len', mpeval($2))	
	 define( `it_count', 1)		
	 define( `sec_val', $5)		
	 define( `opr1', $4)		
	 define( `opr2', $6)		
	 define( `opnd3', $7)		
	 ifelse(data_size,8,`gen_value',	
	        data_size,4,`gen_value',	
                data_size,2,`gen_value',	
                data_size,1,`gen_value',	
                `errprint(ERROR: "init_mem" data size=data_size is illegal)')')

define(gen_value,
	`ifelse(data_size,8,.xword `0x'mpeval(init_val opr1 sec_val,16,16),
		data_size,4,.word `0x'mpeval(init_val opr1 sec_val,16,8),
                data_size,2,.half `0x'mpeval(init_val opr1 sec_val,16,4),
                data_size,1,.byte `0x'mpeval(init_val opr1 sec_val,16,2)) dnl
         ifelse(mpeval(len(opr1)>0),1,`define(`sec_val',`0x'mpeval(sec_val opr2 opnd3,16,16))') dnl
         define(`it_count', incr(it_count))
         ifelse(mpeval(it_count>blk_len),1,,`gen_value')') 



