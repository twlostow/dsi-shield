onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DUT /main/DUT/clk_pll_i
add wave -noupdate -group DUT /main/DUT/dsi_lp_p_o
add wave -noupdate -group DUT /main/DUT/dsi_lp_n_o
add wave -noupdate -group DUT /main/DUT/dsi_hs_p_o
add wave -noupdate -group DUT /main/DUT/dsi_hs_n_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_p_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_n_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_p_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_n_o
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_oe
add wave -noupdate -group DUT /main/DUT/dsi_lp_oe
add wave -noupdate -group DUT /main/DUT/dsi_reset_n_o
add wave -noupdate -group DUT /main/DUT/dsi_gpio_o
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
add wave -noupdate -group DUT /main/DUT/clk_serdes
add wave -noupdate -group DUT /main/DUT/rst_n
add wave -noupdate -group DUT /main/DUT/serdes_data
add wave -noupdate -group DUT /main/DUT/serdes_oe_lane
add wave -noupdate -group DUT /main/DUT/pll_locked
add wave -noupdate -group DUT /main/DUT/dsi_lp_p
add wave -noupdate -group DUT /main/DUT/dsi_lp_n
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_p
add wave -noupdate -group DUT /main/DUT/dsi_clk_lp_n
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_ACLK
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_ARESETN
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_ARVALID
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_AWVALID
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_BREADY
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_RREADY
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_WVALID
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_ARADDR
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_AWADDR
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_WDATA
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_WSTRB
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_ARREADY
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_AWREADY
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_BVALID
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_RVALID
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_WREADY
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_BRESP
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_RRESP
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axil_RDATA
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_aclk
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_aresetn
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tdata
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tdest
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tid
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tkeep
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tlast
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tready
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tstrb
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tuser
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/s_axis_tvalid
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_adr_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_dat_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_dat_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_sel_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_cyc_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_stb_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_we_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_ack_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/wb_stall_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_sys
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/rst_n_sys
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_sys_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_phy_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_dsi_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/rst_n_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pll_locked_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_next_frame_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_vsync_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_almost_full_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_wr_i
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_lp_p_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_lp_n_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_lp_oe_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_clk_lp_p_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_clk_lp_n_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_clk_lp_oe_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/serdes_data_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/serdes_oe_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_reset_n_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_gpio_o
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/host_a
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/host_d_in
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/host_d_out
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/host_wr
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/r_lane_mux
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/r_lane_invert
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/r_clock_invert
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/tick
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/phy_hs_ready_lane
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_ready_lane
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_readback_lane
add wave -noupdate -group Wrap -expand /main/DUT/U_WrappedCore/serdes_oe_lane
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_txp
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_txn
add wave -noupdate -group Wrap -expand /main/DUT/U_WrappedCore/lp_oe
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_ready
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/phy_hs_ready
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/phy_hs_request
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/phy_hs_data
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/phy_hs_valid
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/serdes_data
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/r_dsi_clk_en
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_request
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_valid
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/lp_data
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/num_lanes
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/rst_n_dsi
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_lane_ready
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/dsi_clk_lp_oe
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_req
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_islong
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_dreq
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_last
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_type
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_command
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_wcount
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_payload
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/p_dlast
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/fifo_empty
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/fifo_rd
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/fifo_dout
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_vsync_dsi
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_next_frame_dsi
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_vsync_dsi_fifo
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_vsync_dsi_axi4
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/rst_n_pixel
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/clk_pixel
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_wr_muxed
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/pix_muxed
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/fifo_almost_full
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/r_tick_div
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/tick_count
add wave -noupdate -group Wrap /main/DUT/U_WrappedCore/host_d_self
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/clk_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/rst_n_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/tick_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_request_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_valid_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_data_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_ready_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_request_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_data_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_valid_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_ready_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/idle_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/serdes_data_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/serdes_oe_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lane_sel_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lane_invert_i}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_txp_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_txn_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_oe_o}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_txp_int}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_txn_int}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_state}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_sreg}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/tx_count}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/lp_hs_entered}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/serdes_data_lastbit}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_data_muxed}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_valid_muxed}
add wave -noupdate -group Lane {/main/DUT/U_WrappedCore/genblk2[2]/U_LaneX/hs_request_muxed}
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/clk_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/rst_n_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/tick_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_request_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_valid_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_data_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_ready_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_request_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_data_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_valid_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_ready_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/idle_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/serdes_data_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/serdes_oe_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lane_sel_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lane_invert_i
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_txp_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_txn_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_oe_o
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_txp_int
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_txn_int
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_state
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_sreg
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/tx_count
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/lp_hs_entered
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/serdes_data_lastbit
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_data_muxed
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_valid_muxed
add wave -noupdate -group ClkLane /main/DUT/U_WrappedCore/U_ClockLane/hs_request_muxed
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/clk_serdes_i
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/clk_word_i
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/rst_n_a_i
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/oe_i
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/d_i
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/q_p_o
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/q_n_o
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/dout_int
add wave -noupdate -group ClkSerdes /main/DUT/U_Serdes_ClkLane/tq_int
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/clk_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/rst_n_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/fifo_empty_o
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/fifo_rd_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/fifo_pixels_o
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/pix_vsync_o
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/host_a_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/host_d_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/host_d_o
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/host_wr_i
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/test_en_o
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/r_xsize
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/r_ysize
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/r_enable
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/state
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/xcnt
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/ycnt
add wave -noupdate -group CBGen /main/DUT/U_WrappedCore/U_ColorBarGen/vsync_cnt
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/clk_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/rst_n_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/fifo_vsync_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/fifo_empty_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/fifo_rd_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/fifo_pixels_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/pix_vsync_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/pix_next_frame_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_req_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_islong_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_type_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_wcount_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_command_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_payload_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_dreq_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/p_last_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/host_a_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/host_d_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/host_d_o
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/host_wr_i
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/pix_vsync_latched
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/state
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/next_state
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/h_count
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/v_count
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/h_front_porch
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/h_back_porch
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/h_active
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/h_total
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/v_front_porch
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/v_back_porch
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/v_active
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/v_total
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/enable
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/disp_en_mask
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/pixel_counter
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/pixel_counter_d0
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/force_lp
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/push_pixels
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/push_pixels_d0
add wave -noupdate -expand -group TimGen /main/DUT/U_WrappedCore/U_TimingGen/waiting_frame
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100136989 ps} 0}
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
WaveRestoreZoom {16136989 ps} {184136989 ps}
