-------------------------------------------------------------------------------
-- Title      : An Wishbone delay buffer
-- Project    : General Cores Library (gencores)
-------------------------------------------------------------------------------
-- File       : xwb_crossbar.vhd
-- Author     : Wesley W. Terpstra
-- Company    : GSI
-- Created    : 2013-12-16
-- Last update: 2013-12-16
-- Platform   : FPGA-generic
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
--
-- Adds a register between two wishbone interfaces.
-- Useful to improve timing closure when placed between crossbars.
-- Be warned: it reduces the available bandwidth by a half.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2011 GSI / Wesley W. Terpstra
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-12-16  1.0      wterpstra       V1
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wishbone_pkg.all;

entity xwb_register_link is
  port(
    clk_sys_i : in  std_logic;
    rst_n_i   : in  std_logic;
    slave_i   : in  t_wishbone_slave_in;
    slave_o   : out t_wishbone_slave_out;
    master_i  : in  t_wishbone_master_in;
    master_o  : out t_wishbone_master_out);
end xwb_register_link;

architecture rtl of xwb_register_link is

  signal r_slave  : t_wishbone_slave_out;
  signal r_master : t_wishbone_master_out;

begin

  slave_o  <= r_slave;
  master_o <= r_master;
  
  main : process(clk_sys_i, rst_n_i) is
  begin
    if rst_n_i = '0' then
      r_slave  <= cc_dummy_slave_out;
      r_master <= cc_dummy_master_out;
      r_slave.stall <= '0';
    elsif rising_edge(clk_sys_i) then
      -- no flow control on ack/err
      r_slave <= master_i;
      
      -- either we are accepting data (stb=0) or pushing data (stb=1)
      if r_master.stb = '0' then
        r_master      <= slave_i;
        r_master.stb  <= slave_i.cyc and slave_i.stb;
        r_slave.stall <= slave_i.cyc and slave_i.stb;
      else
        r_master.stb  <= r_master.stb and master_i.stall;
        r_slave.stall <= r_master.stb and master_i.stall;
      end if;
      
    end if;
  end process;

end rtl;
