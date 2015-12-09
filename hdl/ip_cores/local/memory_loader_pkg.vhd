library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library work;
use work.genram_pkg.all;

package memory_loader_pkg is

  subtype t_meminit_array is t_generic_ram_init;

  function f_hexchar_to_slv (c   : character) return std_logic_vector;
  function f_hexstring_to_slv (s : string; n_digits : integer) return std_logic_vector;
  function f_get_token(s         : string; n : integer) return string;

  function f_load_mem_from_file
    (file_name : string;
     mem_size  : integer;
     mem_width : integer;
     fail_if_notfound : boolean)
    return t_meminit_array;

end memory_loader_pkg;

package body memory_loader_pkg is

  function f_hexchar_to_slv (c : character) return std_logic_vector is
    variable t : std_logic_vector(3 downto 0);
  begin

    case c is
      when '0' => t := x"0";
      when '1' => t := x"1";
      when '2' => t := x"2";
      when '3' => t := x"3";
      when '4' => t := x"4";
      when '5' => t := x"5";
      when '6' => t := x"6";
      when '7' => t := x"7";
      when '8' => t := x"8";
      when '9' => t := x"9";
      when 'a' => t := x"a";
      when 'A' => t := x"a";
      when 'b' => t := x"b";
      when 'B' => t := x"b";
      when 'c' => t := x"c";
      when 'C' => t := x"c";
      when 'd' => t := x"d";
      when 'D' => t := x"d";
      when 'e' => t := x"e";
      when 'E' => t := x"e";
      when 'f' => t := x"f";
      when 'F' => t := x"f";
      when others =>
        report "f_hexchar_to_slv(): unrecognized character '" &c&" in hex text string" severity failure;
    end case;

    return t;
  end f_hexchar_to_slv;

  function f_hexstring_to_slv (s : string; n_digits : integer) return std_logic_vector is
    variable tmp : std_logic_vector(255 downto 0) := (others => '0');
  begin
    if s'length > tmp'length then
      report "f_hexstring_to_slv(): string length exceeds the limit" severity failure;
    end if;

    for i in 0 to s'length-1 loop
      tmp(4 * (s'length - i) - 1 downto 4 * (s'length - 1 - i)) := f_hexchar_to_slv(s(i+1));
    end loop;  -- i

    return tmp(n_digits * 4 - 1 downto 0);
  end f_hexstring_to_slv;

  function f_get_token(s : string; n : integer) return string is
    variable cur_pos   : integer;
    variable tmp       : string (1 to 128);
    variable cur_token : integer;
    variable tmp_pos   : integer;
  begin

    cur_pos   := 1;
    cur_token := 1;
    tmp_pos   := 1;

    loop

      if(cur_pos >= s'length) then
        return "";
      end if;

      while cur_pos <= s'length and (s(cur_pos) = ' ' or s(cur_pos) = character'val(9) or s(cur_pos) = character'val(0)) loop
        cur_pos := cur_pos + 1;
      end loop;

      if(cur_pos >= s'length) then
        return "";
      end if;

      while(cur_pos <= s'length and s(cur_pos) /= ' ' and s(cur_pos) /= character'val(9) and s(cur_pos) /= character'val(0)) loop
        if(cur_token = n) then
          tmp(tmp_pos) := s(cur_pos);
          tmp_pos      := tmp_pos + 1;
        end if;

        cur_pos := cur_pos + 1;
      end loop;

      if(cur_token = n) then
        return tmp(1 to tmp_pos-1);
      end if;


      cur_token := cur_token + 1;

      if(cur_pos >= s'length) then
        return "";
      end if;
    end loop;

    return "";
  end f_get_token;



  function f_load_mem_from_file
    (file_name        : string;
     mem_size         : integer;
     mem_width        : integer;
     fail_if_notfound : boolean)
    return t_meminit_array is

    file f_in         : text;
    variable l        : line;
    variable ls       : string(1 to 128);
    variable cmd      : string(1 to 128);
    variable line_len : integer;
    variable status   : file_open_status;
    variable mem      : t_meminit_array(0 to mem_size-1, mem_width-1 downto 0);
    variable i        : integer;
    variable c        : character;
    variable good     : boolean;
    variable addr     : integer;
    variable data_tmp : unsigned(mem_width-1 downto 0);
    variable data_int : integer;
  begin
    if(file_name = "" or file_name = "none") then
      mem := (others => (others => '0'));
      return mem;
    end if;

    file_open(status, f_in, file_name, read_mode);

    if(status /= open_ok) then
      if(fail_if_notfound) then
        report "f_load_mem_from_file(): can't open file '"&file_name&"'" severity failure;
      else
        report "f_load_mem_from_file(): can't open file '"&file_name&"'" severity warning;
      end if;
    end if;

    while true loop
      i := 0;
      while (i < 4096) loop
        -- stupid ISE restricts the loop length
        readline(f_in, l);
        line_len := 0;
        loop
          read(l, ls(line_len+1), good);
          exit when good = false;
          line_len := line_len + 1;
        end loop;

        if(line_len /= 0 and f_get_token(ls, 1) = "write") then
          addr     := to_integer(unsigned(f_hexstring_to_slv(f_get_token(ls, 2), 8)));
          data_tmp := resize(unsigned(f_hexstring_to_slv(f_get_token(ls, 3), 8)), mem_width);
          data_int := to_integer(data_tmp);

--          report "addr: " & integer'image(addr) & " data: " & integer'image(data_int);
          
          for i in 0 to mem_width-1 loop
            mem(addr, i) := std_logic(data_tmp(i));
          end loop;  -- i in 0 to mem_width-1

        --   report "addr: " & integer'image(addr) & " data: " & integer'image(data_int);
        end if;

        if endfile(f_in) then
          file_close(f_in);
          return mem;
        end if;
        i := i+1;
      end loop;
    end loop;


    return mem;
  end f_load_mem_from_file;



end memory_loader_pkg;
