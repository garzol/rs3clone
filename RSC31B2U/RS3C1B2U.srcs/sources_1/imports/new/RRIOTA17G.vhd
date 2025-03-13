----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 16:22:08
-- Design Name: 
-- Module Name: RRIOTA17G - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created from A1762plus project
--                 by copy pasting the file contents
--                 that is a bit savage, but well
--                 this is the only way i found
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

use work.libpps4.all;


entity RRIOTA17G is
    Generic (
           --here are registered default values!
           --applied values to be reffered in the component itself
           --config for A1752:
           --g_RAMSEL = '0'; g_RAMAB8 = '0'; g_ROMSEL = '0'; g_IODEVNUM = "01"
           --config for A1753:
           --g_RAMSEL = '0'; g_RAMAB8 = '1'; g_ROMSEL = '1'; g_IODEVNUM = "10"
           g_IODEVNUM  : std_logic_vector(1 downto 0) := "10";
           g_RAMSEL    : std_logic := '0';
           g_RAMAB8    : std_logic := '0';
           g_ROMSEL    : std_logic := '0';
           --g_ref       : natural   := 16#52CF#
           g_ref       : natural   := 16#52EF#
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
           
           r_device         : in     std_logic_vector(1  downto 0);   -- game=00, A1762=01

           -- makes the courroie de transmission between i2C module and nvram owner                  
           en8              : in        std_logic;
           we8              : in        STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr8            : in        std_logic_vector(10 downto 0);                   
           dout8            : out       std_logic_vector(7  downto 0);   
           din8             : in        std_logic_vector(7  downto 0)
           );
	end RRIOTA17G;

architecture Behavioral of RRIOTA17G is

component ramctrl
    Port (
           hiclk       : in       STD_LOGIC;
           spo         : in       STD_LOGIC;
           pps4_phi    : in       pps4_ph_type;        
           rrsel       : in       std_logic;
           ab          : in       STD_LOGIC_VECTOR (8 downto 1);
           din         : in       STD_LOGIC_VECTOR (8 downto 1);
           dout        : out      STD_LOGIC_VECTOR (8 downto 1);
           wio         : in       STD_LOGIC;
           cs          : in       std_logic_vector(1 downto 0)
          );
end component;

component romctrlg
    Generic (
           g_ref       : natural
            );
    Port (
           hiclk            : in       STD_LOGIC;
           spo              : in       STD_LOGIC;
           pps4_phi         : in       pps4_ph_type;        
           rrsel            : in       std_logic;
           ab               : in       STD_LOGIC_VECTOR (11 downto 1);
           dout             : out      STD_LOGIC_VECTOR (8 downto 1);
           cs               : in       std_logic;
           
           r_device         : in       std_logic_vector(1 downto 0);   -- game=00, A1762=01

           -- makes the courroie de transmission between i2C module and nvram owner                  
           en8              : in        std_logic;
           we8              : in        STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr8            : in        std_logic_vector(10 downto 0);                   
           dout8            : out       std_logic_vector(7  downto 0);   
           din8             : in        std_logic_vector(7  downto 0)
           );
end component;

component ioctrl
    Generic (
           g_iodevnum    : std_logic_vector(1 downto 0)
            );
    Port (
           hiclk       : in       STD_LOGIC;
           spo         : in       STD_LOGIC;
           pps4_phi    : in       pps4_ph_type;        
           ab          : in       STD_LOGIC_VECTOR (11 downto 1);
           din         : in       STD_LOGIC_VECTOR (8 downto 1);
           dout        : out      STD_LOGIC_VECTOR (8 downto 1);
           wio         : in       STD_LOGIC;
           seldir      : out      STD_LOGIC;
           inpx        : in       std_logic_vector(15 downto 0);
           outx        : out      std_logic_vector(15 downto 0)

          );
end component;

signal dout_ram        : std_logic_vector(8 downto 1) := (others=>'Z');
signal dout_rom        : std_logic_vector(8 downto 1) := (others=>'Z');
signal dout_iox        : std_logic_vector(8 downto 1) := (others=>'Z');

begin

    dout(4 downto 1) <= dout_rom(4 downto 1) when dout_rom(4 downto 1) /= "ZZZZ" else
                        dout_ram(4 downto 1) when dout_ram(4 downto 1) /= "ZZZZ" else
                        dout_iox(4 downto 1) when dout_iox(4 downto 1) /= "ZZZZ" else
                        "ZZZZ";
                        
    dout(8 downto 5) <= dout_rom(8 downto 5) when dout_rom(8 downto 5) /= "ZZZZ" else
                        dout_ram(8 downto 5) when dout_ram(8 downto 5) /= "ZZZZ" else
                        dout_iox(8 downto 5) when dout_iox(8 downto 5) /= "ZZZZ" else
                        "ZZZZ";
                        
                        
    RRIOT_RAM  : ramctrl port map ( hiclk     => hiclk,
                                    spo       => spo,
                                    pps4_phi  => pps4_phi,
                                    rrsel     => rrsel,
                                    ab        => ab(8 downto 1),
                                    din       => din,
                                    dout      => dout_ram,
                                    wio       => wio,
                                    cs        => g_RAMSEL&g_RAMAB8);

    RRIOT_ROM :  romctrlg generic map (
                                   g_ref     => g_ref
                                    )
                         port map( hiclk     => hiclk,
                                   spo       => spo,
                                   pps4_phi  => pps4_phi,
                                   rrsel     => rrsel,
                                   ab        => ab,
                                   dout      => dout_rom,
                                   cs        => g_ROMSEL,

                                   r_device  => r_device,
                                   
                                   -- makes the courroie de transmission between i2C module and nvram owner                  
                                   en8              => en8,
                                   we8              => we8,
                                   addr8            => addr8,                   
                                   dout8            => dout8,   
                                   din8             => din8           
                                   );

    RRIOT_IOX :  ioctrl generic map (
                                   g_iodevnum=> g_IODEVNUM
                                    )
                         port map( hiclk     => hiclk,
                                   spo       => spo,
                                   pps4_phi  => pps4_phi,
                                   ab        => ab,
                                   din       => din,
                                   dout      => dout_iox,
                                   wio       => wio,
                                   seldir    => seliodir,
                                   inpx      => inpx,
                                   outx      => outx);

                                   
                                   
end Behavioral;
