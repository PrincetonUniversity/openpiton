/*
 * bp_common_test_pkg.sv
 *
 * This package contains extra testing configs which are not intended to be
 *   synthesized or used in production. However, they are useful for testing.
 *   This file can also be used as a template for 3rd parties wishing to
 *   synthesize extra configs without modifying the BP source directly.
 *
 */

  `include "bp_common_defines.svh"

package bp_common_pkg;

  `include "bp_common_accelerator_pkgdef.svh"
  `include "bp_common_addr_pkgdef.svh"
  //`include "bp_common_aviary_pkgdef.svh"
  `include "bp_common_aviary_cfg_pkgdef.svh"

  // Default configuration is unicore
  localparam bp_proc_param_s bp_unicore_cfg_p = bp_default_cfg_p;

  localparam bp_proc_param_s bp_unicore_parrotpiton_override_p =
    '{cc_x_dim              : 16 // Maximum number of BlackParrot cores, increase if more are needed
      ,cc_y_dim             : 1
      ,ic_y_dim             : 0
      ,icache_features      : (1 << e_cfg_enabled) | (1 << e_cfg_coherent)
      ,icache_sets          : 128
      ,icache_assoc         : 4
      ,icache_block_width   : 256
      ,icache_fill_width    : 256
      ,dcache_features      : (1 << e_cfg_enabled) | (1 << e_cfg_coherent)
      ,dcache_sets          : 256
      ,dcache_assoc         : 2
      ,dcache_block_width   : 128
      ,dcache_fill_width    : 128
      // Actually L1.5 features
      ,l2_features          : (1 << e_cfg_lr_sc)
                              | (1 << e_cfg_amo_swap)
                              | (1 << e_cfg_amo_fetch_logic)
                              | (1 << e_cfg_amo_fetch_arithmetic)
      ,default : "inv"
      };
  `bp_aviary_derive_cfg(bp_unicore_parrotpiton_cfg_p
                        ,bp_unicore_parrotpiton_override_p
                        ,bp_unicore_cfg_p
                        );

  parameter bp_proc_param_s [max_cfgs-1:0] all_cfgs_gp =
  {
    // Various testing configs
    bp_unicore_parrotpiton_cfg_p 
    ,bp_unicore_cfg_p

    // A custom BP configuration generated from Makefile
    ,bp_custom_cfg_p
    // The default BP
    ,bp_default_cfg_p
  };

  // This enum MUST be kept up to date with the parameter array above
  typedef enum bit [lg_max_cfgs-1:0]
  {
    e_bp_unicore_parrotpiton_cfg                    = 3
    ,e_bp_unicore_cfg                               = 2

    // A custom BP configuration generated from `defines
    ,e_bp_custom_cfg                                = 1
    // The default BP
    ,e_bp_default_cfg                               = 0
  } bp_params_e;

  `include "bp_common_bedrock_pkgdef.svh"
  `include "bp_common_cache_pkgdef.svh"
  `include "bp_common_cache_engine_pkgdef.svh"
  `include "bp_common_cfg_bus_pkgdef.svh"
  `include "bp_common_clint_pkgdef.svh"
  `include "bp_common_core_pkgdef.svh"
  `include "bp_common_host_pkgdef.svh"
  `include "bp_common_rv64_pkgdef.svh"

endpackage

