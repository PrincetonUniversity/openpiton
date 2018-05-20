//==============================================================================
//	File:		$URL: svn+ssh://repositorypub@repository.eecs.berkeley.edu/public/Projects/GateLib/trunk/Core/GateCore/Hardware/Datapath/Fixed/Reverse.v $
//	Version:	$Revision: 26904 $
//	Author:		Greg Gibeling (http://www.gdgib.com/)
//	Copyright:	Copyright 2003-2010 UC Berkeley
//==============================================================================

//==============================================================================
//	Section:	License
//==============================================================================
//	Copyright (c) 2003-2010, Regents of the University of California
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
//	Module:		Reverse
//	Desc:		Parameterized bit reversal module: a fancy wire.
//				Essentially this module is just a very complex set of wires, all
//				it does it reverse the bits in a bus.  A "group" is a group of
//				"chunks" that should be reversed, "set" is the number of
//				"chunks" per "group".  This module will reverse the order of the
//				"chunks" within each "group".
//	Params:		Width:	This sets the input and output bus width of the module
//				Chunk:	This is the size of a block of wires which should
//						be kept in order.  The default is 1 meaning each wire
//						should be treated separately.
//				Set:	The number of chunks in a set, the default is the
//						bitwidth of the input bus, meaning that the whole input
//						bus is treated as a set.
//	Ex:			(32,1,32) Will reverse the bit order of a 32bit bus.
//				(32,1,8)Will reverse the MSb/LSb order of the bytes in a 32bit
//						bus.
//				(32,4,2)will reverse the MSNibble/LSNibble of each byte in a
//						32bit bus.
//	Author:		<a href="http://www.gdgib.com/">Greg Gibeling</a>
//	Version:	$Revision: 26904 $
//------------------------------------------------------------------------------
module	Reverse(In, Out);
	//--------------------------------------------------------------------------
	//	Parameters
	//--------------------------------------------------------------------------
	parameter				Width =					32,
							Chunk =					1,
							Set =					Width;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Constants
	//--------------------------------------------------------------------------
	localparam				Group =					Chunk * Set;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	I/O
	//--------------------------------------------------------------------------
	input	[Width-1:0]		In;
	output	[Width-1:0]		Out;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	A Complicated Wire
	//--------------------------------------------------------------------------
	genvar					i;
	generate for(i = 0; i < Width; i = i + 1) begin:REVERSE
		assign Out[i] =								In[((Set - 1 - ((i % Group) / Chunk)) * Chunk) + ((i % Group) % Chunk) + ((i / Group) * Group)];
	end endgenerate
	//--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
