# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: TSB.pm
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
# -*- perl -*-

package Midas::TSB;
use strict;

use TRELoad 'BitFieldTie';
use Midas::Command;
use Midas::Error;
use Midas::Globals;
use Midas::MMU;

use fields qw(
	      name
	      config_register

	      base
	      sizebits
	      is_split
	      numentries
	      page_size

	      tsblinkname
	      tsblinkobj
	      force_ctx_zero
	      ttefmt
	      way

	      srcline
	      srcfile
	      srclinestop
	      srcfilestop

	      touched
	      length
	     );

###############################################################################

sub new {
  my $this = shift;
  my %args = @_;

  unless (ref $this) {
    $this = fields::new($this);
  }

  $this->{touched} = 0;
  $this->{force_ctx_zero} = undef;
  $this->{page_size} = undef;
  $this->{way} = undef;

  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub new_from_line {
  my $class = shift;
  my $startline = shift;
  my $fh        = shift;
  my $srcfile   = shift;
  my $srcline   = shift;
  my $mmu       = shift;

  my $srcfile_start = $srcfile;
  my $srcline_start = $srcline;

  local ($_);
  $_ = $startline;


  fatal "Badly formatted TSB line=$srcline, file=$srcfile:\n$_", M_TSBSYNTAX
    unless /^\s*MIDAS_TSB\S*\s*(\S+)\s*((0[xX])?([\da-fA-F]+))\s*(.*)\s*$/;

  my $tsbname = lc $1;
  my $register = $2;
  my $rest = $5;
  my $reg_bf = string2bf($register, 64);
  fatal "TSB config register '$register' is not a number at file=$srcfile, line=$srcline\n", M_NOTNUM unless defined $reg_bf;


  my $force_ctx_zero = undef;
  my $page_size = undef;
  my $ttefmt = undef;
  my $way = undef;
  my $tsblinkname;
  if($rest =~ s/force_ctx_zero//i) {
    $force_ctx_zero = 1;
  }
  if($rest =~ s/link\s*=\s*(\S+)//i) {
    $tsblinkname = lc $1;
  }
  if($rest =~ s/page_size\s*=\s*(\d+)//i) {
    $page_size = $1;
  }
  if($rest =~ s/way\s*=\s*(\d+)//i) {
    $way = $1;
  }
  if($rest =~ s/ttefmt\s*=(\S+)//i) {
    $ttefmt = lc $1;
    if($ttefmt ne 'sun4u' and $ttefmt ne 'sun4v') {
      fatal "Illegal ttefmt '$1' on TSB line line=$srcline, file=$srcfile.\n",
	M_TSBSYNTAX;
    }
  }

  my $this = $class->new
    (
     name            => $tsbname,
     tsblinkname     => $tsblinkname,
     config_register => $reg_bf,
     srcfile         => $srcfile_start,
     srcline         => $srcline_start,
     srcfilestop     => $srcfile,
     srclinestop     => $srcline,
    );


  $this->config_from_register($mmu);

  $this->{force_ctx_zero} = $force_ctx_zero if defined $force_ctx_zero;
  $this->{page_size}      = $page_size      if defined $page_size;
  $this->{ttefmt}         = $ttefmt         if defined $ttefmt;
  $this->{way}            = hex($way)       if defined $way;

  if($this->{is_split} and not defined $this->{way}) {
    fatal "TSB '$tsbname' is split but does not\n". 
      "  define way!\n" .
      "  line=$srcline, file=$srcfile.\n", M_TSBSYNTAX;
  }

  if(defined $this->{way} and not ($this->{way} == 0 or $this->{way} == 1)) {
    fatal "TSB '$tsbname' defines way that isn't\n".
      "  zero or one!\n".
      "  line=$srcline, file=$srcfile.\n", M_TSBSYNTAX;
  }

  if($this->{is_split} and $this->{way} == 1) {
    my $newBase = BitFieldTie->new($PASIZE, $this->{base});
    my $offset = $this->{numentries} * 16; # 16 bytes per entry
    $newBase->add($offset);
    $this->{base} = $newBase;
  }


  return $this;

}

###############################################################################

sub config_from_register {
  my $this = shift;
  my $mmu  = shift;

  my $base = BitFieldTie->new($PASIZE, $this->{config_register});
  $base->store(12, 0, 0); # zero out bits 12:0;

  $this->{base} = $base;
  $this->{sizebits} = $this->{config_register}->extract(3,0);
  $this->{is_split} = $this->{config_register}->extract(12);
  $this->{numentries} = 512 * (1 << $this->{sizebits});

  my $base_lo = 13 + $this->{sizebits};
  if($base_lo > 13) {
    my $overlap = $base->extract($base_lo, 13);

    if($overlap) {
      if($CONFIG{allow_misaligned_tsb_base}) {
	$base->store($base_lo, 13, 0);
      } else {
	fatal "TSB '$this->{name}' has base $base, which\n".
	  "   is misaligned for size=$this->{sizebits}\n" .
	  "   Illegal unless -allow_misalgined_tsb_base is defined.\n" .
	  "   line=$this->{srcline}, file=$this->{srcfile}\n",
	    M_TSBSYNTAX;
      }
    }

  }
}

###############################################################################

sub get_ttefmt {
  my $this = shift;

  return $this->{ttefmt} if defined $this->{ttefmt};
  return $CONFIG{ttefmt};
}

###############################################################################

sub touch {
  my $this = shift;
  $this->{touched} = 1;

  if(defined $this->{tsblinkobj}) {
    $this->{tsblinkobj}->touch();
  }
}

###############################################################################

sub is_touched {
  my $this = shift;
  return $this->{touched} || $CONFIG{gen_all_tsbs};
}

###############################################################################

sub is_force_ctx_zero {
  my $this = shift;
  return $this->{force_ctx_zero};
}

###############################################################################

sub get_tsblinkname {
  my $this = shift;
  return $this->{tsblinkname};
}

###############################################################################

sub set_tsblinkobj {
  my $this = shift;
  my $obj  = shift;
  $this->{tsblinkobj} = $obj;
}

###############################################################################

sub page_size {
  my $this = shift;
  return $this->{page_size};
}

###############################################################################

sub write_to_goldfinger_file {
  my $this = shift;
  my $ofh  = shift;
  my $indent = shift;

  $indent = '' unless defined $indent;

  print $ofh "${indent}TSB $this->{name}\n";
  print $ofh "${indent}  src_file    = \"$this->{srcfile}\";\n";
  print $ofh "${indent}  src_line    = $this->{srcline};\n";
  print $ofh "${indent}  start_addr  = 0x$this->{base};\n";
  print $ofh "${indent}  size_bits   = $this->{sizebits};\n";
  print $ofh "${indent}  split       = $this->{is_split};\n";
  print $ofh "${indent}  num_entries = $this->{numentries};\n";
  print $ofh "${indent}  link_area   = $this->{tsblinkname};\n"
    if defined $this->{tsblinkname};

  print $ofh "${indent}END TSB\n";
  print $ofh "\n";
}
sub write_to_csm_goldfinger_file {
  my $this = shift;
  my $ofh  = shift;
  my $indent = shift;

  $indent = '' unless defined $indent;

  print $ofh "${indent}TSB_CSM $this->{name}\n";
  print $ofh "${indent}  src_file    = \"$this->{srcfile}\";\n";
  print $ofh "${indent}  src_line    = $this->{srcline};\n";
  print $ofh "${indent}  start_addr  = 0x$this->{base};\n";
  print $ofh "${indent}  size_bits   = $this->{sizebits};\n";
  print $ofh "${indent}  split       = $this->{is_split};\n";
  print $ofh "${indent}  num_entries = $this->{numentries};\n";
  print $ofh "${indent}  link_area   = $this->{tsblinkname};\n"
    if defined $this->{tsblinkname};

  print $ofh "${indent}END TSB_CSM\n";
  print $ofh "\n";
}


###############################################################################


###############################################################################
###############################################################################

package Midas::TSBLink;
use strict;

use TRELoad 'BitFieldTie';
use Midas::Command;
use Midas::Error;
use Midas::Globals;

use fields qw(
	      name

	      base
	      touched
	      length

	      srcline
	      srcfile
	      srclinestop
	      srcfilestop

	     );

###############################################################################

sub new {
  my $this = shift;
  my %args = @_;

  unless (ref $this) {
    $this = fields::new($this);
  }

  $this->{touched} = 0;

  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub new_from_line {
  my $class = shift;
  my $startline = shift;
  my $fh        = shift;
  my $srcfile   = shift;
  my $srcline   = shift;
  my $mmu       = shift;

  my $srcfile_start = $srcfile;
  my $srcline_start = $srcline;

  local ($_);
  $_ = $startline;


  while($_ =~ /\\$/) {
    $_ =~ s/\\\n$/ /;
    $_ .= <$fh>;
    $srcline++;
  }


  fatal "Badly formatted TSB_LINK line=$srcline, file=$srcfile:\n$_",
    M_TSBSYNTAX
    unless /^\s*MIDAS_TSB_\S*LINK\s*(\S+)\s*((0[xX])?([\da-fA-F]+))\s*$/;

  my $tsblinkname = lc $1;
  my $addr = $2;

  my $addr_bf = string2bf($addr, $PASIZE);
  fatal "TSB_LINK addr '$addr' is not a number at ".
    "file=$srcfile, line=$srcline\n", M_NOTNUM unless defined $addr_bf;

  my $this = Midas::TSBLink->new
    (
     name         => $tsblinkname,
     base         => $addr_bf,
     srcfile      => $srcfile_start,
     srcline      => $srcline_start,
     srcfilestop  => $srcfile,
     srclinestop  => $srcline,
    );


  return $this;
}

###############################################################################

sub touch {
  my $this = shift;
  $this->{touched} = 1;
}

###############################################################################

sub is_touched {
  my $this = shift;
  return $this->{touched} || $CONFIG{gen_all_tsbs};
}

###############################################################################

sub set_len {
  my $this = shift;
  my $length_bf = shift;

  $this->{length} = $length_bf;
}

###############################################################################

sub write_to_goldfinger_file {
  my $this = shift;
  my $ofh  = shift;
  my $indent = shift;

  $indent = '' unless defined $indent;

  print $ofh "${indent}TSB_LINK $this->{name}\n";
  print $ofh "${indent}  src_file    = \"$this->{srcfile}\";\n";
  print $ofh "${indent}  src_line    = $this->{srcline};\n";
  print $ofh "${indent}  start_addr  = 0x$this->{base};\n";
  print $ofh "${indent}END TSB_LINK\n";
  print $ofh "\n";
}
sub write_to_csm_goldfinger_file {
  my $this = shift;
  my $ofh  = shift;
  my $indent = shift;

  $indent = '' unless defined $indent;

  print $ofh "${indent}TSB_CSM_LINK $this->{name}\n";
  print $ofh "${indent}  src_file    = \"$this->{srcfile}\";\n";
  print $ofh "${indent}  src_line    = $this->{srcline};\n";
  print $ofh "${indent}  start_addr  = 0x$this->{base};\n";
  print $ofh "${indent}END TSB_CSM_LINK\n";
  print $ofh "\n";
}

###############################################################################

###############################################################################
1;
