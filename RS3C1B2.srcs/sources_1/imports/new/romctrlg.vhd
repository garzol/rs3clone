----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 12:59:45
-- Design Name: 
-- Module Name: romctrlg - Behavioral
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
-- Requires VHDL-2008 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 21:52:54
-- Design Name: 
-- Module Name: romctrlg - Behavioral
-- Project Name: 
-- Target Devices: A1762 Plus exclusively
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created derived from ramctrl
-- Additional Comments:
-- This model is made for recel sys 3 MPUs
-- The A10738s+1702 must be removed
-- In replacement this A1762+ must be installed
-- A special socket must be installed
-- pin 24 (AB11) was removed and shall be connected to system bus AB12
-- in order for the clone to detect accesses to the 1702 (beyond 800)
-- So the logic for the A1762 clone is as follows:
-- if RRSEL = 1 ==> then access to the A1762 ROM and ignore AB11 input which is actually AB12, 
--                  but must be read as 0 in that case
-- if RRSEL = 0 and AB11(of the A17, but system AB12)=1
--              ==> then access to the 1702 zone 8xx
-- The coef file shall correspond to the given game
-- can be extracted from the 1702, but with the double
-- inversion as explained on the github (reversed address, inverted data byte)
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

use work.libpps4.all;
use work.libfram.all;    -- list of error codes and command codes

entity romctrlg is
    generic (
           g_ref         : natural  := 16#53CD#
    );
    Port (
           hiclk            : in        STD_LOGIC;
           spo              : in        STD_LOGIC;
           pps4_phi         : in        pps4_ph_type;        
           rrsel            : in        std_logic;
           ab               : in        STD_LOGIC_VECTOR (11 downto 1);
           dout             : out       STD_LOGIC_VECTOR (8 downto 1);
           cs               : in        std_logic;  --cs => g_ROMSEL
           
           r_device         : in        std_logic_vector(1 downto 0);   -- game=00, A1762=01
           
           -- makes the courroie de transmission between i2C module and nvram owner                  
           en8              : in        std_logic;
           we8              : in        STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr8            : in        std_logic_vector(10 downto 0);                   
           dout8            : out       std_logic_vector(7  downto 0);   
           din8             : in        std_logic_vector(7  downto 0)

          );
end romctrlg;

architecture Behavioral of romctrlg is



signal nDO_int                  : std_logic_vector(8 downto 1):= (others=>'Z');

signal ROM_Addr_Latch           : std_logic_vector (10 downto 0);
signal ROM_DOUT                 : STD_LOGIC_VECTOR(8 DOWNTO 1);

signal GROM_DOUT                : STD_LOGIC_VECTOR(8 DOWNTO 1);

signal is_ROM_Device_On      : STD_LOGIC :='0';
signal is_GAMEPROM_Device_On : STD_LOGIC :='0';


--management of reprogs
signal bck_we_g              : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal bck_we_r              : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal GAME1702_addr         : STD_LOGIC_VECTOR(9 DOWNTO 0);
--
signal ROMA1762_addr         : STD_LOGIC_VECTOR(9 DOWNTO 0);

--signals for working with nvram controller
--signal r_device           : std_logic_vector(1 downto 0)  := "00";

--signals for the general reset of mem
--signal rst_mem               : std_logic := '0';
--signal rst_sig               : std_logic := '0';
--signal rsta_busy             : std_logic := '0';
--signal rst_addr              : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others=>'0');

--all possible types of rom here
COMPONENT A1752CFINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1752EFINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1753CEINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1753CDINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1761INTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1762INTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT A1762BINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
  );
END COMPONENT;
COMPONENT A1762PINTERNROM
  PORT (
    clka : IN STD_LOGIC;
    --rsta : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    --rsta_busy : OUT STD_LOGIC 
  );
END COMPONENT;
COMPONENT GAMEPROM
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
COMPONENT GAMEPROM_CR
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
--this one is a RAM block with fair fight data initialization
COMPONENT GAMEPROM_RAM
  PORT (
    clka : IN STD_LOGIC;
    --rsta : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

--this one for big game roms
COMPONENT GAMEPROM1K_RAM
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
  );
END COMPONENT;

--next  lines to avoid pointless warnings about black boxes (advice from https://www.xilinx.com/support/answers/9838.html)
attribute box_type : string; 
attribute box_type of A1752CFINTERNROM : component is "black_box"; 
attribute box_type of A1752EFINTERNROM : component is "black_box"; 
attribute box_type of A1753CDINTERNROM : component is "black_box"; 
attribute box_type of A1753CEINTERNROM : component is "black_box"; 
attribute box_type of A1761INTERNROM   : component is "black_box"; 
attribute box_type of A1762INTERNROM   : component is "black_box"; 
attribute box_type of A1762BINTERNROM  : component is "black_box"; 
attribute box_type of A1762PINTERNROM  : component is "black_box"; 
attribute box_type of GAMEPROM         : component is "black_box"; 
attribute box_type of GAMEPROM_CR      : component is "black_box"; 
attribute box_type of GAMEPROM_RAM     : component is "black_box"; 
attribute box_type of GAMEPROM1K_RAM   : component is "black_box"; 

begin

     -- permanent affectations
     dout      <= nDO_int;
     
     --either standard address coming from ab, or bckdr_addr if reprog mode
     GAME1702_addr   <=  ROM_Addr_Latch(9 downto 0)     when spo = '0' else
                         addr8(9 downto 0);
     --either standard address coming from ab, or bckdr_addr if reprog mode
     ROMA1762_addr   <=  ROM_Addr_Latch(9 downto 0)     when spo = '0' else
                         addr8(9 downto 0);
     --gameprom we control
     --bck_we_g        <= we8 when en8 = '1' and spo = '1' and  r_device = "00" else
     bck_we_g        <= we8 when en8 = '1' and  r_device = "00" else
                        "0";
     --OS prom we control
     --bck_we_r        <= we8 when en8 = '1' and spo = '1' and  r_device = "01" else
     bck_we_r        <= we8 when en8 = '1' and  r_device = "01" else
                        "0";
     --gameprom dout control to external world
     dout8           <= GROM_DOUT when r_device = "00" else
                        ROM_DOUT;
                        
                                            
     --will require vhdl-2008
     gc : case g_ref generate
        when 16#52EF#       =>
             CFROM : A1752EFINTERNROM PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#53CE#       =>
             CFROM : A1753CEINTERNROM PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#53CD#       =>
             CFROM : A1753CDINTERNROM PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#61#       =>
             CFROM : A1761INTERNROM   PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#62#       =>
             CFROM : A1762INTERNROM   PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#62B#      =>
             CFROM : A1762BINTERNROM  PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(9 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#FFE#      =>
             CFROM : A1762BINTERNROM  PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(9 downto 0), 
                                        douta    => ROM_DOUT);
        when 16#FFF#      =>
             CFROM : A1762PINTERNROM  PORT MAP (
                                        clka      => hiclk,
                                        --rsta      => '0',
                                        wea       => bck_we_r,
                                        addra     => ROMA1762_addr, 
                                        dina      => din8,
                                        douta     => ROM_DOUT);
        when others         =>
             CFROM : A1752CFINTERNROM PORT MAP (
                                        clka     => hiclk,
                                        addra    => ROM_Addr_Latch(10 downto 0), 
                                        douta    => ROM_DOUT);
     end generate gc;


     --will require vhdl-2008
     gg : case g_ref generate
        when 16#62B#      =>
             --crazy race
             GAME1702      : GAMEPROM_CR      PORT MAP (
                                                clka     => hiclk,
                                                addra    => ROM_Addr_Latch(7 downto 0), 
                                                douta    => GROM_DOUT);

        when 16#FF0#      =>   --ex 16#FFF#
             --programmable version
             GAME1702      : GAMEPROM_RAM     PORT MAP (
                                                clka      => hiclk,
                                                --rsta      => rst_sig,
                                                wea       => bck_we_g,
                                                addra     => GAME1702_addr(7 downto 0), 
                                                dina      => din8, --bckdr_tx_byte,
                                                douta     => GROM_DOUT);

        when 16#FFF#      =>
             --programmable version
             GAME1702      : GAMEPROM1K_RAM   PORT MAP (
                                                clka      => hiclk,
                                                --rsta      => rst_sig,
                                                wea       => bck_we_g,
                                                addra     => GAME1702_addr, 
                                                dina      => din8, --bckdr_tx_byte,
                                                douta     => GROM_DOUT);


        when others       =>
             --fair fight
             GAME1702      : GAMEPROM         PORT MAP (
                                                clka     => hiclk,
                                                addra    => ROM_Addr_Latch(7 downto 0), 
                                                douta    => GROM_DOUT);
    end generate gg;

    
    process(hiclk)
        variable lastpps4_phi      : pps4_ph_type := idlexx;
        
    begin
        if rising_edge(hiclk) then
            if spo = '1' then           --if reset
                --reset branch
                is_ROM_Device_On      <= '0';
                is_GAMEPROM_Device_On <= '0';
                nDO_int          <= (others=>'Z');
                
                    
            else                        --if not reset
            --not reset branch
            
            --state machine execution, based on phases of clka/clkb
                if lastpps4_phi /= pps4_phi then
                    case pps4_phi is
                        when phi1A  =>
                            is_ROM_Device_On      <= '0'; --next clock this signal will be unconditionnaly reset
                            is_GAMEPROM_Device_On <= '0';                         
                        when phi1   =>
                            nDO_int <= (others => 'Z'); --bus data is hiz during phi1 (and also phi3)
                            
                        when phi2   =>
                            nDO_int <= (others=>'Z');
                            
                        when phi3A  =>
                            nDO_int <= (others=>'Z');
                            --ROM_Addr_Latch <= ab;
                            --on the A1762 AB11 is originally tied 
                            --to 0
                            --but on the clone we connect this pin to AB12 instead
                            --so on the ROM or on the GAME PROM, base address is in ab(10..1)
                            ROM_Addr_Latch <= '0'&ab(10 downto 1);
                            if cs = rrsel then
                                --on recel sys3 rrsel of A1762 is connected to AB11 of pps4 address bus
                                --this is the rom of the A17
                                is_ROM_Device_On      <= '1';
                                is_GAMEPROM_Device_On <= '0';	
                            elsif ab(11) = '1' then
                                --/!\ WARNING ab(11) is not really ab(11)
                                --it is expected here that a special socket is installed
                                --whose ab11 pin is not connected to the pcb, but to a wire
                                --which shall go to the bus address AB12 (yes, 12)
                                --this is to be able to detect the addressing of the A1702 and emulate it
                                --then one can remove both 10738 and true 1702 at once!
                                is_ROM_Device_On      <= '0';
                                is_GAMEPROM_Device_On <= '1';	                            		
                            else 
                                is_ROM_Device_On      <= '0';	
                                is_GAMEPROM_Device_On <= '0';			
                            end if;
        
                        when phi3   =>
                            nDO_int <= (others=>'Z');
                        
                        when phi4   =>
                            --A17 push rom data on the bus from begin of phi4 thru end of phi1A
                            if (is_ROM_Device_On = '1') then
                                nDO_int <= ROM_DOUT; -- expose rom values as input of iobufs
                                --this value set continues in phi1A. bus will be deactivated in phi1
                            elsif (is_GAMEPROM_Device_On = '1') then
                                nDO_int <= GROM_DOUT; -- expose rom values as input of iobufs
                            else
                                nDO_int <= (others=>'Z');
                            end if;
                        when others =>
                            nDO_int <= (others => 'Z'); --bus data is hiz during phi1 (and also phi3)
                    end case;
                end if;                 --end if pps4_phi changed
                lastpps4_phi := pps4_phi;
            end if;                     --end if reset else
        end if;                          --end if rising_edge
    end process;
     
--p_reprog: process(hiclk)
--        variable last_bckdr_rx_req : std_logic := '0';
--        variable last_bckdr_tx_req : std_logic := '0';
--        variable last_bckdr_fl_req : std_logic := '0';
--        variable state             : integer range 0 to 63   := 0;

--    begin
--        if rising_edge(hiclk) then
--            if spo = '1' then           --if reset
--                case state is 
--                    when 0 =>
--                        if bckdr_rx_req = '1' and last_bckdr_rx_req = '0' then
--                            --read ram byte
--                            r_device      <= r_device;
--                            bd_addr       <= bckdr_addr;    
--                            start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                            nvr_cmd       <= cFramBufRead;  --read byte
--                            state := 2;
--                        elsif bckdr_tx_req = '1' and last_bckdr_tx_req = '0' then
--                            r_device      <= r_device;
--                            bd_addr       <= bckdr_addr;    
--                            bd_din        <= bckdr_tx_byte;
--                            start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                            nvr_cmd       <= cFramBufWrite;  --write byte
--                            state := 1;
--                        elsif bckdr_fl_req = '1' and last_bckdr_fl_req = '0' then
--                            r_device      <= r_device;
--                            r_size_int    <= to_unsigned(1024, r_size_int'length);       --block size to be transferred
--                            case r_device is
--                                when "00"   =>
--                                    r_baseAddr_int <= cIICGameRBase;   --base address in the fram                        
--                                when "01"   =>
--                                    r_baseAddr_int <= cIICA1762Base;   --base address in the fram                        
--                                when others =>
--                                    r_baseAddr_int <= cIICGameRBase;   --base address in the fram                        
--                            end case;
                            
--                            start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                            nvr_cmd       <= cFramWrite;  --write all
--                            state := 1;                                
--                        end if;
--                        last_bckdr_rx_req := bckdr_rx_req;
--                        last_bckdr_tx_req := bckdr_tx_req;
--                        last_bckdr_fl_req := bckdr_fl_req;
--                    when 1 =>
--                        start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                        state := 10;        --end of the story
--                    when 2 =>
--                        start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                        state := 3;
--                    when 3 =>
--                        if  is_nvr_cmd_done = '1' then
--                            state := 4;
--                            bckdr_rx_byte <= bd_dout;
--                            bckdr_rx_dv_int   <= '1';                                    
--                        end if;
--                    when 4 => 
--                        bckdr_rx_dv_int   <= '0';       
--                        state := 0;                             
--                        nvr_cmd <= cFramNop;
                        
--                    when others =>
--                        if  is_nvr_cmd_done = '1' then
--                            state := 0;
--                            nvr_cmd <= cFramNop;
--                        end if;
--                    end case;
--                end if;
            
--        end if;
--    end process p_reprog;
    
   
end Behavioral;


