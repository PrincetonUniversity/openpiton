//
//------------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc. 
//   Copyright 2010 Synopsys, Inc.
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
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: uvm_agent
//
// The uvm_agent virtual class should be used as the base class for the user-
// defined agents. Deriving from uvm_agent will allow you to distinguish agents
// from other component types also using its inheritance. Such agents will
// automatically inherit features that may be added to uvm_agent in the future.
// 
// While an agent's build function, inherited from <uvm_component>, can be
// implemented to define any agent topology, an agent typically contains three
// subcomponents: a driver, sequencer, and monitor. If the agent is active,
// subtypes should contain all three subcomponents. If the agent is passive,
// subtypes should contain only the monitor.
//------------------------------------------------------------------------------

virtual class uvm_agent extends uvm_component;
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  // Function: new
  //
  // Creates and initializes an instance of this class using the normal
  // constructor arguments for <uvm_component>: ~name~ is the name of the
  // instance, and ~parent~ is the handle to the hierarchical parent, if any.
  //
  // The int configuration parameter is_active is used to identify whether this
  // agent should be acting in active or passive mode. This parameter can
  // be set by doing:
  //
  //| uvm_config_int::set(this, "<relative_path_to_agent>, "is_active", UVM_ACTIVE);

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
     int active;
     uvm_resource_pool rp;
     uvm_resource_types::rsrc_q_t rq;
     
     super.build_phase(phase);
     // is_active is treated as if it were declared via `uvm_field_enum,
     // which means it matches against uvm_active_passive_enum, int,
     // int unsigned, uvm_integral_t, uvm_bitstream_t, and string.
     rp = uvm_resource_pool::get();
     rq = rp.lookup_name(get_full_name(), "is_active", null, 0);
     uvm_resource_pool::sort_by_precedence(rq);
     for (int i = 0; i < rq.size(); i++) begin
        uvm_resource_base rsrc = rq.get(i);
        uvm_resource#(uvm_active_passive_enum) rap;

        if ($cast(rap, rsrc)) begin
           is_active = rap.read(this);
           break;
        end
        else begin
           uvm_resource#(uvm_integral_t) rit;
           if ($cast(rit, rsrc)) begin
              is_active = uvm_active_passive_enum'(rit.read(this));
              break;
           end
           else begin
              uvm_resource#(uvm_bitstream_t) rbs;
              if ($cast(rbs, rsrc)) begin
                 is_active = uvm_active_passive_enum'(rbs.read(this));
                 break;
              end
              else begin
                 uvm_resource#(int) ri;
                 if ($cast(ri, rsrc)) begin
                    is_active = uvm_active_passive_enum'(ri.read(this));
                    break;
                 end
                 else begin
                    uvm_resource#(int unsigned) riu;
                    if ($cast(riu, rsrc)) begin
                       is_active = uvm_active_passive_enum'(riu.read(this));
                       break;
                    end
                    else begin
                       uvm_resource#(string) rs;
                       if ($cast(rs, rsrc)) begin
                          void'(uvm_enum_wrapper#(uvm_active_passive_enum)::from_name(rs.read(this), is_active));
                          break;
                       end
                    end // else: !if($cast(riu, rsrc))
                 end // else: !if($cast(ri, rsrc))
              end // else: !if($cast(rbs, rsrc))
           end // else: !if($cast(rit, rsrc))
        end // else: !if($cast(rap, rsrc))
     end // for (int i = 0; found == 0 && i < rq.size(); i++)
     
  endfunction

  const static string type_name = "uvm_agent";

  virtual function string get_type_name ();
    return type_name;
  endfunction

  // Function: get_is_active
  //
  // Returns UVM_ACTIVE is the agent is acting as an active agent and 
  // UVM_PASSIVE if it is acting as a passive agent. The default implementation
  // is to just return the is_active flag, but the component developer may
  // override this behavior if a more complex algorithm is needed to determine
  // the active/passive nature of the agent.

  virtual function uvm_active_passive_enum get_is_active();
    return is_active;
  endfunction
endclass

