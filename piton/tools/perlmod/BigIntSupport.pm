# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: BigIntSupport.pm
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
package BigIntSupport;

require 5.005_62;
use strict;
use warnings;

require Exporter;
use Math::BigInt;
use Carp;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use BigIntSupport ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
		 hex2bigint
		 bigint2hex
		 bigint_sprintf
		);
our $VERSION = '1.01';


# Preloaded methods go here.

sub hex2bigint {
  my $hexstring = shift;
  $hexstring = 0 unless defined $hexstring;
  $hexstring =~ s/^\s+//;
  $hexstring =~ s/\s+$//;
  $hexstring =~ s/^0[xX]//;

  my $bignum = Math::BigInt->new(0);
  my $shift = 0;

  while(length $hexstring) {
    my $tail = substr $hexstring, -8, 8, "";
    my $tailval = hex($tail);
    $bignum += Math::BigInt->new($tailval) << $shift;
    $shift += 32;
  }

  return $bignum;
}


sub bigint2hex {
  my $bignum = shift;

  if(not ref $bignum) {
    return sprintf("%x", $bignum);
  }

  my $string = "";

  while($bignum) {
    my $low = $bignum & 0xffffffff;
    $string = sprintf("%08x", $low) . $string;
    $bignum >>= 32;
  }
  $string =~ s/^0+//;

  $string = '0' if $string eq '';

  return $string;
}


sub bigint_sprintf {
  my $bigint = shift;
  my $format = shift;

  if($format =~ /^\s*\%?(0)?(\d+)?[lL]*([xd])\s*/) {
    my ($lead, $width, $base) = ($1, $2, $3);

    $width = 0 unless defined $width;
    $base = '' unless defined $base;

    my $string;


    if($base eq 'd') {
      $string = "$bigint";
      $string =~ s/^\+//;
    } else {
      $string = bigint2hex($bigint);
    }

    my $strlen = length($string);
    if($width > $strlen) {
      my $diff = $width - $strlen;
      my $char = defined($lead)? '0' : ' ';
      my $leading = $char x $diff;
      $string = "$leading$string";
    }
    return $string;
  } else {
    croak "Bad format string: $format";
  }
}


1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

BigIntSupport - Perl extension for interfacing between Math::BigInt values and text strings.

=head1 SYNOPSIS

  use BigIntSupport;
  use Math::BigInt;

  # Create Math::BigInt from an arbitrary-sized hex number
  my $bigint1 = hex2bigint("0xdeadbeefcafebabe01234567");
  my $bigint2 = hex2bigint("0xffffffff");
  # Do math
  $bigint2 <<= 32;
  $bigint1 &= $bigint2;
  # Get hex string back
  my $string = bigint2hex($bigint1);
  # Print it
  print "Result is 0x$string\n";


=head1 DESCRIPTION

This provides some interface functions for the Math::BigInt library,
which is part of the perl standard libary.  Basically, Math::BigInt is
a module for arbitrary-sized integers.  It overloads all the standard
math operators for use with Math::BigInt objects, but it does not
overload either the hex() function or sprintf "%x", so it is difficult
to use Math::BigInt objects for large hex numbers.  This module is a
solution to that problem.

=head2 EXPORT

The following functions are exported:

=over 4

=item hex2bigint($hex_string)

Interprets $hex_string as a hex number (whether or not a leading 0x is
present).  Returns a Math::BigInt object representing the number.  To
convert decimal numbers to Math::BigInt objects, use
Math::BigInt->new($decimal_string).

=item bigint2hex($bigint)

Formats the given Math::BigInt object as a hexidecimal string and
returns it.  The string has no leading zeros or 0x.

=item bigint_sprintf($bigint, $format)

Takes a Math::BigInt and a printf-style format string and returns a
string with the appropriately-formatted string.  The format string can
contain only %x or %d, and may optionally include a width
specification, which may include a leading zero.  In other words,
"%016x" is legal but "The answer is %d" is not.  A leading "%" is
optional.

=back



=head1 SEE ALSO

Math::BigInt(3), perl(1).

=cut
