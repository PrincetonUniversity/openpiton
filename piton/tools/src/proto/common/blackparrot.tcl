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
lappend rtl_files    $vsources_list
lappend include_dirs $vincludes_list

set vlist            [vivado_parse_flist $BLACKPARROT_ROOT/Flist.blackparrot]
set vsources_list    [lindex $vlist 0]
set vincludes_list   [lindex $vlist 1]
lappend rtl_files    $vsources_list
lappend include_dirs $vincludes_list

set BLACKPARROT_RTL_IMPL_FILES {}
foreach v $rtl_files {
  if {[string first bsg_mem_1rw_sync_mask_write_bit.v $v] == -1} {
    set f $BASEJUMP_STL_DIR/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v
  else if {[string first bsg_mul_add_unsigned.v $v] == -1} {
    set f $BASEJUMP_STL_DIR/hard/ultrascale_plus/bsg_misc/bsg_mul_add_unsigned.v
  else {
    set f $v
  }

  set file_obj [get_files -of_objects [get_filesets sources_1] [list $f]
  set_property -name "file_type" -value "SystemVerilog" $file_obj
  lappend BLACKPARROT_RTL_IMPL_FILES $f
}

set BLACKPARROT_INCLUDE_DIRS {}
for i $include_dirs {
    lappend BLACKPARROT_INCLUDE_DIRS $i
}
lappend BLACKPARROT_INCLUDE_DIRS $ARIANE_ROOT/common/submodules/common_cells/include
lappend BLACKPARROT_INCLUDE_DIRS $ARIANE_ROOT/corev_apu/register_interface/include
set_property include_dirs $BLACKPARROT_INCLUDE_DIRS [get_filesets sources_1]

