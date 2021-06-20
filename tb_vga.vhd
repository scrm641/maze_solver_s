library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_vga is
--  Port ( );
end tb_vga;

architecture Behavioral of tb_vga is
component vga_controller is
port
(
clk: in std_logic;
hsync: out std_logic;
vsync: out std_logic;

red: out std_logic;
green: out std_logic;
blue: out std_logic;
x: out natural ;
y: out natural
);
end component;

signal clk: std_logic;
signal hsync:  std_logic;
signal vsync:  std_logic;

signal red: std_logic;
signal green: std_logic;
signal blue: std_logic;

signal x:  natural ;
signal y:  natural ;

begin
dut: vga_controller port map (clk=>clk, hsync=>hsync, vsync=> vsync, red=>red, blue => blue, green =>green, x=>x, y=>y);
main: process -- 25Mhz Clock
begin 
clk<= '0'; wait for 20ns;
clk<= '1'; wait for 20ns;
end process main;

end Behavioral;
