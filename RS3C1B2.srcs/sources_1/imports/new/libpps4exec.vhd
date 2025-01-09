----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--   
-- Create Date: 24.10.2023 11:07:21
-- Design Name: 
-- Module Name: libpps4 - Behavioral
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

package libpps4exec is

  function is2inst (
    mnemonic : in std_logic_vector(8 downto 1))
    return boolean;

  procedure parse2ndpart(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal ram_bus      : in     std_logic_vector(4  downto 1);
    signal curmnemonic  : in     std_logic_vector(8  downto 1);
    signal lastmnemonic : in     std_logic_vector(8  downto 1);
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1);
    signal A            : inout  std_logic_vector(4  downto 1);
    signal B            : inout  std_logic_vector(12 downto 1);
    signal X            : inout  std_logic_vector(4  downto 1);
    signal C            : inout  std_logic;
    signal FF1          : inout  std_logic;
    signal FF2          : inout  std_logic
    );


  procedure parse2ndpartPhi1(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal curmnemonic  : in     std_logic_vector(8  downto 1);
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1)
    );

  procedure parse2ndpartPhi3(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal ram_bus      : in     std_logic_vector(4  downto 1);
    signal curmnemonic  : in     std_logic_vector(8  downto 1);
    signal lastmnemonic : in     std_logic_vector(8  downto 1);
    --signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    --signal SB           : inout   std_logic_vector(12 downto 1);
    signal A            : inout   std_logic_vector(4  downto 1);
    signal B            : inout   std_logic_vector(12 downto 1);
    signal X            : inout   std_logic_vector(4  downto 1);
    signal C            : inout   std_logic;
    signal FF1          : inout   std_logic;
    signal FF2          : inout   std_logic;
    signal doa          : out     std_logic_vector(4  downto 1);
    signal dia          : in      std_logic_vector(4  downto 1);
    signal dio          : inout   std_logic_vector(4  downto 1);
    signal skip_next    : out     boolean 
   );


  
  procedure parseInstPhi1(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1)
  );
  
  procedure parseInstPhi3(
    signal mnemonic     : in      std_logic_vector(8  downto 1);
    signal lastmnemonic : in      std_logic_vector(8  downto 1);
    signal ram_bus      : in      std_logic_vector(4  downto 1);
    --signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    --signal SB           : inout   std_logic_vector(12 downto 1);
    signal A            : inout   std_logic_vector(4  downto 1);
    signal B            : inout   std_logic_vector(12 downto 1);
    signal X            : inout   std_logic_vector(4  downto 1);
    signal C            : inout   std_logic;
    signal FF1          : inout   std_logic;
    signal FF2          : inout   std_logic;
    signal doa          : out     std_logic_vector(4  downto 1);
    signal dia          : in      std_logic_vector(4  downto 1);
    signal dio          : inout   std_logic_vector(4  downto 1);
    signal skip_next    : out     boolean 
   );
     
  procedure parseInst(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal lastmnemonic : in      std_logic_vector(8  downto 1);
    signal ram_bus      : in     std_logic_vector(4  downto 1);
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1);
    signal A            : inout  std_logic_vector(4  downto 1);
    signal B            : inout  std_logic_vector(12 downto 1);
    signal X            : inout  std_logic_vector(4  downto 1);
    signal C            : inout  std_logic;
    signal FF1          : inout  std_logic;
    signal FF2          : inout  std_logic;
    signal doa          : out    std_logic_vector(4  downto 1);
    signal dia          : in     std_logic_vector(4  downto 1);
    signal dio          : inout  std_logic_vector(4  downto 1);
    signal skip_next    : out    boolean
  );
  
  procedure plo_INCREMENT_SLV (
    signal r_IN  : in  std_logic_vector(6 downto 1);
    signal r_OUT : out std_logic_vector(6 downto 1)
    );

  procedure pl2_INCREMENT_SLV (
    signal r_IN  : in  std_logic_vector(6 downto 1);
    signal r_OUT : out std_logic_vector(6 downto 1)
    );

  procedure pl3_INCREMENT_SLV (
    signal A  : inout  std_logic_vector(8 downto 1)
    );



end libpps4exec;

package body libpps4exec is

 -- Purpose: determine if we have a 1 or 2 instruction
   function is2inst (
    mnemonic : in std_logic_vector(8 downto 1))
    return boolean is
        variable mcode : unsigned(8 downto 1);
    begin
        mcode := unsigned(mnemonic);
        if    mcode >= 16#0# and mcode <= 16#3# then    --TML
            return true;
        elsif mcode >= 16#C0# and mcode <= 16#CF# then
            --LB
            return true;
        elsif mcode >= 16#D0# and mcode <= 16#FF# then
            --TM
            return true;
        elsif mcode >= 16#50# and mcode <= 16#5F# then
            --
            return true;
        elsif mcode = 16#1C# then
            --IOL
            return true;
        else
            return false;
        end if;
            
    end;



 -- Purpose: parse instruction 
 -- To be executed at phi1A
 -- There is a follow up at phi3A for instructions which need
 -- to read ram
  procedure parseInstPhi1(
    signal mnemonic     : in      std_logic_vector(8  downto 1);
    signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    signal SB           : inout   std_logic_vector(12 downto 1)
  ) is
    variable mcode  : unsigned(8 downto 1);

    alias  pc_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
    alias  pc_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);
   
    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
   
    
  begin
      mcode := unsigned(mnemonic);
      
      
      case mcode is           
         when "00000000"  =>
            --LBL (00)  part 1/2
            --nothing to do in part 1
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00000001" | "00000010" | "00000011" =>
            --TML (01..03)
            --part1: do nothing
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            
         when "00000100"  =>
            --LBUA (04)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --next line is to be executed after phi3A
            --BU <= A;
            --A  <= nram_bus; --TBC not or not not?

         when "00000101"  =>
            --RTN (05)
            pc  <= SA;
            
            --next could be executed now or later. now is better for consistency
            SA  <= SB;
            SB  <= SA;
        
         when "00000110"  =>
            --XS (06)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            --next could be executed now or later. now is better for consistency
            SA <= SB;
            SB <= SA;
         
         when "00000111"  =>
            --RTNSK (07)
            pc  <= SA;
            
            --next could be executed now or later. now is better for consistency            
            SA  <= SB;
            SB  <= SA;

            --end of case  is to be executed after phi3A
            --skip_next_word := true;       
         
         when "00001000"  =>
            --ADCSK (08)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            --end of case  is to be executed after phi3A
--            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
--            if (C = '1') then
--                ussum := ussum+1;
--            end if;
--            binadd := std_logic_vector(ussum);
--            A   <= binadd(4 downto 1);
--            C   <= binadd(5);
--            if binadd(5) = '1' then
--                skip_next_word := true; 
--            end if;

         when "00001001"  =>
            --ADSK (09)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
--            binadd := std_logic_vector(ussum);
--            A   <= binadd(4 downto 1);
--            C   <= binadd(5);
--            if binadd(5) = '1' then
--                skip_next_word := true;
--            end if;

         when "00001010"  =>
            --ADC (0A)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
--            if (C = '1') then
--                ussum := ussum+1;
--            end if;
--            binadd := std_logic_vector(ussum);
--            A   <= binadd(4 downto 1);
--            C   <= binadd(5);
            
         when "00001011"  =>
            --AD (0B)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
--            binadd := std_logic_vector(ussum);
--            A   <= binadd(4 downto 1);
--            C   <= binadd(5);
            
         when "00001100"  =>
            --EOR (0C)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A  <= A xor nram_bus;
        
            
         when "00001101"  =>
            --AND (0D)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A  <= A and nram_bus;
        
         when "00001110"  =>
            --COMP (0E)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A  <= not A;

         when "00001111"  =>
            --OR (0F)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
        
            --end of case  is to be executed after phi3A
            --A  <= A or nram_bus;
        
         when "00010000"  =>
            --LBMX (10)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            --end of case  is to be executed after phi3A
            --BM <= X;

              
         when "00010001"  =>
            --LABL (11)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A <= BL;

         when "00010010"  =>
            --LAX (12)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
            --end of case  is to be executed after phi3A
            --A  <= X;
         
         when "00010011"  =>
            --SAG (13)
            --nothing to do here
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         
         
         when "00010100"  =>
            --SKF2 (14)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --if FF2 = '1' then
            --    skip_next_word := true;
            --end if;

            
         when "00010101"  =>
            --SKC (15)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
 
            --end of case  is to be executed after phi3A
--            if C = '1' then
--                skip_next_word := true;
--            end if;

           
         when "00010110"  =>
            --SKF1 (16)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            --end of case  is to be executed after phi3A
--            if FF1 = '1' then
--                skip_next_word := true;
--            end if;


            
         when "00010111"  =>
            --INCB (17)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            --end of case  is to be executed after phi3A
--            BL <= std_logic_vector( unsigned(BL) + 1 );
--            if BL = "1111" then
--                skip_next_word := true;
--            end if;



         when "00011000"  =>
            --XBMX (18)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            X  <= BM;
--            BM <= X;


         
         when "00011001"  =>
            --XABL (19)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            A  <= BL;
--            BL <= A;

         
         when "00011010"  =>
            --XAX (1A)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
            --end of case  is to be executed after phi3A
--            A  <= X;
--            X  <= A;


         when "00011011"  =>
            --LXA (1B)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
            --end of case  is to be executed after phi3A
            --X  <= A;
         
         when "00011100"  =>
            --IOL (1C)
            --just have to set wio to 1 at next phi4. Will be done in pps4core.exe
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         when "00011101"  =>
            --DOA (1D)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--            doa <= A;
--            dio <= X;   --we can do that only because RS3 has its DIOs physically tied to -12V
--                        --hence, what is applied to DIO is same as X

                     
          when "00011110"  =>
            --SKZ (1E)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
 
             --end of case  is to be executed after phi3A
--            if  A = "0000"  then
--                skip_next_word := true;
--            end if;


           
          when "00011111"  =>
            --DECB (1F)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
             --end of case  is to be executed after phi3A
--            BL <= std_logic_vector( unsigned(BL) - 1 );
--            if  BL = "0000"  then
--                skip_next_word := true;
--            end if;

         when "00100000"  =>
            --SC (20)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --C <= '1';
            
         when "00100001"  =>
            --SF2 (21)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --FF2 <= '1';
            
         when "00100010"  =>
            --SF1 (22)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --FF1 <= '1';

         when "00100011"  =>
            --DIB (23)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A  <= dio;   --works only because of the circuitry of RS3 on pins DIO
            
         when "00100100"  =>
            --RC (24)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --C <= '0';
            
         when "00100101"  =>
            --RF2 (25)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --FF2 <= '0';
            
         when "00100110"  =>
            --RF1 (26)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --FF1 <= '0';

         when "00100111"  =>
             --DIA (27)
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
            --A  <= dia;
            
         when  "00101000" | "00101001" | "00101010" | "00101011" |
               "00101100" | "00101101" | "00101110" | "00101111"     =>
             --'''EXD (28..2F)'''
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
--             BL <= std_logic_vector( unsigned(BL) - 1 );   -- (TBC) not sure about this...
--             if BL = "0000" then
--                 skip_next_word := true;
--             end if;
--             A  <= nram_bus; --TBC not or not not?
            
         when  "00110000" | "00110001" | "00110010" | "00110011" |
               "00110100" | "00110101" | "00110110" | "00110111"     =>
             --'''LD (30..37)'''
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
             --B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
            
         when  "00111000" | "00111001" | "00111010" | "00111011" |
               "00111100" | "00111101" | "00111110" | "00111111"     =>
             --'''EX (38..3F)'''
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
--             A  <= nram_bus; --TBC not or not not?
                   
         when  "01000000" | "01000001" | "01000010" | "01000011" |
               "01000100" | "01000101" | "01000110" | "01000111" |   
               "01001000" | "01001001" | "01001010" | "01001011" |
               "01001100" | "01001101" | "01001110" | "01001111"   =>
             --'''SKBI (40..4F)''' 
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
--             if BL = mnemonic(4 downto 1) then
--                skip_next_word := true;
--             end if;
             
         when  "01010000" | "01010001" | "01010010" | "01010011" |
               "01010100" | "01010101" | "01010110" | "01010111" |   
               "01011000" | "01011001" | "01011010" | "01011011" |
               "01011100" | "01011101" | "01011110" | "01011111"   =>
             --'''TL (50..5F)''' 
             --part1: do nothing
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when  "01100000" | "01100001" | "01100010" | "01100011" |
               "01100100" |              "01100110" | "01100111" |
               "01101000" | "01101001" | "01101010" | "01101011" |
               "01101100" | "01101101" | "01101110"                =>
             --'''ADI (60..6E, but not 65)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
 --             --A<-A + |I1(4:1)| and skip if carry out but no change on C!
--            ussum  := unsigned('0'&A)+unsigned('0'&(not mnemonic(4 downto 1)));
--            binadd := std_logic_vector(ussum);
--            A   <= binadd(4 downto 1);
--            if binadd(5) = '1' then
--               skip_next_word := true;
--            end if;

         when "01100101"  =>
            --DC (65)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "01101111"  =>
            --CYS (6F)
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A 
--            --don't forget the not
--            A               <= not SA(4  downto 1);
--            SA(4  downto 1) <= SA(8  downto 5);
--            SA(8  downto 5) <= SA(12 downto 9);
--            SA(12 downto 9) <= not A;

         when  "01110000" | "01110001" | "01110010" | "01110011" |
               "01110100" | "01110101" | "01110110" | "01110111" |   
               "01111000" | "01111001" | "01111010" | "01111011" |
               "01111100" | "01111101" | "01111110" | "01111111"   =>
             --'''LDI (70..7F)''' 
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            --end of case  is to be executed after phi3A
 --             if mnemonic /= lastmnemonic then
--                 A     <= not mnemonic(4 downto 1);
--             end if;
           
         when  "11000000" | "11000001" | "11000010" | "11000011" |
               "11000100" | "11000101" | "11000110" | "11000111" |
               "11001000" | "11001001" | "11001010" | "11001011" |
               "11001100" | "11001101" | "11001110" | "11001111"   =>
            --'''LB Load indirect is in range C0..CF'''
            --part 1/2. is always executed, even if case of string of LB, LBLs...
            --   in such case, only part 2/2 is pruned. (from trace experimentation on original 11660)
            SB              <= SA;
            SA_hi           <= pc_hi;
            SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
            pc(12 downto 5) <= "00001100";     
            pc( 4 downto 1) <= mnemonic(4 downto 1);
               
         when others      =>
            if   mcode(8) = '1' and mcode(7) = '0' then
                --'''T Transfer is in range 80..BF'''
                pc_lo <= mnemonic(6 downto 1);
            elsif mcode(8)  = '1' and mcode(7)  = '1' and
                 (mcode(6) /= '0' or  mcode(5) /= '0') then
                --'''TM Transfer and mark is in range D0..FF'''
                --part 1/2
                SB              <= SA;
                SA_hi           <= pc_hi;
                SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
                
                pc(12 downto 7) <= "000011";
                pc( 6 downto 1) <= mnemonic(6 downto 1);    
            else
                -- report("Should not get here (1)");
                pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            end if;   
      end case; 
      
            
  end parseInstPhi1;



  procedure parseInstPhi3(
    signal mnemonic     : in      std_logic_vector(8  downto 1);
    signal lastmnemonic : in      std_logic_vector(8  downto 1);
    signal ram_bus      : in      std_logic_vector(4  downto 1);
    --signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    --signal SB           : inout   std_logic_vector(12 downto 1);
    signal A            : inout   std_logic_vector(4  downto 1);
    signal B            : inout   std_logic_vector(12 downto 1);
    signal X            : inout   std_logic_vector(4  downto 1);
    signal C            : inout   std_logic;
    signal FF1          : inout   std_logic;
    signal FF2          : inout   std_logic;
    signal doa          : out     std_logic_vector(4  downto 1);
    signal dia          : in      std_logic_vector(4  downto 1);
    signal dio          : inout   std_logic_vector(4  downto 1);
    signal skip_next    : out     boolean 
  ) is
    variable mcode  : unsigned(8 downto 1);
    variable ussum  : unsigned(5 downto 1);
    
    variable binadd     : std_logic_vector(5 downto 1); --for adsck
    alias  BL           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(4 DOWNTO 1);
    alias  BM           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(8 DOWNTO 5);
    alias  BU           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(12 DOWNTO 9);
--    alias  pc_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
--    alias  pc_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);
   
--    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
--    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
   
    variable skip_next_word : boolean := false;
    
    variable testus   : unsigned(8 downto 1):="01000000";
    variable testus2  : unsigned(8 downto 1):="01001111";

    variable nram_bus : std_logic_vector(4  downto 1);
    
  begin
      mcode := unsigned(mnemonic);
      nram_bus := not ram_bus;
      
      skip_next_word := false; --only skip instructions can set this to true
      
      case mcode is           
         when "00000000"  =>
            --LBL (00)  part 1/2
            --nothing to do in part 1
            null;
         when "00000001" | "00000010" | "00000011" =>
            --TML (01..03)
            --part1: do nothing
            null;
            
         when "00000100"  =>
            --LBUA (04)
            BU <= A;
            A  <= nram_bus; --TBC not or not not?

         when "00000101"  =>
            --RTN (05)
            null;
        
         when "00000110"  =>
            --XS (06)
            null;
                
         when "00000111"  =>
            --RTNSK (07)
            skip_next_word := true;       
         
         when "00001000"  =>
            --ADCSK (08)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            if (C = '1') then
                ussum := ussum+1;
            end if;
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            if binadd(5) = '1' then
                skip_next_word := true; 
            end if;
            
         when "00001001"  =>
            --ADSK (09)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            if binadd(5) = '1' then
                skip_next_word := true;
            end if;

         when "00001010"  =>
            --ADC (0A)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            if (C = '1') then
                ussum := ussum+1;
            end if;
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            
         when "00001011"  =>
            --AD (0B)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);

            
         when "00001100"  =>
            --EOR (0C)
            A  <= A xor nram_bus;
        
            
         when "00001101"  =>
            --AND (0D)
            A  <= A and nram_bus;
        
         when "00001110"  =>
            --COMP (0E)
            A  <= not A;

         when "00001111"  =>
            --OR (0F)
            A  <= A or nram_bus;
        
        
         when "00010000"  =>
            --LBMX (10)
            BM <= X;
              
         when "00010001"  =>
            --LABL (11)
            A <= BL;

         when "00010010"  =>
            --LAX (12)
            A  <= X;
         
         
         when "00010011"  =>
            --SAG (13)
            --nothing to do here
            null;         
         
         
         when "00010100"  =>
            --SKF2 (14)
            if FF2 = '1' then
                skip_next_word := true;
            end if;
            
         when "00010101"  =>
            --SKC (15)
            if C = '1' then
                skip_next_word := true;
            end if;
            
         when "00010110"  =>
            --SKF1 (16)
            if FF1 = '1' then
                skip_next_word := true;
            end if;
            
         when "00010111"  =>
            --INCB (17)
            BL <= std_logic_vector( unsigned(BL) + 1 );
            if BL = "1111" then
                skip_next_word := true;
            end if;

         when "00011000"  =>
            --XBMX (18)
            X  <= BM;
            BM <= X;
         
         when "00011001"  =>
            --XABL (19)
            A  <= BL;
            BL <= A;
         
         when "00011010"  =>
            --XAX (1A)
            A  <= X;
            X  <= A;
         

         when "00011011"  =>
            --LXA (1B)
            X  <= A;
         
         
         when "00011100"  =>
            --IOL (1C)
            --just have to set wio to 1 at next phi4. Will be done in pps4core.exe
            null;
            
            
         when "00011101"  =>
            --DOA (1D)
            doa <= A;
            dio <= X;   --we can do that only because RS3 has its DIOs physically tied to -12V
                        --hence, what is applied to DIO is same as X
                     
          when "00011110"  =>
            --SKZ (1E)
            if  A = "0000"  then
                skip_next_word := true;
            end if;
            
          when "00011111"  =>
            --DECB (1F)
            BL <= std_logic_vector( unsigned(BL) - 1 );
            if  BL = "0000"  then
                skip_next_word := true;
            end if;
            

         when "00100000"  =>
            --SC (20)
            C <= '1';
            
         when "00100001"  =>
            --SF2 (21)
            FF2 <= '1';
            
         when "00100010"  =>
            --SF1 (22)
            FF1 <= '1';

         when "00100011"  =>
            --DIB (23)
            A  <= dio;   --works only because of the circuitry of RS3 on pins DIO
            
         when "00100100"  =>
            --RC (24)
            C <= '0';
            
         when "00100101"  =>
            --RF2 (25)
            FF2 <= '0';
            
         when "00100110"  =>
            --RF1 (26)
            FF1 <= '0';

         when "00100111"  =>
             --DIA (27)
             A  <= dia;
            
         when  "00101000" | "00101001" | "00101010" | "00101011" |
               "00101100" | "00101101" | "00101110" | "00101111"     =>
             --'''EXD (28..2F)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             BL <= std_logic_vector( unsigned(BL) - 1 );   -- (TBC) not sure about this...
             if BL = "0000" then
                 skip_next_word := true;
             end if;
             A  <= nram_bus; --TBC not or not not?
            
         when  "00110000" | "00110001" | "00110010" | "00110011" |
               "00110100" | "00110101" | "00110110" | "00110111"     =>
             --'''LD (30..37)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             A  <= nram_bus; --TBC not or not not?
           
         when  "00111000" | "00111001" | "00111010" | "00111011" |
               "00111100" | "00111101" | "00111110" | "00111111"     =>
             --'''EX (38..3F)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             A  <= nram_bus; --TBC not or not not?
                   
         when  "01000000" | "01000001" | "01000010" | "01000011" |
               "01000100" | "01000101" | "01000110" | "01000111" |   
               "01001000" | "01001001" | "01001010" | "01001011" |
               "01001100" | "01001101" | "01001110" | "01001111"   =>
             --'''SKBI (40..4F)''' 
             if BL = mnemonic(4 downto 1) then
                skip_next_word := true;
             end if;
             
         when  "01010000" | "01010001" | "01010010" | "01010011" |
               "01010100" | "01010101" | "01010110" | "01010111" |   
               "01011000" | "01011001" | "01011010" | "01011011" |
               "01011100" | "01011101" | "01011110" | "01011111"   =>
             --'''TL (50..5F)''' 
             --part1: do nothing
             null;

         when  "01100000" | "01100001" | "01100010" | "01100011" |
               "01100100" |              "01100110" | "01100111" |
               "01101000" | "01101001" | "01101010" | "01101011" |
               "01101100" | "01101101" | "01101110"                =>
             --'''ADI (60..6E, but not 65)
             --A<-A + |I1(4:1)| and skip if carry out but no change on C!
            ussum  := unsigned('0'&A)+unsigned('0'&(not mnemonic(4 downto 1)));
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            if binadd(5) = '1' then
               skip_next_word := true;
            end if;

         when "01100101"  =>
            --DC (65)
            ussum  := unsigned('0'&A)+"01010";
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            --Spec says instruction does not use or change carry flip flop or skip 
            --=> carry out is left out (binadd(5) is not used
            
         when "01101111"  =>
            --CYS (6F)
            --don't forget the not
            A               <= not SA(4  downto 1);
            SA(4  downto 1) <= SA(8  downto 5);
            SA(8  downto 5) <= SA(12 downto 9);
            SA(12 downto 9) <= not A;

         when  "01110000" | "01110001" | "01110010" | "01110011" |
               "01110100" | "01110101" | "01110110" | "01110111" |   
               "01111000" | "01111001" | "01111010" | "01111011" |
               "01111100" | "01111101" | "01111110" | "01111111"   =>
             --'''LDI (70..7F)''' 
             if mnemonic(8 downto 5) /= lastmnemonic(8 downto 5) then
                 A     <= not mnemonic(4 downto 1);
             end if;
            
         when  "11000000" | "11000001" | "11000010" | "11000011" |
               "11000100" | "11000101" | "11000110" | "11000111" |
               "11001000" | "11001001" | "11001010" | "11001011" |
               "11001100" | "11001101" | "11001110" | "11001111"   =>
            --'''LB Load indirect is in range C0..CF'''
            --part 1/2. is always executed, even if case of string of LB, LBLs...
            --   in such case, only part 2/2 is pruned. (from trace experimentation on original 11660)
            -- all job of part 1/2 done during phi1
            null;
                           
         when others      =>
            --nothing to do here (concerns T or TM for which job was done in phi1)
            null;
      end case; 
      
      
      skip_next <= skip_next_word;
      
  end parseInstPhi3;

  --Not used: to be deleted asap. Many errors not corrected here, since not used... 
  procedure parseInst(
    signal mnemonic     : in      std_logic_vector(8  downto 1);
    signal lastmnemonic : in      std_logic_vector(8  downto 1);
    signal ram_bus      : in      std_logic_vector(4  downto 1);
    signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    signal SB           : inout   std_logic_vector(12 downto 1);
    signal A            : inout   std_logic_vector(4  downto 1);
    signal B            : inout   std_logic_vector(12 downto 1);
    signal X            : inout   std_logic_vector(4  downto 1);
    signal C            : inout   std_logic;
    signal FF1          : inout   std_logic;
    signal FF2          : inout   std_logic;
    signal doa          : out     std_logic_vector(4  downto 1);
    signal dia          : in      std_logic_vector(4  downto 1);
    signal dio          : inout   std_logic_vector(4  downto 1);
    signal skip_next    : out     boolean 
  ) is
    variable mcode  : unsigned(8 downto 1);
    variable ussum  : unsigned(5 downto 1);
    
    variable binadd : std_logic_vector(5 downto 1); --for adsck
    alias  BL           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(4 DOWNTO 1);
    alias  BM           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(8 DOWNTO 5);
    alias  BU           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(12 DOWNTO 9);
    alias  pc_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
    alias  pc_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);
   
    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
   
    variable skip_next_word : boolean := false;
    
    variable testus   : unsigned(8 downto 1):="01000000";
    variable testus2  : unsigned(8 downto 1):="01001111";

    variable nram_bus : std_logic_vector(4  downto 1);
    
  begin
      mcode := unsigned(mnemonic);
      nram_bus := not ram_bus;
      
      skip_next_word := false; --only skip instructions can set this to true
      
      case mcode is           
         when "00000000"  =>
            --LBL (00)  part 1/2
            --nothing to do in part 1
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00000001" | "00000010" | "00000011" =>
            --TML (01..03)
            --part1: do nothing
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
            
         when "00000100"  =>
            --LBUA (04)
            BU <= A;
            A  <= nram_bus; --TBC not or not not?
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00000101"  =>
            --RTN (05)
            pc  <= SA;
            SA  <= SB;
            SB  <= SA;
        
         when "00000110"  =>
            --XS (06)
            SA <= SB;
            SB <= SA;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         when "00000111"  =>
            --RTNSK (07)
            pc  <= SA;
            SA  <= SB;
            SB  <= SA;
            skip_next_word := true;       
         
         when "00001000"  =>
            --ADCSK (08)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            if (C = '1') then
                ussum := ussum+1;
            end if;
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            if binadd(5) = '1' then
                skip_next_word := true; 
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00001001"  =>
            --ADSK (09)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            if binadd(5) = '1' then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00001010"  =>
            --ADC (0A)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            if (C = '1') then
                ussum := ussum+1;
            end if;
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00001011"  =>
            --AD (0B)
            ussum  := unsigned('0'&A)+unsigned('0'&nram_bus);
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            C   <= binadd(5);
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

            
         when "00001100"  =>
            --EOR (0C)
            A  <= A xor nram_bus;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
        
            
         when "00001101"  =>
            --AND (0D)
            A  <= A and nram_bus;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
        
         when "00001110"  =>
            --COMP (0E)
            A  <= not A;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00001111"  =>
            --OR (0F)
            A  <= A or nram_bus;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
        
        
         when "00010000"  =>
            --LBMX (10)
            BM <= X;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
              
         when "00010001"  =>
            --LABL (11)
            A <= BL;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00010010"  =>
            --LAX (12)
            A  <= X;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         
         when "00010011"  =>
            --SAG (13)
            --nothing to do here
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         
         
         when "00010100"  =>
            --SKF2 (14)
            if FF2 = '1' then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00010101"  =>
            --SKC (15)
            if C = '1' then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00010110"  =>
            --SKF1 (16)
            if FF1 = '1' then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00010111"  =>
            --INCB (17)
            BL <= std_logic_vector( unsigned(BL) + 1 );
            if BL = "1111" then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00011000"  =>
            --XBMX (18)
            X  <= BM;
            BM <= X;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         when "00011001"  =>
            --XABL (19)
            A  <= BL;
            BL <= A;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         when "00011010"  =>
            --XAX (1A)
            A  <= X;
            X  <= A;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         

         when "00011011"  =>
            --LXA (1B)
            X  <= A;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         
         when "00011100"  =>
            --IOL (1C)
            --just have to set wio to 1 at next phi4. Will be done in pps4core.exe
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
         
         when "00011101"  =>
            --DOA (1D)
            doa <= A;
            dio <= X;   --we can do that only because RS3 has its DIOs physically tied to -12V
                        --hence, what is applied to DIO is same as X
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
                     
          when "00011110"  =>
            --SKZ (1E)
            if  A = "0000"  then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
          when "00011111"  =>
            --DECB (1F)
            BL <= std_logic_vector( unsigned(BL) - 1 );
            if  BL = "0000"  then
                skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            

         when "00100000"  =>
            --SC (20)
            C <= '1';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00100001"  =>
            --SF2 (21)
            FF2 <= '1';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00100010"  =>
            --SF1 (22)
            FF1 <= '1';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00100011"  =>
            --DIB (23)
            A  <= dio;   --works only because of the circuitry of RS3 on pins DIO
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00100100"  =>
            --RC (24)
            C <= '0';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00100101"  =>
            --RF2 (25)
            FF2 <= '0';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when "00100110"  =>
            --RF1 (26)
            FF1 <= '0';
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when "00100111"  =>
             --DIA (27)
             A  <= dia;
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when  "00101000" | "00101001" | "00101010" | "00101011" |
               "00101100" | "00101101" | "00101110" | "00101111"     =>
             --'''EXD (28..2F)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             BL <= std_logic_vector( unsigned(BL) - 1 );   -- (TBC) not sure about this...
             if BL = "0000" then
                 skip_next_word := true;
             end if;
             A  <= nram_bus; --TBC not or not not?
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when  "00110000" | "00110001" | "00110010" | "00110011" |
               "00110100" | "00110101" | "00110110" | "00110111"     =>
             --'''LD (30..37)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when  "00111000" | "00111001" | "00111010" | "00111011" |
               "00111100" | "00111101" | "00111110" | "00111111"     =>
             --'''EX (38..3F)'''
             B(7 downto 5) <= B(7 downto 5) xor (not mnemonic(3 downto 1));
             A  <= nram_bus; --TBC not or not not?
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
                   
         when  "01000000" | "01000001" | "01000010" | "01000011" |
               "01000100" | "01000101" | "01000110" | "01000111" |   
               "01001000" | "01001001" | "01001010" | "01001011" |
               "01001100" | "01001101" | "01001110" | "01001111"   =>
             --'''SKBI (40..4F)''' 
             if BL = mnemonic(4 downto 1) then
                skip_next_word := true;
             end if;
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
             
         when  "01010000" | "01010001" | "01010010" | "01010011" |
               "01010100" | "01010101" | "01010110" | "01010111" |   
               "01011000" | "01011001" | "01011010" | "01011011" |
               "01011100" | "01011101" | "01011110" | "01011111"   =>
             --'''TL (50..5F)''' 
             --part1: do nothing
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when  "01100000" | "01100001" | "01100010" | "01100011" |
               "01100100" |              "01100110" | "01100111" |
               "01101000" | "01101001" | "01101010" | "01101011" |
               "01101100" | "01101101" | "01101110"                =>
             --'''ADI (60..6E, but not 65)
             --A<-A + |I1(4:1)| and skip if carry out but no change on C!
            ussum  := unsigned('0'&A)+unsigned('0'&(not mnemonic(4 downto 1)));
            binadd := std_logic_vector(ussum);
            A   <= binadd(4 downto 1);
            if binadd(5) = '1' then
               skip_next_word := true;
            end if;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
             
         when "01101111"  =>
            --CYS (6F)
            --don't forget the not
            A               <= not SA(4  downto 1);
            SA(4  downto 1) <= SA(8  downto 5);
            SA(8  downto 5) <= SA(12 downto 9);
            SA(12 downto 9) <= not A;
            pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );

         when  "01110000" | "01110001" | "01110010" | "01110011" |
               "01110100" | "01110101" | "01110110" | "01110111" |   
               "01111000" | "01111001" | "01111010" | "01111011" |
               "01111100" | "01111101" | "01111110" | "01111111"   =>
             --'''LDI (70..7F)''' 
             if mnemonic /= lastmnemonic then
                 A     <= not mnemonic(4 downto 1);
             end if;
             pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            
         when  "11000000" | "11000001" | "11000010" | "11000011" |
               "11000100" | "11000101" | "11000110" | "11000111" |
               "11001000" | "11001001" | "11001010" | "11001011" |
               "11001100" | "11001101" | "11001110" | "11001111"   =>
            --'''LB Load indirect is in range C0..CF'''
            --part 1/2. is always executed, even if case of string of LB, LBLs...
            --   in such case, only part 2/2 is pruned. (from trace experimentation on original 11660)
            SB              <= SA;
            SA_hi           <= pc_hi;
            SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
            pc(12 downto 5) <= "00001100";     
            pc( 4 downto 1) <= mnemonic(4 downto 1);
               
         when others      =>
            if   mcode(8) = '1' and mcode(7) = '0' then
                --'''T Transfer is in range 80..BF'''
                pc_lo <= mnemonic(6 downto 1);
            elsif mcode(8)  = '1' and mcode(7)  = '1' and
                 (mcode(6) /= '0' or  mcode(5) /= '0') then
                --'''TM Transfer and mark is in range D0..FF'''
                --part 1/2
                SB              <= SA;
                SA_hi           <= pc_hi;
                SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
                
                pc(12 downto 7) <= "000011";
                pc( 6 downto 1) <= mnemonic(6 downto 1);    
            else
                -- report("Should not get here (1)");
                pc_lo <= std_logic_vector( unsigned(pc_lo) + 1 );
            end if;   
      end case; 
      
      
      skip_next <= skip_next_word;
      
  end parseInst;

  procedure parse2ndpartPhi1(
    signal mnemonic     : in     std_logic_vector(8  downto 1);  --value of 2nd word of a 2 cycl instruction
    signal curmnemonic  : in     std_logic_vector(8  downto 1);  --value of  1st word of current 2 cycl inst
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1)
    ) is

    variable mcode  : unsigned(8 downto 1);
    alias  pc_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
    alias  pc_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);
   
    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
  

  begin
    mcode := unsigned(curmnemonic);
    
  case mcode is           
     when "00000000"  =>
        --LBL (00)  part 2/2
        pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );
        
        --To be executed from phi3A
--        --only first occurrence in a string of LB or LBL will be executed
--        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
--            BU     <= "0000";
--            B(8 downto 1) <= not mnemonic;
--        end if;

     when "00000001" | "00000010" | "00000011" =>
        --TML (01..03)
        --part 2/2: do the job
        SB              <= SA;
        SA_hi           <= pc_hi;
        SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
        pc(12 downto 9) <= curmnemonic(4 downto 1);
        pc( 8 downto 1) <= mnemonic;

     when "00011100"  =>
        --IOL (1C)
        --Part 2/2 nothing to do. Only IO operations that are done in pps4core. and doing that later
        pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );
        
        --next to be done later
        --A  <= nram_bus; --TBC not or not not?

     when  "01010000" | "01010001" | "01010010" | "01010011" |
           "01010100" | "01010101" | "01010110" | "01010111" |   
           "01011000" | "01011001" | "01011010" | "01011011" |
           "01011100" | "01011101" | "01011110" | "01011111"   =>
         --'''TL (50..5F)''' 
         --part2/2
         pc(12 downto 9) <= curmnemonic(4 downto 1);
         pc( 8 downto 1) <= mnemonic;

     when  "11000000" | "11000001" | "11000010" | "11000011" |
           "11000100" | "11000101" | "11000110" | "11000111" |
           "11001000" | "11001001" | "11001010" | "11001011" |
           "11001100" | "11001101" | "11001110" | "11001111"   =>
        --'''LB Load indirect is in range C0..CF'''
        --part 2/2. 
        --only part 2/2 is (partially) pruned if string of LBs, LBLs. (from trace experimentation on original 11660)
        SA          <= SB;
        SB          <= SA;
        pc          <= SA;
        
        --next to be done later
--        --only first occurrence in a string of LB or LBL will be executed
--        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
--            BU            <= "0000";
--            B(8 downto 1) <= not mnemonic;
--        end if;
            
     when others      =>
         if mcode(8)  = '1' and mcode(7)  = '1' and
         (mcode(6) /= '0' or  mcode(5) /= '0') then
            --'''TM Transfer and mark is in range D0..FF'''
            --part 2/2                
                pc(12 downto 9) <= "0001";
                pc( 8 downto 1) <= mnemonic;   
          else
             --should not get here
             pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );         
          end if;   

  end case; 

  end parse2ndpartPhi1;

  procedure parse2ndpart(
    signal mnemonic     : in     std_logic_vector(8  downto 1);  --value of 2nd word of a 2 cycl instruction
    signal ram_bus      : in     std_logic_vector(4  downto 1);
    signal curmnemonic  : in     std_logic_vector(8  downto 1);  --value of  1st word of current 2 cycl inst
    signal lastmnemonic : in     std_logic_vector(8  downto 1);  --mnemonic of previous instruction 
    signal pc           : inout  std_logic_vector(12 downto 1);
    signal SA           : inout  std_logic_vector(12 downto 1);
    signal SB           : inout  std_logic_vector(12 downto 1);
    signal A            : inout  std_logic_vector(4  downto 1);
    signal B            : inout  std_logic_vector(12 downto 1);
    signal X            : inout  std_logic_vector(4  downto 1);
    signal C            : inout  std_logic;
    signal FF1          : inout  std_logic;
    signal FF2          : inout  std_logic
    ) is

    variable mcode  : unsigned(8 downto 1);
    alias  BL           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(4 DOWNTO 1);
    alias  BM           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(8 DOWNTO 5);
    alias  BU           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(12 DOWNTO 9);
    alias  pc_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(12 DOWNTO 7);
    alias  pc_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is pc(6 DOWNTO 1);
   
    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
  
    variable nram_bus : std_logic_vector(4  downto 1);

  begin
    mcode := unsigned(curmnemonic);
    nram_bus := not ram_bus;
    
  case mcode is           
     when "00000000"  =>
        --LBL (00)  part 2/2
        --only first occurrence in a string of LB or LBL will be executed
        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
            BU     <= "0000";
            B(8 downto 1) <= not mnemonic;
        end if;
        pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );
        
     when "00000001" | "00000010" | "00000011" =>
        --TML (01..03)
        --part 2/2: do the job
        SB              <= SA;
        SA_hi           <= pc_hi;
        SA_lo           <= std_logic_vector( unsigned(pc_lo) + 1 );
        pc(12 downto 9) <= curmnemonic(4 downto 1);
        pc( 8 downto 1) <= mnemonic;

     when "00011100"  =>
        --IOL (1C)
        --Part 2/2 nothing to do. Only IO operations that are done in pps4core.
        A  <= nram_bus; --TBC not or not not?
        pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );

     when  "01010000" | "01010001" | "01010010" | "01010011" |
           "01010100" | "01010101" | "01010110" | "01010111" |   
           "01011000" | "01011001" | "01011010" | "01011011" |
           "01011100" | "01011101" | "01011110" | "01011111"   =>
         --'''TL (50..5F)''' 
         --part2/2
         pc(12 downto 9) <= curmnemonic(4 downto 1);
         pc( 8 downto 1) <= mnemonic;

     when  "11000000" | "11000001" | "11000010" | "11000011" |
           "11000100" | "11000101" | "11000110" | "11000111" |
           "11001000" | "11001001" | "11001010" | "11001011" |
           "11001100" | "11001101" | "11001110" | "11001111"   =>
        --'''LB Load indirect is in range C0..CF'''
        --part 2/2. 
        --only part 2/2 is (partially) pruned if string of LBs, LBLs. (from trace experimentation on original 11660)
        SA          <= SB;
        SB          <= SA;
        pc          <= SA;
        --only first occurrence in a string of LB or LBL will be executed
        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
            BU            <= "0000";
            B(8 downto 1) <= not mnemonic;
        end if;
            
     when others      =>
         if mcode(8)  = '1' and mcode(7)  = '1' and
         (mcode(6) /= '0' or  mcode(5) /= '0') then
            --'''TM Transfer and mark is in range D0..FF'''
            --part 2/2    (Mark was done in part 1/2            
                pc(12 downto 9) <= "0001";
                pc( 8 downto 1) <= mnemonic;   
          else
             --should not get here
             pc_lo  <= std_logic_vector( unsigned(pc_lo) + 1 );         
          end if;   

  end case; 

  end parse2ndpart;


  procedure parse2ndpartPhi3(
    signal mnemonic     : in     std_logic_vector(8  downto 1);
    signal ram_bus      : in     std_logic_vector(4  downto 1);
    signal curmnemonic  : in     std_logic_vector(8  downto 1);
    signal lastmnemonic : in     std_logic_vector(8  downto 1);
    --signal pc           : inout   std_logic_vector(12 downto 1);
    signal SA           : inout   std_logic_vector(12 downto 1);
    --signal SB           : inout   std_logic_vector(12 downto 1);
    signal A            : inout   std_logic_vector(4  downto 1);
    signal B            : inout   std_logic_vector(12 downto 1);
    signal X            : inout   std_logic_vector(4  downto 1);
    signal C            : inout   std_logic;
    signal FF1          : inout   std_logic;
    signal FF2          : inout   std_logic;
    signal doa          : out     std_logic_vector(4  downto 1);
    signal dia          : in      std_logic_vector(4  downto 1);
    signal dio          : inout   std_logic_vector(4  downto 1);
    signal skip_next    : out     boolean 
    ) is

    variable mcode  : unsigned(8 downto 1);
   
    alias  SA_hi        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(12 DOWNTO 7);
    alias  SA_lo        : STD_LOGIC_VECTOR(6 DOWNTO 1) is SA(6 DOWNTO 1);
  
    alias  BL           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(4 DOWNTO 1);
    alias  BM           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(8 DOWNTO 5);
    alias  BU           : STD_LOGIC_VECTOR(4 DOWNTO 1)
                        is B(12 DOWNTO 9);

    variable nram_bus : std_logic_vector(4  downto 1);


  begin
    mcode := unsigned(curmnemonic);
    
    nram_bus := not ram_bus;

  case mcode is           
     when "00000000"  =>
        --LBL (00)  part 2/2
        
        --To be executed from phi3A
--        --only first occurrence in a string of LB or LBL will be executed
        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
            BU     <= "0000";
            B(8 downto 1) <= not mnemonic;
        end if;

     when "00000001" | "00000010" | "00000011" =>
        --TML (01..03)
        --part 2/2 phi3 nothing to do
        null;
        
     when "00011100"  =>
        --IOL (1C)
        --Part 2/2  phi3
        A  <= nram_bus; --TBC not or not not?

     when  "01010000" | "01010001" | "01010010" | "01010011" |
           "01010100" | "01010101" | "01010110" | "01010111" |   
           "01011000" | "01011001" | "01011010" | "01011011" |
           "01011100" | "01011101" | "01011110" | "01011111"   =>
         --'''TL (50..5F)''' 
         --part2/2
         null;

     when  "11000000" | "11000001" | "11000010" | "11000011" |
           "11000100" | "11000101" | "11000110" | "11000111" |
           "11001000" | "11001001" | "11001010" | "11001011" |
           "11001100" | "11001101" | "11001110" | "11001111"   =>
        --'''LB Load indirect is in range C0..CF'''
        --part 2/2. 
        --only part 2/2 is (partially) pruned if string of LBs, LBLs. (from trace experimentation on original 11660)
        --only first occurrence in a string of LB or LBL will be executed
        if lastmnemonic /= "00000000" and lastmnemonic(8 downto 5) /= "1100" then
            BU            <= "0000";
            B(8 downto 1) <= not mnemonic;
        end if;
            
     when others      =>
         null;
         
  end case; 

  end parse2ndpartPhi3;


  
 -- Purpose: Increments a std_logic_vector of sz 6 by 1
  procedure plo_INCREMENT_SLV (
    signal r_IN  : in  std_logic_vector(6 downto 1);
    signal r_OUT : out std_logic_vector(6 downto 1)
    ) is
  begin
    r_OUT <= std_logic_vector(unsigned(r_IN) + 1);
  end plo_INCREMENT_SLV;


  --Purpose: test nested procedure
  procedure pl2_INCREMENT_SLV (
    signal r_IN  : in  std_logic_vector(6 downto 1);
    signal r_OUT : out std_logic_vector(6 downto 1)
    ) is
  begin
    plo_INCREMENT_SLV(r_IN, r_OUT);
  end pl2_INCREMENT_SLV;

  --Purpose: another test
  procedure pl3_INCREMENT_SLV (
    signal A  : inout  std_logic_vector(8 downto 1)
    ) is
  begin
    A <= A(4 downto 1)&A(4 downto 1) ;
  end pl3_INCREMENT_SLV;

  
end libpps4exec;
