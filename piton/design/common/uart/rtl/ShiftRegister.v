//==============================================================================
//	File:		$URL: svn+ssh://repositorypub@repository.eecs.berkeley.edu/public/Projects/GateLib/trunk/Core/GateCore/Hardware/State/ShiftRegister.v $
//	Version:	$Revision: 26904 $
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
//	Module:		ShiftRegister
//	Desc:		This is a general parallel to serial and serial to parallel
//				converter.  Note that it can work with 'serial' data streams
//				that are more than a single bit wide.  This is useful for
//				example when a signal must cross a 32b/8b boundary.
//				This also means it can be used to delay a signal quite easily.
//	Params:		PWidth:	Sets the bitwidth of the parallel data (both in and
//						out of the module)
//				SWidth:	Sets the bitwidth of the serial data (both in and out
//						of the module)
//				Reverse:Shift MSb to LSb?
//	Ex:			(32,1) will convert 32bit wide data into 1bit serial data
//				(32,8) will convert 32bit words into bytes
//	Author:		<a href="http://www.gdgib.com/">Greg Gibeling</a>
//	Version:	$Revision: 26904 $
//------------------------------------------------------------------------------
module	ShiftRegister(Clock, Reset, Load, Enable, PIn, SIn, POut, SOut);
	//--------------------------------------------------------------------------
	//	Parameters
	//--------------------------------------------------------------------------
	parameter				PWidth =				32,		// The parallel width
							SWidth =				1,		// The serial width
							Reverse =				0,
							Initial =				{PWidth{1'bx}},
							AsyncReset =			0,
							AsyncSet =				0,
							ResetValue =			{PWidth{1'b0}},
							SetValue =				{PWidth{1'b1}};
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	Control Inputs
	//--------------------------------------------------------------------------
	input					Clock, Reset, Load, Enable;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Parallel and Serial I/O
	//--------------------------------------------------------------------------
	input	[PWidth-1:0]	PIn;
	input	[SWidth-1:0]	SIn;
	output 	[PWidth-1:0]	POut;
	output	[SWidth-1:0]	SOut;
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	Assigns
	//--------------------------------------------------------------------------
	assign	SOut =									Reverse ? POut[SWidth-1:0] : POut[PWidth-1:PWidth-SWidth];
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Behavioral Shift Register Core
	//--------------------------------------------------------------------------
	generate if (PWidth == SWidth) begin:REG
		Register 	#(			.Width(				PWidth),
								.Initial(			Initial),
								.AsyncReset(		AsyncReset),
								.AsyncSet(			AsyncSet),
								.ResetValue(		ResetValue),
								.SetValue(			SetValue))
					Register(	.Clock(				Clock),
								.Reset(				Reset),
								.Set(				1'b0),
								.Enable(			Load | Enable),
								.In(				Load ? PIn : SIn),
								.Out(				POut));
	end else begin:SHIFT
		Register	 #(			.Width(				PWidth),
								.Initial(			Initial),
								.AsyncReset(		AsyncReset),
								.AsyncSet(			AsyncSet),
								.ResetValue(		ResetValue),
								.SetValue(			SetValue))
					Register(	.Clock(				Clock),
								.Reset(				Reset),
								.Set(				1'b0),
								.Enable(			Load | Enable),
								.In(				Load ? PIn : (Reverse ? {SIn, POut[PWidth-1:SWidth]} : {POut[PWidth-SWidth-1:0], SIn})),
								.Out(				POut));
	end endgenerate
	//--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
