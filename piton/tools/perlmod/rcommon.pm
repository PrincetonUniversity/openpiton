# Copyright (c) 2017 Princeton University
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#########################################################
# Description: Common functions for all backend scripts
# Author: Michael McKeown
#########################################################

use warnings;
use strict;
use Cwd;
use Cwd 'chdir';
use Getopt::Long ;

my $block_line;
my @block_line_split;
my $block_data;
my $blk_list_file;
my @blocks_input;
my $run_all;
my @all_blocks;
my $block_count;
my @block_match_list;
my $retval;

sub block_line_is_comment {
    $block_line = $_[0];
    if ($block_line =~ /\s*#.*/) {
        return 1;
    }
    return 0;
}

sub process_block_line {
    $block_line = $_[0];
    @block_line_split = split(' ', $block_line);

    $block_data = {};
    $block_data->{ID} = $block_line_split[0];
    $block_data->{PATH} = $block_line_split[1];
    $block_data->{SYNMEM} = $block_line_split[2];
    $block_data->{PARMEM} = $block_line_split[3];
    $block_data->{FTFPASSES} = $block_line_split[4];
    if ($block_line_split[5] =~ /[Yy]/) {
        $block_data->{ECOFLOW} = 1;
    } else {
        $block_data->{ECOFLOW} = 0;
    }

    return $block_data;
}

sub process_blocks {
    $blk_list_file = $_[0];
    $run_all = $_[1];
    @blocks_input = @{$_[2]};

    $block_count = 0;

    open (BLK_IN, "< $blk_list_file") or die ("DIE. could not open $blk_list_file");
    if ($run_all) {
        while (<BLK_IN>)
        {
            $block_line = $_ ;
            if (!block_line_is_comment($block_line))
            {
                $block_data = process_block_line ($block_line); 
                $block_count++;
                push @block_match_list, $block_data ;
            }
        }
    } else {
        @all_blocks = <BLK_IN>;
        foreach my $block (@blocks_input)
        {
            foreach my $line (@all_blocks)
            {
                if (!block_line_is_comment($line))
                {
                    $block_data = process_block_line ($line);
                    if ($block_data->{ID} eq $block)
                    {
                        $block_count++;
                        push @block_match_list, $block_data ;
                        last;
                    }
                }
            }
        }                                                                                                            
    }
    close(BLK_IN);

    $retval = {};
    $retval->{COUNT} = $block_count;
    $retval->{MATCHES} = \@block_match_list;

    return $retval;
}

sub create_slurm_script {
    my ($cmd_script, $cmd, $scores, $stime, $smem, $pre_cmd, $post_cmd) = @_;
    # If these are not defined, set them to invalid values to check later
    $smem //= "";
    $pre_cmd //= "";
    $post_cmd //= "";

    open(BLK_CMD, "> $cmd_script") or die ("DIE. could not open $cmd_script");
    print BLK_CMD "#!/bin/bash\n";
    print BLK_CMD "#SBATCH -n $scores\n";
    print BLK_CMD "#SBATCH -N 1\n";
    if ($smem ne "") {
        print BLK_CMD "#SBATCH --mem $smem\n";
    }
    print BLK_CMD "#SBATCH -t $stime\n\n";
    if ($pre_cmd ne "")
    {
        print BLK_CMD "$pre_cmd\n\n"
    }
    print BLK_CMD "$cmd\n\n";
    if ($post_cmd ne "")
    {
        print BLK_CMD "$post_cmd\n\n";
    }
    print BLK_CMD "exit";
    close(BLK_CMD);

    return 0; 
}

sub submit_slurm_job {
    my ($prg, $cmd_script, $depend_job_id) = @_;
    # If this is not defined, set them to invalid values to check later
    $depend_job_id //= "";

    my $retcode = 1;
    my $job_id = "";
    while ($retcode != 0)
    {
        my $job_output = "";
        if ($depend_job_id ne "")
        {
            $job_output = `sbatch --dependency=afterok:$depend_job_id $cmd_script`;
        }
        else
        {
            $job_output = `sbatch $cmd_script`;
        }
        print $job_output;
        $retcode = $?;
        if ($retcode != 0)
        {
            print "$prg: Failed to submit batch job...retrying\n";
            sleep 30;
        }
        else
        {
            $job_id = $job_output;
            $job_id =~ s/Submitted batch job (\d+)\n/$1/ ;
        }
    }

    return $job_id;
}

sub wait_slurm_jobs {
    my @job_ids = @{$_[0]};
    my $user = $ENV{USER};

    while (@job_ids >  0) {
        my @remove_jobs = ();
        foreach my $job_id (@job_ids) {
            my $squeue_wc_out = `squeue -u $user -j $job_id | wc -l`;
            if ($squeue_wc_out == "1\n" || $squeue_wc_out == "0\n") {
                push @remove_jobs, $job_id ;
            }
        }

        foreach my $job_id (@remove_jobs) {
            @job_ids = grep { $_ != $job_id } @job_ids;
        }

        sleep 30;
    }

    return 0;
}

return 1;
