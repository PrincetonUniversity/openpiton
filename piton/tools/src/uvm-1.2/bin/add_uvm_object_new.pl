eval 'exec perl -S $0 ${1+"$@"}'
if 0;
# -*- mode: cperl -*-
#----------------------------------------------------------------------
#   Copyright 2007-2010 Cadence Design Systems, Inc.
#   Copyright 2010-2011 Synopsys Inc.
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
local $opt_tar_exec="tar";

# regexp to match sv files (can be overriden using --sv_ext)
local $opt_sv_ext="\.(s?vh?|inc)\$";

# regexp of mime types for files considered for a change with the --all option
local $text_file_mime_regexp="(text\/|application\/x-shellscript|regular file)";

# ignore pattern
local $file_ignore_pattern="(/(.hg|.git|INCA_libs|.daidir|.vdb|simv|csrc|DVEfiles)\/|[#~]\$|\.(zip|gz|bz2|orig|diff|patch)\$)";

my $VerID='-*- $Id: ovm2uvm.pl,v d60c9fc172de 2010/10/13 14:58:52 accellera $ -*-';
my @Options=(
          ["help","this help screen"],
	  ["top_dir=s","the top directory name containing the files to translate"],
	  ["backup","if specified make a backup of all files handled by the script"],
	  ["write","really write the changed files back to disk (by default it runs in dry mode)"],
	  ["marker=s", "use the marker supplied instead of the default marker [$opt_marker]"],
	  ["sv_ext=s","a regexp matching all sv files default:[$opt_sv_ext]"],
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
	$content{$file}=FixMantis3770($file);
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

    NoteMessage("the patch is avail as [Mantis3770_$$.patch] for inspection");
    system("diff -r $opt_top_dir $tempdir > Mantis3770_$$.patch");
    if($opt_backup) {
	NoteMessage("making backup of current files before writing back in [Mantis3770_back_$$.tar.gz]");

	if ($Tar_Pm) {
	  my $tar=Archive::Tar->new;
	  $tar->add_files(keys(%content));
	  $tar->write("Mantis3770_back_$$.tar.gz",COMPRESS_GZIP);
	} else {
	  my($fh,$fname) = tempfile();
	  print $fh join("\n",keys(%content));
	  system "$opt_tar_exec cf - -T $fname | gzip -9v > Mantis3770_back_$$.tar.gz";
	}
    }

    if($opt_write) {
	NoteMessage("now writing back to changes");
	
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


sub fix_mantis_3770{
    my($t,$fname) = @_;

    $t =~ s/class\s+(\S+)\s+extends endclass//ge;

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

sub FixMantis3770 {
  my($FILENAME)=@_;
  my(@FILES)=();
  my($FILE,$TEXT,$CLASS,$NEW,$UVM_OBJECT,$_);
  local(*INFILE);

#  DebugMessage("1trying to read text-file [$FILENAME]");
  $TEXT="";
  foreach $FILE (glob($FILENAME)) {
#    DebugMessage("2trying to read text-file [$FILE]");
    open(INFILE,$FILE) || WarnMessage("can't open file [$FILE]");

    undef $CLASS;
    while ($_ = <INFILE>) {
      if (m/class\s+(\S+)\b/) {
	$CLASS = $1;
	undef $NEW;
	undef $UVM_OBJECT;
        undef $CLASS if m/typedef\s+class\s/;
      } elsif (m/\`uvm_object_utils/ ||
	       m/\`uvm_object_param_utils/ ||
	       m/\`uvm_sequence_utils/) {
	$UVM_OBJECT = 1;
      } elsif (m/function\s+new\b/) {
	$NEW = 1;
      } elsif (m/endclass/) {
	if ($CLASS && $UVM_OBJECT && !$NEW) {
	  $TEXT .= "\n  function new(string name=\"$CLASS\");\n";
	  $TEXT .= "     super.new(name);\n";
	  $TEXT .= "  endfunction\n\n";
	}
	undef $CLASS;
	undef $NEW;
      }
      $TEXT .= $_;
    }
    close(INFILE);
  }
  return ($TEXT);
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


usage: add_uvm_object_new.pl options* args*

example: add_uvm_object_new.pl --top_dir /xyz/abc/src


