----------------------------------------------------------------------------------
-- 
-- Company: 
-- Engineer: phd
-- 
-- Create Date: 03.11.2023 21:50:41
-- Design Name: 
-- Module Name: pps4tracer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

use work.libpps4.all;
use work.liberr.all;    -- list of error codes
use work.libfram.all;    -- list of error codes


entity pps4Core is 
    Port (
          hiclk        : in     STD_LOGIC;
          po           : in     STD_LOGIC;    --0: run, 1: reset the cpu
          spo          : out    STD_LOGIC;
          nckb         : out    STD_LOGIC;
          cka          : out    STD_LOGIC;
          pps4_phi     : out    pps4_ph_type;
          ab           : out    STD_LOGIC_VECTOR (12 downto 1);
          din          : in     STD_LOGIC_VECTOR (8 downto 1);
          dout         : out    STD_LOGIC_VECTOR (8 downto 1);
          wio          : out    STD_LOGIC;
          doa          : out    STD_LOGIC_VECTOR (4 downto 1);
          dia          : in     STD_LOGIC_VECTOR (4 downto 1);
          dio          : inout  STD_LOGIC_VECTOR (4 downto 1)
          );

end pps4Core;

architecture Behavioral of pps4Core is


component mak_ckab
  Port ( c_a : out  STD_LOGIC;
         nc_b : out  STD_LOGIC;
         SYSCLK : in  STD_LOGIC;
         rst : in  STD_LOGIC);
end component;

-- generate phases from clockA and B
component clkgen 
    Port ( hiclk   : in  STD_LOGIC;
	       c_a     : in  STD_LOGIC;
           nc_b    : in  STD_LOGIC;
           nrst    : in  STD_LOGIC;
           pps4_ph : out  pps4_ph_type;
		   diagclk : out  STD_LOGIC);
end component;


           

component pps4_exe
    Port (
          hiclk        : in    STD_LOGIC;
          spo          : in    STD_LOGIC;
          pps4_phi     : in    pps4_ph_type;
          pc           : out STD_LOGIC_VECTOR (12 downto 1);
          sa           : out   STD_LOGIC_VECTOR (12 downto 1);
          sb           : out   STD_LOGIC_VECTOR (12 downto 1);
          A            : inout STD_LOGIC_VECTOR (4  downto 1);
          B            : inout STD_LOGIC_VECTOR (12 downto 1);
          X            : inout STD_LOGIC_VECTOR (4  downto 1);
          C            : inout std_logic;
          FF1          : inout std_logic;
          FF2          : inout std_logic;
          din          : in    STD_LOGIC_VECTOR (8 downto 1);
          doa          : out   STD_LOGIC_VECTOR (4 downto 1);
          dia          : in    STD_LOGIC_VECTOR (4 downto 1);
          dio          : inout STD_LOGIC_VECTOR (4 downto 1);
          cur_inst     : out   STD_LOGIC_VECTOR (8  downto 1);
          cur_inst_ph  : out   std_logic  --for IOL management
          );
end component;

component pps4_reset
    Port ( 
           hiclk       : in     STD_LOGIC;
           po          : in     STD_LOGIC;
           spo         : out    STD_LOGIC;
           pps4_phi    : in     pps4_ph_type);
end component;




signal diagAnB  : STD_LOGIC := '0'; 
signal ErrCod   : std_logic_vector(7 downto 0) := (others=>'0');

signal UserCod   : std_logic_vector(7 downto 0) := (others=>'0');

signal tracer_status    : std_logic_vector(7 downto 0);

--signals for working with iic
signal is_cmd_done      : std_logic;  --value set by iic driver (1 at the begining)
signal start_nvr_cmd    : std_logic := '0';
signal nvr_cmd          : std_logic_vector(1 downto 0) := "00";
signal cur_nvram_nibble : std_logic_vector(3 downto 0);
signal cur_nvram_addr   : natural range 0 to 127;

--signals for IOs management
signal InpX_int          : std_logic_vector(15 downto 0) := (others => 'Z');
signal OutX_int          : std_logic_vector(15 downto 0) := (others => '1');





--for clock management
signal CKA_int      : std_logic;
signal nCKB_int     : std_logic;

--no more a signal, but a port for eventual client use
signal pps4_phi_int : pps4_ph_type;

--signals for internal relay
signal ab_int       : STD_LOGIC_VECTOR(12 DOWNTO 1);
signal SPO_int      : std_logic;

--pps-4 registers
signal A_reg        : STD_LOGIC_VECTOR(4 DOWNTO 1); 
signal X_reg        : STD_LOGIC_VECTOR(4 DOWNTO 1);

signal P_reg        : STD_LOGIC_VECTOR(12 DOWNTO 1);

signal B_reg        : STD_LOGIC_VECTOR(12 DOWNTO 1);  --B_reg
signal B_reg_int    : STD_LOGIC_VECTOR(12 DOWNTO 1);  --B_reg when out of reset
alias  BL           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                    is B_reg(4 DOWNTO 1);
alias  BM           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                    is B_reg(8 DOWNTO 5);
alias  BU           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                    is B_reg(12 DOWNTO 9);
                    
signal FF1_flag     : std_logic := '0';
signal FF2_flag     : std_logic := '0';
signal C_flag       : std_logic := '0';

signal SA_reg       : STD_LOGIC_VECTOR(12 DOWNTO 1);
signal SB_reg       : STD_LOGIC_VECTOR(12 DOWNTO 1);

--signals for wio management. cur_inst==1C ? or SAG management
signal cur_inst     : STD_LOGIC_VECTOR(8 DOWNTO 1);
signal cur_inst_ph  : STD_LOGIC;

--signal provisory for test
signal PO_int       : std_logic; -- := '0';   --will test this later. (active high)
                
begin
    
    --as the cpu, we are the master of clocks
    --and we are to generate them
    cka  <= not CKA_int;  --tbc it is not and not not
    nckb <= not nCKB_int; --tbc as as well
    
    spo     <= SPO_int;
    PO_int  <= po;
    
    ab   <= ab_int;
    
    pps4_phi <= pps4_phi_int;
    
    --cpu never writes on D1:D4
    dout(4 downto 1) <= "ZZZZ";
    
  --for blank tests only
  mkab: mak_ckab port map ( c_a    => CKA_int,
                            nc_b   => nCKB_int,
                            SYSCLK => hiclk,
                            rst    =>  '1');
   --end of blank tests



                                             
      PPS4RESET : pps4_reset
                Port map (
                    hiclk    =>  hiclk,
                    po       =>  PO_int,
                    spo      =>  SPO_int,
                    pps4_phi =>  pps4_phi_int);
      

      PPS4EXE : pps4_exe    
                Port map (
                    hiclk    =>  hiclk,
                    spo      =>  SPO_int,
                    pps4_phi =>  pps4_phi_int,
                    pc       =>  P_reg,
                    sa       =>  SA_reg,
                    sb       =>  SB_reg,
                    A        =>  A_reg,
                    B        =>  B_reg_int,
                    X        =>  X_reg,
                    C        =>  C_flag,
                    FF1      =>  FF1_flag,
                    FF2      =>  FF2_flag,
                    din         =>  din,
                    doa         =>  doa,
                    dia         =>  dia,
                    dio         =>  dio,
                    cur_inst    =>  cur_inst,
                    cur_inst_ph =>  cur_inst_ph
                    );



     PHIGN : clkgen       port map (hiclk    => hiclk, 
                                     c_a      => CKA_int, 
                                     --c_a      => not CKA, 
                                     nc_b     => nCKB_int, 
                                     --nc_b     => not nCKB, 
                                     nrst     => '1', 
                                     pps4_ph  => pps4_phi_int, 
                                     diagclk  => diagAnB); 

                                     

     process(hiclk)
        variable    lastpps4_phi   : pps4_ph_type := idlexx;
        variable    lastdouthiphi2 : std_logic_vector(4 downto 1) := "0101";
    begin
        if rising_edge(hiclk) then   
            if SPO_int = '1' then 
                ab_int <= (others => '0');
                B_reg  <= (others => '0');
            else
                B_reg  <= B_reg_int;
                if lastpps4_phi /= pps4_phi_int then
                    case pps4_phi_int is
                        when phi1A    =>
                            null;
                            
                        when phi1    =>
                            ab_int <= (others => 'Z');
                            dout(8 downto 5) <= "ZZZZ";
                            wio    <= '0';
                        when phi2    =>
                            --In phi2, the D8:5 which is applied on ID bus
                            --is unchanged in general case
                            --or /A for IOL instruction
                            --or /A for memory instructions (EX, EXD)
                            --so we need the variable lastdouthiphi2
                            --to preserve the value when "no change"
                            ab_int <= P_reg;
                            dout(8 downto 5) <= not A_reg;
                            --check for IOL part 2/2 (1C)
                            if    cur_inst = "00011100" and cur_inst_ph = '1' then
                                --dout(8 downto 5) <= not A_reg;
                                lastdouthiphi2   := not A_reg;
                                wio    <= '0';
                            --check for EXD (28..2F) or EX (38..3F)
                            elsif cur_inst(8 downto 4) = "00101" or 
                                  cur_inst(8 downto 4) = "00111" then
                                --dout(8 downto 5) <= not A_reg;                            
                                lastdouthiphi2   := not A_reg;
                                wio    <= '1';
                            else
                                --No change on dout
                                --dout(8 downto 5) <= lastdouthiphi2;
                                wio    <= '0';
                            end if;
                            
--                        when phi3A   =>
--                            --check for IOL part 2/2 (1C)
--                            if cur_inst = "00011100" and cur_inst_ph = '1' then
--                                A_reg  <= not din(4 downto 1);
--                            --check for EXD (28..2F) or LD (30..37) or EX (38..3F)
--                            elsif cur_inst(8 downto 4) = "00101" or 
--                                  cur_inst(8 downto 4) = "00110" or 
--                                  cur_inst(8 downto 4) = "00111" then
--                                A_reg  <= din(4 downto 1);                            
--                            end if;
                        
                        when phi3    =>
                            ab_int <= (others => 'Z');
                            dout(8 downto 5) <= "ZZZZ";
                            wio    <= '0';
                        when phi4    =>
                            --check for SAG (13)
                            if cur_inst = "00010011" then
                                ab_int(12 downto 5) <= (others => '0');
                                ab_int( 4 downto 1) <= BL;                                
                            else
                                ab_int <= B_reg;
                            end if;
                            dout(8 downto 5) <= "ZZZZ";
                            --check for IOL part 1/2 (1C)
                            if cur_inst = "00011100" and cur_inst_ph = '0' then
                                wio    <= '1';
                            else
                                wio    <= '0';
                            end if;
                            
                        when others  =>
                            ab_int <= (others => 'Z');
                            dout(8 downto 5) <= "ZZZZ";
                            wio    <= '0';
                    end case;
                end if;
                lastpps4_phi := pps4_phi_int;
            
            end if;   
        end if;
    end process;

                                  
end Behavioral;
