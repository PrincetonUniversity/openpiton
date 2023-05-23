set obj [get_filesets sources_1]
set BLACKPARROT_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/chip/tile/blackparrot/rtl/bp_common_piton_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/include/bp_fe_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/include/bp_be_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/include/bp_me_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_top/src/include/bp_top_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/rtl/bp_piton_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_async_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_passthrough.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_2_to_2.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_passthrough.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_cin.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_ripple_carry.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_buf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_buf_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_overflow_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_cycle_counter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bsg_deff_reset.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_hash_bank_reverse.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lfsr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nor2.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nor3.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nand.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_reduce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_scan.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_strobe.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_swap.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_thermometer_count.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_transpose.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_xnor.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/addRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/compareRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/divSqrtRecFN_small.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/fNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_primitives.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_consts.vi" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_rawFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/iNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/isSigNaNRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/mulAddRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/mulRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToIN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/RISCV/HardFloat_specialize.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/RISCV/HardFloat_specialize.vi" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bsg_fifo_1r1w_rolly.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bsg_bus_pack.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bp_pma.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bp_mmu.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bp_tlb.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_calculator_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_csr.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_int.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_long.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mem.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_sys.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_aux.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_ctl.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_fma.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_fp_to_reg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_nan_unbox.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_ptw.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_calculator/bp_be_reg_to_fp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_cmd_queue.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_detector.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_director.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_instr_decoder.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_issue_queue.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_regfile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_scheduler.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_checker/bp_be_scoreboard.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_dcache/bp_be_dcache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_decoder.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_wbuf.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_bht.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_btb.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_icache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_instr_scan.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_pc_gen.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/v/bp_fe_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/v/dev/bp_me_cce_to_cache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/v/dev/bp_me_bedrock_register.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/rtl/bp_pce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/v/dev/bp_me_loopback.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_top/src/v/bp_core_minimal.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_top/src/v/bp_unicore.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_defines.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_aviary_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_rv64_instr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_rv64_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_core_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_core_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_log_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_rv64_csr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_bedrock_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_bedrock_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_cache_engine_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_cache_engine_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_cfg_bus_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_cfg_bus_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_addr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_addr_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/include/bp_common_aviary_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/include/bp_be_ctl_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/include/bp_be_dcache_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/include/bp_be_dcache_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_be/src/include/bp_be_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/rtl/bp_pce_l15_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/include/bp_me_cce_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/include/bp_me_cce_inst_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/include/bp_me_cce_inst_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_me/src/include/bp_me_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_top/src/include/bp_top_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/include/bp_fe_decompress.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/include/bp_fe_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/include/bp_fe_icache_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_fe/src/include/bp_fe_icache_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counting_leading_zeros.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/hard/ultrascale_plus/bsg_misc/bsg_mul_add_unsigned.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dlatch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v" \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/common_cells/include/common_cells/registers.svh" \
]
add_files -norecurse -fileset $obj $BLACKPARROT_RTL_IMPL_FILES

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_defines.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_async_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_passthrough.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_2_to_2.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_passthrough.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

#set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v"
#
#set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
#set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

#set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_bit_synth.v"
#
#set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
#set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_cin.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_adder_ripple_carry.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_buf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_buf_ctrl.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_overflow_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_cycle_counter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/bp_common/src/v/bsg_deff_reset.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_hash_bank_reverse.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lfsr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nor2.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nand.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_nor3.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_reduce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_scan.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_strobe.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_swap.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_transpose.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_thermometer_count.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_xnor.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/addRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/compareRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/divSqrtRecFN_small.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/fNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_primitives.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_consts.vi"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/HardFloat_rawFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/iNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/isSigNaNRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/mulAddRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/mulRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToIN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/recFNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/RISCV/HardFloat_specialize.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/HardFloat/source/RISCV/HardFloat_specialize.vi"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_counting_leading_zeros.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/hard/ultrascale_plus/bsg_misc/bsg_mul_add_unsigned.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/black-parrot/external/basejump_stl/bsg_misc/bsg_dlatch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

