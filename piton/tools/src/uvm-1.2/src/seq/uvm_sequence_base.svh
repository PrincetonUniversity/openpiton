//----------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc. 
//   Copyright 2010-2011 Synopsys, Inc.
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


//------------------------------------------------------------------------------
//
// CLASS: uvm_sequence_base
//
// The uvm_sequence_base class provides the interfaces needed to create streams
// of sequence items and/or other sequences.
//
// A sequence is executed by calling its <start> method, either directly
// or invocation of any of the `uvm_do_* macros.
// 
// Executing sequences via <start>:
// 
// A sequence's <start> method has a ~parent_sequence~ argument that controls
// whether <pre_do>, <mid_do>, and <post_do> are called *in the parent*
// sequence. It also has a ~call_pre_post~ argument that controls whether its
// <pre_body> and <post_body> methods are called.
// In all cases, its <pre_start> and <post_start> methods are always called.
// 
// When <start> is called directly, you can provide the appropriate arguments
// according to your application.
//
// The sequence execution flow looks like this
// 
// User code
//
//| sub_seq.randomize(...); // optional
//| sub_seq.start(seqr, parent_seq, priority, call_pre_post)
//|
//
// The following methods are called, in order
//
//|
//|   sub_seq.pre_start()        (task)
//|   sub_seq.pre_body()         (task)  if call_pre_post==1
//|     parent_seq.pre_do(0)     (task)  if parent_sequence!=null
//|     parent_seq.mid_do(this)  (func)  if parent_sequence!=null
//|   sub_seq.body               (task)  YOUR STIMULUS CODE
//|     parent_seq.post_do(this) (func)  if parent_sequence!=null
//|   sub_seq.post_body()        (task)  if call_pre_post==1
//|   sub_seq.post_start()       (task)
// 
//
// Executing sub-sequences via `uvm_do macros:
//
// A sequence can also be indirectly started as a child in the <body> of a
// parent sequence. The child sequence's <start> method is called indirectly
// by invoking any of the `uvm_do macros.
// In these cases, <start> is called with
// ~call_pre_post~ set to 0, preventing the started sequence's <pre_body> and
// <post_body> methods from being called. During execution of the
// child sequence, the parent's <pre_do>, <mid_do>, and <post_do> methods
// are called.
//
// The sub-sequence execution flow looks like
// 
// User code
//
//|
//| `uvm_do_with_prior(seq_seq, { constraints }, priority)
//|
//
// The following methods are called, in order
//
//|
//|   sub_seq.pre_start()         (task)
//|   parent_seq.pre_do(0)        (task)
//|   parent_req.mid_do(sub_seq)  (func)
//|     sub_seq.body()            (task)
//|   parent_seq.post_do(sub_seq) (func)
//|   sub_seq.post_start()        (task)
//|
//
// Remember, it is the *parent* sequence's pre|mid|post_do that are called, not
// the sequence being executed. 
//
// 
// Executing sequence items via <start_item>/<finish_item> or `uvm_do macros:
// 
// Items are started in the <body> of a parent sequence via calls to
// <start_item>/<finish_item> or invocations of any of the `uvm_do
// macros. The <pre_do>, <mid_do>, and <post_do> methods of the parent
// sequence will be called as the item is executed.
//
// The sequence-item execution flow looks like
// 
// User code
//
//| parent_seq.start_item(item, priority);
//| item.randomize(...) [with {constraints}];
//| parent_seq.finish_item(item);
//|
//| or
//|
//| `uvm_do_with_prior(item, constraints, priority)
//|
//
// The following methods are called, in order
//
//|
//|   sequencer.wait_for_grant(prior) (task) \ start_item  \
//|   parent_seq.pre_do(1)            (task) /              \
//|                                                      `uvm_do* macros
//|   parent_seq.mid_do(item)         (func) \              /
//|   sequencer.send_request(item)    (func)  \finish_item /
//|   sequencer.wait_for_item_done()  (task)  /
//|   parent_seq.post_do(item)        (func) /
// 
// Attempting to execute a sequence via <start_item>/<finish_item>
// will produce a run-time error.
//------------------------------------------------------------------------------

class uvm_sequence_base extends uvm_sequence_item;

  protected uvm_sequence_state m_sequence_state;
            int                m_next_transaction_id = 1;
  local     int                m_priority = -1;
            uvm_recorder       m_tr_recorder;
            int                m_wait_for_grant_semaphore;

  // Each sequencer will assign a sequence id.  When a sequence is talking to multiple
  // sequencers, each sequence_id is managed separately
  protected int m_sqr_seq_ids[int];

  protected bit children_array[uvm_sequence_base];
   
  protected uvm_sequence_item response_queue[$];
  protected int               response_queue_depth = 8;
  protected bit               response_queue_error_report_disabled;

  // Variable: do_not_randomize
  //
  // If set, prevents the sequence from being randomized before being executed
  // by the `uvm_do*() and `uvm_rand_send*() macros,
  // or as a default sequence.
  //
  bit do_not_randomize;

  protected process  m_sequence_process;
  local bit m_use_response_handler;

  static string type_name = "uvm_sequence_base";

  // bits to detect if is_relevant()/wait_for_relevant() are implemented
  local bit is_rel_default;
  local bit wait_rel_default;


  // Function: new
  //
  // The constructor for uvm_sequence_base. 
  //
  function new (string name = "uvm_sequence");

    super.new(name);
    m_sequence_state = UVM_CREATED;
    m_wait_for_grant_semaphore = 0;
    m_init_phase_daps(1);
  endfunction


  // Function: is_item
  //
  // Returns 1 on items and 0 on sequences. As this object is a sequence,
  // ~is_item~ will always return 0.
  //
  virtual function bit is_item();
    return 0;
  endfunction


  // Function: get_sequence_state
  //
  // Returns the sequence state as an enumerated value. Can use to wait on
  // the sequence reaching or changing from one or more states.
  //
  //| wait(get_sequence_state() & (UVM_STOPPED|UVM_FINISHED));

  function uvm_sequence_state_enum get_sequence_state();
    return m_sequence_state;
  endfunction


  // Task: wait_for_sequence_state
  // 
  // Waits until the sequence reaches one of the given ~state~. If the sequence
  // is already in one of the state, this method returns immediately.
  //
  //| wait_for_sequence_state(UVM_STOPPED|UVM_FINISHED);

  task wait_for_sequence_state(int unsigned state_mask);
    wait (m_sequence_state & state_mask);
  endtask


  // Function: get_tr_handle
  //
  // Returns the integral recording transaction handle for this sequence.
  // Can be used to associate sub-sequences and sequence items as
  // child transactions when calling <uvm_component::begin_child_tr>.

  function integer get_tr_handle();
     if (m_tr_recorder != null)
       return m_tr_recorder.get_handle();
     else
       return 0;
  endfunction


  //--------------------------
  // Group: Sequence Execution
  //--------------------------


  // Task: start
  //
  // Executes this sequence, returning when the sequence has completed.
  //
  // The ~sequencer~ argument specifies the sequencer on which to run this
  // sequence. The sequencer must be compatible with the sequence.
  //
  // If ~parent_sequence~ is ~null~, then this sequence is a root parent,
  // otherwise it is a child of ~parent_sequence~. The ~parent_sequence~'s
  // pre_do, mid_do, and post_do methods will be called during the execution
  // of this sequence.
  //
  // By default, the ~priority~ of a sequence
  // is the priority of its parent sequence.
  // If it is a root sequence, its default priority is 100.
  // A different priority may be specified by ~this_priority~.
  // Higher numbers indicate higher priority.
  //
  // If ~call_pre_post~ is set to 1 (default), then the <pre_body> and
  // <post_body> tasks will be called before and after the sequence
  // <body> is called.

  virtual task start (uvm_sequencer_base sequencer,
                      uvm_sequence_base parent_sequence = null,
                      int this_priority = -1,
                      bit call_pre_post = 1);
    bit                  old_automatic_phase_objection;
     
    set_item_context(parent_sequence, sequencer);

    if (!(m_sequence_state inside {UVM_CREATED,UVM_STOPPED,UVM_FINISHED})) begin
      uvm_report_fatal("SEQ_NOT_DONE", 
         {"Sequence ", get_full_name(), " already started"},UVM_NONE);
    end

    if (m_parent_sequence != null) begin
       m_parent_sequence.children_array[this] = 1;
    end

    if (this_priority < -1) begin
      uvm_report_fatal("SEQPRI", $sformatf("Sequence %s start has illegal priority: %0d",
                                           get_full_name(),
                                           this_priority), UVM_NONE);
    end
    if (this_priority < 0) begin
       if (parent_sequence == null) this_priority = 100;
       else this_priority = parent_sequence.get_priority();
    end

    // Check that the response queue is empty from earlier runs
    clear_response_queue();

    m_priority           = this_priority;

    if (m_sequencer != null) begin
       integer handle;
       uvm_tr_stream stream;
       if (m_parent_sequence == null) begin
          stream = m_sequencer.get_tr_stream(get_name(), "Transactions");
          handle = m_sequencer.begin_tr(this, get_name());
          m_tr_recorder = uvm_recorder::get_recorder_from_handle(handle);
       end else begin
          stream = m_sequencer.get_tr_stream(get_root_sequence_name(), "Transactions");
          handle = m_sequencer.begin_child_tr(this, 
                                              (m_parent_sequence.m_tr_recorder == null) ? 0 : m_parent_sequence.m_tr_recorder.get_handle(), 
                                              get_root_sequence_name());
          m_tr_recorder = uvm_recorder::get_recorder_from_handle(handle);
       end
    end

    // Ensure that the sequence_id is intialized in case this sequence has been stopped previously
    set_sequence_id(-1);
    // Remove all sqr_seq_ids
    m_sqr_seq_ids.delete();

    // Register the sequence with the sequencer if defined.
    if (m_sequencer != null) begin
      void'(m_sequencer.m_register_sequence(this));
    end

    // Change the state to PRE_START, do this before the fork so that
    // the "if (!(m_sequence_state inside {...}" works
    m_sequence_state = UVM_PRE_START;
    fork
      begin
        m_sequence_process = process::self();

        // absorb delta to ensure PRE_START was seen
        #0;

        // Raise the objection if enabled
        // (This will lock the uvm_get_to_lock_dap)
        if (get_automatic_phase_objection()) begin
           m_safe_raise_starting_phase("automatic phase objection");
        end
         
        pre_start();

        if (call_pre_post == 1) begin
          m_sequence_state = UVM_PRE_BODY;
          #0;
          pre_body();
        end

        if (parent_sequence != null) begin
          parent_sequence.pre_do(0);    // task
          parent_sequence.mid_do(this); // function
        end

        m_sequence_state = UVM_BODY;
        #0;
        body();

        m_sequence_state = UVM_ENDED;
        #0;

        if (parent_sequence != null) begin
          parent_sequence.post_do(this);
        end

        if (call_pre_post == 1) begin
          m_sequence_state = UVM_POST_BODY;
          #0;
          post_body();
        end

        m_sequence_state = UVM_POST_START;
        #0;
        post_start();

        // Drop the objection if enabled
        if (get_automatic_phase_objection()) begin
           m_safe_drop_starting_phase("automatic phase objection");
        end
         
        m_sequence_state = UVM_FINISHED;
        #0;

      end
    join

    if (m_sequencer != null) begin      
      m_sequencer.end_tr(this);
    end
        
    // Clean up any sequencer queues after exiting; if we
    // were forcibly stoped, this step has already taken place
    if (m_sequence_state != UVM_STOPPED) begin
      if (m_sequencer != null)
        m_sequencer.m_sequence_exiting(this);
    end

    #0; // allow stopped and finish waiters to resume

    if ((m_parent_sequence != null) && (m_parent_sequence.children_array.exists(this))) begin
       m_parent_sequence.children_array.delete(this);
    end

    old_automatic_phase_objection = get_automatic_phase_objection();
    m_init_phase_daps(1);
    set_automatic_phase_objection(old_automatic_phase_objection);
  endtask


  // Task: pre_start
  //
  // This task is a user-definable callback that is called before the
  // optional execution of <pre_body>.
  // This method should not be called directly by the user.

  virtual task pre_start();  
    return;
  endtask


  // Task: pre_body
  //
  // This task is a user-definable callback that is called before the
  // execution of <body> ~only~ when the sequence is started with <start>.
  // If <start> is called with ~call_pre_post~ set to 0, ~pre_body~ is not
  // called.
  // This method should not be called directly by the user.

  virtual task pre_body();  
    return;
  endtask


  // Task: pre_do
  //
  // This task is a user-definable callback task that is called ~on the
  // parent sequence~, if any
  // sequence has issued a wait_for_grant() call and after the sequencer has
  // selected this sequence, and before the item is randomized.
  //
  // Although pre_do is a task, consuming simulation cycles may result in
  // unexpected behavior on the driver.
  //
  // This method should not be called directly by the user.

  virtual task pre_do(bit is_item);
    return;
  endtask


  // Function: mid_do
  //
  // This function is a user-definable callback function that is called after
  // the sequence item has been randomized, and just before the item is sent
  // to the driver.  This method should not be called directly by the user.

  virtual function void mid_do(uvm_sequence_item this_item);
    return;
  endfunction
  
  
  // Task: body
  //
  // This is the user-defined task where the main sequence code resides.
  // This method should not be called directly by the user.

  virtual task body();
    uvm_report_warning("uvm_sequence_base", "Body definition undefined");
    return;
  endtask  


  // Function: post_do
  //
  // This function is a user-definable callback function that is called after
  // the driver has indicated that it has completed the item, using either
  // this item_done or put methods. This method should not be called directly
  // by the user.

  virtual function void post_do(uvm_sequence_item this_item);
    return;
  endfunction


  // Task: post_body
  //
  // This task is a user-definable callback task that is called after the
  // execution of <body> ~only~ when the sequence is started with <start>.
  // If <start> is called with ~call_pre_post~ set to 0, ~post_body~ is not
  // called.
  // This task is a user-definable callback task that is called after the
  // execution of the body, unless the sequence is started with call_pre_post=0.
  // This method should not be called directly by the user.

  virtual task post_body();
    return;
  endtask
    

  // Task: post_start
  //
  // This task is a user-definable callback that is called after the
  // optional execution of <post_body>.
  // This method should not be called directly by the user.

  virtual task post_start();  
    return;
  endtask


  // Group: Run-Time Phasing
  //

  // Automatic Phase Objection DAP
  local uvm_get_to_lock_dap#(bit) m_automatic_phase_objection_dap;
  // Starting Phase DAP
  local uvm_get_to_lock_dap#(uvm_phase) m_starting_phase_dap;

  // Function- m_init_phase_daps
  // Either creates or renames DAPS
  function void m_init_phase_daps(bit create);
     string apo_name = $sformatf("%s.automatic_phase_objection", get_full_name());
     string sp_name = $sformatf("%s.starting_phase", get_full_name());

     if (create) begin
        m_automatic_phase_objection_dap = uvm_get_to_lock_dap#(bit)::type_id::create(apo_name, get_sequencer());
        m_starting_phase_dap = uvm_get_to_lock_dap#(uvm_phase)::type_id::create(sp_name, get_sequencer());
     end
     else begin
        m_automatic_phase_objection_dap.set_name(apo_name);
        m_starting_phase_dap.set_name(sp_name);
     end
  endfunction : m_init_phase_daps

`ifndef UVM_NO_DEPRECATED
 `define UVM_DEPRECATED_STARTING_PHASE
`endif

`ifdef UVM_DEPRECATED_STARTING_PHASE
  // DEPRECATED!! Use get/set_starting_phase accessors instead!
  uvm_phase starting_phase;
  // Value set via set_starting_phase
  uvm_phase m_set_starting_phase;
  // Ensures we only warn once per sequence
  bit m_warn_deprecated_set;
`endif 
   
  // Function: get_starting_phase
  // Returns the 'starting phase'.
  //
  // If non-~null~, the starting phase specifies the phase in which this
  // sequence was started.  The starting phase is set automatically when
  // this sequence is started as the default sequence on a sequencer.
  // See <uvm_sequencer_base::start_phase_sequence> for more information.
  //
  // Internally, the <uvm_sequence_base> uses an <uvm_get_to_lock_dap> to 
  // protect the starting phase value from being modified 
  // after the reference has been read.  Once the sequence has ended 
  // its execution (either via natural termination, or being killed),
  // then the starting phase value can be modified again.
  //
  function uvm_phase get_starting_phase();
`ifdef UVM_DEPRECATED_STARTING_PHASE
     begin
        bit throw_error;

        if (starting_phase != m_set_starting_phase) begin
           if (!m_warn_deprecated_set) begin
              `uvm_warning("UVM_DEPRECATED", "'starting_phase' is deprecated and not part of the UVM standard.  See documentation for uvm_sequence_base::set_starting_phase")
              m_warn_deprecated_set = 1;
           end
           
           if (m_starting_phase_dap.try_set(starting_phase))
             m_set_starting_phase = starting_phase;
           else begin
              uvm_phase dap_phase = m_starting_phase_dap.get();
              `uvm_error("UVM/SEQ/LOCK_DEPR",
                         {"The deprecated 'starting_phase' variable has been set to '",
                          (starting_phase == null) ? "<null>" : starting_phase.get_full_name(), 
                          "' after a call to get_starting_phase locked the value to '",
                          (dap_phase == null) ? "<null>" : dap_phase.get_full_name(), 
                          "'.  See documentation for uvm_sequence_base::set_starting_phase."})
           end
        end

     end
`endif
     return m_starting_phase_dap.get();
  endfunction : get_starting_phase

  // Function: set_starting_phase
  // Sets the 'starting phase'.
  //
  // Internally, the <uvm_sequence_base> uses a <uvm_get_to_lock_dap> to 
  // protect the starting phase value from being modified 
  // after the reference has been read.  Once the sequence has ended 
  // its execution (either via natural termination, or being killed),
  // then the starting phase value can be modified again.
  //
  function void set_starting_phase(uvm_phase phase);
`ifdef UVM_DEPRECATED_STARTING_PHASE
     begin
        if (starting_phase != m_set_starting_phase) begin
           if (!m_warn_deprecated_set) begin
              `uvm_warning("UVM_DEPRECATED", 
                           {"The deprecated 'starting_phase' variable has been set to '",
                            starting_phase.get_full_name(),
                            "' manually.  See documentation for uvm_sequence_base::set_starting_phase."})
              m_warn_deprecated_set = 1;
           end

           starting_phase = phase;
           m_set_starting_phase = phase;
        end
     end
`endif
           
     m_starting_phase_dap.set(phase);
  endfunction : set_starting_phase
   
  // Function: set_automatic_phase_objection
  // Sets the 'automatically object to starting phase' bit.
  //
  // The most common interaction with the starting phase
  // within a sequence is to simply ~raise~ the phase's objection
  // prior to executing the sequence, and ~drop~ the objection
  // after ending the sequence (either naturally, or
  // via a call to <kill>). In order to 
  // simplify this interaction for the user, the UVM
  // provides the ability to perform this functionality
  // automatically.
  //
  // For example:
  //| function my_sequence::new(string name="unnamed");
  //|   super.new(name);
  //|   set_automatic_phase_objection(1);
  //| endfunction : new
  //
  // From a timeline point of view, the automatic phase objection
  // looks like:
  //| start() is executed
  //|   --! Objection is raised !--
  //|   pre_start() is executed
  //|   pre_body() is optionally executed
  //|   body() is executed
  //|   post_body() is optionally executed
  //|   post_start() is executed
  //|   --! Objection is dropped !--
  //| start() unblocks
  //
  // This functionality can also be enabled in sequences
  // which were not written with UVM Run-Time Phasing in mind:
  //| my_legacy_seq_type seq = new("seq");
  //| seq.set_automatic_phase_objection(1);
  //| seq.start(my_sequencer);
  //
  // Internally, the <uvm_sequence_base> uses a <uvm_get_to_lock_dap> to 
  // protect the ~automatic_phase_objection~ value from being modified 
  // after the reference has been read.  Once the sequence has ended 
  // its execution (either via natural termination, or being killed),
  // then the ~automatic_phase_objection~ value can be modified again.
  //
  // NEVER set the automatic phase objection bit to 1 if your sequence
  // runs with a forever loop inside of the body, as the objection will
  // never get dropped!
  function void set_automatic_phase_objection(bit value);
     m_automatic_phase_objection_dap.set(value);
  endfunction : set_automatic_phase_objection

  // Function: get_automatic_phase_objection
  // Returns (and locks) the value of the 'automatically object to 
  // starting phase' bit.
  //
  // If 1, then the sequence will automatically raise an objection
  // to the starting phase (if the starting phase is not ~null~) immediately
  // prior to <pre_start> being called.  The objection will be dropped
  // after <post_start> has executed, or <kill> has been called.
  //
  function bit get_automatic_phase_objection();
     return m_automatic_phase_objection_dap.get();
  endfunction : get_automatic_phase_objection

  // m_safe_raise_starting_phase
  function void m_safe_raise_starting_phase(string description = "",
                                            int count = 1);
     uvm_phase starting_phase = get_starting_phase();
     if (starting_phase != null)
       starting_phase.raise_objection(this, description, count);
  endfunction : m_safe_raise_starting_phase

  // m_safe_drop_starting_phase
  function void m_safe_drop_starting_phase(string description = "",
                                           int count = 1);
     uvm_phase starting_phase = get_starting_phase();
     if (starting_phase != null)
       starting_phase.drop_objection(this, description, count);
  endfunction : m_safe_drop_starting_phase
   
  //------------------------
  // Group: Sequence Control
  //------------------------

  // Function: set_priority
  //
  // The priority of a sequence may be changed at any point in time.  When the
  // priority of a sequence is changed, the new priority will be used by the
  // sequencer the next time that it arbitrates between sequences.
  //
  // The default priority value for a sequence is 100.  Higher values result
  // in higher priorities.

  function void set_priority (int value);
    m_priority = value;
  endfunction


  // Function: get_priority
  //
  // This function returns the current priority of the sequence.

  function int get_priority();
    return m_priority;
  endfunction


  // Function: is_relevant
  //
  // The default is_relevant implementation returns 1, indicating that the
  // sequence is always relevant.
  //
  // Users may choose to override with their own virtual function to indicate
  // to the sequencer that the sequence is not currently relevant after a
  // request has been made.
  //
  // When the sequencer arbitrates, it will call is_relevant on each requesting,
  // unblocked sequence to see if it is relevant. If a 0 is returned, then the
  // sequence will not be chosen.
  //
  // If all requesting sequences are not relevant, then the sequencer will call
  // wait_for_relevant on all sequences and re-arbitrate upon its return.
  //
  // Any sequence that implements is_relevant must also implement
  // wait_for_relevant so that the sequencer has a way to wait for a
  // sequence to become relevant.

  virtual function bit is_relevant(); 
    is_rel_default = 1;
    return 1;
  endfunction


  // Task: wait_for_relevant
  //
  // This method is called by the sequencer when all available sequences are
  // not relevant.  When wait_for_relevant returns the sequencer attempt to
  // re-arbitrate. 
  //
  // Returning from this call does not guarantee a sequence is relevant,
  // although that would be the ideal. The method provide some delay to
  // prevent an infinite loop.
  //
  // If a sequence defines is_relevant so that it is not always relevant (by
  // default, a sequence is always relevant), then the sequence must also supply
  // a wait_for_relevant method.  

  virtual task wait_for_relevant();
    event e;
    wait_rel_default = 1;
    if (is_rel_default != wait_rel_default)
      uvm_report_fatal("RELMSM", 
        "is_relevant() was implemented without defining wait_for_relevant()", UVM_NONE);
    @e;  // this is intended to never return
  endtask
 

  // Task: lock
  //
  // Requests a lock on the specified sequencer. If sequencer is ~null~, the lock
  // will be requested on the current default sequencer.
  //
  // A lock request will be arbitrated the same as any other request.  A lock is
  // granted after all earlier requests are completed and no other locks or
  // grabs are blocking this sequence.
  //
  // The lock call will return when the lock has been granted.

  task lock(uvm_sequencer_base sequencer = null);
    if (sequencer == null)
      sequencer = m_sequencer;

    if (sequencer == null)
      uvm_report_fatal("LOCKSEQR", "Null m_sequencer reference", UVM_NONE);

    sequencer.lock(this);
  endtask


  // Task: grab
  // 
  // Requests a lock on the specified sequencer.  If no argument is supplied,
  // the lock will be requested on the current default sequencer.
  //
  // A grab request is put in front of the arbitration queue. It will be
  // arbitrated before any other requests. A grab is granted when no other grabs
  // or locks are blocking this sequence.
  //
  // The grab call will return when the grab has been granted.

  task grab(uvm_sequencer_base sequencer = null);
    if (sequencer == null) begin
      if (m_sequencer == null) begin
        uvm_report_fatal("GRAB", "Null m_sequencer reference", UVM_NONE);
      end
      m_sequencer.grab(this);
    end
    else begin
      sequencer.grab(this);
    end
  endtask


  // Function: unlock
  //
  // Removes any locks or grabs obtained by this sequence on the specified
  // sequencer. If sequencer is ~null~, then the unlock will be done on the
  // current default sequencer.

  function void  unlock(uvm_sequencer_base sequencer = null);
    if (sequencer == null) begin
      if (m_sequencer == null) begin
        uvm_report_fatal("UNLOCK", "Null m_sequencer reference", UVM_NONE);
      end
      m_sequencer.unlock(this);
    end else begin
      sequencer.unlock(this);
    end
  endfunction


  // Function: ungrab
  //
  // Removes any locks or grabs obtained by this sequence on the specified
  // sequencer. If sequencer is ~null~, then the unlock will be done on the
  // current default sequencer.

  function void  ungrab(uvm_sequencer_base sequencer = null);
    unlock(sequencer);
  endfunction


  // Function: is_blocked
  //
  // Returns a bit indicating whether this sequence is currently prevented from
  // running due to another lock or grab. A 1 is returned if the sequence is
  // currently blocked. A 0 is returned if no lock or grab prevents this
  // sequence from executing. Note that even if a sequence is not blocked, it
  // is possible for another sequence to issue a lock or grab before this
  // sequence can issue a request.

  function bit is_blocked();
    return m_sequencer.is_blocked(this);
  endfunction


  // Function: has_lock
  //
  // Returns 1 if this sequence has a lock, 0 otherwise.
  //
  // Note that even if this sequence has a lock, a child sequence may also have
  // a lock, in which case the sequence is still blocked from issuing
  // operations on the sequencer.

  function bit has_lock();
    return m_sequencer.has_lock(this);
  endfunction


  // Function: kill
  //
  // This function will kill the sequence, and cause all current locks and
  // requests in the sequence's default sequencer to be removed. The sequence
  // state will change to UVM_STOPPED, and the post_body() and post_start() callback
  // methods will not be executed.
  //
  // If a sequence has issued locks, grabs, or requests on sequencers other than
  // the default sequencer, then care must be taken to unregister the sequence
  // with the other sequencer(s) using the sequencer unregister_sequence() 
  // method.

  function void kill();
    if (m_sequence_process != null) begin
      // If we are not connected to a sequencer, then issue
      // kill locally.
      if (m_sequencer == null) begin
        m_kill();
        // We need to drop the objection if we raised it...
        if (get_automatic_phase_objection()) begin
           m_safe_drop_starting_phase("automatic phase objection");
        end
        return;
      end
      // If we are attached to a sequencer, then the sequencer
      // will clear out queues, and then kill this sequence
      m_sequencer.kill_sequence(this);
      // We need to drop the objection if we raised it...
      if (get_automatic_phase_objection()) begin
         m_safe_drop_starting_phase("automatic phase objection");
      end
      return;
    end
  endfunction


  // Function: do_kill
  // 
  // This function is a user hook that is called whenever a sequence is
  // terminated by using either sequence.kill() or sequencer.stop_sequences()
  // (which effectively calls sequence.kill()).

  virtual function void do_kill();
    return;
  endfunction

  function void m_kill();
    do_kill();
    foreach(children_array[i]) begin
       i.kill();
    end
    if (m_sequence_process != null) begin
      m_sequence_process.kill;
      m_sequence_process = null;
    end
    m_sequence_state = UVM_STOPPED;
    if ((m_parent_sequence != null) && (m_parent_sequence.children_array.exists(this)))
      m_parent_sequence.children_array.delete(this);
  endfunction


  //-------------------------------
  // Group: Sequence Item Execution
  //-------------------------------

  // Function: create_item
  //
  // Create_item will create and initialize a sequence_item or sequence
  // using the factory.  The sequence_item or sequence will be initialized
  // to communicate with the specified sequencer.

  protected function uvm_sequence_item create_item(uvm_object_wrapper type_var, 
                                                   uvm_sequencer_base l_sequencer, string name);

    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    $cast(create_item,  factory.create_object_by_type( type_var, this.get_full_name(), name ));

    create_item.set_item_context(this, l_sequencer);
  endfunction


  // Function: start_item
  //
  // ~start_item~ and <finish_item> together will initiate operation of
  // a sequence item.  If the item has not already been
  // initialized using create_item, then it will be initialized here to use
  // the default sequencer specified by m_sequencer.  Randomization
  // may be done between start_item and finish_item to ensure late generation
  //

  virtual task start_item (uvm_sequence_item item,
                           int set_priority = -1,
                           uvm_sequencer_base sequencer=null);
    uvm_sequence_base seq;
     
    if(item == null) begin
      uvm_report_fatal("NULLITM",
         {"attempting to start a null item from sequence '",
          get_full_name(), "'"}, UVM_NONE);
      return;
    end
          
    if($cast(seq, item)) begin
      uvm_report_fatal("SEQNOTITM",
         {"attempting to start a sequence using start_item() from sequence '",
          get_full_name(), "'. Use seq.start() instead."}, UVM_NONE);
      return;
    end
          
    if (sequencer == null)
        sequencer = item.get_sequencer();
        
    if(sequencer == null)
        sequencer = get_sequencer();   
        
    if(sequencer == null) begin
        uvm_report_fatal("SEQ",{"neither the item's sequencer nor dedicated sequencer has been supplied to start item in ",get_full_name()},UVM_NONE);
       return;
    end

    item.set_item_context(this, sequencer);

    if (set_priority < 0)
      set_priority = get_priority();
    
    sequencer.wait_for_grant(this, set_priority);

    if (sequencer.is_auto_item_recording_enabled()) begin
      void'(sequencer.begin_child_tr(item, 
                                     (m_tr_recorder == null) ? 0 : m_tr_recorder.get_handle(), 
                                     item.get_root_sequence_name(), "Transactions"));
    end
    
    pre_do(1);

  endtask  


  // Function: finish_item
  //
  // finish_item, together with start_item together will initiate operation of 
  // a sequence_item.  Finish_item must be called
  // after start_item with no delays or delta-cycles.  Randomization, or other
  // functions may be called between the start_item and finish_item calls.
  //

  virtual task finish_item (uvm_sequence_item item,
                            int set_priority = -1);

    uvm_sequencer_base sequencer;
    
    sequencer = item.get_sequencer();

    if (sequencer == null) begin
        uvm_report_fatal("STRITM", "sequence_item has null sequencer", UVM_NONE);
    end

    mid_do(item);
    sequencer.send_request(this, item);
    sequencer.wait_for_item_done(this, -1);

    if (sequencer.is_auto_item_recording_enabled()) begin
      sequencer.end_tr(item);
    end

    post_do(item);

  endtask

  
  // Task: wait_for_grant
  //
  // This task issues a request to the current sequencer.  If item_priority is
  // not specified, then the current sequence priority will be used by the
  // arbiter. If a lock_request is made, then the sequencer will issue a lock
  // immediately before granting the sequence.  (Note that the lock may be
  // granted without the sequence being granted if is_relevant is not asserted).
  //
  // When this method returns, the sequencer has granted the sequence, and the
  // sequence must call send_request without inserting any simulation delay
  // other than delta cycles.  The driver is currently waiting for the next
  // item to be sent via the send_request call.

  virtual task wait_for_grant(int item_priority = -1, bit lock_request = 0);
    if (m_sequencer == null) begin
      uvm_report_fatal("WAITGRANT", "Null m_sequencer reference", UVM_NONE);
    end
    m_sequencer.wait_for_grant(this, item_priority, lock_request);
  endtask


  // Function: send_request
  //
  // The send_request function may only be called after a wait_for_grant call. 
  // This call will send the request item to the sequencer, which will forward
  // it to the driver. If the rerandomize bit is set, the item will be
  // randomized before being sent to the driver.

  virtual function void send_request(uvm_sequence_item request, bit rerandomize = 0);
    if (m_sequencer == null) begin
        uvm_report_fatal("SENDREQ", "Null m_sequencer reference", UVM_NONE);
      end
    m_sequencer.send_request(this, request, rerandomize);
  endfunction


  // Task: wait_for_item_done
  //
  // A sequence may optionally call wait_for_item_done.  This task will block
  // until the driver calls item_done or put.  If no transaction_id parameter
  // is specified, then the call will return the next time that the driver calls
  // item_done or put.  If a specific transaction_id is specified, then the call
  // will return when the driver indicates completion of that specific item.
  //
  // Note that if a specific transaction_id has been specified, and the driver
  // has already issued an item_done or put for that transaction, then the call
  // will hang, having missed the earlier notification.


  virtual task wait_for_item_done(int transaction_id = -1);
    if (m_sequencer == null) begin
        uvm_report_fatal("WAITITEMDONE", "Null m_sequencer reference", UVM_NONE);
      end
    m_sequencer.wait_for_item_done(this, transaction_id);
  endtask



  // Group: Response API
  //--------------------

  // Function: use_response_handler
  //
  // When called with enable set to 1, responses will be sent to the response
  // handler. Otherwise, responses must be retrieved using get_response.
  //
  // By default, responses from the driver are retrieved in the sequence by
  // calling get_response.
  //
  // An alternative method is for the sequencer to call the response_handler
  // function with each response.

  function void use_response_handler(bit enable);
    m_use_response_handler = enable;
  endfunction


  // Function: get_use_response_handler
  //
  // Returns the state of the use_response_handler bit.

  function bit get_use_response_handler();
    return m_use_response_handler;
  endfunction


  // Function: response_handler
  //
  // When the use_response_handler bit is set to 1, this virtual task is called
  // by the sequencer for each response that arrives for this sequence.

  virtual function void response_handler(uvm_sequence_item response);
    return;
  endfunction


  // Function: set_response_queue_error_report_disabled
  //
  // By default, if the response_queue overflows, an error is reported. The
  // response_queue will overflow if more responses are sent to this sequence
  // from the driver than get_response calls are made. Setting value to 0
  // disables these errors, while setting it to 1 enables them.

  function void set_response_queue_error_report_disabled(bit value);
    response_queue_error_report_disabled = value;
  endfunction

  
  // Function: get_response_queue_error_report_disabled
  //
  // When this bit is 0 (default value), error reports are generated when
  // the response queue overflows. When this bit is 1, no such error
  // reports are generated.

  function bit get_response_queue_error_report_disabled();
    return response_queue_error_report_disabled;
  endfunction


  // Function: set_response_queue_depth
  //
  // The default maximum depth of the response queue is 8. These method is used
  // to examine or change the maximum depth of the response queue.
  //
  // Setting the response_queue_depth to -1 indicates an arbitrarily deep
  // response queue.  No checking is done.

  function void set_response_queue_depth(int value);
    response_queue_depth = value;
  endfunction  


  // Function: get_response_queue_depth
  //
  // Returns the current depth setting for the response queue.

  function int get_response_queue_depth();
    return response_queue_depth;
  endfunction  


  // Function: clear_response_queue
  //
  // Empties the response queue for this sequence.

  virtual function void clear_response_queue();
    response_queue.delete();
  endfunction


  virtual function void put_base_response(input uvm_sequence_item response);
    if ((response_queue_depth == -1) ||
        (response_queue.size() < response_queue_depth)) begin
      response_queue.push_back(response);
      return;
    end
    if (response_queue_error_report_disabled == 0) begin
      uvm_report_error(get_full_name(), "Response queue overflow, response was dropped", UVM_NONE);
    end
  endfunction


  // Function- put_response
  //
  // Internal method.

  virtual function void put_response (uvm_sequence_item response_item);
    put_base_response(response_item); // no error-checking
  endfunction


  // Function- get_base_response

  virtual task get_base_response(output uvm_sequence_item response, input int transaction_id = -1);

    int queue_size, i;

    if (response_queue.size() == 0)
      wait (response_queue.size() != 0);

    if (transaction_id == -1) begin
      response = response_queue.pop_front();
      return;
    end

    forever begin
      queue_size = response_queue.size();
      for (i = 0; i < queue_size; i++) begin
        if (response_queue[i].get_transaction_id() == transaction_id) 
          begin
            $cast(response,response_queue[i]);
            response_queue.delete(i);
            return;
          end
      end
      wait (response_queue.size() != queue_size);
    end
  endtask



  //------------------------
  // Group- Sequence Library DEPRECATED
  //------------------------

`ifndef UVM_NO_DEPRECATED

  // Variable- seq_kind
  //
  // Used as an identifier in constraints for a specific sequence type.

  rand int unsigned seq_kind;

  // For user random selection. This excludes the exhaustive and
  // random sequences.
  constraint pick_sequence { 
       (num_sequences() <= 2) || (seq_kind >= 2);
       (seq_kind <  num_sequences()) || (seq_kind == 0); }


  // Function- num_sequences
  // 
  // Returns the number of sequences in the sequencer's sequence library.

  function int num_sequences();
    if (m_sequencer == null)
      return 0;
    return (m_sequencer.num_sequences());
  endfunction



  // Function- get_seq_kind
  //
  // This function returns an int representing the sequence kind that has
  // been registerd with the sequencer.  The return value may be used with
  // the <get_sequence> or <do_sequence_kind> methods.

  function int get_seq_kind(string type_name);
    `uvm_warning("UVM_DEPRECATED",$sformatf("%m deprecated."))
    if(m_sequencer != null)
      return m_sequencer.get_seq_kind(type_name);
    else 
      uvm_report_warning("NULLSQ", $sformatf("%0s sequencer is null.",
                                           get_type_name()), UVM_NONE);
  endfunction


  // Function- get_sequence
  //
  // This function returns a reference to a sequence specified by ~req_kind~,
  // which can be obtained using the <get_seq_kind> method.

  function uvm_sequence_base get_sequence(int unsigned req_kind);
    uvm_sequence_base m_seq;
    string m_seq_type;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    `uvm_warning("UVM_DEPRECATED",$sformatf("%m deprecated."))
    if (req_kind < 0 || req_kind >= m_sequencer.sequences.size()) begin
      uvm_report_error("SEQRNG", 
        $sformatf("Kind arg '%0d' out of range. Need 0-%0d",
        req_kind, m_sequencer.sequences.size()-1), UVM_NONE);
    end
    m_seq_type = m_sequencer.sequences[req_kind];
    if (!$cast(m_seq, factory.create_object_by_name(m_seq_type, get_full_name(), m_seq_type))) begin
      uvm_report_fatal("FCTSEQ", 
        $sformatf("Factory cannot produce a sequence of type %0s.",
        m_seq_type), UVM_NONE);
    end
    m_seq.set_use_sequence_info(1);
    return m_seq;
  endfunction


  // Task- do_sequence_kind
  //
  // This task will start a sequence of kind specified by ~req_kind~,
  // which can be obtained using the <get_seq_kind> method.

  task do_sequence_kind(int unsigned req_kind);
    string m_seq_type;
    uvm_sequence_base m_seq;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    `uvm_warning("UVM_DEPRECATED",$sformatf("%m deprecated."))
    m_seq_type = m_sequencer.sequences[req_kind];
    if (!$cast(m_seq, factory.create_object_by_name(m_seq_type, get_full_name(), m_seq_type))) begin
      uvm_report_fatal("FCTSEQ", 
        $sformatf("Factory cannot produce a sequence of type %0s.", m_seq_type), UVM_NONE);
    end

    m_seq.set_item_context(this, m_sequencer);
    
    if(!m_seq.randomize()) begin
      uvm_report_warning("RNDFLD", "Randomization failed in do_sequence_kind()");
    end
    m_seq.start(m_sequencer,this,get_priority(),0);
  endtask


  // Function- get_sequence_by_name
  //
  // Internal method.

  function uvm_sequence_base get_sequence_by_name(string seq_name);
    uvm_sequence_base m_seq;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    `uvm_warning("UVM_DEPRECATED",$sformatf("%m deprecated."))
    if (!$cast(m_seq, factory.create_object_by_name(seq_name, get_full_name(), seq_name))) begin
      uvm_report_fatal("FCTSEQ", 
        $sformatf("Factory cannot produce a sequence of type %0s.", seq_name), UVM_NONE);
    end
    m_seq.set_use_sequence_info(1);
    return m_seq;
  endfunction


  // Task- create_and_start_sequence_by_name
  //
  // Internal method.

  task create_and_start_sequence_by_name(string seq_name);
    uvm_sequence_base m_seq;
    `uvm_warning("UVM_DEPRECATED",$sformatf("%m deprecated."))
    m_seq = get_sequence_by_name(seq_name);
    m_seq.start(m_sequencer, this, this.get_priority(), 0);
  endtask


`endif // UVM_NO_DEPRECATED

  //----------------------
  // Misc Internal methods
  //----------------------


  // m_get_sqr_sequence_id
  // ---------------------

  function int m_get_sqr_sequence_id(int sequencer_id, bit update_sequence_id);
    if (m_sqr_seq_ids.exists(sequencer_id)) begin
      if (update_sequence_id == 1) begin
        set_sequence_id(m_sqr_seq_ids[sequencer_id]);
      end
      return m_sqr_seq_ids[sequencer_id];
    end

    if (update_sequence_id == 1)
      set_sequence_id(-1);

    return -1;
  endfunction
  

  // m_set_sqr_sequence_id
  // ---------------------

  function void m_set_sqr_sequence_id(int sequencer_id, int sequence_id);
    m_sqr_seq_ids[sequencer_id] = sequence_id;
    set_sequence_id(sequence_id);
  endfunction

endclass                

