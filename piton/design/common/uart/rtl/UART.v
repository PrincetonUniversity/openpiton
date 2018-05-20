//==============================================================================
//	File:		$URL: svn+ssh://repositorypub@repository.eecs.berkeley.edu/public/Projects/GateLib/trunk/Firmware/UART/Hardware/UART.v $
//	Version:	$Revision: 27062 $
//	Author:		Greg Gibeling (http://www.gdgib.com)
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

//==============================================================================
//	Section:	Includes
//==============================================================================
`include "Const.v"
//==============================================================================

//------------------------------------------------------------------------------
//	Module:		UART
//	Desc:		Standard Universal Asynchronous RS232/16550 type transceiver.
//	Params:		ClockFreq: Frequency (in Hz) of the "Clock" being fed to this
//						module.
//				Baud:	Desired Baud rate.  This is the rate at which this
//						module will send bits, and should be at most 1/4th
//						of the clock rate (or so).
//				Width:	Word width (in bits) of the words (bytes) send over
//						the serial line.
//				Parity:	The type of parity bit to be appended to each word of
//						data.
//						0:	None
//						1:	Odd
//						2:	Even
//						3:	Mark
//						4:	Space
//				StopBits:The number of bit-periods to send the stop condition.
//						Generally 1 or 2, though larger numbers are possible.
//	Ex:			(27000000, 9600, 8, 0, 1) Standard 9600baud 8-N-1 serial port
//						settings used as the default by many devices, based
//						on a 27MHz clock.
//------------------------------------------------------------------------------
module	UART(Clock, Reset, DataIn, DataInValid, DataInReady, DataOut, DataOutValid, DataOutReady, SIn, SOut);
	//--------------------------------------------------------------------------
	//	Parameters
	//--------------------------------------------------------------------------
	parameter				ClockFreq =				27000000,
							Baud =					115200,
							Width =					8,
							Parity =				0,
							StopBits =				1;
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	System Inputs
	//--------------------------------------------------------------------------
	input					Clock, Reset;	
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Parallel Data Input
	//--------------------------------------------------------------------------
	input	[Width-1:0]		DataIn;
	input					DataInValid;
	output					DataInReady;
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	Parallel Data Output
	//--------------------------------------------------------------------------
	output	[Width-1:0]		DataOut;
	output					DataOutValid;
	input					DataOutReady;
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	Serial Interface
	//--------------------------------------------------------------------------
	input					SIn;
	output					SOut;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Transmitter
	//--------------------------------------------------------------------------
	UATransmitter	TX(			.Clock(				Clock),
								.Reset(				Reset),
								.DataIn(			DataIn),
								.DataInValid(		DataInValid),
								.DataInReady(		DataInReady),
								.SOut(				SOut));
	defparam		TX.ClockFreq =					ClockFreq;
	defparam		TX.Baud =						Baud;
	defparam		TX.Width =						Width;
	defparam		TX.Parity =						Parity;
	defparam		TX.StopBits =					StopBits;
	//--------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------
	//	Receiver
	//--------------------------------------------------------------------------
	UAReceiver		RX(			.Clock(				Clock),
								.Reset(				Reset),
								.DataOut(			DataOut),
								.DataOutValid(		DataOutValid),
								.DataOutReady(		DataOutReady),
								.SIn(				SIn));
	defparam		RX.ClockFreq =					ClockFreq;
	defparam		RX.Baud =						Baud;
	defparam		RX.Width =						Width;
	defparam		RX.Parity =						Parity;
	defparam		RX.StopBits =					StopBits;
	//--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------