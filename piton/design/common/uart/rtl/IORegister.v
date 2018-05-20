//==============================================================================
//	File:		$URL: svn+ssh://repositorypub@repository.eecs.berkeley.edu/public/Projects/GateLib/trunk/Core/GateCore/Hardware/State/IORegister.v $
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
//	Module:		IORegister
//	Desc:		A register which should be packed in to IO pads.
//	Author:		<a href="http://www.gdgib.com/">Greg Gibeling</a>
//	Version:	$Revision: 26904 $
//------------------------------------------------------------------------------
module	IORegister(Clock, Reset, Set, Enable, In, Out);
	//--------------------------------------------------------------------------
	//	Parameters
	//--------------------------------------------------------------------------
	parameter				Width = 				32,
							Initial =				{Width{1'bx}},
							AsyncReset =			0,
							AsyncSet =				0,
							ResetValue =			{Width{1'b0}},
							SetValue =				{Width{1'b1}};
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Inputs & Outputs
	//--------------------------------------------------------------------------
	input					Clock, Enable, Reset, Set;
	input	[Width-1:0]		In;
	output reg [Width-1:0]	Out =					Initial /* synthesis syn_useioff = 1 iob = true useioff = 1 */;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Behavioral Register
	//--------------------------------------------------------------------------
	generate if (AsyncReset) begin:AR
		if (AsyncSet) begin:AS
			always @ (posedge Clock or posedge Reset or posedge Set) begin
				if (Reset) Out <=					ResetValue;
				else if (Set) Out <=				SetValue;
				else if (Enable) Out <=				In;
			end
		end else begin:SS
			always @ (posedge Clock or posedge Reset) begin
				if (Reset) Out <=					ResetValue;
				else if (Set) Out <=				SetValue;
				else if (Enable) Out <=				In;
			end
		end
	end else begin:SR
		if (AsyncSet) begin:AS
			always @ (posedge Clock or posedge Set) begin
				if (Reset) Out <=					ResetValue;
				else if (Set) Out <=				SetValue;
				else if (Enable) Out <=				In;
			end
		end else begin:SS
			always @ (posedge Clock) begin
				if (Reset) Out <=					ResetValue;
				else if (Set) Out <=				SetValue;
				else if (Enable) Out <=				In;
			end
		end
	end endgenerate
	//--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
