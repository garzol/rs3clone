----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2024 18:57:04
-- Design Name: 
-- Module Name: hmsys - Behavioral
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
-- when areset is high, addresses are reset to 0
library UNISIM;
use UNISIM.VComponents.all;

use work.common.all;
use work.libfram.all;    -- list of error codes and command codes
--use work.libhmsys.all;

entity hmsys is
    Port (
           hiclk            : in        STD_LOGIC;
           spo              : in        STD_LOGIC; --this is the pps4 periph reset signal
           nEn              : in        std_logic;
           aClk             : in        STD_LOGIC;
           aReset           : in        STD_LOGIC; --this is line controlled by B1 to raz addresses of CD4040
           dout             : out       STD_LOGIC;
           din              : in        STD_LOGIC;
           
           -- makes the courroie de transmission between i2C module and nvram owner                  
           r_device         : in        std_logic_vector(1 downto 0); 
           en8              : in        std_logic;
           we8              : in        STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr8            : in        std_logic_vector(6 downto 0);                   
           dout8            : out       std_logic_vector(7  downto 0);   
           din8             : in        std_logic_vector(7  downto 0);
    
           wEn              : in        STD_LOGIC;
           serial_nb        : in        t_Serial
          );
end hmsys;


architecture Behavioral of hmsys is

COMPONENT CD4040
  PORT (
    CLK : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) 
  );
END COMPONENT;

--COMPONENT HM6508
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) 
--  );
--END COMPONENT;

component nvramMng 
            Port (
                   hiclk       : in     STD_LOGIC;
                                      
                   --r_device is required to determine which ram is concerned, among config, hmsys, miniprinter
                   --one can't just determine it from r_baseAddr range
                   --because miniprinter nvram may be used both for hmsys and miniprinter
                   --or not, so user of the entity must specify what they want
                   --r_size/r_baseAddr are no longer used in nvram since the split
                   --that intervened with multigame new design
                   --Thes values are now consumed by iicmanager
                   r_device    : in     std_logic_vector(1 downto 0); 
                   --r_size      : in     unsigned(7 downto 0);          --block size to be transferred
                   --r_baseAddr  : in     unsigned(15 downto 0); --base address in the fram

                   --dedicated to live hmsys ram r/w on the 1-bit bus
                   dina        : in     STD_LOGIC_VECTOR(0 DOWNTO 0);  --bit to read (live mode)
                   douta       : out    STD_LOGIC_VECTOR(0 DOWNTO 0);  --bit to read (live mode)
                   Ena         : in     std_logic;
                   wEna        : in     STD_LOGIC_VECTOR(0 DOWNTO 0);
                   cur_addr    : in     STD_LOGIC_VECTOR(9 DOWNTO 0);  --cur address of the bit in #bit

                   --interface between I2C<=>live memory
                   --infos to be exchanged with top level of hierarchy
                   --since i2c controller component is just under top level
                   en8         : in    std_logic;
                   we8         : in    STD_LOGIC_VECTOR(0 DOWNTO 0);
                   addr8       : in    std_logic_vector(6 downto 0);                   
                   dout8       : out   std_logic_vector(7  downto 0);   
                   din8        : in    std_logic_vector(7  downto 0)
 
		          );
end component;


signal HMADDR     : STD_LOGIC_VECTOR(9 DOWNTO 0);

signal WENABL     : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal DOUTA_INT  : STD_LOGIC_VECTOR(0 DOWNTO 0);


--following was to understand what was wrong with iic at first debug when nothing was working...
--signal NVRAM_data : std_logic_vector(0 to 1023) :=  NVRAM_INIT;
--signal NVRAM_data : std_logic_vector(0 to 1023) := (others => '0'); -- not NVRAM_INIT;
--signal NVRAM_data : std_logic_vector(0 to 1023) := X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"; -- not NVRAM_INIT;
--signal NVRAM_data : std_logic_vector(0 to 1023) := not (0 to 513 => '0')&'1'&(0 to 508 => '0');
--signal NVRAM_data : std_logic_vector(0 to 1023) := "0101"&(0 to 1015 => '0')&"0101";

--at start up:
--op_mode == 0 => read from basic set of data (all values are reint to default board)
--op_mode == 1 => fetch values from real I2C F-RAM
signal op_mode    : std_logic := '0';

--signals for working with nvram controller

--signal r_device           : std_logic_vector(1 downto 0)  := "00";
signal r_size_int         : unsigned(7 downto 0)          := "10000000";
signal r_baseAddr_int     : unsigned(15 downto 0) := (others => '0');

signal trigger_fwrite_int : boolean := false;


--signal bd_din             : std_logic_vector(7 downto 0);
--signal bd_dout            : std_logic_vector(7 downto 0);
--signal bd_addr            : std_logic_vector(6 downto 0);

signal fmtPattern         : std_logic_vector(23 downto 0);
signal scNvrMode          : std_logic_vector(7 downto 0);
signal scSettings1        : std_logic_vector(7 downto 0);



--next 2 lines to avoid pointless warnings about black boxes (advice from https://www.xilinx.com/support/answers/9838.html)
attribute box_type : string; 
attribute box_type of CD4040    : component is "black_box"; 
--attribute box_type of HM6508    : component is "black_box"; 

begin

-- permanent affectations



--dout      <= not DOUTA_INT(0); --allows to get 500, but well... (hminitram installed)
--dout      <= DOUTA_INT(0);   --gives 508 (?)    (hminitram installed)
WENABL(0) <=   not wEn;

dout      <=  DOUTA_INT(0) when wEn='1' and  nEn='0' else
             '1';

--dout      <=  NVRAM_data(to_integer(unsigned(HMADDR))) when wEn='1' and  nEn='0' else
--             '1';



-- write to live nvram (into signal in ram)
--    process (hiclk)
--    begin
--        if (rising_edge(hiclk)) then
--            if wEn='0' and  nEn='0' then
--                NVRAM_data(to_integer(unsigned(HMADDR))) <= not din;  --not: because the ttl value is (not F/F state) of IO01
--            end if;
--        end if;
--    end process;
    
    
MYCOUNTER : CD4040
  PORT MAP (
    CLK =>   not aClk,  --Rising edge clock signal, I think not or not not will don't care
    SCLR =>  aReset,   --Synchronous Clear: forces the output to a low state when driven high
    Q => HMADDR
  );

--MYRAMCMOS : HM6508
--  PORT MAP (
--    clka   => hiclk,
--    ena    => not nEn, --nEn is active low
--    wea    => WENABL,
--    addra  => HMADDR,
--    dina   => (0 => not din), --not: because the ttl value is (not F/F state) of IO01
--    --dina   => (0 => din),
--    douta  => DOUTA_INT
--  );


     --
     NVRAMR  :  nvramMng port map (  hiclk      => hiclk,
--                                     start      => start_nvr_cmd,
--                                     command    => nvr_cmd,
--                                     done       => is_nvr_cmd_done,
                                     
                                     r_device   => r_device,
                                     --r_size     => r_size_int,
                                     --r_baseAddr => r_baseAddr,
                                     
--                                     bd_din     => bd_din,
--                                     bd_dout    => bd_dout,
--                                     bd_addr    => bd_addr,

                                     dina       => (0 => not din),  --not: because the ttl value is (not F/F state) of IO01
                                     douta      => DOUTA_INT,
                                     Ena        => not nEn,
                                     wEna       => WENABL,
                                     cur_addr   => HMADDR,
--                                     status     => status_iic,
--                                     scl        => SCL,
--                                     sda        => SDA

                                     --transferring infos between I2C and NVRAM modules
                                     --through hmsys module as a passerelle
                                     en8        => en8,
                                     we8        => we8, 
                                     addr8      => addr8,                   
                                     dout8      => dout8,   
                                     din8       => din8

                                     );

  


---- reset iic then write values to fram for testing                                     
--process_iic:    process(hiclk)
--    variable state             : integer range 0 to 63   := 0;
--    variable substate          : integer range 0 to 1023 := 0;
--    variable subsubstate       : integer range 0 to 63   := 0;
    
--    variable last_bckdr_rx_req : std_logic := '0';
--    variable last_bckdr_tx_req : std_logic := '0';
--    variable last_bckdr_fl_req : std_logic := '0';
--    begin
--        if (rising_edge(hiclk)) then
--            if SPO = '1' then
--                state    := 0;
--                substate := 0;
--                start_nvr_cmd <= '0'; 
--                nvr_cmd       <= cFramNop;
--            else
----                if wEn='0' and  nEn='0' then
----                    NVRAM_data(to_integer(unsigned(HMADDR))) <= not din;  --not: because the ttl value is (not F/F state) of IO01
----                else
--                --sequence is as follows:
--                --state 0: reset iic periph
--                --state 1: load miniprinter from iic fram to miniprinter local ram (not hm6502 local equivalent)
--                --         read from fram offset: cIICMnprnBase
--                --         write to local ram device "10" (MINIPRINTER RAM block)
--                --
--                --state 2: load sys config from iic fram
--                --         read from fram offset: cIICConfgBase
--                --         write to local ram device "00" (SYSCONFIG RAM block)
--                --
--                --state 3: use config data  to configure the system. Write to signal fmtPattern
--                --         byte read from local ram device "00" (SYSCONFIG RAM block)
--                --         fmtPattern(23 downto 16)<= cSCFmtAdd0
--                --         fmtPattern(15 downto 8) <= cSCFmtAdd1
--                --         fmtPattern(7 downto 0)  <= cSCFmtAdd2
--                --         scNvrMode               <= cSCNVRModeAdd
--                --
--                --         if fmtPattern /= cSCFmtData0&cSCFmtData1&cSCFmtData2
--                --             goto state 4  (first time config init)
--                --         elsif scNvrMode = cSCSRCMiniPrn
--                --             goto state 5  (load local nvram with miniprinter data (coming from iic ram))
--                --         elsif scNvrMode = cSCSRCVirtHM65
--                --             goto state 6
--                --         else
--                --             goto state 9   (end of init do nothing ie use default factory config ram (coe data))
--                --
--                --state 4: This is a very first run of the device: format live config ram AA55C3 + cSCSRCVirtHM65
--                --         a)   r_device      <= "00";
--                --              bd_addr       <= cSCFmtAdd0;    
--                --              bd_din        <= cSCFmtData0;
--                --         b)   r_device      <= "00";
--                --              bd_addr       <= cSCFmtAdd1;    
--                --              bd_din        <= cSCFmtData1;
--                --         c)   r_device      <= "00";
--                --              bd_addr       <= cSCFmtAdd2;    
--                --              bd_din        <= cSCFmtData2;
--                --         d)   r_device      <= "00";
--                --              bd_addr       <= cSCNVRModeAdd;    
--                --              bd_din        <= cSCSRCVirtHM65;
--                --         now write result to iic
--                --                  r_device     <= "00";   --sys config ram
--                --                  r_size_int       <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                --                  r_baseAddr   <= cIICConfgBase;   --base address in the fram                        
--                --         goto state 9   (end of init)
--                --
--                --
--                --state 5: load hm6508 ram from iic fram subsection miniprinter
--                --         read from fram offset: cIICMnprnBase
--                --         write to local ram device "01" (MYNVRAMMIRROR RAM block)
--                --         goto state 9   (end of init)
--                --
--                --
--                --state 6: load hm6508 ram from iic fram subsection hm6508
--                --         read from fram offset: cIICHmsysBase
--                --         write to local ram device "01" (MYNVRAMMIRROR RAM block)
--                --         goto state 9   (end of init)
--                --
--                --
--                --state 9: is (when necessary) update iic fram from current hmsys double ram block
--                --         loop inside state 9 forever
--                --
--                --state 10: write to hmsys fram. /!\ Not reached for now



--                case state is 
--                    -- reset iic iface
--                    when 0 =>
--                        case substate is 
--                            when 0 =>
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramReset;
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    --state    := 1;  -- load miniprinter from iic fram
--                                    state    := 2;  -- first of, load sys config from iic fram
--                                    --state    := 10;   --proviory test basic. the final one is state=1 (line above)
--                                    substate := 0;
--                                end if;
--                        end case;
                        
--                    --state is 1 : load miniprinter from iic fram    
--                    when 1  =>
--                        -- load miniprinter from iic fram
--                        -- required for wifi iface
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "10";  --mnprn ram
--                                r_size_int     <= to_unsigned(128, r_size_int'length);    --block size to be transferred
--                                r_baseAddr_int <= cIICMnprnBase;                      --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    state    := 2;
--                                    substate := 0;
--                                end if;
--                        end case;                        
                                                          
                        
--                    -- state is 2 load sys config from iic fram
--                    when 2 =>
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "00";   --config ram
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICConfgBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    state    := 3;   --read  config data from live buffer
--                                    --state    := 6;   --for testing purposes 
--                                    substate := 0;
--                                end if;
--                        end case;

--                    -- state is 3 read  config data from live buffer
--                    when 3 =>
--                       case substate is 
--                            when 0 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd0;    
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when 2 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    fmtPattern(23 downto 16) <= bd_dout;
--                                    substate := 3;
--                                end if;
--                            when 3 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd1;    
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufRead;  --read all
--                                substate := 4;
--                            when 4 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 5;
--                            when 5 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    fmtPattern(15 downto 8) <= bd_dout;
--                                    substate := 6;
--                                end if;
--                            when 6 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd2;    
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufRead;  --read all
--                                substate := 7;
--                            when 7 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 8;
--                            when 8 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    fmtPattern(7 downto 0) <= bd_dout;
--                                    substate := 9;
--                                end if;
--                            when 9 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCNVRModeAdd;    
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufRead;  --read all
--                                substate := 10;
--                            when 10 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 11;
--                            when 11 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    scNvrMode  <= bd_dout;
--                                    substate := 12;
--                                end if;
--                            when 12 =>
--                                --read settings
--                                r_device      <= "00";
--                                bd_addr       <= cSCSet1Add;    
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufRead;  --read all
--                                substate := 13;
--                            when 13 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 14;
--                            when 14 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    scSettings1  <= bd_dout;
--                                    substate := 15;
--                                end if;
                                
                                
                                
--                            when others =>
--                                if fmtPattern /= cSCFmtData0&cSCFmtData1&cSCFmtData2 then
--                                    scNvrMode   <= cSCSRCVirtHM65;
--                                    scSettings1 <= (others=>'0');
--                                    substate := 0;
--                                    state    := 4; --format iic config nvram and set mode to hm65
--                                else
--                                    case scNvrMode is 
--                                        when cSCSRCMiniPrn   =>
--                                            --miniprinter...
--                                            substate := 0;
--                                            state    := 11; --load miniprinter data
--                                        when cSCSRCVirtHM65  =>
--                                            --load the last saved hm6508...
--                                            substate := 0;
--                                            state    := 11; --load miniprinter data
--                                        when others          =>
--                                            --cSCFactoryReset or undefined...
--                                            substate := 0;
--                                            --state    := 9; --do nothing, use factory data of live hmsys
--                                            state    := 11; --goto to branch first start (flash nvr...)
--                                    end case;
--                                end if;

--                        end case;
                                
            
--                    -- state is 4 format live config ram AA55C3 + cSCSRCVirtHM65
--                    -- + store machine serial number in nvram
--                    when 4 =>
--                       case substate is 
--                            when 0 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd0;    
--                                bd_din        <= cSCFmtData0;
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufWrite;  --read all                                
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when 2 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 3;
--                                end if;
--                            when 3 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd1;    
--                                bd_din        <= cSCFmtData1;
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufWrite;  --read all
--                                substate := 4;
--                            when 4 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 5;
--                            when 5 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 6;
--                                end if;
--                            when 6 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCFmtAdd2;    
--                                bd_din        <= cSCFmtData2;
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufWrite;  --read all
--                                substate := 7;
--                            when 7 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 8;
--                            when 8 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 9;
--                                end if;
--                            when 9 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCNVRModeAdd;    
--                                bd_din        <= cSCSRCVirtHM65;
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufWrite;  --read all
--                                substate := 10;
--                            when 10 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 11;
--                            when 11 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 12;
--                                end if;
--                            when 12 =>
--                                r_device      <= "00";
--                                bd_addr       <= cSCSet1Add;    
--                                bd_din        <= (others => '0');
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd       <= cFramBufWrite;  --read all
--                                substate := 13;
--                            when 13 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 14;
--                            when 14 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 15;
--                                end if;
                                
                                
                                
--                            when 15 =>
--                                --now write result to iic
--                                r_device       <= "00";   --sys config ram
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICConfgBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramWrite;
--                                substate := 16;  --a finir
--                            when 16 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 17;
                                
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 0;
--                                    state    := 10; --goto flash sys config
--                                    nvr_cmd <= cFramNop;
--                                end if;


--                        end case;
                                                                                
                            
--                    -- state is 5 load sys ram from iic fram subsection miniprinter
--                    when 5 =>
--                        case substate is 
--                            when 0 =>
--                                r_device     <= "01";      --hm6508  ram. ie MYNVRAMMIRROR (double port ram)                                
--                                if scNvrMode = cSCSRCMiniPrn then
--                                    r_baseAddr_int <= cIICMnprnBase;   --base address in the fram                        
--                                else
--                                    r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                end if;
--                                r_size_int       <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0         
--                                nvr_cmd <= cFramRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    state    := 9;
--                                    substate := 0;
--                                end if;
--                        end case;          
                    
--                    -- state is 6 load hmsys ram from iic fram subsection hmsys. ie standard case
--                    when 6 =>
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "01";   --regular hmsys ram
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    state    := 9; --changed for tests
--                                    --state    := 10;
--                                    substate := 0;
--                                end if;
--                        end case;           
                                              
--                    --main loop after reset  
--                    --will flash iic data on demand   ( trigger_fwrite_int )
--                    --     or read ram data on demand ( bckdr_rx_req rising edge )
--                    when 9  =>
--                        case substate is 
--                            when 0 =>
--                                if  trigger_fwrite_int = true then
--                                    --save hmsys
--                                    r_device       <= "01";
--                                    r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                    r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                    start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                    nvr_cmd <= cFramWrite;
--                                    substate := 1;  
--                                elsif bckdr_rx_req = '1' and last_bckdr_rx_req = '0' then
--                                    --read ram byte
--                                    r_device      <= bckdr_r_device;
--                                    bd_addr       <= bckdr_addr;    
--                                    start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                    nvr_cmd       <= cFramBufRead;  --read byte
--                                    substate := 2;
--                                elsif bckdr_tx_req = '1' and last_bckdr_tx_req = '0' then
--                                    r_device      <= bckdr_r_device;
--                                    bd_addr       <= bckdr_addr;    
--                                    bd_din        <= bckdr_tx_byte;
--                                    start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                    nvr_cmd       <= cFramBufWrite;  --write byte
--                                    substate := 1;
--                                elsif bckdr_fl_req = '1' and last_bckdr_fl_req = '0' then
--                                    r_device      <= bckdr_r_device;
--                                    r_size_int    <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                    case bckdr_r_device is
--                                        when "00"   =>
--                                            r_baseAddr_int <= cIICConfgBase;   --base address in the fram                        
--                                        when "01"   =>
--                                            r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                        when "10"   =>
--                                            r_baseAddr_int <= cIICMnprnBase;   --base address in the fram                        
--                                        when others =>
--                                            r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                    end case;
                                    
--                                    start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                    nvr_cmd       <= cFramWrite;  --write all
--                                    substate := 1;                                
--                                end if;
--                                last_bckdr_rx_req := bckdr_rx_req;
--                                last_bckdr_tx_req := bckdr_tx_req;
--                                last_bckdr_fl_req := bckdr_fl_req;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 10;        --end of the story
--                            when 2 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 3;
--                            when 3 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 4;
--                                    bckdr_rx_byte <= bd_dout;
--                                    bckdr_rx_dv_int   <= '1';                                    
--                                end if;
--                            when 4 => 
--                                bckdr_rx_dv_int   <= '0';       
--                                substate := 0;                             
--                                nvr_cmd <= cFramNop;
                                
--                            --added 2024-09-04 to handle real time update of sys config
--                            when 10 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    r_device      <= "00";
--                                    bd_addr       <= cSCNVRModeAdd;    
--                                    start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                    nvr_cmd       <= cFramBufRead;  --read all
--                                    substate := 11;
--                                end if;
--                            when 11 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 12;
--                            when 12 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    scNvrMode  <= bd_dout;
--                                    substate := 13;   --end of the story
--                                end if;
--                            --end of modification for real time handling    
                                
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 0;
--                                    nvr_cmd <= cFramNop;
--                                end if;
--                            end case;
                    
--                   -- state is 10 flash to hmsys  iic fram
--                   when 10 =>
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "01";
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICHmsysBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramWrite;
--                                substate := 1;  
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when 2 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 3;
--                                    nvr_cmd <= cFramNop;
--                                end if;
--                            when others =>
--                                substate := substate + 1;
--                                if substate >= 10 then
--                                    substate := 0;
--                                    --state    := 6;   --goto read all fram hmsys
--                                    state    := 12;     --goto flash mnp
--                                    --nvr_cmd <= cFramNop;
--                                end if;
--                            end case;
                    
--                    -- state is 11 load mnp ram from iic fram subsection miniprinter
--                    when 11 =>
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "10";      --miniprinter RAM
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICMnprnBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramRead;  --read all
--                                substate := 1;
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when others =>
--                                if  is_nvr_cmd_done = '1' then
--                                    state    := 5;  --load sys ram with iic nvr or iic mnp
--                                    substate := 0;
--                                end if;
--                        end case;          
                    
--                   -- state is 12 flash mnp to miniprint  iic fram
--                   when 12 =>
--                        case substate is 
--                            when 0 =>
--                                r_device       <= "10";
--                                r_size_int     <= to_unsigned(128, r_size_int'length);       --block size to be transferred
--                                r_baseAddr_int <= cIICMnprnBase;   --base address in the fram                        
--                                start_nvr_cmd <= '1'; --edge sensitive, was initialized to 0
--                                nvr_cmd <= cFramWrite;
--                                substate := 1;  
--                            when 1 =>
--                                start_nvr_cmd <= '0'; --reset signal to be able to start a new command later
--                                substate := 2;
--                            when 2 =>
--                                if  is_nvr_cmd_done = '1' then
--                                    substate := 3;
--                                    nvr_cmd <= cFramNop;
--                                end if;
--                            when others =>
--                                substate := substate + 1;
--                                if substate >= 10 then
--                                    substate := 0;
--                                    --state    := 6;   --goto read all fram hmsys
--                                    state    := 11;     --goto init sys config ram
--                                    --nvr_cmd <= cFramNop;
--                                end if;
--                            end case;
                                                                    
--                    when others =>
--                        null;                 
                        
--                end case;
--            end if; --end of if not reset
                     
--        end if; --end of rising_edge
--    end process process_iic;           


--diag_process : process(hiclk)
--    variable    last_cmd : std_logic_vector(2 downto 0) := "000";
--    variable    CLK_DIV0 : integer range 0 to 100000000:= 0;
--    begin
--        if (rising_edge(hiclk)) then
--            if nvr_cmd /= last_cmd and nvr_cmd /= cFramReset then
--                status(7 downto 0)     <= ("00000", nvr_cmd);
--                CLK_DIV0  := 0;
--            else
--                if CLK_DIV0 > 80000000 then
--                    status(7 downto 0) <= (others => '0');
--                end if;
--            end if;
--            last_cmd := nvr_cmd;
--            CLK_DIV0 := CLK_DIV0 + 1;
--        end if;
--    end process diag_process;

--    process(hiclk)
--        variable wr_state  : integer range 0 to 10 := 0;
--        variable sig_length: integer range 0 to 10 := 0;
--        variable last_wen  : std_logic := '0';
--        variable last_mode : std_logic := '0';
--        variable last_nEn  : std_logic := '1';
--        variable sig_wrend : boolean :=false;
--        variable trans_counter : integer range 0 to 15 := 0;
--    begin
--        if (rising_edge(hiclk)) then
--             -- i => 0, h => 1
--             if mode /= last_mode then
--                --nvram just stop write enable
--                trigger_fwrite_int <= true;
--                sig_length := 3;
--             end if;

--             if trigger_fwrite = true and trigger_fwrite_int = false then
--                trigger_fwrite_int <= true;
--                sig_length := 3;
--             end if;
                 
--             last_wen  := WENABL(0);
--             last_mode := mode;
--             if trigger_fwrite_int = true then
--                if sig_length = 0 then
--                    trigger_fwrite_int <= false;
--                else
--                    sig_length := sig_length-1;
--                end if;
--             end if;
--        end if;

--    end process;
    
end Behavioral;
