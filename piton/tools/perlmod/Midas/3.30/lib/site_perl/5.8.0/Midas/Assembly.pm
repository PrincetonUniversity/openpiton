# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Assembly.pm
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

package Midas::Assembly;
use strict;
use warnings;

use File::Copy;
use File::Spec;
use Getopt::Long;
use Cwd;
use IO::File;
use File::Basename;
use Tie::IxHash;

use Midas::Setup ':all';
use Midas::Preprocess ':all';

use Midas::State;
use Midas::Globals;
use Midas::Configure;
use Midas::Paths;
use Midas::Command;
use Midas::PostProcessing ':asm';
use Midas::Error;
use Midas::Segment;
use Midas::Section;


use Midas::TSB;

require Exporter;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(assemble_diag);
our @EXPORT_OK = qw();

our %EXPORT_TAGS =
  (
   'all' => [
	     @{$Midas::Setup::EXPORT_TAGS{all}},
	     @{$Midas::Preprocess::EXPORT_TAGS{all}},

	     qw(
		create_sections
		assemble_sections

		create_sections
		write_linker_scripts
	       ),
	    ],
   internals => [ qw(
		     setup_files
		     preprocess
		     create_sections
		     assemble_sections
		     assembly_cleanup

		     create_sections
		     write_linker_scripts
		    ),
		  @{$Midas::Setup::EXPORT_TAGS{internals}},
		  @{$Midas::Preprocess::EXPORT_TAGS{internals}}
		],
  );
Exporter::export_ok_tags('internals', 'all');

our @Options = qw(
		  start_dir=s
		  dest_dir=s
		  diag_root=s
		  phase=s@
		  start_phase=s
		  state=s
		  argv=s
		 );


##############################################################################

sub assemble_diag {
  my @args = @_;

  my %opt = (
	    );
  local (@ARGV) = @args;

  GetOptions(\%opt, @Options) or
    fatal "Error in arguments to assemble_diag!\n", M_ARGERR;

  init_section();

  my %phases;
  tie %phases, 'Tie::IxHash';
  %phases =
    (
     setup       => 1,
     preprocess  => 1,
     sectioning  => 1,
     assemble    => 1,
     link        => 1,
     postprocess => 1,
     copydest    => 1,
     cleanup     => 1,
    );

  if(exists $opt{phase} and defined $opt{phase}) {
    foreach my $key (keys %phases) {
      $phases{$key} = 0;
    }
      foreach my $phase (@{$opt{phase}}) {
	fatal "No such phase $phase!\n", M_ARGERR
	  unless exists $phases{$phase};
	$phases{$phase} = 1;
      }
    $CONFIG{force_build} = 1;
  }

  if(exists $opt{start_phase} and defined $opt{start_phase}) {
    fatal "No such phase $opt{start_phase}!\n", M_ARGERR
      unless exists $phases{$opt{start_phase}};
    foreach my $phase (keys %phases) {
      last if $phase eq $opt{start_phase};
      $phases{$phase} = 0;
    }
    $CONFIG{force_build} = 1;
  }

  if(exists $opt{state} and defined $opt{state}) {

    my $state = $opt{state};

    fatal "State argument isn't a Midas::State object!\n", M_ARGERR unless
      (ref $state) && $state->isa('Midas::State');

    if(exists $opt{start_dir} and defined $opt{start_dir}) {
      chat "WARNING: -start_dir ignored when -state is also present.\n"
    }
    if(exists $opt{dest_dir} and defined $opt{dest_dir}) {
      chat "WARNING: -dest_dir ignored when -state is also present.\n"
    }
    if(exists $opt{diag_root} and defined $opt{diag_root}) {
      chat "WARNING: -diag_root ignored when -state is also present.\n"
    }

    $STATE = $state

  } else {
    $opt{start_dir} = getcwd        unless defined $opt{start_dir};
    $opt{dest_dir}  = getcwd        unless defined $opt{dest_dir};
    $opt{diag_root} = $ENV{DV_ROOT} unless defined $opt{diag_root};
    $STATE =
      init_state($opt{diag_root}, $opt{start_dir}, $opt{dest_dir});
  }

  my $diag = shift @ARGV;
  fatal "No diag specified to assemble_diag!\n", M_ARGERR
    unless defined $diag;

  chat "Running from $0\n", 2;

  my $argsfile    = path_to_build_file($CONFIG{local_cmdfile}, $STATE);
  my $oldargsfile = path_to_build_file($CONFIG{local_oldcmdfile}, $STATE);
  my $m4file      = path_to_build_file($CONFIG{local_m4}, $STATE);
  my $oldm4file   = path_to_build_file($CONFIG{local_oldm4}, $STATE);


  unlink $oldargsfile if -e $oldargsfile;
  unlink $oldm4file   if -e $oldm4file;

  move $argsfile, $oldargsfile if -e $argsfile;
  move $m4file, $oldm4file     if -e $m4file;

  my $skip_build = 0;
  setup_files($diag)   if $phases{setup};


  # Recompute these after setup since cwd has probably changed
  $argsfile    = path_to_build_file($CONFIG{local_cmdfile}, $STATE);
  $oldargsfile = path_to_build_file($CONFIG{local_oldcmdfile}, $STATE);
  $m4file      = path_to_build_file($CONFIG{local_m4}, $STATE);
  $oldm4file   = path_to_build_file($CONFIG{local_oldm4}, $STATE);


  if($opt{argv}) {
    my $ofh = IO::File->new(">$argsfile") or
      fatal "Can't open '$argsfile': $!\n", M_FILE;

    print $ofh "midas $opt{argv}\n";
    undef $ofh;
  }


  preprocess()           if $phases{preprocess};

  if((!$CONFIG{force_build}) and
     (-e $oldargsfile) and
     (-e $oldm4file) and
     (-e $argsfile) and
     (are_files_same($oldargsfile, $argsfile)) and
     (are_files_same($oldm4file, $m4file)))
    {

      my @req_source_files = map { expand_product_file($_) }
	@{$CONFIG{product_files}{required}};
      my @opt_source_files = map { expand_product_file($_) }
	@{$CONFIG{product_files}{optional}};

      my $have_sources = 1;
      foreach my $req_source (@req_source_files) {
	next if $req_source =~ /\*/;
	$have_sources &&= (-e $req_source);
      }
      if($have_sources) {


	# Want to get the right exe files.  Big hack here.  Create
	# some application objects so that the copy phase will work correctly.

	my @app_lines =
	  `$CONFIG{perl_cmd} -n -e 'print if /^\\s*APPLICATION/' $m4file`;

	if($@) {
	  # Can't get app lines.  Oh well, just build normally.
	} else {

	  my @apps;
	  my $has_default = 0;
	  foreach my $app_line (@app_lines) {
	    if($app_line =~ /^\s*APPLICATION\s*(\S+)/) {
	      my $name = $1;
	      $has_default = 1 if $name eq 'default';
	      push @apps, $name;
	    }
	  }
	  push @apps, 'default' unless $has_default;

	  foreach my $app (@apps) {
	    my $appobj = Midas::Application->new(name => $app);
	    $STATE->{apps}{$app} = $appobj;
	  }


	  chat "Same args, same input, old products still exist.  ".
	    "My work here is done.\n", 1;
	  $skip_build = 1;

	}
      }
    }

  $STATE->skipping_build($skip_build);

  if(not $skip_build) {

    my @product_files = map { expand_product_file($_) }
      @{$CONFIG{product_files}{clean}};

    if(@product_files) {
      my $files_string = join ' ', @product_files;
      run_command("rm -f $files_string", -errcode => M_FILE);
    }


    my $gf_version = `$CONFIG{goldfinger_cmd} -version`;
    chomp $gf_version;
    if($?) {
      fatal "Can't find a working version of goldfinger!\n", M_GOLDFINGERMISC;
    }

    if($gf_version < $CONFIG{goldfinger_version}) {
      my $v = $CONFIG{goldfinger_version};
      fatal "This version of midas requires at least \n".
	"version $v of goldfinger.\n".
	"Found version $gf_version.\n", M_GOLDFINGERMISC;
	
    }


    create_sections()      if $phases{sectioning};
    assemble_sections()    if $phases{assemble};


    link_diag()            if $phases{link};

    postprocess_assembly() if $phases{postprocess};

  }

  copy_dest_files()      if $phases{copydest};
  cd $STATE->get_start_dir;

  assembly_cleanup()     if $phases{cleanup};

}

##############################################################################

sub are_files_same {
  my $file1 = shift;
  my $file2 = shift;

  my $cmd = "$CONFIG{diff_cmd} $file1 $file2 > /dev/null 2>&1";
  my $waitstatus = system($cmd);
  my $exitstatus = $waitstatus >> 8;

  return 1 if !$exitstatus;
  return 0 if ($exitstatus == 1);
  fatal "Command '$cmd' failed with status $exitstatus.\n", M_CMDFAIL;
}

##############################################################################

sub expand_product_file {
  my $configname = shift;

  return path_to_build_file($CONFIG{$configname}, $STATE);
}

##############################################################################

sub expand_for_apps {
  my $filename = shift;

  return ($filename) unless $filename =~ /\*/;

  my @list;
  foreach my $app (keys %{$STATE->{apps}}) {
    my $file =  $STATE->{apps}{$app}->expand_file($filename);

    if($STATE->skipping_build and $app eq 'default'
       and not -e $file)
      {
	next;
      }

    push @list, $STATE->{apps}{$app}->expand_file($filename);
  }
  return @list;
}

##############################################################################

sub copy_dest_files {
  local ($_);

  my @req_source_files = map { expand_product_file($_) }
    @{$CONFIG{product_files}{required}};
  my @opt_source_files = map { expand_product_file($_) }
    @{$CONFIG{product_files}{optional}};


  @req_source_files = map { expand_for_apps($_); } @req_source_files;
  @opt_source_files = map { expand_for_apps($_); } @opt_source_files;

  my %file_importance;
  foreach my $req_src (@req_source_files) {
    $file_importance{$req_src} = 'required';
  }
  foreach my $opt_src (@opt_source_files) {
    $file_importance{$opt_src} = 'optional';
  }

  my @src_files = (@req_source_files, @opt_source_files);

  my $dest_dir = $STATE->get_dest_dir();
  return if $dest_dir eq '.';

  banner "COPY PHASE";

  my @dest_files = map { File::Spec->catfile($dest_dir, basename $_) }
    @src_files;

  my $dest_files = join ' ', @dest_files;
  run_command("rm -f $dest_files") if @dest_files;

  foreach my $src (@src_files) {
    if(-e $src) {
      if($CONFIG{copy_products}) {
	chat "Copying $src to '$dest_dir'.\n", 2;
	copy $src, $dest_dir or
	  fatal "Could not copy $src to '$dest_dir': $!\n", M_FILE;
      } else {
	chat "Hard linking $src to '$dest_dir'.\n", 2;
	my $dest_file = File::Spec->catfile($dest_dir, basename $src);
	if(not link($src, $dest_file)) {
	  chat "Hard linking of $src failed. Copying instead.\n", 2;
	  copy $src, $dest_dir or
	    fatal "Could not copy $src to '$dest_dir': $!\n", M_FILE;
	}

      }
    } else {
      if($file_importance{$src} ne 'optional') {
	fatal "$src does not exist in build dir!\n";
      }
    }
  }
}

##############################################################################

sub assembly_cleanup {
  return unless $CONFIG{cleanup};

  banner "CLEANUP PHASE";

  if($STATE->get_created_build_dir() or $CONFIG{force_cleanup}) {
    my $build_dir = $STATE->get_build_dir();
    if($build_dir eq '.') {
      chat "Build directory is the same as start directory.  Can't remove.\n";
    } else {
      run_command("rm -rf " . $STATE->get_build_dir());
    }
  } else {
    chat "Build directory already existed, so not removing it.\n";
  }
}

##############################################################################

sub create_sections {
  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  banner "SECTION PARSING PHASE";

  my $mmu = $STATE->get_mmu();

  my $m4file  = path_to_build_file($CONFIG{local_m4}, $STATE);

  my $directives = path_to_build_file($CONFIG{local_directives}, $STATE);


  my $verbose = ($CONFIG{verbose} == 0) ? '-silent ' :
    ($CONFIG{verbose} == 2) ? '-v ' : '';

  my $error_opt = $Midas::Error::Print_Errors ? '' : '-noprint_errors ';

  run_command("$CONFIG{goldfinger_cmd} ${verbose}-splitsec $m4file ".
	      "-midasfile $directives ${error_opt}".
	      "-prefix '${Midas::Error::Prg}: '",
	      '-pass_errcode',
	     );

  my (%sections, %section_count);
  my (%tsbs,%tsblinks );
  tie %tsbs, 'Tie::IxHash';
  tie %tsblinks, 'Tie::IxHash';
  my (%tsbcsms,%tsbcsmlinks );
  tie %tsbcsms, 'Tie::IxHash';
  tie %tsbcsmlinks, 'Tie::IxHash';

  local ($_);

  my ($ifh, $ofh);
  my ($smartlines, $srcfile, $srcline);

  my $num_secs = 0;

  my $app = Midas::Application->new(name => 'default');
  $STATE->{apps}{$app->name()} = $app;

  chat "Finding sections in $directives\n";
  # First pass, create sections first so attr_ blocks can reference them
  $ifh = IO::File->new("<$directives") or
    fatal "Can't open $directives: $!\n", M_FILE;

  $smartlines = 0;
  $srcfile = $m4file;
  $srcline = 0;
  my %apps;
  my $appname = lc $app->name();
  my $first_appname = $appname;
  while(<$ifh>) {
    if(/^\#\s*(?:line\s*)?(\d+)\s+\"(.*)\"/) {
      $srcline = $1 - 1;
      $srcfile = $2;
      $smartlines = 1;
    } else {
      $srcline++;
    }

    while($_ =~ /\\$/) {
      $_ =~ s/\\\n$/ /;
      $_ .= <$ifh>;
      $srcline++;
    }

    if(/^\s*APPLICATION\s*(\S+)\s*(.*)?$/) {
      my $name = $1;
      my $args = $2;

      $app = Midas::Application->new(name => $name,
				     srcfile => $srcfile,
				     srcline => $srcline,
				     args => $args,
				    );
      $appname = lc $name;
      if(exists $apps{$appname}) {
	fatal
	  "App '$appname' already exists at file=$srcfile, line=$srcline!\n",
	    M_APPSYNTAX;
      }

      $apps{$appname} = $app;

      $STATE->{apps}{$name} = $app;
    }

    if(/^\s*goldfinger_cmd\s*\{/) {
      my $string = $_;
      $string =~ s/^\s*goldfinger_cmd\s*\{//;

      if($string =~ /\}/) {
	$string =~ s/\}//;
      } else {
	while(<$ifh>) {
	  if(/^\#\s*(?:line\s*)?(\d+)\s+\"(.*)\"/) {
	    $srcline = $1 - 1;
	    $srcfile = $2;
	    $smartlines = 1;
	  } else {
	    $srcline++;
	  }

	  my $line = $_;
	  if($line =~ s/\}//) {
	    $string .= $line;
	    last;
	  } else {
	    $string .= $line;
	  }

	}
      }

      $app->add_goldfinger_cmd($string);
    }

    if(/^\s*SECTION\s+(\S+)/) {
      my $name = lc $1;

      if(not exists $sections{$appname}{$name}) {

	my $section = Midas::Section->new_from_line($_, $ifh,
						    $srcfile, $srcline,
						    $app);

	$app->add_section($section);

	$srcfile = $section->{srcfile};
	$srcline = $section->{srclinestop};

	$name = lc $section->{name};

	$sections{$appname}{$name} = $section;
	$num_secs++;
      } elsif(/^\s*SECTION\s+(\S+)\s+(\S.*)/) {
	fatal "SECTION '$1' declared more than once has arguments.  \n".
	  "Arguments only permitted for the initial declaration.\n".
	  "file=$srcfile, line=$srcline.\n", M_SECSYNTAX;
      }

      $section_count{$appname}{$name} = []
	unless exists $section_count{$appname}{$name};
      push @{$section_count{$appname}{$name}}, {
				      srcfile => $srcfile,
				      srcline => $srcline,
				     };
    }

    if(/^\s*MIDAS_TSB\s+(\S+)/) {
      my $tsbname = lc $1;

      if(not exists $tsbs{$tsbname}) {
#	my $tsb = Midas::TSB->new_from_line($_, $ifh,
#					    $srcfile, $srcline, $mmu);
	my $tsb = $mmu->create_tsb_object_from_line($_, $ifh,
						    $srcfile, $srcline);

	$srcfile = $tsb->{srcfilestop};
	$srcline = $tsb->{srclinestop};
	$tsbs{$tsbname} = $tsb;
      } else {
	fatal "Tsb '$tsbname' declared twice!\n".
	  "  First time, file=$tsbs{$tsbname}{srcfile}, ".
	    "line=$tsbs{$tsbname}{srcline}\n".
	  "  Second time, file=$srcfile, line=$srcline.\n", M_TSBSYNTAX;
      }
    } elsif(/^\s*MIDAS_TSB_LINK\s+(\S+)/) {
      my $tsblinkname = lc $1;

      if(not exists $tsblinks{$tsblinkname}) {
#	my $tsblink = Midas::TSBLink->new_from_line($_, $ifh,
#						    $srcfile, $srcline,
#						    $mmu);

	my $tsblink = $mmu->create_tsb_link_object_from_line($_, $ifh,
							     $srcfile,
							     $srcline);


	$srcfile = $tsblink->{srcfilestop};
	$srcline = $tsblink->{srclinestop};
	$tsblinks{$tsblinkname} = $tsblink;
      } else {
	fatal "Tsb_link '$tsblinkname' declared twice!\n".
	  "  First time, file=$tsblinks{$tsblinkname}{srcfile}, ".
	    "line=$tsblinks{$tsblinkname}{srcline}\n".
	  "  Second time, file=$srcfile, line=$srcline.\n", M_TSBSYNTAX;
      }
    }

    if(/^\s*MIDAS_TSB_CSM\s+(\S+)/) {
      my $tsbcsmname = lc $1;

      if(not exists $tsbcsms{$tsbcsmname}) {
#	my $tsb = Midas::TSB->new_from_line($_, $ifh,
#					    $srcfile, $srcline, $mmu);
	my $tsbcsm = $mmu->create_tsb_object_from_line($_, $ifh,
						    $srcfile, $srcline);

	$srcfile = $tsbcsm->{srcfilestop};
	$srcline = $tsbcsm->{srclinestop};
	$tsbcsms{$tsbcsmname} = $tsbcsm;
      } else {
	fatal "Tsbcsm '$tsbcsmname' declared twice!\n".
	  "  First time, file=$tsbcsms{$tsbcsmname}{srcfile}, ".
	    "line=$tsbcsms{$tsbcsmname}{srcline}\n".
	  "  Second time, file=$srcfile, line=$srcline.\n", M_TSBSYNTAX;
      }
    } elsif(/^\s*MIDAS_TSB_CSM_LINK\s+(\S+)/) {
      my $tsbcsmlinkname = lc $1;

      if(not exists $tsbcsmlinks{$tsbcsmlinkname}) {
#	my $tsblink = Midas::TSBLink->new_from_line($_, $ifh,
#						    $srcfile, $srcline,
#						    $mmu);

	my $tsbcsmlink = $mmu->create_tsb_link_object_from_line($_, $ifh,
							     $srcfile,
							     $srcline);


	$srcfile = $tsbcsmlink->{srcfilestop};
	$srcline = $tsbcsmlink->{srclinestop};
	$tsbcsmlinks{$tsbcsmlinkname} = $tsbcsmlink;
      } else {
	fatal "Tsbcsm_link '$tsbcsmlinkname' declared twice!\n".
	  "  First time, file=$tsbcsmlinks{$tsbcsmlinkname}{srcfile}, ".
	    "line=$tsbcsmlinks{$tsbcsmlinkname}{srcline}\n".
	  "  Second time, file=$srcfile, line=$srcline.\n", M_TSBSYNTAX;
      }
    }
  }
  undef $ifh;

  foreach my $tsbname (keys %tsbs) {
    my $linkname = $tsbs{$tsbname}->get_tsblinkname();

    if(defined $linkname) {
      $linkname = lc $linkname;
      if(exists $tsblinks{$linkname}) {
	$tsbs{$tsbname}->set_tsblinkobj($tsblinks{$linkname});
      } else {
	fatal "TSB '$tsbname' has link area '$linkname', which is".
	  " undefined!\n".
	    " at file=$tsbs{$tsbname}{srcfile}, ".
	      "line=$tsbs{$tsbname}{srcline}", M_TSBSYNTAX;
      }
    }

    $MapAttr_Settable{$tsbname} = 1;
  }

  foreach my $tsbcsmname (keys %tsbcsms) {
    my $linkname = $tsbcsms{$tsbcsmname}->get_tsblinkname();

    if(defined $linkname) {
      $linkname = lc $linkname;
      if(exists $tsbcsmlinks{$linkname}) {
	$tsbcsms{$tsbcsmname}->set_tsblinkobj($tsbcsmlinks{$linkname});
      } else {
	fatal "TSBCSM '$tsbcsmname' has link area '$linkname', which is".
	  " undefined!\n".
	    " at file=$tsbcsms{$tsbcsmname}{srcfile}, ".
	      "line=$tsbcsms{$tsbcsmname}{srcline}", M_TSBSYNTAX;
      }
    }

    $MapAttr_Settable{$tsbcsmname} = 1;
  }

  $STATE->{tsbs}     = \%tsbs;
  $STATE->{tsblinks} = \%tsblinks;
  $STATE->{tsbcsms}     = \%tsbcsms;
  $STATE->{tsbcsmlinks} = \%tsbcsmlinks;

  if(!$num_secs) {
    fatal "Diag contains no SECTION directives!\n", M_NOSEC;
  }


  chat "Processing directives in $directives\n";

  # Pass 2, create attr_blocks

  $srcfile = $m4file;
  $srcline = 0;
  $ifh = IO::File->new("<$directives") or die "Can't open $directives: $!\n";

  my %opened_sec;
  my @linebuf;
  my @sections;

  my $current_section;
  my $current_appname = $first_appname;

  while(<$ifh>) {
   if(/^\#\s*(?:line\s*)?(\d+)\s+\"(.*)\"/) {
      $srcline = $1 - 1;
      $srcfile = $2;
      $smartlines = 1;
    } else {
      $srcline++;
    }

    while($_ =~ /\\$/) {
      $_ =~ s/\\\n$/ /;
      $_ .= <$ifh>;
      $srcline++;
    }

   if(/^\s*APPLICATION\s+(\S+)/) {
     my $appname = lc $1;
     $current_appname = $appname;
   }


   if(/^\s*SECTION\s+(\S+)/) {
     my $secname = lc $1;

     my $section = $sections{$current_appname}{$secname};
     $current_section = $section;

     my $rec = shift @{$section_count{$current_appname}{$secname}};

     $srcfile = $rec->{srcfile};
     $srcline = $rec->{srcline};

     if(not $opened_sec{$current_appname}{$secname}) {
       push @sections, $section;
     }
     $opened_sec{$current_appname}{$secname} = 1;
     my $nextline = $srcline + 1;
     next;
   } # end if /^SECTION/

   if(/^\s*attr_(\S+)\s*\{/) {
	
     my $attrs = $mmu->parse_section_attrs($_, $ifh,
					   $srcline, $srcfile);
     $_ = "\n";


     ($srcfile, $srcline) = $attrs->get_end_file_line();

     my $secname = $attrs->get_section_name();

     $attrs->attr_fatal("attr block does not define a section!\n", M_NOSEC)
       unless defined $secname && $secname =~ /\S/;

     fatal "Attribute spec for section \"$secname\" but no such section.\n".
       "File=$srcfile, Line=$srcline\n", M_MISSINGPARAM
	 unless exists $sections{$current_appname}{$secname};

     my $section = $sections{$current_appname}{$secname};
     $attrs->secobj($section);
     $section->add_attrs($attrs);

    }


   if(/^\s*MIDAS_CC\s*(.*?)\s*$/) {
     fatal "MIDAS_CC directive outside any section at line=$srcline, ".
       "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $current_section;
     $current_section->parse_midas_cc_line($1, $srcline, $srcfile);
     $_= "\n";
   }
   if(/^\s*MIDAS_OBJ\s*(.*?)\s*$/) {
     fatal "MIDAS_OBJ directive outside any section at line=$srcline, ".
       "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $current_section;
     $current_section->parse_midas_obj_line($1, $srcline, $srcfile);
     $_= "\n";
   }
   if(/^\s*MIDAS_LIB\s*(.*?)\s*$/) {
     fatal "MIDAS_LIB directive outside any section at line=$srcline, ".
       "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $current_section;
     $current_section->parse_midas_lib_line($1, $srcline, $srcfile);
     $_= "\n";
   }

  }

  chat "Performing sanity check on arguments.\n";

  my @errors;
  foreach my $section (@sections) {
    # Do error checking
    push @errors, $section->sanity_check();
  }

  if(@errors) {
    my $errorcode = $errors[0]{code};
    my $message = join "\n", map { $_->{message} } @errors;
    fatal $message, $errorcode;
  }

  foreach my $appname (keys %{$STATE->{apps}}) {
    delete $STATE->{apps}{$appname} if $STATE->{apps}{$appname}->is_blank();
  }

  foreach my $s (@sections) {
    $s->print_debug();
  }



}

##############################################################################

sub write_linker_scripts {
  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  # mmu must exist or we never would have been able to create sections
  foreach my $app (keys %{$STATE->{apps}}) {

    next if $STATE->{apps}{$app}->is_linked();
    my @sec_list = $STATE->{apps}{$app}->get_sec_list();

    my $script_name = $STATE->{apps}{$app}->ldscr_name();
    my $script = path_to_build_file($script_name, $STATE);

    chat "Writing linker script $script.\n";

    my $ofh = IO::File->new(">$script") or die "Can't open $script: $!\n";

    $ofh->print("SECTIONS {\n");

    foreach my $sec (@sec_list) {

      my $link_attrs = [$sec->get_link_attrs()]->[0];

      my @olist = map { basename $_ } $sec->get_object_list();
      my @alist = map { basename $_ } $sec->get_library_list(); #libs after .o

      push @olist, @alist;

      foreach my $seg (Midas::Segment->all_names()) {
	if ($link_attrs->has_segment($seg)) {
	  my $linkname = $sec->get_segment_link_name($seg);
	  my $elfname  = Midas::Segment->name2elf_name($seg);

	  my $filespec = join " ", map { "$_ ($elfname)" } @olist;
	
	  my $addrspec = $link_attrs->get_segment_va($seg) . " :";
	  $ofh->print("$linkname $addrspec { $filespec }\n");
	}
      }

    }
    $ofh->print("}\n");

    undef $ofh;
  }
}

##############################################################################

sub assemble_sections {
  banner "ASSEMBLY PHASE";

  foreach my $app_name (keys %{$STATE->{apps}}) {
    my $app = $STATE->{apps}{$app_name};

    my @sections = $app->get_sec_list();
    build_sections(\@sections) if @sections;
  }

}

##############################################################################

sub build_sections {
  my $seclist = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  my $num_threads = $CONFIG{build_threads};
  $num_threads = 1 if $num_threads < 1;
  my $num_sections = @$seclist;
  return unless $num_sections;
  $num_threads = $num_sections if $num_sections < $num_threads;

  my $sec_pl = ($num_sections > 1) ? 's' : '';
  my $thd_pl = ($num_threads > 1) ? 's' : '';
  chat "Building $num_sections section$sec_pl using $num_threads ".
    "build thread$thd_pl.\n";

  if($num_threads == 1) {
    foreach my $section (@$seclist) {
      $section->build();
    }
  } else {
    my @thread_sections;
    my $num_section = -1;
    foreach my $section (@$seclist) {
      $num_section++;
      my $thread = $num_section % $num_threads;
      $thread_sections[$thread] = [] unless defined $thread_sections[$thread];
      push @{$thread_sections[$thread]}, $section;
    }

    my $parent_thread = 0;
    my $my_thread = 0;

    my @child_pids;
    my $threads_to_spawn = $num_threads - 1;
    my $next_thread = $my_thread + 1;

    while($threads_to_spawn) {
      my $pid;
      if($pid = fork()) {
	$next_thread++;
	$threads_to_spawn--;
	push @child_pids, $pid;
	# parent
      } elsif(defined $pid) {
	$my_thread = $next_thread;
	last;
      } else {
	fatal "Cannot fork thread $next_thread: $!\n", M_CODE;
      }
    }

    chat "Build thread $my_thread is alive!\n", 3;

    foreach my $section (@{$thread_sections[$my_thread]}) {
      chat "Building section $section->{name} on thread $my_thread\n", 3;
      $section->build();
    }

    if($my_thread != 0) {
      exit(0);
    }
    if(@child_pids) {

      foreach my $pid (@child_pids) {
	my $waitval;
	my $waitstatus;
	while() {
	  $waitval = waitpid($pid, 0);
	  if($waitval == -1) {
	    $waitstatus = 0;
	    last;
	  } elsif($waitval == 0) {
	    $waitstatus = 0;
	    last;
	  } else {
	    $waitval = $pid;
	    $waitstatus = $?;
	    last;
	  }
	};
	my $status = $waitstatus >> 8;
	# Child thread has died with nonzero status
	if($status != 0) {
	  my $waitstatus_hex = sprintf "%x", $waitstatus;
	  fatal "Build thread with pid=$pid died with status $status ".
	    "(waitstauts=0x$waitstatus_hex).\n", $status;
	}
      }
    }

  }
}

##############################################################################

sub link_diag {
  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  banner "LINK PHASE";

  write_linker_scripts();

  foreach my $app (keys %{$STATE->{apps}}) {
    my $appobj = $STATE->{apps}{$app};

    next if $appobj->is_linked();

    my $ldscript_name = $appobj->ldscr_name();
    my $exe_name      = $appobj->exe_name();

    my $ldscript = path_to_build_file($ldscript_name, $STATE);
    my $exe      = path_to_build_file($exe_name, $STATE);

    my $args = join ' ', @{$CONFIG{ld_opt}};
    run_command("$CONFIG{ld_cmd} $args -T $ldscript -o $exe",
		-errcode => M_LINKFAIL
	       );

    if(-e $exe) {
      chat "$exe successfully created.\n";
    } else {
      fatal "$exe could not be generated.\n", M_LINKFAIL;
    }
  }

}

##############################################################################

1;
