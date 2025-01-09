----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2023 22:01:34
-- Design Name: 
-- Module Name: ioxadapter - Behavioral
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

use work.libpps4.all;

use work.libfram.all;    -- for the settings


entity ioxAdapter is
     Port ( hiclk             : in    STD_LOGIC;
            spo               : in     STD_LOGIC;
            pps4_phi          : in    pps4_ph_type;
            A1761_inpx_gen    : out   std_logic_vector(15 downto 0);   --yes, it's an OUT, because it is generated here 
            A1761_outx_read   : in    std_logic_vector(15 downto 0);   --yes, it's an IN, because it is generated in ioctrl 
            A1762_outx_read   : in    std_logic_vector(15 downto 0);   --yes, it's an IN, because it is generated in ioctrl 
            iox               : inout std_logic_vector( 7 downto 0); --to the extern mux interface 
            RD_DS             : out   std_logic;  --pin E11 (PG1)
            DIP_SW            : out   std_logic_vector(7 downto 0);   
            Load_B1_0         : out   std_logic;  --pin A5 (ex  (IO10)) IO_L4N_T0_34
            Load_B1_1         : out   std_logic;  --pin A2 (ex  (IO11)) IO_L3N_T0_DQS_34
            Load_B2_0         : out   std_logic;  --pin J1 (ex  (IO14)) IO_L15N_T2_DQS_34
            Load_B2_1         : out   std_logic;  --pin J4 (ex  (IO13)) IO_L17P_T2_34
            Load_B3_AB        : out   std_logic;  --pin J2 (ex  (IO15)) IO_L15P_T2_DQS_34
            Load_B3_CD        : out   std_logic;  --pin K4 (ex  (IO09)) IO_L16P_T2_34
            Load_B3_EF        : out   std_logic;  --pin K3 (ex  (IO08)) IO_L16N_T2_34
            GPIO11696_OutX    : in    std_logic_vector(24 downto 1); 
            seliobank         : out   std_logic_vector( 1 downto 0);  --not used, here for legacy
            latchiobank       : out   std_logic_vector( 1 downto 0);
            settings1         : in    std_logic_vector( 7 downto 0)
            
          );

end ioxAdapter;

architecture Behavioral of ioxAdapter is
signal let_inp_reading : boolean := false;  
signal let_out_setting : boolean := false;  

signal X_Latches       : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0'); 


--for protecting coils (group ABCD of 11696
signal GPIO11696_OutX_Protected : std_logic_vector(24 downto 1); 
signal cCoilOff                 : std_logic := '0';
signal cCoilOn                  : std_logic := '1';
signal timerInitValue           : unsigned(3 downto 0) := "1000";

--for dip switches
signal DIP_SW_int               : std_logic_vector(7 downto 0) := "11111111";


signal CLK_DIV_TEST : unsigned (31 downto 0):=(others=>'0');

begin

    --permanent assignment
    DIP_SW       <= DIP_SW_int;
    --not used, can be removed
    seliobank    <= (others => '0'); --name of signal comes from old ages, no more used
    latchiobank  <= (others => '0');    
    
    --these are lights, so they don't need to be protected
    GPIO11696_OutX_Protected(24 downto 17)    <= GPIO11696_OutX(24 downto 17);
    
    
    --On 74AHCT573, LE is latch enable: latched when low, transparent when high
    RD_DS      <= X_Latches(7); --test 2024-12-15
    Load_B1_1  <= X_Latches(6);
    Load_B1_0  <= X_Latches(5);
    Load_B2_1  <= X_Latches(4);
    Load_B2_0  <= X_Latches(3);
    Load_B3_EF <= X_Latches(2);
    Load_B3_CD <= X_Latches(1);
    Load_B3_AB <= X_Latches(0);
    
--protection of coils: max 3 secs on, 
--then blocked 3 secs and resumed to yheir current value, and again 3secs max

--boolean_vector needs VHDL-2008
p_ABCDProtect : process(hiclk)
    type timer_array_type is array (1 to 16) of unsigned(3 downto 0);
    variable CLK_DIV0           : unsigned (23 downto 0) := (others=>'0');
    variable last_clk23         : std_logic := '0';
    
    variable  last_coil_state_P : std_logic_vector(16 downto 1) := (others=>'1');
    variable  running_timer1    : timer_array_type := (others=>(others=>'0'));
    variable  running_timer2    : timer_array_type := (others=>(others=>'0'));
    begin
        if (rising_edge(hiclk)) then
			-- timer ~160ms
			last_clk23 := CLK_DIV0(23);
            CLK_DIV0 := CLK_DIV0 + "1";

            --update the timers
			if last_clk23 /= CLK_DIV0(23) and CLK_DIV0(23) = '1' then
			     for Coil in 1 to 16 loop
			         if running_timer1(Coil) > "0" then
			             running_timer1(Coil) := running_timer1(Coil) - "1";
			             if running_timer1(Coil) = "0" then
			                 running_timer2(Coil) := timerInitValue;
			             end if;
			         end if;	
			         		         
			         if running_timer2(Coil) > "0" then
			             running_timer2(Coil) := running_timer2(Coil) - "1";
			         end if;
			     end loop;
            end if;

            for Coil in 1 to 16 loop
                if running_timer2(Coil) = "0" then
                     GPIO11696_OutX_Protected(Coil) <= GPIO11696_OutX(Coil);
                else
                    GPIO11696_OutX_Protected(Coil)  <= cCoilOff;
                end if;
                
                if GPIO11696_OutX_Protected(Coil) = cCoilOn and  last_coil_state_P(Coil) = cCoilOff then
                    running_timer1(Coil) := timerInitValue;
                end if;
            end loop;
            last_coil_state_P := GPIO11696_OutX_Protected(16 downto 1);
        end if;
    end process p_ABCDProtect;
    
    
    
    process(hiclk)
        variable r_state                 : natural range 0 to 180 := 0;
        variable last_let_out_setting    : boolean := false;

        variable mini_delay              : natural range 0 to 87  := 0;
    begin
        if (rising_edge(hiclk)) then
			if spo = '1' then --SPO is maintained by master device to -12V for 100ms min
                iox  <=  (others => '0');
                X_Latches    <=  (7=> '0', others => '1'); -- "11111111"; --test 2024-12-15
                r_state := 0;
                
            else            
                case r_state is 
                    when 0     =>            --relax.
                        X_Latches    <= (others => '0');
                        r_state      := r_state+1;
                        mini_delay   := 0;
                    when 1 to 8    =>            --output of B1-0 coil coin reject.
                          --next lines commented out test 2024-12-15 bloody glitch
                        if settings1(0) = '0' then 
                            --iox          <=  not A1761_outx_read(7 downto 0); 
                            iox(r_state-1)          <=  not A1761_outx_read(r_state-1); 
                        else
                            iox(r_state-1)          <=  '1'; 
                        end if;
                        r_state      := r_state+1;
                        mini_delay   := 0;
                    when 9     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 10     =>
                        --Latch on X_Latches(5) aka B1_0
                        X_Latches    <= (5=>'1', others=>'0'); --"0100000";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 11     =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 12 to 19     =>            --output of B1-1
                        X_Latches    <= (others => '0');
                        --iox          <=  not A1761_outx_read(15 downto 8); 
                        --not not because we go thru MOSFETs
                         --next lines commented out test 2024-12-15 bloody glitch
                        if settings1(0) = '0' then 
                            --iox          <=   A1761_outx_read(15 downto 8); 
                            iox(r_state-12)          <=   A1761_outx_read(r_state-12+8); 
                        else
                            iox(r_state-12)          <=   '1'; 
                        end if;
                        r_state      := r_state+1;
                        mini_delay := 0;
                    when 20     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 21     =>
                        --Latch on
                        --X_Latches    <= (6=>'0', others=>'0'); -- "1000000";  --test 2024-12-14
                        X_Latches    <= (6=>'1', others=>'0'); -- "1000000";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 22     =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;



                    when 23 to 30      =>            --output of B3-AB
                        --start the demux for all circuits
                        --if let_out_setting = true and last_let_out_setting = false then
                        --start with output of B3-AB and chain up...
                        X_Latches    <= (others => '0');
                        --next lines removed for 2024-12-15 glitch test
--                        iox  <=  GPIO11696_OutX_Protected(8 downto 1) when settings1(3) = '0' else
--                                 GPIO11696_OutX(8 downto 1); 
                        iox(r_state-23)  <=  GPIO11696_OutX_Protected(r_state-23+1) when settings1(3) = '0' else
                                             GPIO11696_OutX(r_state-23+1); 
                        
                        --iox    <= (others =>  CLK_DIV_TEST(26));                
                        --iox          <=  'Z'&GPIO11696_OutX(7 downto 1); --test glitch
                        r_state      := r_state+1;
                        mini_delay   := 0;
                        --end if;                        
                    when 31     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;


                    when 32      =>
                        --latch on   X_Latches(0)
                        X_Latches    <= (0=>'1', others=>'0'); --"0000001";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2  then 
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 33     =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 34 to 41      =>            --output of B3-CD
                        X_Latches    <= (others => '0');
                        --next lines removed for 2024-12-15 glitch test                        
--                        iox  <=  GPIO11696_OutX_Protected(16 downto 9)  when settings1(3) = '0' else
--                                 GPIO11696_OutX(16 downto 9); 
                        iox(r_state-34)  <=  GPIO11696_OutX_Protected(r_state-34+9)  when settings1(3) = '0' else
                                             GPIO11696_OutX(r_state-34+9); 
                        --iox    <= (others =>  not CLK_DIV_TEST(26));                


                        --iox          <=  'Z'&GPIO11696_OutX(15 downto 9); --test glitches
                        r_state      := r_state+1;
                        mini_delay   := 0;

                    when 42     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;

                    when 43      =>
                        --latch on
                        X_Latches    <= (1=>'1', others=>'0'); --"0000010";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 44      =>
                        --Latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1; 
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 45 to 52      =>            --output of B3-EF
                        --set iox
                        X_Latches    <= (others => '0');
                        
                        --2024-12-15 test bizarre glitch
--                        iox  <=  GPIO11696_OutX_Protected(24 downto 17)  when settings1(3) = '0' else
--                                 GPIO11696_OutX(24 downto 17); 
                        iox(r_state-45)  <=  GPIO11696_OutX_Protected(r_state-45+17)  when settings1(3) = '0' else
                                             GPIO11696_OutX(r_state-45+17); 
                        --iox            <=  std_logic_vector(CLK_DIV_TEST(31 downto 24));
                        r_state      := r_state + 1;
                        mini_delay := 0;
                    when 53     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state + 1;
                            mini_delay := 0;
                        end if;
                    when 54      =>
                        --latch on
                        X_Latches    <= (2=>'1', others=>'0'); --"0000100";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state + 1;
                            mini_delay := 0;
                        end if;
                    when 55      =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state + 1; --test 2024-12-15 bloody glitch
                            mini_delay := 0;
                        end if;
                    when 56 to 63      =>            --output of B2-0
                        X_Latches    <= (others => '0');
                        --iox          <=  not A1762_outx_read(7 downto 0); 
                        iox(r_state-56)          <=  not A1762_outx_read(r_state-56); 
                        --iox          <=  'Z'&(not A1762_outx_read(6 downto 0));   --test glitches
                        r_state      := r_state + 1;
                        mini_delay := 0;
                    when 64     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state + 1;
                            mini_delay := 0;
                        end if;


                    when 65     =>
                        --latch on
                        X_Latches    <= (3=>'1', others=>'0'); --"0001000";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state + 1;
                            mini_delay := 0;
                        end if;
                    when 66     =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state + 1;
                            mini_delay := 0;
                        end if;
                    when 67 to 74     =>            --output of B2-1
                        X_Latches    <= (others => '0');
                        --iox          <=  not A1762_outx_read(15 downto 8); 
                        iox(r_state-67)          <=  not A1762_outx_read(r_state-67+8); 
                        --iox          <=  'Z'&(not A1762_outx_read(14 downto 8)); 
                        r_state      := r_state+1;
                        mini_delay := 0;

                    when 75     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;

                    when 76     =>
                        --Latch on
                        X_Latches    <= (4=>'1', others=>'0'); --"0010000";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state    := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 77     =>
                        --latch off
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1; --test 2024-12-15
                            mini_delay := 0;
                        end if;

                    when 78     =>            --input of dip-switches
                        X_Latches    <= (others => '0');
                        iox          <=  (others => 'Z'); 
                        r_state      := r_state+1;
                        mini_delay := 0;

                    when 79     =>
                        --wait for iox to be stable
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;

                    when 80     =>
                        --Latch on for reading
                        X_Latches    <= (7=>'1', others=>'0'); --"10000000";
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 2 then
                            r_state    := r_state+1;
                            mini_delay := 0;
                        end if;
                    when 81     =>
                        --read and latch off nex time
                        DIP_SW_int   <= iox;
                        X_Latches    <= (7=>'1', others=>'0'); --"10000000";
                        r_state      := r_state+1;
                        mini_delay := 0;


                    when 82     =>
                        --stop the reading
                        X_Latches    <= (others => '0');
                        mini_delay := mini_delay + 1;
                        if mini_delay >= 1 then
                            r_state      := r_state+1;
                            mini_delay := 0;
                        end if;
                                       
                    when others =>
                        X_Latches    <= (others => '0');
                        --iox          <= (others => '0');  --no necessity to set that to 0!
                        if r_state >= 85 then                        
                            r_state      := 0;
                            mini_delay   := 0;
                        else
                            r_state      := r_state + 1;
                        end if;                  
                       
                end case;
                last_let_out_setting := let_out_setting;                
                
            end if;
        end if;
    end process;
    
    
    --this process to collect inp of A1761, but NOT taking account real I/Os on real port
    --hence miniprinter won't work with this version
    --to integrate the miniprinter this process must be integrate in the previous one...
    A1761_inpx_gen <= A1761_outx_read;
    --following to be adapted when the real miniprinter circuitry will be implemented
--    process(hiclk)
--        variable r_state                 : natural range 0 to 7 := 0;
--        variable last_let_inp_reading    : boolean := false;
--    begin
--        if (rising_edge(hiclk)) then
--            case r_state is 
--                when 0      =>                 --idle state
--                    if     let_inp_reading = true and last_let_inp_reading = false then
--                        A1761_inpx_gen <= A1761_outx_read;
--                    end if;
--                when others =>
--                    null;
--            end case;
--            last_let_inp_reading := let_inp_reading;    
--        end if;
--    end process;
    
    
    
    
--    process(hiclk)
--        variable r_state              : natural range 0 to 7 := 0;
--        variable last_let_inp_reading : boolean := false;
--        variable last_let_out_setting : boolean := false;
--        variable tempo_sig            : natural range 0 to 7 := 0; --must be reset after each use in every machine state
--    begin
--        if (rising_edge(hiclk)) then
--            case r_state is 
--                when 0      =>                 --idle state
----                   seliobank    <= "11";       --disable both inputs 7-buffer
----                   latchiobank  <= "11";
--                   if     let_inp_reading = true and last_let_inp_reading = false then
--                        --iox          <= (others=>'Z'); --set pysical port as an input
--                        r_state := 1;          --let start reading
--                    elsif let_out_setting = true and last_let_out_setting = false then
--                        r_state := 4;          --let start writing
--                    end if;
--                when 1      =>                 --launch reading of 1st half
--                    --seliobank        <= "10";
--                    tempo_sig := tempo_sig + 1;
--                    if tempo_sig >= 2 then
--                        tempo_sig := 0;
--                        r_state := 2;               --let actually read
--                    end if;
                    
--                when 2      =>                 --read 1st half
--                    inpx_gen(7 downto 0) <= iox;
--                    seliobank        <= "01";
--                    tempo_sig := tempo_sig + 1;
--                    if tempo_sig >= 2 then
--                        tempo_sig := 0;
--                        r_state := 3;           --let read 2nd half
--                    end if;
                    
--                when 3      =>                  --read 2nd half
--                    inpx_gen(15 downto 8) <= iox;
--                    seliobank        <= "11";
--                    r_state := 0;               --let back to idle             

--                when 4      =>                 --launch writing of 1st half
--                    latchiobank      <= "10";
--                    tempo_sig := tempo_sig + 1;
--                    if tempo_sig >= 2 then
--                        tempo_sig := 0;
--                        r_state := 5;               --let actually read
--                    end if;

--                when 5      =>                 --write 1st half
--                    iox <= outx_read(7 downto 0);
--                    latchiobank      <= "01";
--                    tempo_sig := tempo_sig + 1;
--                    if tempo_sig >= 2 then
--                        tempo_sig := 0;
--                        r_state := 6;           --let write 2nd half
--                    end if;
                    
--                when 6      =>                  --write 2nd half
--                    iox <= outx_read(15 downto 8);
--                    latchiobank      <= "11";
--                    r_state := 0;           --go back to idle
                     
--                when others =>
--                    r_state := 0;              
                    
--             end case;

--            last_let_inp_reading := let_inp_reading;    
--            last_let_out_setting := let_out_setting;                
--        end if;
                    
--    end process; 
    
    
    
    process(pps4_phi)
    begin
        
    --state machine execution, based on phases of clka/clkb
    --obsolète
        case pps4_phi is
            when phi1A  =>
                let_inp_reading <= false;
                let_out_setting <= true; -- false;   test 2024-08-31 see line 336
                
            when phi1   =>
                --reading inputs now
                --this is an arbitrary choice to sample inputs now and not elsewhen
                --we selected here because inputs are read by cpu at next phase (phi2)
                let_out_setting <= false;
                let_inp_reading <= true;
                    
                
            when phi2   =>
                --this is when ID4 is returned to the cpu (the IOx inpx reading)
                let_inp_reading <= false;
                let_out_setting <= false;
                
                
            when phi3A  =>
                --this is when output is set by cpu (outx is set or reset)
                let_inp_reading <= false;
                let_out_setting <= false;
                
            when phi3   =>
                let_inp_reading <= false;
                let_out_setting <= false; -- true;  test 2024-08-31
                
            when phi4   =>
                let_inp_reading <= false;
                let_out_setting <= false;
                
            when others =>
                let_inp_reading <= false;
                let_out_setting <= false;
                
        end case;

    end process;
       
-- clock divider for test signals
    process (hiclk)
    begin
        if (rising_edge(hiclk)) then
            CLK_DIV_TEST <= CLK_DIV_TEST + "1";
        end if;
    end process;

end Behavioral;
