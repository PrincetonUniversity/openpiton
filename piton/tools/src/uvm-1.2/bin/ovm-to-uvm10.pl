eval 'exec perl -S $0 ${1+"$@"}'
if 0;
# -*- mode: cperl -*-
#----------------------------------------------------------------------
#   Copyright 2007-2010 Cadence Design Systems, Inc.
#   Copyright 2010 Synopsys Inc.
#   Copyright 2010 Mentor Graphics Corporation
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
local $opt_all_text_files;
local $opt_tar_exec="tar";

# regexp to match sv files (can be overriden using --sv_ext)
local $opt_sv_ext="\.(s?vh?|inc)\$";

# regexp of mime types for files considered for a change with the --all option
local $text_file_mime_regexp="(text\/|application\/x-shellscript|regular file)";

# ignore pattern
local $file_ignore_pattern="(/(.hg|.git|INCA_libs|.daidir|.vdb|simv|csrc|DVEfiles)\/|[#~]\$|\.(zip|gz|bz2|orig|diff|patch)\$)";

my $VerID='-*- $Id: ovm-to-uvm10.pl,v d60c9fc172de 2010/10/13 14:58:52 accellera $ -*-';
my @Options=(
          ["help","this help screen"],
	  ["top_dir=s","the top directory name containing the files to translate"],
	  ["backup","if specified make a backup of all files handled by the script"],
	  ["write","really write the changed files back to disk (by default it runs in dry mode)"],
	  ["marker=s", "use the marker supplied instead of the default marker [$opt_marker]"],
	  ["sv_ext=s","a regexp matching all sv files default:[$opt_sv_ext]"],
	  ["all_text_files","apply the simple \"o2u\" transformation to all files where the MIME-type of matches [$text_file_mime_regexp]"],
	  ["tar_exec=s","the script assume a gtar compatible tar, if your gtar compatible tar is not avail point to it via --tar_exec"]
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
    } elsif (defined($opt_all_text_files) && matches_mime_type($file)) { 
	print "handling generic [$file]\n";
	$content{$file}=ReadFileAsText($file);
	$content{$file}=simple_fix($content{$file});
    } else {
	print "skipping $file ...\n";
    }
}

write_back_files(%content);

# determines if the file is one of requested mime types
sub matches_mime_type {
    my($file) = @_;
    my($mime)=qx{file -i $file};
    if($mime =~ /:\s+${text_file_mime_regexp}/) {
	return 1;
    } else {
	return 0;
    }
}

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

    NoteMessage("the patch is avail as [ovm2uvm_$$.patch] for inspection");
    system("diff -r $opt_top_dir $tempdir > ovm2uvm_$$.patch");
    if($opt_backup) {
	NoteMessage("making backup of current files before writing back in [ovm2uvm_back_$$.tar.gz]");

	if ($Tar_Pm) {
	  my $tar=Archive::Tar->new;
	  $tar->add_files(keys(%content));
	  $tar->write("ovm2uvm_back_$$.tar.gz",COMPRESS_GZIP);
	} else {
	  my($fh,$fname) = tempfile();
	  print $fh join("\n",keys(%content));
	  system "$opt_tar_exec cf - -T $fname | gzip -9v > ovm2uvm_back_$$.tar.gz";
	}
    }

    if($opt_write) {
	NoteMessage("now writing back to changes (some files might be written back with changed filenames [*ovm* -> *uvm*]");
	
	foreach $f (keys %content) { 
	    my($nfile)=$f;
	    $nfile=~ s/^$opt_top_dir//;
	    
	    my($mod_nfile)=simple_fix($nfile);
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

    # FIX deprecated macros OVM_REPORT_*
    $t =~ s/\`OVM_REPORT_(WARNING|ERROR|FATAL)/sprintf("\`uvm_%s",lc($1))/ge;

    # FIX deprecated 'OVM_REPORT_INFO now needs a UVM_NONE in the end
    $t =~ s/\`OVM_REPORT_INFO(.*?)\)/\`uvm_info$1,UVM_MEDIUM)/g;
    
    # FIX somecomponent::global_stop_request() -> (global) global_stop_request()
    $t =~ s/\S+::global_stop_request/global_stop_request/g;

    # FIX instancehandle.global_stop_request() -> (global) global_stop_request()
    $t =~ s/(\S+\.)global_stop_request/global_stop_request/g;
   
    # FIX take remove arg2,arg3 from constructor ovm_sequence::new(,arg2,arg3)
    while($t=~ /extends\s+ovm_sequence\s*;.*?endclass/s) {
        ($pre,$b,$post) =($`,$&, $');

        $b =~ s/super\.new\(([^,\n]+),(.*);/super.new($1); \/\/ NOTE: [$&]/;
        $b =~ s/ovm_sequence/uvm_sequence/g;
        $t = $pre . $b . $post;
    }
 
    # FIX take remove arg2,arg3 from constructor ovm_sequence_item::new(,arg2,arg3)
    while($t=~ /extends\s+ovm_sequence_item\s*;.*?endclass/s) {
	($pre,$b,$post) =($`,$&, $');

	$b =~ s/super\.new\(([^,\n]+),(.*);/super.new($1); \/\/ NOTE: [$&]/; 
        $b =~ s/ovm_sequence_item/uvm_sequence_item/g;
	$t = $pre . $b . $post;
    }

    # MARKER include of ovm private files
    $t =~ s/include\s+\"ovm_(?!macros).*?\.svh\".*/$& \/\/ $opt_marker FIXME include of ovm file other than ovm_macros.svh detected, you should move to an import based methodology/g;

    # FIX  `message(sev,(...)) -> uvm_info("FIXME","...",sev)
    $t =~ s|(?s)\`message\(([^,]+),\s*\(\s*\$psprintf\((.*?)\)\s*\)\s*\)|\`uvm_info("FIXME",\$sformatf($2),$1)|g;
    $t =~ s|(?s)\`message\(([^,]+),\s*\(\s*\$sformatf\((.*?)\)\s*\)\s*\)|\`uvm_info("FIXME",\$sformatf($2),$1)|g;
    $t =~ s|(?s)\`message\(([^,]+),\s*\((.*?)\)\s*\)|\`uvm_info("FIXME",\$sformatf($2),$1)|g;
    $t =~ s|(?s)\`message\(([^,]+),\s*(.*?)\)|\`uvm_info("FIXME",\$sformatf($2),$1)|g;

    # FIX ovm_factory::print() -> factory.print
    $t =~ s/ovm_factory::print\(\)/factory.print()/g;

    # FIX ovm_factory:: set_type_override  -> factory. set_type_override_by_name ()
    $t =~ s/ovm_factory::set_type_override_by_name/factory.set_type_override_by_name/g;
    $t =~ s/ovm_factory::set_type_override_by_type/factory.set_type_override_by_type/g;
    $t =~ s/ovm_factory::set_type_override\(/factory.set_type_override_by_name(/g;
      

    # FIX `dut_error(MSG) -> uvm_error
    $t =~ s/(?s)\`dut_error\(\((.*?)\)\s*\)/\`uvm_error(\"DUT\",\$psprintf($1))/g;
    $t =~ s/(?s)\`dut_error\((.*?)\)/\`uvm_error(\"DUT\",$1)/g;

    # FIX ovm_msg_detail(XX) -> uvm_report_enabled(XXX)
    $t =~ s/(?s)\`ovm_msg_detail\((.*?)\)/uvm_report_enabled($1)/g;

    # FIX set_global_verbosity(..) -> set_report_...
    $t =~ s/ovm_urm_report_server::set_global_verbosity\((.*)\);/uvm_pkg::uvm_top.set_report_verbosity_level_hier($1)/g;

    # MARKER _urm_
    $t =~ s/_urm_.*/$& \/\/ $opt_marker FIXME potential deprecated URM reference\n/g;

    # MARKER _avm_
    $t =~ s/_avm_.*/$& \/\/ $opt_marker FIXME potential deprecated AVM reference\n/g;

    # FIX+MARKER .ovm_enable_print_topology -> .enable_print_topology
    $t =~ s/\S+\.[ou]vm_enable_print_topology(.*)/uvm_top.enable_print_topology$1 \/\/ $opt_marker NOTE mapped from $& \n/g;
    $t =~ s/(?<!\.)[ou]vm_enable_print_topology(.*)/uvm_top.enable_print_topology$1 \/\/ $opt_marker NOTE mapped from $& \n/g;

    # FIX ovm_print_topology() -> uvm_top.print()
    $t =~ s/ovm_print_topology/uvm_top.print/g;

    # MARKER configure_ph -> end_of_elaboration
    $t =~ s/configure_ph.*/$& \/\/ $opt_marker FIXME potential usage of configure_ph, this should be mapped to end_of_elaboration_ph\n/g;
    
    # FIX ovm_reporter -> uvm_report_object
    $t =~ s/ovm_reporter/uvm_report_object/g;
   
    # FIX+MARKER ovm_template.svh is gone
    $t =~ s/\`include\s+\"ovm_templates\.svh\".*/\/\/ $opt_marker NOTE this doe not exist anymore in UVM $&\n/g;
 
    # FIX cdns_recording.svh has been replaced by package for uvm
    $t =~ s/\`include\s+\".*cdns_recording.*\".*/\/\/ $opt_marker NOTE please contact cadence support for an updated package $&\n/g;
    
    # MARKER OVM_FIELD_DATA is a private macro to the ovm library and deprecated, if its a must it might be replaced with M_UVM_FIELD_DATA
    $t =~ s/\`OVM_FIELD_DATA/\`M_UVM_FIELD_DATA/g;
    $t =~ s/M_UVM_FIELD_DATA.*/$&   \/\/ $opt_marker NOTE OVM_FIELD_DATA is a private macro to the ovm library and deprecated, in legacy code it might be replaced with M_UVM_FIELD_DATA\n/g;  

    # FIX map raise|drop objection argument mix
    # first swap with 3 args
    $t =~ s/\.(drop|raise)_objection\(([^,;]+),([^,;]+),([^,;]+)\)\s*;/.$1\_objection($2,$4,$3);/g;    

    # then swap those with two args
    $t =~ s/\.(drop|raise)_objection\(([^,;]+),([^,;]+)\)\s*;/.$1\_objection($2,,$3);/g;

    # FIX ovm_factory::print_all_overrides() -> factory.print()
    $t =~ s/ovm_factory::print_all_overrides\(\)/factory.print()/g;

    # FIX+MARKER seq_item_prod_if -> seq_item_port
    $t =~ s/seq_item_prod_if.*/$& \/\/ $opt_marker NOTE seq_item_prod_if has been replaced with seq_item_port \n/g;
    $t =~ s/seq_item_prod_if/seq_item_port/g;
    
    # FIX+MARKER seq_item_cons_if -> seq_item_export
    $t =~ s/seq_item_cons_if.*/$& \/\/ $opt_marker NOTE seq_item_cons_if has been replaced with seq_item_export \n/g;
    $t =~ s/seq_item_cons_if/seq_item_export/g;

    # FIX seq_item_port.connect_if -> seq_item_port.connect
    $t =~ s/(seq_item_port\.connect)_if/$1/g;

    # FIX ovm_threaded_component -> uvm_component
    $t =~ s/ovm_threaded_component/uvm_component/g;

    # FIX post_new->build, pre_run->start_of_simulation
    $t =~ s/post_new\s*\(\)/build()/g;
    $t =~ s/pre_run\s*\(\)/start_of_simulation()/g;

    # MARKER (import+export)_connections do not exist anymore and have beein mapped to connect()
$t =~ s/(export|import)_connections.*/$& \/\/ $opt_marker NOTE $1 _connections has been deprecated and should be mapped into connect()/g;

    
    # FIX the simple O -> U changes
    $t=simple_fix($t);
    $t;

}

sub simple_fix {
    my($t)=@_;
    $t =~ s/ovm/uvm/g;
    $t =~ s/tlm/uvm_tlm/g;
    $t =~ s/OVM/UVM/g;
    $t =~ s/TLM_/UVM_TLM_/g;   
    $t;
}

sub pattern {
	my($filename)= $File::Find::name;
	my($st) =stat($filename) || die "error: $filename: $!";

#	print "[$filename][$st]";
# print Dumper($filename);
#	print Dumper($st),"\n";
	
# NOTE directories are not handled (a directory ovm_bla has to be renamed manually)
	return 0 if (-d $filename);
	warn("file $filename is a link and may lead to strange results") if -l $filename;
	return 0 if $filename =~ /${file_ignore_pattern}/;
#	return unless $filename =~ /\.s?vh?$/;

#	replace_string($filename);
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
so that the OVM code fragments are changed to their UVM counterparts. As it is based on perl/regexps rather 
then a full parsing some of the replacements might be inaccurate or it might not find all occurences required 
to change. however it is expected that ~90%+ of the changes required in a conversion are completed by the script.

standard usage model sv files only:

1. run the script with the --top_dir option

2. inspect the changes made in the produced *.patch file

3. enable automatic write-back by supplying --write to the command invocation

(under some circumstances filenames get changed (when they contain either *ovm* or *OVM*))

4. inspect the MARKERS 


usage: ovm-to-uvm10.pl options* args*

example: ovm-to-uvm10.pl --top_dir /xyz/abc/src


all_text_files use model:

If the all_text_files use model is enabled using the --all_text_files switch all files recognized 
as text files are additionally considered for replacements. The simple o-to-u replacements will be performed 
in all files (textual + sv) while the SV/OVM specific changes will be only applied to files identified as SV.

example: example: ovm-to-uvm10.pl --top_dir /xyz/abc/src --all

