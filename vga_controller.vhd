library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_controller is
port
(
clk: in std_logic; -- 25Mhz
hsync: out std_logic; -- pin hsync
vsync: out std_logic; -- pin vsync
--RGB
red: out std_logic_vector(3 downto 0); --  4 pins 
green: out std_logic_vector(3 downto 0); -- 4 pins
blue: out std_logic_vector(3 downto 0);-- 4 pins
x: out natural ;
y: out natural
);
end vga_controller;

architecture Behavioral of vga_controller is
-- Clocks at clock frecuency 25MHz 
-- Horizontal
constant h_ts: natural:= 800;
constant h_tpw: natural := 96;
constant h_tdisp: natural:= 640;
constant h_tfp: natural := 16;
constant h_tbp: natural:= 48;
-- Vertical
constant v_ts: natural:= 416800; --521 lines
constant v_ts_l: natural:= 521; --521 lines
constant v_tpw: natural := 1600; --  2 lines
constant v_tpw_l: natural := 2;
constant v_tdisp: natural:= 384000; -- 480 lines
constant v_tdisp_l: natural:= 480;
constant v_tfp: natural := 8000; -- 10 lines
constant v_tfp_l: natural := 10;
constant v_tbp: natural:= 23200; -- 29 lines
constant v_tbp_l: natural:= 29; -- 29 lines

signal h_counter: natural:=0;
signal v_counter: natural:=0;

signal hsyncx: std_logic;
signal vsyncx: std_logic;

signal v_pos: natural:=0;
signal h_pos: natural:=0;


signal rgb: std_logic_vector(15 downto 0);
signal t: integer range 0 to 1000;
type vector_array is array(0 to 10) of std_logic_vector(15 downto 0);


begin

process(clk) -- vsync and hsync --
begin
    if rising_edge(clk)  then
    
        if ( h_counter = (h_ts-1) ) then
             h_counter<= 0 ;
        else h_counter  <= h_counter+1;
        end if;
        
        if (h_counter <  (h_ts - h_tpw) ) then
             hsyncx<='1';
        else hsyncx<='0';
        end if;
        
        if( (h_counter > h_tbp) and h_counter < (h_tdisp + h_tbp) ) then
                h_pos<= h_pos+1;
               
        end if;      
        if (h_pos = 639) then h_pos <= 0; end if; 
        
        
        if   v_counter = (v_ts-1 ) then
             v_counter<=0;
        else v_counter  <= v_counter+1;
        end if;
        
        if (v_counter < (v_ts - v_tpw)) then
             vsyncx<='1';
        else vsyncx<='0';     
        end if;  
        
       if( (v_counter > v_tbp) and v_counter < (v_tbp + v_tdisp-1)  and (h_pos = 639)) then
                v_pos<= v_pos+1;
               if v_pos=479 then v_pos <= 0; end if; 
               
        end if;
        
        
    end if;
end process;


hsync<= hsyncx;
vsync<= vsyncx;
x<= h_pos;
y<= v_pos;
end Behavioral;
