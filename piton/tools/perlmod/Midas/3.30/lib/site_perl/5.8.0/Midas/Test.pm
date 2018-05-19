# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Test.pm
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

# IMPORTANT: Do not 'use Midas::Test' from anywhere within midas.  The
# Test::More module will monkey with midas' exit status, so it won't
# function properly.  Test scripts should: use Midas; use Midas::Test;
# explicitly.


package Midas::Test;
use strict;

use TRELoad 'BitFieldTie';
use Test::More;
use Midas::MMU::TTEFormat;

require Exporter;
our @ISA = qw(Exporter);

our @Test_functions = qw(
			 check_full_section check_tsb
			 addr_to_entry new_ttehash
			 va2tsbtag ra2tsbdata
			 compact_section parse_mem_image
			 verbose_args dir_args parse_symtab
			);

our @EXPORT = (@Test_functions, '@Test_functions');

###############################################################################

{
  package Midas::Test::Memimage;
  use strict;
  use fields qw( file sections );
  use Test::More;

  sub new {
    my $class = shift;
    my $file  = shift;
    my $this  = fields::new($class);
    $this->{file}      = $file if defined $file;
    $this->{sections}  = {};
    return $this;
  }

  sub debug_print {
    my $this = shift;

    print "MEMIMAGE \"$this->{file}\"\n";
    foreach my $sec (sort keys %{$this->{sections}}) {
      print $this->{sections}{$sec}->tostring();
    }
  }

  sub num_nonzero_secs {
    my $this = shift;
    my $num = 0;
    foreach my $sec (keys %{$this->{sections}}) {
      my $size = $this->{sections}{$sec}->size();
      $num++ if $this->{sections}{$sec}->nonzero_size() > 0;
    }
    return $num;
  }

  sub num_nonempty_secs {
    my $this = shift;
    my $num = 0;
    foreach my $sec (keys %{$this->{sections}}) {
      my $size = $this->{sections}{$sec}->size();
      $num++ if $this->{sections}{$sec}->size() > 0;
    }
    return $num;
  }


  sub get_sec_from_pa {
    my $this = shift;
    my $pa   = shift;

    return $this->{sections}{$pa} if exists $this->{sections}{$pa};
    return;
  }

  sub check_full_section {
    my $this           = shift;
    my $pa             = shift;
    my $elems          = shift;
    my $just_beginning = shift;

    my $sec = $this->get_sec_from_pa($pa);
    ok(defined($sec), "Section exists at pa=$pa.");
    $sec->check_full_sec($elems, $just_beginning) if defined $sec;
  }

  sub check_tsb {
    my $this = shift;
    my $pa   = shift;
    my $entries = shift;
    my $tsbname = shift;
    my $mmutype = shift;

    my $sec = $this->get_sec_from_pa($pa);
    ok(defined($sec), "TSB '$tsbname' exists at pa=$pa.");

    $sec->check_tsb($entries, $mmutype) if defined $sec;
  }

}

###############################################################################

{
  package Midas::Test::MemimageSection;
  use strict;
  use fields qw(pa name subsecs);
  use Test::More;

  sub new {
    my $class = shift;
    my $pa    = shift;
    my $this  = fields::new($class);
    $this->{pa}      = $pa if defined $pa;
    $this->{subsecs} = {};
    return $this;
  }

  sub size {
    my $this = shift;
    my $size = 0;
    foreach my $subsec (keys %{$this->{subsecs}}) {
      $size += $this->{subsecs}{$subsec}->size();
    }
    return $size;
  }

  sub nonzero_size {
    my $this = shift;
    my $size = 0;
    foreach my $subsec (keys %{$this->{subsecs}}) {
      $size += $this->{subsecs}{$subsec}->nonzero_size();
    }
    return $size;
  }

  sub add_subsec {
    my $this = shift;
    my $subsec = shift;
    $this->{subsecs}{$subsec->{pa}} = $subsec;
    if($subsec->is_sec_start()) {
      $this->{pa}   = $subsec->{pa};
      $this->{name} = $subsec->{comments};
    }
    $subsec->{secname} = $this->{name};
  }

  sub get_index {
    my $this = shift;
    my $index = shift;

    foreach my $subsec (sort keys %{$this->{subsecs}}) {
      if($index >= $this->{subsecs}{$subsec}{offset_i} and
	 $index <  ($this->{subsecs}{$subsec}{offset_i}+
		    $this->{subsecs}{$subsec}->size()))
	{
	  my $subindex = $index - $this->{subsecs}{$subsec}{offset_i};
	  return $this->{subsecs}{$subsec}{data}[$subindex];
	}
    }
    return;
  }

  sub tostring {
    my $this = shift;
    my $str = "SECTION \@$this->{pa} $this->{name}\n";
    foreach my $subsec (sort keys %{$this->{subsecs}}) {
      $str .= "  " . $this->{subsecs}{$subsec}->tostring();
    }
    return $str;
  }

  sub check_full_sec {
    my $this = shift;
    my $elems = shift;
    my $just_beginning = shift;

    $just_beginning = 0 unless defined $just_beginning;

    my @subsecs = values %{$this->{subsecs}};
    is(@subsecs, 1, "Section '$this->{name}' has no subsections.");
    $subsecs[0]->check_full_subsec($elems, $just_beginning);
  }

  sub check_tsb {
    my $this = shift;
    my $entries = shift;
    my $mmutype = shift;
    my $name = $this->{name};

    my $num_entries = int($this->nonzero_size() / 2);
    my $expected_num_entries = @$entries;

    is($num_entries, $expected_num_entries,
       "Check TSB '$name' has '$expected_num_entries' entries.");

    foreach my $entry (@$entries) {
      my $tag_index  = $entry->{entry} * 2;
      my $data_index = $tag_index + 1;

      my $tag  = Midas::Test::va2tsbtag($entry->{va}, $entry->{ttehash},
					$mmutype);
      my $data = Midas::Test::ra2tsbdata($entry->{ra}, $entry->{ttehash},
					 $mmutype);

      ok(defined $this->get_index($tag_index),
	 "Check there is a tag for entry $entry->{entry}.");
      is($this->get_index($tag_index), $tag,
	 "Check the value of tag for entry $entry->{entry} is '$tag'.");
      ok(defined $this->get_index($data_index),
	 "Check there is a data for entry $entry->{entry}.");
      is($this->get_index($data_index), $data,
	 "Check the value of data for entry $entry->{entry} is '$data'.");

    }
  }

}

###############################################################################

{
  package Midas::Test::MemimageSubsec;
  use strict;
  use fields qw(pa comments sec secpa data offset_b offset_i secname);
  use Test::More;

  sub new {
    my $class    = shift;
    my $pa       = shift;
    my $comments = shift;

    my $this  = fields::new($class);

    $this->{pa}       = $pa       if defined $pa;
    $this->{comments} = $comments if defined $comments;
    $this->{data}     = [];
    return $this;
  }

  sub size {
    my $this = shift;
    return scalar @{$this->{data}};
  }

  sub nonzero_size {
    my $this = shift;
    my $nz = 0;
    foreach my $d (@{$this->{data}}) {
      $nz++ if $d =~ /[1-9a-fA-F]/;
    }
    return $nz;
  }

  sub add_data {
    my $this = shift;
    my $data = shift;

    push @{$this->{data}}, @$data;
  }

  sub tostring {
    my $this = shift;
    my $size = $this->size();
    my $str  = "SUBSEC \@$this->{pa}: $size elements, offset=$this->{offset_b} bytes, $this->{offset_i} index\n";
    return $str;
  }

  sub is_sec_start {
    my $this = shift;
    return 1 if $this->{secpa} eq $this->{pa};
    return 0;
  }

  sub calculate_offsets {
    my $this = shift;

    my $pa_bf     = BitFieldTie->new(64, $this->{pa});
    my $sec_pa_bf = BitFieldTie->new(64, $this->{secpa});

    $pa_bf->subtract($sec_pa_bf);
    $this->{offset_b} = $pa_bf->extract(31, 0);
    $this->{offset_i} = ($pa_bf->extract(31, 0) >> 3);
  }

  sub parse_comments {
    my $this = shift;

    return unless defined $this->{comments};
    if($this->{comments} =~ /Section\s/ or $this->{comments} =~ /TSB\s/ or
       $this->{comments} =~ /TSB_LINK\s/) {
      $this->{secpa} = $this->{pa};
    } elsif($this->{comments} =~ /from compressed 0x([\da-f]+)/) {
      $this->{secpa} = $1;
    }
    $this->calculate_offsets();
  }

  sub check_full_subsec {
    my $this  = shift;
    my $elems = shift;
    my $just_beginning = shift;

    $just_beginning = 0 unless defined $just_beginning;
    my $elemsize = @$elems;

    if(not $just_beginning) {
      is($this->size(), $elemsize,
	 "sec $this->{secname} has $elemsize elements.");
    }
    my $i = 0;
    foreach my $elem (@$elems) {
      is($this->{data}[$i], $elem,
	 "Sec $this->{secname}, check element $i.");
      $i++;
    }
  }

}

###############################################################################

{
  package Midas::Test::Symtab;
  use strict;
  use fields qw(entries);
  use Test::More;

  sub new {
    my $class = shift;
    my $this  = fields::new($class);
    $this->{entries} = {};
    return $this;
  }

  sub add_entry {
    my $this = shift;
    my $entry = shift;
    $this->{entries}{$entry->{name}} = $entry;
  }

  sub check {
    my $this = shift;
    my $list = shift;

    foreach my $elem (@$list) {
      my ($name, $va, $ra, $pa) = @$elem;
      if(not defined $pa) {
	$pa = $ra;
	undef $ra;
      }

      ok(exists $this->{entries}{$name},
	 "symbol table entry exists for '$name'");

      if(exists $this->{entries}{$name}) {
	$this->{entries}{$name}->check($va, $ra, $pa);
      }
    }

  }

}

###############################################################################

{
  package Midas::Test::SymtabEntry;
  use strict;
  use fields qw(name va ra pa);
  use Test::More;

  sub new {
    my $class = shift;
    my $name = shift;
    my $va = shift;
    my $ra = shift;
    my $pa = shift;
    my $this  = fields::new($class);
    $this->{name} = $name if defined $name;
    $this->{va} = $va if defined $va;
    $this->{ra} = $ra if defined $ra;
    $this->{pa} = $pa if defined $pa;
    return $this;
  }

  sub check {
    my $this = shift;
    my $va = shift;
    my $ra = shift;
    my $pa = shift;

    is($this->{va}, $va, "Check VA in symtab for '$this->{name}' is $va");
    if(defined $ra) {
      is($this->{ra}, $ra, "Check RA  in symtab for '$this->{name}' is $ra");
    } else {
      ok(! defined $this->{ra}, 
	 "Check RA in symtab for '$this->{name}' is undefined");
    }
    is($this->{pa}, $pa, "Check PA in symtab for '$this->{name}' is $pa");
  }

}

###############################################################################

sub parse_symtab {
  my $file = shift;
  my $fh = IO::File->new("<$file");

  my $symtab = Midas::Test::Symtab->new();

  ok(defined $fh, "Open symbol.tbl");
  return $symtab unless defined $fh;


  while(<$fh>) {
    if(/^(\S+)\s+(\S+)\s+(\S+)(\s+(\S+))/) {
      my $name = $1;
      my $va = $2;
      my $ra = $3;
      my $pa = $5;
      if(not defined $pa) {
	$pa = $ra;
	undef $ra;
      }
      my $entry = Midas::Test::SymtabEntry->new($name, $va, $ra, $pa);
      $symtab->add_entry($entry);

    }

  }
  return $symtab;
}

###############################################################################

sub parse_mem_image {
  my $file = shift;

  my $fh = IO::File->new("<$file");

  ok(defined $fh, "Open mem.image");
  return unless defined $fh;

  my @subsecs;
  my $subsec;
  while(<$fh>) {
    chomp;
    next unless /\S/;

    if(/^\s*\@(0[xX])?([\da-fA-F]+)\s*(\/\/\s*(.*))?/) {
      my $pa = $2;
      my $comment = $4;
      $subsec = Midas::Test::MemimageSubsec->new($pa, $comment);
      $subsec->parse_comments();
      push @subsecs, $subsec;

    } else {

      s/\/\/.*$//;
      next unless /\S/;

      die "No current subsec!\n" unless defined $subsec;

      my @nums = split ' ';
      $subsec->add_data(\@nums);
    }

  }

  my $memimage = Midas::Test::Memimage->new($file);
  my %sections;
  foreach my $ss (@subsecs) {
    if($ss->is_sec_start()) {
      my $section = Midas::Test::MemimageSection->new();
      $sections{$ss->{secpa}} = $section;
    }
    die "No section for subsection $ss->{pa}\n"
      unless exists $sections{$ss->{secpa}};
    $sections{$ss->{secpa}}->add_subsec($ss);
  }

  $memimage->{sections} = \%sections;
#  $memimage->debug_print();

  return $memimage;
}

###############################################################################

sub addr_to_entry {
  my $va = shift;
  my $pagesize = shift;
  my $tsbsize = shift;

  $tsbsize = 0 unless defined $tsbsize;

  tie my %va, 'BitFieldTie', 64, $va;
  my $hi = 21 + $tsbsize + 3*$pagesize;
  my $lo = 13 + 3*$pagesize;
  my $entry = $va{"$hi:$lo"};
  return $entry;
}

###############################################################################

sub new_ttehash {
  # union of all tte attributes for all mmus
  my $h =
    {
     tte_v => 1,
     tte_size => 0,
     tte_nfo => 0,
     tte_ie => 0,
     tte_soft2 => 0,
     tte_soft => 0,
     tte_l => 0,
     tte_cp => 0,
     tte_cv => 0,
     tte_e => 0,
     tte_p => 0,
     tte_w => 0,
     tte_g => 0,
     tte_context => 0,
     tte_diag => 0,

     tte_sw0 => 0,
     tte_sw1 => 0,
     tte_rsvd0 => 0,
     tte_ep    => 0,
     tte_rsvd1 => 0,

     tte_fmt => 'sun4u',
     tsbtagformat => 'tagaccess',

     bypass => 0,
    };

  return $h;
}

###############################################################################

sub va2tsbtag {
  my $va = shift;
  my $ttehash = shift;
  my $mmutype = shift;

  return $va if $ttehash->{is_link};
  my $format = defined $ttehash->{tsbtagfmt} ?
    $ttehash->{tsbtagfmt} : 'tagaccess';

  my $tag = tte_hash_to_tsb_tag($mmutype, $format, $ttehash,
				$va, 0);
  $tag = 'XXXXXXXXXXXXXXXX' unless defined $tag;
  return $tag;
}

###############################################################################

sub ra2tsbdata {
  my $ra      = shift;
  my $ttehash = shift;
  my $mmutype = shift;

  return $ra if $ttehash->{is_link};
  $mmutype = 'niagara' unless defined $mmutype;
  $mmutype = lc $mmutype;


  my $data = tte_hash_to_tsb_data($mmutype, $ttehash->{tte_fmt},
				  $ttehash, $ra);

  $data = 'XXXXXXXXXXXXXXXX' unless defined $data;
  return $data;
}


###############################################################################

sub verbose_args {
  my $verbose = shift;
  my $tofile = shift;

  $tofile = 0 unless defined $tofile;

  if(not $verbose) {
    if($tofile) {
      return qw(-v 2 -print_errors);
    } else {
      return qw(-v 0 -noprint_errors);
    }
  } else {
    return qw(-v 2 -print_errors);
  }
}

###############################################################################

sub dir_args {
  my $resultdir = shift;
  return ('-build_dir', $resultdir, '-dest_dir', $resultdir, '-nocleanup');
}

###############################################################################
1;
