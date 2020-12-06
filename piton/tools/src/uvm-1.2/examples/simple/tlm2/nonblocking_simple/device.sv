//----------------------------------------------------------------------
//   Copyright 2010-2011 Synopsys, Inc
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------


class device extends uvm_component;

   uvm_tlm_nb_target_socket#(device, usb_xfer, usb_tlm_phase) sock;

   `uvm_component_utils(device)

   function new(string name = "device", uvm_component parent = null);
      super.new(name, parent);
      sock = new("sock", this);
   endfunction

   byte data[];

   // Forward path
   function uvm_tlm_sync_e nb_transport_fw(usb_xfer xfer,
                                           ref usb_tlm_phase ph,
                                           input uvm_tlm_time delay);

      `uvm_info("USB/DEV/FWD", $sformatf("%s @%0d: %s",
                                         ph.name(), delay.get_realtime(1ns),
                                         xfer.convert2string()), UVM_LOW)

      // This device?
      if (xfer.addr != 7'h7A) return UVM_TLM_COMPLETED;

      // Valid endpoint in the device?
      if (xfer.endp != 4'h5) return UVM_TLM_COMPLETED;
      
      case (xfer.kind)

       usb_xfer::OUT: begin
          case (ph)
           USB_TLM_TOKEN: begin
              return UVM_TLM_ACCEPTED;
           end

           USB_TLM_DATA: begin
              data = xfer.data;

              // Could complete transfer early here
              fork: out_ack
                 automatic usb_xfer     xf = xfer;
                 automatic uvm_tlm_time dl = delay;
                 begin
                    usb_tlm_phase ph = USB_TLM_HANDSHAKE;
                    #100;
                    xf.status = usb_xfer::ACK;
                    assert(sock.nb_transport_bw(xf, ph, dl) ==
                           UVM_TLM_COMPLETED);

                    `uvm_info("USB/DEV/OUT/DONE", xf.convert2string(),
                              UVM_NONE);
                    
                 end
              join_none

              return UVM_TLM_ACCEPTED;
           end
           
          endcase
       end

       usb_xfer::IN: begin
          case (ph)
           USB_TLM_TOKEN: begin
              // Could return the data early here
              fork: in_data
                 automatic usb_xfer     xf = xfer;
                 automatic uvm_tlm_time dl = delay;
                 begin
                    usb_tlm_phase ph = USB_TLM_DATA;
                    #150;
		    begin
			byte tdata[2]='{'hAB, 'hCD};
                    	xf.data = tdata;
		    end
                    void'(sock.nb_transport_bw(xf, ph, dl));
                 end
              join_none

              return UVM_TLM_ACCEPTED;
           end

           USB_TLM_HANDSHAKE: begin
              `uvm_info("USB/DEV/IN/DONE", xfer.convert2string(),
                        UVM_NONE);
              
              return UVM_TLM_COMPLETED;
           end
           
          endcase
       end
      endcase
      
      return UVM_TLM_COMPLETED;
   endfunction

endclass
