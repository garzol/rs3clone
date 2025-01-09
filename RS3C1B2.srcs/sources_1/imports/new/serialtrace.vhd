----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.08.2024 17:02:48
-- Design Name: 
-- Module Name: serialtrace - Behavioral
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
-- reset cmd YBXQZ
--
--List of frame types that this module can send:
--0x41 (A) : display frame. Length:
--0x42 (B) : display frame. Length:
--0x51 (Q) : mem dump 1K bytes.
--0x52 (R) : nvram dump 128 bytes.
--0x53 (S) : switch matrix.
--0x59 (Y) : display IOs
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


entity serialtrace is
    Port ( 
           hiclk            : in     STD_LOGIC;

		   TXp              : out    STD_LOGIC;  
		   RXp              : in     STD_LOGIC;  
		   
		   --for interfacing with gpkd virtual component
           GPKD_status      : in     std_logic_vector(7 downto 0);
           --for diag through wifi
           RDA_data_st      : in     t_sreg;
           RDB_data_st      : in     t_sreg;
           dspl_A_off_st    : in     std_logic;
           dspl_B_off_st    : in     std_logic;

           status           : out    STD_LOGIC_VECTOR (7 downto 0);
           hm_user_sel      : out    std_logic;
           
           bckdr_fl_req     : out    std_logic;                      -- pos. edge: flash required, 
           bckdr_rx_req     : out    std_logic;                      -- pos. edge: a byte is requested, 
           bckdr_tx_req     : out    std_logic;                      -- pos. edge: a byte is to be written, (hmsys zone)
           bckdr_rx_dv      : in     std_logic;                      -- a byte from backdoor ram was received, set to 1 for 1 tick
           bckdr_rx_byte    : in     std_logic_vector(7 downto 0);   -- the byte which was just read
           bckdr_tx_byte    : out    std_logic_vector(7 downto 0);   -- the byte to be written


           bckdr_r_device   : out    std_logic_vector(3 downto 0);   -- conf=00, hmsys=01, miniprinter=10
           bckdr_addr       : out    STD_LOGIC_VECTOR(11 DOWNTO 0);   -- address to be selected in the ram space
           
           sw_sig           : out    std_logic;
           sw_strb          : out    std_logic_vector(7 downto 0);
           sw_ret           : out    std_logic_vector(7 downto 0);
           sw_timer         : out    std_logic_vector(7 downto 0);
                        
           dia              : in     std_logic_vector(4 downto 1);
           doa              : in     std_logic_vector(4 downto 1);

           gpio             : in     STD_LOGIC_VECTOR (24 downto 1);
           
           inpx             : in     STD_LOGIC_VECTOR (15 downto 0);
           outx             : in     STD_LOGIC_VECTOR (15 downto 0);
           
           outx2            : in     STD_LOGIC_VECTOR (15 downto 0);
           
           ident            : in     std_logic_vector(8*8-1 downto 0);

           DIP_SW           : in     std_logic_vector(7 downto 0);
                      
           soft_reset       : out    std_logic);

end serialtrace;

architecture Behavioral of serialtrace is

component uart_tx is
 generic (
	g_CLKS_PER_BIT : integer := 2604   -- Needs to be set correctly
	);
 port (
	i_clk       : in  std_logic;
	i_tx_dv     : in  std_logic;
	i_tx_byte   : in  std_logic_vector(7 downto 0);
	o_tx_active : out std_logic;
	o_tx_serial : out std_logic;
	o_tx_done   : out std_logic
	);
end component uart_tx;


component uart_rx is
 generic (
	g_CLKS_PER_BIT : integer := 2604   -- i.e. 19200bauds if clock at 50MHz Needs to be set correctly
	);
 port (
	i_clk       : in  std_logic;
	i_rx_serial : in  std_logic;
	o_rx_dv     : out std_logic;
	o_rx_byte   : out std_logic_vector(7 downto 0)
	);
end component uart_rx;
 
component fletcher is
    Port ( 
           hiclk       : in     std_logic;
           cmdclk      : in     STD_LOGIC;
           nbyte       : in     std_logic_vector(7 downto 0);
           reset       : in     std_logic;
           crc         : out    std_logic_vector(15 downto 0));
end component fletcher;

--signals for fletcher management
signal fltch_cmdclk    : std_logic := '0';
signal fltch_nbyte     : std_logic_vector(7 downto 0) := (others=>'0');
signal fltch_reset     : std_logic := '0';
signal fltch_crc       : std_logic_vector(15 downto 0);


--uart sigs
-- constant c_CLKS_PER_BIT : integer := 2604;  --19200 bauds
-- constant c_CLKS_PER_BIT : integer := 434;      --115200 bauds
constant c_CLKS_PER_BIT : integer := 167;      --300000 bauds
--for tx
signal r_TX_DV     : std_logic := '0';    -- command start transmitting
signal r_TX_BYTE   : std_logic_vector(7 downto 0); -- byte to send
signal w_TX_DONE   : std_logic := '0';  -- rises when finished
signal w_TX_BUSY   : std_logic := '0';  -- 0 TX if available, 1 otherwise
--for rx
signal w_RX_DV     : std_logic := '0';  --signal a byte received (stay 1 for 4 ticks)
signal w_RX_BYTE   : std_logic_vector(7 downto 0); -- byte read

--rx command is 3-byte long
type t_RxCmd is array (0 to 3) of std_logic_vector(7 downto 0);
signal RX_CMD      : t_RxCmd := (X"00", X"00", X"00", X"00");
signal NEW_CMD4    : boolean := false;


--signals for switch matrix
-- Creates a 10x4 array for switch matrix 0 to 9 (S0..S9), 0 to 3 (R0..R3)
-- S0..S9<=> DOA, as output of SN7445 of mux board. case "A" is out of scope (reserved for sc, oc of coils...)
-- R0..R3<=>return lines from DIA
type t_Row_Col   is array (0 to 9, 0 to 3) of integer range 0 to 3;
type t_BitSwitches is array (0 to 9)         of std_logic_vector(0 to 3); --there are 4x10 individual switches 
signal r_BitSwitches : t_BitSwitches := (others => (others => '0'));

-- status for rx cmds
signal status_int : std_logic_vector(7 downto 0) := X"02"; -- light off by default

-- signals for handling rx cmds
signal sig_dram        : std_logic := '0'; --start ram dump signal. Set for 1 phi after cmd sent from uart
signal nvr_dump_on     : boolean   := false;  --this dump is activated

-- signals for handling simple cmds
signal sig_dcmd        : std_logic := '0'; --start ram dump signal. Set for 1 phi after cmd sent from uart
signal dcmd_on         : boolean   := false;  --this dump is activated

-- signals for handling  cmds that are exclusive with rspect to time frames
signal sig_dcmd_excl   : std_logic := '0'; --start ram dump signal. Set for 1 phi after cmd sent from uart
signal dcmd_on_excl    : boolean   := false;  --this dump is activated

-- signals for handling simple cmds
signal sig_swsim       : std_logic := '0'; --start ram dump signal. Set for 1 phi after cmd sent from uart

--needed following because otherwise bckdr_addr must be declared as inout, because we have to increment 
--this signal sometimes
signal bckdr_addr_int   : STD_LOGIC_VECTOR(11 DOWNTO 0);   -- address to be selected in the ram space
signal bckdr_rx_req_int : std_logic := '0';

--signals for soft reset ctrl
signal soft_reset_int   : std_logic := '0';
signal reprog_mode      : std_logic := '0';

begin


-- permanent associations
    status       <= status_int;
    bckdr_addr   <= bckdr_addr_int;
    bckdr_rx_req <= bckdr_rx_req_int;
    
    hm_user_sel  <= '0';          --temporaire, will see what we do with this

-- permanent associations for sw_sig
    sw_sig       <= sig_swsim;

-- management of soft_reset signal
-- must be > 10 ms
p_monostable_soft_reset: process(hiclk)
        variable  delay       : natural range  0 to 16777215 := 0; 
    begin
        if rising_edge(hiclk) then
            if soft_reset_int = '1' then
                delay := 5_000_000;
            end if;
            if delay > 0 then            
                delay := delay - 1;
                soft_reset <= '1';
            else
                soft_reset <= '0';
            end if;
        end if;
end process p_monostable_soft_reset;

-- Instantiate UART receiver
UART_RX_INST : uart_rx
generic map (
  g_CLKS_PER_BIT => c_CLKS_PER_BIT
  )
port map (
  i_clk       => hiclk,
  i_rx_serial => RXp,        -- port rx
  o_rx_dv     => w_RX_DV,    -- byte receive complete
  o_rx_byte   => w_RX_BYTE   -- byte to read
  );


-- Instantiate UART transmitter
UART_TX_INST : uart_tx
generic map (
  g_CLKS_PER_BIT => c_CLKS_PER_BIT
  )
port map (
  i_clk       => hiclk,
  i_tx_dv     => r_TX_DV,    -- command start transmitting
  i_tx_byte   => r_TX_BYTE,  -- byte to send
  o_tx_active => w_TX_BUSY,  -- on s'en fout c'est l'image des bits a transmettre
  o_tx_serial => TXp,        -- port tx
  o_tx_done   => w_TX_DONE   -- rises when finished (lasts 1 ticks by def)
  );

-- Instantiate Fletcher's crc calculation 
FLETCHER_INST : fletcher
port map (
    hiclk       => hiclk,
    cmdclk      => fltch_cmdclk,
    nbyte       => fltch_nbyte,
    reset       => fltch_reset,
    crc         => fltch_crc
    );

p_main_wx:	process (hiclk)
        variable  delay       : natural range  0 to 16777215 := 0; 
        variable  dspldump_on : boolean := false;
        variable  numbyt_dspl : integer range 0 to 63   := 0;
	    variable  numbyt_dr   : natural range 0 to 2047 := 0;  -- dedicated to nvram dump
	    
	    variable  st_seq_dram : natural range 0 to 63  := 0;  -- state machine for dumping a ram
	    variable  st_seq_dcmd : natural range 0 to 63  := 0;  -- state machine for dumping a ram
	    variable  st_seq_uart : natural range 0 to 63  := 0;  -- state machine for dumping a ram

        variable  mem_sz      : natural range 0 to 1024;    -- actually 128 | 1024, for now
        
        --intern variable to manage reset/reprog case.
        variable  rootcause   : std_logic_vector(7 downto 0);
	begin
        if rising_edge(hiclk) then

            if     sig_dram = '1' then
                nvr_dump_on <= true;
            elsif sig_dcmd = '1' then
                dcmd_on    <= true;
            elsif sig_dcmd_excl = '1' then
                dcmd_on_excl    <= true;
            end if;
        
            if w_TX_DONE  = '1' then
                r_TX_DV <= '0';
            end if;

            --manage the 100ms tick for displ frames
            delay := delay+1;
            if delay > 5000000 then
                delay  := 0;
                --ram dumping command has priority over time frames
                if nvr_dump_on = false and dcmd_on = false then
                    dspldump_on := true;
                end if;
            end if;
            
--            if delay = 5000000/2 then
--                nvr_dump_on <= true;
--            end if;
            
            if dspldump_on = true then
                if r_TX_DV = '0' then
                    case numbyt_dspl is
                        when 0      =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= X"41";  --code of 'A' for display A (8-byte frame)
                            numbyt_dspl := 30; --we added the first byte lately, thus the value "30"...
                        when 30     =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= dspl_A_off_st&dspl_B_off_st&"000000";
                            numbyt_dspl := 1;
                        when 1 to 8 =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= (RDA_data_st((8-numbyt_dspl)*2+1)) & (RDA_data_st((8-numbyt_dspl)*2));
                            numbyt_dspl := numbyt_dspl+1;
                        when 9      => 
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= X"42";  --code of 'B' for display B (8-byte frame)
                            numbyt_dspl := 31; --we added the first byte lately, thus the value "30"...
                        when 31     =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= dspl_A_off_st&dspl_B_off_st&"111111";
                            numbyt_dspl := 10;
                        when 10 to 17 =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= (RDB_data_st((17-numbyt_dspl)*2+1)) & (RDB_data_st((17-numbyt_dspl)*2)) ;
                            numbyt_dspl := numbyt_dspl+1;
    
                        when 18       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= X"59";  --code of 'Y' for display IOs (32-byte frame)
                            numbyt_dspl := 19; 
    
                        when 19       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= outx(15 downto 8);
                            numbyt_dspl := 20;
                        when 20       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= outx(7 downto 0);
                            numbyt_dspl := 21;
                        
                        when 21       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= inpx(15 downto 8);
                            numbyt_dspl := 22;
                        when 22       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= inpx(7 downto 0);
                            numbyt_dspl := 23;
                        when 23       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= gpio(24 downto 17);
                            numbyt_dspl := 24;
                        when 24       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= gpio(16 downto 9);
                            numbyt_dspl := 25;
                        when 25       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= gpio(8 downto 1);
                            numbyt_dspl := 26;
                        when 26       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= outx2(15 downto 8);
                            numbyt_dspl := 27;
                        when 27       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= outx2(7 downto 0);
                            numbyt_dspl := 53;


    
                        when 53       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= X"53";  --code of 'S' for switch matrix
                            numbyt_dspl := 54; 
                        when 54       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= r_BitSwitches(0)(0 to 3)&r_BitSwitches(1)(0 to 3);
                            numbyt_dspl := 55;
                        when 55       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= r_BitSwitches(2)(0 to 3)&r_BitSwitches(3)(0 to 3);
                            numbyt_dspl := 56;
                        when 56       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= r_BitSwitches(4)(0 to 3)&r_BitSwitches(5)(0 to 3);
                            numbyt_dspl := 57;
                        when 57       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= r_BitSwitches(6)(0 to 3)&r_BitSwitches(7)(0 to 3);
                            numbyt_dspl := 58;
                        when 58       =>
                            r_TX_DV <= '1'; --say uart is busy	
                            r_TX_BYTE <= r_BitSwitches(8)(0 to 3)&r_BitSwitches(9)(0 to 3);
                            numbyt_dspl := 59;
                        
                        when others =>
                            dspldump_on := false;
                            numbyt_dspl := 0;
                       
                    end case;
                 end if;  --endif r_TX_DV=0
              end if;    --endif dspldump_on=true
          
        if dcmd_on_excl = true then
            case RX_CMD(0) is
                --write byte to memory
                when X"57"   =>
                    case st_seq_dcmd is
                        when 0       =>
                            bckdr_r_device <= RX_CMD(1)(3 downto 0);
                            bckdr_addr_int <= RX_CMD(1)(7 downto 4)&RX_CMD(2); --capable of range 1..12
                            bckdr_tx_byte  <= RX_CMD(3);
                            bckdr_tx_req   <= '0';    --trigger for nvram/mnprn/sysconf RAMs
                            --bckdg_tx_req   <= '0';    --trigger for game prom and A1762
                            st_seq_dcmd := 1;
                        when 1       =>
                            bckdr_tx_req   <= '1';
                           
                            st_seq_dcmd := 2;
                            
                        when others  =>
                            bckdr_tx_req   <= '0';
                            --bckdg_tx_req   <= '0';
                            dcmd_on_excl        <= false;
                            st_seq_dcmd := 0;
                    end case;
                --soft reset or reprog mode
                when X"42"   =>
                     case st_seq_dcmd is
                        when 0       =>
                            --is it XQZ? (soft reset)
                            if    RX_CMD(1) = X"58" and RX_CMD(2) = X"51" and RX_CMD(3) = X"5A" then
                                soft_reset_int <= '1';
                                st_seq_dcmd := 2;    --end of story, resets reset signal
                           --is it XQR? (reprog mode)
                            elsif RX_CMD(1) = X"58" and RX_CMD(2) = X"51" and RX_CMD(3) = X"52" then
                                soft_reset_int <= '1';
                                st_seq_dcmd := 1;    --end of story, leaves reset signal in active state
                            else
                            --illlegal request
                                soft_reset_int <= '0';
                                st_seq_dcmd := 2;    --end of story, resets reset signal
                            end if;
                        when 1       => 
                            --ok cmd done, stay in reprog mode
                            soft_reset_int <= '1';
                            dcmd_on_excl <= false;
                            st_seq_dcmd := 0;                        
                        when others  =>
                            soft_reset_int <= '0';
                            dcmd_on_excl <= false;
                            st_seq_dcmd := 0;
                    end case;   
                                                 
                --flash iic   
                when X"46"   =>
                    case st_seq_dcmd is
                        when 0       =>
                            bckdr_r_device <= RX_CMD(1)(3 downto 0);
                            bckdr_tx_byte  <= RX_CMD(3);
                            bckdr_fl_req   <= '0';
                            st_seq_dcmd := 1;
                        when 1       =>
                            bckdr_fl_req   <= '1';
                            st_seq_dcmd := 2;
                             
                        when others  =>
                            dcmd_on_excl <= false;
                            st_seq_dcmd := 0;
                            bckdr_fl_req   <= '0';
                    end case;
                when others  =>
                    dcmd_on_excl <= false;
                
            end case;
        end if;
        
        if dcmd_on = true     and dspldump_on = false then
            case RX_CMD(0) is
------added for acknowleged reset
                --soft reset or reprog mode
                when X"43"   =>
                     case st_seq_dcmd is
                        when 0       =>
                            --is it XQZ? (soft reset)
                            if    RX_CMD(1) = X"58" and RX_CMD(2) = X"51" and RX_CMD(3) = X"5A" then
                                soft_reset_int <= '1';
                                st_seq_dcmd := 2;    --end of story, resets reset signal
                           --is it XQR? (reprog mode)
                            elsif RX_CMD(1) = X"58" and RX_CMD(2) = X"51" and RX_CMD(3) = X"52" then
                                soft_reset_int <= '1';
                                st_seq_dcmd := 1;    --end of story, leaves reset signal in active state
                            else
                            --illlegal request
                                soft_reset_int <= '0';
                                st_seq_dcmd := 2;    --end of story, resets reset signal
                            end if;
                        when 1       => 
                            --ok cmd done, stay in reprog mode
                            soft_reset_int <= '1';
                            rootcause := "00000001"; --mark reprog origin
                            st_seq_dcmd := 4;                        
                        when 2       =>
                            soft_reset_int <= '0';
                            rootcause := "00000010"; --mark reset origin
                            st_seq_dcmd := 4;
                            st_seq_uart := 0;
                            
                        when 4       =>   
                            --we are done; we now print the result
                            if r_TX_DV = '0' then
                                case st_seq_uart is
                                    when 0      =>
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= X"40";   --code of '@' for ack reset or reprog
                                        st_seq_uart := 1;
                                    when 1      => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= ident(7 downto 0);  --17h 64MB
                                        st_seq_uart := 2;
                                    when 2      => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= rootcause;  --
                                        st_seq_uart := 3;
--                                    when 3      => 
--                                        r_TX_DV   <= '1';     --say uart is busy	
--                                        r_TX_BYTE <= DIP_SW;  --
--                                        st_seq_uart := 4;
                                    when others =>
                                        dcmd_on <= false;
                                        st_seq_dcmd := 0;
                                        numbyt_dr   := 0;
                                end case;  --st_seq_uart
                            end if;                            
                                                 
                        when others =>  --illegal to reach here        
                                dcmd_on <= false;
                                st_seq_dcmd := 0;
                                numbyt_dr   := 0;
                    
                    end case;   
                         
------end of acknowledgeed reset

-------added for dip switch & ident req
                when X"44"  =>
                     case st_seq_dcmd is
                        when 0       =>
                            st_seq_dcmd := 1;
                            st_seq_uart := 0;
                            
                        when 1       =>   
                            --we are done; we now print the result
                            if r_TX_DV = '0' then
                                case st_seq_uart is
                                    when 0      =>
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= X"45";   --code of 'E' for ack reset or reprog
                                        st_seq_uart := 1;
                                    when 1      => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= DIP_SW;  --
                                        st_seq_uart := 2;

                                    
                                   when 2 to 2+7     => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        for ii in 0 to 7 loop
                                            if st_seq_uart-2 = ii then
                                                r_TX_BYTE <= ident((ii+1)*8-1 downto ii*8);  --
                                            end if;
                                        end loop;
                                        
                                        st_seq_uart := st_seq_uart + 1;
                                                                        


                                    when others =>
                                        dcmd_on <= false;
                                        st_seq_dcmd := 0;
                                        numbyt_dr   := 0;
                                end case;  --st_seq_uart
                            end if;                            
                        when others =>  --illegal to reach here        
                                dcmd_on <= false;
                                st_seq_dcmd := 0;
                                numbyt_dr   := 0;
                    
                    end case;   
-------end of ident req
 
                --get fletcher
                when X"5A"   =>
                    --st_seq_dcmd span is 0..64
                    case st_seq_dcmd is
                        when 0       =>
                            --init fletcher data
                            fltch_reset     <= '1';
                            --fltch_cmdclk    <= '1';
                            bckdr_r_device <= RX_CMD(1)(3 downto 0);
                            if RX_CMD(1)(2) = '1' then
                                case to_integer(unsigned(RX_CMD(2))) is
                                    when 0      =>
                                        mem_sz := 1;
                                    when 1      =>
                                        mem_sz := 2;
                                    when 2      =>
                                        mem_sz := 4;
                                    when 3      =>
                                        mem_sz := 8;
                                    when 4      =>
                                        mem_sz := 16;
                                    when 5      =>
                                        mem_sz := 32;
                                    when 6      =>
                                        mem_sz := 64;
                                    when 7      =>
                                        mem_sz := 128;
                                    when 8      =>
                                        mem_sz := 256;
                                    when 9      =>
                                        mem_sz := 512;
                                    when 10     =>
                                        mem_sz := 1024;
                                    when others =>
                                        mem_sz := 0;
                                end case;
                            else
                                mem_sz := 128;
                            end if;
--                            case RX_CMD(1)(3 downto 0) is
--                                when "0100"    =>
--                                    mem_sz := 256;
--                                when "0101"    =>
--                                    mem_sz := 1024;
--                                when others    =>
--                                    mem_sz := 128;
--                            end case;
                            numbyt_dr   := 0; --can go up to max 2047 by declaration
                            st_seq_dcmd := 1;
                        when 1       =>
                            --finish init fletcher data
                            fltch_reset     <= '1';
                            fltch_cmdclk    <= not fltch_cmdclk;
                            
                            bckdr_addr_int   <= (others => '0'); --we will range from 0 to mem_sz-1
                            bckdr_rx_req_int <= '0';  --maybe superfluous, or maybe not (for first time, it maybe not init)    

                            st_seq_dcmd := 2;
                        when 2       =>
                            bckdr_rx_req_int   <= '1';   --req signal
                            st_seq_dcmd := 3;
                        when 3       =>
                            bckdr_rx_req_int   <= '0';   --rearm signal
                            if bckdr_rx_dv = '1' then
                                --Super! There is a byte available
                                fltch_nbyte     <= bckdr_rx_byte;
                                fltch_reset     <= '0';
                                fltch_cmdclk    <= not fltch_cmdclk;
                                --r_TX_BYTE <= '0'&bckdr_addr_int;
                                numbyt_dr := numbyt_dr + 1;
                                bckdr_addr_int  <= std_logic_vector( unsigned(bckdr_addr_int) + 1 );
                                if numbyt_dr = mem_sz then
                                    st_seq_dcmd := 4;
                                    st_seq_uart := 0;
                                else
                                    st_seq_dcmd := 2; --lets handle next byte
                                end if;                                    
                            end if;    
                        when 4       =>   
                            --we are done; we now print the result
                            if r_TX_DV = '0' then
                                case st_seq_uart is
                                    when 0      =>
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= X"5A";  --code of 'Z' for giving fletcher crc (2 bytes)
                                        st_seq_uart := 1;
                                    when 1      => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= fltch_crc(15 downto 8);  --msb
                                        st_seq_uart := 2;
                                    when 2      => 
                                        r_TX_DV   <= '1';     --say uart is busy	
                                        r_TX_BYTE <= fltch_crc(7 downto 0);  --msb
                                        st_seq_uart := 3;
                                    when others =>
                                        dcmd_on <= false;
                                        st_seq_dcmd := 0;
                                        numbyt_dr   := 0;
                                end case;  --st_seq_uart
                            end if;                            
                                
                        when others  =>
                            st_seq_dcmd := 0;
                    end case; -- st_seq_dcmd;
                            
                            
                when others  =>
                    dcmd_on <= false;
                    st_seq_dcmd := 0;
                    numbyt_dr   := 0;
                
            end case;
         end if;
         
        if nvr_dump_on = true and dspldump_on = false then
            if r_TX_DV = '0' then
                if numbyt_dr = 0 then
                    r_TX_DV        <= '1';     --say uart is busy	
                    if RX_CMD(1)(2) = '1' then --which r_device type?
                        --this rom memory of 1KB (either game or A17 content)
                        if RX_CMD(1)(1 downto 0) = "01" then
                            r_TX_BYTE      <= X"51";  --code of 'Q' saying sz=1KB memory dump
                            mem_sz := 1024;
                        else
--                            r_TX_BYTE      <= X"4E";  --code of 'N' saying sz=256 memory dump
--                            mem_sz := 256;
                            r_TX_BYTE      <= X"51";  --code of 'N' saying sz=256 memory dump
                            mem_sz := 1024;
                        end if;
                    else
                        --this is an nvram of 128 bytes
                        r_TX_BYTE      <= X"52";  --code of 'R' saying sz=128 nvram dump
                        mem_sz := 128;
                    end if;
                    numbyt_dr   := 1;
                    st_seq_dram := 0;
                    
                    bckdr_r_device   <= RX_CMD(1)(3 downto 0);
                    bckdr_addr_int   <= (others => '0'); --we will range from 0 to 127
                    bckdr_rx_req_int <= '0';  --maybe superfluous, or maybe not (for first time, it maybe not init)    

                    --still don't understand why it works differently for sys nvram and other rams ...
                    --will see later. No time by now. So few time and so many things to do
                    --!SOLVED! OK understood, it is because the enable sig is 2 clocks or 1 clock depending on the 
                    --memory that is addressed      
                    --this is no more a problem since we do 2 clocks for all, disregarding which one is concerned    

                    --following line requires VHDL2008
                elsif numbyt_dr <= mem_sz then
                    case st_seq_dram is 
                        when 0     =>
                            --request byte at addr bckdr_addr from device bckdr_r_device
                            bckdr_rx_req_int <= '1';
                            --bckdr_addr_int   <= (others => '0'); --we will range from 0 to 127
                            st_seq_dram := 1;
                        when 1     =>
                            --wait for answer from the dumper device
                            bckdr_rx_req_int   <= '0';   --rearm signal
                            if bckdr_rx_dv = '1' then
                                --Super! There is a byte available
                                r_TX_DV   <= '1'; --say uart is busy	
                                r_TX_BYTE <= bckdr_rx_byte;
                                --r_TX_BYTE <= '0'&bckdr_addr_int;
                                numbyt_dr := numbyt_dr + 1;
                                st_seq_dram := 0; 
                                bckdr_addr_int  <= std_logic_vector( unsigned(bckdr_addr_int) + 1 );
                                --bckdr_addr_int  <= std_logic_vector(to_unsigned(to_integer(unsigned( bckdr_addr_int )) + 1, 7));
                            end if;  
                        when others =>
                            st_seq_dram := 0; -- should not get here 
                            bckdr_rx_req_int <= '0';                              
                    end case;
                else
                    nvr_dump_on <= false;
                    numbyt_dr   := 0;
                    mem_sz      := 0;   --useless, but just to make sure
                    bckdr_rx_req_int <= '0';                              
                    st_seq_dram := 0; -- should not get here
                end if;            
            end if;
        end if;


          
      end if; --endif rising_edge(hiclk)
   end process p_main_wx;

--RX handling
-- Every command is 1+3 bytes long (from 2024-08-12)
-- First byte is a sync byte and must be X"59", aka 'Y'
p_main_rx:	 process (hiclk)
	   variable lastw_RX_DV : std_logic := '0';
	   variable byte_num    : natural range 0 to 7 := 0;
	 begin
        if rising_edge(hiclk) then
			if w_RX_DV = '1' and lastw_RX_DV = '0' then      --the driver keeps this signal to 1 for 4 ticks
                --sync byte for making sure to start on frame start
                if byte_num = 0 then
                    if w_RX_BYTE = X"59" then
                        byte_num := 1;
                    end if;
                elsif byte_num = 4 then
                    RX_CMD(3) <= w_RX_BYTE;
                    byte_num := 0;
                    NEW_CMD4  <= true;   --1 tick signal to tell there is a new command
                else
                    RX_CMD(byte_num-1) <= w_RX_BYTE;
                    byte_num := byte_num + 1;
                end if;    
			end if;	                   --where it is managed only at CMD transition
			lastw_RX_DV := w_RX_DV;
			if NEW_CMD4 = true then
			    NEW_CMD4 <= false;
			end if;
	    end if;
	 end process p_main_rx;

--Incoming Command processing
p_rx_handle:     process(hiclk)
     begin
        if rising_edge(hiclk) then
            if NEW_CMD4 = true then
                case RX_CMD(0) is
                    --'R' 0x52, for reading full ram (one of config, sys, miniprn
                    --the command is XYZT: X='R', 
                    --                     Y=0|1|2 type of ram to be read
                    --                     Z=don't care
                    --                     T=don't care
                    --return: 82+128 bytes of the given ram
                    when X"52"     =>
                       status_int <= X"52";
                       sig_dram <= '1';
                       
                    --'S' 0x53, for simulating a switch closing
                    --the command is XYZT: X='S', 
                    --                     Y=strobe code on which to trigger
                    --                     Z=return value 
                    --                     T=don't care
                    when X"53"     =>
                       status_int <= X"53";
                       sig_swsim <= '1';
                       sw_strb   <= RX_CMD(1);
                       sw_ret    <= RX_CMD(2);
                       sw_timer  <= RX_CMD(3);
                       
                    --'W' 0x57, for writing a byte to given address
                    --this command does not flash the result to iic
                    --there is another command for flashing
                    --the command is XYZT: X='W', 
                    --                     Y low nibble:
                    --                     Y=0|1|2|4|5 type of ram to be read
                    --                     0,1,2 for hmsys rams (sysconf, mnprn, nvram)
                    --                     4,5   for game prom and A1762 version
                    --                     Y high nibble is address high (for A17s space roms)
                    --                     Z=adress in range 0..127 (for hmsys) or 0..255 for game proms
                    --                     T=byte to write
                    when X"57"     =>
                       status_int    <= X"57";
                       sig_dcmd_excl <= '1';
                       
                    --'B' 0x42, for soft reset
                    --the command is BXQZ for soft reset
                    --the command is BXQR for going into reprog mode
                    --
                    when X"42"     =>
                       status_int    <= X"42";
                       sig_dcmd_excl <= '1';
                       
                    --'C' 0x43, for soft reset with acknowledge
                    --the command is CXQZ for soft reset
                    --the command is CXQR for going into reprog mode
                    --
                    --The ack reply is @<src><sw ident> (@ is 0x40)
                    when X"43"     =>
                       status_int    <= X"43";
                       sig_dcmd <= '1';

                    --'D' 0x44, for getting dip switch
                    --the command is DXXX 
                    --
                    --The  reply is E<dip_sw>
                    when X"44"     =>
                       status_int    <= X"44";
                       sig_dcmd <= '1';
                       
                    --'F' 0x46, for flashing ram (one of config, sys, miniprn)
                    --the command is XYZT: X='F', 
                    --                     Y=0|1|2 type of ram to be read
                    --                     Z=don't care
                    --                     T=don't care
                    when X"46"     =>
                       status_int    <= X"46";
                       sig_dcmd_excl <= '1';
                     
                    --'Z' 0x5A, for getting fletcher crc 
                    --the command is XYZT: X='Z', 
                    --                     Y=0|1|2|4|5 type of ram to be checked
                    --                     Z=n where 2^n is the dataspan to control
                    --                     T=don't care
                    when X"5A"     =>
                       status_int <= X"5A";
                       sig_dcmd   <= '1';
                     
                    when others    =>
                        status_int <= X"FF";
                end case;

            end if;
            
            --signal is at 1 for only 1 tick
            if sig_dram = '1' then
                sig_dram  <= '0';
            end if;
            if sig_dcmd = '1' then
                sig_dcmd  <= '0';
            end if;
            if sig_dcmd_excl = '1' then
                sig_dcmd_excl  <= '0';
            end if;
            if sig_swsim = '1' then
                sig_swsim  <= '0';
            end if;
            
        end if;
     end process p_rx_handle;

p_switch_matrix : process(hiclk)
    variable r_switches      : t_Row_Col; --t_Row_Col   is array (0 to 9, 0 to 3) of integer range 0 to 3;
    variable CLK_DIV0        : unsigned (23 downto 0) := (others=>'0');
    variable last_clk23      : std_logic := '0';
    variable strobnum        : integer range 0 to 15;		 
    variable last_strobnum   : integer range 0 to 15;		
    variable doa2diaDelay    : integer range 0 to 127 :=0; --0: timer is stopped
    constant c_timerd2d      : integer range 0 to 127 :=127;
	 begin
	    if (rising_edge(hiclk)) then
			-- diag of switches
			last_clk23 := CLK_DIV0(23);
            CLK_DIV0 := CLK_DIV0 + "1";

            strobnum := to_integer(unsigned(doa));
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
                            r_switches(strobnum, 0) := 3;
                        end if;
                        if dia(2) = '1' then
                            r_switches(strobnum, 1) := 3;
                        end if;
                        if dia(3) = '1' then
                            r_switches(strobnum, 2) := 3;
                        end if;
                        if dia(4) = '1' then
                            r_switches(strobnum, 3) := 3;
                        end if;
                    end if;
                    --stop timer
                    doa2diaDelay := 0;
                when others => 
                    --timer is running
                    doa2diaDelay := doa2diaDelay - 1;
            end case;
            
           

			if last_clk23 /= CLK_DIV0(23) and CLK_DIV0(23) = '1' then
				for S in 9 downto 0 loop
					for R in 3 downto 0 loop
						if r_switches(S, R) > 0 then
							r_switches(S, R) := r_switches(S, R)-1;
					        r_BitSwitches(S)(R) <= '1';
						else
							r_BitSwitches(S)(R) <= '0';						
						end if;
					end loop;
				end loop;
			end if;
			
        end if;
end process p_switch_matrix;
     
end Behavioral;
