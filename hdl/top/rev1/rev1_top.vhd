-- 
-- DSI Shield
-- Copyright (C) 2013-2014 twl <twlostow@printf.cc>
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-- 

--
-- rev1_top.vhd - top level for rev 1.1. PCB FPGA
--
--
library ieee;
use ieee.std_logic_1164.all;

use work.gencores_pkg.all;
use work.wishbone_pkg.all;

library unisim;
use unisim.vcomponents.all;


-- Table 1: PLL Settings for the supported displays.
-- Display Type           Refresh  Mul  Sys_Div  Phy_Div    PHY_Freq    Clock period
-- Droid DNA               48 Hz   26      7        1        650 MHz      1538 ps
-- Optimus P880            60 Hz   30      8        2        375 MHz      2666 ps
-- Iphone 4                60 Hz   31      8        2        387.5 MHz    2580 ps

entity rev1_top is
  generic (
    g_lm32_firmware : string  := "boot.ram";
    g_with_hdmi     : boolean := true;
    -- DDR clock-to-data delay
    g_data_delay    : integer := 0;
    -- DDR data-to-DQs delay
    g_dqs_delay     : integer := 75 - 45;

    -- PLL configuration:
    -- Fsys = 25 MHz * g_pll_mul / g_pll_sys_div
    -- Fphy = 25 MHz * g_pll_mul / g_pll_phy_div

    -- PLL multiplier
    g_pll_mul         : integer := 31;
    -- System clock PLL divider
    g_pll_sys_div     : integer := 8;
    -- DSI PHY clock PLL divider
    g_pll_phy_div     : integer := 2;
    -- DSI PHY clock period, in picoseconds
    g_clock_period_ps : integer := 1538
    );
  port (
    clk_25m_i : in std_logic;

    rst_n_a_i  : in  std_logic;
    uart_txd_o : out std_logic;
    uart_rxd_i : in  std_logic;

-------------------------------------------------------------------------------
-- HDMI
-------------------------------------------------------------------------------

    hdmi_rx_p_i : in std_logic_vector(3 downto 0);
    hdmi_rx_n_i : in std_logic_vector(3 downto 0);

    hdmi_scl_b       : inout std_logic;
    hdmi_sda_b       : inout std_logic;
    hdmi_hpd_o       : out   std_logic;
    hdmi_p5v_notif_i : in    std_logic;

-------------------------------------------------------------------------------
-- SDRAM
-------------------------------------------------------------------------------

    sdram_clk_p : out std_logic;
    sdram_clk_n : out std_logic;
    sdram_cke   : out std_logic;
    sdram_cs_n  : out std_logic;
    sdram_we_n  : out std_logic;
    sdram_cas_n : out std_logic;
    sdram_ras_n : out std_logic;
    sdram_adr   : out std_logic_vector(12 downto 0);
    sdram_ba    : out std_logic_vector(1 downto 0);

    sdram_dm : out std_logic_vector(1 downto 0);

    sdram_dq  : inout std_logic_vector(15 downto 0);
    sdram_dqs : inout std_logic_vector(1 downto 0);

-------------------------------------------------------------------------------
-- DSI ports
-------------------------------------------------------------------------------

    dsi_clk_p_o : out std_logic;
    dsi_clk_n_o : out std_logic;

    dsi_clk_lp_p_o : out std_logic;
    dsi_clk_lp_n_o : out std_logic;

    dsi_hs_p_o : out std_logic_vector(3 downto 0);
    dsi_hs_n_o : out std_logic_vector(3 downto 0);

    dsi_lp_p_o : out std_logic_vector(3 downto 0);
    dsi_lp_n_o : out std_logic_vector(3 downto 0);

    dsi_resetb_o : out std_logic;
    dsi_gpio0_o  : out std_logic;
    dsi_gpio1_o  : out std_logic;

    lcd_pwren_o : out std_logic
    );

end rev1_top;

architecture rtl of rev1_top is

  component dsi_core is
    generic(
      g_pixels_per_clock : integer := 2;
      g_lanes            : integer := 4;
      g_fifo_size        : integer := 4096;
      g_invert_lanes     : integer := 0;
      g_invert_clock     : integer := 0;
      g_clock_period_ps  : integer := 2000
      );
    port(
      clk_sys_i : in std_logic;
      clk_dsi_i : in std_logic;
      clk_phy_i : in std_logic;

      rst_n_i : in std_logic;

      pll_locked_i : in std_logic;


      pix_almost_full_o : out std_logic;
      pix_i             : in  std_logic_vector (24 * g_pixels_per_clock-1 downto 0) := (others => '0');
      pix_wr_i          : in  std_logic;
      pix_vsync_i       : in  std_logic;
      pix_next_frame_o  : out std_logic;

      dsi_clk_p_o     : out std_logic;
      dsi_clk_n_o     : out std_logic;
      dsi_clk_lp_p_o  : out std_logic;
      dsi_clk_lp_n_o  : out std_logic;
      dsi_clk_lp_oe_o : out std_logic;

      dsi_hs_p_o : out std_logic_vector(g_lanes-1 downto 0);
      dsi_hs_n_o : out std_logic_vector(g_lanes-1 downto 0);

      dsi_lp_p_o : out std_logic_vector(g_lanes-1 downto 0);
      dsi_lp_n_o : out std_logic_vector(g_lanes-1 downto 0);


      dsi_lp_oe_o : out std_logic_vector(g_lanes-1 downto 0);

      dsi_reset_n_o : out std_logic;
      dsi_gpio_o    : out std_logic_vector(2 downto 0);

      wb_adr_i   : in  std_logic_vector(31 downto 0);
      wb_cyc_i   : in  std_logic;
      wb_we_i    : in  std_logic;
      wb_stb_i   : in  std_logic;
      wb_sel_i   : in  std_logic_vector(3 downto 0);
      wb_dat_i   : in  std_logic_vector(31 downto 0);
      wb_dat_o   : out std_logic_vector(31 downto 0);
      wb_stall_o : out std_logic;
      wb_ack_o   : out std_logic

      );
  end component;

  component fml_wb_bridge
    generic (
      sdram_depth : integer := 26);
    port (
      clk_sys_i : in std_logic;
      rst_n_i   : in std_logic;

      fml_adr : out std_logic_vector(sdram_depth-1 downto 0);
      fml_stb : out std_logic;
      fml_we  : out std_logic;
      fml_ack : in  std_logic;
      fml_sel : out std_logic_vector(3 downto 0);
      fml_di  : in  std_logic_vector(31 downto 0);
      fml_do  : out std_logic_vector(31 downto 0);

      wb_adr_i   : in  std_logic_vector(31 downto 0);
      wb_cyc_i   : in  std_logic;
      wb_we_i    : in  std_logic;
      wb_stb_i   : in  std_logic;
      wb_sel_i   : in  std_logic_vector(3 downto 0);
      wb_dat_i   : in  std_logic_vector(31 downto 0);
      wb_dat_o   : out std_logic_vector(31 downto 0);
      wb_stall_o : out std_logic;
      wb_ack_o   : out std_logic

      );

  end component;

  component fmlarb
    generic(
      fml_depth : integer := 26;
      fml_width : integer := 32);
    port (
      sys_clk : in std_logic;
      sys_rst : in std_logic;

      -- Interface 0 has higher priority than the others 
      m0_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m0_stb : in  std_logic                                := '0';
      m0_we  : in  std_logic                                := '0';
      m0_ack : out std_logic;
      m0_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m0_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m0_do  : out std_logic_vector(fml_width-1 downto 0);

      m1_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m1_stb : in  std_logic                                := '0';
      m1_we  : in  std_logic                                := '0';
      m1_ack : out std_logic;
      m1_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m1_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m1_do  : out std_logic_vector(fml_width-1 downto 0);

      m2_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m2_stb : in  std_logic                                := '0';
      m2_we  : in  std_logic                                := '0';
      m2_ack : out std_logic;
      m2_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m2_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m2_do  : out std_logic_vector(fml_width-1 downto 0);

      m3_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m3_stb : in  std_logic                                := '0';
      m3_we  : in  std_logic                                := '0';
      m3_ack : out std_logic;
      m3_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m3_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m3_do  : out std_logic_vector(fml_width-1 downto 0);

      m4_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m4_stb : in  std_logic                                := '0';
      m4_we  : in  std_logic                                := '0';
      m4_ack : out std_logic;
      m4_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m4_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m4_do  : out std_logic_vector(fml_width-1 downto 0);

      m5_adr : in  std_logic_vector(fml_depth-1 downto 0)   := (others => '0');
      m5_stb : in  std_logic                                := '0';
      m5_we  : in  std_logic                                := '0';
      m5_ack : out std_logic;
      m5_sel : in  std_logic_vector(fml_width/8-1 downto 0) := (others => '0');
      m5_di  : in  std_logic_vector(fml_width-1 downto 0)   := (others => '0');
      m5_do  : out std_logic_vector(fml_width-1 downto 0);


      s_adr  : out std_logic_vector(fml_depth-1 downto 0);
      s_stb  : out std_logic;
      s_we   : out std_logic;
      s_eack : in  std_logic;
      s_sel  : out std_logic_vector(fml_width/8-1 downto 0);
      s_di   : in  std_logic_vector(fml_width-1 downto 0);
      s_do   : out std_logic_vector(fml_width-1 downto 0)

      );
  end component;

  component hpdmc
    generic (
      csr_addr          : integer := 0;
      sdram_depth       : integer := 25;
      sdram_columndepth : integer := 9;
      data_delay        : integer := 20;
      dqs_delay         : integer := 20
      );
    port (
      sys_clk   : in std_logic;
      sys_clk_n : in std_logic;
      sys_rst   : in std_logic;

      csr_a  : in  std_logic_vector(13 downto 0);
      csr_we : in  std_logic;
      csr_di : in  std_logic_vector(31 downto 0);
      csr_do : out std_logic_vector(31 downto 0);

      fml_adr  : in  std_logic_vector(sdram_depth-1 downto 0);
      fml_stb  : in  std_logic;
      fml_we   : in  std_logic;
      fml_eack : out std_logic;
      fml_ack  : out std_logic;
      fml_sel  : in  std_logic_vector(3 downto 0);
      fml_di   : in  std_logic_vector(31 downto 0);
      fml_do   : out std_logic_vector(31 downto 0);

      sdram_clk_p : out std_logic;
      sdram_clk_n : out std_logic;
      sdram_cke   : out std_logic;
      sdram_cs_n  : out std_logic;
      sdram_we_n  : out std_logic;
      sdram_cas_n : out std_logic;
      sdram_ras_n : out std_logic;
      sdram_adr   : out std_logic_vector(12 downto 0);
      sdram_ba    : out std_logic_vector(1 downto 0);

      sdram_dm  : out   std_logic_vector(1 downto 0);
      sdram_dq  : inout std_logic_vector(15 downto 0);
      sdram_dqs : inout std_logic_vector(1 downto 0)
      );
  end component;

  component dsi_pll_spartan6
    generic (
      g_mul     : integer;
      g_sys_div : integer;
      g_phy_div : integer);
    port (
      clk_in_i    : in  std_logic;
      clk_sys_o   : out std_logic;
      clk_sys_n_o : out std_logic;
      clk_dsi_o   : out std_logic;
      clk_phy_o   : out std_logic;
      locked_o    : out std_logic);
  end component;

  component reset_gen
    port (
      clk_sys_i        : in  std_logic;
      rst_pcie_n_a_i   : in  std_logic;
      rst_button_n_a_i : in  std_logic;
      rst_n_o          : out std_logic);
  end component;

  component fml_framebuffer
    generic (
      g_fml_depth   : integer := 25;
      g_pll_phy_div : integer;
      g_pll_sys_div : integer;
      g_pll_mul     : integer
      );
    port (
      clk_sys_i : in std_logic;
      rst_n_i   : in std_logic;

      pix_almost_full_i : in  std_logic;
      pix_wr_o          : out std_logic;
      pix_o             : out std_logic_vector(47 downto 0);
      pix_vsync_o       : out std_logic;
      pix_next_frame_i  : in  std_logic;

      fml_adr : out std_logic_vector(g_fml_depth-1 downto 0);
      fml_stb : out std_logic;
      fml_we  : out std_logic;
      fml_ack : in  std_logic;
      fml_sel : out std_logic_vector(3 downto 0);
      fml_di  : in  std_logic_vector(31 downto 0);

      wb_adr_i   : in  std_logic_vector(31 downto 0);
      wb_cyc_i   : in  std_logic;
      wb_we_i    : in  std_logic;
      wb_stb_i   : in  std_logic;
      wb_sel_i   : in  std_logic_vector(3 downto 0);
      wb_dat_i   : in  std_logic_vector(31 downto 0);
      wb_dat_o   : out std_logic_vector(31 downto 0);
      wb_stall_o : out std_logic;
      wb_ack_o   : out std_logic;

      mixer_ctl_i : in  std_logic_vector(7 downto 0);
      mixer_ctl_o : out std_logic_vector(7 downto 0);

      edid_addr_o : out std_logic_vector(7 downto 0);
      edid_data_o : out std_logic_vector(7 downto 0);
      edid_wr_o   : out std_logic

      );
  end component;

  component hdmi_rx_wrapper
    port (
      rst_a_i : in std_logic;
      tmds_clk_p_i : in std_logic;
      tmds_clk_n_i  : in std_logic;
      red_p_i : in std_logic;
      red_n_i : in std_logic;
      green_p_i : in std_logic;
      green_n_i : in std_logic;
      blue_p_i : in std_logic;
      blue_n_i : in std_logic;
      clk_pixel_o : out std_logic;
      hsync_o : out std_logic;
      vsync_o : out std_logic;
      de_o    : out std_logic;
      pixel_o       : out std_logic_vector(47 downto 0);
      pixel_valid_o : out std_logic;
      link_up_o     : out std_logic
      );
  end component;

  component edid_eeprom is
    port(
      clk_sys_i        : in    std_logic;
      rst_n_i          : in    std_logic;
      scl_b            : inout std_logic;
      sda_b            : inout std_logic;
      hdmi_p5v_notif_i : in    std_logic;
      hdmi_hpd_en_o    : out   std_logic;
      addr_i           : in    std_logic_vector(7 downto 0);
      data_i           : in    std_logic_vector(7 downto 0);
      wr_i             : in    std_logic);
  end component;

  component video_mixer is
    port(
      clk_sys_i : in std_logic;
      clk_dvi_i : in std_logic;
      rst_n_i   : in std_logic;

      fb_almost_full_o : out std_logic;
      fb_wr_i          : in  std_logic;
      fb_pixel_i       : in  std_logic_vector(47 downto 0);
      fb_vsync_i       : in  std_logic;
      fb_next_frame_o  : out std_logic;

      dvi_de_i      : in std_logic;
      dvi_hsync_i   : in std_logic;
      dvi_vsync_i   : in std_logic;
      dvi_pixel_i   : in std_logic_vector(47 downto 0);
      dvi_valid_i   : in std_logic;
      dvi_link_up_i : in std_logic;

      dsif_almost_full_i : in  std_logic;
      dsif_wr_o          : out std_logic;
      dsif_pix_o         : out std_logic_vector(47 downto 0);
      dsif_vsync_o       : out std_logic;
      dsif_next_frame_i  : in  std_logic;

      mixer_ctl_i : in  std_logic_vector(7 downto 0);
      mixer_ctl_o : out std_logic_vector(7 downto 0)

      );
  end component;

  constant c_cnx_slave_ports  : integer := 1;
  constant c_cnx_master_ports : integer := 6;

  constant c_master_cpu_i : integer := 0;

  constant c_slave_dpram     : integer := 0;
  constant c_slave_uart      : integer := 1;
  constant c_slave_dsi       : integer := 2;
  constant c_slave_ddram_csr : integer := 3;
  constant c_slave_fb_csr    : integer := 4;
  constant c_slave_ddram_mem : integer := 5;


  signal cnx_slave_in  : t_wishbone_slave_in_array(c_cnx_slave_ports-1 downto 0);
  signal cnx_slave_out : t_wishbone_slave_out_array(c_cnx_slave_ports-1 downto 0);

  signal cnx_master_in  : t_wishbone_master_in_array(c_cnx_master_ports-1 downto 0);
  signal cnx_master_out : t_wishbone_master_out_array(c_cnx_master_ports-1 downto 0);

  constant c_cfg_base_addr : t_wishbone_address_array(c_cnx_master_ports-1 downto 0) :=
    (0 => x"00000000",                  -- 64KB of fpga memory
     1 => x"00010000",                  -- The second port to the same memory
     2 => x"00020000",
     3 => x"00030000",
     4 => x"00040000",
     5 => x"40000000");                 -- Peripherals

  constant c_cfg_base_mask : t_wishbone_address_array(c_cnx_master_ports-1 downto 0) :=
    (0 => x"ffff0000",
     1 => x"ffff0000",
     2 => x"ffff0000",
     3 => x"ffff0000",
     4 => x"ffff0000",
     5 => x"c0000000");

  signal cpu_iwb_out : t_wishbone_master_out;
  signal cpu_iwb_in  : t_wishbone_master_in;


  signal rst_n_sys, rst_sys, rst_n_dsi, clk_phy, clk_sys, clk_dsi, clk_sys_n, pll_locked, pll_locked_n, dsi_wr : std_logic;
  signal dsi_lp_p_int, dsi_lp_n_int, dsi_lp_oe                                                                 : std_logic_vector(3 downto 0);
  signal dsi_clk_lp_p, dsi_clk_lp_n, dsi_clk_lp_oe                                                             : std_logic;

  attribute keep              : string;
  attribute keep of clk_phy   : signal is "true";
  attribute keep of clk_sys   : signal is "true";
  attribute keep of clk_sys_n : signal is "true";
  attribute keep of clk_dsi   : signal is "true";

  signal csr_we      : std_logic;
  signal dsi_wr_sync : std_logic_vector(7 downto 0);

  signal pll_clk_in, pll_clk_fb, pll_clk_dsi: std_logic;
  signal pll_clk_sys, pll_clk_sys_n : std_logic;

  signal dsif_almost_full : std_logic;
  signal dsif_wr          : std_logic;
  signal dsif_pix         : std_logic_vector(47 downto 0);
  signal dsif_vsync       : std_logic;
  signal dsif_next_frame  : std_logic;

  signal fb_almost_full : std_logic;
  signal fb_wr          : std_logic;
  signal fb_pix         : std_logic_vector(47 downto 0);
  signal fb_vsync       : std_logic;
  signal fb_next_frame  : std_logic;

  type t_fml_link is record
    adr                : std_logic_vector(24 downto 0);
    stb, we, ack, eack : std_logic;
    d_m2s              : std_logic_vector(31 downto 0);
    d_s2m              : std_logic_vector(31 downto 0);
    sel                : std_logic_vector(3 downto 0);
  end record;

  signal ddrc, fwb, frameb : t_fml_link;

  signal hdmi_link_up, hdmi_pclk, hdmi_vsync, hdmi_hsync, hdmi_de, hdmi_valid : std_logic;
  signal hdmi_pixel                                                           : std_logic_vector(47 downto 0);

  signal mix_ctl_tomix, mix_ctl_tofb : std_logic_vector(7 downto 0);
  signal edid_addr, edid_data        : std_logic_vector(7 downto 0);
  signal edid_wr                     : std_logic;
  signal dsi_gpio                    : std_logic_vector(2 downto 0);


  
  signal uart_txd_int : std_logic;
begin  -- rtl

  
  uart_txd_o <= uart_txd_int;
  
  rst_sys <= not rst_n_sys;

  U_Sync_DSI_Reset : gc_sync_ffs
    port map (
      clk_i    => clk_dsi,
      rst_n_i  => '1',
      data_i   => rst_n_sys,
      synced_o => rst_n_dsi);

  U_IbufG_CLKIn: IBUFG
    port map (
      I => clk_25m_i,
      O => pll_clk_in
      );

  
  U_PLL : PLL_BASE
    generic map (
    BANDWIDTH          => "OPTIMIZED",
    CLK_FEEDBACK       => "CLKFBOUT",
    COMPENSATION       => "SYSTEM_SYNCHRONOUS",
    DIVCLK_DIVIDE      => 1,
    CLKFBOUT_MULT      => g_pll_mul,
    CLKFBOUT_PHASE     => 0.000,
    CLKOUT0_DIVIDE     => g_pll_phy_div,
    CLKOUT0_PHASE      => 0.000,
    CLKOUT0_DUTY_CYCLE => 0.500,
    CLKOUT1_DIVIDE     => g_pll_phy_div * 8,
    CLKOUT1_PHASE      => 0.000,
    CLKOUT1_DUTY_CYCLE => 0.500,
    CLKOUT2_DIVIDE     => g_pll_sys_div,
    CLKOUT2_PHASE      => 0.000,
    CLKOUT2_DUTY_CYCLE => 0.500,
    CLKOUT3_DIVIDE     => g_pll_sys_div,
    CLKOUT3_PHASE      => 180.000,
    CLKOUT3_DUTY_CYCLE => 0.500,
    CLKIN_PERIOD       => 40.000,
    REF_JITTER         => 0.010)
    port map (
      CLKIN    => pll_clk_in,
      CLKFBOUT => pll_clk_fb,
      CLKOUT0  => clk_phy,
      CLKOUT1  => pll_clk_dsi,
      CLKOUT2  => pll_clk_sys,
      CLKOUT3  => pll_clk_sys_n,
      LOCKED   => pll_locked,
      RST      => '0',
      CLKFBIN  => pll_clk_fb);

  pll_locked_n <= not pll_locked;

  U_BufG_CLK_DSI: BUFG
    port map (
      I => pll_clk_dsi,
      O => clk_dsi);

    U_BufG_CLK_SYS: BUFG
    port map (
      I => pll_clk_sys,
      O => clk_sys);

  U_BufG_CLK_SYS_N: BUFG
    port map (
      I => pll_clk_sys_n,
      O => clk_sys_n);
  
  U_Reset_Gen : reset_gen
    port map (
      clk_sys_i        => clk_sys,
      rst_pcie_n_a_i   => pll_locked_n,
      rst_button_n_a_i => rst_n_a_i,
      rst_n_o          => rst_n_sys);


  U_CPU : xwb_lm32
    generic map (
      g_profile => "medium_icache")
    port map (
      clk_sys_i => clk_sys,
      rst_n_i   => rst_n_sys,
      irq_i     => x"00000000",
      dwb_o     => cnx_slave_in(0),
      dwb_i     => cnx_slave_out(0),
      iwb_o     => cpu_iwb_out,
      iwb_i     => cpu_iwb_in);

  U_Intercon : xwb_crossbar
    generic map (
      g_num_masters => c_cnx_slave_ports,
      g_num_slaves  => c_cnx_master_ports,
      g_registered  => true,
      g_address     => c_cfg_base_addr,
      g_mask        => c_cfg_base_mask)
    port map (
      clk_sys_i => clk_sys,
      rst_n_i   => rst_n_sys,
      slave_i   => cnx_slave_in,
      slave_o   => cnx_slave_out,
      master_i  => cnx_master_in,
      master_o  => cnx_master_out);

  U_DPRAM : xwb_dpram
    generic map (
      g_size                  => 4096,  -- 16kB
      g_init_file             => g_lm32_firmware,
      g_must_have_init_file   => true,
      g_slave1_interface_mode => PIPELINED,
      g_slave2_interface_mode => PIPELINED,
      g_slave1_granularity    => BYTE,
      g_slave2_granularity    => BYTE)
    port map (
      clk_sys_i => clk_sys,
      rst_n_i   => rst_n_sys,
      slave1_i  => cnx_master_out(c_slave_dpram),
      slave1_o  => cnx_master_in(c_slave_dpram),
      slave2_i  => cpu_iwb_out,
      slave2_o  => cpu_iwb_in);

  U_UART : xwb_simple_uart
    generic map (
      g_interface_mode      => PIPELINED,
      g_address_granularity => BYTE)
    port map (
      clk_sys_i  => clk_sys,
      rst_n_i    => rst_n_sys,
      slave_i    => cnx_master_out(c_slave_uart),
      slave_o    => cnx_master_in(c_slave_uart),
      uart_rxd_i => uart_rxd_i,
      uart_txd_o => uart_txd_int);

  csr_we <= cnx_master_out(c_slave_ddram_csr).cyc and cnx_master_out(c_slave_ddram_csr).stb and
            cnx_master_out(c_slave_ddram_csr).we;

  U_DDR_Controller : hpdmc
    generic map (
      data_delay => g_data_delay,
      dqs_delay  => g_dqs_delay)
    port map (
      sys_clk   => clk_sys,
      sys_clk_n => clk_sys_n,
      sys_rst   => rst_sys,
      csr_a     => cnx_master_out(c_slave_ddram_csr).adr(15 downto 2),
      csr_we    => csr_we,
      csr_di    => cnx_master_out(c_slave_ddram_csr).dat,
      csr_do    => cnx_master_in(c_slave_ddram_csr).dat,

      fml_adr  => ddrc.adr(24 downto 0),
      fml_stb  => ddrc.stb,
      fml_we   => ddrc.we,
      fml_eack => ddrc.eack,
      fml_sel  => ddrc.sel,
      fml_di   => ddrc.d_m2s,
      fml_do   => ddrc.d_s2m,

      sdram_clk_p => sdram_clk_p,
      sdram_clk_n => sdram_clk_n,
      sdram_cke   => sdram_cke,
      sdram_cs_n  => sdram_cs_n,
      sdram_we_n  => sdram_we_n,
      sdram_cas_n => sdram_cas_n,
      sdram_ras_n => sdram_ras_n,
      sdram_adr   => sdram_adr,
      sdram_ba    => sdram_ba,
      sdram_dm    => sdram_dm,
      sdram_dq    => sdram_dq,
      sdram_dqs   => sdram_dqs);

  U_FML_Arb : fmlarb
    generic map (
      fml_depth => 25)
    port map (
      sys_clk => clk_sys,
      sys_rst => rst_sys,

      m0_adr => frameb.adr,
      m0_stb => frameb.stb,
      m0_we  => frameb.we,
      m0_ack => frameb.ack,
      m0_sel => frameb.sel,
      m0_do  => frameb.d_s2m,

      m1_adr => fwb.adr,
      m1_stb => fwb.stb,
      m1_we  => fwb.we,
      m1_ack => fwb.ack,
      m1_sel => fwb.sel,
      m1_di  => fwb.d_m2s,
      m1_do  => fwb.d_s2m,

      s_adr  => ddrc.adr,
      s_stb  => ddrc.stb,
      s_we   => ddrc.we,
      s_eack => ddrc.eack,
      s_sel  => ddrc.sel,
      s_di   => ddrc.d_s2m,
      s_do   => ddrc.d_m2s);

  U_FML_WB_Bridge : fml_wb_bridge
    generic map (
      sdram_depth => 25)
    port map (
      clk_sys_i  => clk_sys,
      rst_n_i    => rst_n_sys,
      fml_adr    => fwb.adr,
      fml_stb    => fwb.stb,
      fml_we     => fwb.we,
      fml_ack    => fwb.ack,
      fml_sel    => fwb.sel,
      fml_di     => fwb.d_s2m,
      fml_do     => fwb.d_m2s,
      wb_adr_i   => cnx_master_out(c_slave_ddram_mem).adr,
      wb_cyc_i   => cnx_master_out(c_slave_ddram_mem).cyc,
      wb_we_i    => cnx_master_out(c_slave_ddram_mem).we,
      wb_sel_i   => cnx_master_out(c_slave_ddram_mem).sel,
      wb_stb_i   => cnx_master_out(c_slave_ddram_mem).stb,
      wb_dat_i   => cnx_master_out(c_slave_ddram_mem).dat,
      wb_dat_o   => cnx_master_in(c_slave_ddram_mem).dat,
      wb_stall_o => cnx_master_in(c_slave_ddram_mem).stall,
      wb_ack_o   => cnx_master_in(c_slave_ddram_mem).ack
      );

  
  U_DSI_Core : dsi_core
    generic map
    (g_clock_period_ps => g_clock_period_ps)
    port map (
      clk_dsi_i         => clk_dsi,
      clk_sys_i         => clk_sys,
      clk_phy_i         => clk_phy,
      rst_n_i           => rst_n_dsi,
      pll_locked_i      => pll_locked,
      pix_i             => dsif_pix,
      pix_almost_full_o => dsif_almost_full,
      pix_vsync_i       => dsif_vsync,
      pix_next_frame_o  => dsif_next_frame,
      pix_wr_i          => dsif_wr,
      dsi_clk_p_o       => dsi_clk_p_o,
      dsi_clk_n_o       => dsi_clk_n_o,
      dsi_clk_lp_n_o    => dsi_clk_lp_n,
      dsi_clk_lp_p_o    => dsi_clk_lp_p,
      dsi_clk_lp_oe_o   => dsi_clk_lp_oe,
      dsi_hs_p_o        => dsi_hs_p_o,
      dsi_hs_n_o        => dsi_hs_n_o,
      dsi_lp_p_o        => dsi_lp_p_int,
      dsi_lp_n_o        => dsi_lp_n_int,
      dsi_lp_oe_o       => dsi_lp_oe,
      dsi_reset_n_o     => dsi_resetb_o,
      dsi_gpio_o        => dsi_gpio,
      wb_adr_i          => cnx_master_out(c_slave_dsi).adr,
      wb_cyc_i          => cnx_master_out(c_slave_dsi).cyc,
      wb_we_i           => cnx_master_out(c_slave_dsi).we,
      wb_sel_i          => cnx_master_out(c_slave_dsi).sel,
      wb_stb_i          => cnx_master_out(c_slave_dsi).stb,
      wb_dat_i          => cnx_master_out(c_slave_dsi).dat,
      wb_dat_o          => cnx_master_in(c_slave_dsi).dat,
      wb_stall_o        => cnx_master_in(c_slave_dsi).stall,
      wb_ack_o          => cnx_master_in(c_slave_dsi).ack
      );

  lcd_pwren_o <= '1';

  U_Framebuffer : fml_framebuffer
    generic map (
      g_fml_depth   => 25,
      g_pll_phy_div => g_pll_phy_div,
      g_pll_sys_div => g_pll_sys_div,
      g_pll_mul     => g_pll_mul
      )
    port map (
      clk_sys_i => clk_sys,
      rst_n_i   => rst_n_sys,

      pix_almost_full_i => fb_almost_full,
      pix_wr_o          => fb_wr,
      pix_o             => fb_pix,
      pix_vsync_o       => fb_vsync,
      pix_next_frame_i  => fb_next_frame,

      fml_adr => frameb.adr,
      fml_stb => frameb.stb,
      fml_we  => frameb.we,
      fml_ack => frameb.ack,
      fml_sel => frameb.sel,
      fml_di  => frameb.d_s2m,

      wb_adr_i   => cnx_master_out(c_slave_fb_csr).adr,
      wb_cyc_i   => cnx_master_out(c_slave_fb_csr).cyc,
      wb_we_i    => cnx_master_out(c_slave_fb_csr).we,
      wb_sel_i   => cnx_master_out(c_slave_fb_csr).sel,
      wb_stb_i   => cnx_master_out(c_slave_fb_csr).stb,
      wb_dat_i   => cnx_master_out(c_slave_fb_csr).dat,
      wb_dat_o   => cnx_master_in(c_slave_fb_csr).dat,
      wb_stall_o => cnx_master_in(c_slave_fb_csr).stall,
      wb_ack_o   => cnx_master_in(c_slave_fb_csr).ack,

      mixer_ctl_o => mix_ctl_tomix,
      mixer_ctl_i => mix_ctl_tofb,

      edid_addr_o => edid_addr,
      edid_data_o => edid_data,
      edid_wr_o   => edid_wr

      );


  gen_with_hdmi_sampler : if (g_with_hdmi = true) generate
    U_HDMI_RX : hdmi_rx_wrapper
      port map
      (
        rst_a_i => rst_sys,
        
        tmds_clk_p_i => hdmi_rx_p_i(3),
        tmds_clk_n_i => hdmi_rx_n_i(3),

        blue_p_i => hdmi_rx_p_i(0),
        blue_n_i => hdmi_rx_n_i(0),

        green_p_i => hdmi_rx_p_i(1),
        green_n_i => hdmi_rx_n_i(1),

        red_p_i => hdmi_rx_p_i(2),
        red_n_i => hdmi_rx_n_i(2),

        clk_pixel_o => hdmi_pclk,

        hsync_o => hdmi_hsync,
        vsync_o => hdmi_vsync,
        de_o    => hdmi_de,

        link_up_o     => hdmi_link_up,
        pixel_o       => hdmi_pixel,
        pixel_valid_o => hdmi_valid
        );

    
    U_EDID_EEPROM : edid_eeprom
      port map (
        clk_sys_i        => clk_sys,
        rst_n_i          => rst_n_sys,
        scl_b            => hdmi_scl_b,
        sda_b            => hdmi_sda_b,
        hdmi_p5v_notif_i => hdmi_p5v_notif_i,
        hdmi_hpd_en_o    => hdmi_hpd_o,
        addr_i           => edid_addr,
        data_i           => edid_data,
        wr_i             => edid_wr);

  end generate gen_with_hdmi_sampler;


  U_Video_Mixer : video_mixer
    port map (
      clk_sys_i          => clk_sys,
      clk_dvi_i          => hdmi_pclk,
      rst_n_i            => rst_n_sys,
      fb_almost_full_o   => fb_almost_full,
      fb_wr_i            => fb_wr,
      fb_pixel_i         => fb_pix,
      fb_vsync_i         => fb_vsync,
      fb_next_frame_o    => fb_next_frame,
      dvi_de_i           => hdmi_de,
      dvi_hsync_i        => hdmi_hsync,
      dvi_vsync_i        => hdmi_vsync,
      dvi_pixel_i        => hdmi_pixel,
      dvi_valid_i        => hdmi_valid,
      dvi_link_up_i      => hdmi_link_up,
      dsif_almost_full_i => dsif_almost_full,
      dsif_wr_o          => dsif_wr,
      dsif_pix_o         => dsif_pix,
      dsif_vsync_o       => dsif_vsync,
      dsif_next_frame_i  => dsif_next_frame,
      mixer_ctl_i        => mix_ctl_tomix,
      mixer_ctl_o        => mix_ctl_tofb
      );

  gen_lp_tristates : for i in 0 to 3 generate
    dsi_lp_p_o(i) <= '1' when (dsi_lp_p_int(i) = '1' and dsi_lp_oe(i) = '1') else 'Z';
    dsi_lp_n_o(i) <= '1' when (dsi_lp_n_int(i) = '1' and dsi_lp_oe(i) = '1') else 'Z';
  end generate gen_lp_tristates;

  dsi_clk_lp_p_o <= '1' when (dsi_clk_lp_p = '1' and dsi_clk_lp_oe = '1') else 'Z';
  dsi_clk_lp_n_o <= '1' when (dsi_clk_lp_n = '1' and dsi_clk_lp_oe = '1') else 'Z';

  process(clk_sys)
  begin
    if rising_edge(clk_sys) then
      cnx_master_in(c_slave_ddram_csr).ack <= cnx_master_out(c_slave_ddram_csr).stb and cnx_master_out(c_slave_ddram_csr).cyc;
    end if;
  end process;

  cnx_master_in(c_slave_dsi).err         <= '0';
  cnx_master_in(c_slave_ddram_csr).stall <= '0';
  cnx_master_in(c_slave_ddram_csr).err   <= '0';
  cnx_master_in(c_slave_ddram_mem).err   <= '0';

  dsi_gpio1_o <= dsi_gpio(0);
  dsi_gpio0_o <= 'Z';
end rtl;

