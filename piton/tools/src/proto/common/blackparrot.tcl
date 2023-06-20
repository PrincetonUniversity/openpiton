proc vivado_parse_flist {flist_path} {
    set f [exec echo [split [string trim [read [open $flist_path r]]] "\n"] | envsubst]
    set flist [list ]
    set dir_list [list ]
    set def_list [list ]
    foreach x $f {
        if {![string match "" $x]} {
            # If the item starts with +incdir+, directory files need to be added
            if {[string match "#*" $x]} {
                # get rid of comment line
            } elseif {[string match "+incdir+*" $x]} {
                set trimchars "+incdir+"
                set temp [string trimleft $x $trimchars]
                set expanded [subst $temp]
                lappend dir_list $expanded
            } elseif {[string match "+define+*" $x]} {
                set trimchars "+define+"
                set temp [string trimleft $x $trimchars]
                set expanded [subst $temp]
                lappend def_list $expanded
            } else {
                set expanded [subst $x]
                lappend flist $expanded
            }
        }
    }

    return [list $flist $dir_list $def_list]
}

set ARIANE_ROOT                $::env(ARIANE_ROOT)

set BLACKPARROT_ROOT           $::env(BLACKPARROT_ROOT)
set BLACKPARROT_RTL_DIR        $::env(BLACKPARROT_RTL_DIR)
set BLACKPARROT_SUBSYSTEMS_DIR $::env(BLACKPARROT_SUBSYSTEMS_DIR)
set BP_COMMON_DIR              $::env(BP_COMMON_DIR)
set BP_TOP_DIR                 $::env(BP_TOP_DIR)
set BP_FE_DIR                  $::env(BP_FE_DIR)
set BP_BE_DIR                  $::env(BP_BE_DIR)
set BP_ME_DIR                  $::env(BP_ME_DIR)
set BP_EXTERNAL_DIR            $::env(BP_EXTERNAL_DIR)
set BASEJUMP_STL_DIR           $::env(BASEJUMP_STL_DIR)
set HARDFLOAT_DIR              $::env(HARDFLOAT_DIR)

set rtl_files {}
set include_dirs {}

set vlist            [vivado_parse_flist $BP_TOP_DIR/syn/flist.vcs]
set vsources_list    [lindex $vlist 0]
set vincludes_list   [lindex $vlist 1]
set rtl_files        [concat $rtl_files $vsources_list]
set include_dirs     [concat $include_dirs $vincludes_list]

set vlist            [vivado_parse_flist $BLACKPARROT_ROOT/Flist.blackparrot]
set vsources_list    [lindex $vlist 0]
set vincludes_list   [lindex $vlist 1]
set rtl_files        [concat $rtl_files $vsources_list]
set include_dirs     [concat $include_dirs $vincludes_list]

set file_obj [get_filesets sources_1]
foreach v $rtl_files {
  if {[string first bsg_mem_1rw_sync_mask_write_bit.v $v] != -1} {
    set f $BASEJUMP_STL_DIR/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v
  } elseif {[string first bsg_mul_add_unsigned.v $v] != -1} {
    set f $BASEJUMP_STL_DIR/hard/ultrascale_plus/bsg_misc/bsg_mul_add_unsigned.v
  } elseif {[string first bp_common_pkg.sv $v] != -1} {
    continue
  } else {
    set f $v
  }

  lappend BLACKPARROT_RTL_IMPL_FILES $f
}
add_files -quiet -norecurse -fileset $file_obj $BLACKPARROT_RTL_IMPL_FILES
set_property -name "file_type" -value "SystemVerilog" -objects [get_files $BLACKPARROT_RTL_IMPL_FILES]

foreach i $include_dirs {
    lappend BLACKPARROT_INCLUDE_DIRS $i
}
lappend BLACKPARROT_INCLUDE_DIRS $ARIANE_ROOT/src/common_cells/include
lappend BLACKPARROT_INCLUDE_DIRS $ARIANE_ROOT/corev_apu/register_interface/include

##set_property "include_dirs" "$BLACKPARROT_INCLUDE_DIRS" $file_obj

puts "*************** RTL FILES ****************"
puts $BLACKPARROT_RTL_IMPL_FILES
puts "******************************************"
puts "*************** INCLUDE DIRS *************"
puts $BLACKPARROT_INCLUDE_DIRS
puts "******************************************"

