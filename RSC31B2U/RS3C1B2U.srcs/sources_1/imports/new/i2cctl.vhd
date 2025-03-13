----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2024 10:26:14
-- Design Name: 
-- Module Name: i2cctl - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

use work.libfram.all;

entity i2cctl is
  Port ( 
               hiclk       : in     STD_LOGIC;
               
               --to r/w entire memory FRAM<->RAM
               start       : in     std_logic;                    -- rising edge to start
               command     : in     std_logic_vector(2 downto 0); -- command to be executed
               done        : out    std_logic;                    -- set to 0 on start until finished

               --memory infos
               r_baseAddr  : in     unsigned(15 downto 0); --base address in the fram
               r_size      : in     unsigned(10 downto 0);          --block size to be transferred

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
end i2cctl;

architecture Behavioral of i2cctl is

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


--interface with extern world
signal   dout8_int   : std_logic_vector (7 downto 0);
signal   din8_int    : std_logic_vector (7 downto 0);
signal   en8_int     : std_logic := '0';
signal   we8_int     : STD_LOGIC_VECTOR(0  DOWNTO 0) := (others => '0');
signal   addr8_int   : STD_LOGIC_VECTOR(10 DOWNTO 0);

-- signals for iic management
signal busy_iic      : STD_LOGIC :='0';
signal i2c_addr      : std_logic_vector (6 downto 0);
signal i2c_rw        : STD_LOGIC :='0';
signal i2c_data_wr   : std_logic_vector (7 downto 0);
signal i2c_data_rd   : std_logic_vector (7 downto 0);

signal error_iic     : STD_LOGIC;
signal i2c_ena       : STD_LOGIC :='0';
signal data_iic_in   : std_logic_vector (7 downto 0);
signal addr_iic      : std_logic_vector (7 downto 0);
signal operation_iic : std_logic_vector (1 downto 0) := "00";

signal last_busy_iic : std_logic := '0';
signal last_start    : std_logic := '0';
signal done_int      : std_logic := '1';

signal reset_n       : std_logic := '1';

--state machine
TYPE machine IS (st_idle, st_reset, st_writeBuf, st_writeAll, st_readAll,  st_readBuf, st_stop); --needed states
SIGNAL state         : machine := st_idle;                        --state machine


begin


--permanent affectations
    done      <= done_int;

    dout8_int   <= dout8;   --this relay through _int is unnecessary, but you never know in the future...
    din8        <= din8_int; 
    en8         <= en8_int;
    we8         <= we8_int;
    addr8       <= addr8_int;

    status      <= "0000000"&error_iic;
  
p_command:	 process (hiclk)
		 variable stop_reading : boolean := false;
		 variable stop_writing : boolean := true;
		 variable framAddr     : integer range 0 to 31 := 0;
		 variable offs         : natural range 0 to 31 := 6;
         --constant C_STRING     : string   := "AA55 Consulting group zobi";
         constant C_OFFSET     : integer range 0 to 31 := 5;
         variable sleepers     : natural range 0 to 1000000 := 0;
         variable busy_falling_edge : boolean := false;
         variable busy_cnt     : integer range 0 to 2048 := 0;
         variable substate     : integer := 0;
         variable letswrite    : natural range 0 to 3 := 0;
         
         --variable tempozobi    : character := C_STRING(1);
	 begin
	   if rising_edge(hiclk) then

            last_busy_iic <= busy_iic;                       --capture the value of the previous i2c busy signal
            IF(last_busy_iic = '0' AND busy_iic = '1') THEN  --i2c busy just went high
                busy_cnt := busy_cnt + 1;                    --counts the times busy has gone from low to high during transaction
            END IF;

	        last_start <= start;
	        
	        case state is 
	           when st_idle =>
	               substate := 0;
	               if last_start = '0' and start = '1' then
	                   done_int <= '0';
	                   busy_cnt := 0;
	                   case command is 
	                       when cFramReset =>
	                           state <= st_reset;
	                       when cFramRead =>
	                           --busy_cnt := 0;
	                           substate := 0;
	                           state <= st_readAll;
	                       when cFramWrite =>
	                           --busy_cnt := 0;
	                           substate := 0;
	                           state <= st_writeAll;
	                       when cFramBufRead  =>
	                           --busy_cnt := 0;
	                           substate := 0;
	                           state <= st_readBuf;
	                       when cFramBufWrite =>
	                           --busy_cnt := 0;
	                           substate := 0;
	                           state <= st_writeBuf;
	                       when others =>
	                           state <= st_stop;
	                   end case;
	               else
	                   done_int <= '1';
	                   null;
	               end if;

	           when st_stop =>
                   en8_int    <= '0';
                   we8_int    <= "0";
                   
	               if busy_iic = '0' then
	                   state      <= st_idle;
	               end if;
	               
	           when st_reset =>
                   case substate is
                       when 0 =>
                           reset_n  <= '0';
                           substate := 1;
                       when 1 =>
                           reset_n  <= '1';
                           substate := 2;
                       when others =>
                           state <= st_stop;
                    end case; --end casesubstate
               
               --read a byte from buffer mem
	           when st_readBuf =>
                   case substate is
                       when 0 =>
                           en8_int    <= '1';
                           we8_int    <= "0";
                           addr8_int  <= bd_addr;
                           substate := 1;
                       -- it's 2 clock cycles for reading RAMBLK
                       -- while it's (surprisingly enough) only 1 clock for DBL1024RAM
                       -- hence we need 2 clocks because of the least efficient
                       when 1 =>
                           substate := 2;
                       when 2 =>
                           substate := 3;
                       when 3 =>                       
                           bd_dout    <= dout8_int;
                           substate := 4;                           
                       when others =>
                           state <= st_stop;
                           
                   end case; --end casesubstate
                    
               --write a byte to buffer mem
	           when st_writeBuf =>
                   case substate is
                       when 0 =>
                           en8_int    <= '1';
                           we8_int    <= "0";
                           addr8_int  <= bd_addr;
                           din8_int    <= bd_din;
                           substate := 1;
                       when 1 =>
                           we8_int(0) <= '1';
                           substate := 2;                           
                       when 2 =>
                           we8_int(0) <= '0';
                           substate := 3;                           
                       when others =>
                           state <= st_stop;
                           
                   end case; --end casesubstate
                    
	           when st_writeAll =>
	               case busy_cnt is  
	                   when 0       =>
	                        --start the frame sending
                            i2c_ena     <= '1';
                            i2c_rw      <= '0';                            
                            i2c_data_wr <= std_logic_vector(r_baseAddr(15 downto 8));    -- MSB address
                            addr8_int   <= (others => '1');  --for test only
	                   when 1       =>
	                        --command+addressH is in progress, prepare for next frame, ie adressL
                            en8_int     <= '1';
                            we8_int(0)  <= '0';
                            addr8_int   <= (others => '0');
                            i2c_data_wr <= std_logic_vector(r_baseAddr(7 downto 0));    -- LSB address
	                   when others  =>
	                         --at 2:     addressL  is in progress, prepare for data(0)
	                         --at 2+x:   data(x-1) is in progress, prepare for data(x)
	                         --hence: at 2+size, stop
                             if busy_cnt < to_integer(r_size)+2 then  --we are at memory rank busy_cnt-2
                                i2c_data_wr <= dout8_int;
                                --i2c_data_wr <= X"CD";
                                
                                --i2c_data_wr <= '0'&addr8_int;
                                IF(last_busy_iic = '1' AND busy_iic = '0') THEN  --i2c busy just went low
                                    addr8_int   <= std_logic_vector( unsigned(addr8_int) + 1 );
                                end if;
                             else
                                i2c_ena <= '0';
                                state <= st_stop;
                            end if;
                

                    end case; -- end case substate                       
                    
	           when st_readAll =>
	               case busy_cnt is  
 	                  when 0     =>
                          i2c_ena <= '1';
                          i2c_rw <= '0';                            
                          i2c_data_wr <= std_logic_vector(r_baseAddr(15 downto 8));    -- MSB address
 	                      --substate := 1;
	                      --busy_cnt := 0;
	                  when 1     =>
                           i2c_data_wr <= std_logic_vector(r_baseAddr(7 downto 0));    -- LSB address
                      when 2     =>
                           --reverse write to read
                           i2c_rw <= '1';   --operation is now read      
                           --prepare for next busy count:
                           en8_int    <= '1';
                           we8_int(0) <= '0';
                           addr8_int <= (others => '0');
                      when others =>
                           if busy_cnt < to_integer(r_size)+3 then  --we are at memory rank busy_cnt-2
                              din8_int <= i2c_data_rd;
                              if letswrite = 0 then
                                  IF(last_busy_iic = '1' AND busy_iic = '0') THEN  --i2c busy just went low
                                      letswrite := 1;
                                  end if;
                              elsif letswrite = 1 then
                                  we8_int(0) <= '1';
                                  letswrite := 2;
                              elsif letswrite = 2 then
                                  addr8_int   <= std_logic_vector( unsigned(addr8_int) + 1 );
                                  we8_int(0) <= '0';
                                  letswrite := 0;
                              end if;
                           else
                              i2c_ena <= '0';
                              state <= st_stop;
                           end if;


                    end case;
 	              
                    
               when others =>
                   i2c_ena <= '0';
                   state <= st_stop;       
	        end case; --end case state        
                   
  
		end if; -- end if rising_edge sysclock
	 end process p_command;
	


      NVRAM_IIC :  i2c_master
       Generic Map (
                input_clk   => 50_000_000, --input clock speed from user logic in Hz
                bus_clk     => 100_000)   --speed the i2c bus (scl) will run at in Hz
       Port Map ( 
               clk          => hiclk,
               reset_n      => reset_n,				-- Reset for I2C Master
               ena          => i2c_ena,	        -- Rising edge sensitive
               addr         => cslavec80Id,	    -- I2C Address of EEPROM
               rw           => i2c_rw,          --'0' is write, '1' is read
               data_wr      => i2c_data_wr,                --data to write to slave
               busy         => busy_iic,        --indicates transaction in progress
               data_rd      => i2c_data_rd,                --data read from slave
               ack_error    => error_iic,                --flag if improper acknowledge from slave
               sda          => sda,         --serial data output of i2c bus
               scl          => scl);            --serial clock output of i2c bus
    

end Behavioral;
