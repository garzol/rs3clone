----------------------------------------------------------------------------------
-- Company: AA55 consulting
-- Engineer: garzol 
-- 
-- Create Date: 23.10.2023 22:27:42
-- Design Name: PPS-4 GPIO10696
-- Module Name: GPIO11696 - Behavioral
-- Project Name:PPS4 clones 
-- Target Devices: XC7S15FTGB196-1
-- Tool Versions: vivado 2023.1.1
-- Description: 
-- Module for emulation of GPIO PPS-4
--
--
-- 
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

use work.libpps4.all;
use work.libgpkd.all;
use work.common.all;

entity GPIO11696 is
    Port ( 
           hiclk         : in     STD_LOGIC;
           spo           : in     STD_LOGIC;
           pps4_phi      : in     pps4_ph_type;
           sc1           : in     STD_LOGIC;
           sc2           : in     STD_LOGIC;
           sc3           : in     STD_LOGIC;
           sc4           : in     STD_LOGIC;
           inx           : in     STD_LOGIC_VECTOR (24 downto 1);
           outx          : out    STD_LOGIC_VECTOR (24 downto 1);

           status        : out    std_logic_vector (7 downto 0);
           
           id : in STD_LOGIC_VECTOR (8 downto 1);
           wio: in STD_LOGIC;
           do : out STD_LOGIC_VECTOR (8 downto 1);
           dldir : out STD_LOGIC);                --set dir of ID1..4 
           
end GPIO11696;

architecture Behavioral of GPIO11696 is

constant cVSS                 : std_logic := '0';

-- Control of dldir. to be confirmed on site
constant cSetDataLOut         : std_logic := '0';


signal nDO_int                : std_logic_vector(4 downto 1) := "0000";
signal dldir_int              : std_logic := not cSetDataLOut;


signal spo_int                : std_logic := '1';

alias  in_grpA          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(4 DOWNTO 1);
alias  in_grpB          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(8 DOWNTO 5);
alias  in_grpC          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(12 DOWNTO 9);
alias  in_grpD          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(16 DOWNTO 13);
alias  in_grpE          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(20 DOWNTO 17);
alias  in_grpF          : STD_LOGIC_VECTOR(4 DOWNTO 1) is inx(24 DOWNTO 21);

alias  out_grpA          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(4 DOWNTO 1);
alias  out_grpB          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(8 DOWNTO 5);
alias  out_grpC          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(12 DOWNTO 9);
alias  out_grpD          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(16 DOWNTO 13);
alias  out_grpE          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(20 DOWNTO 17);
alias  out_grpF          : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx(24 DOWNTO 21);

signal outx_int          : STD_LOGIC_VECTOR (24 downto 1) := (others => '0');

alias  out_int_grpA      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(4 DOWNTO 1);
alias  out_int_grpB      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(8 DOWNTO 5);
alias  out_int_grpC      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(12 DOWNTO 9);
alias  out_int_grpD      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(16 DOWNTO 13);
alias  out_int_grpE      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(20 DOWNTO 17);
alias  out_int_grpF      : STD_LOGIC_VECTOR(4 DOWNTO 1) is outx_int(24 DOWNTO 21);

begin

    --no usage as for now
    status   <= (others => '0');
    
    --for diag through wifi

    --for testing use '0'
    spo_int <= spo; --'0';   --in real life do affect it to spo
    
    do(8 downto 5) <= "ZZZZ";
    dldir          <= dldir_int;
    
    --do(4 downto 1) <= not nDO_int when dldir_int = cSetDataLOut else
    do(4 downto 1) <= not nDO_int when dldir_int = cSetDataLOut else
                      "ZZZZ";
   
    outx           <= outx_int;
    
    
process_cmd:    process(hiclk)
        variable last_pps4    : pps4_ph_type := idlexx;
        variable isIOSel      : boolean := false;
        variable IOCmd_11696  : std_logic_vector(4 downto 1);
        variable samplegrps   : std_logic_vector(4 downto 1) := "0000";
    begin
        if (rising_edge(hiclk)) then
             
            --during reset, do nothing, stay in hi-Z on ID bus
			if spo_int = '1' then --SPO is maintained by master device to -12V for 100ms min
				--do reset things
                dldir_int            <= not cSetDataLOut;
                nDO_int (4 downto 1) <= "ZZZZ";
                --outx_int             <= (others => '1');
                outx_int             <= (others => '0');
            -- end of SPO = 1 			
			else
			    -- no need for handling metastability here
			    -- because it should be managed at root, in clkgen.
				if last_pps4 /= pps4_phi then
				-- change of phase
					case pps4_phi is
						when phi1A =>
                            dldir_int <= not cSetDataLOut;
							if wio = '1' then
							     -- is it us?
							     if ( id(8 downto 5) = (sc4&sc3&sc2&sc1) ) then
									 IOCmd_11696 := id(4 downto 1);	 --see table in datasheet								
							         isIOSel := true;
							     else
							         isIOSel := false;
							     end if;
							else
							     isIOSel := false;
							end if;

						when phi2 =>
						    -- we are to send data to accumulator
                            if (isIOSel) then
                                case IOCmd_11696 is
                                    when "0000" | "1000" =>
                                        --0: group A write case, phase reading previous state
                                        --8: group A read case, current state
                                        nDO_int (4 downto 1) <=  in_grpA;
                                    when "0001" | "1001"  =>
                                        --1: group B write case, phase reading previous state
                                        --9: group B read case, current state
                                        nDO_int (4 downto 1) <=  in_grpB;
                                    when "0010" | "1010"   =>
                                        --2: group C write case, phase reading previous state
                                        --A: group C read case, current state
                                        nDO_int (4 downto 1) <=  in_grpC;
                                    when "0011" | "1111"   =>
                                        --3: group D write case, phase reading previous state
                                        --F: group D read case, current state
                                        nDO_int (4 downto 1) <=  in_grpD;
                                    when "0100" | "1100"  =>
                                        --4: group E write case, phase reading previous state
                                        --C: group E read case, current state
                                        nDO_int (4 downto 1) <=  in_grpE;
                                    when "0101" | "1101"  =>
                                        --5: group F write case, phase reading previous state
                                        --D: group F read case, current state
                                        nDO_int (4 downto 1) <=  in_grpF;
                                    when "0110"   =>
                                        --(6) This is the bit set command
                                        case  not ID(8 downto 5) is
                                            when "1111"   =>
                                                --GRP A bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "1110"   =>
                                                --GRP A bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "1101"   =>
                                                --GRP A bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "1100"   =>
                                                --GRP A bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "1011"   =>
                                                --GRP B bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "1010"   =>
                                                --GRP B bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "1001"   =>
                                                --GRP B bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "1000"   =>
                                                --GRP B bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "0111"   =>
                                                --GRP C bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "0110"   =>
                                                --GRP C bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "0101"   =>
                                                --GRP C bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "0100"   =>
                                                --GRP C bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "0011"   =>
                                                --GRP D bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "0010"   =>
                                                --GRP D bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "0001"   =>
                                                --GRP D bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "0000"   =>
                                                --GRP D bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when others   =>
                                                nDO_int (4 downto 1) <= "0000";
                                        end case;
                                    when "1011"   =>
                                        --(B) This is the bit reset command
                                        case  not ID(8 downto 5) is
                                            when "1111"   =>
                                                --GRP A bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "1110"   =>
                                                --GRP A bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "1101"   =>
                                                --GRP A bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "1100"   =>
                                                --GRP A bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "1011"   =>
                                                --GRP B bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "1010"   =>
                                                --GRP B bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "1001"   =>
                                                --GRP B bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "1000"   =>
                                                --GRP B bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "0111"   =>
                                                --GRP C bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "0110"   =>
                                                --GRP C bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "0101"   =>
                                                --GRP C bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "0100"   =>
                                                --GRP C bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when "0011"   =>
                                                --GRP D bit #0
                                                nDO_int (4 downto 1) <= "0001";
                                            when "0010"   =>
                                                --GRP D bit #1
                                                nDO_int (4 downto 1) <= "0010";
                                            when "0001"   =>
                                                --GRP D bit #2
                                                nDO_int (4 downto 1) <= "0100";
                                            when "0000"   =>
                                                --GRP D bit #3
                                                nDO_int (4 downto 1) <= "1000";
                                            when others   =>
                                                nDO_int (4 downto 1) <= "1111";
                                        end case;

                                    when others   =>
                                        nDO_int (4 downto 1) <= "1111";
                                end case;   --end case command code
                                 
    
                                dldir_int <= cSetDataLOut;
                            else      --isIOSel is not
                                dldir_int <= not cSetDataLOut;                            
                            end if;
                        						    
						    			    						    
						    
						when phi3A =>
						    --apply the command
                            if (isIOSel) then
                                case IOCmd_11696 is
                                    when "0000"   =>
                                        --set group A
                                        --it is (not ID), because we reaa directly from data bus
                                        --And IOL commands put /A on data bus
                                        out_int_grpA <=  not ID(8 downto 5);
                                    when "0001"   =>
                                        --set group B
                                        out_int_grpB <=  not ID(8 downto 5);
                                        --return old values:
                                        --no need here, because we are just reading
                                        --because real 11696 is still in place
                                        --we just want to chineese copy its state
                                    when "0010"   =>
                                        --set group C
                                        out_int_grpC <=  not ID(8 downto 5);
                                        --return old values:
                                        --no need here, because we are just reading
                                        --because real 11696 is still in place
                                        --we just want to chineese copy its state
                                    when "0011"   =>
                                        --set group D (sound group)
                                        out_int_grpD <= not ID(8 downto 5);
                                        --return old values:
                                        --no need here, because we are just reading
                                        --because real 11696 is still in place
                                        --we just want to chineese copy its state
                                    when "0100"   =>
                                        --set group E 
                                        out_int_grpE <= not ID(8 downto 5);
                                        --return old values:
                                        --no need here, because we are just reading
                                        --because real 11696 is still in place
                                        --we just want to chineese copy its state
                                    when "0101"   =>
                                        --set group F 
                                        out_int_grpF <= not ID(8 downto 5);
                                        --return old values:
                                        --no need here, because we are just reading
                                        --because real 11696 is still in place
                                        --we just want to chineese copy its state
                                    when "0110"   =>
                                         --(6) This is the bit set command
                                        --it is (not ID), because we reaa directly from data bus
                                        --And IOL commands put /A on data bus
                                       case  not ID(8 downto 5) is
                                            when "1111"   =>
                                                --GRP A bit #0
                                                out_int_grpA(1) <= '1';
                                            when "1110"   =>
                                                --GRP A bit #1
                                                out_int_grpA(2) <= '1';
                                            when "1101"   =>
                                                --GRP A bit #2
                                                out_int_grpA(3) <= '1';
                                            when "1100"   =>
                                                --GRP A bit #3
                                                out_int_grpA(4) <= '1';
                                            when "1011"   =>
                                                --GRP B bit #0
                                                out_int_grpB(1) <= '1';
                                            when "1010"   =>
                                                --GRP B bit #1
                                                out_int_grpB(2) <= '1';
                                            when "1001"   =>
                                                --GRP B bit #2
                                                out_int_grpB(3) <= '1';
                                            when "1000"   =>
                                                --GRP B bit #3
                                                out_int_grpB(4) <= '1';
                                            when "0111"   =>
                                                --GRP C bit #0
                                                out_int_grpC(1) <= '1';
                                            when "0110"   =>
                                                --GRP C bit #1
                                                out_int_grpC(2) <= '1';
                                            when "0101"   =>
                                                --GRP C bit #2
                                                out_int_grpC(3) <= '1';
                                            when "0100"   =>
                                                --GRP C bit #3
                                                out_int_grpC(4) <= '1';
                                            when "0011"   =>
                                                --GRP D bit #0
                                                out_int_grpD(1) <= '1';
                                            when "0010"   =>
                                                --GRP D bit #1
                                                out_int_grpD(2) <= '1';
                                            when "0001"   =>
                                                --GRP D bit #2
                                                out_int_grpD(3) <= '1';
                                            when "0000"   =>
                                                --GRP D bit #3
                                                out_int_grpD(4) <= '1';
                                            when others   =>
                                                null;
                                        end case;
                                        
                                     when "1011"   =>
                                         --(B) This is the bit reset command
                                       case  not ID(8 downto 5) is
                                            when "1111"   =>
                                                --GRP A bit #0
                                                out_int_grpA(1) <= '0';
                                            when "1110"   =>
                                                --GRP A bit #1
                                                out_int_grpA(2) <= '0';
                                            when "1101"   =>
                                                --GRP A bit #2
                                                out_int_grpA(3) <= '0';
                                            when "1100"   =>
                                                --GRP A bit #3
                                                out_int_grpA(4) <= '0';
                                            when "1011"   =>
                                                --GRP B bit #0
                                                out_int_grpB(1) <= '0';
                                            when "1010"   =>
                                                --GRP B bit #1
                                                out_int_grpB(2) <= '0';
                                            when "1001"   =>
                                                --GRP B bit #2
                                                out_int_grpB(3) <= '0';
                                            when "1000"   =>
                                                --GRP B bit #3
                                                out_int_grpB(4) <= '0';
                                            when "0111"   =>
                                                --GRP C bit #0
                                                out_int_grpC(1) <= '0';
                                            when "0110"   =>
                                                --GRP C bit #1
                                                out_int_grpC(2) <= '0';
                                            when "0101"   =>
                                                --GRP C bit #2
                                                out_int_grpC(3) <= '0';
                                            when "0100"   =>
                                                --GRP C bit #3
                                                out_int_grpC(4) <= '0';
                                            when "0011"   =>
                                                --GRP D bit #0
                                                out_int_grpD(1) <= '0';
                                            when "0010"   =>
                                                --GRP D bit #1
                                                out_int_grpD(2) <= '0';
                                            when "0001"   =>
                                                --GRP D bit #2
                                                out_int_grpD(3) <= '0';
                                            when "0000"   =>
                                                --GRP D bit #3
                                                out_int_grpD(4) <= '0';
                                            when others   =>
                                                null;
                                        end case;

                                    when others   =>
                                        null;
                                end case;   --end case command code
                                    
                            end if;
                                   
 
                        when phi3 =>
                            isIOSel := false;
                            dldir_int <= not cSetDataLOut;
                            nDO_int (4 downto 1) <= "ZZZZ";
						when phi4 =>
                            dldir_int <= not cSetDataLOut;
                            nDO_int (4 downto 1) <= "ZZZZ";
						when others =>
                            dldir_int <= not cSetDataLOut;
                            nDO_int (4 downto 1) <= "ZZZZ";
        			end case;
				-- end change of phase
				end if;
				last_pps4 := pps4_phi;				

            -- end of SPO = 0 						
			end if; 
        end if;
    end process process_cmd;
       
end Behavioral;
