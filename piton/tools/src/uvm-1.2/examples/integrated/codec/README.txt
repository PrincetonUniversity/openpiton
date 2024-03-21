// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
//    All Rights Reserved Worldwide
// 
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
//


This is an end-to-end phasing example involving a non-trivial
(yet simple) DUT.


1. DUT SPECIFICATION

The DUT is a full-duplex parallel-to-serial codec.

Bytes written to the TxFIFO are transmitted MSB-first in order
received. If there are no bytes to be transmitted, IDLE is
transmitted.

Received bytes are added to the RxFIFO if it is not full. SYNC, IDLE
and ESC characters are ignored.

The bit stream is identical in both direction. There is a SYNC
character (0xB2) inserted every 7 bytes. IDLE characters (0x81)
represent invalid data, unless escaped by a preceeding ESC character
(0xE7). If an IDLE or ESC character must be transmitted as valid data,
they must be preceeded by a ESC characted. The SYNC character, when
found in a position other than the SYNC slot is a valid character.

For example, the phrase 0xADB2EF81E7FEED could be transmitted as:

   B2 81 81 81 81 AD B2 B2 81 EF 81 E7 81 E7 B2 E7 81 E7 FE ED 81 B2
   SS .. .. .. .. vv vv SS .. vv .. EE vv EE SS vv .. EE vv vv .. SS

SS = SYNC
EE = ESC
.. = IDLE
vv = Valid data

Bits are valid at the rising edge of the clock.




The following host-accessible registers are available:


Address	      Bits	Name

0x0000			IntSrc	  Interrupt Source
  RO	      0:0	TxEmpty	  Tx FIFO is empty
  RO	      1:1	TxLow	  Tx is at or below low water mark
  RO	      2:2	TxFull	  Tx FIFO is full (32)
  RO	      4:4	RxEmpty	  Rx FIFO is empty
  RO	      5:5 	RxHigh	  Rx FIFO is at or above high water mark
  RO	      6:6	RxFull	  Rx FIFO is full (32)
  W1C	      8:8	SA	  Symbol alignment has been acquired or lost
				  Resets to 'b000010001

0x0004			IntMask	  Interrupt Mask
  RW          8:0       If '0', masks the corresponding interrupt source
				  Resets to all 0's

0x0010			TxStatus
  RW          0:0       TxEn      Enable transmit path
				  Resets to 0

0x0014			TxLWM
  RW          4:0       TxLWM     Low water mark for the Tx FIFO
				  Resets to 8.

0x0020			RxStatus
  RW          0:0       RxEn      Enable receive path
  RO          1:1       ALIGN     Symbol alignment status
				  Resets to all 0's

0x0024			RxHWM
  RW          4:0       RxHWM     High water mark for the Rx FIFO
				  Resets to 16.

0x0100		        TxRx
  WO	      7:0	TxData    Write data to TxFIFO if not full
  RO	      7:0	RxData	  Read data from RxFIFO if not empty


All unspecified bits are RO and read at 0's.
