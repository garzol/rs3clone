#LVCMOS33 version.

create_clock -period 20.000 -name SYSCLK -waveform {0.000 10.000} [get_ports SYSCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SYSCLK]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {IOx[0]}]

set_property PULLTYPE PULLUP [get_ports {IOx[7]}]
set_property PULLTYPE PULLUP [get_ports {IOx[6]}]
set_property PULLTYPE PULLUP [get_ports {IOx[5]}]
set_property PULLTYPE PULLUP [get_ports {IOx[4]}]
set_property PULLTYPE PULLUP [get_ports {IOx[3]}]
set_property PULLTYPE PULLUP [get_ports {IOx[2]}]
set_property PULLTYPE PULLUP [get_ports {IOx[1]}]
set_property PULLTYPE PULLUP [get_ports {IOx[0]}]

set_property PACKAGE_PIN L1 [get_ports {IOx[7]}]
set_property PACKAGE_PIN L2 [get_ports {IOx[6]}]
set_property PACKAGE_PIN L3 [get_ports {IOx[5]}]
set_property PACKAGE_PIN M1 [get_ports {IOx[4]}]
set_property PACKAGE_PIN M2 [get_ports {IOx[3]}]
set_property PACKAGE_PIN M3 [get_ports {IOx[2]}]
set_property PACKAGE_PIN M4 [get_ports {IOx[1]}]
set_property PACKAGE_PIN M5 [get_ports {IOx[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports DBS]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xi[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DB[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DB[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DB[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DB[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DA[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DA[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DA[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DA[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DO[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DO[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DO[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DO[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIA[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIA[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIA[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIA[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports VS0]
set_property IOSTANDARD LVCMOS33 [get_ports VS1]
set_property IOSTANDARD LVCMOS33 [get_ports VS2]
set_property IOSTANDARD LVCMOS33 [get_ports TXp]
set_property IOSTANDARD LVCMOS33 [get_ports RXp]
set_property PACKAGE_PIN H11 [get_ports OutSound]
set_property IOSTANDARD LVCMOS33 [get_ports OutSound]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]


set_property DRIVE 16 [get_ports {IOx[7]}]
set_property DRIVE 16 [get_ports {IOx[6]}]
set_property DRIVE 16 [get_ports {IOx[5]}]
set_property DRIVE 16 [get_ports {IOx[4]}]
set_property DRIVE 16 [get_ports {IOx[3]}]
set_property DRIVE 16 [get_ports {IOx[2]}]
set_property DRIVE 16 [get_ports {IOx[1]}]
set_property DRIVE 16 [get_ports {IOx[0]}]
set_property DRIVE 4 [get_ports {DB[4]}]
set_property DRIVE 4 [get_ports {DB[3]}]
set_property DRIVE 4 [get_ports {DB[2]}]
set_property DRIVE 4 [get_ports {DB[1]}]
set_property DRIVE 4 [get_ports {DA[4]}]
set_property DRIVE 4 [get_ports {DA[3]}]
set_property DRIVE 4 [get_ports {DA[2]}]
set_property DRIVE 4 [get_ports {DA[1]}]
set_property DRIVE 4 [get_ports VS2]
set_property DRIVE 4 [get_ports VS1]
set_property DRIVE 4 [get_ports VS0]
set_property DRIVE 4 [get_ports TXp]

#set_property SLEW SLOW [get_ports {IOx[7]}]
#set_property SLEW SLOW [get_ports {IOx[6]}]
#set_property SLEW SLOW [get_ports {IOx[5]}]
#set_property SLEW SLOW [get_ports {IOx[4]}]
#set_property SLEW SLOW [get_ports {IOx[3]}]
#set_property SLEW SLOW [get_ports {IOx[2]}]
#set_property SLEW SLOW [get_ports {IOx[1]}]
#set_property SLEW SLOW [get_ports {IOx[0]}]


set_property CFGBVS VCCO [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]


set_property BITSTREAM.CONFIG.CONFIGRATE 26 [current_design]

set_property BITSTREAM.CONFIG.USERID 32'h01BC3ACE [current_design]
set_property BITSTREAM.STARTUP.STARTUPCLK CCLK [current_design]


set_operating_conditions -heatsink none



set_property PACKAGE_PIN A13 [get_ports TXp]
set_property PACKAGE_PIN B3 [get_ports VS0]
set_property PACKAGE_PIN B6 [get_ports VS2]
set_property PACKAGE_PIN P13 [get_ports {Xi[0]}]
set_property PACKAGE_PIN H14 [get_ports DBS]
set_property PACKAGE_PIN M11 [get_ports {Xi[7]}]
set_property PACKAGE_PIN M12 [get_ports {Xi[6]}]
set_property PACKAGE_PIN N10 [get_ports {Xi[5]}]
set_property PACKAGE_PIN N11 [get_ports {Xi[4]}]
set_property PACKAGE_PIN P10 [get_ports {Xi[3]}]
set_property PACKAGE_PIN P11 [get_ports {Xi[2]}]
set_property PACKAGE_PIN P12 [get_ports {Xi[1]}]
set_property PACKAGE_PIN P3 [get_ports {DB[4]}]
set_property PACKAGE_PIN B2 [get_ports {DA[4]}]
set_property PACKAGE_PIN B1 [get_ports {DA[3]}]
set_property PACKAGE_PIN A4 [get_ports {DA[2]}]
set_property PACKAGE_PIN H4 [get_ports {DO[4]}]
set_property PACKAGE_PIN H1 [get_ports {DO[1]}]
set_property PACKAGE_PIN F11 [get_ports {DIA[4]}]
set_property PACKAGE_PIN F12 [get_ports {DIA[3]}]
set_property PACKAGE_PIN F14 [get_ports {DIA[1]}]
set_property PACKAGE_PIN F13 [get_ports {DIA[2]}]
set_property PACKAGE_PIN H3 [get_ports {DO[3]}]
set_property PACKAGE_PIN B5 [get_ports VS1]
set_property PACKAGE_PIN G4 [get_ports SYSCLK]
set_property PACKAGE_PIN H2 [get_ports {DO[2]}]
set_property PACKAGE_PIN P4 [get_ports {DB[3]}]
set_property PACKAGE_PIN A3 [get_ports {DA[1]}]
set_property PACKAGE_PIN C4 [get_ports {DB[1]}]
set_property PACKAGE_PIN C5 [get_ports {DB[2]}]
set_property PACKAGE_PIN A12 [get_ports RXp]


set_property PACKAGE_PIN C1 [get_ports OPTIN2_33]
set_property IOSTANDARD LVCMOS33 [get_ports OPTIN2_33]
set_property DRIVE 8 [get_ports OPTIN2_33]

set_property PACKAGE_PIN D1 [get_ports OPTIN3_33]
set_property IOSTANDARD LVCMOS33 [get_ports OPTIN3_33]
set_property DRIVE 8 [get_ports OPTIN3_33]


#pps4 clocks
set_property PACKAGE_PIN F2 [get_ports CK_A]
set_property IOSTANDARD LVCMOS33 [get_ports CK_A]
set_property PACKAGE_PIN F3 [get_ports nCK_B]
set_property IOSTANDARD LVCMOS33 [get_ports nCK_B]


#SPI
#set_property PACKAGE_PIN A8 [get_ports SCK_SPI]
#set_property IOSTANDARD LVCMOS33 [get_ports SCK_SPI]

set_property PACKAGE_PIN B11 [get_ports SI_IO0]
set_property IOSTANDARD LVCMOS33 [get_ports SI_IO0]
set_property PACKAGE_PIN C11 [get_ports nCS_SPI]
set_property IOSTANDARD LVCMOS33 [get_ports nCS_SPI]
set_property PACKAGE_PIN D10 [get_ports nWP_IO2]
set_property IOSTANDARD LVCMOS33 [get_ports nWP_IO2]
set_property PACKAGE_PIN C10 [get_ports nHOLD_IO3]
set_property IOSTANDARD LVCMOS33 [get_ports nHOLD_IO3]
set_property PACKAGE_PIN B12 [get_ports SO_IO1]
set_property IOSTANDARD LVCMOS33 [get_ports SO_IO1]
set_property PULLTYPE PULLUP [get_ports nCS_SPI]
set_property PULLTYPE PULLUP [get_ports nWP_IO2]
set_property PULLTYPE PULLUP [get_ports nHOLD_IO3]


#internal i2c
set_property PACKAGE_PIN B13 [get_ports SCL_INT]
set_property IOSTANDARD LVCMOS33 [get_ports SCL_INT]
set_property DRIVE 8 [get_ports SCL_INT]

set_property PACKAGE_PIN B14 [get_ports SDA_INT]
set_property IOSTANDARD LVCMOS33 [get_ports SDA_INT]
set_property DRIVE 8 [get_ports SDA_INT]


#external i2c
set_property PACKAGE_PIN C14 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property DRIVE 8 [get_ports SCL]

set_property PACKAGE_PIN C3 [get_ports SDA]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]
set_property DRIVE 8 [get_ports SDA]


#aka PG1
set_property PACKAGE_PIN E11 [get_ports RD_DS]
set_property IOSTANDARD LVCMOS33 [get_ports RD_DS]
set_property PULLTYPE PULLUP [get_ports RD_DS]

#aka PG2
set_property PACKAGE_PIN E12 [get_ports SW1]
set_property IOSTANDARD LVCMOS33 [get_ports SW1]
set_property PULLTYPE PULLUP [get_ports SW1]

#aka W-IO_33
set_property PACKAGE_PIN D14 [get_ports SW2]
set_property IOSTANDARD LVCMOS33 [get_ports SW2]
set_property PULLTYPE PULLUP [get_ports SW2]

set_property PACKAGE_PIN J3 [get_ports SelDir_B1]
set_property IOSTANDARD LVCMOS33 [get_ports SelDir_B1]
set_property DRIVE 4 [get_ports SelDir_B1]
set_property PULLTYPE PULLUP [get_ports SelDir_B1]

set_property PACKAGE_PIN H12 [get_ports SelDir_B2]
set_property IOSTANDARD LVCMOS33 [get_ports SelDir_B2]
set_property DRIVE 4 [get_ports SelDir_B2]
set_property PULLTYPE PULLUP [get_ports SelDir_B2]


set_property PACKAGE_PIN A5 [get_ports Load_B1_0]
set_property PACKAGE_PIN A2 [get_ports Load_B1_1]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B1_0]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B1_1]
set_property DRIVE 4 [get_ports Load_B1_0]
set_property DRIVE 4 [get_ports Load_B1_1]
set_property PULLTYPE PULLUP [get_ports Load_B1_0]
set_property PULLTYPE PULLUP [get_ports Load_B1_1]


set_property PACKAGE_PIN J1 [get_ports Load_B2_0]
set_property PACKAGE_PIN J4 [get_ports Load_B2_1]
set_property PACKAGE_PIN J2 [get_ports Load_B3_AB]
set_property PACKAGE_PIN K4 [get_ports Load_B3_CD]
set_property PACKAGE_PIN K3 [get_ports Load_B3_EF]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B2_0]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B2_1]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B3_AB]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B3_CD]
set_property IOSTANDARD LVCMOS33 [get_ports Load_B3_EF]

#set_property DRIVE 4 [get_ports Load_B2_0]
#set_property DRIVE 4 [get_ports Load_B2_1]
#set_property DRIVE 4 [get_ports Load_B3_AB]
#set_property DRIVE 4 [get_ports Load_B3_CD]
#set_property DRIVE 4 [get_ports Load_B3_EF]
set_property PULLTYPE PULLDOWN [get_ports Load_B2_0]
set_property PULLTYPE PULLDOWN [get_ports Load_B2_1]
set_property PULLTYPE PULLDOWN [get_ports Load_B3_AB]
set_property PULLTYPE PULLDOWN [get_ports Load_B3_CD]
set_property PULLTYPE PULLDOWN [get_ports Load_B3_EF]

#set_property SLEW FAST [get_ports Load_B2_0]
#set_property SLEW FAST [get_ports Load_B2_1]
#set_property SLEW FAST [get_ports Load_B3_AB]
#set_property SLEW FAST [get_ports Load_B3_CD]
#set_property SLEW FAST [get_ports Load_B3_EF]

set_property PULLTYPE PULLUP [get_ports SCL]
set_property PULLTYPE PULLUP [get_ports SDA]

set_property PULLTYPE PULLUP [get_ports SCL_INT]
set_property PULLTYPE PULLUP [get_ports SDA_INT]


set_property PULLTYPE PULLUP [get_ports {DIA[4]}]
set_property PULLTYPE PULLUP [get_ports {DIA[3]}]
set_property PULLTYPE PULLUP [get_ports {DIA[2]}]
set_property PULLTYPE PULLUP [get_ports {DIA[1]}]

#set_property OFFCHIP_TERM NONE [get_ports DBS]
#set_property OFFCHIP_TERM NONE [get_ports OutSound]
#set_property OFFCHIP_TERM NONE [get_ports DO[4]]
#set_property OFFCHIP_TERM NONE [get_ports DO[3]]
#set_property OFFCHIP_TERM NONE [get_ports DO[2]]
#set_property OFFCHIP_TERM NONE [get_ports DO[1]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[7]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[6]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[5]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[4]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[3]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[2]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[1]]
#set_property OFFCHIP_TERM NONE [get_ports Xi[0]]


set_property PACKAGE_PIN D13 [get_ports nOEIOs]
set_property IOSTANDARD LVCMOS33 [get_ports nOEIOs]
set_property PULLTYPE PULLUP [get_ports nOEIOs]



set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]


set_property BITSTREAM.CONFIG.DONEPIN PULLUP [current_design]

