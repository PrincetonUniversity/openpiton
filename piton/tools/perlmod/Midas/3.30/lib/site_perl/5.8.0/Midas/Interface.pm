# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Interface.pm
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

package Midas::Interface;

use strict;
require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(midas);

use Getopt::Long;
use File::Spec;
use File::Find;
use File::Basename;
use FindBin '$Bin';
use Cwd;

use Midas::Globals;


use Midas::Command;

use Midas::Error;

# These modules are used, but they are brought in lazily if needed to speed
# up the case where they're not.

#use Midas::Configure;
#use Midas::Assembler;


###############################################################################
###############################################################################

our @Configurable_commands = qw(pal cpp m4 as ld gcc);

sub midas {
  my @argv = @_;

  my $startdir = getcwd;

  eval {

    local (@ARGV) = @argv;

    clear_globals();
    init_error();


    # set defaults
    my %opt =
      (
       h             => 0,
       verbose       => 2,
       stdinc        => 1,
       include_build => 0,
       include_start => 0,
       stddef        => 1,
       E             => 0,
       print_errors  => 1,
       dest_dir      => '.',

#       build_threads  => 3,
       copy_products  => 0,
       gen_all_tsbs   => 0,
      );


    my @options =
      qw(
	 h
	 stdinc!
	 stddef!
	 include_build!
	 include_start!
	 verbose|v:i
	 noverbose|nov
	 version
	 format
	 find
	 find_root=s
	 E
	 I=s@
	 D=s@
	 L=s@
	 C=s@
	 diag_root=s
	 build_dir=s
	 dest_dir=s
	 mmu=s
	 ttefmt=s
	 csm_en!
	 tsbtagfmt=s
	 cleanup!
	 force_cleanup!
	 force_build|f!
	
	 build_threads=i
	 copy_products!
	 gen_all_tsbs!

	 file=s@

	 start_phase=s
	 phase=s@

	 print_errors!
	 allow_tsb_conflicts!
	 allow_empty_sections!
	 allow_illegal_page_sizes!
	 allow_duplicate_tags!
	 allow_misaligned_tsb_base!
	 compress_image!
	 env_zero!
	 default_radix=s
	 errcode=i
	 pal_diag_args=s@
	 config=s
	 project=s
	);

    foreach my $cmd (@Configurable_commands) {
      my $use_standard_option = "std_${cmd}_args";
      my $args_option         = "${cmd}_args";
      my $cmd_option          = "${cmd}_cmd";
      $opt{$use_standard_option} = 1;  # make standard the default
      push @options,
	"${use_standard_option}!", "${args_option}=s@", "${cmd_option}=s";
    }

    my @save_argv = @ARGV;

    # Make -D and -I options more palatable to GetOptions
    @ARGV = map { /^(-[DILC])(\S.*)/ ? ($1, $2) : $_ } @ARGV;

    GetOptions(\%opt, @options) or fatal("Command-line parsing failed.\n",
					 M_ARGERR);
    usage(-exitval => M_NOERROR, -verbose => 2) if $opt{h};

    if(defined $opt{version} and $opt{version}) {
      print "Location: $0\n";
      print "Version:  $Midas::VERSION\n";
      exit M_NOERROR;
    }

    if(defined $opt{errcode}) {
      my $string = errcode_to_string($opt{errcode});
      print "CODE \"$opt{errcode}\"= $string\n";
      exit M_NOERROR;
    }

    if($opt{print_errors} == 0) {
      suppress_error_messages();
    }

    if(defined $opt{format} and $opt{format}) {
      my $fmt = File::Spec->catfile($Bin, 'midasformat');
      die "Cannot find \"$fmt\"\n" unless -e $fmt;
      system($fmt);
      exit M_NOERROR;
    }


    $opt{verbose} = 0 if defined $opt{noverbose} && $opt{noverbose};

    my $diag = shift @ARGV;
    fatal "No diag specified!\n", M_ARGERR unless defined $diag;

    if(not defined $opt{diag_root}) {
      if(exists $ENV{DV_ROOT} and defined $ENV{DV_ROOT}) {
	$opt{diag_root} = $ENV{DV_ROOT};
      } else {
	bad_arg("No -diag_root specified and DV_ROOT not set!\n");
      }
    }

    $opt{find} = 1 if (defined $opt{find_root} and $opt{find_root} ne '');
    if(defined $opt{find}) {
      my $find_root = (defined $opt{find_root} and $opt{find_root} ne '') ?
	$opt{find_root} : File::Spec->catdir($opt{diag_root}, 'verif', 'diag');
      $diag = find_diag($diag, $find_root);
    }



    if(defined $opt{ttefmt} and $opt{ttefmt} ne 'sun4u' and 
       $opt{ttefmt} ne 'sun4v') {
      bad_arg("Illegal -ttefmt setting.  Legal values are sun4u and sun4v.\n");
    }

    if(defined $opt{tsbtagfmt} and $opt{tsbtagfmt} ne 'tagaccess' and
       $opt{tsbtagfmt} ne 'tagtarget') {
      bad_arg("Illegal -tsbtagfmt setting '$opt{tsbtagfmt}'.  ".
	      "Legal values are tagaccess and tagtarget.\n");
    }

    if(defined $opt{default_radix} and $opt{default_radix} ne 'decimal' and
       $opt{default_radix} ne 'hex') {
      bad_arg("Illegal -default_radix setting.\n".
	      "Legal values are 'decimal' and 'hex'.\n");
    }

    if($opt{project}) {
      $PROJECT = $opt{project};
    }

    if($opt{config}) {
      $CONFIG_FILE = $opt{config};
    }

    my %config_args;
    my @config_list =
      qw(
	 mmu build_dir cleanup force_cleanup force_build allow_tsb_conflicts
	 allow_empty_sections allow_illegal_page_sizes allow_duplicate_tags
	 allow_misaligned_tsb_base env_zero
	 compress_image ttefmt csm_en tsbtagfmt default_radix build_threads
	 copy_products gen_all_tsbs verbose
	);
    foreach my $key (@config_list) {
      $config_args{$key} = $opt{$key} if (exists $opt{$key} and
					  defined $opt{$key});
    }
    # special-case.  Config name different from option name
    if(exists $config_args{mmu}) {
      $config_args{mmu_type} = $config_args{mmu};
      delete $config_args{mmu};
    }


    ###########################################################################

    # Configure module

    ###########################################################################

    my %config;
    # Midas::Configure takes a while to load.  Only use it if necessary
    my $code = q{
		  use Midas::Configure;

		  init_config();

		  %config =
		  Midas::Configure::configure
		  ( %config_args );
		 };

    eval $code;
    die $@ if $@;

    chat "midas @argv\n", 1;


    ### Configure include paths

    if(not $opt{stdinc}) {
      my @build = ($opt{include_build} ? (builddir => ['.']) : ());
      my @start = ($opt{include_start} ? (startdir => ['.']) : ());
      %config =
	Midas::Configure::configure(
				    cpp_includes => { @build, @start },
				    m4_includes  => { @build, @start },
				    c_includes   => { @build, @start },
				   );
    }

    if(defined $opt{I} and @{$opt{I}}) {
      my $cwd = getcwd;
      my @incs = map { File::Spec->rel2abs($_, $cwd) } @{$opt{I}};
      Midas::Configure::add_cpp_includes(@incs);
      Midas::Configure::add_m4_includes(@incs);
    }

    if(defined $opt{L} and @{$opt{L}}) {
      my $cwd = getcwd;
      my @incs = map { File::Spec->rel2abs($_, $cwd) } @{$opt{L}};
      Midas::Configure::add_link_includes(@incs);
    }

    if(defined $opt{C} and @{$opt{C}}) {
      my $cwd = getcwd;
      my @incs = map { File::Spec->rel2abs($_, $cwd) } @{$opt{C}};
      Midas::Configure::add_csrc_includes(@incs);
    }

    if(defined $opt{pal_diag_args}) {
      Midas::Configure::add_pal_diag_args(@{$opt{pal_diag_args}});
    }

    ### Configure defines

    if(not $opt{stddef}) {
      %config =
	Midas::Configure::configure( cpp_defines => [] );
    }

    if(defined $opt{D} and @{$opt{D}}) {
      Midas::Configure::add_cpp_defines(@{$opt{D}});
    }

    ### Configure commands

    foreach my $command (@Configurable_commands) {
      configure_command_options($command,
				$opt{"std_${command}_args"},
				$opt{"${command}_args"},
				$opt{"${command}_cmd"},
				\%config);
    }

    ### Configure file names

    configure_file_names($opt{file}, \%config) if defined $opt{file};

    ###########################################################################
    # Call magic function
    ###########################################################################

    if($opt{E}) {
      push @{$opt{phase}}, qw(setup preprocess);
    }


    $code = q{
	       # Midas::Assembly takes a while to load.  Only parse
	       # it if necessary.
	       use Midas::Assembly;


	       assemble_diag($diag,
			     -dest_dir  => $opt{dest_dir},
			     -diag_root => $opt{diag_root},
			     (map { -phase => $_ } @{$opt{phase}}),
			     (defined $opt{start_phase} ?
			      (-start_phase => $opt{start_phase}) : ()
			     ),
			     -argv => "@argv",
			    );
	      };

    eval $code;
    die $@ if $@;  # Throw up any exceptions to next level handler

  };

  chdir $startdir;

  return handle_error($@);
}
###############################################################################
###############################################################################

sub usage {
  my @args = @_;

  my $code = q{

		use Pod::Usage;

		pod2usage(@args);

	       };

  eval $code;
  die "Can't load Pod::Usage!: $@\n" if $@;
}

###############################################################################

sub bad_arg {
  my $message = shift;
  fatal $message, M_ARGERR;
}

##############################################################################

sub configure_command_options {
  my $command      = shift;
  my $use_standard = shift;
  my $add_args     = shift;
  my $cmd_option   = shift;
  my $configref    = shift;

  if(not defined $configref) {
    my %c = Midas::Configure::configure() unless defined $configref;
    $configref = \%c;
  }

  my $opt_config_key = "${command}_opt";
  my $cmd_config_key = "${command}_cmd";

  bad_arg("No such command \"$command\".\n")
    unless exists $configref->{$opt_config_key};

  if(not $use_standard) {
    Midas::Configure::configure($opt_config_key => []);
  }
  if(defined $add_args and @$add_args) {
    Midas::Configure::append_configuration($opt_config_key => $add_args);
  }
  if(defined $cmd_option) {
    Midas::Configure::configure($cmd_config_key => $cmd_option);
  }
}

##############################################################################

sub configure_file_names {
  my $file_list = shift;
  my $configref = shift;

  if(not defined $configref) {
    my %c = Midas::Configure::configure() unless defined $configref;
    $configref = \%c;
  }

  my @config;
  foreach my $spec (@$file_list) {
    bad_arg("-file argument is tag=name.\n")
      unless $spec =~ /^(\S+)=(\S.*)$/;
    my ($file, $name) = ($1, $2);
    my $config_tag = "local_$file";
    bad_arg("File tag \"$file\" is not a configurable file.\n")
      unless exists $configref->{$config_tag};
    push @config, $config_tag, $name;
  }
  Midas::Configure::configure(@config) if @config;

}

##############################################################################

sub find_diag {
  my $diag = shift;
  my $root = shift;

  my $diag_base = basename $diag;
  bad_arg("When -find is used, diag \"$diag\" should be a name, ".
	  "not a path.\n") if ($diag ne $diag_base);

  bad_arg("Can't find with root \"$root\": No such directory.\n")
    unless -d $root;

  my $found;
  my $found_ref = \$found;
  my $wanted = sub {
    if($diag_base eq $_) {
      $$found_ref = $File::Find::name;
    }
  };

  find($wanted, $root);

  bad_arg("Could not find file \"$diag\" in root \"$root\".\n")
    unless defined $found;

  return $found;
}

###############################################################################
###############################################################################
1;
