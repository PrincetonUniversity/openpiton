// 
// -------------------------------------------------------------
//    Copyright 2010-2011 Synopsys, Inc.
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


typedef enum {USB_TLM_TOKEN, USB_TLM_DATA, USB_TLM_HANDSHAKE} usb_tlm_phase;


class usb_xfer extends uvm_sequence_item;
  
   typedef enum {IN, OUT} kind_e;
   typedef enum {ACK, NAK, STALL, NYET} status_e;

   rand bit [6:0] addr;
   rand bit [3:0] endp;
   rand kind_e   kind;  
   rand byte      data[];
   rand status_e  status;
 
   `uvm_object_utils_begin(usb_xfer)
     `uvm_field_enum(kind_e, kind, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_array_int(data, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_enum(status_e, status, UVM_ALL_ON | UVM_NOPACK);
   `uvm_object_utils_end
   
   function new (string name = "usb_xfer");
      super.new(name);
   endfunction

   function string convert2string();
      convert2string = $sformatf("dev=%h.%h kind=%s hndsk=%s data=h",
                                 addr, endp, kind.name(), status.name());

      case (data.size())
       0: return {convert2string, "[]"};
       1: return $sformatf("%s0x%h", convert2string, data[0]);
       2: return $sformatf("%s0x%h 0x%h", convert2string, data[0], data[1]);
       3: return $sformatf("%s0x%h 0x%h 0x%h", convert2string,
                           data[0], data[1], data[2]);

       default:
          return $sformatf("%s0x%h 0x%h .. 0x%h (%0d bytes)", convert2string,
                           data[0], data[1], data[data.size()-1],
                           data.size());
      endcase
   endfunction

endclass: usb_xfer
