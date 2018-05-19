// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_out_ctl.v
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
///////////////////////////////////////////////////////////////////////////////
//
//	FPU output control logic.
//
///////////////////////////////////////////////////////////////////////////////
 

module fpu_out_ctl (
	d8stg_fdiv_in,
	m6stg_fmul_in,
	a6stg_fadd_in,
	div_id_out_in,
	m6stg_id_in,
	add_id_out_in,
	arst_l,
	grst_l,
	rclk,
	
	fp_cpx_req_cq,
	req_thread,
	dest_rdy,
	add_dest_rdy,
	mul_dest_rdy,
	div_dest_rdy,

	se,
	si,
	so
);


input		d8stg_fdiv_in;		// div pipe output request next cycle
input		m6stg_fmul_in;		// mul pipe output request next cycle
input		a6stg_fadd_in;		// add pipe output request next cycle
input [9:0]	div_id_out_in;		// div pipe output ID next cycle
input [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
input [9:0]	add_id_out_in;		// add pipe output ID next cycle
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;		// global clock

output [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
output [1:0]	req_thread;		// thread ID of result req this cycle
output [2:0]	dest_rdy;		// pipe with result request this cycle
output		add_dest_rdy;		// add pipe result request this cycle
output		mul_dest_rdy;		// mul pipe result request this cycle
output		div_dest_rdy;		// div pipe result request this cycle

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		add_req_in;
wire		add_req_step;
wire		add_req;
wire		div_req_sel;
wire		mul_req_sel;
wire		add_req_sel;
wire [9:0]	out_id;
wire [7:0]	fp_cpx_req_cq;
wire [1:0]	req_thread;
wire [2:0]	dest_rdy_in;
wire [2:0]	dest_rdy;
wire		add_dest_rdy;
wire		mul_dest_rdy;
wire		div_dest_rdy;

//Previously missing wires
wire        out_ctl_rst_l;

dffrl_async #(1)  dffrl_out_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (out_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!out_ctl_rst_l);


///////////////////////////////////////////////////////////////////////////////
//
//	Arbitrate for the output.
//
//	Top priority- divide.
//	Low priority- round robin arbitration between the add and multiply
//		pipes.
//
///////////////////////////////////////////////////////////////////////////////

assign add_req_in= (!add_req);

assign add_req_step= add_req_sel || mul_req_sel;

dffre_s #(1) i_add_req (
	.din	(add_req_in),
	.en	(add_req_step),
	.rst    (reset),
        .clk    (rclk),

        .q      (add_req),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_req_sel= d8stg_fdiv_in;

assign mul_req_sel= m6stg_fmul_in
		&& ((!add_req) || (!a6stg_fadd_in))
		&& (!div_req_sel);

assign add_req_sel= a6stg_fadd_in
		&& (add_req || (!m6stg_fmul_in))
		&& (!div_req_sel);


///////////////////////////////////////////////////////////////////////////////
//
//	Generate the request.
//
//	Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign out_id[9:0]= ({10{div_req_sel}}
			    & div_id_out_in[9:0])
		| ({10{mul_req_sel}}
			    & m6stg_id_in[9:0])
		| ({10{add_req_sel}}
			    & add_id_out_in[9:0]);

dff_s #(8) i_fp_cpx_req_cq (
	.din	(out_id[9:2]),
	.clk    (rclk),

        .q      (fp_cpx_req_cq[7:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Capture the thread.
//
//      Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(2) i_req_thread (
	.din	(out_id[1:0]),
	.clk    (rclk),
 
        .q      (req_thread[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Capture the pipe that wins the output request.
//
//      Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign dest_rdy_in[2:0]= {div_req_sel, mul_req_sel, add_req_sel};

dff_s #(3) i_dest_rdy (
	.din	(dest_rdy_in[2:0]),
	.clk    (rclk),

        .q      (dest_rdy[2:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s i_add_dest_rdy (
	.din	(add_req_sel),
	.clk	(rclk),

	.q	(add_dest_rdy),

	.se	(se),
        .si	(),
        .so	()
);

dff_s i_mul_dest_rdy (
	.din	(mul_req_sel),
	.clk	(rclk),

	.q	(mul_dest_rdy),

	.se	(se),
        .si	(),
        .so	()
);

dff_s i_div_dest_rdy (
	.din	(div_req_sel),
	.clk	(rclk),

	.q	(div_dest_rdy),

        .se	(se),
        .si	(),
        .so	()
);


endmodule


