#ifndef _ENV_PICORV32_TEST_H
#define _ENV_PICORV32_TEST_H

#ifndef TEST_FUNC_NAME
#  define TEST_FUNC_NAME mytest
#  define TEST_FUNC_TXT "mytest"
#  define TEST_FUNC_RET mytest_ret
#endif

#define RVTEST_RV32U
#define TESTNUM x28

#define RVTEST_CODE_BEGIN		\
	.text;				\
    add x1, x0, x0; \
    add x2, x0, x0; \
    add x3, x0, x0; \
    add x4, x0, x0; \
    add x5, x0, x0; \
    add x6, x0, x0; \
    add x7, x0, x0; \
    add x8, x0, x0; \
    add x9, x0, x0; \
    add x10, x0, x0; \
    add x11, x0, x0; \
    add x12, x0, x0; \
    add x13, x0, x0; \
    add x14, x0, x0; \
    add x15, x0, x0; \
    add x16, x0, x0; \
    add x17, x0, x0; \
    add x18, x0, x0; \
    add x19, x0, x0; \
    add x20, x0, x0; \
    add x21, x0, x0; \
    add x22, x0, x0; \
    add x23, x0, x0; \
    add x24, x0, x0; \
    add x25, x0, x0; \
    add x26, x0, x0; \
    add x27, x0, x0; \
    add x28, x0, x0; \
    add x29, x0, x0; \
    add x30, x0, x0; \
    add x31, x0, x0; \
	.global TEST_FUNC_NAME;		\
	.global TEST_FUNC_RET;		\
TEST_FUNC_NAME:				\
	lui	a0,%hi(.test_name);	\
	addi	a0,a0,%lo(.test_name);	\
	lui	a2,0xf0c2c000>>12;	\
.prname_next:				\
	lb	a1,0(a0);		\
	beq	a1,zero,.prname_done;	\
	sw	a1,0(a2);		\
	addi	a0,a0,1;		\
	jal	zero,.prname_next;	\
.test_name:				\
	.ascii TEST_FUNC_TXT;		\
	.byte 0x00;			\
	.balign 4, 0;			\
.prname_done:				\
	addi	a1,zero,'.';		\
	sw	a1,0(a2);		\
	sw	a1,0(a2);

#define RVTEST_PASS			\
	lui	a0,0x10000000>>12;	\
	addi	a1,zero,'O';		\
	addi	a2,zero,'K';		\
	addi	a3,zero,'\n';		\
	sw	a1,0(a0);		\
	sw	a2,0(a0);		\
	sw	a3,0(a0);		\
	jal	zero,TEST_FUNC_NAME;

#define RVTEST_FAIL			\
	lui	a0,0x10000000>>12;	\
	addi	a1,zero,'E';		\
	addi	a2,zero,'R';		\
	addi	a3,zero,'O';		\
	addi	a4,zero,'\n';		\
	sw	a1,0(a0);		\
	sw	a2,0(a0);		\
	sw	a2,0(a0);		\
	sw	a3,0(a0);		\
	sw	a2,0(a0);		\
	sw	a4,0(a0);		\
	ebreak;

#define RVTEST_CODE_END
#define RVTEST_DATA_BEGIN .balign 4;
#define RVTEST_DATA_END

#endif
