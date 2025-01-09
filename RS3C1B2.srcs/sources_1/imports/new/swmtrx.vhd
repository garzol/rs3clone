----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 17:38:23
-- Design Name: 
-- Module Name: swmtrx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This entity manages the emulated switch matrix 
--   Commands are sent through uart
--   
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

entity swmtrx is
  Port (
           hiclk            : in     STD_LOGIC;

           sw_sig           : in     std_logic;
           sw_strb          : in     std_logic_vector(7 downto 0);
           sw_ret           : in     std_logic_vector(7 downto 0);
           sw_timer         : in     std_logic_vector(7 downto 0);
                        
           dia              : in     std_logic_vector(4 downto 1);
           doa              : in     std_logic_vector(4 downto 1);

           diaplus          : out    std_logic_vector(3 downto 0)

   );
end swmtrx;

architecture Behavioral of swmtrx is

type t_swmtx   is array (0 to 10, 0 to 3) of natural range 0 to 255;

signal sw_ret_int           : std_logic_vector(3 downto 0);

begin

    --permanent assignments 
    sw_ret_int    <= sw_ret(3 downto 0);
    
    
p_switch_matrix : process(hiclk)
    variable r_switches      : t_swmtx := ( others => (others => 0));
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0),
--                                            (0,0,0,0)
--                                          ); 
    variable CLK_DIV0        : unsigned (23 downto 0) := (others=>'0');
    variable last_clk19      : std_logic := '0';
    variable strobnum        : integer range 0 to 15;		 
    variable sw_strobnum     : integer range 0 to 15;		 
    variable sw_retnum       : integer range 0 to 15;		 
    variable sw_timernum     : integer range 0 to 255;		 
	 begin
	    if (rising_edge(hiclk)) then
			-- diag of switches
			last_clk19 := CLK_DIV0(19);
            CLK_DIV0 := CLK_DIV0 + "1";

            strobnum    := to_integer(unsigned(doa));
            sw_strobnum := to_integer(unsigned(sw_strb));
            sw_retnum   := to_integer(unsigned(sw_ret));
            sw_timernum := to_integer(unsigned(sw_timer));
          
            
            -- check uart commands
            if sw_sig = '1' then
                for R in 3 downto 0 loop
                    if sw_ret_int(R) = '1' then
                        r_switches(sw_strobnum, R) := sw_timernum;
                    end if;
                end loop;
                
            end if;
           
            -- update matrix of timers (clk19=> a peu pres 10ms)
			if last_clk19 /= CLK_DIV0(19) and CLK_DIV0(19) = '1' then
				for S in 9 downto 0 loop
					for R in 3 downto 0 loop
						if r_switches(S, R) /= 0 and r_switches(S, R) /= 255 then
							r_switches(S, R) := r_switches(S, R)-1;
						end if;
					end loop;
				end loop;
			end if;
			
			--manage the dia signal
            for R in 3 downto 0 loop
                if r_switches(strobnum, R) = 0 then
                    diaplus(R) <= '0';
                else
                    diaplus(R) <= '1';                
                end if;
            end loop;
    			
        end if;
end process p_switch_matrix;
     
end Behavioral;
