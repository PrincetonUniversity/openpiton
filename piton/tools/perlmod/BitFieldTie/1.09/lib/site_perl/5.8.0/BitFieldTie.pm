# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: BitFieldTie.pm
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================
package BitFieldTie;

use 5.008;
use strict;
use warnings;

require Exporter;

use Bit::Vector;
use Carp;

our @ISA = qw(Exporter);
use overload '""' => \&stringify;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use BitFieldTie ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '1.09';

#############################################################################
#############################################################################

sub TIEHASH {
  my $class = shift;
  my $size  = shift;     # if an object, tie it
  my $hexstring = shift;

  my $obj;
  if(defined $size and ref $size and $size->isa('BitFieldTie')) {
    $obj = $size;
    undef $size;
    undef $hexstring;
  }

  my $this;
  if(defined $obj) {
    $this = $obj;
  } else {
    $this = {};
    bless $this, (ref($class) || $class);

    $this->set($size, $hexstring);
  }


  return $this;
}

#############################################################################

sub FETCH {
  my $this = shift;
  my $key  = shift;

  my ($start, $stop) = $this->parse_key($key);
  my $size = $stop-$start+1;
  confess "Cannot use a chunk size > 32 bits\n" if $size > 32;
  return $this->{bv}->Chunk_Read($size, $start);
}

#############################################################################

sub STORE {
  my $this = shift;
  my $key  = shift;
  my $val  = shift;

  my ($start, $stop) = $this->parse_key($key);
  my $size = $stop-$start+1;
  confess "Cannot use a chunk size > 32 bits\n" if $size > 32;
  confess "BitFieldTie: stop not defined\n" unless defined $stop;
  confess "BitFieldTie: value not defined\n" unless defined $val;

  $val = hex($val) if $val =~ /^\s*0[xX]/;

  eval {
    $this->{bv}->Chunk_Store($size,$start,$val);
  };
  confess $@ if $@;
}

#############################################################################
#############################################################################

sub new {
  my $class = shift;
  my $size  = shift;  # if an object, clone it
  my $hexstring = shift;

  if(ref $class) {
    my $this = $class->clone();
    return $this;
  }

  my $obj;
  if(defined $size and ref $size and $size->isa('BitFieldTie')) {
    $obj = $size;
    undef $size;
    undef $hexstring;
  }

  my $this;
  if(defined $obj) {
    $this = $obj->clone();
  } else {
    $this = {};
    bless $this, (ref($class) || $class);

    $this->set($size, $hexstring);
  }


  return $this;
}

#############################################################################

sub new_dec {
  my $class = shift;
  my $size  = shift;  # if an object, clone it
  my $decimal = shift;

  if(ref $class) {
    my $this = $class->clone();
    return $this;
  }

  my $obj;
  if(defined $size and ref $size and $size->isa('BitFieldTie')) {
    $obj = $size;
    undef $size;
    undef $decimal;
  }

  my $this;
  if(defined $obj) {
    $this = $obj->clone();
  } else {
    $this = {};
    bless $this, (ref($class) || $class);

    $this->set_dec($size, $decimal);
  }


  return $this;
}

#############################################################################

sub parse_key {
  my $this = shift;
  my $key = shift;

  my ($start, $stop);
  ($start, $stop) = $key =~ /(\d+)(?:\:(\d+))?/;
  $stop = $start unless defined $stop;
  confess "Badly formatted key ($key).\n" unless defined $start;

  if($stop < $start) {
    ($start, $stop) = ($stop, $start);
  }

  return ($start, $stop);
}

#############################################################################

sub stringify {
  my $this = shift;
  my $s;
  eval {
    $s = $this->{bv}->to_Hex();
  };
  confess $@ if $@;
  $s =~ tr/[A-F]/[a-f]/;
  return $s;
}

#############################################################################

sub clone {
  my $this = shift;
  my $new = {};
  bless $new, (ref $this);
  eval {
    $new->{bv} = $this->{bv}->Clone();
  };
  confess $@ if $@;

  return $new;
}

#############################################################################

sub extract {
  my $this = shift;
  my $start = shift;
  my $stop = shift;

  $stop = $start unless defined $stop;

  ($start, $stop) = ($stop, $start) if ($start > $stop);

  my $size = $stop-$start+1;
  confess "Cannot use a chunk size > 32 bits\n" if $size > 32;
  return $this->{bv}->Chunk_Read($size, $start);
}

#############################################################################

sub store {
  my $this = shift;
  my $start = shift;
  my $stop = shift;
  my $val = shift;

  confess "BitFieldTie: store(\$start, \$stop, \$value) missing start\n"
    unless defined $start;
  confess "BitFieldTie: store(\$start, \$stop, \$value) missing stop\n"
    unless defined $stop;
  confess "BitFieldTie: store(\$start, \$stop, \$value) missing value\n"
    unless defined $val;
  ($start, $stop) = ($stop, $start) if ($start > $stop);

  my $size = $stop-$start+1;
  confess "Cannot use a chunk size > 32 bits\n" if $size > 32;
  confess "BitFieldTie: stop not defined\n" unless defined $stop;
  confess "BitFieldTie: value not defined\n" unless defined $val;

  $val = hex($val) if $val =~ /^\s*0[xX]/;

  eval {
    $this->{bv}->Chunk_Store($size,$start,$val);
  };
  confess $@ if $@;

}

#############################################################################

sub left_shift {
  my $this = shift;
  my $numbits = shift;
  eval {
    $this->{bv}->Move_Left($numbits);
  };
  confess $@ if $@;
}

#############################################################################

sub right_shift {
  my $this = shift;
  my $numbits = shift;
  eval {
    $this->{bv}->Move_Right($numbits);
  };
  confess $@ if $@;
}

#############################################################################

sub divide {
  my $this = shift;
  my $that = shift;
  my $remainder = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  if(not defined $remainder) {
    eval {
      $remainder = Bit::Vector->new_Dec($this->{bv}->Size(), 0);
    };
    confess $@ if $@;
  } elsif($remainder->isa('BitFieldTie')) {
    $remainder = $remainder->{bv};
  }

  eval {
    $this->{bv}->Divide($this->{bv}, $that_bv, $remainder);
  };
  confess $@ if $@;
}

#############################################################################

sub subtract {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  eval {
    $this->{bv}->subtract($this->{bv}, $that_bv, 0);
  };
  confess $@ if $@;
}

#############################################################################

sub add {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  eval {
    $this->{bv}->add($this->{bv}, $that_bv, 0);
  };
  confess $@ if $@;
}

#############################################################################

sub multiply {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  eval {
    $this->{bv}->Multiply($this->{bv}, $that_bv);
  };
  confess $@ if $@;
}

#############################################################################

sub compare {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  my $result;
  eval {
    $result = Bit::Vector::Compare($this->{bv}, $that_bv);
  };
  confess $@ if $@;
  return $result;
}

#############################################################################

sub ucompare {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  } else {
    eval {
      $that_bv = $this->{bv}->Clone();
      $that_bv->from_Dec($that);
    };
    confess $@ if $@;
  }

  my $result;
  my $hthis = $this->{bv}->to_Hex();
  my $hthat = $that_bv->to_Hex();
  eval {
    $result = Bit::Vector::Lexicompare($this->{bv}, $that_bv);
  };
  confess $@ if $@;
  return $result;
}

#############################################################################

sub bitwise_and {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  }
  eval {
    $this->{bv}->Intersection($this->{bv}, $that_bv);
  };
  confess $@ if $@;
}

#############################################################################

sub bitwise_or {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  }
  eval {
    $this->{bv}->Union($this->{bv}, $that_bv);
  };
  confess $@ if $@;
}

#############################################################################

sub bitwise_xor {
  my $this = shift;
  my $that = shift;

  my $that_bv = $that;
  if(ref $that_bv and $that_bv->isa('BitFieldTie')) {
    $that_bv = $that->{bv};
  }
  eval {
    $this->{bv}->ExclusiveOr($this->{bv}, $that_bv);
  };
  confess $@ if $@;
}

#############################################################################

sub bitwise_not {
  my $this = shift;

  eval {
    $this->{bv}->Flip();
  };
  confess $@ if $@;
}

#############################################################################

sub clear {
  my $this = shift;

  eval {
    $this->{bv}->Empty();
  };
  confess $@ if $@;
}

#############################################################################

sub set {
  my $this = shift;
  my $size = shift;
  my $hexstring = shift;

  $size = 64 unless defined $size;
  confess "Size ($size) must be positive!\n" if($size < 0);

  eval {

    if(defined $hexstring) {
      $hexstring =~ s/^0[xX]//;
      $this->{bv} = Bit::Vector->new_Hex($size, "$hexstring");
    } else {
      $this->{bv} = Bit::Vector->new($size);
    }
  };
  if($@) {
    confess "set(size=$size, string=\"$hexstring\"): $@\n";
  }
}

#############################################################################

sub set_dec {
  my $this = shift;
  my $size = shift;
  my $decimal = shift;

  $size = 64 unless defined $size;
  confess "Size ($size) must be positive!\n" if($size < 0);

  eval {

    if(defined $decimal) {
      $this->{bv} = Bit::Vector->new_Dec($size, "$decimal");
    } else {
      $this->{bv} = Bit::Vector->new($size);
    }
  };
  if($@) {
    confess "set_dec(size=$size, string=\"$decimal\"): $@\n";
  }
}

#############################################################################

sub size {
  my $this = shift;
  my $size = shift;

  eval {
    if(defined $size) {
      $this->{bv}->Resize($size);
    }
  };
  if($@) {
    confess "size($size): $@\n";
  }

  return $this->{bv}->Size();
}

#############################################################################

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

BitFieldTie - Tie interface for bitfield operations

=head1 SYNOPSIS

  use BitFieldTie; # or use TRELoad 'BitFieldTie';

  tie %num, 'BitFieldTie';

  $num{'31:0'}  = hex('0x1234');
  $num{'63:32'} = hex('0xabcd');

  print "low byte is $num{'7:0'}\n";
  print "MSB is $num{63}\n";

  my $obj = tied %num;     # get object
  print "Num is $obj\n"; # object prints as hex num


=head1 ABSTRACT

  This is a thin wrapper for Bit::Vector that presents a tie interface for
  bit vectors.  The bit vector itself can be of arbitrary size, but the
  chunk size (the size of an individual bit field) is limited to 32 bits.

=head1 DESCRIPTION

This module allows users to access bit fields with a hash interface.

=head2 Introduction

This module provides two components.  The first is a class,
BitFieldTie, that allows users to manipulate bit vectors of arbitrary
size using object methods.  The second is a tie interface.  When a
hash is tied to a BitFieldTie object, a hash interface can be used to
set or exampine bit ranges in the vector.

=head2 Hash Interface

This subsection describes using the tied hash interface.

=head3 Setting up a bitfield

When you tie a hash to this module, the hash becomes a representation
of bitfields of a number.  By default, a 64-bit integer is created and
initialized to zero.  You can provide optional arguments to the tie
command to set a different size and initial value, as in:

  tie %num, 'BitFieldTie', 32, '0x1234abcd';

The first optional agument is the size in bits, and the second is the
initial value IN HEX.

=head3 Using a bitfield

You can then access fields of the hash.  Hash keys can either be a
single number for single-bit access, or a range in the form of
E<lt>highE<gt>:E<lt>lowE<gt>.  The values in the hash are integers, so
for istance aftre the above initialization, the value of $num{'3:0'}
would be 13 (decimal for 0xd).  The hash provides both read and write
access.  B<The major restriction is that the size of the bit range
(i.e., high-low+1) cannot exceed 32-bits.>  To access larger ranges,
you need to break it up into separate accesses.  The main reason for
that restriction is that if the module allowed larger chunks, it could
not use integers to represent bit fields and performance would suffer
considerably.

=head3 Printing the bitfield

Unfortunately, the tied-hash mechanism does not lend itself to object
methods to do un-hash-like things like pretty-printing.  You must
therefore use the object interface, and there is a little bit of
syntax involved.

  $obj = tied %num;

This sets $obj to the underlying object for the tied hash.  The object
does know how to print itself (among other things).

  print "Num is $obj\n";

The above statement will print %num as a hexidecimal number.

You can also interpolate the hash directly with a little bit of funny
syntax:

  print "Num is @{[tied %num]}\n";

This is just a clever perl hack to do the same thing without explictly
referencing $obj.

=head2 Object interface

Objects of type BitFieldTie can be created in 3 ways.  The first is if
a hash is tied to a BitFieldTie object, but no object is specified (as
is the case in the previous examples), one will be created.  This
object can then be referenced by using the 'tied' operator on the
hash, as shown in the previous section.

Objects can also be created with the new() or clone() methods, as
described in the section on Object Methods.

Once an object is created, it can be easily manipulated as shown in
the next section.

=head3 Math with Bitfields

BitFieldTie ties a hash object to an object.  This allows you to use
convenient hash syntax to access bit fields.  To do math, however, you
need to manipulate the object directly.  The perl builtin-function
tied will give you the object associated with a tied hash.

  my %v1;
  tie %v1, 'BitFieldTie', 64, '0x0000ffff0000cccc';

  my $v1 = tied %v1;

The above code creates a new 64-bit number tied to the hash %v1.  The
underlying object is assigned to $v1.  Say we had a similar definition
for v2:

  my %v2;
  tie %v2, 'BitFieldTie', 64, '0xffff333300003333';
  my $v2 = tied %v2;

You can still access bitfields using hash syntax on %v1 and %v2.  You
can now also call object methods on $v1 and $v2.  For instance:

  $v2->bitwise_and($v1);
  print "$v2";

The above prints: "0000333300000000".  Keep in mind that as mentioned
above, when you convert an underlying BitFieldTie object to a string
(as in the print statement), the string is a hexadecimal
representation of the number.

=head3 Object methods

The following are the object methods that BitFieldTie objects respond to.

=over 4

=item new($size, $hexstring) OR new($obj)

Class method that creates a new object and returns it.  Arguments are
optional, if a $size and/or $hexstring is specified, it works just as
the argument list to tie.  If an object is provided, that object is
cloned, and the clone is returned.

new() can also be called as an object method.  So the following two
statements are identical (assuming $obj is a BitFieldTie):

  $new = $obj->new();
  $new = BitFieldTie->new($obj);

=item new_dec($size, $decimal)

Same as new, except that the second argument is treated as a decimal
argument, instead of a hex string.

=item clone()

Returns a new BitFieldTie object that is identical to the old one
EXCEPT that it is not tied to any hash.

=item stringify()

Returns hexadecimal object as a string.  This is called automatically
when you include a BitFieldTie object in double-quotes.

=item extract($hi, $low)

Returns the specified bit range from the object as an integer.  Since
the return value is an integer, the size (i.e., $hi - $low + 1) must
be <= 32.

=item store($hi, $low, $value)

Stores the $value (an integer!) in the specified bit range in the
object.  Since the return value is an integer, the size (i.e., $hi -
$low + 1) must be <= 32.  Also, the $value must be an integer, not a string.

=item clear()

Sets all bits in the bit vector to 0.

=item size(), size($numbits)

Sets/Gets the size (in bits) of the number, depending on whether or
not an argument is given.

=item left_shift($numbits)

Left shifts the number.

=item right_shift($numbits)

Right shifts the number.

=item bitwise_and($obj)

Does a bitwise and between the calling object and $obj.  Stores the
result in the calling object.  For example:

  $v1->bitwise_and($v2);

has the C equivalent of:

  v1 &= v2;

=item bitwise_or($obj)

Same as bitwise_and, except it performs an OR function.

=item bitwise_xor($obj)

Same as bitwise_and and bitwise_or, except it performs an XOR function.

=item bitwise_not()

Flips every bit in the number.

=item divide($obj, $remainder)

Divides the calling object by $obj and stores the result in the
calling object (i.e., /=).  $remainder is initialized to the
remainder.  $obj can be an integer, in which case an object the same
size as the calling object is created for it.


=item multiply($obj)

Multiplies the calling object by $obj and stores the result in the
calling object (i.e., *=).  $obj can be an integer, in which
case an object the same size as the calling object is created for it.


=item add($obj)

Adds $obj to the calling object.  $obj can be an integer, in which
case an object the same size as the calling object is created for it.

=item subtract($obj)

Subtracts $obj from the calling object.  $obj can be an integer, in which
case an object the same size as the calling object is created for it.

=item compare($obj)

Does a comparison on the calling object and $obj (which may be an
integer).  Returns -1 if the calling object is smaller, 0 if they are
equal, and 1 if the calling object is greater that $obj.  Both the
calling object and $obj are treated as SIGNED integers for the
purposes of comparison.

=item ucompare($obj)

Same as compare, but the calling object and $obj are treated as
UNSIGNED integers.

=back

=head2 Tying an Existing Object to a Hash

If you create a BitFieldTie object with new() or clone(), it begins
life not tied to any hash.  You can manipulate it with object methods,
but if you want to access bit fields with hash syntax, you will need
to tie it to a hash first.  Here is an example

 my $obj = BitFieldTie->new(64, '0xdeadbeefcafe0123');
 tie %h, 'BitFieldTie', $obj;

The contents of $h{'15:0'} would then be hex('0123');


=head2 EXPORT

None.  Object modules do not export any symbols.

=head1 SEE ALSO

Bit::Vector(3).

=cut
