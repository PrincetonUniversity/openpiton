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


class host extends uvm_component;

   uvm_tlm_nb_initiator_socket#(host, usb_xfer, usb_tlm_phase) sock;

   `uvm_component_utils(host)

   function new(string name = "host", uvm_component parent = null);
      super.new(name, parent);
      sock = new("sock", this);
   endfunction

   usb_xfer       xfer;
   usb_tlm_phase  ph;
   uvm_tlm_time   delay = new;
   uvm_tlm_sync_e sync;

   // Backward path
   function uvm_tlm_sync_e nb_transport_bw(usb_xfer xfer,
                                           ref usb_tlm_phase ph,
                                           input uvm_tlm_time delay);

      `uvm_info("USB/HST/BWD", $sformatf("%s @%0d: %s",
                                         ph.name(), delay.get_realtime(1ns),
                                         xfer.convert2string()), UVM_LOW)
               
      assert(xfer == this.xfer);
      this.ph    = ph;
      this.delay = delay;
      
      case (xfer.kind)

       usb_xfer::OUT: begin
          assert(ph == USB_TLM_HANDSHAKE);
          sync = UVM_TLM_COMPLETED;
          return UVM_TLM_COMPLETED;
       end

       usb_xfer::IN: begin
          assert(ph == USB_TLM_DATA);
          // Could do an early completion too
          return UVM_TLM_ACCEPTED;
       end
      endcase
      
      return UVM_TLM_COMPLETED;
   endfunction
   
   //
   // Execute an OUT followed by an IN bulk transfer
   //
   virtual task run_phase(uvm_phase phase);

      phase.raise_objection(this);
      
      xfer = usb_xfer::type_id::create("xfer",,get_full_name());

      // OUT bulk transfer
      
      do begin
         xfer.kind = usb_xfer::OUT;
         xfer.addr = 7'h7A;
         xfer.endp = 4'h5;
         
         ph = USB_TLM_TOKEN;
         sync = sock.nb_transport_fw(xfer, ph, delay);
         if (sync == UVM_TLM_COMPLETED) begin
            `uvm_info("USB/HST/OUT/REFUSED", "Device refused the transfer",
                      UVM_LOW);
            break;
         end

         ph = USB_TLM_DATA;
	 begin
		 byte tdata[4]='{'hDE, 'hAD, 'hBE, 'hEF};
	         xfer.data = tdata;
	 end
         sync = sock.nb_transport_fw(xfer, ph, delay);
         if (sync == UVM_TLM_COMPLETED) begin
            `uvm_info("USB/HST/OUT/EARLY", "Device completed OUT transfer early",
                      UVM_LOW);
            break;
         end

         // Wait for the device to reply
         wait (sync == UVM_TLM_COMPLETED);
         `uvm_info("USB/HST/OUT/NORMAL", "OUT Transfer completed normally",
                   UVM_LOW);
      
      end while (0);

      `uvm_info("USB/HST/OUT/DONE", xfer.convert2string(), UVM_NONE);

      // IN bulk transfer
      
      do begin
         // Ok to reuse the same XFER instance
         xfer.kind = usb_xfer::IN;
         xfer.addr = 7'h7A;
         xfer.endp = 4'h5;
         xfer.data = new[0];
         
         ph = USB_TLM_TOKEN;
         sync = sock.nb_transport_fw(xfer, ph, delay);
         if (sync == UVM_TLM_COMPLETED) begin
            `uvm_info("USB/HST/IN/REFUSED", "Device refused the transfer",
                      UVM_LOW);
            break;
         end
         if (sync == UVM_TLM_UPDATED) begin
            `uvm_info("USB/HST/IN/EARLY", "Device returned bulk data early",
                      UVM_LOW);
         end
         else begin
            // Wait for the device to reply
            wait(ph == USB_TLM_DATA);
            `uvm_info("USB/HST/IN/NORMAL", "IN data returned normally",
                      UVM_LOW);
         end

         ph = USB_TLM_HANDSHAKE;
         xfer.status = usb_xfer::ACK;
         sync = sock.nb_transport_fw(xfer, ph, delay);
         assert(sync == UVM_TLM_COMPLETED);
      
      end while (0);

      `uvm_info("USB/HST/IN/DONE", xfer.convert2string(), UVM_NONE);

      phase.drop_objection(this);
   endtask

   

endclass
