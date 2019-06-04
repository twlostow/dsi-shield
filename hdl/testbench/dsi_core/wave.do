onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_ACLK
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_ARESETN
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_ARVALID
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_AWVALID
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_BREADY
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_RREADY
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_WVALID
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_ARADDR
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_AWADDR
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_WDATA
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_WSTRB
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_ARREADY
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_AWREADY
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_BVALID
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_RVALID
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_WREADY
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_BRESP
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_RRESP
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axil_RDATA
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_aclk
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_aresetn
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tdata
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tdest
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tid
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tkeep
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tlast
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tready
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tstrb
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tuser
add wave -noupdate -group Core /main/DUT/U_WrappedCore/s_axis_tvalid
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_adr_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_dat_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_dat_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_sel_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_cyc_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_stb_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_we_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_ack_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/wb_stall_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_sys
add wave -noupdate -group Core /main/DUT/U_WrappedCore/rst_n_sys
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_sys_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_phy_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_dsi_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/rst_n_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pll_locked_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_next_frame_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_almost_full_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_wr_i
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_lp_p_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_lp_n_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_lp_oe_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_clk_lp_p_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_clk_lp_n_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_clk_lp_oe_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/serdes_data_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/serdes_oe_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_reset_n_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_gpio_o
add wave -noupdate -group Core /main/DUT/U_WrappedCore/host_a
add wave -noupdate -group Core /main/DUT/U_WrappedCore/host_d_in
add wave -noupdate -group Core /main/DUT/U_WrappedCore/host_d_out
add wave -noupdate -group Core /main/DUT/U_WrappedCore/host_wr
add wave -noupdate -group Core /main/DUT/U_WrappedCore/r_lane_mux
add wave -noupdate -group Core /main/DUT/U_WrappedCore/r_lane_invert
add wave -noupdate -group Core /main/DUT/U_WrappedCore/r_clock_invert
add wave -noupdate -group Core /main/DUT/U_WrappedCore/tick
add wave -noupdate -group Core /main/DUT/U_WrappedCore/phy_hs_ready_lane
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_ready_lane
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_readback_lane
add wave -noupdate -group Core /main/DUT/U_WrappedCore/serdes_oe_lane
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_txp
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_txn
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_oe
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_ready
add wave -noupdate -group Core /main/DUT/U_WrappedCore/phy_hs_ready
add wave -noupdate -group Core /main/DUT/U_WrappedCore/phy_hs_request
add wave -noupdate -group Core /main/DUT/U_WrappedCore/phy_hs_data
add wave -noupdate -group Core /main/DUT/U_WrappedCore/phy_hs_valid
add wave -noupdate -group Core /main/DUT/U_WrappedCore/serdes_data
add wave -noupdate -group Core /main/DUT/U_WrappedCore/r_dsi_clk_en
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_request
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_valid
add wave -noupdate -group Core /main/DUT/U_WrappedCore/lp_data
add wave -noupdate -group Core /main/DUT/U_WrappedCore/num_lanes
add wave -noupdate -group Core /main/DUT/U_WrappedCore/rst_n_dsi
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_lane_ready
add wave -noupdate -group Core /main/DUT/U_WrappedCore/dsi_clk_lp_oe
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_req
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_islong
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_dreq
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_last
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_type
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_command
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_wcount
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_payload
add wave -noupdate -group Core /main/DUT/U_WrappedCore/p_dlast
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_empty
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_rd
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_dout
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_dsi
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_next_frame_dsi
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_dsi_fifo
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_dsi_axi4
add wave -noupdate -group Core /main/DUT/U_WrappedCore/cbgen_enable
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_pixels_cbgen
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_empty_cbgen
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_pixels_muxed
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_empty_muxed
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_cbgen
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_vsync_dsi_muxed
add wave -noupdate -group Core /main/DUT/U_WrappedCore/rst_n_pixel
add wave -noupdate -group Core /main/DUT/U_WrappedCore/clk_pixel
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_wr_muxed
add wave -noupdate -group Core /main/DUT/U_WrappedCore/pix_muxed
add wave -noupdate -group Core /main/DUT/U_WrappedCore/fifo_almost_full
add wave -noupdate -group Core /main/DUT/U_WrappedCore/r_tick_div
add wave -noupdate -group Core /main/DUT/U_WrappedCore/tick_count
add wave -noupdate -group Core /main/DUT/U_WrappedCore/host_d_self
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/clk_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/rst_n_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_req_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_islong_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_type_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_wcount_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_command_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_payload_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_last_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_dreq_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_dlast_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/phy_d_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/phy_dvalid_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/phy_hs_request_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/phy_hs_dreq_i
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/num_lanes_i
add wave -noupdate -group PktAsm -height 16 /main/DUT/U_WrappedCore/U_PktAsm/state
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/tx_count
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/tx_count_next
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_data
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_req
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_req_d0
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_size
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_valid
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_empty
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_flush
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_qvalid
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/crc_reset
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/crc_valid
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/crc_value
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/crc_nbytes
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_header
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/pack_header_swapped
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/ecc_value
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_idle_o
add wave -noupdate -group PktAsm /main/DUT/U_WrappedCore/U_PktAsm/p_dreq
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/clk_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/rst_n_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_size_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_req_o
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_valid_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_flush_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_o
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_valid_o
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_empty_o
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_req_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_size_i
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_in
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_out
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/count
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/avail
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/avail_next
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/shreg
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/shreg_shifted
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/in_shifted
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/shift_out
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/in_shift
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/d_req_int
add wave -noupdate -expand -group {New Group} /main/DUT/U_WrappedCore/U_PktAsm/U_Packer/q_out_reversed
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75701736 ps} 0}
configure wave -namecolwidth 389
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {75573934 ps} {75902060 ps}
