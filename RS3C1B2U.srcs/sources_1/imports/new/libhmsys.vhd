--------------------------------------------------------------------------------
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package libhmsys is

constant NVRAM_INIT : std_logic_vector(0 to 1023) := 

"0000"&	--word 0x000
"0000"&	--word 0x001
"0000"&	--word 0x002
"0000"&	--word 0x003
"0000"&	--word 0x004
"0000"&	--word 0x005
"0000"&	--word 0x006
"0000"&	--word 0x007
"0000"&	--word 0x008
"0000"&	--word 0x009
"0100"&	--word 0x00A
"0000"&	--word 0x00B
"0000"&	--word 0x00C
"0000"&	--word 0x00D
"0000"&	--word 0x00E
"0000"&	--word 0x00F
"0000"&	--word 0x010
"0000"&	--word 0x011
"0000"&	--word 0x012
"0000"&	--word 0x013
"0000"&	--word 0x014
"0000"&	--word 0x015
"0000"&	--word 0x016
"0000"&	--word 0x017
"0000"&	--word 0x018
"0000"&	--word 0x019
"1000"&	--word 0x01A
"0000"&	--word 0x01B
"0000"&	--word 0x01C
"0000"&	--word 0x01D
"0000"&	--word 0x01E
"0000"&	--word 0x01F
"1000"&	--word 0x020
"0000"&	--word 0x021
"0000"&	--word 0x022
"1111"&	--word 0x023
"0010"&	--word 0x024
"1010"&	--word 0x025
"0000"&	--word 0x026
"1000"&	--word 0x027
"0000"&	--word 0x028
"0000"&	--word 0x029
"1100"&	--word 0x02A
"0000"&	--word 0x02B
"0000"&	--word 0x02C
"0000"&	--word 0x02D
"0000"&	--word 0x02E
"0000"&	--word 0x02F
"0000"&	--word 0x030
"0000"&	--word 0x031
"0000"&	--word 0x032
"0000"&	--word 0x033
"0000"&	--word 0x034
"0000"&	--word 0x035
"0000"&	--word 0x036
"0000"&	--word 0x037
"0000"&	--word 0x038
"0000"&	--word 0x039
"0000"&	--word 0x03A
"0000"&	--word 0x03B
"0000"&	--word 0x03C
"0000"&	--word 0x03D
"0000"&	--word 0x03E
"0000"&	--word 0x03F
"0000"&	--word 0x040
"0000"&	--word 0x041
"0000"&	--word 0x042
"0000"&	--word 0x043
"0000"&	--word 0x044
"0000"&	--word 0x045
"0000"&	--word 0x046
"0000"&	--word 0x047
"0000"&	--word 0x048
"0000"&	--word 0x049
"0000"&	--word 0x04A
"0000"&	--word 0x04B
"0000"&	--word 0x04C
"0000"&	--word 0x04D
"0000"&	--word 0x04E
"0000"&	--word 0x04F
"0000"&	--word 0x050
"0000"&	--word 0x051
"0000"&	--word 0x052
"0000"&	--word 0x053
"0000"&	--word 0x054
"0000"&	--word 0x055
"0000"&	--word 0x056
"0000"&	--word 0x057
"0000"&	--word 0x058
"0000"&	--word 0x059
"0000"&	--word 0x05A
"0000"&	--word 0x05B
"0000"&	--word 0x05C
"0000"&	--word 0x05D
"0000"&	--word 0x05E
"0000"&	--word 0x05F
"0100"&	--word 0x060
"1101"&	--word 0x061
"0011"&	--word 0x062
"0000"&	--word 0x063
"0000"&	--word 0x064
"0000"&	--word 0x065
"0000"&	--word 0x066
"0000"&	--word 0x067
"0000"&	--word 0x068
"0000"&	--word 0x069
"0011"&	--word 0x06A
"0000"&	--word 0x06B
"0000"&	--word 0x06C
"0000"&	--word 0x06D
"0000"&	--word 0x06E
"0000"&	--word 0x06F
"0000"&	--word 0x070
"0000"&	--word 0x071
"0011"&	--word 0x072
"0000"&	--word 0x073
"0000"&	--word 0x074
"0000"&	--word 0x075
"0000"&	--word 0x076
"0000"&	--word 0x077
"0000"&	--word 0x078
"0000"&	--word 0x079
"0011"&	--word 0x07A
"0000"&	--word 0x07B
"0000"&	--word 0x07C
"0000"&	--word 0x07D
"0000"&	--word 0x07E
"0000"&	--word 0x07F
"0010"&	--word 0x080
"0010"&	--word 0x081
"1111"&	--word 0x082
"0000"&	--word 0x083
"0000"&	--word 0x084
"0000"&	--word 0x085
"0000"&	--word 0x086
"0000"&	--word 0x087
"0000"&	--word 0x088
"0000"&	--word 0x089
"1000"&	--word 0x08A
"0000"&	--word 0x08B
"0000"&	--word 0x08C
"0000"&	--word 0x08D
"0000"&	--word 0x08E
"0000"&	--word 0x08F
"1100"&	--word 0x090
"1111"&	--word 0x091
"1111"&	--word 0x092
"0000"&	--word 0x093
"0000"&	--word 0x094
"0000"&	--word 0x095
"0000"&	--word 0x096
"0000"&	--word 0x097
"0000"&	--word 0x098
"0000"&	--word 0x099
"0000"&	--word 0x09A
"0000"&	--word 0x09B
"0000"&	--word 0x09C
"0000"&	--word 0x09D
"0000"&	--word 0x09E
"0000"&	--word 0x09F
"1011"&	--word 0x0A0
"0100"&	--word 0x0A1
"1111"&	--word 0x0A2
"0000"&	--word 0x0A3
"0000"&	--word 0x0A4
"0000"&	--word 0x0A5
"0000"&	--word 0x0A6
"0000"&	--word 0x0A7
"0000"&	--word 0x0A8
"0000"&	--word 0x0A9
"0100"&	--word 0x0AA
"0000"&	--word 0x0AB
"0000"&	--word 0x0AC
"0000"&	--word 0x0AD
"0000"&	--word 0x0AE
"0000"&	--word 0x0AF
"1001"&	--word 0x0B0
"0111"&	--word 0x0B1
"1111"&	--word 0x0B2
"0000"&	--word 0x0B3
"0000"&	--word 0x0B4
"0000"&	--word 0x0B5
"0000"&	--word 0x0B6
"0000"&	--word 0x0B7
"0000"&	--word 0x0B8
"0000"&	--word 0x0B9
"0000"&	--word 0x0BA
"0000"&	--word 0x0BB
"0000"&	--word 0x0BC
"0000"&	--word 0x0BD
"0000"&	--word 0x0BE
"0000"&	--word 0x0BF
"0000"&	--word 0x0C0
"0000"&	--word 0x0C1
"0000"&	--word 0x0C2
"0000"&	--word 0x0C3
"0000"&	--word 0x0C4
"0000"&	--word 0x0C5
"0000"&	--word 0x0C6
"0000"&	--word 0x0C7
"0000"&	--word 0x0C8
"0000"&	--word 0x0C9
"1100"&	--word 0x0CA
"0000"&	--word 0x0CB
"0000"&	--word 0x0CC
"0000"&	--word 0x0CD
"0000"&	--word 0x0CE
"0000"&	--word 0x0CF
"0000"&	--word 0x0D0
"0000"&	--word 0x0D1
"0000"&	--word 0x0D2
"0000"&	--word 0x0D3
"0000"&	--word 0x0D4
"0000"&	--word 0x0D5
"0000"&	--word 0x0D6
"0000"&	--word 0x0D7
"0000"&	--word 0x0D8
"0000"&	--word 0x0D9
"0000"&	--word 0x0DA
"0000"&	--word 0x0DB
"0000"&	--word 0x0DC
"0000"&	--word 0x0DD
"0000"&	--word 0x0DE
"0000"&	--word 0x0DF
"0000"&	--word 0x0E0
"0000"&	--word 0x0E1
"0000"&	--word 0x0E2
"0000"&	--word 0x0E3
"0000"&	--word 0x0E4
"0000"&	--word 0x0E5
"0000"&	--word 0x0E6
"0000"&	--word 0x0E7
"0000"&	--word 0x0E8
"0000"&	--word 0x0E9
"1000"&	--word 0x0EA
"0000"&	--word 0x0EB
"0000"&	--word 0x0EC
"0000"&	--word 0x0ED
"0000"&	--word 0x0EE
"0000"&	--word 0x0EF
"0101"&	--word 0x0F0
"0101"&	--word 0x0F1
"0101"&	--word 0x0F2
"0101"&	--word 0x0F3
"0101"&	--word 0x0F4
"0101"&	--word 0x0F5
"0011"&	--word 0x0F6
"0011"&	--word 0x0F7
"0111"&	--word 0x0F8
"0000"&	--word 0x0F9
"1000"&	--word 0x0FA
"0000"&	--word 0x0FB
"0000"&	--word 0x0FC
"0000"&	--word 0x0FD
"0000"&	--word 0x0FE
"0000"	--word 0x0FF
;







end libhmsys;

package body libhmsys is

end libhmsys;
