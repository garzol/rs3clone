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
use work.common.all;

entity swmtrx is
  Port (
           hiclk            : in     STD_LOGIC;
           
           reset_n          : in     std_logic;  -- negative reset

           sw_sig           : in     std_logic;
           sw_strb          : in     std_logic_vector(7 downto 0);
           sw_ret           : in     std_logic_vector(7 downto 0);
           sw_timer         : in     std_logic_vector(7 downto 0);
                        
           dia              : in     std_logic_vector(4 downto 1);
           doa              : in     std_logic_vector(4 downto 1);

           r_BitSwitches    : out    t_BitSwitches;
           diaplus          : out    std_logic_vector(3 downto 0)

   );
end swmtrx;

architecture Behavioral of swmtrx is

--bit 7 : 1 it's an emulated switch - 0 it's a true switch
--6 downto 0 for the timer, 
type t_swmtx   is array (0 to 10, 0 to 3) of unsigned(7 downto 0);

signal sw_ret_int           : std_logic_vector(3 downto 0);

signal r_BitSwitches_int   : t_BitSwitches := (others => (others => '0'));

begin

    --permanent assignments 
    sw_ret_int    <= sw_ret(3 downto 0);
    
    r_BitSwitches <= r_BitSwitches_int;
    
p_switch_matrix : process(hiclk)
    variable r_switches      : t_swmtx := ( others => (others => (others => '0')));
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
    variable last_strobnum   : integer range 0 to 15 := 0;			 
    variable sw_strobnum     : integer range 0 to 15;		 
    variable sw_retnum       : integer range 0 to 15;		 
    variable sw_timernum     : unsigned(7 downto 0);		 
    variable doa2diaDelay    : integer range 0 to 127 := 0; --0: timer is stopped
    constant c_timerd2d      : integer range 0 to 127 :=127;
	 begin
	    if (rising_edge(hiclk)) then
			-- diag of switches
			if reset_n = '0' then
			    last_clk19        := '0';
			    doa2diaDelay      := 0;
			    last_strobnum     := 0;
			    r_switches        := ( others => (others => (others => '0')));
			else
                last_clk19 := CLK_DIV0(19);
                CLK_DIV0   := CLK_DIV0 + "1";
    
                strobnum    := to_integer(unsigned(doa));
                sw_strobnum := to_integer(unsigned(sw_strb));
                sw_retnum   := to_integer(unsigned(sw_ret));
                sw_timernum := unsigned(sw_timer);
              
                
                -- check uart commands
                if sw_sig = '1' then
                    for R in 3 downto 0 loop
                        if sw_ret_int(R) = '1' then
                            r_switches(sw_strobnum, R) := sw_timernum or "10000000";
                        end if;
                    end loop;
                    
                end if;
    
    
                -- manage physical switch matrix
                if last_strobnum /= strobnum then
                    --start timer
                    doa2diaDelay := c_timerd2d;   --> >1 : count down to 1; ==1 : start dia test and decrement; ==0 : wait;
                end if;
                last_strobnum := strobnum;
    
                case doa2diaDelay is 
                    when 0    =>
                        --timer is disabled, wait for next doa event.
                        null;
                    when 1    =>
                        --timer has elapsed
                        if strobnum <= 9 then
                            if dia(1) = '1' then
                                r_switches(strobnum, 0) := r_switches(strobnum, 0) or "00000111";
                            end if;
                            if dia(2) = '1' then
                                r_switches(strobnum, 1) := r_switches(strobnum, 1) or "00000111";
                            end if;
                            if dia(3) = '1' then
                                r_switches(strobnum, 2) := r_switches(strobnum, 2) or "00000111";
                            end if;
                            if dia(4) = '1' then
                                r_switches(strobnum, 3) := r_switches(strobnum, 3) or "00000111";
                            end if;
                        end if;
                        --stop timer
                        doa2diaDelay := 0;
                    when others => 
                        --timer is running
                        doa2diaDelay := doa2diaDelay - 1;
                end case;
                           
                -- update matrix of timers (clk19=> a peu pres 10ms)
                if last_clk19 /= CLK_DIV0(19) and CLK_DIV0(19) = '1' then
                    for S in 9 downto 0 loop
                        for R in 3 downto 0 loop
                            if r_switches(S, R)(6 downto 0) /= 0 then
                                if r_switches(S, R) /= 255 then
                                    r_switches(S, R)(6 downto 0) := r_switches(S, R)(6 downto 0)-"1";
                                end if;
                            else
                                r_switches(S, R)(7) := '0';
                            end if;
                        end loop;
                    end loop;
                end if;
                
                --manage the diaplus signal
                for R in 3 downto 0 loop
                    if r_switches(strobnum, R)(7) = '0' then
                        diaplus(R) <= '0';
                    else
                        diaplus(R) <= '1';                
                    end if;
                end loop;
                
                --manage the switch trace signal
                for R in 3 downto 0 loop
                    if r_switches(strobnum, R) = 0 then
                        r_BitSwitches_int(strobnum)(R) <= '0';
                    else
                        r_BitSwitches_int(strobnum)(R) <= '1';
                    end if;
                end loop;

    	   end if;
        end if;
end process p_switch_matrix;
     
end Behavioral;
