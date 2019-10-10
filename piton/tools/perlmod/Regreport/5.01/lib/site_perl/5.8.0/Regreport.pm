# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
#
# OpenSPARC T1 Processor File: Regreport.pm
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
package Regreport;

use 5.008;
use strict;
use warnings;
use	IO::Handle;
use Cwd;         	# to get safe current working directory
use Cwd 'chdir';    	# so $ENV{PWD} is set as well

require Exporter;

our @ISA = qw(Exporter);

#-------------------------------------------------------------------------
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Regreport ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
#-------------------------------------------------------------------------

my @funcs = qw(regenerate chk_single_diag wait_regression regress_stat regreportsendmail);
my @vars  = qw($wait_sec $vlog $debug $sas_only $simline $full $printpassed $rsfh $summary $emailaddr);

our %EXPORT_TAGS = (
	funcs => [ @funcs ],
	vars  => [ @vars ],
        all   => [ @funcs, @vars] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT =  @{ $EXPORT_TAGS{'all'} };

our $VERSION = '5.01';

# Preloaded methods go here.

#======================================================
$SIG{INT}= \&cleanup;
#======================================================

our($wait_sec)= 300;		# polling interval (for -regress)
our($vlog, $debug, $sas_only, $simline, $full,
    $printpassed, $summary, $emailaddr);
our($rsfh) = \*STDOUT;		# the file handler where regress_stat dumps

my(@errlines);			# error lines being gathered
my(@perf_errors);		# performance error lines being gathered
my ($diagplerr, $tsotoolerr);
my(%stat_details, %stats);	# status hash per diag

my (%group_count);		# # of diags in different groups
my (%group_count_stat);		# 2D array with  status per group

# The status types:
#------------------
my(%STATUS_NAME)= ('pass' => 'PASS',
                   'fail' => 'FAIL',
                   'diag' => 'Diag Problem',
                   'lcns' => 'License Problem',
                   'maxc' => 'MaxCycles Hit',
                   'sckt' => 'Socket Problem',
                   'timo' => 'Timeout',
                   'lessthr' => 'LessThreads',
                   'simx' => 'Simics Problem',
                   'perf' => 'Performance',
                   'jobq' => 'Killed By Job Q',
                   'flex' => 'flexlm error',
                   'unkn' => 'Unknown',
                   'unfi' => 'UnFinished'
               );

#default error pattern
#---------------------
my($error_pattern)= 'mismatch|error|fail|wrong_trigger';

my($good_trap_va) 	= 422000;
my($hgood_trap_va) 	= 82000;
my($bad_trap_va)  	= 422020;
my($hbad_trap_va)  	= 82020;
my($main_va)  		= 20000000;

my($ctime) = 1000.0;		# cycle time (1GHz default)

#--------------------------------------------------------------
my($drawline)		= ("=" x 80) . "\n";
my($errline_num) 	= 0;
my($found_wall_sec) 	= 0;
my($found_sim_cyc) 	= 0;
my($wall_sec)		= 0;
my($sim_cyc)		= 0;
my($exec_start_cyc) = 0;
my($num_tiles)      = 0;

my($last_sas);
my(%main_vartlcycle);
my(%main_vasascycle);
my(%last_sascycle);
my(%last_rtlcycle);

my($GUNZIP)	= "gzip -dc";	# gunzip
my($err_lines_per_diag) = 10;	# lines per diag (to report)
my($animate)=  1;		#0: to turn off display of diags
my ($grp_pos_in_name) = 2;
my ($vcslog_exists);


#==================================================================
# START of LIB
#==================================================================

#======================================================================
# check a single diag:
#======================================================================
sub	chk_single_diag {

  my($diag)= @_;

  my(@templist);
  $found_wall_sec = 0;
  $found_sim_cyc  = 0;
  $wall_sec 	  = 0;
  $sim_cyc     	  = 0;
  $exec_start_cyc = 0;
  $num_tiles      = 0;
  $last_sas       = "not known";
  $errline_num    = 0;
  @errlines       = ();

  my($status)	= 'unkn';

#figure out diag directory
#=========================
  if($diag eq '.') {
    chop($diag= `pwd`);
    $diag=~ m%([^/]+)$%;
    $diag= $1;
  }elsif(! -d $diag) { die "No such diag directory: $diag\n"; }
  else{
    chdir($diag);
    $diag=~ s/\/$//;
  }

# extract key info from files
#============================
  my($open_sym) = 0;
  if(-e "symbol.tbl"){
    open(SYM, "symbol.tbl")  || die "Cannot open symbol.tbl\n";
    $open_sym = 1;
  } elsif(-e "symbol.tbl.gz"){
    open(SYM, "$GUNZIP symbol.tbl.gz |")  || die "Cant gunzip symbol.tbl.gz\n";
    $open_sym = 1;
  }

# Get the PC values of some crucial labels
#-----------------------------------------
  if($open_sym){
    while(<SYM>){
      if(/\.T0_GoodTrap_0x100\s+0+(\w+)/){
         $good_trap_va = $1;
      }
      elsif(/\.HT0_GoodTrap_0x100\s+0+(\w+)/){
         $hgood_trap_va = $1;
      }
      elsif(/\.T0_BadTrap_0x101\s+0+(\w+)/){
         $bad_trap_va = $1;
      }
      elsif(/\.HT0_BadTrap_0x101\s+\w+\s+0+(\w+)/){
         $hbad_trap_va = $1;
      }
      elsif(/main.main\s+0+(\w+)/i){
         $main_va = $1;
      }
    }
    if($debug){
      print "good trap  $good_trap_va  \tbad trap  $bad_trap_va \n";
      print "hgood trap $hgood_trap_va \thbad trap $hbad_trap_va \n";
      print "main_va $main_va\n";
    }
  }

  my($something) = 0;
  $vcslog_exists = 0;
  if(!$sas_only && (-r 'sim.log' || -r 'sim.log.gz')) {
      if(-r    "sim.log")  	{ open (FUT, " sim.log ");}
      elsif(-r "sim.log.gz")	{ open (FUT, "$GUNZIP sim.log.gz |");}
      &getfreq;
      close(FUT);

      if(-r    "sim.log")   { open (FUT, " sim.log ");}
      elsif(-r "sim.log.gz")    { open (FUT, "$GUNZIP sim.log.gz |");}
      &getexecstart;
      close(FUT);

      if(-r    "sim.log")   { open (FUT, " sim.log ");}
      elsif(-r "sim.log.gz")    { open (FUT, "$GUNZIP sim.log.gz |");}
      &getnumtiles;
      close(FUT);

      if($full){
        if(-r    "sim.log")  	{ open (FUT, "sim.log");}
        elsif(-r "sim.log.gz")	{ open (FUT, "$GUNZIP sim.log.gz |");}
      }
      else{
        if(-r    "sim.log")  	{ open (FUT, " tail -$simline sim.log |");}
        elsif(-r "sim.log.gz")	{ open (FUT, "$GUNZIP sim.log.gz |  tail -$simline |");}
      }
      &vcsgrep;
      close(FUT);
      $something = 1;
      $vcslog_exists = 1;

  }elsif(-r 'jobq.log' || -r 'jobq.log.gz') {
    if(-r    "jobq.log")  	{ open (FUT, "jobq.log");}
    elsif(-r "jobq.log.gz")	{ open (FUT, "$GUNZIP jobq.log.gz |");}
    &jobqloggrep;
    close(FUT);
    $something = 1;
  }elsif($sas_only && (-r 'sims.log' || -r 'sims.log.gz')) {
    if(-r    "sims.log")  	{ open (FUT, "sims.log");}
    elsif(-r "sims.log.gz")	{ open (FUT, "$GUNZIP sims.log.gz |");}
#----------------------------------------------------------------------
# this is a little hacky but listen up:
# for the weird situation when I am checking a single diag for sas_only run
# regreport -1 -sas_only
# I open  sims.log but perform the jobqloggrep checks
#----------------------------------------------------------------------
    &jobqloggrep;
    close(FUT);
    $something = 1;
  }

  if(-r 'sas.log' || -r 'sas.log.gz') {
    if($full){
      if(-r    "sas.log")  	{ open (FUT, "sas.log");}
      elsif(-r "sas.log.gz")	{ open (FUT, "$GUNZIP sas.log.gz |");}
    }
    else{
      if(-r    "sas.log")  	{ open (FUT, " tail -$simline sas.log |");}
      elsif(-r "sas.log.gz")	{ open (FUT, "$GUNZIP sas.log.gz |  tail -$simline |");}
    }
    &sasgrep;
    close(FUT);
    $something = 1;
  }

  if(!$something) {
     printf $rsfh "Diag: %-40s   %s\n", $diag, $STATUS_NAME{'unkn'};
     return ('unkn', 0, 0);
  }

#analyze failure
#===============
  my($long_stat, $i, $curr_line);

  $long_stat= "$STATUS_NAME{'unkn'} (No Status)";
  $status = 'unkn';
  for($i = 0; $i < $errline_num; $i++){

    $curr_line= $errlines[$i];
    if($curr_line =~ /(\w+.MISMATCH)/) {
      $long_stat= "$STATUS_NAME{'fail'} ($1)";
      $status = 'fail';
      last;
    }elsif($curr_line =~ /flexlm\s+error/i){
       $long_stat= "$STATUS_NAME{'flex'}";
       $status  = 'flex';
       last;
    }elsif($curr_line=~/error/io) {
       $long_stat= "$STATUS_NAME{'fail'} (Monitor)";
       $status = 'fail';
       last;
    }elsif($curr_line =~ /Simulation -> FAIL(.*)/) {
       my($why)= $1;
       if($why=~/TIMEOUT/){
         $status=    'timo';
         $long_stat= "$STATUS_NAME{'timo'} $why";
       }
       elsif($why=~/less thread/){
         $status=    'lessthr';
         $long_stat= "$STATUS_NAME{'lessthr'} $why";
       }
       else{
         $status=    'fail';
         $long_stat= "$STATUS_NAME{'fail'} $why";
       }
       last;
    }elsif($curr_line =~ /FAIL(.*finish_count not reached)/) {
       my($why)= $1;
       $status=    'lessthr';
       $long_stat= "$STATUS_NAME{'lessthr'} $why";
       last;
    }elsif($curr_line =~ /SAS-MEM: ASSERT ERROR:/s) {		#sim.log/sas.log
       my($msg)= $';
       $msg=~ s/(.*)\n//;					#$1 is the line after
       $long_stat= "$STATUS_NAME{'fail'} (SAS-MEM:$1)";		# 'ASSERT ERROR:'
       $status = 'fail';
       last;
    }elsif($curr_line =~ /terminated by reaching max cycles/) {
      $long_stat= "$STATUS_NAME{'maxc'}";
      $status = 'maxc';
      last;
    }elsif(($curr_line =~ /Simulation -> PASS/)||(!$vcslog_exists && ($curr_line =~ /all threads are done:\s+\d+\s+passed/i))){
      #system("tso_analyze > /dev/null");
      #if(-r 'tsotool.log' || -r 'tsotool.log.gz') {
      #  if(-r    "tsotool.log")       { open (FUT, "tsotool.log");}
      #  elsif(-r "tsotool.log.gz")    { open (FUT, "$GUNZIP tsotool.log.gz |");}
      #  $tsotoolerr = &tsotoolgrep;
      #  close(FUT);
      #}  ### of if -r tsotool.log...

      if(-r 'diag_pl.log' || -r 'diag_pl.log.gz') {
        if(-r    "diag_pl.log")       { open (FUT, "diag_pl.log");}
        elsif(-r "diag_pl.log.gz")    { open (FUT, "$GUNZIP diag_pl.log.gz |");}
        $diagplerr = &diagplgrep;
        close(FUT);
      }

      if($tsotoolerr){
        $long_stat= "$STATUS_NAME{'fail'} tso_analyze failure";
        $status = 'fail';
      } ### of if $tsotoolerr
      elsif($diagplerr){
        $long_stat= "$STATUS_NAME{'perf'}";
        $status = 'perf';
      }
      else{
        $long_stat= "$STATUS_NAME{'pass'}";
        $status = 'pass';
      }
    }elsif($curr_line =~ /no diag|midas.*error/i) {
      $long_stat= $STATUS_NAME{'diag'};
      $status = 'diag';
      last;
    }elsif($curr_line =~ /Failed to obtain license/){
      $long_stat = $STATUS_NAME{'lcns'};
      $status = 'lcns';
      last;
    }elsif($curr_line =~ /Caught a SIG/) {
       $long_stat= "$STATUS_NAME{'jobq'} (Exceed Job Q Manager Time Limit?)";
       $status = 'jobq';
       last;
    }elsif($curr_line =~ /ERROR: (No sim.log)/) {
      $long_stat= "$STATUS_NAME{'unkn'} ($1)";
      $status = 'unkn';
      last;
    }elsif($curr_line =~ /simv run exited with error: (.*)/) {
      $long_stat= "$STATUS_NAME{'unkn'} ($1)";
      $status = 'unkn';
      last;
    }elsif($curr_line =~ /can.t connect|Can't bring up server connection|the command did not complete properly/io) {
      $long_stat= $STATUS_NAME{'sckt'};
      $status = 'sckt';
      last;
    }elsif($curr_line =~ /simics.*shaky/i) {
      $long_stat= "$STATUS_NAME{'simx'}";
      $status = 'simx';
      last;
    }elsif($sas_only && ($curr_line =~ /v:0x$bad_trap_va/i)){
      $long_stat= "$STATUS_NAME{'fail'} SAS-MEM fail in sas_only mode BAD TRAP v:0x$bad_trap_va";
      $status = 'fail';
      last;
    }elsif($sas_only && ($curr_line =~ /v:0x$hbad_trap_va/i)){
      $long_stat= "$STATUS_NAME{'fail'} SAS-MEM fail in sas_only mode HBAD TRAP v:0x$bad_trap_va";
      $status = 'fail';
      last;
    }elsif($sas_only && ($curr_line =~ /v:0x$good_trap_va/i)){
      $long_stat= "$STATUS_NAME{'pass'} SAS-MEM pass in sas_only mode GOOD TRAP v:0x$good_trap_va";
      $status = 'pass';
      last;
    }elsif($sas_only && ($curr_line =~ /v:0x$hgood_trap_va/i)){
      $long_stat= "$STATUS_NAME{'pass'} SAS-MEM pass in sas_only mode HGOOD TRAP v:0x$good_trap_va";
      $status = 'pass';
      last;
    }elsif($curr_line =~ /SAS hits MAX CYCLE -> FAIL/){
      $long_stat= "$STATUS_NAME{'maxc'} SAS hits MAX CYCLE -> FAIL";
      $status = 'maxc';
      last;
    }
  }

# final touches of the analysis
# print.
#=============================+

  my($mydate) = `date`;
  printf $rsfh "Diag: %-40s   %s\n", $diag, $long_stat;
  print $rsfh "$mydate";
  if(!$sas_only) {
    foreach my $k (sort keys %main_vartlcycle){
      print $rsfh "RTL thread $k reached main_va at simulation cycle $main_vartlcycle{$k}\n";
    }
    foreach my $k (sort keys %main_vasascycle){
      print $rsfh "SAS thread $k reached main_va at simulation cycle $main_vasascycle{$k}\n";
    }
    foreach my $k (sort keys %last_rtlcycle){
      print $rsfh "RTL thread $k: $last_rtlcycle{$k}\n";
    }
    foreach my $k (sort keys %last_sascycle){
      print $rsfh "SAS thread $k: last sas at simulation cycle $last_sascycle{$k}\n";
    }
  }

# print first n-line error message
#===================================
   for($i = 0; $i <= $#errlines; $i++){
      print $rsfh $errlines[$i];
   }

# calculate cycle/sec
#====================
  if(($status eq 'pass' || $status eq 'fail')  && $found_sim_cyc && $found_wall_sec) {
    printf $rsfh "Cyc= %10s, Sec=%10s, C/S=%4.1f\n", $sim_cyc, $wall_sec, $sim_cyc/($wall_sec+0);
  }

  if(($status eq 'pass' || $status eq 'fail')  && $found_sim_cyc && $found_wall_sec) {
    printf $rsfh "ExecCyc= %10s, Sec=%10s, EC/S=%4.1f\n", $sim_cyc - $exec_start_cyc, $wall_sec, ($sim_cyc - $exec_start_cyc)/($wall_sec+0);
  }

  if($status eq 'pass' || $status eq 'fail') {
    printf $rsfh "NumTiles=%10s\n", $num_tiles;
  }

  if($diagplerr){
    print $rsfh join '', @perf_errors;
  }

  if($vlog && !($status eq 'pass')){
    system("procvlog -ccx -l2 > vlog.log");
  }

  STDOUT->autoflush(1);
  ($status, $sim_cyc, $wall_sec);
}

#================================================================
# when the call was: regreport -regress
# wait until all diags produced their status.log
#================================================================
sub	wait_regression {
   my($ofile, $regress_dir) = @_;	#output file, regression directory

   my(@idle_char)= ('|', '/', '-', '\\');
   my $spinner;
   my($iter)= 0;
   my($unfini) = 1;
   my($last_unfini);
   my($idle_time) = 0;
   my($total_time) = 0;

   my($format)=  '%-15s %10d unfinished diags idle_time: %7.1f min. total_time %7.1f min. %-3s';
   my($msg_len)= length( sprintf($format, '',0,0,0,'') );
   my($erase_msg)= "\b" x $msg_len;

   $animate= 1;					#turn diag name printing/erasing
   system("clear");
   print $drawline;
   print "== regreport -regress waiting for a regression...  ==\n";
   print $drawline;

   while($unfini) {
     open(OUTFILE, "> $ofile") or die "cannot open $ofile";
     $rsfh = \*OUTFILE;
     print STDERR $erase_msg;
     $unfini= & regress_stat($regress_dir);
     print STDERR $erase_msg;
     close(OUTFILE);

     $spinner = $idle_char[$iter&3] x 3;
     if(!$unfini){
       print STDERR "\n$drawline";
       print STDERR "REgression finished, be happy and rejoice!\n";
       print STDERR $drawline;
       exit 0;
     }
     else{
       if(!$iter) {			#making progress
	 printf STDERR $format, 'Just started',  $unfini ,  $idle_time/60, $total_time/60, $spinner;
       }elsif ($last_unfini > $unfini){
         $spinner = $idle_char[($iter++)&3] x 3;
         print STDERR $erase_msg;
	 printf STDERR $format, 'steady progress',  $unfini ,  $idle_time/60, $total_time/60, $spinner;
         $idle_time = 0;
       }else{
         print STDERR $erase_msg;
	 printf STDERR $format, 'No     progress',  $unfini ,  $idle_time/60, $total_time/60, $spinner;
       }
     }
     STDOUT->autoflush(1);
     STDERR->autoflush(1);
     sleep($wait_sec)	if($unfini);
     $idle_time+= $wait_sec;
     $total_time+= $wait_sec;
     if($total_time > 20000){
        print STDERR "\n$drawline";
        print STDERR " Well, ($total_time secs) passed, regression is not over\n";
        print STDERR "I am quitting now... Please, checks the regression manually.\n";
        exit 1;
     }
     $iter++;
     $last_unfini = $unfini;
   }
}

#===================================================================
# sometimes useful - for each diag in the directory
# go inside its dir. and regrenerate the status.log file.
#===================================================================
sub     regenerate {

     my($list);
     $list= `ls -1`;
     my(@dir)= split("\n", $list);
     my($diag);
     my($i) =0;
     foreach $diag (@dir) {
       next	if(! -d $diag);
       next if($diag eq 'coverage' );
       next if($diag eq 'tre' );
       $i++;
       print STDERR "$i: regenerating $diag\n";
       next    if(! -d $diag);
       chdir($diag);
       open(OUTFILE, "> status.log") or die "cannot open status.log";
       $rsfh = \*OUTFILE;
       chk_single_diag(".");
       close(OUTFILE);
       chdir('..');
     }
}

#===================================================================
# send an email
# notes:
#The -oi option prevents sendmail from interpreting a line
#consisting of a single dot as "end of message". The -t option says to use the headers to decide
#who to send the message to, and -odq says to put the message into the queue.
#This last option means your message won't be immediately delivered, so
# leave it out if you want immediate delivery.
#===================================================================

sub regreportsendmail{
    open(M, "|/usr/lib/sendmail -oi -t")
                             or die "Can't fork for sendmail: $!\n";
    print M "From: regreport\n";
    print M "To: <$emailaddr>\n";

    print M "Subject: regreport status \n";

    while(<$rsfh>){
      print M;
    }
    print M "\n.\n";
    close(M) or warn "sendmail didn't close nicely";
}

#===================================================================
# regrrssions status - the MAIN function
#===================================================================
sub	regress_stat {			#return #diags w/ empty directory
  my($regress_dir)= shift(@_);		#regression directory
  my($status, $cyc, $sec);

  my ($curr_dir);
  chop($curr_dir= `pwd`);

  if(-d $regress_dir){ chdir($regress_dir);	}
  else		{ print STDERR "Cannot chdir into $regress_dir\n"; }

  chop($regress_dir= `pwd`);

  my($i, $list, $specific_args);	#list: specified diag dir list
  $specific_args = "";
  foreach $i (@_) {
    $specific_args .= "$i* ";
  }
  if($specific_args){	$list= `ls -1d $specific_args`;}
  else{			$list= `ls -1`;}

  my(@dir)= split("\n", $list);

  my($index)= 0;
  my($group, $diag_name);
  my(%pass_fail_count, %pass_fail_cyc, %pass_fail_sec);

  my($format)= "%-65s %4d";
  my($name_erase)= "\b" x length( sprintf($format, '',0) );

#========================================
# figure out the different groups
#========================================

  my($diag);
  foreach $diag (@dir) {
    next	if(! -d $diag);
    next if($diag eq 'coverage' );
    next if($diag eq 'tre' );
    my @diag_name_parts = split ':',$diag;
    $group_count{$diag_name_parts[$grp_pos_in_name]} = 0 if(scalar(@diag_name_parts) > $grp_pos_in_name);
  }

  $group_count{'ALL'} = 0;
  my(@group_list)= reverse sort keys %group_count;

#========================================
# initialize some variables
#========================================
  foreach my $status (%STATUS_NAME) {
    foreach $group (@group_list) {
      $group_count{$group}= 0;
      $group_count_stat{$group}->{$status}= 0;
      $pass_fail_count{$group}= 0;
      $pass_fail_cyc{$group}= 0;
      $pass_fail_sec{$group}= 0;
    }
  }

#========================================
# walk-thru all diag dir and collect info
#========================================
  foreach $diag (@dir) {
    next if(! -d $diag);
    next if($diag eq 'coverage' );
    next if($diag eq 'tre' );
    my @diag_name_parts = split ':',$diag;
    $group = "";
    if(scalar(@diag_name_parts) > $grp_pos_in_name){
      $group= $diag_name_parts[$grp_pos_in_name];
      if(defined $group_count{$group}){
        ++ $group_count{$group};
      }
      else{
        die "Something is wrong at walk-thru group is $group\n";
      }
    }
    ++ $group_count{'ALL'};

    if($animate) {
       $diag_name= sprintf($format, $diag, ++$index);
       print STDERR $diag_name;				#print processed diag name
       STDERR->autoflush(1);
    }

    ($status, $cyc, $sec)= & chk_statuslog($diag);

    ++ $group_count_stat{$group}->{$status} if ($group);
    ++ $group_count_stat{ALL}->{$status};

### to calcuate cycles per second
#================================
    if($sec!=0 && ($status eq 'pass' || $status eq 'fail')) {
      if($group){
        $pass_fail_count{$group} ++;
        $pass_fail_cyc{$group}+= $cyc;
        $pass_fail_sec{$group}+= $sec;
      }
      $pass_fail_count{ALL} ++;
      $pass_fail_cyc{ALL}+= $cyc;
      $pass_fail_sec{ALL}+= $sec;
    }

    if($animate) { print STDERR $name_erase; }
  }
  if($animate){ printf STDERR $format, "Total diags:", $group_count{'ALL'}; }

#======================================
# print summary information
#======================================

# header
#=======
  print  $rsfh "\nSummary for $regress_dir\n";
  print  $rsfh $drawline;
  printf $rsfh "%15s:", 'Status' ;
  foreach $group (@group_list) {
     printf $rsfh "%9s |", $group;
  }
  print  $rsfh "\n", '-' x 80, "\n";

# status counts
#==============
  foreach my $type ('pass','fail','diag','lcns','maxc','sckt','timo','lessthr','simx','perf','jobq','unkn','unfi', 'flex') {
    printf $rsfh "%15s:", $STATUS_NAME{$type};
    foreach $group (@group_list) { printf $rsfh "%9d |", $group_count_stat{$group}->{$type}; }
    print $rsfh "\n";
  }

  print $rsfh '-' x 80, "\n";
  printf $rsfh "%15s:", 'Diag Count';
  foreach $group (@group_list) {
    printf $rsfh "%9d |", $group_count{$group};
  }
  print $rsfh "\n";

## cycles/second:
## simulation cycles per second
#------------------------------------
  print $rsfh '-' x 80, "\n";
  printf $rsfh "%15s:", 'Cycles/Sec';
  foreach $group (@group_list) {
     printf $rsfh "%9s |", $pass_fail_sec{$group} ?
	int($pass_fail_cyc{$group}/$pass_fail_sec{$group}) :
	'-NA-' ;
  }
  print $rsfh "\n";

## Total cycles
#------------------------------------
  printf $rsfh "%15s:", 'K Cycles';
  foreach $group (@group_list) {
     printf $rsfh "%9d |", int($pass_fail_cyc{$group}/1000);
  }
  print $rsfh "\n";

## Diags counted for cycles/second
#------------------------------------
  printf $rsfh "%15s:", '#Diags Used';
  foreach $group (@group_list) {
    printf $rsfh "%9d |", $pass_fail_count{$group}+0;
  }
  print $rsfh "\n";

  print $rsfh $drawline;
  my $return_status = 0;
  if($group_count{'ALL'} == $group_count_stat{'ALL'}->{'pass'} && $group_count{'ALL'}>0) {
    print $rsfh "REGRESSION PASSED\n";
  } else {
    print $rsfh "REGRESSION FAILED\n";
    $return_status = 1;
  }
  print $rsfh $drawline;

  if($summary){
     return $return_status;
  }

# details
#========
  foreach my $group (@group_list){
    print $rsfh $drawline;
    if($group eq 'ALL'){
      print $rsfh "\n\nDetails for ALL not in other groups\n";
    }
    else{
      print $rsfh "\n\nDetails for $group\n";
    }
    print $rsfh $drawline;
    my ($print_header);
    foreach my $type ('fail','diag','lcns','maxc','sckt','timo','lessthr','simx','perf','jobq','unkn','unfi', 'flex', 'pass') {
      next if(($type eq 'pass') && !$printpassed);
      $print_header = 0;
      foreach my $diag (sort keys %stats) {
        my @diag_name_parts = split ':',$diag;
        if(($stats{$diag} eq $type)  &&
           (((scalar(@diag_name_parts) >  $grp_pos_in_name)  && ($group eq $diag_name_parts[$grp_pos_in_name])) ||
             ((scalar(@diag_name_parts) <= $grp_pos_in_name) && ($group eq 'ALL')))
          )
        {
          if(!$print_header){
            print $rsfh "$STATUS_NAME{$type}:\n";
            print $rsfh "===================\n";
            $print_header = 1;
          }
          print $rsfh join ('',@{$stat_details{$diag}});
          print $rsfh $drawline;
        }
      }
    }
  }
  chdir ($curr_dir) || die " something went wrong with changing directories\n";
  $group_count_stat{'ALL'}->{unfi};

}

#=====================================================================
#=====================================================================
#====================================================================
sub	get_status {
    my($line)= @_;
    my($status)= 'unkn';
    foreach my $st (keys %STATUS_NAME) {
	if($line=~ /$STATUS_NAME{$st}/) {
		$status= $st;
		last;
	}
    }
    $status;
}
#======================================================================
sub	cleanup {				#As INT handler
   my($int_type) = shift;
   print "\nSomebody sent me a $int_type signal\n";
   print "All right, bro, I am out of here\n";
   exit 1;
}

#=================================================================
#=================================================================
# get frequency:
# example line:
#Info: Selected Core Clock Frequency 1167 MHz
#=================================================================
sub getfreq{
  while(<FUT>){
    if(/selected core clock frequency\s+(\d+)\s+mhz/i){
      $ctime = int (1000000 / $1);
      print "cycle time is $ctime\n" if($debug);
      last;
    }
  }
}

#===================================================================
# get the first instructions execution cycle
#===================================================================
sub getexecstart{
  while(<FUT>){
    if (/^(\d+):pc-updated ->/){
      $exec_start_cyc = ($1 / $ctime);
      last;
    }
  }
}

#===================================================================
# get the number of tiles
#===================================================================
sub getnumtiles{
  while(<FUT>){
    if (/^\d+:pc-updated -> spc\((\d+)\)/){
      if (($1 + 1) > $num_tiles){
        $num_tiles = ($1 + 1);
      }
    }
  }
}

#===================================================================
# grep the sim.log file:
#===================================================================
sub vcsgrep{

  my($non_vcs_error)= 'exit_on_error|stop_on_error|send_cmd: writen error' .
                '|compilation errors:\s+0|error encounter: 0|njecting' .
                '|total\s+mismatch:\s+0|vca_error:\s+0|fail.expected.:\s+0' .
                '|info|INFO|Info|Vera:\s+Loading' .
                '|Unimplemented write to ASI_SPARC_ERROR_EN_REG register' .
                '|Got exception\s+0x\w+\s+at MAXTL - entering\s+error_state' .
                '|Triggering watchdog reset to end error_state' .
                '|tick_reg-MISM' .
		'|error from sem_wait \d+, retried OK'.
		'|multi line buserror command specified'.
		'|DEBUG: incoming command \"BUSERROR\"' .
        '|Errors: 0';

   while(<FUT>){
     if   (/$non_vcs_error/){
       print "EXCLUDED $_" if($debug);
       next;
     }
     elsif(/$error_pattern/i){
       print "INCLUDED $_" if($debug);
       $errlines[$errline_num++] = "sim.log: ". $_;
     }
     elsif(/mismatch|getting shaky|pass|max cycles/i){
       print "INCLUDED $_" if($debug);
       $errlines[$errline_num++] = "sim.log: ".$_;
     }
     elsif(/L1_.*cache way/){
       print "INCLUDED $_" if($debug);
       $errlines[$errline_num++] = "sim.log: ".$_;
     }
     elsif(/^Time: (\d+) ps/o) {
       $sim_cyc= int ($1 / $ctime);
       $found_sim_cyc = 1;
     }elsif(/^CPU Time:\s*(\d+\.\d+)/) {
       $wall_sec= $1;
       $found_wall_sec = 1;
     }elsif(/^\((\d+)\)info-perm.*thread.([\dabcdef]+).\s+pc.0+(\w+)/i) {
       my $lastpctime = $1;
       my $lastpccycle = int ($lastpctime / $ctime);
       my $thread = hex $2;
       my $pc     = $3;
       $last_rtlcycle{$thread} = "last cycle =  $lastpccycle, last pc = $pc";
       print   "$thread $last_rtlcycle{$thread}  \n" if($debug);
       if($pc eq $main_va){
         $main_vartlcycle{$thread} = $lastpccycle;
       }
     }elsif(/:sas/o) {
       $last_sas = $_;
     }
   }
   print "finished vcsgrep errlines = $errline_num\n" if($debug);
}

#===================================================================
# grep the sas.log file
#===================================================================
sub sasgrep{
  while(<FUT>){
     if(/$error_pattern|bring up server connection|did not complete properly|pass|max/i){
        $errlines[$errline_num++] = $_;
#@6120: 0000.pc=20000000 wb_done
     }elsif(/^.(\d+):\s+([\dabcdef]+).pc=(\w+)\s+wb_done/){
       my $proc  =  hex $2 ;
       $last_sascycle{$proc} = $1;
       if($3 eq $main_va){
         $main_vasascycle{$proc} = $1;
       }
     }
   }
   print "finished sasgrep errlines = $errline_num\n" if($debug);
}

#===================================================================
# grep the tsotool.log file.
#===================================================================
sub tsotoolgrep{

  print "doing tsotool grep\n" if($debug);
  my($tsotool_err) = 0;
  while(<FUT>){
     if   (/fatal/io){ 		$tsotool_err = 1; last;}
  }
  print "finished tsotool grep\n" if($debug);

  return $tsotool_err;
}

#===================================================================
# grep diag.pl file
#===================================================================
sub diagplgrep{
  print "doing diagpl grep\n" if($debug);
  my($diagpl_err) = 0;
  @perf_errors = ();
  my $print1 = 0;

  while(<FUT>){

     if($print1){
       $print1 = 0;
       push @perf_errors, ($_);
     }

     if(/fail/i){
       $diagpl_err = 1;
       $print1 = 1;
       push @perf_errors, ($_);
     }
     elsif(/error/i){
        $diagpl_err = 1;
     }
  }
  return $diagpl_err;
}

#===================================================================
# grep midas.log
#===================================================================
sub midasgrep{
  print "doing midas grep\n" if($debug);
  while(<FUT>){
     if(/ERROR_EN_REG/){	next;}
     elsif(/error/io){		$errlines[$errline_num++] = $_;}
  }
}
#===================================================================
# grep jobq.log
#===================================================================
sub jobqloggrep{
  while(<FUT>){

     if(/vcs_run|no-warn-mismatch|valueerror: invalid literal for int/io){			next;}
     elsif(/no diag/io){				$errlines[$errline_num++] = $_;}
     elsif(/$error_pattern/io){				$errlines[$errline_num++] = $_;}
     elsif(/getting shaky|pass|max cycles/io){
							$errlines[$errline_num++] = $_;}

     elsif(/missing terminating|no diag found/io){	$errlines[$errline_num++] = $_;}

     elsif(/client: Can.t connect to in server:/io){	$errlines[$errline_num++] = $_;}

     elsif(/Can.t bring up server connection/io){	$errlines[$errline_num++] = $_;}
     elsif(/Caught a SIG/io){				$errlines[$errline_num++] = $_;}
     elsif($sas_only && /v:0x$good_trap_va/i){
       $errlines[$errline_num++] = $_;
       last;
     }
     elsif($sas_only && /v:0x$hgood_trap_va/i){
       $errlines[$errline_num++] = $_;
       last;
     }
     elsif($sas_only && /v:0x$bad_trap_va/i){
       $errlines[$errline_num++] = $_;
       last;
     }
     elsif($sas_only && /v:0x$hbad_trap_va/i){
       $errlines[$errline_num++] = $_;
       last;
     }
     elsif(/SAS hits MAX CYCLE -> FAIL/){		$errlines[$errline_num++] = $_;}
     elsif(/^Time: (\d+) ps/) {
       $sim_cyc= ($1+0)/ 1250;             #1000,000 pico /800 MHz
       $found_sim_cyc = 1;
     }elsif(/^CPU Time:\s*(\d+\.\d+)/) {
       $wall_sec= $1;
       $found_wall_sec = 1;
     }elsif(/^\((\d+)\)info-perm.*thread.(\d+).\s+pc.0+(\w+)/i) {
       my $lastpctime = $1;
       my $lastpccycle = int ($lastpctime / $ctime);
       my $thread = $2;
       my $pc     = $3;
       $last_rtlcycle{$thread} = "last cycle =  $lastpccycle, last pc = $pc";
       if($pc eq $main_va){
         $main_vartlcycle{$thread} = $lastpccycle;
       }
     }elsif(/:sas/) {
       $last_sas = $_;
     }
  }
   print "finished jobqlog errlines = $errline_num\n" if($debug);
}

#==================================================================
# In a diag dir looks for status.log and sims.log and  checks them.
#==================================================================
sub     chk_statuslog {

  my($diag)= @_;

  my(@templist)   = ();
  $found_wall_sec = 0;
  $found_sim_cyc  = 0;
  $wall_sec       = 0;
  $sim_cyc        = 0;
  $last_sas       = "not known";
  $errline_num    = 0;

  my($status)   = 'unfi';

#figure out diag directory
#=========================
  if($diag eq '.') {
    chop($diag= `pwd`);
    $diag=~ m%([^/]+)$%;
    $diag= $1;
  }elsif(! -d $diag) { die "No such diag directory: $diag\n"; }
  else{ chdir($diag); }

# extract key info from prev generated file - status.log
#=======================================================
  my($stat_file)= 'status.log';
  my($finished)= 0;
  if(-f $stat_file) {                         #status file already generated
    open(IN, "< $stat_file") || die "Cannot open $stat_file\n";
    $finished= 1;
  }elsif(-f "$stat_file.gz") {                #status file already generated
    open(IN, "$GUNZIP $stat_file.gz |")  || die "Cannot gunzip $stat_file\n";
    $finished= 1;
  }

  if($finished) {
    $status   = 'unkn';
    while(<IN>) {                             #print lines to stdout
      if(/^Diag/) {                           #extract status, and
          $status= &get_status($_);
      }
      elsif(/cyc=\s+([\.\d]+),\s+sec=\s+([\.\d]+)/i){
        $sim_cyc = $1;
        $wall_sec = $2;

      }
      push(@templist, $_);
    }
    close(IN);

# also check sims.log

    if(-r 'sims.log' || -r 'sims.log.gz') {
      if(-r    "sims.log") 	{ open (FUT, "sims.log");}
      elsif(-r "sims.log.gz")	{ open (FUT, "$GUNZIP sims.log.gz |");}
      while(<FUT>){
        if   (/Chronologic VCS simulator/o){     		last;}
        elsif(!$sas_only && /SIMICS STEP/o){ 			last;}
        elsif(/midas: fatal error|no diag/i){
          $status  = 'diag';
          my($tmp) = "Diag: " . $diag . "\t\t\t Diag Problem\n";
          $templist[0] =  $tmp;
          push(@templist, $_);
	  last;
        }
        elsif(/error.*performance\s+mismatch/i){
          $status  = 'perf';
          my($tmp) = "Diag: " . $diag . "\t\t\t Performance Problem\n";
          $templist[0] =  $tmp;
          push(@templist, $_);
	  last;
        }
        elsif(/Failed to obtain license/){
          $status = 'lcns';
          my($tmp) = "Diag: " . $diag . "\t\t\t " . $STATUS_NAME{'lcns'} . "\n";
          $templist[0] = $tmp;
          push(@templist, $_);
          last;
        }
        elsif(/no space left on device/i || /caught a sig/i ){
          $status  = 'jobq';
          my($tmp) = "Diag: " . $diag . "\t\t\t Possible Job Q Manager, disk or SIG Problem\n";
          $templist[0] =  $tmp;
          push(@templist, $_);
        }elsif   (/Will build in directory|midas: mkdir|Found diag under|redefines previous macro|-max_error|exit_on_error|stop_on_error|-no-warn-mismatch|vcs_run|ERROR_EN_REG/){ next;}
        elsif(/$error_pattern|undefined reference to/io){
           push(@templist, $_);
        }
        elsif(/regress_date/i){                   push(@templist, $_);}
        elsif(/regress_time/i){                   push(@templist, $_);}
        elsif(/group_name/i){                     push(@templist, $_);}
        elsif(/L1_/){                     	  push(@templist, $_);}
      }
      close(FUT);
    }
    push(@templist, $drawline);
  }
  else{
    push(@templist, "$diag unfinished\n");
    push(@templist, "$drawline");
  }
  $stats{$diag} = $status;
  $stat_details{$diag} = [@templist];

  chdir('..');
  return ($status, $sim_cyc, $wall_sec);
}

#=======================================================================

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Regreport

=head1 SYNOPSIS

use Regreport;

Regreport - looks for *.log files in a directory and reports status.
Performs the above in all the directories of a regression
directory.

=head1 ABSTRACT

This is a general module for Niagara regression status reporting.

=head1 DESCRIPTION

Not updated yet.

regreport processes the command line
arguments and looks for the following:
  <options> [<directory> [<list>]]

<options>:
  -1:       print report for the specified or
	    current-directory diag;
  -regress <file>: in regression mode,
  	    writes summary status for finished
            diags to <directory>/<file> until all diags
	    are finished. NOTE: if some diag doesn't produce
	    status, regreport will wait forever.

  -ver    print version number and exit.

  -sas_only - vcs will not run, sas only.

  -regenerate - will regenerate the status.log files in the diag directories.

  <directory> [<list>]:
       print report for all diags under <directory>. <list> is
       0 or more of simulation 'group' names, such as 'sparc0', 'cmp', 'cmp1,
       'cmp8', etc. When nothing specified, all groups are included.
-------------------
chk_single_diag is an exported function which takes a directory name as
an argument and expect a vcs simulation run there. It analyzes the results
and reports.
-------------------

=head2 EXPORT

chk_single_diag and others

=head1 SEE ALSO

=cut
