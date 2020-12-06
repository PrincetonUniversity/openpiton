// 
// -------------------------------------------------------------
//    Copyright 2010 Mentor Graphics Corporation
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

virtual class utils #(type T=int, string TNAME="config") extends ovm_object;

  // Function: new
  //
  // Create a new object instance of this class.

  function new( string name = "" );
    super.new( name );
  endfunction


  // Function: get_config
  //
  // This method gets the any_config associated with component c.
  // We check for the two kinds of error which may occur with this kind of 
  // operation.

  static function T get_config(ovm_component comp);
    ovm_object obj;
    T cfg;

    if (!uvm_config_object::get(comp, "", "config", obj)) begin
      comp.ovm_report_error("GET_CFG_FAIL", {"No set_config to with '", TNAME,
                         "' for component",comp.get_full_name()},
                         OVM_NONE , `ovm_file , `ovm_line  );
      return null;
    end

    if (!$cast(cfg, obj)) begin
      comp.ovm_report_error( "GET_CFG_TYPE_FAIL",
                          {"Set_config_object with field name ",TNAME,
                          " is not of type '",T::type_name,"'"},
                          OVM_NONE , `ovm_file , `ovm_line );
    end

    return cfg;

endfunction


