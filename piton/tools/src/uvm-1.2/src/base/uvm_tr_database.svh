//
//-----------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2013 NVIDIA Corporation
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
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// File: Transaction Recording Databases
//
// The UVM "Transaction Recording Database" classes are an abstract representation
// of the backend tool which is recording information for the user.  Usually this
// tool would be dumping information such that it can be viewed with the ~waves~ 
// of the DUT.
//

typedef class uvm_recorder;
typedef class uvm_tr_stream;
typedef class uvm_link_base;
typedef class uvm_simple_lock_dap;
typedef class uvm_text_tr_stream;
   
   
//------------------------------------------------------------------------------
//
// CLASS: uvm_tr_database
//
// The ~uvm_tr_database~ class is intended to hide the underlying database implementation
// from the end user, as these details are often vendor or tool-specific.
//
// The ~uvm_tr_database~ class is pure virtual, and must be extended with an
// implementation.  A default text-based implementation is provided via the
// <uvm_text_tr_database> class.
//

virtual class uvm_tr_database extends uvm_object;

   // Variable- m_is_opened
   // Tracks the opened state of the database
   local bit m_is_opened;

   // Variable- m_streams
   // Used for tracking streams which are between the open and closed states
   local bit m_streams[uvm_tr_stream];
   
   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_tr_database");
      super.new(name);
   endfunction : new

   // Group: Database API
   
   // Function: open_db
   // Open the backend connection to the database.
   //
   // If the database is already open, then this
   // method will return 1.
   //
   // Otherwise, the method will call <do_open_db>,
   // and return the result.
   function bit open_db();
      if (!m_is_opened)
        m_is_opened = do_open_db();
      return m_is_opened;
   endfunction : open_db

   // Function: close_db
   // Closes the backend connection to the database.
   //
   // Closing a database implicitly closes and
   // frees all <uvm_tr_streams> within the database.
   //
   // If the database is already closed, then this
   // method will return 1.
   // 
   // Otherwise, this method will trigger a <do_close_db>
   // call, and return the result.
   function bit close_db();
      if (m_is_opened) begin
         if (do_close_db())
           m_is_opened = 0;
      end
      return (m_is_opened == 0);
   endfunction : close_db

   // Function: is_open
   // Returns the open/closed status of the database.
   //
   // This method returns 1 if the database has been
   // successfully opened, but not yet closed.
   //
   function bit is_open();
      return m_is_opened;
   endfunction : is_open

   // Group: Stream API
   
   // Function: open_stream
   // Provides a reference to a ~stream~ within the
   // database.
   //
   // Parameters:
   //   name - A string name for the stream.  This is the name associated
   //          with the stream in the database.
   //   scope - An optional scope for the stream.
   //   type_name - An optional name describing the type of records which
   //               will be created in this stream.  
   //
   // The method returns a reference to a <uvm_tr_stream>
   // object if successful, ~null~ otherwise.
   //
   // This method will trigger a <do_open_stream> call, and if a
   // non ~null~ stream is returned, then <uvm_tr_stream::do_open>
   // will be called.
   //
   // Streams can only be opened if the database is
   // open (per <is_open>).  Otherwise the request will
   // be ignored, and ~null~ will be returned.
   function uvm_tr_stream open_stream(string name,
                                      string scope="",
                                      string type_name="");
      if (!open_db()) begin
         return null;
      end
      else begin
         process p = process::self();
         string s;

         if (p != null)
           s = p.get_randstate();

         open_stream = do_open_stream(name, scope, type_name);


         if (open_stream != null) begin
            m_streams[open_stream] = 1;
            open_stream.m_do_open(this, scope, type_name);
         end
         
         if (p != null)
           p.set_randstate(s);

      end
   endfunction : open_stream

   // Function- m_free_stream
   // Removes stream from the internal array
   function void m_free_stream(uvm_tr_stream stream);
      if (m_streams.exists(stream))
        m_streams.delete(stream);
   endfunction : m_free_stream
   
   // Function: get_streams
   // Provides a queue of all streams within the database.
   //
   // Parameters:
   // q - A reference to a queue of <uvm_tr_stream>s
   //
   // The ~get_streams~ method returns the size of the queue,
   // such that the user can conditionally process the elements.
   //
   // | uvm_tr_stream stream_q[$];
   // | if (my_db.get_streams(stream_q)) begin
   // |   // Process the queue...
   // | end
   function unsigned get_streams(ref uvm_tr_stream q[$]);
      // Clear out the queue first...
      q.delete();
      // Then fill in the values
      foreach (m_streams[idx])
        q.push_back(idx);
      // Finally, return the size of the queue
      return q.size();
   endfunction : get_streams
   
   // Group: Link API
   
   // Function: establish_link
   // Establishes a ~link~ between two elements in the database
   //
   // Links are only supported between ~streams~ and ~records~
   // within a single database.
   //
   // This method will trigger a <do_establish_link> call.
   function void establish_link(uvm_link_base link);
      uvm_tr_stream s_lhs, s_rhs;
      uvm_recorder r_lhs, r_rhs;
      uvm_object lhs = link.get_lhs();
      uvm_object rhs = link.get_rhs();
      uvm_tr_database db;

      if (lhs == null) begin
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      "left hand side '<null>' is not supported in links for 'uvm_tr_database'")
         return;
      end
      if (rhs == null) begin
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      "right hand side '<null>' is not supported in links for 'uvm_tr_database'")
         return;
      end
      
      if (!$cast(s_lhs, lhs) && 
          !$cast(r_lhs, lhs)) begin
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      $sformatf("left hand side of type '%s' not supported in links for 'uvm_tr_database'",
                                lhs.get_type_name()))
         return;
      end
      if (!$cast(s_rhs, rhs) && 
          !$cast(r_rhs, rhs)) begin
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      $sformatf("right hand side of type '%s' not supported in links for 'uvm_record_datbasae'",
                                rhs.get_type_name()))
         return;
      end
      
      if (r_lhs != null) begin
         s_lhs = r_lhs.get_stream();
      end
      if (r_rhs != null) begin
         s_rhs = r_rhs.get_stream();
      end

      if ((s_lhs != null) && (s_lhs.get_db() != this)) begin
         db = s_lhs.get_db();
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      $sformatf("attempt to link stream from '%s' into '%s'",
                                db.get_name(), this.get_name()))
         return;
      end
      if ((s_rhs != null) && (s_rhs.get_db() != this)) begin
         db = s_rhs.get_db();
         `uvm_warning("UVM/TR_DB/BAD_LINK",
                      $sformatf("attempt to link stream from '%s' into '%s'",
                                db.get_name(), this.get_name()))
         return;
      end

      do_establish_link(link);
   endfunction : establish_link
      
   // Group: Implementation Agnostic API
   //

   // Function: do_open_db
   // Backend implementation of <open_db>
   pure virtual protected function bit do_open_db();

   // Function: do_close_db
   // Backend implementation of <close_db>
   pure virtual protected function bit do_close_db();

   // Function: do_open_stream
   // Backend implementation of <open_stream>
   pure virtual protected function uvm_tr_stream do_open_stream(string name,
                                                                string scope,
                                                                string type_name);

   // Function: do_establish_link
   // Backend implementation of <establish_link>
   pure virtual protected function void do_establish_link(uvm_link_base link);

endclass : uvm_tr_database

//------------------------------------------------------------------------------
//
// CLASS: uvm_text_tr_database
//
// The ~uvm_text_tr_database~ is the default implementation for the
// <uvm_tr_database>.  It provides the ability to store recording information
// into a textual log file.
//
//
   
class uvm_text_tr_database extends uvm_tr_database;

   // Variable- m_filename_dap
   // Data Access Protected Filename
   local uvm_simple_lock_dap#(string) m_filename_dap;

   // Variable- m_file
   UVM_FILE m_file;

   `uvm_object_utils_begin(uvm_text_tr_database)
   `uvm_object_utils_end

   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_text_tr_database");
      super.new(name);

      m_filename_dap = new("filename_dap");
      m_filename_dap.set("tr_db.log");
   endfunction : new

   // Group: Implementation Agnostic API
   
   // Function: do_open_db
   // Open the backend connection to the database.
   //
   // Text-Backend implementation of <uvm_tr_database::open_db>.
   //
   // The text-backend will open a text file to dump all records in to.  The name
   // of this text file is controlled via <set_file_name>.
   //
   // This will also lock the ~file_name~, so that it cannot be
   // modified while the connection is open.
   protected virtual function bit do_open_db();
      if (m_file == 0) begin
         m_file = $fopen(m_filename_dap.get(), "a+");
         if (m_file != 0)
           m_filename_dap.lock();
      end
      return (m_file != 0);
   endfunction : do_open_db
   
   // Function: do_close_db
   // Close the backend connection to the database.
   //
   // Text-Backend implementation of <uvm_tr_database::close_db>.
   //
   // The text-backend will close the text file used to dump all records in to,
   // if it is currently opened.
   //
   // This unlocks the ~file_name~, allowing it to be modified again.
   protected virtual function bit do_close_db();
      if (m_file != 0) begin
         fork // Needed because $fclose is a task
            $fclose(m_file);
         join_none
         m_filename_dap.unlock();
      end
      return 1;
   endfunction : do_close_db
   
   // Function: do_open_stream
   // Provides a reference to a ~stream~ within the
   // database.
   //
   // Text-Backend implementation of <uvm_tr_database::open_stream>
   protected virtual function uvm_tr_stream do_open_stream(string name,
                                                           string scope,
                                                           string type_name);
      uvm_text_tr_stream m_stream = uvm_text_tr_stream::type_id::create(name);
      return m_stream;
   endfunction : do_open_stream

   // Function: do_establish_link
   // Establishes a ~link~ between two elements in the database
   //
   // Text-Backend implementation of <uvm_tr_database::establish_link>.
   protected virtual function void do_establish_link(uvm_link_base link);
      uvm_recorder r_lhs, r_rhs;
      uvm_object lhs = link.get_lhs();
      uvm_object rhs = link.get_rhs();
      
      void'($cast(r_lhs, lhs));
      void'($cast(r_rhs, rhs));
      
      if ((r_lhs == null) ||
          (r_rhs == null))
        return;
      else begin
         uvm_parent_child_link pc_link;
         uvm_related_link re_link;
         if ($cast(pc_link, link)) begin
            $fdisplay(m_file,"  LINK @%0t {TXH1:%0d TXH2:%0d RELATION=%0s}",
                      $time,
                      r_lhs.get_handle(),
                      r_rhs.get_handle(),
                      "child");
            
         end
         else if ($cast(re_link, link)) begin
            $fdisplay(m_file,"  LINK @%0t {TXH1:%0d TXH2:%0d RELATION=%0s}",
                      $time,
                         r_lhs.get_handle(),
                      r_rhs.get_handle(),
                      "");
            
         end
      end
   endfunction : do_establish_link

   // Group: Implementation Specific API
   
   // Function: set_file_name
   // Sets the file name which will be used for output.
   //
   // The ~set_file_name~ method can only be called prior to ~open_db~.
   //
   // By default, the database will use a file named "tr_db.log".
   function void set_file_name(string filename);
      if (filename == "") begin
        `uvm_warning("UVM/TXT_DB/EMPTY_NAME",
                     "Ignoring attempt to set file name to ''!")
         return;
      end

      if (!m_filename_dap.try_set(filename)) begin
         `uvm_warning("UVM/TXT_DB/SET_AFTER_OPEN",
                      "Ignoring attempt to change file name after opening the db!")
         return;
      end
   endfunction : set_file_name

   
endclass : uvm_text_tr_database
