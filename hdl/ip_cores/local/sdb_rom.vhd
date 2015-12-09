library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wishbone_pkg.all;

entity sdb_rom is
  generic(
    g_layout      : t_sdb_record_array;
    g_bus_end     : unsigned(63 downto 0));
  port(
    clk_sys_i     : in  std_logic;
    slave_i       : in  t_wishbone_slave_in;
    slave_o       : out t_wishbone_slave_out);
end sdb_rom;

architecture rtl of sdb_rom is
  alias c_layout : t_sdb_record_array(g_layout'length downto 1) is g_layout;

  -- The ROM must describe all slaves, the crossbar itself and the optional information records
  constant c_used_entries   : natural := c_layout'length + 1;
  constant c_rom_entries    : natural := 2**f_ceil_log2(c_used_entries); -- next power of 2
  constant c_sdb_words      : natural := c_sdb_device_length / c_wishbone_data_width;
  constant c_rom_words      : natural := c_rom_entries * c_sdb_words;
  constant c_rom_depth      : natural := f_ceil_log2(c_rom_words);
  constant c_rom_lowbits    : natural := f_ceil_log2(c_wishbone_data_width / 8);
  
  type t_rom is array(c_rom_words-1 downto 0) of t_wishbone_data;

  function f_build_rom
    return t_rom 
  is
    variable res : t_rom := (others => (others => '0'));
    variable sdb_device : std_logic_vector(c_sdb_device_length-1 downto 0) := (others => '0');
    variable sdb_component : t_sdb_component;
  begin
    sdb_device(511 downto 480) := x"5344422D"  ;                                     -- sdb_magic
    sdb_device(479 downto 464) := std_logic_vector(to_unsigned(c_used_entries, 16)); -- sdb_records
    sdb_device(463 downto 456) := x"01";                                             -- sdb_version
    sdb_device(455 downto 448) := x"00";                                             -- sdb_bus_type = sdb_wishbone
    sdb_device(  7 downto   0) := x"00";                                             -- record_type  = sdb_interconnect
    
    sdb_component.addr_first := (others => '0');
    sdb_component.addr_last  := std_logic_vector(g_bus_end);
    sdb_component.product.vendor_id := x"0000000000000651"; -- GSI
    sdb_component.product.device_id := x"e6a542c9";
    sdb_component.product.version   := x"00000002";
    sdb_component.product.date      := x"20120511";
    sdb_component.product.name      := "WB4-Crossbar-GSI   ";
    sdb_device(447 downto   8) := f_sdb_embed_component(sdb_component, (others => '0'));
    
    for i in 0 to c_sdb_words-1 loop
      res(c_sdb_words-1-i) := 
        sdb_device((i+1)*c_wishbone_data_width-1 downto i*c_wishbone_data_width);
    end loop;
    
    for slave in 1 to c_used_entries-1 loop
      sdb_device(511 downto 0) := c_layout(slave);
      
      for i in 0 to c_sdb_words-1 loop
        res((slave+1)*c_sdb_words-1-i) := 
          sdb_device((i+1)*c_wishbone_data_width-1 downto i*c_wishbone_data_width);
      end loop;
    end loop;

    return res;
  end f_build_rom;
   
  signal rom : t_rom := f_build_rom;
  signal adr_reg : unsigned(c_rom_depth-1 downto 0);

begin
  -- Simple ROM; ignore we/sel/dat
  slave_o.err   <= '0';
  slave_o.rty   <= '0';
  slave_o.stall <= '0';
  slave_o.int   <= '0'; -- Tom sucks! This should not be here.

  slave_o.dat <= rom(to_integer(adr_reg));
  
  slave_clk : process(clk_sys_i)
  begin
    if (rising_edge(clk_sys_i)) then
      adr_reg <= unsigned(slave_i.adr(c_rom_depth+c_rom_lowbits-1 downto c_rom_lowbits));
      slave_o.ack <= slave_i.cyc and slave_i.stb;
    end if;
  end process;
  
end rtl;
