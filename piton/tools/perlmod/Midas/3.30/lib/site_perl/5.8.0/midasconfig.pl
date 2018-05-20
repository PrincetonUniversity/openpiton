# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: midasconfig.pl
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

our %PROJ_CONFIG =
  (

   # NIAGARA-1
   OpenSPARCT1 =>
   {
    mmu_type     => 'niagara',
    ttefmt       => 'sun4v',
    tsbtagfmt    => 'tagaccess',
    default_radix => 'decimal',

    # Number of assemblers to run in parallel
    build_threads => 3,
    # Erase build directory on success if this invocation created it
    cleanup => 1,
    # Erase build directory on success (if cleanup is set), even if
    # it wasn't created by this invocation
    force_cleanup => 0,
    # Build the diag, even if it looks like we have the same input and
    # same args as last time.
    force_build => 0,

    # If set, allow a TSB to have a collision (two addresses mapping
    # to same TSB pointer
    allow_tsb_conflicts => 0,
    # If set, don't cause fatal error if section is empty
    allow_empty_sections => 0,
    # If set, do not generate a fatal error if an illegal page size is
    # specified
    allow_illegal_page_sizes => 0,
    # If set (and allow_tsb_conflicts), allow the same tag to appear
    # twice in the same tsb.
    allow_duplicate_tags => 0,
    # Allows a TSB base to not be aligned with its size.  Real
    # software will never do this, but who knows about diags
    allow_misaligned_tsb_base => 0,
    # If set, generate all TSBs that are defined, not just the ones
    # being used.
    gen_all_tsbs => 0,
    # If set to zero, do not compress any sections, regardless of the per-
    # section settings
    compress_image => 1,
    # Use backdoor environment mechanism to zero compressed sections
    env_zero => 1,
    # By default, result files in build directory are hard-linked to
    # destination directory.  If this option is set, a copy is done
    # instead.
    copy_products => 0,
    # Use full paths for commands if set.  Relative paths make output
    # more readable, though.
    full_paths => 0,


    # COMMAND OPTIONS.  Note that if no path is given, it picks up tools
    # from the path.

    # Binary to use for goldfinger.
    goldfinger_cmd => 'goldfinger',
    # Minimum allowable version of goldfinger.
    goldfinger_version => '1.07',

    cat_cmd      => 'gcat',
    diff_cmd     => 'diff',
    pal_cmd      => 'pal',
    cpp_cmd      => 'bw_cpp',
    cpp_opt      => ['-B -P'],

    m4_cmd       => 'bw_m4',
    m4_opt       => [],

    as_cmd       => 'g_as',
    as_opt       => ['-xarch=v9b'],

    ld_cmd       => 'g_ld',
    ld_opt       => ['-b elf64-sparc', '-no-warn-mismatch',
		     '--no-check-sections'],

    gcc_cmd      => $ENV{'PITON_GCC'},
    #gcc_opt      => ['-m64', '-nostdinc', '-fno-common', '-fno-builtin'],
    #gcc_opt      => ['-m64', '-fno-common', '-static'],
    gcc_opt      => ['-m64', '-fno-common'],

    perl_cmd     => 'perl',

    # PATH OPTIONS

    cpp_includes => {
		      # from diagroot
		     diagroot => ['verif/diag/assembly/include'],
		     # from directory where midas is run
		     startdir => ['.'],
		     # from build directory
		     builddir => ['.'],
		     # absolute paths
		     abs      => [],
		    },
    cpp_defines  => [ 'GOLDFINGER=1'
		    ],
    m4_includes  => {
		     diagroot => [],
		     startdir => ['.'],
		     builddir => ['.'],
		     abs      => [],
		    },


    link_paths => {
		   diagroot => ['verif/diag'],
		   startdir => ['.'],
		   builddir => [],
		   abs      => [],
		  },

    csrc_includes => {
		      diagroot => ['verif/diag/c'],
		      startdir => ['.'],
		      builddir => [],
		      abs      => [],
		     },

    c_includes => {
		   diagroot => ['verif/diag/c/include'],
		   startdir => ['.'],
		   builddir => ['.'],
		   abs      => [],
		  },

   },

   # OpenPiton
   OpenPiton =>
   {
    mmu_type     => 'niagara',
    ttefmt       => 'sun4v',
    tsbtagfmt    => 'tagaccess',
    default_radix => 'decimal',

    # Number of assemblers to run in parallel
    build_threads => 3,
    # Erase build directory on success if this invocation created it
    cleanup => 1,
    # Erase build directory on success (if cleanup is set), even if
    # it wasn't created by this invocation
    force_cleanup => 0,
    # Build the diag, even if it looks like we have the same input and
    # same args as last time.
    force_build => 0,

    # If set, allow a TSB to have a collision (two addresses mapping
    # to same TSB pointer
    allow_tsb_conflicts => 0,
    # If set, don't cause fatal error if section is empty
    allow_empty_sections => 0,
    # If set, do not generate a fatal error if an illegal page size is
    # specified
    allow_illegal_page_sizes => 0,
    # If set (and allow_tsb_conflicts), allow the same tag to appear
    # twice in the same tsb.
    allow_duplicate_tags => 0,
    # Allows a TSB base to not be aligned with its size.  Real
    # software will never do this, but who knows about diags
    allow_misaligned_tsb_base => 0,
    # If set, generate all TSBs that are defined, not just the ones
    # being used.
    gen_all_tsbs => 0,
    # If set to zero, do not compress any sections, regardless of the per-
    # section settings
    compress_image => 1,
    # Use backdoor environment mechanism to zero compressed sections
    env_zero => 1,
    # By default, result files in build directory are hard-linked to
    # destination directory.  If this option is set, a copy is done
    # instead.
    copy_products => 0,
    # Use full paths for commands if set.  Relative paths make output
    # more readable, though.
    full_paths => 0,


    # COMMAND OPTIONS.  Note that if no path is given, it picks up tools
    # from the path. 

    # Binary to use for goldfinger.
    goldfinger_cmd => 'goldfinger',
    # Minimum allowable version of goldfinger.
    goldfinger_version => '1.07',

    cat_cmd      => 'gcat',
    diff_cmd     => 'diff',
    pal_cmd      => 'pal',
    cpp_cmd      => 'bw_cpp',
    cpp_opt      => ['-B -P'],

    m4_cmd       => 'bw_m4',
    m4_opt       => [],

    as_cmd       => 'g_as',
    as_opt       => ['-xarch=v9b'],

    ld_cmd       => 'g_ld',
    ld_opt       => ['-b elf64-sparc', '-no-warn-mismatch',
             '--no-check-sections'],

    gcc_cmd      => $ENV{'PITON_GCC'},
    #gcc_opt      => ['-m64', '-nostdinc', '-fno-common', '-fno-builtin'],
    #gcc_opt      => ['-m64', '-fno-common', '-static'],
    gcc_opt      => ['-m64', '-fno-common'],

    perl_cmd     => 'perl',

    # PATH OPTIONS

    cpp_includes => {
              # from diagroot
             diagroot => ['verif/diag/assembly/include'],
             # from directory where midas is run
             startdir => ['.'],
             # from build directory
             builddir => ['.'],
             # absolute paths
             abs      => [],
            },
    cpp_defines  => [ 'GOLDFINGER=1'
            ],
    m4_includes  => {
             diagroot => [],
             startdir => ['.'],
             builddir => ['.'],
             abs      => [],
            },

    link_paths => {
           diagroot => ['verif/diag'],
           startdir => ['.'],
           builddir => [],
           abs      => [],
          },

    csrc_includes => {
              diagroot => ['verif/diag/c'],
              startdir => ['.'],
              builddir => [],
              abs      => [],
             },

    c_includes => {
           diagroot => ['verif/diag/c/include'],
           startdir => ['.'],
           builddir => ['.'],
           abs      => [],
          },

   },

  );
