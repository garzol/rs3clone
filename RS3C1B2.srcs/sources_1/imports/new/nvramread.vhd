----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2023 17:52:18
-- Design Name: 
-- Module Name: nvramMng - Behavioral
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
-- Completely changed on 2024-09-25 to separate IIC job from RAM management
-- Necessary because from now we integrate the multigame, hence management of prog RAM
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

use work.libfram.all;

entity nvramMng is
Port (
                   hiclk       : in     STD_LOGIC;
                                      
                   --r_device is required to determine which ram is concerned, among config, hmsys, miniprinter
                   --one can't just determine it from r_baseAddr range
                   --because miniprinter nvram may be used both for hmsys and miniprinter
                   --or not, so user of the entity must specify what they want
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
end nvramMng;

architecture Behavioral of nvramMng is


component i2c_master
  GENERIC(
    input_clk : INTEGER; --input clock speed from user logic in Hz
    bus_clk   : INTEGER);   --speed the i2c bus (scl) will run at in Hz
  PORT(
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
    sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
    scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
END component i2c_master;

COMPONENT DBL1024RAM
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
  );
END COMPONENT;

--container for configuration data:
--128 bytes: config data
--128 bytes: virtual miniprinter (thru wifi)
COMPONENT RAMBLK
  PORT (
    clka  : IN STD_LOGIC;
    ena   : IN STD_LOGIC;
    wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
  );
END COMPONENT;


signal   En_hmsys    : std_logic := '0';
signal   En_cnf      : std_logic := '0';
signal   En_mnprn    : std_logic := '0';


signal   dout8_hmsys : std_logic_vector (7 downto 0);
signal   dout8_cnfg  : std_logic_vector (7 downto 0);
signal   dout8_mnprn : std_logic_vector (7 downto 0);


signal   dout8_int   : std_logic_vector (7 downto 0); 
signal   din8_int    : std_logic_vector (7 downto 0);
signal   en8_int     : std_logic := '0';
signal   we8_int     : STD_LOGIC_VECTOR(0 DOWNTO 0) := (others => '0');
signal   addr8_int   : STD_LOGIC_VECTOR(6 DOWNTO 0);




signal douta_int     : STD_LOGIC_VECTOR(0 DOWNTO 0);  --bit to read (live mode)

signal data_test     : std_logic_vector(7 downto 0);  --for i2c entity check

begin
                   
     douta     <= douta_int;
     
     din8_int    <= din8;
     addr8_int   <= addr8;
     en8_int     <= en8;
     we8_int     <= we8;
     dout8       <= dout8_int;
     
     dout8_int <= dout8_hmsys when En_hmsys = '1' else
                  dout8_cnfg  when En_cnf   = '1' else
                  dout8_mnprn when En_mnprn = '1' else
                  (others => 'Z');
                  

     --0 sys config, 128-255 hmsys mirror, 256- miniprinter     
--     En_cnf    <= en8_int  when r_baseAddr  < 128                       else '0';
--     En_hmsys  <= en8_int  when r_baseAddr >= 128  and r_baseAddr < 256 else '0';
--     En_mnprn  <= en8_int  when r_baseAddr >= 256                       else '0';
     En_cnf    <= en8_int  when r_device = "00"  else '0';
     En_hmsys  <= en8_int  when r_device = "01"  else '0';
     En_mnprn  <= en8_int  when r_device = "10"  else '0';
     

--hmsys mirror    
MYNVRAMMIRROR : DBL1024RAM
  PORT MAP (
    clka  => hiclk,
    ena   => Ena,
    wea   => wEna,
    addra => cur_addr,
    dina  => dina,
    douta => douta_int,
    clkb  => hiclk,
    enb   => En_hmsys,
    web   => we8_int,
    addrb => addr8_int,
    dinb  => din8_int,
    doutb => dout8_hmsys
  );
  
  
SYSCONFIG : RAMBLK
  PORT MAP (
    clka => hiclk,
    ena => En_cnf,
    wea => we8_int,
    addra => addr8_int,
    dina => din8_int,
    douta => dout8_cnfg
  );

MINIPRINTER : RAMBLK
  PORT MAP (
    clka => hiclk,
    ena => En_mnprn,
    wea => we8_int,
    addra => addr8_int,
    dina => din8_int,
    douta => dout8_mnprn
  );
    

end Behavioral;
