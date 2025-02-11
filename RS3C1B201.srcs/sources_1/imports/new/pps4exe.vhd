----------------------------------------------------------------------------------  
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2024 22:28:01
-- Design Name: 
-- Module Name: pps4reset - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
library UNISIM;
use UNISIM.VComponents.all;

use work.common.all;
use work.libpps4.all;
use work.liberr.all;    -- list of error codes
use work.libfram.all;    -- list of error codes

use work.libpps4exec.all;

entity pps4_exe is
    Port ( 
          hiclk        : in    STD_LOGIC;
          spo          : in    STD_LOGIC;
          pps4_phi     : in    pps4_ph_type;
          pc           : out   STD_LOGIC_VECTOR (12 downto 1);
          SA           : out   STD_LOGIC_VECTOR (12 downto 1);
          SB           : out   STD_LOGIC_VECTOR (12 downto 1);
          A            : inout STD_LOGIC_VECTOR (4  downto 1);
          B            : inout STD_LOGIC_VECTOR (12 downto 1);
          X            : inout STD_LOGIC_VECTOR (4  downto 1);
          C            : inout std_logic;
          FF1          : inout std_logic;
          FF2          : inout std_logic;
          din          : in    STD_LOGIC_VECTOR (8  downto 1);
          doa          : out   STD_LOGIC_VECTOR (4  downto 1);
          dia          : in    STD_LOGIC_VECTOR (4  downto 1);
          dio          : inout STD_LOGIC_VECTOR (4  downto 1);
          cur_inst     : out   STD_LOGIC_VECTOR (8  downto 1);
          cur_inst_ph  : out   std_logic  --for IOL, SAG management
          );
end pps4_exe;

architecture Behavioral of pps4_exe is
signal din_phi4       : std_logic_vector (8 downto 1) := (others=>'0');
signal din_phi2       : std_logic_vector (4 downto 1) := (others=>'0');

signal wio_phi4       : std_logic := '0';
signal sag_phi2       : std_logic := '0';
signal skip_next      : boolean := false;

signal curmnemonic    : std_logic_vector (8 downto 1) := (others=>'0');
signal lastmnemonic   : std_logic_vector (8 downto 1) := (others=>'0');

--in which phase of an instruction are we? 
--  0: mnemonic of cur instruction was just read
--  1: this is the I2 phase of a 2 cycle instruction
signal curinstphase   : std_logic := '0';



signal pc_int         : std_logic_vector (12 downto 1);
alias  pc_int_hi      : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc_int(12 DOWNTO 7);
alias  pc_hi          : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
alias  pc_int_lo      : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc_int(6 DOWNTO 1);
alias  pc_lo          : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);

signal sa_int         : std_logic_vector (12 downto 1);
signal sb_int         : std_logic_vector (12 downto 1);


begin
    --2 following to be used by parent entity to determine SAG, IOL situations
    cur_inst_ph    <= curinstphase;
    cur_inst       <= curmnemonic;
    
    pc       <= pc_int;
    SA       <= sa_int;
    SB       <= sb_int;
    
    process(hiclk)
        variable    lastpps4_phi   : pps4_ph_type := idlexx;
        variable    reset_delayer  : integer range 0 to 100 := 20;
        variable    is2ndPartInst  : boolean := false;
        --The CPU releases SPO in sync with Phi2, to allow periph to start working there (fetch address)
        --But the cpu must wait until next cycle before handling data
        --Hence this flag to control this.
        variable    resetcpudelay  : integer range 0 to 10  := 1;
    begin
        if rising_edge(hiclk) then    
            if spo = '1' then 
                --test
                --pc_int <= X"700";
                pc_int <= (others => '0');
                resetcpudelay := 1;
            else
                if lastpps4_phi /= pps4_phi then
                    case pps4_phi is
                        when phi1A    =>
                            --read instruction
                            din_phi4 <= din;
 
 
                        when phi1     =>
                            if resetcpudelay = 0 then
                                --let's execute the instruction
                                --we do that now because at phi1, din_phi4 
                                --has already been collected, but not din_phi2
                                if not is2ndPartInst then
                                    curinstphase <= '0';
                                    --A skip instruction is always a 1 cycl instruction
                                    --so that we always enter the previous if
                                    --A skip instruction behaves like this:
                                    --    if skip is true
                                    --    then execute next byte as a nop
                                    --In conclusion a 2 cycl instruction after a skip is
                                    --a construction to be avoided since the second
                                    --part of it will be executed as an instruction...
                                    if skip_next = true then
                                        --skip_next <= false;
                                        pc_int_lo <= std_logic_vector( unsigned(pc_int_lo) + 1 );
                                        --and do nothing
                                    else
                                        parseInstPhi1(din_phi4,
                                                  pc_int,
                                                  sa_int, sb_int);
                                        curmnemonic  <= din_phi4;
                                        lastmnemonic <= curmnemonic;
                                        --shall we wait for a second part of inst
                                        --is2ndPartInst := is2inst(din_phi4); 
                                    end if;
                                else -- second part of a 2 cycl instruction (is2ndPartInst is true)
                                    curinstphase <= '1';
                                    parse2ndpartPhi1(din_phi4,
                                              curmnemonic, 
                                              pc_int,
                                              sa_int, sb_int
                                              );
                                    --next word read will be an instruction begining
                                    --is2ndPartInst := false; 
                                end if;
                                --next is done in phi3
--                            else
--                                --delay after reset to let periph to start giving their reply
--                                resetcpudelay := resetcpudelay - 1;
                            end if;
                                                               

                        when phi3A    =>
                            --read current ram content
                            din_phi2 <= din(4 downto 1);





                        when phi3     =>
                            if resetcpudelay = 0 then
                                --let's execute the instruction
                                --we do that now because at phi3, din_phi4 and din_phi2
                                --have already been collected
                                if curinstphase = '0' then
                                    curinstphase <= '0';
                                    --A skip instruction is always a 1 cycl instruction
                                    --so that we always enter the previous if
                                    --A skip instruction behaves like this:
                                    --    if skip is true
                                    --    then execute next byte as a nop
                                    --In conclusion a 2 cycl instruction after a skip is
                                    --a construction to be avoided since the second
                                    --part of it will be executed as an instruction...
                                    if skip_next = true then
                                        skip_next <= false;
                                        --and do nothing
                                    else
                                        parseInstPhi3(din_phi4, lastmnemonic, din_phi2, 
                                                  sa_int,
                                                  A, B, X,
                                                  C, FF1, FF2,
                                                  doa,
                                                  dia, dio,
                                                  skip_next);
                                        --curmnemonic  <= din_phi4;
                                        --lastmnemonic <= curmnemonic;
                                        --shall we wait for a second part of inst
                                        is2ndPartInst := is2inst(din_phi4); 
                                    end if;
                                else -- second part of a 2 cycl instruction (is2ndPartInst is true)
                                    -- here: curinstphase = '1';
                                    parse2ndpartPhi3(din_phi4, din_phi2,
                                              curmnemonic, 
                                              lastmnemonic,
                                              sa_int,
                                              A, B, X,
                                              C, FF1, FF2,
                                              doa,
                                              dia, dio,
                                              skip_next);
                                              
                                    --next word read will be an instruction begining
                                    is2ndPartInst := false; 
                                end if;
                            else
                                --delay after reset to let periph to start giving their reply
                                resetcpudelay := resetcpudelay - 1;
                            end if;
                                                        
                         when others  =>
                            null;
                    end case;
                end if;
                lastpps4_phi := pps4_phi;
            end if;
        end if;   
    end process;

end Behavioral;
