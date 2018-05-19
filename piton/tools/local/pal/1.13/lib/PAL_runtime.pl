# Modified by Princeton University on June 9th, 2015

# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: PAL_runtime.pl
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
$_LIB_PATH= "$BASE/lib";

sub	proc_SEL_version {
$version= '1.13';
}

#---------------- proc_SEL() is called by testgen to evaluate $list
#---------------------- at testgen runtime. The advantage is that
#---------------------- the list can contain $perl variables. On
#---------------------- the other hand, it is slower because list
#---------------------- needs be parsed every time.

#----------------- SELECTION LIST FORMAT ===> [$cmd[ list ]]
#-------------------* DONE :
#---------------------* $cmd= 'r' or nil: random selection list
#---------------------* $cmd= 's': random STRING selection list
#---------------------* $cmd= 'e', enumeration list
#---------------------* $cmd= 'l', return number of list elements
#---------------------* $cmd= 'D:{id}', define a random element index to be
#---------------------* 		used by 'U{id}'.
#---------------------* $cmd= 'U:{id}', instead of random choice, use the
#---------------------* 		element index used by SELECTION LIST
#---------------------* 		named 'D{id}'.
#---------------------* $cmd= '[dox]{n}': to print output in C's "%{n}[dox]"
#---------------------* 		format to be used with 'r' or 'e'.
#-------------------* TO DO :
#---------------------* $cmd= a number (n), select that n elements
#-----------------------      and apply enumeration or selection
#-----------------------      of permutation out of n elements.
#------------------------   $cmd= '1', same as nil
#------------------------   $cmd= '1e', same as nil
#---------------------* $cmd= 'a', all pertumation

sub	proc_SEL {
my($idx, $list, $cmd, $lineinfo)= @_;		#$indx for the list, and list itself
my($strList)= 0;

$list=~ s/\[\s*(.*)\s*\]$/$1/;			#for [ {list} ]: pass {list}
# $cmd=~ tr/[A-Z]/[a-z]/;			#translate cmd to the lower-case.

$LINE_INFO_FOR_ERR= $lineinfo;
if(   $cmd eq '') {	$cmd= 'r'; }
elsif($cmd =~ /s/) {	$strList= 1; }
# elsif($cmd =~ /s/) {	$cmd= 'r';	$strList= 1; }

my($result);
if( $list =~ /^\s*[\+\d-]/ && !$strList ) {
	$result= &num_list($idx, $list, $cmd);
}else{	$result= &str_list($idx, $list, $cmd); }

$result;
}

sub	str_list {		## take "{str} [:{weit}], {str} [:{weit}] ..."
my($idx, $list, $cmd)= @_;
my(@value, $i, $list_save);
my($elm_idx);
my($USE_WEIGHT)= 0;
local(@weight);


$list_save= $list;
$list=~ s/^\s*//;
while(1) {
   if($list =~ s/^([\&\$\w][\w_]*)//) {	#a unquoted identifier
	push(@value, $1);

# }elsif($list =~ s/^(\s*)(["'])([^\2]*)(\2)(\s*)//) {	#a '/" quoted string
# why can't I say [^\2]*, which means anything but not \2 ??

#   }elsif($list =~ s/^\s*(["'])([\$\w\s,.-]*)(\1)\s*//) { #a '/" quoted str
#	@value= (@value, $1 . $2 . $3);			#including enclosing "/'
#	# $list=~ s/$1$2$3$4$5//;

   }elsif($list =~ s/^'([^']*)'//) {		#a ' quoted str
	push(@value, "$1");				#including enclosing '

   }elsif($list =~ s/^"([^"]*)"//) {		#a " quoted str
	push(@value, "$1");				#including enclosing "

   }else{	& rt_error("illegal string list: [$list_save]"); }

##### process weight:
   $list =~ s/^\s*//;
   if($list =~ s/^:\s*([^,\s]+)\s*//) {
	push(@weight, eval $1);
	$USE_WEIGHT= 1;
   }else{
	push(@weight, 100);			#default weight 100
	}

   if($list eq '') {		last;
   }elsif($list !~ s/^,\s*//) {
	$list=~ /^(.)/;
	& rt_error(", expected but got `$1' in string list: [$list_save]");
	}
   } #end of while(1)

#-------------------------------$str_list_${idx} will be a $global variable
my($mark)= ($cmd =~ s/D:?(\w+)//) ? $1 : '';

if(    $cmd eq 'l')   {		return($#value + 1);
}elsif($cmd =~ s/U:?(\w+)//) {	$elm_idx= $DEF_ORDER{$1} % ($#value + 1);
}elsif($cmd =~ s/e//) {
	$USE_WEIGHT= 0;
	$elm_idx= eval("++ \$str_list_$idx") -1 ;
	if($elm_idx > $#value) { $elm_idx= 0;
				 eval("\$str_list_$idx= 1"); }
}else{
######### only this category allows weight !!
	$elm_idx= $USE_WEIGHT ?  & weighed_select( *weight ) 
			      :  int(rand( $#value+1 ));

# }elsif($cmd =~ s/r//) {		$elm_idx= int(rand($#value+1));
# }else {	& rt_error("No such string list command: $cmd");
	}


$DEF_ORDER{$mark}= $elm_idx	if($mark);

if($value[$elm_idx] =~ /^\&/) {
	eval '$result=' . $value[$elm_idx];
} else {
	$result= $value[$elm_idx];
	}

if($cmd=~/s(\d*)|(\d+)s/) {
	$result= sprintf("%$1s", $result);
	}
$result;
}

sub	weighed_select {	#Given weight array, return random idx selected
local(*W)= @_;
my($i, $sel);
for($i=1; $i<=$#W; ++$i) { $W[$i] += $W[$i-1]; }	#accumulate weight
$sel= int(rand( $W[$#W] ));
for($i=0; $i<=$#W; ++$i) {
	if($W[$i] > $sel) {
		$sel= $i;
		last;
		}
	}
$sel;
}

sub	num_list {			#take [-num .. +num2]
my($idx, $list, $cmd)= @_;
my(@range, @value, $list_save);
my($num_items)= 0;
my($lb, $ub, $i);
my($has_hex)=0;

$list_save= $list;
$list=~ s/\s//g;
while(1) {				#parse number list
    if($list =~ s/^(\+|-)?([0-9a-fx]+)(-|\.\.)(\+|-)?([0-9a-fx]+)//) {		#is a range
	$n1= "$1$2";	$n2= "$4$5";
	if($n1=~ s/^(\+|-)?0x//) { $n1= $1 . hex($n1); $has_hex= 1;}
	if($n2=~ s/^(\+|-)?0x//) { $n2= $1 . hex($n2); $has_hex= 1;}
	
	if($n1 > $n2) {
		## &rt_error("from ($n1) is greater than to ($n2)");
		$tmp= $n1;
		$n1= $n2;
		$n2= $tmp;
		}
	$num_items += $n2- $n1+ 1;
	@range= (@range, $n1, $n2);			# $list= 'x-y...'
    }elsif($list =~ s/^(\+|-)?([0-9a-fx]+)//) {
	$n1= "$1$2";
	if($n1=~ s/^(\+|-)?0x//) { $n1= $1 . hex($n1); $has_hex= 1;}
	++ $num_items;
	@value= (@value, $n1);				# $list= 'x.....'
    }else{	& rt_error("illegal number list: [$list_save]"); }

    $list =~ s/^\s*//;
    if($list eq '') {			last;
    }elsif($list !~ s/^,\s*//) {
	$list=~ /^(.)/;
	& rt_error(", expected but got `$1' in number list: [$list_save]");
	}
    } #end of while(1)

########### select from [$list]
my($elm_idx, $result);

#-------------------------------$str_list_${idx} will be a $gloabl variable
my($mark)= ($cmd =~ s/D:?(\w+)//) ? $1 : '';

if(    $cmd eq 'l') {		return($num_items);
}elsif($cmd =~ s/U:?(\w+)//) {	$elm_idx= $DEF_ORDER{$1} % $num_items;
}elsif($cmd =~ /e/) {
	$elm_idx= eval("++ \$str_list_$idx") -1 ;
	if($elm_idx > $num_items-1) { $elm_idx= 0;
				      eval("\$str_list_$idx= 1"); }
# }elsif($cmd =~ /r/) {	$elm_idx= int(rand($num_items));
}else{			$elm_idx= int(rand($num_items));
# }else {	& rt_error("No such number list command: $cmd");
	}
$DEF_ORDER{$mark}= $elm_idx	if($mark);

if($elm_idx <= $#value) {	$result= $value[$elm_idx];
}else{	$lb= $#value;
	for($i= 0; $i <= $#range; $i+=2) {
	   $ub= $lb+ ($range[$i+1] - $range[$i] + 1);
	   if($elm_idx <= $ub) {
		$result= $range[$i]+ $elm_idx- ($lb+ 1);
		last;
		}
	   $lb= $ub;
	   }
	}

$format= ($cmd=~/(\d+)([doxs])/) ? "%$1$2" :		#new
	 ($cmd=~/([doxs])(\d*)/) ? "%$2$1" :
	 $has_hex ?	          "%x"    :
			          "%d"    ;
$result= sprintf($format, $result);

$result;
}

sub   rt_error { print STDERR "\nERR ($LINE_INFO_FOR_ERR): @_\n";     exit(1); }

1;
