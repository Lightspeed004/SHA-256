library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
entity Countforcompression is port(clock:in std_logic;Y:out std_logic_vector(5 downto 0));
end entity Countforcompression;
architecture behav of Countforcompression is
signal A:std_logic_vector(5 downto 0):="111111";
begin
dff_reset_proc: process (clock)
begin
if(clock'event and (clock='0')) then
A <= A + "000001";
end if ;
Y <= A;
end process dff_reset_proc;
end behav;