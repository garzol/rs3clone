----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.11.2023 23:38:55
-- Design Name: 
-- Module Name: libfram - package
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


package libfram is

-- IIC generic constants for the platform RSC3V1B
constant cslavec80id : std_logic_vector(6 downto 0) := "1010000";

-- IIC driver commands
constant cFramNop       : std_logic_vector(2 downto 0) := "000";
constant cFramBufRead   : std_logic_vector(2 downto 0) := "001";
constant cFramBufWrite  : std_logic_vector(2 downto 0) := "010";
constant cFramReset     : std_logic_vector(2 downto 0) := "111";
constant cFramRead      : std_logic_vector(2 downto 0) := "101";
constant cFramWrite     : std_logic_vector(2 downto 0) := "110";

-- mapping of config zone (specified in byte count from base address (not in nibble count!)
constant cSCFmtAdd0      : std_logic_vector(6 downto 0) := "0000000";
constant cSCFmtAdd1      : std_logic_vector(6 downto 0) := "0000001";
constant cSCFmtAdd2      : std_logic_vector(6 downto 0) := "0000010";
constant cSCNVRModeAdd   : std_logic_vector(6 downto 0) := "0000011";
constant cSCSet1Add      : std_logic_vector(6 downto 0) := "0000100";
constant cSCGameAdd      : std_logic_vector(6 downto 0) := "0001000"; --length 6 nibbles
constant cSCFltchGCtlAdd : std_logic_vector(6 downto 0) := "0010000"; --length 4 nibbles
--cSCFltchGLivAdd is written internally by system. Writing here by uart =>will be overwritten
constant cSCFltchGLivAdd : std_logic_vector(6 downto 0) := "0011000"; --length 4 nibbles
--Idem for A1762 contents...
constant cSCFltchRCtlAdd : std_logic_vector(6 downto 0) := "0100000"; --length 4 nibbles
--cSCFltchGLivAdd is written internally by system. Writing here by uart =>will be overwritten
constant cSCFltchRLivAdd : std_logic_vector(6 downto 0) := "0101000"; --length 4 nibbles

-- mapping of iic device
--1/ nvrams
--for r_device="000" sys config
constant cIICConfgBase   : unsigned(15 downto 0) := X"0000";  --128 bytes
--for r_device="001" 
constant cIICHmsysBase   : unsigned(15 downto 0) := X"0080";  --128 bytes
--for r_device="010"
constant cIICMnprnBase   : unsigned(15 downto 0) := X"0100";  --128 bytes
--2/ game prom and sys rom (A1762)
--for r_device="100"
constant cIICGameRBase   : unsigned(15 downto 0) := X"0400";  --256bytes (used for wifi exchange) 
constant cIICGameRSOSBase: unsigned(15 downto 0) := X"0800";  --256bytes (used for storing initial ram coe file)
                                                              --Because we don't know how to restore bram area once it has been modified
                                                              --(i.e. to the coe contents. RST signals don't look to work)
--for r_device="101"
constant cIICA1762Base   : unsigned(15 downto 0) := X"0C00";  --1KB
constant cIICA1762SOSBase: unsigned(15 downto 0) := X"1000";  --1KBbytes (used for storing initial A1762 ram coe file)
                                                              --Because we don't know how to restore bram area once it has been modified
                                                              --(i.e. to the coe contents. RST signals don't look to work)


constant cSCFmtData0     : std_logic_vector(7 downto 0) := X"AA";
constant cSCFmtData1     : std_logic_vector(7 downto 0) := X"55";
constant cSCFmtData2     : std_logic_vector(7 downto 0) := X"C3";

--possible values of byte in cSCNVRModeAdd
constant cSCFactoryReset : std_logic_vector(7 downto 0) := X"FF";
constant cSCSRCMiniPrn   : std_logic_vector(7 downto 0) := X"01";
constant cSCSRCVirtHM65  : std_logic_vector(7 downto 0) := X"02";

--meaning of settings byte in cSCSet1Add. mask bit per bit:
-- this bit set to 1 for physically block outpout B1 ios (useful to deactivate ext miniprinter or block coin rejector)
-- initialized to 0: rejector active
constant cSCB1ExtOut     : std_logic_vector(7 downto 0) := "00000001";
constant ciSCB1ExtOut    : natural range 0 to 7 := 0;
-- this bit set to 1 for ignoring coil selftest result for CC and OC
-- initialized to 0: test result will be exploited 
constant cSCB1SkipOCC    : std_logic_vector(7 downto 0) := "00000010";
constant ciSCB1SkipOCC   : natural range 0 to 7 := 1;
-- this bit set to 1 for inverting signal DIA. To be able to test without mux board connected
-- initialized to 0: test result will be exploited 
constant cSCB1InvDIA     : std_logic_vector(7 downto 0) := "00000100";
constant ciSCB1InvDIA    : natural range 0 to 7 := 2;
-- this bit set to 1 for unprotecting coil outputs.
-- initialized to 0: coil outputs are protected
constant cSCB1PrtgCoil   : std_logic_vector(7 downto 0) := "00000100";
constant ciSCB1PrtgCoil  : natural range 0 to 7 := 3;


end libfram;

package body libfram is

end libfram;