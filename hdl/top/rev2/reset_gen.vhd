library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

use work.gencores_pkg.all;

entity reset_gen is
  
  port (
    clk_sys_i : in std_logic;

    spi_cs_n_rst_i: in std_logic;

    mask_reset_i : in std_logic;
    
    rst_sys_n_o : out std_logic
    );

end reset_gen;

architecture behavioral of reset_gen is

  signal powerup_cnt     : unsigned(7 downto 0) := x"00";
  signal unmask_cnt     : unsigned(7 downto 0) := x"00";
  signal synced_n : std_logic;
  signal powerup_n       : std_logic            := '0';

  signal rst_n_a : std_logic;
  signal unmask_wait : std_logic;
  
begin  -- behavioral


  rst_n_a <= spi_cs_n_rst_i and not mask_reset_i;

  U_Sync_Button : gc_sync_ffs port map (
    clk_i    => clk_sys_i,
    rst_n_i  => '1',
    data_i   => rst_n_a,
    ppulse_o => synced_n);

  p_unmask: process(clk_sys_i)
  begin
    if rising_edge(clk_sys_i) then
      if(powerup_cnt /= x"ff") then
        unmask_wait <= '0';
      elsif mask_reset_i = '1' then
        unmask_wait <= '1';
        unmask_cnt <= (others => '0');
      elsif (unmask_cnt = x"ff") then
        unmask_wait <= '0';
      else
        unmask_cnt <= unmask_cnt + 1;
      end if;
    end if;
  end process;
  
  p_powerup_reset : process(clk_sys_i)
  begin
    if rising_edge(clk_sys_i) then
      if(powerup_cnt /= x"ff") then
        powerup_cnt <= powerup_cnt + 1;
        powerup_n   <= '0';
      else
        powerup_n <= '1';
      end if;
    end if;
  end process;

  rst_sys_n_o <= ( powerup_n and (not synced_n) ) or unmask_wait;

end behavioral;
