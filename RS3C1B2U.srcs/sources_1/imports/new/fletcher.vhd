----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2024 02:02:56
-- Design Name: 
-- Module Name: fletcher - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- implementation of the fletcher crc
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fletcher is
    Port ( 
           hiclk       : in     std_logic;
           cmdclk      : in     STD_LOGIC;
           nbyte       : in     std_logic_vector(7 downto 0);
           reset       : in     std_logic;
           crc         : out    std_logic_vector(15 downto 0));
end fletcher;

architecture Behavioral of fletcher is

constant C0_initial   : natural range 0 to 255 := 0;
constant C1_initial   : natural range 0 to 255 := 0;

signal   C0           : natural range 0 to 255 := C0_initial;
signal   C1           : natural range 0 to 255 := C1_initial;

begin

    crc(7  downto 0) <= std_logic_vector(to_unsigned(C0, 8));
    crc(15 downto 8) <= std_logic_vector(to_unsigned(C1, 8));
    
    process (hiclk)
        variable  intern_co   : natural range 0 to 255;
        variable  last_cmdclk : std_logic; 
    begin
        if (rising_edge(hiclk)) then
            if reset = '1' then
                C0 <= C0_initial;
                C1 <= C1_initial;
            else
                if cmdclk /= last_cmdclk then
                    -- new incoming byte
                    intern_co := ( (C0 + to_integer(unsigned(nbyte))) mod 255 );
                    C0 <= intern_co;
                    C1 <= ( (C1 + intern_co) mod 255 );
                end if;
            end if;
            last_cmdclk := cmdclk;
        end if;
    end process;


end Behavioral;
