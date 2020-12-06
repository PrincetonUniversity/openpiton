eval 'exec perl -S $0 ${1+"$@"}'
if 0;
# -*- mode: cperl -*-
#----------------------------------------------------------------------
#   Copyright 2013 Cadence Design Systems, Inc.
#   All Rights Reserved Worldwide
#
#   Licensed under the Apache License, Version 2.0 (the
#   "License"); you may not use this file except in
#   compliance with the License.  You may obtain a copy of
#   the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in
#   writing, software distributed under the License is
#   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
#   CONDITIONS OF ANY KIND, either express or implied.  See
#   the License for the specific language governing
#   permissions and limitations under the License.
#----------------------------------------------------------------------

#use strict;
use warnings;
use Getopt::Long;
use File::Find;
use Cwd;
use Fcntl;
use File::Temp qw/tempfile tempdir/;
use File::Path;
use File::Copy;
use Data::Dumper;
use File::stat;
use Text::Balanced qw(extract_tagged);

# Tar module may not be available
if (eval {require Archive::Tar; 1;}) {
  $Tar_Pm = 1;
}

my @all_files=();
my %content=();
local $opt_marker="-*-";
local $opt_help;
local $opt_backup;
local $opt_write;
local $opt_tar_exec="tar";

# regexp to match sv files (can be overriden using --sv_ext)
local $opt_sv_ext="\.(s?vh?)\$";

# ignore pattern
local $file_ignore_pattern="(/(.hg|.git|INCA_libs|.daidir|.vdb|simv|csrc|DVEfiles)\/|[#~]\$|\.(zip|gz|bz2|orig|diff|patch)\$)";

my $VerID='-*- $Id: uvm11-to-uvm12.pl,v d60c9fc172de 2010/10/13 14:58:52 accellera $ -*-';
my @Options=(
      ["help","this help screen"],
	  ["top_dir=s","the top directory name containing the files to translate"],
	  ["backup","if specified make a backup of all files handled by the script"],
	  ["write","really write the changed files back to disk (by default it runs in dry mode)"],
	  ["marker=s", "use the marker supplied instead of the default marker [$opt_marker]"],
	  ["sv_ext=s","a regexp matching all sv files default:[$opt_sv_ext]"],
	  ["tar_exec=s","the script assume a gtar compatible tar, if your gtar compatible tar is not avail point to it via --tar_exec"],
	  ["deprecated","also replace still working but deprecated code"]
	  );	  
 

if(!GetOptions(map ( @$_[0], @Options))) {
   ErrorMessage("Error during option parsing");
}
if (defined $opt_help) { PrintUsage(@Options); exit(1);}

if(!$opt_top_dir) { $opt_top_dir= getcwd;}

$opt_top_dir =~ s/\/$//;

$DUMMY='-' x 80;
NoteMessage("$DUMMY");
NoteMessage("$VerID");

NoteMessage("requires at least perl v5.10");
NoteMessage("traversing directory [$opt_top_dir] to find files");
NoteMessage("-*- this script requires a gtar compatible tar to make backups -*-");

search_all_relevant_files($opt_top_dir);

#
#
#
foreach my $file (@all_files) {
    if($file =~ /${opt_sv_ext}/) {
	print "handling sv [$file]\n";
	$content{$file}=ReadFileAsText($file);
	$content{$file}=replace_trivial($content{$file},$file);
    } 
}

write_back_files(%content);

# writes back the contents of the files
sub write_back_files {
    my(%content)=@_;


# now write it back
    my $tempdir=tempdir(CLEANUP => 1);
    NoteMessage("writing file to new top_dir $tempdir");
    foreach $f (keys %content) { 
		my($nfile)=$f;
		$nfile=~ s/^$opt_top_dir/$tempdir/;
		my ($volume,$directories,$file) = File::Spec->splitpath( $nfile );

		mkpath($directories, 0);
    
		open(OUT,">$nfile") || die("error opening $nfile fullfile:$f for write [$!]");
		print OUT $content{$f};
		close(OUT);
    }

    NoteMessage("the patch is avail as [uvm2uvm_$$.patch] for inspection");
    system("diff -r $opt_top_dir $tempdir > uvm2uvm_$$.patch");
    if($opt_backup) {
		NoteMessage("making backup of current files before writing back in [uvm2uvm_back_$$.tar.gz]");

	if ($Tar_Pm) {
	  my $tar=Archive::Tar->new;
	  $tar->add_files(keys(%content));
	  $tar->write("uvm2uvm_back_$$.tar.gz",COMPRESS_GZIP);
	} else {
	  my($fh,$fname) = tempfile();
	  print $fh join("\n",keys(%content));
	  system "$opt_tar_exec cf - -T $fname | gzip -9v > uvm2uvm_back_$$.tar.gz";
	}
    }
    
    if($opt_write) {

	foreach $f (keys %content) { 
	    my($nfile)=$f;
	    $nfile=~ s/^$opt_top_dir//;
	    
	    my($mod_nfile)=$nfile;
	    my($target)=$f;
	    my($source)=$f;
	    $source=~ s/^$opt_top_dir/$tempdir/;

	    if($mod_nfile ne $nfile) {
		WarnMessage("filename of [$f]=top_dir[$opt_top_dir][$nfile] got changed, its now [$opt_top_dir][$mod_nfile]");
		unlink $f;
		$target=$opt_top_dir . $mod_nfile;
	    }
	    
	    warn("target file $target is not writeable and in the way") if (-e $target && !(-w $target));
	    #NoteMessage("moving [$source] to [$target]");
	    move($source,$target);
	}
    }
}

sub search_all_relevant_files {
	my ($dir) = @_;
	finddepth({ wanted => \&pattern, no_chdir => 1 }, $dir);
}


sub replace_trivial{
    my($t,$fname) = @_;
    no warnings "uninitialized";
    my($prefix)="automatic uvm_coreservice_t cs_=uvm_coreservice_t::get();\n";

    # FIX remove the protected keyword from phases 
    $t =~ s/virtual\s+protected\s+(function|task)\s+(void\s+)?(((pre|post)_)?((reset|configure|main|shutdown)|run)_phase)/virtual $1 $2 $3/g;

    # FIX replace _global_reporter.get_report_server
    $t =~ s/_global_reporter\.get_report_server/uvm_report_server::get_server/g;

    # FIX replace _global_reporter.report_summarize
    $t =~ s/_global_reporter\.report_summarize\(\)\s*;/begin uvm_root r = uvm_root::get(); r.report_summarize(); end/g;

    # FIX replace _global_reporter.dump_report_state
    $t =~ s/_global_reporter\.dump_report_state\(\)\s*;/begin uvm_root r = uvm_root::get(); r.dump_report_state(); end/g;

    # FIX replace uvm_severity_type by uvm_severity
    $t =~ s/uvm_severity_type/uvm_severity/g if $opt_deprecated;

    # FIX extending uvm_report_server
    $t =~ s/extends\s+uvm_report_server/extends uvm_default_report_server/g;

    # FIX Mantis 4431 (starting_phase ==)
    $t =~ s/starting_phase\s*([!=]+)/get_starting_phase()$1/g;
    # FIX Mantis 4431 (starting_phase =)
    $t =~ s/starting_phase\s*=\s*(\w+)/set_starting_phase($1)/g;
    # FIX Mantis 4431 (starting_phase.)
    $prefix="uvm_phase phase_=get_starting_phase();\n";
    $t = coreservice_repl_fct($t,'starting_phase\.','phase_.',1,$prefix);

    # FIX Mantis 3472: set_config_*/get_config_* are deprecated
    # remove the clone=0 because that is the semantic now
    $t =~ s/([sg])(et_config_object\([^\)]+),\s*0\s*\)/$1~XYZ~$2)/g if $opt_deprecated;
    $t =~ s/([sg]et_config_object\(.*?)\n/$1 \/\/ $opt_marker semantic changed see mantis3472 (clone bit)\n/g if $opt_deprecated;
    $t =~ s/([sg])~XYZ~/$1/g if $opt_deprecated;

    $prefix="";
    foreach $o ('int','string','object') {
	$t = coreservice_repl_fct($t,"set_config_$o\\(","uvm_config_$o\::set(this, ",1,$prefix);
	$t = coreservice_repl_initial($t,"set_config_$o\\(","uvm_config_$o\::set(null, ",1,$prefix);
	$t = coreservice_repl_fct($t,"get_config_$o\\(","uvm_config_$o\::get(this, \"\",",1,$prefix);
	$t = coreservice_repl_initial($t,"get_config_$o\\(","uvm_config_$o\::get(,\"\", ",1,$prefix);
      }
    # NOTE set_config_object( ....., clone=1) => [sg]et_config_object() with the clone arg=1 (which is the default) doesnt map to the ::[sg]et
    
    # DISABLED reverse chained function calls
#    $prefix="uvm_coreservice_t cs_ = uvm_coreservice_t::get();\n";
#    $t = coreservice_repl_fct($t,'uvm_coreservice_t::get\(\)\.','cs_.',1,$prefix);
#    $t = coreservice_repl_initial($t,'uvm_coreservice_t::get\(\)\.','cs_.',1,$prefix);

    # FIX uvm_sequencer_utils -> uvm_component_utils
    $t =~ s/uvm_sequencer_utils/uvm_component_utils/g if $opt_deprecated;

    # FIX uvm_sequence_utils -> uvm_object_utils
    $t =~ s/uvm_sequence_utils(_begin)?\s*\((\s*\S+\s*)\,(\s*\S+\s*)\)/uvm_object_utils$1($2)/g if $opt_deprecated;

    # FIX uvm_sequence_utils_end
    $t =~ s/`uvm_sequence_utils_end/`uvm_object_utils_end/g if $opt_deprecated; 

    # MARKER sequence association seqr-seq needs an update
    $t =~ s/^\s*`uvm_update_sequence_lib_and_item/\/\/ $opt_marker association seqr-seq has changed `uvm_update_sequence_lib_and_item/g if $opt_deprecated; 

    # MARKER report_summarize() -> report
    $t;
}

sub coreservice_repl_fct {
  my ($text,$match,$repl,$depr,$prefix)=@_; #
  my($last)=0;
  my(@blks)=();
  my($q,$tf,$bd);

  return $text unless defined $depr;

  while( $text =~ /((extern|virtual|protected|local|static)\s+)*((task|function)\s+[^;]+;)(.*?end\4)?/gsx ) {
    ($q,$tf,$bd,$pre,$post)=($1,$3,$5,$-[0],$+[0]);

    $q="" unless defined $q;

    next if($q =~ /extern/); # dont deal with extern decl
    next if($prefix ne "" && $bd =~ /\s*$prefix/); # dont insert again

    # deal with the body
    if($bd =~ s{$match}{$repl}g ) {
#      print "found [$q|$tf|$bd]\n";

      push @blks,substr($text,$last,$pre-$last);
      push @blks,"$q$tf $prefix$bd";
      $last=$post;
    }
  }
#  foreach $f (@blks) {
#    if($f =~ /$match/) { print "LOOP failed with $match $repl [$f]" } ;
#  }

  # now recreate output
  push @blks,substr($text,$last);
  return join("",@blks);
}

sub coreservice_repl_initial {
  my ($text,$match,$repl,$depr,$prefix)=@_; #
  my($last)=0;
  my(@blks)=();
  my($bd);

  return $text unless defined $depr;

  while( $text =~ /initial\s+begin/gsx ) {
    ($pre,$post)=($-[0],$+[0]);
    $bd=substr($text,$pre+7);
    my (@set) = extract_tagged($bd, "begin", "end");
    $bd=$set[4];
    $post=length($text)-length($set[1]);

    $bd="" unless defined $bd;
    next if($prefix ne "" && $bd =~ /\s*$prefix/); # dont insert again

    # deal with the body
    if($bd =~ s{$match}{$repl}g ) {
#      print "[$bd]\n";
      push @blks,substr($text,$last,$pre-$last);
      push @blks,"initial begin $prefix$bd". "end";
      $last=$post;
    }
  }
  # now recreate output
  push @blks,substr($text,$last);

  return join("",@blks);
}

sub pattern {
	my($filename)= $File::Find::name;
	my($st) =stat($filename) || die "error: $filename: $!";

#	print "[$filename][$st]";
# print Dumper($filename);
#	print Dumper($st),"\n";
	
# NOTE directories are not handled (a directory uvm_bla has to be renamed manually)
	return 0 if (-d $filename);
	return 0 if $filename =~ /${file_ignore_pattern}/;
	return unless $filename =~ $opt_sv_ext;
	warn("file $filename is a link and may lead to strange results") if -l $filename;

	push @all_files,$filename;
}

sub PrintUsage {
  my(@Options)=@_;


  while(<DATA>){
    print $_;
  }

   my($txt);
  print "supported transformations\n";

  $txt = ReadFileAsText($0);
  while($txt =~ /#\s+(FIX|MARKER|TODO)(.*?)\n/gs) {
	print "action:$1\t\tdescription: $2\n";
    }

  print "\n\noptions:\n\n";

  foreach $i (@Options) {
    printf("\t--%-20s\t\t@$i[1]\n",@$i[0]);
  }
}

sub ReadFileAsText {
  my($FILENAME)=@_;
  my(@FILES)=();
  my($FILE,$TEXT);
  local(*INFILE);

#  DebugMessage("1trying to read text-file [$FILENAME]");
  $TEXT="";
  foreach $FILE (glob($FILENAME)) {
#    DebugMessage("2trying to read text-file [$FILE]");
    open(INFILE,$FILE) || WarnMessage("can't open file [$FILE]");
    undef $/;
    $TEXT .= <INFILE>;
    $/ = "\n";
    close(INFILE);
  }
  return ($TEXT);
}

sub WarnMessage{
  my($Line)=@_;

  Message("warning",$Line);
}

sub ErrorMessage{
    my($Line)=@_;
    Message("error",$Line);
    die "$0  stopped\n";
}

sub NoteMessage{
    my($Line)=@_;

    Message("note",$Line);
}

sub Message {
  my($Level,$Line)=@_;

  print STDERR "$Level $Line\n";
}

__DATA__

This scripts walks through all files under the --top_dir hierarchy and makes modifications 
so that the UVM11 code fragments are changed to their UVM12 counterparts. As it is based on perl/regexps rather 
then a full parsing some of the replacements might be inaccurate or it might not find all occurences required 
to change. however it is expected that ~90%+ of the changes required in a conversion are completed by the script.

standard usage model sv files only:

1. run the script with the --top_dir option

2. inspect the changes made in the produced *.patch file

3. enable automatic write-back by supplying --write to the command invocation

4. inspect the MARKERS 


usage: uvm11-to-uvm12.pl options* args*

example: uvm11-to-uvm12.pl --top_dir /xyz/abc/src
