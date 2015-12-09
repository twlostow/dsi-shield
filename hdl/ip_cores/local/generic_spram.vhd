
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

library work;
use work.genram_pkg.all;

entity generic_spram is

  generic (
    -- standard parameters
    g_data_width : natural := 32;
    g_size       : natural := 1024;

    -- if true, the user can write individual bytes by using bwe_i
    g_with_byte_enable : boolean := false;

    -- RAM read-on-write conflict resolution. Can be "read_first" (read-then-write)
    -- or "write_first" (write-then-read)
    g_addr_conflict_resolution : string := "write_first";
    g_init_file                : string := ""
    );

  port (
    rst_n_i : in std_logic;             -- synchronous reset, active LO
    clk_i   : in std_logic;             -- clock input

    -- byte write enable, actiwe when g_
    bwe_i : in std_logic_vector((g_data_width+7)/8-1 downto 0);

    -- global write enable (masked by bwe_i if g_with_byte_enable = true)
    we_i : in std_logic;

    -- address input
    a_i : in std_logic_vector(f_log2_size(g_size)-1 downto 0);

    -- data input
    d_i : in std_logic_vector(g_data_width-1 downto 0);

    -- data output
    q_o : out std_logic_vector(g_data_width-1 downto 0)
    );

end generic_spram;



architecture syn of generic_spram is


  constant c_num_bytes : integer := (g_data_width+7)/8;

  type t_ram_type is array(0 to g_size-1) of std_logic_vector(g_data_width-1 downto 0);
  type t_string_file_type is file of string;


  impure function f_bitstring_2_slv(s : string; num_bits : integer) return std_logic_vector is
  begin
  end function f_bitstring_2_slv;


  impure function f_load_from_file(file_name : string) return t_ram_type is

    file f           : t_string_file_type;
    variable fstatus : file_open_status;
    

    
  begin
    file_open(fstatus, f, file_name, read_mode);

    if(fstatus /= open_ok) then
      report "generic_spram: Cannot open memory initialization file: " & file_name severity failure;
    end if;
    
    
  end function f_load_from_file;


  signal ram  : t_ram_type;
  signal s_we : std_logic_vector(c_num_bytes-1 downto 0);

  signal s_ram_in  : std_logic_vector(g_data_width-1 downto 0);
  signal s_ram_out : std_logic_vector(g_data_width-1 downto 0);
  
  
begin
  assert (g_init_file = "" or g_init_file = "none") 
  report "generic_spram: Memory initialization files not supported yet. Sorry :(" 
  severity failure;


  gen_with_byte_enable_writefirst : if(g_with_byte_enable = true and g_addr_conflict_resolution = "write_first") generate
    s_we <= bwe_i when we_i = '1' else (others => '0');

    process(s_we, d_i)
    begin
      for i in 0 to c_num_bytes-1 loop
        if s_we(i) = '1' then
          s_ram_in(8*i+7 downto 8*i)  <= d_i(8*i+7 downto 8*i);
          s_ram_out(8*i+7 downto 8*i) <= d_i(8*i+7 downto 8*i);
        else
          s_ram_in(8*i+7 downto 8*i)  <= ram(conv_integer(unsigned(a_i)))(8*i+7 downto 8*i);
          s_ram_out(8*i+7 downto 8*i) <= ram(conv_integer(unsigned(a_i)))(8*i+7 downto 8*i);
        end if;
      end loop;  -- i 
    end process;

    process(clk_i)
    begin
      if rising_edge(clk_i) then
        ram(conv_integer(unsigned(a_i))) <= s_ram_in;
        q_o                              <= s_ram_out;
      end if;
    end process;

  end generate gen_with_byte_enable_writefirst;

  gen_with_byte_enable_readfirst : if(g_with_byte_enable = true and (g_addr_conflict_resolution = "read_first" or
                                                                     g_addr_conflict_resolution = "dont_care")) generate
    s_we <= bwe_i when we_i = '1' else (others => '0');

    process(s_we, d_i)
    begin
      for i in 0 to c_num_bytes-1 loop
        if (s_we(i) = '1') then
          s_ram_in(8*i+7 downto 8*i) <= d_i(8*i+7 downto 8*i);
        else
          s_ram_in(8*i+7 downto 8*i) <= ram(conv_integer(unsigned(a_i)))(8*i+7 downto 8*i);
        end if;
      end loop;
    end process;

    process(clk_i)
    begin
      if rising_edge(clk_i) then
        ram(conv_integer(unsigned(a_i))) <= s_ram_in;
        q_o                              <= ram(conv_integer(unsigned(a_i)));
      end if;
    end process;
  end generate gen_with_byte_enable_readfirst;


  gen_without_byte_enable_writefirst : if(g_with_byte_enable = false and g_addr_conflict_resolution = "write_first") generate

    process(clk_i)
    begin
      if rising_edge(clk_i) then
        if(we_i = '1') then
          ram(conv_integer(unsigned(a_i))) <= d_i;
          q_o                              <= d_i;
        else
          q_o <= ram(conv_integer(unsigned(a_i)));
        end if;
      end if;
    end process;

  end generate gen_without_byte_enable_writefirst;

  gen_without_byte_enable_readfirst : if(g_with_byte_enable = false and (g_addr_conflict_resolution = "read_first" or
                                                                         g_addr_conflict_resolution = "dont_care")) generate

    process(clk_i)
    begin
      if rising_edge(clk_i) then
        if(we_i = '1') then
          ram(conv_integer(unsigned(a_i))) <= d_i;
        end if;
        q_o <= ram(conv_integer(unsigned(a_i)));
      end if;
    end process;
    
  end generate gen_without_byte_enable_readfirst;
  

end syn;
