//
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// CLASS: uvm_packer
//
// The uvm_packer class provides a policy object for packing and unpacking
// uvm_objects. The policies determine how packing and unpacking should be done.
// Packing an object causes the object to be placed into a bit (byte or int)
// array. If the `uvm_field_* macro are used to implement pack and unpack,
// by default no metadata information is stored for the packing of dynamic
// objects (strings, arrays, class objects).
//
//-------------------------------------------------------------------------------

typedef bit signed [(`UVM_PACKER_MAX_BYTES*8)-1:0] uvm_pack_bitstream_t;

class uvm_packer;

  //----------------//
  // Group: Packing //
  //----------------//
  
  // Function: pack_field
  //
  // Packs an integral value (less than or equal to 4096 bits) into the
  // packed array. ~size~ is the number of bits of ~value~ to pack.

  extern virtual function void pack_field (uvm_bitstream_t value, int size);


  // Function: pack_field_int
  //
  // Packs the integral value (less than or equal to 64 bits) into the
  // pack array.  The ~size~ is the number of bits to pack, usually obtained by
  // ~$bits~. This optimized version of <pack_field> is useful for sizes up
  // to 64 bits.

  extern virtual function void pack_field_int (uvm_integral_t value, int size);

  // Function: pack_bits
  //
  // Packs bits from upacked array of bits into the pack array.
  //
  // See <pack_ints> for additional information.
  extern virtual function void pack_bits(ref bit value[], input int size = -1);

  // Function: pack_bytes
  //
  // Packs bits from an upacked array of bytes into the pack array.
  //
  // See <pack_ints> for additional information.
  extern virtual function void pack_bytes(ref byte value[], input int size = -1);

  // Function: pack_ints
  // 
  // Packs bits from an unpacked array of ints into the pack array.
  //
  // The bits are appended to the internal pack array.  
  // This method allows for fields of arbitrary length to be 
  // passed in, using the SystemVerilog ~stream~ operator.
  //
  // For example
  // | bit[511:0] my_field;
  // | begin
  // |   int my_stream[];
  // |   { << int {my_stream}} = my_field;
  // |   packer.pack_ints(my_stream);
  // | end
  //
  // When appending the stream to the internal pack array, the packer will obey
  // the value of <big_endian> (appending the array from MSB to LSB if set).
  //
  // An optional ~size~ parameter is provided, which defaults to '-1'.  If set
  // to any value greater than '-1' (including 0), then the packer will use
  // the size as the number of bits to pack, otherwise the packer will simply
  // pack the entire stream.
  //
  // An error will be asserted if the ~size~ has been specified, and exceeds the
  // size of the source array.
  //
  extern virtual function void pack_ints(ref int value[], input int size = -1);

   
  // Function: pack_string
  //
  // Packs a string value into the pack array. 
  //
  // When the metadata flag is set, the packed string is terminated by a ~null~
  // character to mark the end of the string.
  //
  // This is useful for mixed language communication where unpacking may occur
  // outside of SystemVerilog UVM.

  extern virtual function void pack_string (string value);


  // Function: pack_time
  //
  // Packs a time ~value~ as 64 bits into the pack array.

  extern virtual function void pack_time (time value); 


  // Function: pack_real
  //
  // Packs a real ~value~ as 64 bits into the pack array. 
  //
  // The real ~value~ is converted to a 6-bit scalar value using the function
  // $real2bits before it is packed into the array.

  extern virtual function void pack_real (real value);


  // Function: pack_object
  //
  // Packs an object value into the pack array. 
  //
  // A 4-bit header is inserted ahead of the string to indicate the number of
  // bits that was packed. If a ~null~ object was packed, then this header will
  // be 0. 
  //
  // This is useful for mixed-language communication where unpacking may occur
  // outside of SystemVerilog UVM.

  extern virtual function void pack_object (uvm_object value);


  //------------------//
  // Group: Unpacking //
  //------------------//
  
  // Function: is_null
  //
  // This method is used during unpack operations to peek at the next 4-bit
  // chunk of the pack data and determine if it is 0.
  //
  // If the next four bits are all 0, then the return value is a 1; otherwise
  // it is 0. 
  //
  // This is useful when unpacking objects, to decide whether a new object
  // needs to be allocated or not.

  extern virtual function bit is_null ();


  // Function: unpack_field
  //
  // Unpacks bits from the pack array and returns the bit-stream that was
  // unpacked. ~size~ is the number of bits to unpack; the maximum is 4096 bits.

  extern virtual function uvm_bitstream_t unpack_field (int size);

  // Function: unpack_field_int
  //
  // Unpacks bits from the pack array and returns the bit-stream that was
  // unpacked. 
  //
  // ~size~ is the number of bits to unpack; the maximum is 64 bits. 
  // This is a more efficient variant than unpack_field when unpacking into
  // smaller vectors.

  extern virtual function uvm_integral_t unpack_field_int (int size);

  // Function: unpack_bits
  //
  // Unpacks bits from the pack array into an unpacked array of bits.
  //
  extern virtual function void unpack_bits(ref bit value[], input int size = -1);

  // Function: unpack_bytes
  //
  // Unpacks bits from the pack array into an unpacked array of bytes.
  //
  extern virtual function void unpack_bytes(ref byte value[], input int size = -1);

  // Function: unpack_ints
  //
  // Unpacks bits from the pack array into an unpacked array of ints.
  //
  // The unpacked array is unpacked from the internal pack array.  
  // This method allows for fields of arbitrary length to be 
  // passed in without expanding into a pre-defined integral type first.
  //
  // For example
  // | bit[511:0] my_field;
  // | begin
  // |   int my_stream[] = new[16]; // 512/32 = 16
  // |   packer.unpack_ints(my_stream);
  // |   my_field = {<<{my_stream}};
  // | end
  //
  // When unpacking the stream from the internal pack array, the packer will obey
  // the value of <big_endian> (unpacking the array from MSB to LSB if set).
  //
  // An optional ~size~ parameter is provided, which defaults to '-1'.  If set
  // to any value greater than '-1' (including 0), then the packer will use
  // the size as the number of bits to unpack, otherwise the packer will simply
  // unpack the entire stream.
  //
  // An error will be asserted if the ~size~ has been specified, and
  // exceeds the size of the target array.
  //
  extern virtual function void unpack_ints(ref int value[], input int size = -1);
   

  // Function: unpack_string
  //
  // Unpacks a string. 
  //
  // num_chars bytes are unpacked into a string. If num_chars is -1 then
  // unpacking stops on at the first ~null~ character that is encountered.

  extern virtual function string unpack_string (int num_chars=-1);


  // Function: unpack_time
  //
  // Unpacks the next 64 bits of the pack array and places them into a
  // time variable.

  extern virtual function time unpack_time (); 


  // Function: unpack_real
  //
  // Unpacks the next 64 bits of the pack array and places them into a
  // real variable. 
  //
  // The 64 bits of packed data are converted to a real using the $bits2real
  // system function.

  extern virtual function real unpack_real ();


  // Function: unpack_object
  //
  // Unpacks an object and stores the result into ~value~. 
  //
  // ~value~ must be an allocated object that has enough space for the data
  // being unpacked. The first four bits of packed data are used to determine
  // if a ~null~ object was packed into the array.
  //
  // The <is_null> function can be used to peek at the next four bits in
  // the pack array before calling this method.

  extern virtual function void unpack_object (uvm_object value);


  // Function: get_packed_size
  //
  // Returns the number of bits that were packed.

  extern virtual function int get_packed_size(); 


  //------------------//
  // Group: Variables //
  //------------------//

  // Variable: physical
  //
  // This bit provides a filtering mechanism for fields.
  //
  // The <abstract> and physical settings allow an object to distinguish between
  // two different classes of fields. It is up to you, in the
  // <uvm_object::do_pack> and <uvm_object::do_unpack> methods, to test the
  // setting of this field if you want to use it as a filter.

  bit physical = 1;


  // Variable: abstract
  //
  // This bit provides a filtering mechanism for fields. 
  //
  // The abstract and physical settings allow an object to distinguish between
  // two different classes of fields. It is up to you, in the
  // <uvm_object::do_pack> and <uvm_object::do_unpack> routines, to test the
  // setting of this field if you want to use it as a filter.

  bit abstract;


  // Variable: use_metadata
  //
  // This flag indicates whether to encode metadata when packing dynamic data,
  // or to decode metadata when unpacking.  Implementations of <uvm_object::do_pack>
  // and <uvm_object::do_unpack> should regard this bit when performing their
  // respective operation. When set, metadata should be encoded as follows:
  //
  // - For strings, pack an additional ~null~ byte after the string is packed.
  //
  // - For objects, pack 4 bits prior to packing the object itself. Use 4'b0000
  //   to indicate the object being packed is ~null~, otherwise pack 4'b0001 (the
  //   remaining 3 bits are reserved).
  //
  // - For queues, dynamic arrays, and associative arrays, pack 32 bits
  //   indicating the size of the array prior to packing individual elements.

  bit use_metadata;


  // Variable: big_endian
  //
  // This bit determines the order that integral data is packed (using
  // <pack_field>, <pack_field_int>, <pack_time>, or <pack_real>) and how the
  // data is unpacked from the pack array (using <unpack_field>,
  // <unpack_field_int>, <unpack_time>, or <unpack_real>). When the bit is set,
  // data is associated msb to lsb; otherwise, it is associated lsb to msb. 
  //
  // The following code illustrates how data can be associated msb to lsb and
  // lsb to msb:
  //
  //|  class mydata extends uvm_object;
  //|
  //|    logic[15:0] value = 'h1234;
  //|
  //|    function void do_pack (uvm_packer packer);
  //|      packer.pack_field_int(value, 16);
  //|    endfunction
  //|
  //|    function void do_unpack (uvm_packer packer);
  //|      value = packer.unpack_field_int(16);
  //|    endfunction
  //|  endclass
  //|
  //|  mydata d = new;
  //|  bit bits[];
  //|
  //|  initial begin
  //|    d.pack(bits);  // 'b0001001000110100
  //|    uvm_default_packer.big_endian = 0;
  //|    d.pack(bits);  // 'b0010110001001000
  //|  end

  bit big_endian = 1;


  // variables and methods primarily for internal use

  static bit bitstream[];   // local bits for (un)pack_bytes
  static bit fabitstream[]; // field automation bits for (un)pack_bytes
  int count;                // used to count the number of packed bits
  uvm_scope_stack scope= new;

  bit   reverse_order;      //flip the bit order around
  byte  byte_size     = 8;  //set up bytesize for endianess
  int   word_size     = 16; //set up worksize for endianess
  bit   nopack;             //only count packable bits

  uvm_recursion_policy_enum policy = UVM_DEFAULT_POLICY;

  uvm_pack_bitstream_t m_bits;
  int m_packed_size;

  extern virtual function void unpack_object_ext  (inout uvm_object value);

  extern virtual function uvm_pack_bitstream_t get_packed_bits ();

  extern virtual function bit  unsigned get_bit  (int unsigned index);
  extern virtual function byte unsigned get_byte (int unsigned index);
  extern virtual function int  unsigned get_int  (int unsigned index);

  extern virtual function void get_bits (ref bit unsigned bits[]);
  extern virtual function void get_bytes(ref byte unsigned bytes[]);
  extern virtual function void get_ints (ref int unsigned ints[]);

  extern virtual function void put_bits (ref bit unsigned bitstream[]);
  extern virtual function void put_bytes(ref byte unsigned bytestream[]);
  extern virtual function void put_ints (ref int unsigned intstream[]);

  extern virtual function void set_packed_size(); 
  extern function void index_error(int index, string id, int sz);
  extern function bit enough_bits(int needed, string id);

  extern function void reset();

endclass



//------------------------------------------------------------------------------
// IMPLEMENTATION
//------------------------------------------------------------------------------

// NOTE- max size limited to BITSTREAM bits parameter (default: 4096)


// index_ok
// --------

function void uvm_packer::index_error(int index, string id, int sz);
    uvm_report_error("PCKIDX", 
        $sformatf("index %0d for get_%0s too large; valid index range is 0-%0d.",
                  index,id,((m_packed_size+sz-1)/sz)-1), UVM_NONE);
endfunction


// enough_bits
// -----------

function bit uvm_packer::enough_bits(int needed, string id);
  if ((m_packed_size - count) < needed) begin
    uvm_report_error("PCKSZ",
        $sformatf("%0d bits needed to unpack %0s, yet only %0d available.",
                  needed, id, (m_packed_size - count)), UVM_NONE);
    return 0;
  end
  return 1;
endfunction


// get_packed_size
// ---------------

function int uvm_packer::get_packed_size();
  return m_packed_size;
endfunction


// set_packed_size
// ---------------

function void uvm_packer::set_packed_size();
  m_packed_size = count;
  count = 0;
endfunction


// reset
// -----

function void uvm_packer::reset();
  count = 0;
  m_bits = 0;
  m_packed_size = 0;
endfunction


// get_packed_bits
// ---------------

function uvm_pack_bitstream_t uvm_packer::get_packed_bits();
  //bits = m_bits;
  return m_bits;
endfunction


// get_bits
// --------

function void uvm_packer::get_bits(ref bit unsigned bits[]);
  bits = new[m_packed_size];
  for (int i=0;i<m_packed_size;i++)
    bits[i] = m_bits[i];
endfunction


// get_bytes
// ---------

function void uvm_packer::get_bytes(ref byte unsigned bytes[]);
  int sz;
  byte v;
  sz = (m_packed_size+7) / 8;
  bytes = new[sz];
  for (int i=0;i<sz;i++) begin
    if (i != sz-1 || (m_packed_size % 8) == 0) 
      v = m_bits[ i*8 +: 8 ];
    else
      v = m_bits[ i*8 +: 8 ] & ('hFF >> (8-(m_packed_size%8)));
    if(big_endian) begin
      byte tmp; tmp = v;
      for(int j=0; j<8; ++j) v[j] = tmp[7-j];
    end
    bytes[i] = v;
  end
endfunction


// get_ints
// --------

function void uvm_packer::get_ints(ref int unsigned ints[]);
  int sz, v;
  sz = (m_packed_size+31) / 32;
  ints = new[sz];
  for (int i=0;i<sz;i++) begin
    if (i != sz-1 || (m_packed_size % 32) == 0) 
      v = m_bits[ i*32 +: 32 ];
    else
      v = m_bits[ i*32 +: 32 ] & ('hFFFFFFFF >> (32-(m_packed_size%32)));
    if(big_endian) begin
      int tmp; tmp = v;
      for(int j=0; j<32; ++j) v[j] = tmp[31-j];
    end
    ints[i] = v;
  end
endfunction


// put_bits
// --------

function void uvm_packer::put_bits (ref bit bitstream []);

  int bit_size;

  bit_size = bitstream.size();

  if(big_endian)
    for (int i=bit_size-1;i>=0;i--)
      m_bits[i] = bitstream[i];
  else
    for (int i=0;i<bit_size;i++)
      m_bits[i] = bitstream[i];

  m_packed_size = bit_size;
  count = 0;
 
endfunction

// put_bytes
// ---------

function void uvm_packer::put_bytes (ref byte unsigned bytestream []);

  int byte_size;
  int index;
  byte unsigned b;

  byte_size = bytestream.size();
  index = 0;
  for (int i=0;i<byte_size;i++) begin
    b = bytestream[i];
    if(big_endian) begin
      byte unsigned tb; tb = b;
      for(int j=0;j<8;++j) b[j] = tb[7-j];
    end
    m_bits[index +:8] = b;
    index += 8;
  end

  m_packed_size = byte_size*8;
  count = 0;
endfunction


// put_ints
// --------

function void uvm_packer::put_ints (ref int unsigned intstream []);

  int int_size;
  int index;
  int unsigned v;

  int_size = intstream.size();

  index = 0;
  for (int i=0;i<int_size;i++) begin
    v = intstream[i];
    if(big_endian) begin
      int unsigned tv; tv = v;
      for(int j=0;j<32;++j) v[j] = tv[31-j];
    end
    m_bits[index +:32] = v;
    index += 32;
  end

  m_packed_size = int_size*32;
  count = 0;
endfunction




// get_bit
// -------

function bit unsigned uvm_packer::get_bit(int unsigned index);
  if (index >= m_packed_size)
    index_error(index, "bit",1);
  return m_bits[index];
endfunction


// get_byte
// --------

function byte unsigned uvm_packer::get_byte(int unsigned index);
  if (index >= (m_packed_size+7)/8)
    index_error(index, "byte",8);
  return m_bits[index*8 +: 8];
endfunction


// get_int
// -------

function int unsigned uvm_packer::get_int(int unsigned index);
  if (index >= (m_packed_size+31)/32)
    index_error(index, "int",32);
  return m_bits[(index*32) +: 32];
endfunction


// PACK


// pack_object
// ---------

function void uvm_packer::pack_object(uvm_object value);

  if(value.__m_uvm_status_container.cycle_check.exists(value)) begin
    uvm_report_warning("CYCFND", $sformatf("Cycle detected for object @%0d during pack", value.get_inst_id()), UVM_NONE);
    return;
  end
  value.__m_uvm_status_container.cycle_check[value] = 1;

  if((policy != UVM_REFERENCE) && (value != null) ) begin
      if(use_metadata == 1) begin
        m_bits[count +: 4] = 1;
        count += 4; // to better debug when display packed bits in hexadecimal
      end
      scope.down(value.get_name());
      value.__m_uvm_field_automation(null, UVM_PACK,"");
      value.do_pack(this);
      scope.up();
  end
  else if(use_metadata == 1) begin
    m_bits[count +: 4] = 0;
    count += 4;
  end
  value.__m_uvm_status_container.cycle_check.delete(value);
endfunction

  
// pack_real
// ---------

function void uvm_packer::pack_real(real value);
  pack_field_int($realtobits(value), 64);
endfunction
  

// pack_time
// ---------

function void uvm_packer::pack_time(time value);
  pack_field_int(value, 64);
  //m_bits[count +: 64] = value; this overwrites endian adjustments
endfunction
  

// pack_field
// ----------

function void uvm_packer::pack_field(uvm_bitstream_t value, int size);
  for (int i=0; i<size; i++)
    if(big_endian == 1)
      m_bits[count+i] = value[size-1-i];
    else
      m_bits[count+i] = value[i];
  count += size;
endfunction
  

// pack_field_int
// --------------

function void uvm_packer::pack_field_int(uvm_integral_t value, int size);
  for (int i=0; i<size; i++)
    if(big_endian == 1)
      m_bits[count+i] = value[size-1-i];
    else
      m_bits[count+i] = value[i];
  count += size;
endfunction
  
// pack_bits
// -----------------

function void uvm_packer::pack_bits(ref bit value[], input int size = -1);
   if (size < 0)
     size = value.size();

   if (size > value.size()) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("pack_bits called with size '%0d', which exceeds value.size() of '%0d'",
                           size,
                           value.size()))
      return;
   end
   
   for (int i=0; i<size; i++)
     if (big_endian == 1)
       m_bits[count+i] = value[size-1-i];
     else
       m_bits[count+i] = value[i];
   count += size;
endfunction 

// pack_bytes
// -----------------

function void uvm_packer::pack_bytes(ref byte value[], input int size = -1);
   int max_size = value.size() * $bits(byte);
   
   if (size < 0)
     size = max_size;

   if (size > max_size) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("pack_bytes called with size '%0d', which exceeds value size of '%0d'",
                           size,
                           max_size))
      return;
   end
   else begin
      int idx_select;

      for (int i=0; i<size; i++) begin
         if (big_endian == 1)
           idx_select = size-1-i;
         else
           idx_select = i;
         
         m_bits[count+i] = value[idx_select / $bits(byte)][idx_select % $bits(byte)];
      end
   
      count += size;
   end
endfunction 

// pack_ints
// -----------------

function void uvm_packer::pack_ints(ref int value[], input int size = -1);
   int max_size = value.size() * $bits(int);
   
   if (size < 0)
     size = max_size;

   if (size > max_size) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("pack_ints called with size '%0d', which exceeds value size of '%0d'",
                           size,
                           max_size))
      return;
   end
   else begin
      int idx_select;

      for (int i=0; i<size; i++) begin
         if (big_endian == 1)
           idx_select = size-1-i;
         else
           idx_select = i;
         
         m_bits[count+i] = value[idx_select / $bits(int)][idx_select % $bits(int)];
      end
   
      count += size;
   end
endfunction 


// pack_string
// -----------

function void uvm_packer::pack_string(string value);
  byte b;
  foreach (value[index]) begin
    if(big_endian == 0)
      m_bits[count +: 8] = value[index];
    else begin
      b = value[index];
      for(int i=0; i<8; ++i)
        m_bits[count+i] = b[7-i];
    end 
    count += 8;
  end
  if(use_metadata == 1) begin
    m_bits[count +: 8] = 0;
    count += 8;
  end
endfunction 


// UNPACK


// is_null
// -------

function bit uvm_packer::is_null();
  return (m_bits[count+:4]==0);
endfunction

// unpack_object
// -------------

function void uvm_packer::unpack_object_ext(inout uvm_object value);
  unpack_object(value);
endfunction

function void uvm_packer::unpack_object(uvm_object value);

  byte is_non_null; is_non_null = 1;

  if(value.__m_uvm_status_container.cycle_check.exists(value)) begin
    uvm_report_warning("CYCFND", $sformatf("Cycle detected for object @%0d during unpack", value.get_inst_id()), UVM_NONE);
    return;
  end
  value.__m_uvm_status_container.cycle_check[value] = 1;

  if(use_metadata == 1) begin
    is_non_null = m_bits[count +: 4];
    count+=4;
  end

  // NOTE- policy is a ~pack~ policy, not unpack policy;
  //       and you can't pack an object by REFERENCE
  if (value != null)begin
    if (is_non_null > 0) begin
      scope.down(value.get_name());
      value.__m_uvm_field_automation(null, UVM_UNPACK,"");
      value.do_unpack(this);
      scope.up();
    end
    else begin
      // TODO: help do_unpack know whether unpacked result would be null
      //       to avoid new'ing unnecessarily;
      //       this does not nullify argument; need to pass obj by ref
    end
  end
  else if ((is_non_null != 0) && (value == null)) begin
     uvm_report_error("UNPOBJ","cannot unpack into null object", UVM_NONE);
  end
  value.__m_uvm_status_container.cycle_check.delete(value);

endfunction

  
// unpack_real
// -----------

function real uvm_packer::unpack_real();
  if (enough_bits(64,"real")) begin
    return $bitstoreal(unpack_field_int(64));
  end
endfunction
  

// unpack_time
// -----------

function time uvm_packer::unpack_time();
  if (enough_bits(64,"time")) begin
    return unpack_field_int(64);
  end
endfunction
  

// unpack_field
// ------------

function uvm_bitstream_t uvm_packer::unpack_field(int size);
  unpack_field = 'b0;
  if (enough_bits(size,"integral")) begin
    count += size;
    for (int i=0; i<size; i++)
      if(big_endian == 1)
        unpack_field[i] = m_bits[count-i-1];
      else
        unpack_field[i] = m_bits[count-size+i];
  end
endfunction
  

// unpack_field_int
// ----------------

function uvm_integral_t uvm_packer::unpack_field_int(int size);
  unpack_field_int = 'b0;
  if (enough_bits(size,"integral")) begin
    count += size;
    for (int i=0; i<size; i++)
      if(big_endian == 1)
        unpack_field_int[i] = m_bits[count-i-1];
      else
        unpack_field_int[i] = m_bits[count-size+i];
  end
endfunction
  
// unpack_bits
// -------------------

function void uvm_packer::unpack_bits(ref bit value[], input int size = -1);
   if (size < 0)
     size = value.size();

   if (size > value.size()) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("unpack_bits called with size '%0d', which exceeds value.size() of '%0d'",
                           size,
                           value.size()))
      return;
   end
   
   if (enough_bits(size, "integral")) begin
      count += size;
      for (int i=0; i<size; i++)
        if (big_endian == 1)
          value[i] = m_bits[count-i-1];
        else
          value[i] = m_bits[count-size+i];
   end
endfunction

// unpack_bytes
// -------------------

function void uvm_packer::unpack_bytes(ref byte value[], input int size = -1);
   int max_size = value.size() * $bits(byte);
   if (size < 0)
     size = max_size;

   if (size > max_size) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("unpack_bytes called with size '%0d', which exceeds value size of '%0d'",
                           size,
                           value.size()))
      return;
   end
   else begin
      if (enough_bits(size, "integral")) begin
         count += size;

         for (int i=0; i<size; i++) begin
            if (big_endian == 1)
              value[ i / $bits(byte) ][ i % $bits(byte) ] = m_bits[count-i-1];
            else
              value[ i / $bits(byte) ][ i % $bits(byte) ] = m_bits[count-size+i];
         
         end
      end // if (enough_bits(size, "integral"))
   end
endfunction

// unpack_ints
// -------------------

function void uvm_packer::unpack_ints(ref int value[], input int size = -1);
   int max_size = value.size() * $bits(int);
   if (size < 0)
     size = max_size;

   if (size > max_size) begin
      `uvm_error("UVM/BASE/PACKER/BAD_SIZE",
                 $sformatf("unpack_ints called with size '%0d', which exceeds value size of '%0d'",
                           size,
                           value.size()))
      return;
   end
   else begin
      if (enough_bits(size, "integral")) begin
         count += size;

         for (int i=0; i<size; i++) begin
            if (big_endian == 1)
              value[ i / $bits(int) ][ i % $bits(int) ] = m_bits[count-i-1];
            else
              value[ i / $bits(int) ][ i % $bits(int) ] = m_bits[count-size+i];
         end   
      end
   end
endfunction


// unpack_string
// -------------

// If num_chars is not -1, then the user only wants to unpack a
// specific number of bytes into the string.
function string uvm_packer::unpack_string(int num_chars=-1);
  byte b;
  bit  is_null_term; // Assumes a ~null~ terminated string
  int i; i=0;
  if(num_chars == -1) is_null_term = 1;
  else is_null_term = 0;

  while(enough_bits(8,"string") && 
        ((m_bits[count+:8] != 0) || (is_null_term == 0)) &&
        ((i<num_chars)||(is_null_term==1)) )
  begin
    // silly, because cannot append byte/char to string
    unpack_string = {unpack_string," "};
    if(big_endian == 0)
      unpack_string[i] = m_bits[count +: 8];
    else begin
      for(int j=0; j<8; ++j)
        b[7-j] = m_bits[count+j];
      unpack_string[i] = b;
    end 
    count += 8;
    ++i;
  end
  if(enough_bits(8,"string"))
    count += 8;
endfunction 


