//------------------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc. 
//   Copyright 2010 Synopsys, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the "License"); you may not
//   use this file except in compliance with the License.  You may obtain a copy
//   of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//   WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//   License for the specific language governing permissions and limitations
//   under the License.
//------------------------------------------------------------------------------

`include "uvm_macros.svh"

//------------------------------------------------------------------------------
// Title: Typical Callback Application
//
// This example demonstrates callback usage. The component developer defines a
// driver and driver-specific callback class. The callback class defines the
// hooks available for users to override. The component using the callbacks
// (i.e. calling the callback methods) also defines corresponding virtual
// methods for each callback hook. The developer implements each virtual methods
// to call the corresponding callback method in all registered callback objects
// using default algorithm. The end-user may then define either a callback or
// driver subtype to extend driver behavior.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// Group: Component Developer Use Model
//
//------------------------------------------------------------------------------
// Component developers defines transaction, driver, and callback classes.
//------------------------------------------------------------------------------

package bus_driver_pkg;

import uvm_pkg::*;

typedef class bus_driver;
typedef class bus_driver_cb;
typedef uvm_callbacks #(bus_driver,bus_driver_cb) bus_driver_cbs_t;


//------------------------------------------------------------------------------
//
// CLASS: bus_tr
//
// A basic bus transaction. 
//------------------------------------------------------------------------------

class bus_tr extends uvm_transaction;
  rand int addr;
  rand int data;
  virtual function string convert2string();
    convert2string = $sformatf("addr=%0h data=%0h",addr,data);
  endfunction
endclass


//------------------------------------------------------------------------------
//
// CLASS: bus_driver_cb
//
//------------------------------------------------------------------------------
// The callback class defines an interface consisting of one or more function
// or task prototypes. The signatures of each method have no restrictions.
// The component developer knows best the intended semantic of multiple
// registered callbacks. Thus the algorithm for traversal the callback queue
// should reside in the callback class itself. We could provide convenience
// macros that implement the most common traversal methods, such as sequential
// in-order execution.
//------------------------------------------------------------------------------

virtual class bus_driver_cb extends uvm_callback; 

  virtual function bit trans_received(bus_driver driver, bus_tr tr);
    return 0;
  endfunction

  virtual task trans_executed(bus_driver driver, bus_tr tr);
  endtask

  function new(string name="bus_driver_cb_inst");
    super.new(name);
  endfunction

  static string type_name = "bus_driver_cb";

  virtual function string get_type_name();
    return type_name;
  endfunction

endclass


//------------------------------------------------------------------------------
//
// CLASS: bus_driver
//
//------------------------------------------------------------------------------
// With the following implementation of bus_driver, users can implement
// the callback "hooks" by either...
//
// - extending bus_driver and overriding one or more of the virtual
//   methods, trans_received or trans_executed. Then, configure the
//   factory to use the new type via a type or instance override.
//
// - extending bus_driver_cb and overriding one or more of the virtual
//   methods, trans_received or trans_executed. Then, register an
//   instance of the new callback type with an instance of bus_driver.
//   This requires access to the handle of the bus_driver.
//------------------------------------------------------------------------------

class bus_driver extends uvm_component;

  uvm_blocking_put_imp #(bus_tr,bus_driver) in;

  `uvm_register_cb(bus_driver, bus_driver_cb)

  function new (string name, uvm_component parent=null);
    super.new(name,parent);
    in = new("in",this);
  endfunction

  static string type_name = "bus_driver";

  virtual function string get_type_name();
    return type_name;
  endfunction

  virtual function bit trans_received(bus_tr tr);
    `uvm_do_callbacks_exit_on(bus_driver,bus_driver_cb,trans_received(this,tr),1)
  endfunction

  virtual task trans_executed(bus_tr tr);
    `uvm_do_callbacks(bus_driver,bus_driver_cb,trans_executed(this,tr))
  endtask

  virtual task put(bus_tr t);
    uvm_report_info("bus_tr received",t.convert2string());
    if (!trans_received(t)) begin
      uvm_report_info("bus_tr dropped",
          "user callback indicated DROPPED\n");
      return;
    end
    #100;
    trans_executed(t);
    uvm_report_info("bus_tr executed",{t.convert2string(),"\n"});
  endtask

endclass

endpackage // bus_driver_pkg


//------------------------------------------------------------------------------
//
// Group: End-User Use Model
//
//------------------------------------------------------------------------------
// The end-user simply needs to extend the callback base class, overriding any or
// all of the prototypes provided in the developer-supplied callback interface.
// Then, register an instance of the callback class with any object designed to
// use the base callback type.
//------------------------------------------------------------------------------

import uvm_pkg::*;
import bus_driver_pkg::*;

//------------------------------------------------------------------------------
//
// CLASS: my_bus_driver_cb
//
//------------------------------------------------------------------------------
// This class defines a subtype of the driver developer's base callback class.
// In this case, both available driver callback methods are defined. The 
// ~trans_received~ method randomly chooses whether to return 0 or 1. When 1,
// the driver will "drop" the received transaction.
//------------------------------------------------------------------------------

class my_bus_driver_cb extends bus_driver_cb;

  function new(string name="bus_driver_cb_inst");
    super.new(name);
  endfunction

  virtual function bit trans_received(bus_driver driver, bus_tr tr);
    static bit drop = 0;
    driver.uvm_report_info("trans_received_cb",
      {"  bus_driver=",driver.get_full_name()," tr=",tr.convert2string()});
    drop = 1 - drop;
    return drop;
  endfunction

  virtual task trans_executed(bus_driver driver, bus_tr tr);
    driver.uvm_report_info("trans_executed_cb",
      {"  bus_driver=",driver.get_full_name()," tr=",tr.convert2string()});
  endtask

  virtual function string get_type_name();
    return "my_bus_driver_cb";
  endfunction

endclass


//------------------------------------------------------------------------------
//
// CLASS: my_bus_driver_cb2
//
//------------------------------------------------------------------------------
// This class defines a subtype of the driver developer's base callback class.
// In this case, only one of the two available methods are defined.
//------------------------------------------------------------------------------

class my_bus_driver_cb2 extends bus_driver_cb;

  function new(string name="bus_driver_cb_inst");
    super.new(name);
  endfunction

  virtual task trans_executed(bus_driver driver, bus_tr tr);
    driver.uvm_report_info("trans_executed_cb2",
      {"  bus_driver=",driver.get_full_name()," tr=",tr.convert2string()});
  endtask

  virtual function string get_type_name();
    return "my_bus_driver_cb2";
  endfunction

endclass


//------------------------------------------------------------------------------
//
// MODULE: top
//
//------------------------------------------------------------------------------
// In this simple example, we don't build a complete environment, but this does
// not detract from the example's purpose. In the top module, we instantiate
// the bus_driver, and one instance each of our custom callback classes. 
// To register the callbacks with the driver, we get the global callback pool
// that is typed to our specific driver-callback combination. We associate
// (register) the callback objects with driver using the callback pool's 
// ~add_cb~ method. After calling ~display~ just to show that the
// registration was successful, we push several transactions into the driver.
// Our custom callbacks get called as the driver receives each transaction.
//------------------------------------------------------------------------------

module top;
  import uvm_pkg::*;
  import bus_driver_pkg::*;

  bus_tr            tr     = new;
  bus_driver        driver = new("driver");
  my_bus_driver_cb  cb1    = new("cb1");
  my_bus_driver_cb2 cb2    = new("cb2");

  initial begin
    bus_driver_cbs_t::add(driver,cb1);
    bus_driver_cbs_t::add(driver,cb2);
    bus_driver_cbs_t::display();
    for (int i=1; i<=5; i++) begin
      tr.addr = i;
      tr.data = 6-i;
      driver.in.put(tr);
    end
    begin
       uvm_report_server svr;
       svr = uvm_report_server::get_server();
       svr.summarize();
    end
  end

endmodule


