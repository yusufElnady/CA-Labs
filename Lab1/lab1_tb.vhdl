library ieee;
use ieee.std_logic_1164.all;

entity lab1_tb is
end lab1_tb;

architecture test of lab1_tb is
    component reg_file 
        port(
            clk, RegWrite: in std_logic;
    
            write_data: in std_logic_vector (31 downto 0);
            rreg_index1, rreg_index2, wreg_index: in std_logic_vector (4 downto 0);
    
    
            read_data1, read_data2: out std_logic_vector (31 downto 0)
        );
    end component;

    signal clk, RegWrite: std_logic;
    signal write_data, read_data1, read_data2: std_logic_vector (31 downto 0);
    signal rreg_index1, rreg_index2, wreg_index: std_logic_vector (4 downto 0);
begin
    smth: reg_file port map(clk, RegWrite, write_data, rreg_index1,
                            rreg_index2, wreg_index, read_data1, read_data2);

    stimulus: process is
    begin
        clk <= '1';
        RegWrite <= '0';
        rreg_index1 <= "00000"; rreg_index2 <= "00001";
        wreg_index <= "00000";
        write_data <= x"ABCDABCD";

        wait for 10 ns;

        clk <= '0';

        wait for 10 ns;

        clk <= '1';
        RegWrite <= '1';

        wait for 10 ns;

        clk <= '0';

        wait for 10 ns;

        clk <= '1';
        RegWrite <= '1';
        rreg_index1 <= "00110"; wreg_index <= "00110";
        write_data <= x"ABBAABBA";

        wait for 10 ns;

        clk <= '0';

        wait for 10 ns;
        wait;
    end process stimulus;

end architecture test;