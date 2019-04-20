onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_ACLK
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_ARESETN
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_ARVALID
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_AWVALID
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_BREADY
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_RREADY
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_WLAST
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_WVALID
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_ARADDR
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_AWADDR
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_WDATA
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_WSTRB
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_ARREADY
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_AWREADY
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_BVALID
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_RLAST
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_RVALID
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_WREADY
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_BRESP
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_RRESP
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/s_axil_RDATA
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/clk_csr_i
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/csr_adr_o
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/csr_dat_o
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/csr_wr_o
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/csr_dat_i
add wave -noupdate -group CSR -height 16 /main/DUT/genblk1/U_CsrBridge/state
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/req_wb
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/req_write
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/req_csr
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/wb_stb_d0
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/wb_stall
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/ack_csr
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/ack_wb
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/req_csr_d0
add wave -noupdate -group CSR /main/DUT/genblk1/U_CsrBridge/ack_wb_d0
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/clk_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/rst_n_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/fifo_vsync_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/fifo_empty_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/fifo_rd_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/fifo_pixels_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/pix_vsync_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/pix_next_frame_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_req_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_islong_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_type_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_wcount_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_command_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_payload_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_dreq_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/p_last_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/host_a_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/host_d_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/host_d_o
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/host_wr_i
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/state
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/next_state
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/h_count
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/v_count
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/h_front_porch
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/h_back_porch
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/h_active
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/h_total
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/v_front_porch
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/v_back_porch
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/v_active
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/v_total
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/enable
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/disp_en_mask
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/pixel_counter
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/pixel_counter_d0
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/force_lp
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/push_pixels
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/push_pixels_d0
add wave -noupdate -group TimGen /main/DUT/U_TimingGen/waiting_frame
add wave -noupdate -group DUT /main/DUT/s_axil_ACLK
add wave -noupdate -group DUT /main/DUT/s_axil_ARESETN
add wave -noupdate -group DUT /main/DUT/s_axil_ARVALID
add wave -noupdate -group DUT /main/DUT/s_axil_AWVALID
add wave -noupdate -group DUT /main/DUT/s_axil_BREADY
add wave -noupdate -group DUT /main/DUT/s_axil_RREADY
add wave -noupdate -group DUT /main/DUT/s_axil_WVALID
add wave -noupdate -group DUT /main/DUT/s_axil_ARADDR
add wave -noupdate -group DUT /main/DUT/s_axil_AWADDR
add wave -noupdate -group DUT /main/DUT/s_axil_WDATA
add wave -noupdate -group DUT /main/DUT/s_axil_WSTRB
add wave -noupdate -group DUT /main/DUT/s_axil_ARREADY
add wave -noupdate -group DUT /main/DUT/s_axil_AWREADY
add wave -noupdate -group DUT /main/DUT/s_axil_BVALID
add wave -noupdate -group DUT /main/DUT/s_axil_RVALID
add wave -noupdate -group DUT /main/DUT/s_axil_WREADY
add wave -noupdate -group DUT /main/DUT/s_axil_BRESP
add wave -noupdate -group DUT /main/DUT/s_axil_RRESP
add wave -noupdate -group DUT /main/DUT/s_axil_RDATA
add wave -noupdate -group DUT /main/DUT/s_axis_aclk
add wave -noupdate -group DUT /main/DUT/s_axis_aresetn
add wave -noupdate -group DUT /main/DUT/s_axis_tdata
add wave -noupdate -group DUT /main/DUT/s_axis_tdest
add wave -noupdate -group DUT /main/DUT/s_axis_tid
add wave -noupdate -group DUT /main/DUT/s_axis_tkeep
add wave -noupdate -group DUT /main/DUT/s_axis_tlast
add wave -noupdate -group DUT /main/DUT/s_axis_tready
add wave -noupdate -group DUT /main/DUT/s_axis_tstrb
add wave -noupdate -group DUT /main/DUT/s_axis_tuser
add wave -noupdate -group DUT /main/DUT/s_axis_tvalid
add wave -noupdate -group DUT /main/DUT/wb_adr_i
add wave -noupdate -group DUT /main/DUT/wb_dat_i
add wave -noupdate -group DUT /main/DUT/wb_dat_o
add wave -noupdate -group DUT /main/DUT/wb_sel_i
add wave -noupdate -group DUT /main/DUT/wb_cyc_i
add wave -noupdate -group DUT /main/DUT/wb_stb_i
add wave -noupdate -group DUT /main/DUT/wb_we_i
add wave -noupdate -group DUT /main/DUT/wb_ack_o
add wave -noupdate -group DUT /main/DUT/wb_stall_o
add wave -noupdate -group DUT /main/DUT/clk_sys
add wave -noupdate -group DUT /main/DUT/rst_n_sys
add wave -noupdate -group DUT /main/DUT/clk_sys_i
add wave -noupdate -group DUT /main/DUT/clk_phy_i
add wave -noupdate -group DUT /main/DUT/clk_dsi_i
add wave -noupdate -group DUT /main/DUT/rst_n_i
add wave -noupdate -group DUT /main/DUT/clk_phy_shifted_i
add wave -noupdate -group DUT /main/DUT/clk_dsi_shifted_i
add wave -noupdate -group DUT /main/DUT/pll_locked_i
add wave -noupdate -group DUT /main/DUT/pix_next_frame_o
add wave -noupdate -group DUT /main/DUT/pix_vsync_i
add wave -noupdate -group DUT /main/DUT/pix_almost_full_o
add wave -noupdate -group DUT /main/DUT/pix_i
add wave -noupdate -group DUT /main/DUT/pix_wr_i
add wave -noupdate -group DUT /main/DUT/dsi_clk_p_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_n_o
add wave -noupdate -group DUT /main/DUT/dsi_hs_p_o
add wave -noupdate -group DUT /main/DUT/dsi_hs_n_o
add wave -noupdate -group DUT /main/DUT/dsi_lp_p_o
add wave -noupdate -group DUT /main/DUT/dsi_lp_n_o
add wave -noupdate -group DUT /main/DUT/dsi_lp_oe_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_p_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_n_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_oe_o
add wave -noupdate -group DUT /main/DUT/dsi_reset_n_o
add wave -noupdate -group DUT /main/DUT/dsi_gpio_o
add wave -noupdate -group DUT /main/DUT/host_a
add wave -noupdate -group DUT /main/DUT/host_d_in
add wave -noupdate -group DUT /main/DUT/host_d_out
add wave -noupdate -group DUT /main/DUT/host_wr
add wave -noupdate -group DUT /main/DUT/r_lane_mux
add wave -noupdate -group DUT /main/DUT/r_lane_invert
add wave -noupdate -group DUT /main/DUT/r_clock_invert
add wave -noupdate -group DUT /main/DUT/tick
add wave -noupdate -group DUT /main/DUT/phy_hs_ready_lane
add wave -noupdate -group DUT /main/DUT/lp_ready_lane
add wave -noupdate -group DUT /main/DUT/lp_readback_lane
add wave -noupdate -group DUT /main/DUT/serdes_oe_lane
add wave -noupdate -group DUT /main/DUT/lp_txp
add wave -noupdate -group DUT /main/DUT/lp_txn
add wave -noupdate -group DUT /main/DUT/lp_oe
add wave -noupdate -group DUT /main/DUT/lp_ready
add wave -noupdate -group DUT /main/DUT/phy_hs_ready
add wave -noupdate -group DUT /main/DUT/phy_hs_request
add wave -noupdate -group DUT /main/DUT/phy_hs_data
add wave -noupdate -group DUT /main/DUT/phy_hs_valid
add wave -noupdate -group DUT /main/DUT/serdes_data
add wave -noupdate -group DUT /main/DUT/r_dsi_clk_en
add wave -noupdate -group DUT /main/DUT/lp_request
add wave -noupdate -group DUT /main/DUT/lp_valid
add wave -noupdate -group DUT /main/DUT/lp_data
add wave -noupdate -group DUT /main/DUT/num_lanes
add wave -noupdate -group DUT /main/DUT/rst_n_dsi
add wave -noupdate -group DUT /main/DUT/clk_lane_ready
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_oe
add wave -noupdate -group DUT /main/DUT/p_req
add wave -noupdate -group DUT /main/DUT/p_islong
add wave -noupdate -group DUT /main/DUT/p_dreq
add wave -noupdate -group DUT /main/DUT/p_last
add wave -noupdate -group DUT /main/DUT/p_type
add wave -noupdate -group DUT /main/DUT/p_command
add wave -noupdate -group DUT /main/DUT/p_wcount
add wave -noupdate -group DUT /main/DUT/p_payload
add wave -noupdate -group DUT /main/DUT/p_dlast
add wave -noupdate -group DUT /main/DUT/fifo_empty
add wave -noupdate -group DUT /main/DUT/fifo_rd
add wave -noupdate -group DUT /main/DUT/fifo_dout
add wave -noupdate -group DUT /main/DUT/pix_vsync_dsi
add wave -noupdate -group DUT /main/DUT/pix_next_frame_dsi
add wave -noupdate -group DUT /main/DUT/pix_vsync_dsi_fifo
add wave -noupdate -group DUT /main/DUT/pix_vsync_dsi_axi4
add wave -noupdate -group DUT /main/DUT/rst_n_pixel
add wave -noupdate -group DUT /main/DUT/clk_pixel
add wave -noupdate -group DUT /main/DUT/pix_wr_muxed
add wave -noupdate -group DUT /main/DUT/pix_muxed
add wave -noupdate -group DUT /main/DUT/fifo_almost_full
add wave -noupdate -group DUT /main/DUT/r_tick_div
add wave -noupdate -group DUT /main/DUT/tick_count
add wave -noupdate -group DUT /main/DUT/host_d_self
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/clk_in_i
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/clk_out_i
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/rst_n_i
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/d_p_i
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/q_p_o
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/ready_o
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/ready
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/d_p_d0
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/out_d
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/in_ext
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/out_ext
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/out_feedback
add wave -noupdate -expand -group Sync /main/DUT/genblk5/SyncVSync/d_ready_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2415000 ps} 0}
configure wave -namecolwidth 218
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21 us}
