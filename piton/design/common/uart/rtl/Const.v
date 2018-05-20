//==============================================================================
//	File:		$URL: svn+ssh://repositorypub@repository.eecs.berkeley.edu/public/Projects/GateLib/trunk/Core/GateCore/Hardware/Const.v $
//	Version:	$Revision: 27051 $
//	Author:		Greg Gibeling (http://www.gdgib.com/)
//	Copyright:	Copyright 2003-2010 UC Berkeley
//==============================================================================

//==============================================================================
//	Section:	License
//==============================================================================
//	Copyright (c) 2005-2010, Regents of the University of California
//	All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without modification,
//	are permitted provided that the following conditions are met:
//
//		- Redistributions of source code must retain the above copyright notice,
//			this list of conditions and the following disclaimer.
//		- Redistributions in binary form must reproduce the above copyright
//			notice, this list of conditions and the following disclaimer
//			in the documentation and/or other materials provided with the
//			distribution.
//		- Neither the name of the University of California, Berkeley nor the
//			names of its contributors may be used to endorse or promote
//			products derived from this software without specific prior
//			written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//	ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//	ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//==============================================================================

//------------------------------------------------------------------------------
//	Section:	Simulation Flag
//	Desc:		This little nebulous block will define the flags:
//				-SIMULATION	Simulating
//				-MODELSIM	Simulating using ModelSim
//				-XST		Synthesizing with XST
//				-SYNPLIFY	Synthesizing with Synplify
//				-SYNTHESIS	Synthesizing
//				-MACROSAFE	Safe to use macros (Synplify or ModelSim)
//
//	YOU SHOULD DEFINE THE "MODELSIM" FLAG FOR SIMULATION!!!!
//------------------------------------------------------------------------------
`ifdef synthesis                // if Synplify
	`define SYNPLIFY
	`define SYNTHESIS
	`define MACROSAFE
`else                           // if not Synplify
	`ifdef MODELSIM
		`define SIMULATION
		`define MACROSAFE
	`else
		`define XST
		// synthesis translate_off    // if XST then stop compiling
			`undef XST
			`define SIMULATION
			`define MODELSIM
		// synthesis translate_on     // if XST then resume compiling
		`ifdef XST
			`define SYNTHESIS
			`define MACROSAFE
		`endif
	`endif
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Log2 Macro
//	Desc:		A macro to take the log base 2 of any number.  Useful for
//				calculating bitwidths.  Warning, this actually calculates
//				log2Ceiling(x).
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define log2(x)			((((x) > 1) ? 1 : 0) + \
						(((x) > 2) ? 1 : 0) + \
						(((x) > 4) ? 1 : 0) + \
						(((x) > 8) ? 1 : 0) + \
						(((x) > 16) ? 1 : 0) + \
						(((x) > 32) ? 1 : 0) + \
						(((x) > 64) ? 1 : 0) + \
						(((x) > 128) ? 1 : 0) + \
						(((x) > 256) ? 1 : 0) + \
						(((x) > 512) ? 1 : 0) + \
						(((x) > 1024) ? 1 : 0) + \
						(((x) > 2048) ? 1 : 0) + \
						(((x) > 4096) ? 1 : 0) + \
						(((x) > 8192) ? 1 : 0) + \
						(((x) > 16384) ? 1 : 0) + \
						(((x) > 32768) ? 1 : 0) + \
						(((x) > 65536) ? 1 : 0) + \
						(((x) > 131072) ? 1 : 0) + \
						(((x) > 262144) ? 1 : 0) + \
						(((x) > 524288) ? 1 : 0) + \
						(((x) > 1048576) ? 1 : 0) + \
						(((x) > 2097152) ? 1 : 0) + \
						(((x) > 4194304) ? 1 : 0) + \
						(((x) > 8388608) ? 1 : 0) + \
						(((x) > 16777216) ? 1 : 0) + \
						(((x) > 33554432) ? 1 : 0) + \
						(((x) > 67108864) ? 1 : 0) + \
						(((x) > 134217728) ? 1 : 0) + \
						(((x) > 268435456) ? 1 : 0) + \
						(((x) > 536870912) ? 1 : 0) + \
						(((x) > 1073741824) ? 1 : 0))
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Log2 Floor Macro
//	Desc:		A macro to take the floor of the log base 2 of any number.
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define log2f(x)		((((x) >= 2) ? 1 : 0) + \
						(((x) >= 4) ? 1 : 0) + \
						(((x) >= 8) ? 1 : 0) + \
						(((x) >= 16) ? 1 : 0) + \
						(((x) >= 32) ? 1 : 0) + \
						(((x) >= 64) ? 1 : 0) + \
						(((x) >= 128) ? 1 : 0) + \
						(((x) >= 256) ? 1 : 0) + \
						(((x) >= 512) ? 1 : 0) + \
						(((x) >= 1024) ? 1 : 0) + \
						(((x) >= 2048) ? 1 : 0) + \
						(((x) >= 4096) ? 1 : 0) + \
						(((x) >= 8192) ? 1 : 0) + \
						(((x) >= 16384) ? 1 : 0) + \
						(((x) >= 32768) ? 1 : 0) + \
						(((x) >= 65536) ? 1 : 0) + \
						(((x) >= 131072) ? 1 : 0) + \
						(((x) >= 262144) ? 1 : 0) + \
						(((x) >= 524288) ? 1 : 0) + \
						(((x) >= 1048576) ? 1 : 0) + \
						(((x) >= 2097152) ? 1 : 0) + \
						(((x) >= 4194304) ? 1 : 0) + \
						(((x) >= 8388608) ? 1 : 0) + \
						(((x) >= 16777216) ? 1 : 0) + \
						(((x) >= 33554432) ? 1 : 0) + \
						(((x) >= 67108864) ? 1 : 0) + \
						(((x) >= 134217728) ? 1 : 0) + \
						(((x) >= 268435456) ? 1 : 0) + \
						(((x) >= 536870912) ? 1 : 0) + \
						(((x) >= 1073741824) ? 1 : 0))
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Pow2 Macro
//	Desc:		A macro to take the 2 to the power of any number.  Useful for
//				calculating bitwidths.
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define pow2(x)			((((x) >= 1) ? 2 : 1) * \
						(((x) >= 2) ? 2 : 1) * \
						(((x) >= 3) ? 2 : 1) * \
						(((x) >= 4) ? 2 : 1) * \
						(((x) >= 5) ? 2 : 1) * \
						(((x) >= 6) ? 2 : 1) * \
						(((x) >= 7) ? 2 : 1) * \
						(((x) >= 8) ? 2 : 1) * \
						(((x) >= 9) ? 2 : 1) * \
						(((x) >= 10) ? 2 : 1) * \
						(((x) >= 11) ? 2 : 1) * \
						(((x) >= 12) ? 2 : 1) * \
						(((x) >= 13) ? 2 : 1) * \
						(((x) >= 14) ? 2 : 1) * \
						(((x) >= 15) ? 2 : 1) * \
						(((x) >= 16) ? 2 : 1) * \
						(((x) >= 17) ? 2 : 1) * \
						(((x) >= 18) ? 2 : 1) * \
						(((x) >= 19) ? 2 : 1) * \
						(((x) >= 20) ? 2 : 1) * \
						(((x) >= 21) ? 2 : 1) * \
						(((x) >= 22) ? 2 : 1) * \
						(((x) >= 23) ? 2 : 1) * \
						(((x) >= 24) ? 2 : 1) * \
						(((x) >= 25) ? 2 : 1) * \
						(((x) >= 26) ? 2 : 1) * \
						(((x) >= 27) ? 2 : 1) * \
						(((x) >= 28) ? 2 : 1) * \
						(((x) >= 29) ? 2 : 1) * \
						(((x) >= 30) ? 2 : 1) * \
						(((x) >= 31) ? 2 : 1))
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Max/Min Macros
//	Desc:		Standard binary max/min macros
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define max(x,y)		((x) > (y) ? (x) : (y))
`define min(x,y)		((x) < (y) ? (x) : (y))
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Integer Division Macros
//	Desc:		Rounding and ceiling for integer division
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define	divceil(x,y)	(((x) + ((y) - 1)) / (y))
`define	divrnd(x,y)		(((x) + ((y) >> 1)) / (y))
`endif
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//	Section:	Population Count
//	Desc:		A population counter macro for 32bit values
//------------------------------------------------------------------------------
`ifdef MACROSAFE
`define popcount(x)		((((x) & 1) ? 1 : 0) + \
						(((x) & 2) ? 1 : 0) + \
						(((x) & 4) ? 1 : 0) + \
						(((x) & 8) ? 1 : 0) + \
						(((x) & 16) ? 1 : 0) + \
						(((x) & 32) ? 1 : 0) + \
						(((x) & 64) ? 1 : 0) + \
						(((x) & 128) ? 1 : 0) + \
						(((x) & 256) ? 1 : 0) + \
						(((x) & 512) ? 1 : 0) + \
						(((x) & 1024) ? 1 : 0) + \
						(((x) & 2048) ? 1 : 0) + \
						(((x) & 4096) ? 1 : 0) + \
						(((x) & 8192) ? 1 : 0) + \
						(((x) & 16384) ? 1 : 0) + \
						(((x) & 32768) ? 1 : 0) + \
						(((x) & 65536) ? 1 : 0) + \
						(((x) & 131072) ? 1 : 0) + \
						(((x) & 262144) ? 1 : 0) + \
						(((x) & 524288) ? 1 : 0) + \
						(((x) & 1048576) ? 1 : 0) + \
						(((x) & 2097152) ? 1 : 0) + \
						(((x) & 4194304) ? 1 : 0) + \
						(((x) & 8388608) ? 1 : 0) + \
						(((x) & 16777216) ? 1 : 0) + \
						(((x) & 33554432) ? 1 : 0) + \
						(((x) & 67108864) ? 1 : 0) + \
						(((x) & 134217728) ? 1 : 0) + \
						(((x) & 268435456) ? 1 : 0) + \
						(((x) & 536870912) ? 1 : 0) + \
						(((x) & 1073741824) ? 1 : 0) + \
						(((x) & 2147483648) ? 1 : 0))
`endif
//------------------------------------------------------------------------------
