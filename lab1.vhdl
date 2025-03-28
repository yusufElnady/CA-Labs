library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
    port (
        clk, RegWrite: in std_logic;
        write_data: in std_logic_vector (31 downto 0);
        rreg_index1, rreg_index2, wreg_index: in std_logic_vector (4 downto 0);

        read_data1, read_data2: out std_logic_vector (31 downto 0)
    );
end reg_file;

architecture behavior of reg_file is
    type reg_vector is array(0 to 31) of std_logic_vector(31 downto 0);
    signal stored_d: reg_vector := (others => (others => '0'));
begin
    process (clk)
    begin
        if clk = '1' then
            if RegWrite = '1' then
                stored_d(to_integer(unsigned(wreg_index))) <= write_data;
            end if;
		else
			read_data1 <= stored_d(to_integer(unsigned(rreg_index1)));
			read_data2 <= stored_d(to_integer(unsigned(rreg_index2)));
        end if;
    end process;


end architecture behavior;
