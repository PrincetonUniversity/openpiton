# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Error.pm
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

package Midas::Error;

use strict;

use File::Basename;

use Exporter;


our $Prg = basename $0;
our $ERR = "$Prg: FATAL ERROR";

our @ISA       = qw(Exporter);

our $Print_Errors = 1;

# IMPORTANT!
# The error codes need to be kept consistent with goldfinger/gf_error.h
# since the error codes from goldfinger are passed through to midas!

use constant M_NOERROR         => 0;
use constant M_MISC            => 1;
use constant M_CODE            => 2;
use constant M_DIR             => 3;
use constant M_FILE            => 4;
use constant M_CMDFAIL         => 5;
use constant M_SECSYNTAX       => 6;
use constant M_ATTRSYNTAX      => 7;
use constant M_MISSINGPARAM    => 8;
use constant M_ILLEGALPARAM    => 9;
use constant M_OUTOFRANGE      => 10;
use constant M_NOTNUM          => 11;
use constant M_VACOLLIDE       => 12;
use constant M_PACOLLIDE       => 13;
use constant M_DIRECTIVESYNTAX => 14;
use constant M_GENFAIL         => 15;
use constant M_ASMFAIL         => 16;
use constant M_CCFAIL          => 17;
use constant M_LINKFAIL        => 18;
use constant M_CPPFAIL         => 19;
use constant M_M4FAIL          => 20;
use constant M_BADCONFIG       => 21;
use constant M_EVENTERR        => 22;
use constant M_ARGERR          => 23;
use constant M_NOSEC           => 24;
use constant M_BADTSB          => 25;
use constant M_BADALIGN        => 26;
use constant M_EMPTYSECTION    => 27;
use constant M_TSBSYNTAX       => 28;
use constant M_APPSYNTAX       => 29;
use constant M_MEMORY          => 30;
use constant M_GOLDFINGERPARSE => 31;
use constant M_GOLDFINGERARG   => 32;
use constant M_ELF             => 33;
use constant M_BADLABEL        => 34;
use constant M_GOLDFINGERMISC  => 35;
use constant M_GOLDFINGERVERSION  => 36;
use constant M_DUPLICATETAG    => 37;
use constant M_BLOCKSYNTAX     => 38;


our %ERRCODES =
  (
   M_NOERROR()         => "M_NOERROR (#%d): No error.",
   M_MISC()            => 'M_MISC (#%d): Miscellaneous error.',
   M_CODE()            => 'M_CODE (#%d): Error in midas code.',
   M_DIR ()            => 'M_DIR (#%d): Directory error.',
   M_FILE()            => 'M_FILE (#%d): File error.',
   M_CMDFAIL()         => 'M_CMDFAIL (#%d): Command failed.',
   M_SECSYNTAX()       => 'M_SECSYNTAX (#%d): Error in section syntax.',
   M_ATTRSYNTAX()      => 'M_ATTRSYNTAX (#%d): Error in attr syntax.',
   M_MISSINGPARAM()    => 'M_MISSINGPARAM (#%d): Missing parameter.',
   M_ILLEGALPARAM()    => 'M_ILLEGALPARAM (#%d): Illegal parameter.',
   M_OUTOFRANGE()      => 'M_OUTOFRANGE (#%d): Out of range.',
   M_NOTNUM()          => 'M_NOTNUM (#%d): Not a number.',
   M_VACOLLIDE()       => 'M_VACOLLIDE (#%d): VA collision.',
   M_PACOLLIDE()       => 'M_PACOLLIDE (#%d): PA collision.',
   M_DIRECTIVESYNTAX() => 'M_DIRECTIVESYNTAX (#%d): Directive syntax error.',
   M_GENFAIL()         => 'M_GENFAIL (#%d): File generation failed.',
   M_ASMFAIL()         => 'M_ASMFAIL (#%d): Assembler failed.',
   M_CCFAIL()          => 'M_CCFAIL (#%d): C compiler failed.',
   M_LINKFAIL()        => 'M_LINKFAIL (#%d): Linker failed.',
   M_CPPFAIL()         => 'M_CPPFAIL (#%d): CPP failed.',
   M_M4FAIL()          => 'M_M4FAIL (#%d): M4 preprocessor failed.',
   M_BADCONFIG()       => 'M_BADCONFIG (#%d): Bad configuration.',
   M_EVENTERR()        => 'M_EVENTERR (#%d): Event parsing error.',
   M_ARGERR()          => 'M_ARGERR (#%d): Argument error.',
   M_NOSEC()           => 'M_NOSEC (#%d): Undefined section.',
   M_BADTSB()          => 'M_BADTSB (#%d): Bad TSB.',
   M_BADALIGN()        => 'M_BADALIGN (#%d): Bad Alignment.',
   M_EMPTYSECTION()    => 'M_EMPTYSECTION (#%d): Empty section.',
   M_TSBSYNTAX()       => 'M_TSBSYNTAX (#%d): Error in tsb syntax.',
   M_APPSYNTAX()       => 'M_APPSYNTAX (#%d): Error in app syntax.',
   M_MEMORY()          => 'M_MEMORY (#%d): Memory error.',
   M_GOLDFINGERPARSE() => 'M_GOLDFINGERPARSE (#%d): Goldfinger parse error.',
   M_GOLDFINGERARG()   => 'M_GOLDFINGERARG (#%d): Goldfinger arg error.',
   M_ELF()             => 'M_ELF (#%d): ELF error.',
   M_BADLABEL()        => 'M_BADLABEL (#%d): Bad label.',
   M_GOLDFINGERMISC()  => 'M_GOLDFINGERMISC (#%d): Uncategorized goldfinger error.',
   M_GOLDFINGERVERSION() => 'M_GOLDFINGERVERSION (#%d): Bad version of goldfinger',
   M_DUPLICATETAG()    => 'M_DUPLICATETAG (#%d): Duplicate tags in TSB',
   M_BLOCKSYNTAX()     => 'M_BLOCKSYNTAX (#%d): Error defining goldfinger BLOCK'
  );

our @Error_Codes = qw(
		      M_NOERROR
		      M_MISC
		      M_CODE
		      M_DIR
		      M_FILE
		      M_CMDFAIL
		      M_SECSYNTAX
		      M_ATTRSYNTAX
		      M_MISSINGPARAM
		      M_ILLEGALPARAM
		      M_OUTOFRANGE
		      M_NOTNUM
		      M_VACOLLIDE
		      M_PACOLLIDE
		      M_DIRECTIVESYNTAX
		      M_GENFAIL
		      M_ASMFAIL
		      M_CCFAIL
		      M_LINKFAIL
		      M_CPPFAIL
		      M_M4FAIL
		      M_BADCONFIG
		      M_EVENTERR
		      M_ARGERR
		      M_NOSEC
		      M_BADTSB
		      M_BADALIGN
		      M_EMPTYSECTION
		      M_TSBSYNTAX
		      M_APPSYNTAX
		      M_MEMORY
		      M_GOLDFINGERPARSE
		      M_GOLDFINGERARG
		      M_ELF
		      M_BADLABEL
		      M_GOLDFINGERMISC
		      M_GOLDFINGERVERSION
		      M_DUPLICATETAG
		      M_BLOCKSYNTAX
		     );

our @EXPORT = (qw(
		  @Error_Codes
		  %ERRCODES
		  handle_error
		  get_error_code
		  init_error
		  suppress_error_messages
		  errcode_to_string
		 ), @Error_Codes);


###############################################################################

sub init_error {
  $Print_Errors = 1;
}

###############################################################################

sub suppress_error_messages {
  $Print_Errors = 0;
}

###############################################################################

sub errcode_to_string {
  my $code = shift;

  if(not exists $ERRCODES{$code}) {
    return "Invalid error code \"$code\"";
  }
  return sprintf $ERRCODES{$code}, $code;
}

###############################################################################

sub handle_error {
  my $errobj = shift;

  return 0 unless defined $errobj;
  return 0 unless $errobj;

  my ($pkg, $file, $line) = caller;
  print STDERR "$Prg: At pkg=$pkg, file=$file, line=$line\n" if $Print_Errors;

  if(not ref $errobj) {
    $errobj = Midas::Error->throw($errobj);
  }

  die "Unknown exception \"$errobj\"\n" unless $errobj->can('catch');
  return $errobj->catch();
}

###############################################################################

sub get_error_code {
  my $errobj = shift;

  return 0 unless defined $errobj;
  return 0 unless $errobj;
  return M_CODE unless ref $errobj;
  return M_CODE unless $errobj->can('catch');
  return $errobj->{code};
}

###############################################################################

sub throw {
  my $class = shift;
  my $msg = shift;
  my $code = shift;
  $code = M_MISC unless defined $code;

  $class = ref $class if ref $class;
  my $this = bless {}, $class;
  $this->{code} = $code;
  $this->{msg}  = $msg;

  return $this;
}

###############################################################################

sub catch {
  my $this = shift;

  my $msg = $this->{msg};

  $this->{code} = M_CODE unless exists $ERRCODES{$this->{code}};
  my $codemsg = errcode_to_string($this->{code});

  $msg = "$codemsg\n$msg";

  my @lines = split /\n/, "$msg";
  my $string = join "\n", map { "$ERR: $_" } @lines;

  print STDERR "$string\n" if $Print_Errors;

  return $this->{code};
}

###############################################################################
1;
