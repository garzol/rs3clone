----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2024 14:39:26
-- Design Name:  
-- Module Name: rs3cctrl - Behavioral
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
use work.libfram.all;

entity rs3cctrl is
  Port ( 
             SYSCLK       : in     STD_LOGIC;

             --output clka clkb for extension
             CK_A         : out    std_logic;
             nCK_B        : out    std_logic;
             
             --
             IOx          : inout  STD_LOGIC_VECTOR(7 DOWNTO 0);
 
             --new 2024-11-20 Reading dip switch
             RD_DS        : out    std_logic;  --pin E11, aka PG1
             
             --SPI
             --SCK_SPI      : out    std_logic;   --we pass through primitive STARTUPE2
             nCS_SPI      : out    std_logic;
             SI_IO0       : inout  std_logic;
             SO_IO1       : inout  std_logic;
             nWP_IO2      : inout  std_logic;
             nHOLD_IO3    : inout  std_logic;
            
             
                          
             --3 following are for B3 out latches
             --A positive pulse of 20ns will latch
             --corresponding B3 outputs from IOx
             --must have internal pull-downs
             Load_B3_AB   : out    std_logic;  --pin J2 (ex IO15)
             Load_B3_CD   : out    std_logic;  --pin K4 (ex seliobank(1) (IO09))
             Load_B3_EF   : out    std_logic;  --pin K3 (ex seliobank(0) (IO08))

             --A positive pulse of 20ns will latch
             --corresponding B2 output bank from IOx
             --must have internal pull-downs
             Load_B2_0    : out    std_logic;  --pin J1 (ex  (IO14))
             Load_B2_1    : out    std_logic;  --pin J4 (ex  (IO13))

             -- Next one was added in RS3CLN V1A to avoid the initial chtonk of coils at reset
             -- This will Hi-Z all outputs of B3
             nOEIOs       : out    std_logic;  --pin D13 (ex SPO)
             
             --To set all IOxx of B2 in Hi-Z (when B2 is configured as input)
             --To disable outputs: set this signal to 1
             --must have internal pull up             
             SelDir_B2    : out    std_logic;  --pin H12 (ex AB11_33)

             -- B1 HW is generic A17 IO clone system (with all the BSS84)
             -- We did this to be compatible with genuine Recel miniprinters
             -- Hence SelDir_B1 is not connected directly on OE like for B2
             -- It is connected to the output mosfet controller (IRLML5103 Q1)              
             SelDir_B1    : out    std_logic;  --pin J3 (ex SELIODir_33)

             -- latching for B1 is negative (hence opposite of B2)
             --A negative pulse of 20ns will latch
             --corresponding B1 output bank from IOx
             --must have internal pull-ups
             Load_B1_0         : out   std_logic;  --pin A5 (ex  (IO10))
             Load_B1_1         : out   std_logic;  --pin A2 (ex  (IO11))
            
             --included in map 2024-05-09 for tempo sound control    
             --pin D1 of S7 fpga
		     OPTIN2_33    : out STD_LOGIC; -- added HW V3. pin C1 (pin 2 of U17) (A1 of I2C ext. fram)
		     OPTIN3_33    : out STD_LOGIC; -- added HW V3. pin D1 (pin 1 of U17) (A0 of I2C ext. fram)
		     OutSound     : out STD_LOGIC; -- added HW V3. pin H11

			 VS0          : out STD_LOGIC; -- added HW V3. led control
			 VS1          : out STD_LOGIC; -- added HW V3. led control
			 VS2          : out STD_LOGIC; -- added HW V3. led control

             SW1          : in  std_logic; -- PG2. pin E12.
             SW2          : in  std_logic; -- W-IO_33. pin D14.		   


             --internal I2C
		     --must have internal pull-ups
             SCL_INT      : inout  STD_LOGIC;  -- pin 6 of U17.(OPTIN0_33)  C14  (SCL of I2C ext. fram)
             SDA_INT      : inout  STD_LOGIC;  -- pin 5 of U17.(OPTIN1_33)  C3   (SDA of I2C ext. fram)
             
             
		     --must have internal pull-ups
             SCL          : inout  STD_LOGIC;  -- pin 6 of U17.(OPTIN0_33)  C14  (SCL of I2C ext. fram)
             SDA          : inout  STD_LOGIC;  -- pin 5 of U17.(OPTIN1_33)  C3   (SDA of I2C ext. fram)
             
			 TXp       : out STD_LOGIC;  -- added HW V3 09/2022. Opt1_33    =fpga pin34 (IO_L05N_2).   pin A13
			 RXp       : in  STD_LOGIC;  -- added HW V3 03/2023. Optin4_33  =fpga pin39 (IP_2/VREF_2). pin A12
             
             Xi        : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		     DA        : out STD_LOGIC_VECTOR(4 DOWNTO 1); 
		     DB        : out STD_LOGIC_VECTOR(4 DOWNTO 1); 
		     DBS       : out STD_LOGIC; 
		   
             DIA       : in  STD_LOGIC_VECTOR (4 downto 1);
             DO        : out STD_LOGIC_VECTOR (4 downto 1)    --DIO is not used in RS3
  
  );
end rs3cctrl;

architecture Behavioral of rs3cctrl is

component pps4Core
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
end component;

component RRIOTA17
    Generic (
           g_IODEVNUM  : std_logic_vector(1 downto 0);
           g_RAMSEL    : std_logic;
           g_RAMAB8    : std_logic;
           g_ROMSEL    : std_logic;
           g_ref       : natural
           );
    Port ( 
           hiclk       : in     STD_LOGIC;
           spo         : in     STD_LOGIC;
           pps4_phi    : in     pps4_ph_type;
           seliodir    : out    std_logic;
           inpx        : in     std_logic_vector(15 downto 0);
           outx        : out    std_logic_vector(15 downto 0);
           rrsel       : in     std_logic;
           ab          : in     STD_LOGIC_VECTOR (11 downto 1);
           din         : in     STD_LOGIC_VECTOR (8 downto 1);
           dout        : out    STD_LOGIC_VECTOR (8 downto 1);
           wio         : in     STD_LOGIC);
end component;


component RRIOTA17G
    Generic (
           g_IODEVNUM  : std_logic_vector(1 downto 0);
           g_RAMSEL    : std_logic;
           g_RAMAB8    : std_logic;
           g_ROMSEL    : std_logic;
           g_ref       : natural
           );
    Port ( 
           hiclk       : in     STD_LOGIC;
           spo         : in     STD_LOGIC;
           pps4_phi    : in     pps4_ph_type;
           seliodir    : out    std_logic;
           inpx        : in     std_logic_vector(15 downto 0);
           outx             : out    std_logic_vector(15 downto 0);
           rrsel            : in     std_logic;
           ab               : in     STD_LOGIC_VECTOR (11 downto 1);
           din              : in     STD_LOGIC_VECTOR (8 downto 1);
           dout             : out    STD_LOGIC_VECTOR (8 downto 1);
           wio              : in     STD_LOGIC;
           
           r_device         : in     std_logic_vector(1 downto 0);   -- game=00, A1762=01

           -- makes the courroie de transmission between i2C module and nvram owner                  
           en8              : in        std_logic;
           we8              : in        STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr8            : in        std_logic_vector(10 downto 0);                   
           dout8            : out       std_logic_vector(7  downto 0);   
           din8             : in        std_logic_vector(7  downto 0)
           
           );
end component;

component GPKD10788
    Port ( 
           hiclk         : in     STD_LOGIC;
           spo           : in     STD_LOGIC;
           pps4_phi      : in     pps4_ph_type;
           sc5           : in     STD_LOGIC;
           sc6           : in     STD_LOGIC;
           sc7           : in     STD_LOGIC;
           x             : out    STD_LOGIC_VECTOR (7 downto 0);
           dbs           : out    STD_LOGIC;

           status        : out    std_logic_vector (7 downto 0);
           RDA_data_st   : out    t_sreg;
           RDB_data_st   : out    t_sreg;
           dspl_A_off_st : out    std_logic;
           dspl_B_off_st : out    std_logic;
           
           --following is for forcing digits from wifi commands           
           RDA_data_over : in    t_sreg;
           RDB_data_over : in    t_sreg;
           bdisplay_over : in    boolean;
                                 
           da : out STD_LOGIC_VECTOR (4 downto 1);
           db : out STD_LOGIC_VECTOR (4 downto 1);
           y  : in STD_LOGIC_VECTOR (7 downto 0);
           id : in STD_LOGIC_VECTOR (8 downto 1);
           wio: in STD_LOGIC;
           do : out STD_LOGIC_VECTOR (8 downto 1);
           dldir : out STD_LOGIC);
end component;


component hmsys
    Port (
           hiclk            : in        STD_LOGIC;
           spo              : in        STD_LOGIC;  -- this is the pps4 periph reset signal
           nEn              : in        std_logic;
           aClk             : in        STD_LOGIC;
           aReset           : in        STD_LOGIC;
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
end component hmsys;

component gpio11696 is
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

           status        : out    std_logic_vector (7 downto 0);    --always says: 0
           
           id : in STD_LOGIC_VECTOR (8 downto 1);
           wio: in STD_LOGIC;
           do : out STD_LOGIC_VECTOR (8 downto 1);
           dldir : out STD_LOGIC);                --set dir of ID1..4 
           
end component gpio11696;

component gentones is
    Port (
           hiclk       : in        STD_LOGIC;
           tonesel     : in        std_logic_vector(4 downto 0);
           soundout    : out       std_logic
          );
end component gentones;



component serialtrace
    Port ( 
           hiclk            : in     STD_LOGIC;

           spo              : in     STD_LOGIC;

		   TXp              : out    STD_LOGIC; 
		   RXp              : in     STD_LOGIC; 
		   --for interfacing with gpkd virtual component
           GPKD_status      : in     std_logic_vector(7 downto 0);
           --for diag through wifi
           RDA_data_st      : in     t_sreg;
           RDB_data_st      : in     t_sreg;
           dspl_A_off_st    : in     std_logic;
           dspl_B_off_st    : in     std_logic;

           status           : out    std_logic_vector(7 downto 0);
           hm_user_sel      : out    std_logic;

           bckdr_fl_req     : out    std_logic;                      -- pos. edge: flash required, 
           bckdr_rx_req     : out    std_logic;                      -- pos. edge: a byte is requested, 
           bckdr_tx_req     : out    std_logic;                      -- pos. edge: a byte is to be written, 
           bckdr_rx_dv      : in     std_logic;                      -- a byte from backdoor ram was received, set to 1 for 1 tick
           bckdr_rx_byte    : in     std_logic_vector(7 downto 0);   -- the byte which was just read
           bckdr_tx_byte    : out    std_logic_vector(7 downto 0);   -- the byte to be written

           bckdr_r_device   : out    std_logic_vector(3 downto 0);   -- conf=00, hmsys=01, miniprinter=10 - gameprom=100, A1762=101
           bckdr_addr       : out    STD_LOGIC_VECTOR(11 DOWNTO 0);   -- address to be selected in the ram space
           
           sw_sig           : out    std_logic;
           sw_strb          : out    std_logic_vector(7 downto 0);
           sw_ret           : out    std_logic_vector(7 downto 0);
           sw_timer         : out    std_logic_vector(7 downto 0);
           
            --signals for switch matrix
            -- handled in swmtrx.vhd
           r_BitSwitches    : in     t_BitSwitches;
           
           gpio             : in     STD_LOGIC_VECTOR (24 downto 1);
           
           inpx             : in     STD_LOGIC_VECTOR (15 downto 0);
           outx             : in     STD_LOGIC_VECTOR (15 downto 0);
           
           outx2            : in     STD_LOGIC_VECTOR (15 downto 0);
           
           ident            : in     std_logic_vector(8*8-1 downto 0);

           DIP_SW           : in     std_logic_vector(7 downto 0);
           
           B2_data_over     : out    std_logic_vector(15 downto 0);
           B3_data_over     : out    std_logic_vector(24 downto 1);
           RDA_data_over    : out    t_sreg;
           RDB_data_over    : out    t_sreg;
           bdisplay_over    : out    boolean;
           
           soft_reset       : out    std_logic);
end component;

component ledctrl
    Port ( 
           hiclk       : in     STD_LOGIC;
           ErrCod      : in     std_logic_vector(7 downto 0);
           UserCod     : in     std_logic_vector(7 downto 0);
           vs0         : out    STD_LOGIC;
           vs1         : out    STD_LOGIC;
           vs2         : out    STD_LOGIC);
end component;

component ioxAdapter
     Port ( hiclk             : in    STD_LOGIC;
            spo               : in     STD_LOGIC;
            pps4_phi          : in    pps4_ph_type;
            A1761_inpx_gen    : out   std_logic_vector(15 downto 0);   --yes, it's an OUT, because it is generated here 
            A1761_outx_read   : in    std_logic_vector(15 downto 0);   --yes, it's an IN, because it is generated in ioctrl 
            pA1762_outx_read  : in    std_logic_vector(15 downto 0);   --yes, it's an IN, because it is generated in ioctrl 
            iox               : inout std_logic_vector( 7 downto 0); --to the extern mux interface 
            RD_DS             : out   std_logic;  --pin E11 (PG1)
            DIP_SW            : out   std_logic_vector(7 downto 0);   
            Load_B1_0         : out   std_logic;  --pin A5 (ex  (IO10))
            Load_B1_1         : out   std_logic;  --pin A2 (ex  (IO11))
            Load_B2_0         : out   std_logic;  --pin J1 (ex  (IO14))
            Load_B2_1         : out   std_logic;  --pin J4 (ex  (IO13))
            Load_B3_AB        : out   std_logic;  
            Load_B3_CD        : out   std_logic;  
            Load_B3_EF        : out   std_logic;  
            pGPIO11696_OutX    : in    std_logic_vector(24 downto 1); 
            seliobank         : out   std_logic_vector( 1 downto 0);
            latchiobank       : out   std_logic_vector( 1 downto 0);

           --following is for forcing outputs from wifi commands           
           IO_data_over       : in    std_logic_vector(39 downto 0);
           bIOs_over          : in    boolean;
            
            settings1         : in    std_logic_vector( 7 downto 0)
          );
end component;                                            



component i2cctl is
  Port ( 
               hiclk       : in     STD_LOGIC;
               
               --to r/w entire memory FRAM<->RAM
               start       : in     std_logic;                    -- rising edge to start
               command     : in     std_logic_vector(2 downto 0); -- command to be executed
               done        : out    std_logic;                    -- set to 0 on start until finished

               --memory infos
               r_baseAddr  : in     unsigned(15 downto 0);        --base address in the fram
               r_size      : in     unsigned(10 downto 0);        --block size to be transferred

               --bd prefix for backdoor reading (from the 8-bit bus of given ram)
               bd_din      : in     std_logic_vector(7 downto 0);
               bd_dout     : out    std_logic_vector(7 downto 0);
               bd_addr     : IN     STD_LOGIC_VECTOR(10 DOWNTO 0);

               
               --interface with memory device
               en8         : out    std_logic;
               we8         : out    std_logic_vector(0 downto 0);
               addr8       : out    std_logic_vector(10 downto 0);
               dout8       : in     std_logic_vector(7  downto 0);  --this is an input for us here, because it is the 
                                                                    --dout of the memory to be read and stored into iic
               din8        : out    std_logic_vector(7  downto 0);  --this is an output for us here, because it is the 
                                                                    --din of the memory to be written from iic
               status      : out   std_logic_vector(7 downto 0);               
               --access i2C
               scl         : inout  STD_LOGIC;
               sda         : inout  STD_LOGIC
  );
end component;



component startupmng is
  Port (
           hiclk            : in        STD_LOGIC;
           
           --board reset (HW coming from Switch for example, or SW coming from serial
           brd_po           : in        std_logic;
           
           --management of po signal which is the HW reset of pps4 core
           cpu_po           : out        STD_LOGIC;      --this is the pps4 core reset signal 

           trigger_fwrite   : in        boolean;   --used to trigger an actual write to i2c
           
           bckdr_fl_req     : in        std_logic;                      -- pos. edge: a flash is requested, 
           bckdr_rx_req     : in        std_logic;                      -- pos. edge: a byte is requested, 
           bckdr_tx_req     : in        std_logic;                      -- pos. edge: a byte is to be written, 
           bckdr_rx_dv      : out       std_logic;                      -- a byte from backdoor ram was received, set to 1 for 1 tick
           bckdr_rx_byte    : out       std_logic_vector(7 downto 0);   -- the byte which was just read
           bckdr_tx_byte    : in        std_logic_vector(7 downto 0);   -- the byte to be written
           bckdr_r_device   : in        std_logic_vector(2 downto 0);   -- game prom =100, A1762 prom=101, conf=000, hmsys=001, miniprinter=010
           --Addr. issued by the serial interface (receiver)
           bckdr_addr       : in        STD_LOGIC_VECTOR(10 DOWNTO 0);   -- address to be selected in the ram space
        
           --control/command of iic entity
           start_nvr_cmd    : out       std_logic;
           nvr_cmd          : out       std_logic_vector(2 downto 0);
           is_nvr_cmd_done  : in        std_logic;
           -- parameters depending on the command. Exchanges btw iicmng<=>mem device
           bd_din           : out       std_logic_vector(7 downto 0);
           bd_dout          : in        std_logic_vector(7 downto 0);
           bd_addr          : out       std_logic_vector(10 downto 0);
           -- paramaters depending on the command for full r/w
           r_size           : out       unsigned(10 downto 0);          --block size to be transferred
           r_baseAddr       : out       unsigned(15 downto 0);          --base address in the fram
           r_device         : out       std_logic_vector(2 downto 0);  
           
           settings1        : out       std_logic_vector(7 downto 0);
           ident            : in        std_logic_vector(8*8-1 downto 0);
           id_configured    : in        std_logic;
           status           : out       std_logic_vector(7 downto 0)
                  
   );
end component startupmng;


component swmtrx is
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
end component swmtrx;


component  s25fl064l IS
  GENERIC(
    clk_freq    : INTEGER := 50;  --system clock frequency in MHz
    spi_clk_div : INTEGER := 1);  --spi_clk_div = clk_freq/100 (answer rounded up)
  PORT(
    clk        : IN      STD_LOGIC;                      --system clock
    reset_n    : IN      STD_LOGIC;                      --active low asynchronous reset
    S25_tx_ena : IN      STD_LOGIC;                      --enable transaction with DAC
    S25_DID    : OUT     STD_LOGIC_VECTOR(8*8-1 downto 0);  --Device id
    configured : out     std_logic;
    busy       : OUT     STD_LOGIC;                      --indicates when transactions with DAC can be initiated
    miso       : IN      STD_LOGIC;                      --SPI bus from SPI Flash: master in, slave out (DOUT)
    mosi       : OUT     STD_LOGIC;                      --SPI bus to SPI Flash: master out, slave in (DIN)
    sclk       : BUFFER  STD_LOGIC;                      --SPI bus to DAC: serial clock (SCLK)
    ss_n       : BUFFER  STD_LOGIC_VECTOR(0 DOWNTO 0));  --SPI bus to DAC: slave select (~SYNC)
END component s25fl064l;


--settings coming from sys conf nvram
signal   settings1     : std_logic_vector(7 downto 0);

signal   cIdentSw      : std_logic_vector(7 downto 0) := "00000001"; --verion number of this, starts at 1 (2024-11-16)

--choice of a game (provisory)
constant cG_MultiGame  : natural := 16#FFF#;
constant cG_CrazyRace  : natural := 16#62B#;
constant cG_FairFight  : natural := 16#62#;
--serial stuff
--type t_Serial is array (0 to 3) of natural range 0 to 15;
constant r_Serial : t_Serial := (1,0,5,3);  --fair fight model number (or multigame at 1st init)
--constant r_Serial : t_Serial := (1,0,5,4);  --crazy race model number
--the one which is selected for this design:
--constant cG_selected   : natural := cG_FairFight;
--constant cG_selected   : natural := cG_CrazyRace;
constant cG_selected   : natural := cG_MultiGame;

signal   selected_game : natural := cG_selected;

signal DIP_SW_State    : std_logic_vector(7 downto 0);

--specific to tracer
signal tracer_status   : std_logic_vector(7 downto 0);

--specific to status for hmsys and iic
--iic_status(0)      ->iic error  
--hmsys_status(2..0) ->last nvr_cmd, stay there for 100ms   
signal startup_status  : std_logic_vector(7 downto 0);
signal hm_user_sel     : std_logic;
signal iic_status      : std_logic_vector(7 downto 0);
signal ErrCod          : std_logic_vector(7 downto 0) := (others=>'0');
signal UserCod         : std_logic_vector(7 downto 0) := (others=>'0');

--transfer between I2C and hmsys modules
signal en8_int         : std_logic;
signal we8_int         : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal addr8_int       : std_logic_vector(10 downto 0);                   
signal dout8_int       : std_logic_vector(7  downto 0);   
signal din8_int        : std_logic_vector(7  downto 0);


--HW reset PO to pps4 core, from startup manager
signal CPU_PO          :  std_logic;
--generated by CPU to reset all peripherals
signal SPO             :  std_logic;

--PPS4 Clocks - generated by CPU
signal nCKB            :  std_logic;
signal CKA             :  std_logic;

--Control signals - generated by CPU
signal WIO             :  std_logic;

--DIOs of CPU
signal DOA_int     :  std_logic_vector(4 downto 1);
signal DIA_int     :  std_logic_vector(4 downto 1); 
signal DIO         :  std_logic_vector(4 downto 1);
--for switch emulation
signal DIAPlus     :  std_logic_vector(4 downto 1);
signal DIA_Brd     :  std_logic_vector(4 downto 1);

--Adress lines - generated by CPU
signal AB          :  std_logic_vector(12 downto 1);

--Data lines - shared by all devices
--ID(4:1) CPU in
--ID(8:5) CPU inout
signal ID          :  std_logic_vector(8 downto 1);

--only 8:5 is an output from cpu
signal ID_out_cpu  :  std_logic_vector(8 downto 1);

signal ID_out_A1761  :  std_logic_vector(8 downto 1);
signal ID_out_A1762  :  std_logic_vector(8 downto 1);

signal ID_out_10788  :  std_logic_vector(8 downto 1);

signal ID_out_11696  :  std_logic_vector(8 downto 1);

--defined for relaying info from pps4core to peripherals
signal pps4_phi    : pps4_ph_type;

--signals for A1761 ios
signal A1761_SELIODir          : std_logic;
signal A1761_InpX_int          : std_logic_vector(15 downto 0);

signal A1761_InpX_int_alt      : std_logic_vector(15 downto 0);
signal A1761_OutX_int          : std_logic_vector(15 downto 0) := (others => '1');

signal A1761_rrsel             : std_logic;
signal AB11_pdwn               : std_logic;
signal AB12_pdwn               : std_logic;

signal Load_B1_0_int           : std_logic;   --because this signal is active low
signal Load_B1_1_int           : std_logic;   --because this signal is active low

signal RD_DS_int               : std_logic := '0';

--signals for A1762 ios
signal A1762_SELIODir          : std_logic;
signal A1762_InpX_int_alt      : std_logic_vector(15 downto 0);
signal A1762_OutX_int          : std_logic_vector(15 downto 0) := (others => '1');

--signals for 10788 management
signal GPKD_status      : std_logic_vector(7 downto 0) := (others=>'0');
--for dspl diag through wifi
signal RDA_data_st      :  t_sreg;
signal RDB_data_st      :  t_sreg;
signal dspl_A_off_st    :  std_logic;
signal dspl_B_off_st    :  std_logic;
--required to make the adjustment for extern output(i.e. real DA must be set to not DA out from gpkd implementation)
signal DA_int           :  STD_LOGIC_VECTOR(4 DOWNTO 1); 
signal DB_int           :  STD_LOGIC_VECTOR(4 DOWNTO 1); 
signal Xi_int           :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal DBS_int          :  std_logic;
--forcing supervisor and display from serial
signal B2_data_over     : std_logic_vector(15 downto 0);
signal B3_data_over     : std_logic_vector(24 downto 1);
signal RDA_data_over    :  t_sreg;
signal RDB_data_over    :  t_sreg;
signal bdisplay_over    :  boolean;

--doutfrominternhm is the dout from the simlated intern HM6508
--to be selected in place of inpx(0) which comes from the real hm6805
signal doutfrominternhm  : STD_LOGIC;
signal conditionedinp00  : STD_LOGIC;

--signals for GPIO11696  emulation
signal GPIO11696_OutX_int  : std_logic_vector(24 downto 1); -- := (others => '1');
signal GPIO11696_InpX_int  : std_logic_vector(24 downto 1); -- := (others => '1');
signal gpio11696_status    : std_logic_vector(7 downto 0);  --no usage yet, always 0
alias  outx_11696_grpC     : STD_LOGIC_VECTOR(4 DOWNTO 1) is GPIO11696_OutX_int(12 DOWNTO 9);
alias  outx_11696_grpD     : STD_LOGIC_VECTOR(4 DOWNTO 1) is GPIO11696_OutX_int(16 DOWNTO 13);
signal tonesel             : std_logic_vector(4 downto 0);
--next is temporary for multimanagement of outsound
signal out_sound           : std_logic;


--signals for handling background ram dump and flash
--1/ dump and common
signal bckdr_rx_req        : std_logic;                      -- pos. edge: a byte is requested, 
signal bckdr_rx_dv         : std_logic;                      -- a byte from backdoor ram was received, set to 1 for 1 tick
signal bckdr_rx_byte       : std_logic_vector(7  downto 0);   -- the byte which was just read
--signal bckdr_hrx_byte      : std_logic_vector(7  downto 0);   -- the byte which was just read
--signal bckdr_grx_byte      : std_logic_vector(7  downto 0);   -- the byte which was just read
--signal bckdr_r_device      : std_logic_vector(3  downto 0) := (others=>'0');   -- conf=0000, hmsys=0001, miniprinter=0010, gameprom=0100, A1762=0101
signal bckdr_r_device_uart : std_logic_vector(3  downto 0);   -- conf=00, hmsys=01, miniprinter=10, gameprom=100, A1762=101
signal bckdr_addr          : STD_LOGIC_VECTOR(11 DOWNTO 0);   -- address to be selected in the ram space
--2/ write byte
signal bckdr_tx_req        : std_logic;                      -- pos. edge: a byte is to be written, 
signal bckdr_tx_byte       : std_logic_vector(7 downto 0);   -- the byte to be written
--3/ flash
signal bckdr_fl_req        : std_logic;                      -- pos. edge: flash required, 


--signals for the simulation of switches from uart
--signal mnstb_on            : boolean := false;
signal sw_sig              : std_logic;
signal sw_strb             : std_logic_vector(7 downto 0);
signal sw_ret              : std_logic_vector(7 downto 0);
signal sw_timer            : std_logic_vector(7 downto 0);
--signal sw_strb_latch       : std_logic_vector(7 downto 0);
--signal sw_ret_latch        : std_logic_vector(3 downto 0);
signal r_BitSwitches_int   : t_BitSwitches;

--signals for working with nvram controller
signal is_nvr_cmd_done    : std_logic;  --value set by iic driver (1 at the begining)
signal start_nvr_cmd      : std_logic;  --source g of ctrl is rriot
signal nvr_cmd            : std_logic_vector(2 downto 0)  := cFramNop;

signal r_device           : std_logic_vector(2 downto 0)  := "000";
signal r_size             : unsigned(10 downto 0)          := "00010000000";
signal r_hsize            : unsigned(7 downto 0)           := "10000000";
signal r_gsize            : unsigned(10 downto 0)          := "00010000000";
signal r_baseAddr         : unsigned(15 downto 0) := (others => '0');
signal r_hbaseAddr        : unsigned(15 downto 0) := (others => '0');
signal r_gbaseAddr        : unsigned(15 downto 0) := (others => '0');

--for hmsys interfacing
signal hdout8_int          : std_logic_vector(7  downto 0);   
--signal bd_hdout_int        : std_logic_vector(7  downto 0);
signal bd_haddr_int        : std_logic_vector(6 downto 0);
--for rom (game or A1762) interfacing
signal gdout8_int          : std_logic_vector(7  downto 0);   
--signal bd_gdout_int        : std_logic_vector(7  downto 0);
signal bd_gaddr_int        : std_logic_vector(10 downto 0);
--for aiguilling one or the other
signal bd_din             : std_logic_vector(7  downto 0);
signal bd_dout            : std_logic_vector(7  downto 0);
signal bd_addr            : std_logic_vector(10 downto 0);

--soft_reset
signal soft_reset         : std_logic;
signal soft_reset_uart    : std_logic;

--super short reset of 15 ticks 
signal short_reset        : std_logic := '1';

--SPI control
signal nCS_SPI_int        : std_logic_vector(0 downto 0);
signal SCK_SPI            : std_logic;

signal S25_tx_ena         : std_logic := '0';

--Infos from SPI
signal S25_DID            : std_logic_vector(8*8-1 downto 0);
signal id_configured      : std_logic := '0';

--reset ram of the game rom to its initial value (the coe file)

begin
    --mixing data from all perpih sources
    ID(8 downto 5)    <= ID_out_cpu(8 downto 5)   when ID_out_cpu(8 downto 5)   /= "ZZZZ" else
                         ID_out_A1761(8 downto 5) when ID_out_A1761(8 downto 5) /= "ZZZZ" else
                         ID_out_A1762(8 downto 5) when ID_out_A1762(8 downto 5) /= "ZZZZ" else
                         "ZZZZ";
    ID(4 downto 1)    <= ID_out_A1761(4 downto 1) when ID_out_A1761(4 downto 1) /= "ZZZZ" else
                         ID_out_A1762(4 downto 1) when ID_out_A1762(4 downto 1) /= "ZZZZ" else
                         ID_out_10788(4 downto 1) when ID_out_10788(4 downto 1) /= "ZZZZ" else
                         ID_out_11696(4 downto 1) when ID_out_11696(4 downto 1) /= "ZZZZ" else
                         "ZZZZ";
    
 

    --anti chtonk at reset
    nOEIOs <= '1' when SPO = '1' else
              '0';
              --A1762_SELIODir;   
    
    --other permanent assignments
    RD_DS     <= not RD_DS_int;
    nCK_B     <= nCKB;
    CK_A      <= CKA;
    SCL_INT   <= 'Z';   --no usage here
    SDA_INT   <= 'Z';   --no usage here
    nCS_SPI   <= nCS_SPI_int(0);    
    
    --I/O management for A1761
    -- IO2 is HM6508 enable signal  (active low)
    -- IO4 is 4040 clock
    -- IO5 is 4040 reset (active high)
    -- IO0 is data in (read from HM6508, thru T2)
    -- IO1 is data out (write to HM6508)
    -- IO3 is HM6508 write enable signal  (active low)

    --A1761_InpX_int_alt(15 downto 1) <= A1761_InpX_int(15 downto 1);
    A1761_InpX_int_alt(15 downto 1) <= A1761_OutX_int(15 downto 1);
    
    --the first part of equation for selftest of IOs...
    conditionedinp00 <= '0'              when A1761_OutX_int(0)='0' else                     --line held by B1 to 0
--                        doutfrominternhm when A1761_OutX_int(1)='1' and A1761_OutX_int(2)='0' and A1761_OutX_int(3)='1' else
--                        '1';
                          doutfrominternhm;
                          
    A1761_InpX_int_alt(0) <= '1' when A1761_SELIODir = '1' else
                             conditionedinp00;
--    A1761_InpX_int_alt(0) <= 
--                             conditionedinp00;

    
    --I/O management for A1762
    --reminder: IO15 is tied to 0 by HW. will serve in selftest then important to
    --          respect this montage
    --IOs set as input. All read as 1 except IO15 which is 0
    A1762_InpX_int_alt <= "0111111111111111" when A1762_SELIODir = '1' else
    --IOs set as output. All are driven by output flipflops, except IO15 which is kept at 0
                          '0'&A1762_OutX_int(14 downto 0);
    
    
    --I/O management for 11696
    --the values read are same as the values written because of the pull-downs to -12V
    GPIO11696_InpX_int  <= GPIO11696_OutX_int; 
    
    
    
    --DIO management. Recreate the inversion implemented on original RS3
    --there is a first inversion due to negative logic of pps4. Applies to all
    --there is a second inversion (INV 7404) on DOA only => no inversion for DOA in the end
    --temporary for tests...
    --settings1(1) is settings bit for shunting coil oc&cc selftests
    --settings1(2) is settings bit for inverting DIA hence allowing us to play without mux board connected
    DIA_int <= DIA_Brd or DIAPlus;
    DIA_Brd <= "1011" when (DOA_int = "1010" and settings1(1) = '1')                                   else
               --"1111"; --all to off state
               --sw_ret_latch(3 downto 0) when (mnstb_on = true and DOA_int = sw_strb_latch(3 downto 0)) else
               DIA                      when settings1(2) = '1'                                        else
               not DIA;
    DO      <= DOA_int;
    
    --now, let's manage DIO. Probably useless, because not used on RS3
    --but never know, maybe used for self test or something like this
    --DIO is written with X through DOA, and read with DIB. RS3 circuitry tells us it's all tied to -12V
    --which is equivalent here to Z, because we finally read exactly what is written by cpu.
    DIO     <= (others => 'Z');
    
    
    --switch simulator process (obsolete)
--p_sw_sim:	 process (SYSCLK)
--        variable  delay       : natural range  0 to 16777215 := 0; 
--    begin
--        if rising_edge(SYSCLK) then
--            if sw_sig = '1' then
--                --start monostable and latch params
--                mnstb_on        <= true;
--                sw_strb_latch   <= sw_strb;
--                sw_ret_latch    <= sw_ret(3 downto 0);
--            end if;
--            if mnstb_on = true then
--                delay := delay+1;
--                if delay > 5000000 then
--                    delay  := 0;
--                    mnstb_on <= false;
--                end if;
            
--            end if;
--        end if;
--    end process p_sw_sim;
    
    PPS411660: pps4Core
    Port map(
          hiclk        => SYSCLK,
          po           => CPU_PO, --not SW2 or soft_reset,
          spo          => SPO,
          nckb         => nCKB,
          cka          => CKA,
          pps4_phi     => pps4_phi,
          ab           => AB,
          din          => ID,
          dout         => ID_out_cpu,
          wio          => WIO,
          doa          => DOA_int,
          dia          => DIA_int,
          dio          => DIO
          );

      -- following is not good
      -- AB is never read as 'Z', but as 'X' with the present design
      -- in pps4core.vhd 
--      AB11_pdwn   <= '0' when AB(11) = 'Z' else
--                     AB(11);
                     
--      AB12_pdwn   <= '0' when AB(12) = 'Z' else
--                     AB(12);

      Load_B1_0   <= not Load_B1_0_int;
      Load_B1_1   <= not Load_B1_1_int;      
                           
      AB11_pdwn   <= AB(11);
                     
      AB12_pdwn   <= AB(12);
                     
      A1761_rrsel <= AB11_pdwn or AB12_pdwn;

      SelDir_B1<= A1761_SELIODir;

            
      A1761plus : RRIOTA17    
                Generic map(
                   --config for A1752:
                   --g_RAMSEL = '0'; g_RAMAB8 = '0'; g_ROMSEL => '0'
                   --config for A1761:
                   --g_IODEVNUM ="10"   (4 is 0 10 0)
                   --g_RAMSEL = '0'; g_RAMAB8 = '0'; g_ROMSEL => '0'
                   --config for A1762:
                   --g_IODEVNUM ="01"   (4 is 0 10 0)
                   --g_RAMSEL = '0'; g_RAMAB8 = '1'; g_ROMSEL => '1'
                   --config for A1753:
                   --g_RAMSEL = '0'; g_RAMAB8 = '1'; g_ROMSEL => '1'
                   g_IODEVNUM => "10",
                   g_RAMSEL   => '0',
                   g_RAMAB8   => '0',
                   g_ROMSEL   => '0',
                   g_ref      =>  16#61#  -- select the A1761 recel rom content
                   --g_ref    =>  16#52CF#  -- select the A1752CF rom content
                   )
                Port map (
                    hiclk    =>  SYSCLK,
                    spo      =>  SPO,
                    pps4_phi =>  pps4_phi,
                    seliodir =>  A1761_SELIODir,
                    inpx     =>  A1761_InpX_int_alt,  
                    outx     =>  A1761_OutX_int,
                    rrsel    =>  A1761_rrsel,
                    ab       =>  '0'&AB(10 downto 1),
                    din      =>  ID,
                    dout     =>  ID_out_A1761,
                    wio      =>  WIO);
         
       SelDir_B2 <= A1762_SELIODir;
       
       A1762plus : RRIOTA17G    
                Generic map(
                   --config for A1752:
                   --g_RAMSEL = '0'; g_RAMAB8 = '0'; g_ROMSEL => '0'
                   --config for A1761:
                   --g_IODEVNUM ="10"   (4 is 0 10 0)
                   --g_RAMSEL = '0'; g_RAMAB8 = '0'; g_ROMSEL => '0'
                   --config for A1762:
                   --g_IODEVNUM ="01"   (4 is 0 10 0)
                   --g_RAMSEL = '0'; g_RAMAB8 = '1'; g_ROMSEL => '1'
                   --config for A1753:
                   --g_RAMSEL = '0'; g_RAMAB8 = '1'; g_ROMSEL => '1'
                   g_IODEVNUM => "01",
                   g_RAMSEL   => '0',
                   g_RAMAB8   => '1',
                   g_ROMSEL   => '1',
                   --g_ref      =>  16#62#      -- select the standard A1762 recel rom content
                   --g_ref      =>  16#62B#     -- select the 2716 promed A1762 recel rom content
                   g_ref      =>  cG_selected  -- select the 2716 promed A1762 recel rom content
                   --g_ref    =>  16#52CF#  -- select the A1752CF rom content
                   )
                Port map (
                    hiclk    =>  SYSCLK,
                    spo      =>  SPO,
                    pps4_phi =>  pps4_phi,
                    seliodir =>  A1762_SELIODir,
                    inpx     =>  A1762_InpX_int_alt,  
                    outx     =>  A1762_OutX_int,
                    rrsel    =>  AB(11),
                    ab       =>  AB(12)&AB(10 downto 1),
                    din      =>  ID,
                    dout     =>  ID_out_A1762,
                    wio      =>  WIO,
                    
                    r_device =>  r_device(1 downto 0), -- gameprom=00, A1762=01
                    
                    -- makes the courroie de transmission between i2C module and nvram owner                  
                    en8            => en8_int and
                                      (r_device(2)),
                    we8            => we8_int,
                    addr8          => addr8_int,  --game rom addr field is 10 downto 0 only...                  
                                                  --because it's either 1KB of A17 rom
                                                  --or 4x256b of the same thing for game rom
                    dout8          => gdout8_int,   
                    din8           => din8_int
 
                    );

      --must be inverted because, you know, the negative logic inside=> positive logic outside
      DA   <= not DA_int;
      DB   <= not DB_int;
      DBS  <= not DBS_int;
      Xi   <= not Xi_int;
      -- on RS3 MPU, 10788's SC5, SC6, SC7 are all set to '1'
      GPKD  : GPKD10788    port map (hiclk          => SYSCLK, 
                                     spo            => SPO, 
                                     pps4_phi       => pps4_phi,
                                     sc5 =>'1', sc6 =>'1', sc7=>'1',
                                     x              => Xi_int, 
                                     dbs            => DBS_int,
                                     status         => GPKD_status,
                                     RDA_data_st    => RDA_data_st,
                                     RDB_data_st    => RDB_data_st,
                                     dspl_A_off_st  => dspl_A_off_st,
                                     dspl_B_off_st  => dspl_B_off_st,

                                     RDA_data_over  => RDA_data_over,
                                     RDB_data_over  => RDB_data_over,
                                     bdisplay_over  => bdisplay_over,
                                     
                                     da             => DA_int, 
                                     db             => DB_int, 
                                     y              => (others => '1'), --Y not used on RS3, tied to -12V
                                     id             => ID, 
                                     wio            => WIO,
                                     do             => ID_out_10788,
                                     dldir          => open   --we now use Z into do when necessary, dldir is obsolete
                                     );


      MYRAMCMOS :  hmsys
                Port map (
                    hiclk          => SYSCLK,
                    spo            => SPO,
                    nEn            => A1761_OutX_int(2),              -- IO2 is HM6508 enable signal  (active low)
                    aClk           => A1761_OutX_int(4),              -- IO4 is 4040 clock
                    aReset         => A1761_OutX_int(5),              -- IO5 is 4040 reset (active high)
                    dout           => doutfrominternhm,               -- IO0 is data in (read from HM6508, thru T2)
                    din            => A1761_OutX_int(1),              -- IO1 is data out (write to HM6508)
                                        
                    
                    -- makes the courroie de transmission between i2C module and nvram owner                  
                    r_device       => r_device(1 downto 0),
                    en8            => en8_int and
                                      (not r_device(2)),
                    we8            => we8_int,
                    addr8          => addr8_int(6 downto 0),  --nvram addr field is 6 downto 0 only...                  
                    dout8          => hdout8_int,   
                    din8           => din8_int,
                                                         
                    wEn            => A1761_OutX_int(3),              -- IO3 is HM6508 write enable signal  (active low)
                    serial_nb      => r_Serial
                          );

    GPIO_11696 :  gpio11696
    Port map ( 
           hiclk         => SYSCLK,
           spo           => SPO,
           pps4_phi      => pps4_phi,
           sc1           => '1',             --code of 11696 is D on recel sys3
           sc2           => '0',
           sc3           => '1',
           sc4           => '1',
           inx           => GPIO11696_InpX_int, 
           outx          => GPIO11696_OutX_int,
           status        => gpio11696_status,           
           id            => ID,
           wio           => WIO,
           do            => ID_out_11696,    --we are in read only mode
           dldir         => open);           --we are in read only mode 
           
            
    --make the tonesel vector from the GPIO11696 appropriate outputs
    --tonesel is vector(4 downto 0) : 0 for 10 points, 4 for 100k points
    tonesel <=     (outx_11696_grpC(4),
                    outx_11696_grpD(1),outx_11696_grpD(2),
                    outx_11696_grpD(3),outx_11696_grpD(4));
               
    CHIMES :        gentones
    Port map (
           hiclk         => SYSCLK,
           tonesel       => tonesel when bdisplay_over = false else B3_data_over(16 downto 12),
           soundout      => out_sound
           );    
             
     -- Sound output         
     OutSound  <= out_sound;
    
     -- pin C1 (pin 2 of U17) (A1 of I2C ext. fram)
     OPTIN2_33 <= 'Z';   -- or '1' if you prefer
     -- pin D1 (pin 1 of U17) (A0 of I2C ext. fram)
     OPTIN3_33 <= 'Z';   -- or '1' if you prefer

 
    
      --used by serendipity for diagnostic of system and not required for the A17 model
      --this tracer contains an entire RAM spy copy, a passive GPKD (don't forget to select right config id), etc...
                PPS4TRACE : serialtrace    
                Port map (
                    hiclk       =>  SYSCLK,

                    spo         => SPO,
                    TXp         =>  TXp,
                    RXp         =>  RXp,
                    
                    --for interfacing with gpkd virtual component
                    GPKD_status => GPKD_status,
                    --for diag through wifi
                    RDA_data_st   => RDA_data_st,
                    RDB_data_st   => RDB_data_st,
                    dspl_A_off_st => dspl_A_off_st,
                    dspl_B_off_st => dspl_B_off_st,

                    status        =>  tracer_status,
                    hm_user_sel   =>  hm_user_sel,
                    
                    bckdr_fl_req   =>  bckdr_fl_req,       -- pos. edge: a flash is requested, 
                    bckdr_rx_req   =>  bckdr_rx_req,       -- pos. edge: a byte is requested, 
                    bckdr_tx_req   =>  bckdr_tx_req,       -- pos. edge: a byte is to be written, 
                    bckdr_rx_dv    =>  bckdr_rx_dv,       -- a byte from backdoor ram was received, set to 1 for 1 tick
                    bckdr_rx_byte  =>  bckdr_rx_byte,      -- the byte which was just read
                    bckdr_tx_byte  =>  bckdr_tx_byte,      -- the byte to be written
                    
                    bckdr_r_device =>  bckdr_r_device_uart,-- conf=000, hmsys=001, miniprinter=010, gameprom=100, A1762=101
                    bckdr_addr     =>  bckdr_addr,         -- address to be selected in the ram space
                    
                    sw_sig         =>  sw_sig,
                    sw_strb        =>  sw_strb,
                    sw_ret         =>  sw_ret,
                    sw_timer       =>  sw_timer,

                    --signals for switch matrix
                    -- handled in swmtrx.vhd
                   r_BitSwitches   =>  r_BitSwitches_int,
                           
                    gpio           =>  GPIO11696_OutX_int,
                    
                    inpx           =>  A1761_InpX_int_alt,
                    outx           =>  A1761_OutX_int,
                    
                    outx2          =>  A1762_OutX_int,
                    
                    ident          =>  S25_DID, --cIdentSw,
                    
                    DIP_SW         =>  DIP_SW_State,
                    
                    B2_data_over   =>  B2_data_over,
                    B3_data_over   =>  B3_data_over,
                    RDA_data_over  =>  RDA_data_over,
                    RDB_data_over  =>  RDB_data_over,
                    bdisplay_over  =>  bdisplay_over,
                    
                    soft_reset     =>  soft_reset_uart);
          
 
      ErrCod <= cResetErr    when SPO = '1'           else
                cIICErr      when iic_status(0) = '1' else  
                cnoErr; 

      --UserCod(4 downto 0) <= tonesel or hmsys_status(4 downto 0);
      UserCod(4 downto 0) <= startup_status(4 downto 0);
      UserCod(5)          <= -- '1' when (tracer_status = X"53") else
                             not SW1;
      UserCod(6)          <= not SW2;
      UserCod(7)          <= startup_status(7);    
      LEDCTL :  ledctrl port map    ( hiclk   => SYSCLK,
                                      ErrCod  => ErrCod,
                                      UserCod => UserCod,
                                      vs0     => VS0,
                                      vs1     => VS1,
                                      vs2     => VS2);
                                      
      IOXADAPT : ioxAdapter port map (
                    hiclk             => SYSCLK,
                    spo               => SPO,
                    pps4_phi          => pps4_phi,
                    A1761_inpx_gen    => A1761_InpX_int,       --to the standard pps4 ios manager module 
                    A1761_outx_read   => A1761_OutX_int,       --to the standard pps4 ios manager module 
                    pA1762_outx_read  => A1762_OutX_int,       --to the standard pps4 ios manager module 
                    iox               => IOx,            --to the extern mux interface 
                    RD_DS             => RD_DS_int,
                    DIP_SW            => DIP_SW_State,
                    Load_B1_0         => Load_B1_0_int,  --shall be inverted because active low
                    Load_B1_1         => Load_B1_1_int,  --shall be inverted because active low
                    Load_B2_0         => Load_B2_0,      --active high 
                    Load_B2_1         => Load_B2_1,      --active high
                    Load_B3_AB        => Load_B3_AB,  
                    Load_B3_CD        => Load_B3_CD,  
                    Load_B3_EF        => Load_B3_EF,  
                    pGPIO11696_OutX   => GPIO11696_OutX_int, 
                    seliobank         => open,
                    latchiobank       => open,

                    IO_data_over      => B3_data_over&B2_data_over, --(31 downto 16=>'0')&"0101010101010101",
                    bIOs_over         => bdisplay_over,
                    
                    settings1         => settings1
                    );      

--Ce process pour aiguiller vers la bonne mémoire en fonction de la commande
--Il faut savoir que hmsys emet des nvr_command spontanément
--notamment au début pour lire la sys config et tout ca
--du coup c'est un peu naze comme archi là...
--p_r_device: process(SYSCLK)
--        variable last_is_nvr_cmd_done  : std_logic := '1';
--    begin
--        if rising_edge(SYSCLK) then

--            --At reset bckdr_r_device is initialised to 0, hence no problemo at the beginning
--            --nvr_cmd is either nvr_cmd_h or _g
--            if  bckdr_fl_req = '1' then
--                bckdr_r_device <= bckdr_r_device_uart;
            
--            elsif bckdr_rx_req = '1' then
--                bckdr_r_device <= bckdr_r_device_uart;
           
--            elsif bckdr_tx_req = '1' then 
--                bckdr_r_device <= bckdr_r_device_uart;
----            elsif last_is_nvr_cmd_done = '0' and is_nvr_cmd_done = '1' then
----                bckdr_r_device <= "0000";  --Ca c'est pour les hmsys émis spontanément...
--            end if;
            
--            last_is_nvr_cmd_done := is_nvr_cmd_done; 
                              
--        end if;                      
--    end process p_r_device;
    
    
    
--     bckdr_rx_byte  <= bckdr_hrx_byte when bckdr_r_device(2) = '0' else
--                       bckdr_grx_byte when bckdr_r_device(2) = '1'; 
    
--    bckdr_rx_byte  <= bckdr_hrx_byte;
    
      dout8_int   <= gdout8_int  when r_device(2) = '1' else
                  hdout8_int; 
                     
                       
     --bckdr_r_device <= bckdr_r_device_uart;  --test test


--    start_nvr_cmd <= start_nvr_cmd_g;             --from client to iicmgr (T0)
--    nvr_cmd       <= nvr_cmd_g;                   --from client to iicmgr (T0)
--    bd_din_int    <= bd_gdin_int;                 --
--    bd_addr_int   <= bd_gaddr_int;
--    dout8_int     <= gdout8_int;
--    r_size        <= r_gsize;
--    r_baseAddr    <= r_gbaseAddr;


--    start_nvr_cmd <= start_nvr_cmd_h;             --from client to iicmgr (T0)
--    nvr_cmd       <= nvr_cmd_h;                   --from client to iicmgr (T0)
--    bd_din_int    <= bd_hdin_int;                 --
--    bd_addr_int   <= ((10 downto 7 => '0'), (6 downto 0 => bd_haddr_int));
--    dout8_int     <= hdout8_int;
--    r_size        <= "000"&r_hsize;
--    r_baseAddr    <= r_hbaseAddr;
     IICMNG  :  i2cctl port map (
                                    hiclk        => SYSCLK,
                                    
                                    --to r/w entire memory FRAM<->RAM
                                    start        => start_nvr_cmd,     -- rising edge to start
                                    command      => nvr_cmd,           -- command to be executed
                                    done         => is_nvr_cmd_done,   -- set to 0 on start until finished

                                    --memory infos
                                    r_baseAddr     => r_baseAddr,      --base address in the fram
                                    r_size         => r_size,          --block size to be transferred
               
                                    --backdoor interface
                                    bd_din         => bd_din,     
                                    bd_dout        => bd_dout,
                                    bd_addr        => bd_addr,

                                    --interface with memory device
                                    en8           => en8_int,
                                    we8           => we8_int,
                                    addr8         => addr8_int,
                                    dout8         => dout8_int,        --TBD. this is an input for us here, because it is the 
                                                                       --dout of the memory to be read and stored into iic
                                    din8          => din8_int,         --this is an output for us here, because it is the 
                                                                       --din of the memory to be written from iic
                                    status        => iic_status,       --Only bit 0 is meaningful (iic ack error)
                                    --access i2C
                                    scl           => SCL,
                                    sda           => SDA
                                );

--p_soft_rest: process(SYSCLK)
--    variable last_soft_reset_uart : std_logic := '0';
--    begin
--        if rising_edge(SYSCLK) then
--            if soft_reset_uart = '1' and last_soft_reset_uart = '0' then
--                soft_reset <= '1';
--            elsif SW2 = '0' then
--                soft_reset <= '0';            
--            end if;
--            last_soft_reset_uart := soft_reset_uart;            
--        end if;

--    end process p_soft_rest;
    soft_reset <= soft_reset_uart;
    
    STARTUP_INST : startupmng port map(
                        hiclk               => SYSCLK,
                   
                        --in, board reset (HW coming from Switch for example, or SW coming from serial
                        brd_po              => not SW2 or soft_reset,
           
                        --out, management of po signal which is the HW reset of pps4 core
                        cpu_po              => CPU_PO,      --this is the pps4 core reset signal 

                        trigger_fwrite      => true when AB=X"5FC" else false,

                        --comes from serialtrace entity
                        bckdr_fl_req        => bckdr_fl_req,        -- pos. edge: a flash is requested, 
                        bckdr_rx_req        => bckdr_rx_req,        -- pos. edge: a byte is requested, 
                        bckdr_tx_req        => bckdr_tx_req,        -- pos. edge: a byte is to be written, 
                        bckdr_rx_dv         => bckdr_rx_dv,  --to be unmux'd
                        bckdr_rx_byte       => bckdr_rx_byte,-- the byte which was just read
                        bckdr_tx_byte       => bckdr_tx_byte,-- the byte to be written
                        bckdr_r_device      => bckdr_r_device_uart(2 downto 0),   -- conf=00, hmsys=01, miniprinter=10
                        --Addr. issued by the serial interface (receiver)
                        bckdr_addr          => bckdr_addr(10 downto 0),   -- address to be selected in the ram space
        
                        --control/command of iic entity
                        start_nvr_cmd       => start_nvr_cmd,
                        nvr_cmd             => nvr_cmd,
                        is_nvr_cmd_done     => is_nvr_cmd_done,
                        -- parameters depending on the command. Exchanges btw iicmng<=>mem device
                        bd_din              => bd_din,
                        bd_dout             => bd_dout,
                        bd_addr             => bd_addr,
                        -- paramaters depending on the command for full r/w
                        r_size              => r_size,          --block size to be transferred
                        r_baseAddr          => r_baseAddr,          --base address in the fram
                        r_device            => r_device,
                  
                        settings1           => settings1,
                        
                        ident               =>  S25_DID, --cIdentSw,
                        id_configured       => id_configured,
                        
                        status              => startup_status

                    );

SWMTRX_INST :  swmtrx port map (
                        hiclk             => SYSCLK,

                        reset_n           => not SPO,
                        
                        sw_sig            => sw_sig,
                        sw_strb           => sw_strb,
                        sw_ret            => sw_ret,
                        sw_timer          => sw_timer,
                        
                        --dia is not used in swmtrx at the moment
                        dia               => DIA_Brd,
                        doa               => DOA_int,

                        r_BitSwitches     => r_BitSwitches_int,
                                           
                        diaplus           => DIAPlus

   );
  
STARTUPE2_inst : STARTUPE2
generic map (
 PROG_USR => "FALSE", -- Activate program event security feature. Requires encrypted bitstreams.
 SIM_CCLK_FREQ => 10.0 -- Set the Configuration Clock Frequency(ns) for simulation.
)
port map (
 CFGCLK => open,      -- 1-bit output: Configuration main clock output
 CFGMCLK => open,     -- 1-bit output: Configuration internal oscillator clock output
 EOS => open,         -- 1-bit output: Active high output signal indicating the End Of Startup.
 PREQ => open,        -- 1-bit output: PROGRAM request to fabric output
 CLK => '0',          -- 1-bit input: User start-up clock input
 GSR => '0',          -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
 GTS => '0',          -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
 KEYCLEARB => '1',    -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
 PACK => '0',         -- 1-bit input: PROGRAM acknowledge input
 USRCCLKO => SCK_SPI, -- 1-bit input: User CCLK input
 USRCCLKTS => '0',    -- 1-bit input: User CCLK 3-state enable input
 USRDONEO => '1',     -- 1-bit input: User DONE pin output control
 USRDONETS => '0'     -- 1-bit input: User DONE 3-state enable output
);
-- End of STARTUPE2_inst instantiation



p_supershort_rest: process(SYSCLK)
    variable count_ticks : natural range 0 to 15 := 15;
    begin
        if rising_edge(SYSCLK) then
            if count_ticks > 0 then
                count_ticks := count_ticks - 1;
                short_reset <= '1';
            else
                short_reset <= '0';            
            end if;
        end if;

    end process p_supershort_rest;

S25FL064_INST :  s25fl064l 
  GENERIC MAP(
    clk_freq       => 50,  --system clock frequency in MHz
    spi_clk_div    => 5)  --spi_clk_div = clk_freq/100 (answer rounded up)
  PORT MAP(
    clk            => SYSCLK,                      --system clock
    reset_n        => not short_reset, --not nOEIOs, --'1',                    --active low asynchronous reset
    S25_tx_ena     => '0', --off, '1', --S25_tx_ena,
    S25_DID        => S25_DID,
    configured     => id_configured,
    busy           => open,             --indicates when transactions with DAC can be initiated
    miso           => SO_IO1,                      --SPI bus from S25L064L flash: master in, slave out (DOUT)
    mosi           => SI_IO0,                      --SPI bus to S25L064L flash: master out, slave in (DIN)
    sclk           => SCK_SPI,
    ss_n           => nCS_SPI_int
    ); --SPI bus to DAC: slave select (~SYNC)


end Behavioral;
