# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: PostProcessing.pm
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

package Midas::PostProcessing;
use strict;
use warnings;

use IO::File;
use IO::Pipe;
use File::Basename;
use Midas::Command;
use Midas::Configure;
use Midas::State;
use Midas::Paths;
use Midas::Section;
use Midas::Globals;
# Cant' use Assembly ':internals' because of include circularity
use Midas::Preprocess ':internals';
use Midas::Application;
use Midas::Error;
use Midas::Segment;

require Exporter;

our @ISA         = qw(Exporter);
our @EXPORT      = qw();
our @EXPORT_OK   = qw();

our @common_exports = qw(
			 generate_events
			);
our @asm_exports    = qw(generate_image
			 postprocess_assembly
			);
our @external_exports = qw(postprocess_assembly);
our %EXPORT_TAGS = (
		    common   => [ @common_exports ],
		    asm      => [ @asm_exports, @common_exports ],
		    external => [ @external_exports ],
		    all      => [ @asm_exports, @common_exports ],
		   );

Exporter::export_ok_tags('common', 'asm', 'external', 'all');


##############################################################################

sub postprocess_assembly {
  my $image    = shift;
  my $symtab   = shift;
  my $sfile    = shift;
  my $events   = shift;

  banner "POSTPROCESSING PHASE";

  generate_image($image);
  generate_events($sfile, $events);
}

##############################################################################

sub generate_image {
  my $image    = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);


  $image    = path_to_build_file($CONFIG{local_image}, $STATE)
    unless defined $image;

  my $symtab = path_to_build_file($CONFIG{local_symtab}, $STATE);

  my $goldfinger =  path_to_build_file($CONFIG{local_goldfinger}, $STATE);

  chat "Generating $goldfinger...\n";

  my $fh = IO::File->new(">$goldfinger") or
    fatal "Can't open $goldfinger: $!\n", M_FILE;


  print $fh "PA_SIZE = $PASIZE;\n";
  print $fh "\n";

  foreach my $app (keys %{$STATE->{apps}}) {
    my $appobj = $STATE->{apps}{$app};
    $appobj->write_to_goldfinger($fh);
  }


  foreach my $tsbname (keys %{$STATE->{tsbs}}) {
    my $tsb = $STATE->{tsbs}{$tsbname};
    $tsb->write_to_goldfinger_file($fh) if $tsb->is_touched();
  }

  foreach my $tsblinkname (keys %{$STATE->{tsblinks}}) {
    my $tsblink = $STATE->{tsblinks}{$tsblinkname};
    $tsblink->write_to_goldfinger_file($fh) if $tsblink->is_touched();
  }
  foreach my $tsbcsmname (keys %{$STATE->{tsbcsms}}) {
    my $tsbcsm = $STATE->{tsbcsms}{$tsbcsmname};
    $tsbcsm->write_to_csm_goldfinger_file($fh) if $tsbcsm->is_touched();
  }

  foreach my $tsbcsmlinkname (keys %{$STATE->{tsbcsmlinks}}) {
    my $tsbcsmlink = $STATE->{tsbcsmlinks}{$tsbcsmlinkname};
    $tsbcsmlink->write_to_csm_goldfinger_file($fh) if $tsbcsmlink->is_touched();
  }

  undef $fh;

  my $Prg = basename $0;

  my $error_opt = $Midas::Error::Print_Errors ? '' : '-noprint_errors ';

  my $verbose = ($CONFIG{verbose} == 0) ? '-silent ' :
    ($CONFIG{verbose} == 2) ? '-v ' : '';
  my $compress_opt = $CONFIG{compress_image} ? '' : '-nocompress ';
  my $allow_tsb_conflicts_opt = $CONFIG{allow_tsb_conflicts} ?
    '-allow_tsb_conflicts ' : '';
  my $allow_duplicate_tags_opt = $CONFIG{allow_duplicate_tags} ?
    '-allow_duplicate_tags ' : '';
  my $zero_env_opt = $CONFIG{env_zero} ? '' : '-noenvzero ';

  my $opts = "${error_opt}${compress_opt}${allow_tsb_conflicts_opt}".
    "${allow_duplicate_tags_opt}${zero_env_opt}";

  my $command =
    "$CONFIG{goldfinger_cmd} ${verbose}-in $goldfinger ".
    "-gentsbs -genimage -imagefile $image -gensymtab -symtabfile $symtab ".
    "${opts}-prefix '${Midas::Error::Prg}: '";

  run_command($command, '-pass_errcode');

  if (-e $symtab) {
    chat "$symtab successfully created.\n";
  } else {
    fatal "$symtab could not be generated.\n", M_GENFAIL;
  }

  if (-e $image) {
    chat "$image successfully created.\n";
  } else {
    fatal "$image could not be generated.\n", M_GENFAIL;
  }


}

##############################################################################

sub generate_events {
  my $m4file  = shift;
  my $symtab  = shift;
  my $events  = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  $m4file = path_to_build_file($CONFIG{local_m4}, $STATE)
    unless defined $m4file;
  $symtab = path_to_build_file($CONFIG{local_symtab}, $STATE)
    unless defined $symtab;
  $events = path_to_build_file($CONFIG{local_events}, $STATE)
    unless defined $events;

  chat "Generating $events...\n";

  chat "Loading symbol table from $symtab.\n", 3;
  local ($_);
  my (%vahash, %rahash, %pahash);
  my $ifh = IO::File->new("<$symtab") or fatal "Can't open $symtab: $!\n",
    M_FILE;
  while(<$ifh>) {
    my ($sym, $va, $ra, $pa) = /([\w_\.]+)\s+(\w+)\s+(\w+)(?:\s+(\w+))/;
    next unless defined $va && defined $ra;
    if(not defined $pa) {
      $pa = $ra;
      undef $ra;
    }
    $vahash{$sym} = $va;
    $rahash{$sym} = $ra if defined $ra;
    $pahash{$sym} = $pa;
  }
  undef $ifh;

  my $ofh = IO::Pipe->new();
  my $m4_incs = join ' ', map { "--include=$_"} get_m4_includes();
  my $command = "$CONFIG{m4_cmd} $m4_incs > $events";
  $ofh->writer("$command") or
    fatal "Cannot run m4 to create $events: $!\n", M_GENFAIL;

  $ofh->print("changequote({, })dnl\n");

  my $full_line = "";
  my $ev_null = 1;
  my $ev_collect = 0;
  my $ev_eval = 0;

  $ifh = IO::File->new("<$m4file") or
    fatal "Can't open file $m4file for reading: $!\n", M_FILE;


 CPPFL_LINE:
  while (<$ifh>) {
    my ($evline) = /.*!\s*\$EV\s+(.*)$/;
    my ($evlinep) = /.*!\s*\$EV\+\s+(.*)$/;

    # supress warnings
    $evline  = "" unless defined $evline;
    $evlinep = "" unless defined $evlinep;

    if ($ev_null == 1) {
      if ($evlinep ne "") {
	fatal "Error in parsing event $_", M_EVENTERR;
      }
      if ($evline ne "") {
	$ev_null = 0;
	$ev_collect = 1;
	$full_line .= $evline;
	next CPPFL_LINE;
      }
    }
    if ($ev_collect == 1) {
      if ($evlinep ne "") {
	$full_line .= $evlinep;
      }
      elsif ($evline ne "") {
	$ev_eval = 1;
      }
      else {
	$ev_eval = 1;
	$ev_null = 1;
	$ev_collect = 0;
      }
    }
    if ($ev_eval == 1) {
      $_ = $full_line;
      my $va;
      while (/.*\@VA\([\w_\.]*\).*$/) {
	($va) = /VA\(([\w_\.]*)\)/;
	if (not defined $vahash{$va})
	  {fatal "Error in va address: $_\n", M_EVENTERR;}
	s/\@VA\([\w_\.]*\)/"0x$vahash{$va}"/e;
      }
      while (/.*\@RA\([\w_\.]*\).*$/) {
	($va) = /RA\(([\w_\.]*)\)/;
	if (not defined $rahash{$va})
	  {fatal "Error in ra address: $_\n", M_EVENTERR;}
	s/\@RA\([\w_\.]*\)/"0x$rahash{$va}"/e;
      }
      while (/.*\@PA\([\w_\.]*\).*$/) {
	($va) = /PA\(([\w_\.]*)\)/;
	if (not defined $pahash{$va})
	  {fatal "Error in pa address: $_\n", M_EVENTERR;}
	s/\@PA\([\w_\.]*\)/"0x$pahash{$va}"/e;
      }
      while (/.*expr.*$/) {
	s/expr/"{64'h}mpeval"/e;
      }
      $ofh->print("$_\n");
      $ev_eval = 0;
      $full_line = $evline;
    }
  }

  undef $ifh;
  $ofh->close();

  if($?) {
    my $status = $?;
    my $exit = $status >> 8;
    my $sig  = $status & 127;
    my $core = $status & 128;
    my $core_msg = $core ? "Dumped core." : "";

    if($sig) {
      fatal "Command \"$command\" died via signal $sig. $core_msg\n",
	M_GENFAIL;
    }

    fatal "Command \"$command\" failed with status $exit. $core_msg\n",
      M_GENFAIL;
  }

  undef $ofh;

  if(-e $events) {
    chat "$events successfully created.\n";
  } else {
    fatal "$events could not be generated.\n", M_GENFAIL;
  }
}

##############################################################################
1;
