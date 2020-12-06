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

// File: Algorithmic Comparator
//
// A common function of testbenches is to compare streams of transactions for
// equivalence. For example, a testbench may compare a stream of transactions
// from a DUT with expected results.
//
// The UVM library provides a base class called 
// <uvm_in_order_comparator #(T,comp_type,convert,pair_type)> and two
// derived classes, which are <uvm_in_order_built_in_comparator #(T)> for comparing
// streams of built-in types and <uvm_in_order_class_comparator #(T)> for comparing
// streams of class objects.
//
// The uvm_algorithmic_comparator also compares two streams of transactions;
// however, the transaction streams might be of different type objects. This
// device will use a user-written transformation function to convert one type
// to another before performing a comparison.


//------------------------------------------------------------------------------
//
// CLASS: uvm_algorithmic_comparator #(BEFORE,AFTER,TRANSFORMER)
//
// Compares two streams of data objects of different types, ~BEFORE~ and ~AFTER~.
//
// The algorithmic comparator is a wrapper around <uvm_in_order_class_comparator #(T)>.
// Like the in-order comparator, the algorithmic comparator compares two streams
// of transactions, the ~BEFORE~ stream and the ~AFTER~ stream. It is often the case
// when two streams of transactions need to be compared that the two streams are
// in different forms. That is, the type of the ~BEFORE~ transaction stream is
// different than the type of the ~AFTER~ transaction stream.
//
// The uvm_algorithmic_comparator's ~TRANSFORMER~ type parameter specifies the
// class responsible for converting transactions of type ~BEFORE~ into those of
// type ~AFTER~. This transformer class must provide a transform() method with the
// following prototype:
//
//|    function AFTER transform (BEFORE b);
//
// Matches and mismatches are reported in terms of the ~AFTER~ transactions.
// For more information, see the 
// <uvm_in_order_comparator #(T,comp_type,convert,pair_type)> class.
//
//------------------------------------------------------------------------------


class uvm_algorithmic_comparator #( type BEFORE=int,
                                    type AFTER=int,
                                    type TRANSFORMER=int) extends uvm_component;

  const static string type_name = "uvm_algorithmic_comparator #(BEFORE,AFTER,TRANSFORMER)";

  typedef uvm_algorithmic_comparator #( BEFORE , 
                                        AFTER , 
                                        TRANSFORMER ) this_type;
  
  `uvm_component_param_utils(this_type)


  // Port: before_export
  //
  // The export to which a data stream of type BEFORE is sent via a connected
  // analysis port. Publishers (monitors) can send in an ordered stream of
  // transactions against which the transformed BEFORE transactions will
  // (be compared.

  uvm_analysis_imp #(BEFORE, this_type) before_export;


  // Port: after_export
  //
  // The export to which a data stream of type AFTER is sent via a connected
  // analysis port. Publishers (monitors) can send in an ordered stream of
  // transactions to be transformed and compared to the AFTER transactions.

  uvm_analysis_export #(AFTER) after_export;

 
  local uvm_in_order_class_comparator #(AFTER) comp;
  local TRANSFORMER m_transformer;
     
  // Function: new
  //
  // Creates an instance of a specialization of this class.
  // In addition to the standard uvm_component constructor arguments, ~name~
  // and ~parent~, the constructor takes a handle to a ~transformer~ object,
  // which must already be allocated (handles can't be ~null~) and must implement
  // the transform() method.

 function new(string name, uvm_component parent=null, TRANSFORMER transformer=null);

    super.new( name , parent );
     
    m_transformer = transformer;
    comp = new("comp", this );
    
    before_export = new("before_analysis_export" , this );
    after_export = new("after_analysis_export" , this );
  endfunction

  virtual function string get_type_name();
    return type_name;
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    after_export.connect( comp.after_export );
  endfunction

  function void write( input BEFORE b );
    comp.before_export.write( m_transformer.transform( b ) );
  endfunction
      
endclass
