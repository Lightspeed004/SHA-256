library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
library work;
use work.Gates.all;

entity Compress is
    port (ai, bi, ci, di, ei, fi, gi, hi, Wt : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;a, b, c, d, e, f, g, h : out STD_LOGIC_VECTOR(31 downto 0));
end Compress;

architecture bhv of Compress is
    signal notclock: std_logic;
	 signal Z: std_logic_vector(5 downto 0);
	 signal T2, T1,temp1, temp2, temp3, temp4, temp5, o1, o2, u1, u2, u3: std_logic_vector(31 downto 0);
 
begin
i1: INVERTER port map(A => clock, Y => notclock);
count: Countforcompression port map(clock => notclock, Y => Z);

c0: Capsigma1 port map(A => ei, Y => temp1);
c1: Capsigma0 port map(A => ai, Y => temp2);
c4: MajorityFunction port map(A => ai, B => bi, C => ci, Y => temp5);
c2: ChooseFunction port map(L => ei, A => fi, B => gi, Y => temp4);
c3: kf port map(A => Z, Y => temp3);

a1: BitCOunter port map(A => hi, B => temp1, M => '0', S => o1);
a2: BitCOunter port map(A => temp4, B => temp3, M => '0', S => o2);
a3: BitCOunter port map(A => o1, B => o2, M => '0', S => u1);
a4: BitCOunter port map(A => u1, B => Wt, M => '0', S => T1);

a5: BitCOunter port map(A => temp5, B => temp2, M => '0', S => T2);

a6: BitCOunter port map(A => T1, B => T2, M => '0', S => a);
a7: BitCOunter port map(A => T1, B => di, M => '0', S => e);

a8: h <= gi;
    g <= fi;
	 f <= ei;
	 d <= ci;
	 c <= bi;
	 b <= ai;
end bhv;