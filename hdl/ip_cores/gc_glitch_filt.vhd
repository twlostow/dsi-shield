--==============================================================================
-- CERN (BE-CO-HT)
-- Glitch filter with selectable length
--==============================================================================
--
-- author: Theodor Stana (t.stana@cern.ch)
--
-- date of creation: 2013-03-12
--
-- version: 1.0
--
-- description:
--    Glitch filter consisting of a set of chained flip-flops followed by a
--    comparator. The comparator toggles to '1' when all FFs in the chain are
--    '1' and respectively to '0' when all the FFS in the chain are '0'.
--
-- dependencies:
--
-- references:
--
--==============================================================================
-- GNU LESSER GENERAL PUBLIC LICENSE
--==============================================================================
-- This source file is free software; you can redistribute it and/or modify it
-- under the terms of the GNU Lesser General Public License as published by the
-- Free Software Foundation; either version 2.1 of the License, or (at your
-- option) any later version. This source is distributed in the hope that it
-- will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU Lesser General Public License for more details. You should have
-- received a copy of the GNU Lesser General Public License along with this
-- source; if not, download it from http://www.gnu.org/licenses/lgpl-2.1.html
--==============================================================================
-- last changes:
--    2013-03-12   Theodor Stana     t.stana@cern.ch     File created
--==============================================================================
-- TODO: -
--==============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gencores_pkg.all;

entity gc_glitch_filt is
  generic
  (
    -- Length of glitch filter:
    -- g_len = 1 => data width should be > 1 clk_i cycle
    -- g_len = 2 => data width should be > 2 clk_i cycle
    -- etc.
    g_len : natural := 4
  );
  port
  (
    clk_i   : in  std_logic;
    rst_n_i : in  std_logic;

    -- Data input, synchronous to clk_i
    dat_i   : in  std_logic;

    -- Data output
    -- latency: g_len+1 clk_i cycles
    dat_o   : out std_logic
  );
end entity gc_glitch_filt;


architecture behav of gc_glitch_filt is

  --============================================================================
  -- Signal declarations
  --============================================================================
  signal glitch_filt : std_logic_vector(g_len downto 0);

--==============================================================================
--  architecture begin
--==============================================================================
begin

  --============================================================================
  -- Glitch filtration logic
  --============================================================================
  glitch_filt(0) <= dat_i;

  -- Generate glitch filter FFs when the filter length is > 0
  gen_glitch_filt: if (g_len > 0) generate
    p_glitch_filt: process (clk_i)
    begin
      if rising_edge(clk_i) then
        if (rst_n_i = '0') then
          glitch_filt(g_len downto 1) <= (others => '0');
        else
          glitch_filt(g_len downto 1) <= glitch_filt(g_len-1 downto 0);
        end if;
      end if;
    end process p_glitch_filt;
  end generate gen_glitch_filt;

  -- and set the data output based on the state of the glitch filter
  p_output: process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_n_i = '0') then
        dat_o <= '0';
      elsif (unsigned(glitch_filt) = (glitch_filt'range => '1')) then
        dat_o <= '1';
      elsif (unsigned(glitch_filt) = (glitch_filt'range => '0')) then
        dat_o <= '0';
      end if;
    end if;
  end process p_output;

end architecture behav;
--==============================================================================
--  architecture end
--==============================================================================
