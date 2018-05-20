#!/usr/bin/perl
# Modified by Princeton Unviersity on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: genmemimage.pl
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
eval 'exec $PERL_CMD -S $0 ${1+"$@"}'
if 0;

use Getopt::Long;
use Time::Local;
use strict;
###############################################################################
##
## Source      : genmemimage.pl
##
## Description : genmemimage.pl should be run only after running Sims script.
##               Sims creates source-directory containing directories
##               corresponding to each of the diags specified in the full
##               or mini regression suites.
##               This script, first creates a top folder called "diags"
##               in the current directory. For each of the diags present
##               in the source-directory, the script picks up the mem.image
##               (created by MIDAS) file and parses it to create the data
##               structure called MEM_IMAGE. The data structure is saved
##               as mbfw_diag_memimage.c in another directory by the same
##               name as in source-directory, inside the top directory "diags" 
##               The script can also take a list of diags from the diag.list
##               and create corresponding MEM_IMAGE data structure for the
##               specified tests. 
##
## Naming
## Convention  : An Example :-
##
##       Name of Diag : win-restore0
##       Source of mem.image :
##          source-directory/win_restore0:model_core1:thread1_full:0
##       OR source-directory/win_restore0:model_core1:thread1_mini:0
##
##       Destination Directory and File :
##          ./diags/win_restore0:model_core1:thread1_full:0/mbfw_diag_memimage.c
##       OR ./diags/win_restore0:model_core1:thread1_full:0/mbfw_diag_memimage.c
##
###############################################################################

my $usage = "Usage : $0 \n" .
            "\t[-log <log-file>] [-v verbose]\n" .
            "\t[-single -f <filename> [-name <test_name>]] |\n" .
            "\t[-d <dir>] |\n" .
            "\t[-d <dir> -list <diag-list> -model <rtl_model> -suite <suite>\n" .
            "\t\t\t[-sim_id <sim_id>]]\n\n" .
            "Where,\n" .
            "\t-log <log-file>\t\tPath to the log file\n" .
            "\t-v\t\t\tVerbose mode\n\n" .
            "\t-single\t\t\tProcess the single mem.image file\n" .
            "\t-f <filename>\t\tPath to the mem.image file\n" .
	    "\t-name <test_name>\tTest name to be used for a single test\n\n" .
            "\t-d <dir>\t\tPath to the directory containing all the diag\n" .
	    "\t\t\t\tdirectories created by sims\n" .
            "\t-model <rtl_model>\tThe RTL model used for the regressions\n" .
            "\t\t\t\trtl_model=core1, chip8, etc:<K>\n" .
            "\t-suite <suite>\t\tThe regression suite used\n" .
            "\t\t\t\tsuite=core1_full, core1_mini, thread1_mini, etc\n" .
            "\t-sim_id <sim_id>\tThe regression count (defaults to 0)\n" .
            "\t-list <diag-list>\tList containg diags to process\n";

my $log_flag   = 0;
my $logfile    = "genmemimage.log";
my $targetdir  = "./diags";
my $cfilename  = "mbfw_diag_memimage.c";
my $headerfile = "mbfw_types.h";
my $headerfile2 = "mbfw_rtl.h";

my $diag_topdir;
my $diag_list;
my $test_name = "unknown";
my $model;
my $suite;
my $sim_id;
my $single_flag;
my $help_flag;
my $mimgfile = "mem.image";
my $verbose_flag;

my $memimage_in;
my $memimage_out;
my $retcode;
my $sim_id = "0";

my $getoptresults = GetOptions(
                    "-d=s"    => \$diag_topdir,
                    "-list:s" => \$diag_list,
                    "-model=s" => \$model,
                    "-suite=s" => \$suite,
                    "-sim_id=s" => \$sim_id,
                    "-log:s"  => \$logfile,
                    "-single" => \$single_flag,
                    "-h"      => \$help_flag,
                    "-f=s"    => \$mimgfile,
		    "-name=s" => \$test_name,
                    "-v"      => \$verbose_flag );


print "Release OpenSPARC 1.6 - genmemimage.pl 1.1\n";
print scalar(localtime(time)) . "\n\n";

if ($help_flag) {
    die $usage;
}

$log_flag = open LOG, ">>$logfile";
unless ( $log_flag )
{
    print "Warning: Failed to open log $logfile $!. No log will be written\n";
}

if ( $log_flag )
{
    print LOG "\nRelease OpenSPARC 1.6 - genmemimage.pl 1.1\n";
    print LOG scalar(localtime(time)) . "\n\n";
}

if ( $single_flag )
{
    if ( $mimgfile eq "" || ! -r $mimgfile )
    {
        print $usage;
        exit 0;
    }
    else
    {
	process_single_diag($mimgfile, $cfilename, $test_name);
    }
}
elsif ( $diag_topdir eq "" )
{
    print $usage;
    exit 0;
}


# If the list of diags is not specified in the command prompt through
# the -list option, process all the diags present in the top directory
# provided in the -d <directory>
elsif ( $diag_list eq "" )
{
    unless ( -d $targetdir )
    {
        $retcode = mkdir $targetdir;
        unless ( $retcode )
        {
            print_to_log("Error: Failed to create directory $targetdir...Aborting\n\n",0);
            close LOG;
            exit 0;
        }
        print_to_log("$targetdir created\n",0);
    }

    process_diags_by_dir($diag_topdir, $targetdir);

}
# Process diags from the list specified through -list option
else
{
    unless ( -d $targetdir )
    {
        $retcode = mkdir $targetdir;
        unless ( $retcode )
        {
            print_to_Log("Error: Failed to create directory $targetdir...Aborting\n\n",0);
            close LOG;
            exit 0;
        }
        print_to_log("$targetdir created\n",0);
    }

    process_diags_from_list($diag_topdir, $targetdir, $diag_list, $model,
	    $suite, $sim_id);
}

#######################################################################
## Function:	: process_single_diag
##		: Process a single diag.
## Arguments	: src_file, dest_file
#######################################################################

sub process_single_diag {
    my $src_file = shift;
    my $dest_file = shift;
    my $test_name = shift;

    print_to_log("Processing single file \'$src_file\'\n",0);

    parse_diag_memimage( $src_file, $dest_file, $test_name );

    print_to_log("File written:  $dest_file\n",0);
    print_to_log("Done\n\n",0);
    close LOG;
    exit 0;
}
#######################################################################
## Function:	: process_diags_from_list
##		: Use a list file to select which diags to process
## Arguments	: diag_root_dir, output_root_dir,
##		: diag_list, model, suite, sim_id
#######################################################################

sub process_diags_from_list {
    my $src_root_dir = shift;
    my $dest_root_dir = shift;
    my $diag_list = shift;
    my $model = shift;
    my $suite = shift;
    my $sim_id = shift;

    my $curr_diagdir;
    my $srcdiagdirname;
    my $diag_name;
    my $diag_target_dir;
    my $retcode;
    my $total_diags=0;

    print "Processing diags from $diag_list...\n";
    

    #  Make sub-directories in target dir for model and suite
    unless (-d "$dest_root_dir/$model") {
	$retcode = mkdir "$dest_root_dir/$model";
	unless ( $retcode )
	{
	    print_to_log("Error: Failed to create directory $dest_root_dir/$model...Aborting\n\n",0);
	    close LOG;
	    exit 0;
	}
    }

    unless (-d "$dest_root_dir/$model/$suite") {
	$retcode = mkdir "$dest_root_dir/$model/$suite";
	unless ( $retcode )
	{
	    print_to_log("Error: Failed to create directory $dest_root_dir/$model/$suite...Aborting\n\n",0);
	    close LOG;
	    exit 0;
	}
    }

    $retcode = open DL, $diag_list;
    unless ( $retcode )
    {
        print_to_log("Error: Failed to open $diag_list...Aborting\n\n",1);
        close DL;
        close LOG;
        exit 0;
    }

    foreach $diag_name (<DL>)
    {
        chomp( $diag_name );

        if ( index( $diag_name,"#",0 ) eq 0 ) { next; }
        if ( $diag_name eq "" ) { next; }

        $srcdiagdirname = "$src_root_dir/$diag_name:model_$model:$suite:$sim_id";
        $diag_target_dir = "$dest_root_dir/$model/$suite/$diag_name";
        

	if (-d $srcdiagdirname) {
	    print_to_log("$diag_name\n",1);
            process_dir( $srcdiagdirname,$diag_target_dir, $diag_name );
            $total_diags++;
	}
	else
        {
            print_to_log("Warning: Failed to open $srcdiagdirname: $!\n" .
                  "Warning: $diag_name not processed\n", 0);
            next;
        }
    }
    print_to_log("Total number of diags processed: $total_diags\n",0);

    closedir DH;
    close LOG;

}

#######################################################################
## Function:	: process_diags_by_dir
## 		: Process all diags in a given regression directory
##		  Without relying on a list of diags
## Arguments	: Diag root directory, output root directory
#######################################################################

sub process_diags_by_dir {
    my $src_root_dir = shift;
    my $dest_root_dir = shift;

    my $curr_diagdir;
    my $src_dir;
    my ($diag_name, $model, $suite, $sim_id);
    my $diag_target;
    my $retcode;
    my $total_diags=0;

    print "Processing diags...\n";

    opendir DH, $src_root_dir or die
        "Error: Failed to open regression directory $diag_topdir...Aborting\n";

    
    foreach $curr_diagdir (readdir DH)
    {
	$src_dir = "$src_root_dir/$curr_diagdir";
	($diag_name, $model, $suite, $sim_id) = split(/:/, $curr_diagdir, 4);
	$model =~ s/model_//;

	if (-d $src_dir && $model ne "" && $suite ne "" && $sim_id ne "") {


	    print_to_log("$curr_diagdir\n",1);
	    
	    #  Make sub-directories in target dir for model and suite
	    unless (-d "$dest_root_dir/$model") {
		$retcode = mkdir "$dest_root_dir/$model";
		unless ( $retcode )
		{
		    print_to_log("Error: Failed to create directory $dest_root_dir/$model...Aborting\n\n",0);
		    next;
		}
	    }

	    unless (-d "$dest_root_dir/$model/$suite") {
		$retcode = mkdir "$dest_root_dir/$model/$suite";
		unless ( $retcode )
		{
		    print_to_log("Error: Failed to create directory $dest_root_dir/$model/$suite...Aborting\n\n",0);
		    next;
		}
	    }


	    # Create the path to the target output
	    $diag_target = "$dest_root_dir/$model/$suite/$diag_name";



	    process_dir( $src_dir,$diag_target, $diag_name );
	    $total_diags++;
        }
    }

    print_to_log("Info: Total number of diags processed: $total_diags\n", 0);
    print_to_log("Info: Top Directory :- $diag_topdir\n",0);
    print_to_log("\nDone\n",0);
    close LOG;
    closedir DH;
    exit 0;
}

#######################################################################
## Function:         : process_dir
## Input Parameter 0 : full path of the source diag directory
## Input Paramtere 1 : full path of the destination diag directory
#######################################################################
sub process_dir
{
    my $srcdir = shift;
    my $destdir = shift;
    my $diag_name = shift;

    my $ret;

    unless ( -d $destdir )
    {
        $ret = mkdir $destdir;
        unless ( $ret )
        {
	    print_to_log("Warning: Failed to create directory : " . $destdir . "\n", 0);
        }
    }

    $memimage_in  = $srcdir . "/$mimgfile";
    $memimage_out = $destdir . "/$cfilename";
    
    parse_diag_memimage( $memimage_in, $memimage_out, $diag_name );

    return;
}

#######################################################################
## Function:	: print_to_log
##		: Print a message to the screen and optionally to a
##		: log file.
## Arguments	: Message string, verbose only flag
#######################################################################
sub print_to_log {
    my $message = shift;
    my $verbose_only = shift;	# Print the message to stdout only if
				# verbose flag is set

    if (! $verbose_only || $verbose_flag) {
	print $message;
    }
    if ($log_flag) {
	print LOG $message;
    }
}
    
#######################################################################
## Function:         : parse_diag_memimage
## Input Parameter 0 : path of the source diag memory image file
## Input Paramtere 1 : path of the destination diag memory image C data
##                     structure file
#######################################################################
sub parse_diag_memimage
{
    my $imagefile = shift;
    my $outcfile  = shift;
    my $test_name = shift;

    my $addr_id          = '@';
    my $comment_id       = "//";
    my $block_start_addr;
    my $addr_length      = 16;
    my $count            = 0;
    my $ncblock_count    = 0;
    my $dword_count      = 0;
    my $qword_flag       = 0;
    my $dword;
    my $qword;
    my $qword_count      = 0;
    my $prev_line        = 0;

    my $DWORD_PER_LINE   = 4;
    my $BLOCK_START_ADDR = 1;
    my $DATA             = 2;
    my $END_OF_DS        = -1;
    my @addr_Q;
    my @blksize_Q;
    my $addr;
    my $size;
    my $i                = 0;

    my $arrayname;

    my @threads_active = (1, 0, 0, 0);

    open MIMG, $imagefile    or die "Error: Failed to open $imagefile\n";
    open OCDS, ">$outcfile"  or die "Error: Failed to open $outcfile\n";

    print OCDS "\n#include <stdlib.h>\n";
    print OCDS "#include <stdio.h>\n";

    print OCDS "\n#include \"$headerfile\"\n";
    print OCDS "#include \"$headerfile2\"\n";
    print OCDS "\n#ifdef REGRESSION_MODE\n";
    print OCDS "\n\tchar *test_name = \"$test_name\";\n";

    while (<MIMG>)
    {
        chomp $_;

# If the starting address of a contiguous block
        if ( rindex( $_,$addr_id ) eq 0 )
        {
	    if ( /MAIN_(\d)/ ) {
		if ($1 > 0 && $1 < 4) {
		    $threads_active[$1] = 1;
		}
	    }
            if ( $ncblock_count gt 0 )
            {
                if ( $dword_count > 0 )
                {
                    $qword = $dword_count % 4;
                    if ( $qword == 0 )
                    {
                        print OCDS "\n\t};\n";
                    }
                    elsif ( $qword == 1 )
                    {
                        $dword_count += 3;
                        printf OCDS ", 0x%.16xULL, 0x%.16xULL, 0x%.16xULL\n\t};\n",0,0,0;
                    }
                    elsif ( $qword == 2 )
                    {
                        $dword_count += 2;
                        printf OCDS ", 0x%.16xULL, 0x%.16xULL\n\t};\n",0,0;
                    }
                    elsif ( $qword == 3 )
                    {
                        ++$dword_count;
                        printf OCDS ", 0x%.16xULL\n\t};\n",0;
                    }
                }
                else
                {
                    $dword_count = 4;
                    printf OCDS "0x%.16xULL, 0x%.16xULL, 0x%.16xULL, 0x%.16xULL\n\t};\n",0,0,0,0;
                }
            }
            $block_start_addr = substr( $_,1,$addr_length );
            print OCDS "\n\tuint64_t MI_$block_start_addr [] __attribute__ ((section(\".noinit\"),aligned(32))) = {\n\t";

            if ( $ncblock_count gt 0 )
            {
                unshift( @blksize_Q,$dword_count );
            }
            $dword_count = 0;
            $qword_count = 0;
            $ncblock_count++;
            unshift( @addr_Q,$block_start_addr );
        }
        elsif ( $_ eq "" )
        {
            next;
        }
        elsif ( rindex( $_,$comment_id ) != 0 )
        {
            if ( ($prev_line eq	$DATA) && ($dword_count gt 0) )
            {
                print OCDS ",\n\t";
            }
            foreach $dword (split)
            {
                if ( ($dword_count gt 0) && (($dword_count % $DWORD_PER_LINE) != 0) )
                {
                    print OCDS ", 0x$dword";
                    print OCDS "ULL";
                }
                else
                {
                    print OCDS "0x$dword";
                    print OCDS "ULL";
                }
                $dword_count++;
            }
            $prev_line = $DATA;
        }
    }

    if ( $dword_count > 0 )
    {
        print OCDS "\n\t};\n";
    }
    else
    {
        $dword_count = 4;
        printf OCDS "0x%.16xULL, 0x%.16xULL, 0x%.16xULL, 0x%.16xULL\n\t};\n",0,0,0,0;
    }

    unshift( @blksize_Q,$dword_count );

    print OCDS "\nmemimage_t MEM_IMAGE [] = {\n\t";

    $count = $ncblock_count;

    do
    {
        $addr = pop( @addr_Q );
        $size = pop( @blksize_Q );
        $arrayname = "MI_$addr";
        print OCDS "{$i, 0x$addr";
        print OCDS "ULL, $size, $arrayname },\n\t";
        $count--;
        $i++;
    }
    while ( $count > 0 );

    $addr = 0;
    $size = 4;
    $arrayname = "MI_$addr";
    printf OCDS "{-1, 0x%.16xULL, $size, NULL }\n};\n",$addr,4;

    printf OCDS "\n\tint threads_active [] = { %d, %d, %d, %d };\n\n",
    			$threads_active[0], $threads_active[1],
			$threads_active[2], $threads_active[3];

    print OCDS "#endif\t\t/* ifdef REGRESSION_MODE */\n\n";

    close MIMG;
    close OCDS;

    print_to_log("Info: Name of C File :- $outcfile\n",1);
    print_to_log("Info: Created from   :- $imagefile\n",1);
    print_to_log("Number of Contiguous Blocks : $ncblock_count\n\n",1);
}

