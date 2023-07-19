// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_rptr_groups.v
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

module fpu_rptr_groups (
	inq_in1,
	inq_in2,
	inq_id,
	inq_op,
	inq_rnd_mode,
	inq_in1_50_0_neq_0,
	inq_in1_53_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_50_0_neq_0,
	inq_in2_53_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	ctu_tst_macrotest,
	ctu_tst_pre_grst_l,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_short_chain,
	global_shift_enable,
	grst_l,
	cluster_cken,
	se,
	arst_l,
	fpu_grst_l,
	fmul_clken_l,
	fdiv_clken_l,
	scan_manual_6,
	si,
	so_unbuf,
	pcx_fpio_data_px2,
	pcx_fpio_data_rdy_px2,
	fp_cpx_req_cq,
	fp_cpx_data_ca,
	inq_sram_din_unbuf,

	inq_in1_add_buf1,
	inq_in1_mul_buf1,
	inq_in1_div_buf1,
	inq_in2_add_buf1,
	inq_in2_mul_buf1,
	inq_in2_div_buf1,
	inq_id_add_buf1,
	inq_id_mul_buf1,
	inq_id_div_buf1,
	inq_op_add_buf1,
	inq_op_div_buf1,
	inq_op_mul_buf1,
	inq_rnd_mode_add_buf1,
	inq_rnd_mode_div_buf1,
	inq_rnd_mode_mul_buf1,
	inq_in1_50_0_neq_0_add_buf1,
	inq_in1_50_0_neq_0_mul_buf1,
	inq_in1_50_0_neq_0_div_buf1,
	inq_in1_53_0_neq_0_add_buf1,
	inq_in1_53_0_neq_0_mul_buf1,
	inq_in1_53_0_neq_0_div_buf1,
	inq_in1_53_32_neq_0_add_buf1,
	inq_in1_53_32_neq_0_mul_buf1,
	inq_in1_53_32_neq_0_div_buf1,
	inq_in1_exp_eq_0_add_buf1,
	inq_in1_exp_eq_0_mul_buf1,
	inq_in1_exp_eq_0_div_buf1,
	inq_in1_exp_neq_ffs_add_buf1,
	inq_in1_exp_neq_ffs_mul_buf1,
	inq_in1_exp_neq_ffs_div_buf1,
	inq_in2_50_0_neq_0_add_buf1,
	inq_in2_50_0_neq_0_mul_buf1,
	inq_in2_50_0_neq_0_div_buf1,
	inq_in2_53_0_neq_0_add_buf1,
	inq_in2_53_0_neq_0_mul_buf1,
	inq_in2_53_0_neq_0_div_buf1,
	inq_in2_53_32_neq_0_add_buf1,
	inq_in2_53_32_neq_0_mul_buf1,
	inq_in2_53_32_neq_0_div_buf1,
	inq_in2_exp_eq_0_add_buf1,
	inq_in2_exp_eq_0_mul_buf1,
	inq_in2_exp_eq_0_div_buf1,
	inq_in2_exp_neq_ffs_add_buf1,
	inq_in2_exp_neq_ffs_mul_buf1,
	inq_in2_exp_neq_ffs_div_buf1,
	ctu_tst_macrotest_buf1,
	ctu_tst_pre_grst_l_buf1,
	ctu_tst_scan_disable_buf1,
	ctu_tst_scanmode_buf1,
	ctu_tst_short_chain_buf1,
	global_shift_enable_buf1,
	grst_l_buf1,
	cluster_cken_buf1,
	se_add_exp_buf2,
	se_add_frac_buf2,
	se_out_buf2,
	se_mul64_buf2,
	se_cluster_header_buf2,
	se_in_buf3,
	se_mul_buf4,
	se_div_buf5,
	arst_l_div_buf2,
	arst_l_mul_buf2,
	arst_l_cluster_header_buf2,
	arst_l_in_buf3,
	arst_l_out_buf3,
	arst_l_add_buf4,
	fpu_grst_l_mul_buf1,
	fpu_grst_l_in_buf2,
	fpu_grst_l_add_buf3,
	fmul_clken_l_buf1,
	fdiv_clken_l_div_exp_buf1,
	fdiv_clken_l_div_frac_buf1,
	scan_manual_6_buf1,
	si_buf1,
	so,
	pcx_fpio_data_px2_buf1,
	pcx_fpio_data_rdy_px2_buf1,
	fp_cpx_req_cq_buf1,
	fp_cpx_data_ca_buf1,
	inq_sram_din_buf1
);

	input [63:0] inq_in1;
	input [63:0] inq_in2;
	input [4:0] inq_id;
	input [7:0] inq_op;
	input [1:0] inq_rnd_mode;
	input inq_in1_50_0_neq_0;
	input inq_in1_53_0_neq_0;
	input inq_in1_53_32_neq_0;
	input inq_in1_exp_eq_0;
	input inq_in1_exp_neq_ffs;
	input inq_in2_50_0_neq_0;
	input inq_in2_53_0_neq_0;
	input inq_in2_53_32_neq_0;
	input inq_in2_exp_eq_0;
	input inq_in2_exp_neq_ffs;

	input ctu_tst_macrotest;
	input ctu_tst_pre_grst_l;
	input ctu_tst_scan_disable;
	input ctu_tst_scanmode;
	input ctu_tst_short_chain;
	input global_shift_enable;

	input grst_l;
	input cluster_cken;

	input se;

	input arst_l;

	input fpu_grst_l;

	input fmul_clken_l;
	input fdiv_clken_l;

	input scan_manual_6;

	input si;
	input so_unbuf;

	input [123:0] pcx_fpio_data_px2;
	input pcx_fpio_data_rdy_px2;

	input [7:0] fp_cpx_req_cq;
	input [144:0] fp_cpx_data_ca;

	input [155:0] inq_sram_din_unbuf;

	output [63:0] inq_in1_add_buf1;
	output [63:0] inq_in1_mul_buf1;
	output [63:0] inq_in1_div_buf1;
	output [63:0] inq_in2_add_buf1;
	output [63:0] inq_in2_mul_buf1;
	output [63:0] inq_in2_div_buf1;
	output [4:0] inq_id_add_buf1;
	output [4:0] inq_id_mul_buf1;
	output [4:0] inq_id_div_buf1;
	output [7:0] inq_op_add_buf1;
	output [7:0] inq_op_mul_buf1;
	output [7:0] inq_op_div_buf1;
	output [1:0] inq_rnd_mode_add_buf1;
	output [1:0] inq_rnd_mode_mul_buf1;
	output [1:0] inq_rnd_mode_div_buf1;
	output inq_in1_50_0_neq_0_add_buf1;
	output inq_in1_50_0_neq_0_mul_buf1;
	output inq_in1_50_0_neq_0_div_buf1;
	output inq_in1_53_0_neq_0_add_buf1;
	output inq_in1_53_0_neq_0_mul_buf1;
	output inq_in1_53_0_neq_0_div_buf1;
	output inq_in1_53_32_neq_0_add_buf1;
	output inq_in1_53_32_neq_0_mul_buf1;
	output inq_in1_53_32_neq_0_div_buf1;
	output inq_in1_exp_eq_0_add_buf1;
	output inq_in1_exp_eq_0_mul_buf1;
	output inq_in1_exp_eq_0_div_buf1;
	output inq_in1_exp_neq_ffs_add_buf1;
	output inq_in1_exp_neq_ffs_mul_buf1;
	output inq_in1_exp_neq_ffs_div_buf1;
	output inq_in2_50_0_neq_0_add_buf1;
	output inq_in2_50_0_neq_0_mul_buf1;
	output inq_in2_50_0_neq_0_div_buf1;
	output inq_in2_53_0_neq_0_add_buf1;
	output inq_in2_53_0_neq_0_mul_buf1;
	output inq_in2_53_0_neq_0_div_buf1;
	output inq_in2_53_32_neq_0_add_buf1;
	output inq_in2_53_32_neq_0_mul_buf1;
	output inq_in2_53_32_neq_0_div_buf1;
	output inq_in2_exp_eq_0_add_buf1;
	output inq_in2_exp_eq_0_mul_buf1;
	output inq_in2_exp_eq_0_div_buf1;
	output inq_in2_exp_neq_ffs_add_buf1;
	output inq_in2_exp_neq_ffs_mul_buf1;
	output inq_in2_exp_neq_ffs_div_buf1;

	output ctu_tst_macrotest_buf1;
	output ctu_tst_pre_grst_l_buf1;
	output ctu_tst_scan_disable_buf1;
	output ctu_tst_scanmode_buf1;
	output ctu_tst_short_chain_buf1;
	output global_shift_enable_buf1;

	output grst_l_buf1;
	output cluster_cken_buf1;

	output se_add_exp_buf2;
	output se_add_frac_buf2;
	output se_out_buf2;
	output se_mul64_buf2;
	output se_cluster_header_buf2;
	output se_in_buf3;
	output se_mul_buf4;
	output se_div_buf5;

	output arst_l_div_buf2;
	output arst_l_mul_buf2;
	output arst_l_cluster_header_buf2;
	output arst_l_in_buf3;
	output arst_l_out_buf3;
	output arst_l_add_buf4;

	output fpu_grst_l_mul_buf1;
	output fpu_grst_l_in_buf2;
	output fpu_grst_l_add_buf3;

	output fmul_clken_l_buf1;
	output fdiv_clken_l_div_exp_buf1;
	output fdiv_clken_l_div_frac_buf1;

	output scan_manual_6_buf1;

	output si_buf1;
	output so;

	output [123:0] pcx_fpio_data_px2_buf1;
	output pcx_fpio_data_rdy_px2_buf1;

	output [7:0] fp_cpx_req_cq_buf1;
	output [144:0] fp_cpx_data_ca_buf1;

	output [155:0] inq_sram_din_buf1;

	wire [3:0] inq_id_add_buf1_unused;
	wire [2:0] inq_id_mul_buf1_unused;
	wire [4:0] inq_id_div_buf1_unused;

	wire [1:0] ctu_tst_buf1_lo_unused;

	wire [1:0] cluster_cken_buf1_unused;

	wire [1:0] se_mul64_buf2_unused;

	wire [2:0] arst_l_buf1_unused;

	wire [1:0] fdiv_clken_l_buf1_unused;

	wire [2:0] so_cluster_header_buf1_unused;
	wire [2:0] si_buf1_unused;

	wire [2:0] pcx_fpio_data_px2_buf1_unused;
	wire [5:0] fp_cpx_buf1_9_unused;

    //Previously missing wires
    wire        se_add_buf1;
    wire        se_mul64_buf1;
    wire        so_buf1;
    wire        se_buf1_unused;
    wire        se_add_buf2_unused;
    wire        arst_l_buf1;

	// inq_in1
	fpu_bufrpt_grp32 i_inq_in1_add_buf1_hi (
		.in (inq_in1[63:32]),
		.out (inq_in1_add_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in1_add_buf1_lo (
		.in (inq_in1[31:0]),
		.out (inq_in1_add_buf1[31:0])
	);
	fpu_bufrpt_grp32 i_inq_in1_mul_buf1_hi (
		.in (inq_in1[63:32]),
		.out (inq_in1_mul_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in1_mul_buf1_lo (
		.in (inq_in1[31:0]),
		.out (inq_in1_mul_buf1[31:0])
	);
	fpu_bufrpt_grp64 i_inq_in1_div_buf1 (
		.in (inq_in1[63:0]),
		.out (inq_in1_div_buf1[63:0])
	);

	// inq_in2
	fpu_bufrpt_grp32 i_inq_in2_add_buf1_hi (
		.in (inq_in2[63:32]),
		.out (inq_in2_add_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in2_add_buf1_lo (
		.in (inq_in2[31:0]),
		.out (inq_in2_add_buf1[31:0])
	);
	fpu_bufrpt_grp32 i_inq_in2_mul_buf1_hi (
		.in (inq_in2[63:32]),
		.out (inq_in2_mul_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in2_mul_buf1_lo (
		.in (inq_in2[31:0]),
		.out (inq_in2_mul_buf1[31:0])
	);
	fpu_bufrpt_grp64 i_inq_in2_div_buf1 (
		.in (inq_in2[63:0]),
		.out (inq_in2_div_buf1[63:0])
	);

	// group inq_*eq_*
	fpu_bufrpt_grp32 i_inq_id_add_buf1 (
		.in ({4'h0,
			se_out_buf2,
			arst_l_out_buf3,
			fpu_grst_l_in_buf2,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_add_buf1_unused[3:0],
			se_in_buf3,
			arst_l_add_buf4,
			fpu_grst_l_add_buf3,
			inq_id_add_buf1[4:0],
			inq_op_add_buf1[7:0],
			inq_rnd_mode_add_buf1[1:0],
			inq_in1_50_0_neq_0_add_buf1,
			inq_in1_53_0_neq_0_add_buf1,
			inq_in1_53_32_neq_0_add_buf1,
			inq_in1_exp_eq_0_add_buf1,
			inq_in1_exp_neq_ffs_add_buf1,
			inq_in2_50_0_neq_0_add_buf1,
			inq_in2_53_0_neq_0_add_buf1,
			inq_in2_53_32_neq_0_add_buf1,
			inq_in2_exp_eq_0_add_buf1,
			inq_in2_exp_neq_ffs_add_buf1})
	);

	fpu_bufrpt_grp32 i_inq_id_mul_buf1 (
		.in ({3'h0,
			se_in_buf3,
			arst_l_mul_buf2,
			fpu_grst_l_mul_buf1,
			fmul_clken_l,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_mul_buf1_unused[2:0],
			se_mul_buf4,
			arst_l_out_buf3,
			fpu_grst_l_in_buf2,
			fmul_clken_l_buf1,
			inq_id_mul_buf1[4:0],
			inq_op_mul_buf1[7:0],
			inq_rnd_mode_mul_buf1[1:0],
			inq_in1_50_0_neq_0_mul_buf1,
			inq_in1_53_0_neq_0_mul_buf1,
			inq_in1_53_32_neq_0_mul_buf1,
			inq_in1_exp_eq_0_mul_buf1,
			inq_in1_exp_neq_ffs_mul_buf1,
			inq_in2_50_0_neq_0_mul_buf1,
			inq_in2_53_0_neq_0_mul_buf1,
			inq_in2_53_32_neq_0_mul_buf1,
			inq_in2_exp_eq_0_mul_buf1,
			inq_in2_exp_neq_ffs_mul_buf1})
	);

	fpu_bufrpt_grp32 i_inq_id_div_buf1 (
		.in ({5'h00,
			se_mul_buf4,
			arst_l_mul_buf2,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_div_buf1_unused[4:0],
			se_div_buf5,
			arst_l_in_buf3,
			inq_id_div_buf1[4:0],
			inq_op_div_buf1[7:0],
			inq_rnd_mode_div_buf1[1:0],
			inq_in1_50_0_neq_0_div_buf1,
			inq_in1_53_0_neq_0_div_buf1,
			inq_in1_53_32_neq_0_div_buf1,
			inq_in1_exp_eq_0_div_buf1,
			inq_in1_exp_neq_ffs_div_buf1,
			inq_in2_50_0_neq_0_div_buf1,
			inq_in2_53_0_neq_0_div_buf1,
			inq_in2_53_32_neq_0_div_buf1,
			inq_in2_exp_eq_0_div_buf1,
			inq_in2_exp_neq_ffs_div_buf1})
	);

	// buffer ctu_tst signals
	fpu_bufrpt_grp4 i_ctu_tst_buf1_hi (
		.in ({ctu_tst_short_chain,
			ctu_tst_macrotest,
			ctu_tst_scan_disable,
			ctu_tst_pre_grst_l}),
		.out ({ctu_tst_short_chain_buf1,
			ctu_tst_macrotest_buf1,
			ctu_tst_scan_disable_buf1,
			ctu_tst_pre_grst_l_buf1})
	);

	fpu_bufrpt_grp4 i_ctu_tst_buf1_lo (
		.in ({ctu_tst_scanmode,
			global_shift_enable,
			2'b00}),
		.out ({ctu_tst_scanmode_buf1,
			global_shift_enable_buf1,
			ctu_tst_buf1_lo_unused[1:0]})
	);

	// buffer cluster_header inputs
	fpu_bufrpt_grp4 i_cluster_cken_buf1 (
		.in ({cluster_cken,
			grst_l,
			2'b00}),
		.out ({cluster_cken_buf1,
			grst_l_buf1,
			cluster_cken_buf1_unused[1:0]})
	);

	// buffers for se (scan enable driven from test_stub_scan)
	fpu_bufrpt_grp4 i_se_buf1 (
		.in ({se,
			se,
			so_unbuf,
			1'b0}),
		.out ({se_add_buf1,
			se_mul64_buf1,
			so_buf1,
			se_buf1_unused})
	);

	fpu_bufrpt_grp4 i_se_add_buf2 (
		.in ({se_add_buf1,
			se_add_buf1,
			se_add_buf1,
			1'b0}),
		.out ({se_add_exp_buf2,
			se_add_frac_buf2,
			se_out_buf2,
			se_add_buf2_unused})
	);

	fpu_bufrpt_grp4 i_se_mul64_buf2 (
		.in ({se_mul64_buf1,
			se_mul64_buf1,
			2'b00}),
		.out ({se_mul64_buf2,
			se_cluster_header_buf2,
			se_mul64_buf2_unused[1:0]})
	);

	// buffers for arst_l, also use to buffer fpu_grst_l
	fpu_bufrpt_grp4 i_arst_l_buf1 (
		.in ({arst_l,
			3'b000}),
		.out ({arst_l_buf1,
			arst_l_buf1_unused[2:0]})
	);

	fpu_bufrpt_grp4 i_arst_l_buf2 (
		.in ({arst_l_buf1,
			arst_l_buf1,
			arst_l_buf1,
			fpu_grst_l}),
		.out ({arst_l_mul_buf2,
			arst_l_cluster_header_buf2,
			arst_l_div_buf2,
			fpu_grst_l_mul_buf1})
	);

	// buffers for fdiv_clken_l
	fpu_bufrpt_grp4 i_fdiv_clken_l_buf1 (
		.in ({fdiv_clken_l,
			fdiv_clken_l,
			2'b00}),
		.out ({fdiv_clken_l_div_exp_buf1,
			fdiv_clken_l_div_frac_buf1,
			fdiv_clken_l_buf1_unused[1:0]})
	);

	// buffer scan_out from cluster_header (internal driver 2X) to test_stub (long_chain_so_0)
	fpu_bufrpt_grp4 i_so_cluster_header_buf1 (
		.in ({scan_manual_6,
			3'b000}),
		.out ({scan_manual_6_buf1,
			so_cluster_header_buf1_unused[2:0]})
	);

	// buffer si at FPU cluster right edge
	fpu_bufrpt_grp4 i_si_buf1 (
		.in ({si,
			3'b000}),
		.out ({si_buf1,
			si_buf1_unused[2:0]})
	);

	// pcx_fpio* signals buffered for mintiming
	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_0 (
		.in ({pcx_fpio_data_px2[108],
			pcx_fpio_data_px2[109],
			pcx_fpio_data_px2[110],
			pcx_fpio_data_px2[111],
			pcx_fpio_data_px2[112],
			pcx_fpio_data_px2[113],
			pcx_fpio_data_px2[114],
			pcx_fpio_data_px2[115],
			pcx_fpio_data_px2[116],
			pcx_fpio_data_px2[117],
			pcx_fpio_data_px2[118],
			pcx_fpio_data_px2[119],
			pcx_fpio_data_px2[120],
			pcx_fpio_data_px2[121],
			pcx_fpio_data_px2[122],
			pcx_fpio_data_px2[123]}),
		.out ({pcx_fpio_data_px2_buf1[108],
			pcx_fpio_data_px2_buf1[109],
			pcx_fpio_data_px2_buf1[110],
			pcx_fpio_data_px2_buf1[111],
			pcx_fpio_data_px2_buf1[112],
			pcx_fpio_data_px2_buf1[113],
			pcx_fpio_data_px2_buf1[114],
			pcx_fpio_data_px2_buf1[115],
			pcx_fpio_data_px2_buf1[116],
			pcx_fpio_data_px2_buf1[117],
			pcx_fpio_data_px2_buf1[118],
			pcx_fpio_data_px2_buf1[119],
			pcx_fpio_data_px2_buf1[120],
			pcx_fpio_data_px2_buf1[121],
			pcx_fpio_data_px2_buf1[122],
			pcx_fpio_data_px2_buf1[123]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_1 (
		.in ({pcx_fpio_data_px2[92],
			pcx_fpio_data_px2[93],
			pcx_fpio_data_px2[94],
			pcx_fpio_data_px2[95],
			pcx_fpio_data_px2[96],
			pcx_fpio_data_px2[97],
			pcx_fpio_data_px2[98],
			pcx_fpio_data_px2[99],
			pcx_fpio_data_px2[100],
			pcx_fpio_data_px2[101],
			pcx_fpio_data_px2[102],
			pcx_fpio_data_px2[103],
			pcx_fpio_data_px2[104],
			pcx_fpio_data_px2[105],
			pcx_fpio_data_px2[106],
			pcx_fpio_data_px2[107]}),
		.out ({pcx_fpio_data_px2_buf1[92],
			pcx_fpio_data_px2_buf1[93],
			pcx_fpio_data_px2_buf1[94],
			pcx_fpio_data_px2_buf1[95],
			pcx_fpio_data_px2_buf1[96],
			pcx_fpio_data_px2_buf1[97],
			pcx_fpio_data_px2_buf1[98],
			pcx_fpio_data_px2_buf1[99],
			pcx_fpio_data_px2_buf1[100],
			pcx_fpio_data_px2_buf1[101],
			pcx_fpio_data_px2_buf1[102],
			pcx_fpio_data_px2_buf1[103],
			pcx_fpio_data_px2_buf1[104],
			pcx_fpio_data_px2_buf1[105],
			pcx_fpio_data_px2_buf1[106],
			pcx_fpio_data_px2_buf1[107]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_2 (
		.in ({pcx_fpio_data_px2[76],
			pcx_fpio_data_px2[77],
			pcx_fpio_data_px2[78],
			pcx_fpio_data_px2[79],
			pcx_fpio_data_px2[80],
			pcx_fpio_data_px2[81],
			pcx_fpio_data_px2[82],
			pcx_fpio_data_px2[83],
			pcx_fpio_data_px2[84],
			pcx_fpio_data_px2[85],
			pcx_fpio_data_px2[86],
			pcx_fpio_data_px2[87],
			pcx_fpio_data_px2[88],
			pcx_fpio_data_px2[89],
			pcx_fpio_data_px2[90],
			pcx_fpio_data_px2[91]}),
		.out ({pcx_fpio_data_px2_buf1[76],
			pcx_fpio_data_px2_buf1[77],
			pcx_fpio_data_px2_buf1[78],
			pcx_fpio_data_px2_buf1[79],
			pcx_fpio_data_px2_buf1[80],
			pcx_fpio_data_px2_buf1[81],
			pcx_fpio_data_px2_buf1[82],
			pcx_fpio_data_px2_buf1[83],
			pcx_fpio_data_px2_buf1[84],
			pcx_fpio_data_px2_buf1[85],
			pcx_fpio_data_px2_buf1[86],
			pcx_fpio_data_px2_buf1[87],
			pcx_fpio_data_px2_buf1[88],
			pcx_fpio_data_px2_buf1[89],
			pcx_fpio_data_px2_buf1[90],
			pcx_fpio_data_px2_buf1[91]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_3 (
		.in ({pcx_fpio_data_px2[3:0],
			pcx_fpio_data_px2[64],
			pcx_fpio_data_px2[65],
			pcx_fpio_data_px2[66],
			pcx_fpio_data_px2[67],
			pcx_fpio_data_px2[68],
			pcx_fpio_data_px2[69],
			pcx_fpio_data_px2[70],
			pcx_fpio_data_px2[71],
			pcx_fpio_data_px2[72],
			pcx_fpio_data_px2[73],
			pcx_fpio_data_px2[74],
			pcx_fpio_data_px2[75]}),
		.out ({pcx_fpio_data_px2_buf1[3:0],
			pcx_fpio_data_px2_buf1[64],
			pcx_fpio_data_px2_buf1[65],
			pcx_fpio_data_px2_buf1[66],
			pcx_fpio_data_px2_buf1[67],
			pcx_fpio_data_px2_buf1[68],
			pcx_fpio_data_px2_buf1[69],
			pcx_fpio_data_px2_buf1[70],
			pcx_fpio_data_px2_buf1[71],
			pcx_fpio_data_px2_buf1[72],
			pcx_fpio_data_px2_buf1[73],
			pcx_fpio_data_px2_buf1[74],
			pcx_fpio_data_px2_buf1[75]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_4 (
		.in (pcx_fpio_data_px2[19:4]),
		.out (pcx_fpio_data_px2_buf1[19:4])
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_5 (
		.in (pcx_fpio_data_px2[35:20]),
		.out (pcx_fpio_data_px2_buf1[35:20])
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_6 (
		.in ({pcx_fpio_data_rdy_px2,
			pcx_fpio_data_px2[50:36]}),
		.out ({pcx_fpio_data_rdy_px2_buf1,
			pcx_fpio_data_px2_buf1[50:36]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_7 (
		.in ({3'b000,
			pcx_fpio_data_px2[63:51]}),
		.out ({pcx_fpio_data_px2_buf1_unused[2:0],
			pcx_fpio_data_px2_buf1[63:51]})
	);

	// buffer fp_cpx_* signals for mintiming
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_0 (
		.in ({
			fp_cpx_data_ca[142],
			fp_cpx_data_ca[140],
			fp_cpx_data_ca[138],
			fp_cpx_data_ca[136],
			fp_cpx_data_ca[134],
			fp_cpx_data_ca[132],
			fp_cpx_data_ca[130],
			fp_cpx_data_ca[128],
			fp_cpx_req_cq[6],
			fp_cpx_req_cq[7],
			fp_cpx_req_cq[3],
			fp_cpx_req_cq[2],
			fp_cpx_req_cq[5],
			fp_cpx_req_cq[1],
			fp_cpx_req_cq[0],
			fp_cpx_req_cq[4]}),
		.out ({
			fp_cpx_data_ca_buf1[142],
			fp_cpx_data_ca_buf1[140],
			fp_cpx_data_ca_buf1[138],
			fp_cpx_data_ca_buf1[136],
			fp_cpx_data_ca_buf1[134],
			fp_cpx_data_ca_buf1[132],
			fp_cpx_data_ca_buf1[130],
			fp_cpx_data_ca_buf1[128],
			fp_cpx_req_cq_buf1[6],
			fp_cpx_req_cq_buf1[7],
			fp_cpx_req_cq_buf1[3],
			fp_cpx_req_cq_buf1[2],
			fp_cpx_req_cq_buf1[5],
			fp_cpx_req_cq_buf1[1],
			fp_cpx_req_cq_buf1[0],
			fp_cpx_req_cq_buf1[4]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_1 (
		.in ({
			fp_cpx_data_ca[34],
			fp_cpx_data_ca[36],
			fp_cpx_data_ca[38],
			fp_cpx_data_ca[40],
			fp_cpx_data_ca[42],
			fp_cpx_data_ca[44],
			fp_cpx_data_ca[46],
			fp_cpx_data_ca[48],
			fp_cpx_data_ca[50],
			fp_cpx_data_ca[52],
			fp_cpx_data_ca[54],
			fp_cpx_data_ca[56],
			fp_cpx_data_ca[58],
			fp_cpx_data_ca[60],
			fp_cpx_data_ca[62],
			fp_cpx_data_ca[144]}),
		.out ({
			fp_cpx_data_ca_buf1[34],
			fp_cpx_data_ca_buf1[36],
			fp_cpx_data_ca_buf1[38],
			fp_cpx_data_ca_buf1[40],
			fp_cpx_data_ca_buf1[42],
			fp_cpx_data_ca_buf1[44],
			fp_cpx_data_ca_buf1[46],
			fp_cpx_data_ca_buf1[48],
			fp_cpx_data_ca_buf1[50],
			fp_cpx_data_ca_buf1[52],
			fp_cpx_data_ca_buf1[54],
			fp_cpx_data_ca_buf1[56],
			fp_cpx_data_ca_buf1[58],
			fp_cpx_data_ca_buf1[60],
			fp_cpx_data_ca_buf1[62],
			fp_cpx_data_ca_buf1[144]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_2 (
		.in ({
			fp_cpx_data_ca[2],
			fp_cpx_data_ca[4],
			fp_cpx_data_ca[6],
			fp_cpx_data_ca[8],
			fp_cpx_data_ca[10],
			fp_cpx_data_ca[12],
			fp_cpx_data_ca[14],
			fp_cpx_data_ca[16],
			fp_cpx_data_ca[18],
			fp_cpx_data_ca[20],
			fp_cpx_data_ca[22],
			fp_cpx_data_ca[24],
			fp_cpx_data_ca[26],
			fp_cpx_data_ca[28],
			fp_cpx_data_ca[30],
			fp_cpx_data_ca[32]}),
		.out ({
			fp_cpx_data_ca_buf1[2],
			fp_cpx_data_ca_buf1[4],
			fp_cpx_data_ca_buf1[6],
			fp_cpx_data_ca_buf1[8],
			fp_cpx_data_ca_buf1[10],
			fp_cpx_data_ca_buf1[12],
			fp_cpx_data_ca_buf1[14],
			fp_cpx_data_ca_buf1[16],
			fp_cpx_data_ca_buf1[18],
			fp_cpx_data_ca_buf1[20],
			fp_cpx_data_ca_buf1[22],
			fp_cpx_data_ca_buf1[24],
			fp_cpx_data_ca_buf1[26],
			fp_cpx_data_ca_buf1[28],
			fp_cpx_data_ca_buf1[30],
			fp_cpx_data_ca_buf1[32]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_3 (
		.in ({
			fp_cpx_data_ca[31],
			fp_cpx_data_ca[27],
			fp_cpx_data_ca[23],
			fp_cpx_data_ca[25],
			fp_cpx_data_ca[21],
			fp_cpx_data_ca[17],
			fp_cpx_data_ca[19],
			fp_cpx_data_ca[15],
			fp_cpx_data_ca[11],
			fp_cpx_data_ca[13],
			fp_cpx_data_ca[9],
			fp_cpx_data_ca[5],
			fp_cpx_data_ca[7],
			fp_cpx_data_ca[3],
			fp_cpx_data_ca[0],
			fp_cpx_data_ca[1]}),
		.out ({
			fp_cpx_data_ca_buf1[31],
			fp_cpx_data_ca_buf1[27],
			fp_cpx_data_ca_buf1[23],
			fp_cpx_data_ca_buf1[25],
			fp_cpx_data_ca_buf1[21],
			fp_cpx_data_ca_buf1[17],
			fp_cpx_data_ca_buf1[19],
			fp_cpx_data_ca_buf1[15],
			fp_cpx_data_ca_buf1[11],
			fp_cpx_data_ca_buf1[13],
			fp_cpx_data_ca_buf1[9],
			fp_cpx_data_ca_buf1[5],
			fp_cpx_data_ca_buf1[7],
			fp_cpx_data_ca_buf1[3],
			fp_cpx_data_ca_buf1[0],
			fp_cpx_data_ca_buf1[1]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_4 (
		.in ({
			fp_cpx_data_ca[59],
			fp_cpx_data_ca[61],
			fp_cpx_data_ca[57],
			fp_cpx_data_ca[53],
			fp_cpx_data_ca[55],
			fp_cpx_data_ca[51],
			fp_cpx_data_ca[47],
			fp_cpx_data_ca[49],
			fp_cpx_data_ca[45],
			fp_cpx_data_ca[41],
			fp_cpx_data_ca[43],
			fp_cpx_data_ca[39],
			fp_cpx_data_ca[35],
			fp_cpx_data_ca[37],
			fp_cpx_data_ca[33],
			fp_cpx_data_ca[29]}),
		.out ({
			fp_cpx_data_ca_buf1[59],
			fp_cpx_data_ca_buf1[61],
			fp_cpx_data_ca_buf1[57],
			fp_cpx_data_ca_buf1[53],
			fp_cpx_data_ca_buf1[55],
			fp_cpx_data_ca_buf1[51],
			fp_cpx_data_ca_buf1[47],
			fp_cpx_data_ca_buf1[49],
			fp_cpx_data_ca_buf1[45],
			fp_cpx_data_ca_buf1[41],
			fp_cpx_data_ca_buf1[43],
			fp_cpx_data_ca_buf1[39],
			fp_cpx_data_ca_buf1[35],
			fp_cpx_data_ca_buf1[37],
			fp_cpx_data_ca_buf1[33],
			fp_cpx_data_ca_buf1[29]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_5 (
		.in ({
			fp_cpx_data_ca[113],
			fp_cpx_data_ca[117],
			fp_cpx_data_ca[121],
			fp_cpx_data_ca[119],
			fp_cpx_data_ca[123],
			fp_cpx_data_ca[127],
			fp_cpx_data_ca[125],
			fp_cpx_data_ca[129],
			fp_cpx_data_ca[133],
			fp_cpx_data_ca[131],
			fp_cpx_data_ca[135],
			fp_cpx_data_ca[139],
			fp_cpx_data_ca[137],
			fp_cpx_data_ca[141],
			fp_cpx_data_ca[143],
			fp_cpx_data_ca[63]}),
		.out ({
			fp_cpx_data_ca_buf1[113],
			fp_cpx_data_ca_buf1[117],
			fp_cpx_data_ca_buf1[121],
			fp_cpx_data_ca_buf1[119],
			fp_cpx_data_ca_buf1[123],
			fp_cpx_data_ca_buf1[127],
			fp_cpx_data_ca_buf1[125],
			fp_cpx_data_ca_buf1[129],
			fp_cpx_data_ca_buf1[133],
			fp_cpx_data_ca_buf1[131],
			fp_cpx_data_ca_buf1[135],
			fp_cpx_data_ca_buf1[139],
			fp_cpx_data_ca_buf1[137],
			fp_cpx_data_ca_buf1[141],
			fp_cpx_data_ca_buf1[143],
			fp_cpx_data_ca_buf1[63]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_6 (
		.in ({
			fp_cpx_data_ca[85],
			fp_cpx_data_ca[83],
			fp_cpx_data_ca[87],
			fp_cpx_data_ca[91],
			fp_cpx_data_ca[89],
			fp_cpx_data_ca[93],
			fp_cpx_data_ca[97],
			fp_cpx_data_ca[95],
			fp_cpx_data_ca[99],
			fp_cpx_data_ca[103],
			fp_cpx_data_ca[101],
			fp_cpx_data_ca[105],
			fp_cpx_data_ca[109],
			fp_cpx_data_ca[107],
			fp_cpx_data_ca[111],
			fp_cpx_data_ca[115]}),
		.out ({
			fp_cpx_data_ca_buf1[85],
			fp_cpx_data_ca_buf1[83],
			fp_cpx_data_ca_buf1[87],
			fp_cpx_data_ca_buf1[91],
			fp_cpx_data_ca_buf1[89],
			fp_cpx_data_ca_buf1[93],
			fp_cpx_data_ca_buf1[97],
			fp_cpx_data_ca_buf1[95],
			fp_cpx_data_ca_buf1[99],
			fp_cpx_data_ca_buf1[103],
			fp_cpx_data_ca_buf1[101],
			fp_cpx_data_ca_buf1[105],
			fp_cpx_data_ca_buf1[109],
			fp_cpx_data_ca_buf1[107],
			fp_cpx_data_ca_buf1[111],
			fp_cpx_data_ca_buf1[115]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_7 (
		.in ({
			fp_cpx_data_ca[114],
			fp_cpx_data_ca[116],
			fp_cpx_data_ca[118],
			fp_cpx_data_ca[120],
			fp_cpx_data_ca[122],
			fp_cpx_data_ca[124],
			fp_cpx_data_ca[126],
			fp_cpx_data_ca[65],
			fp_cpx_data_ca[67],
			fp_cpx_data_ca[69],
			fp_cpx_data_ca[73],
			fp_cpx_data_ca[71],
			fp_cpx_data_ca[75],
			fp_cpx_data_ca[79],
			fp_cpx_data_ca[77],
			fp_cpx_data_ca[81]}),
		.out ({
			fp_cpx_data_ca_buf1[114],
			fp_cpx_data_ca_buf1[116],
			fp_cpx_data_ca_buf1[118],
			fp_cpx_data_ca_buf1[120],
			fp_cpx_data_ca_buf1[122],
			fp_cpx_data_ca_buf1[124],
			fp_cpx_data_ca_buf1[126],
			fp_cpx_data_ca_buf1[65],
			fp_cpx_data_ca_buf1[67],
			fp_cpx_data_ca_buf1[69],
			fp_cpx_data_ca_buf1[73],
			fp_cpx_data_ca_buf1[71],
			fp_cpx_data_ca_buf1[75],
			fp_cpx_data_ca_buf1[79],
			fp_cpx_data_ca_buf1[77],
			fp_cpx_data_ca_buf1[81]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_8 (
		.in ({
			fp_cpx_data_ca[82],
			fp_cpx_data_ca[84],
			fp_cpx_data_ca[86],
			fp_cpx_data_ca[88],
			fp_cpx_data_ca[90],
			fp_cpx_data_ca[92],
			fp_cpx_data_ca[94],
			fp_cpx_data_ca[96],
			fp_cpx_data_ca[98],
			fp_cpx_data_ca[100],
			fp_cpx_data_ca[102],
			fp_cpx_data_ca[104],
			fp_cpx_data_ca[106],
			fp_cpx_data_ca[108],
			fp_cpx_data_ca[110],
			fp_cpx_data_ca[112]}),
		.out ({
			fp_cpx_data_ca_buf1[82],
			fp_cpx_data_ca_buf1[84],
			fp_cpx_data_ca_buf1[86],
			fp_cpx_data_ca_buf1[88],
			fp_cpx_data_ca_buf1[90],
			fp_cpx_data_ca_buf1[92],
			fp_cpx_data_ca_buf1[94],
			fp_cpx_data_ca_buf1[96],
			fp_cpx_data_ca_buf1[98],
			fp_cpx_data_ca_buf1[100],
			fp_cpx_data_ca_buf1[102],
			fp_cpx_data_ca_buf1[104],
			fp_cpx_data_ca_buf1[106],
			fp_cpx_data_ca_buf1[108],
			fp_cpx_data_ca_buf1[110],
			fp_cpx_data_ca_buf1[112]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_9 (
		.in ({
			6'b000000,
			so_buf1,
			fp_cpx_data_ca[64],
			fp_cpx_data_ca[66],
			fp_cpx_data_ca[68],
			fp_cpx_data_ca[70],
			fp_cpx_data_ca[72],
			fp_cpx_data_ca[74],
			fp_cpx_data_ca[76],
			fp_cpx_data_ca[78],
			fp_cpx_data_ca[80]}),
		.out ({
			fp_cpx_buf1_9_unused[5:0],
			so,
			fp_cpx_data_ca_buf1[64],
			fp_cpx_data_ca_buf1[66],
			fp_cpx_data_ca_buf1[68],
			fp_cpx_data_ca_buf1[70],
			fp_cpx_data_ca_buf1[72],
			fp_cpx_data_ca_buf1[74],
			fp_cpx_data_ca_buf1[76],
			fp_cpx_data_ca_buf1[78],
			fp_cpx_data_ca_buf1[80]})
	);

	// buffer fpu_in_dp outputs  (sram din inputs) for mintiming

	fpu_rptr_inq i_inq_sram_din_buf1 (
		.in (inq_sram_din_unbuf[155:0]),
		.out (inq_sram_din_buf1[155:0])
	);

endmodule

