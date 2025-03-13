// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:39:28 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/rs3clone/RS3C1B201.gen/sources_1/ip/GAMEPROM_RAM/GAMEPROM_RAM_sim_netlist.v
// Design      : GAMEPROM_RAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "GAMEPROM_RAM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module GAMEPROM_RAM
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "55" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.54005 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "GAMEPROM_RAM.mem" *) 
  (* C_INIT_FILE_NAME = "GAMEPROM_RAM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  GAMEPROM_RAM_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
udNP8Uje7hpcvCYAXvDW9r2oHQyRipDN507b+1w27rP7xb4Nz9QLRyKQf6hKRcDEOVPPDU4KvXyQ
S7Bed2F6O4Ldaml88+U6QsrNFaZ4fNsTrKjEE3lLix8fjqIyUXKSNeepsabnRAwnPTjGP0ckeQ0z
/6vK6vS6Oh2J5EcQEag=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AJCFEJ1YmO8l6c55nmqjPHpq03iIwIWhcq4gzpGTG9q8+B6G84WceO3Y0MOwVkIC+rza8yWW4W96
aueSQ6zP9DeJpaQAa5CXah55dY7AxCSywtOyZ62CZYm1RxvTaNigNnppCye+yAHN5Qei2IV4ZMwt
hFhXp7bbKeSQsqyTcPao+XMOfUQgs6uHRQoMvRFgoHByuZ20V72oOw3MoBmzaFgyRicvku2AVEWd
uJDCqcRlHIZZ1c+O+dCjOvRg+9aaQ1DE8gyCtne0FhQEvVnAPjcTzeUg2I0bZrpUQbbS8p5716Jl
/R7teOvv2VpnKxyFvW5lTVImrqIsvdk38CH5aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d1PZzLTrVgGa7lAGrEOnBHSkyRph92ENzEYYfBv5ShW44EZ/4/Dy5IpHq0athhXF90+7+EiPDjze
BIUrzaCZjSn3hPfQYuPqbUjXLseT1xBYmtHZtyzpQYUr38hRTWh6IjNX2anC6vrScheJp7oDyY1/
IpdhxPVK/6z5GGw/+fk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iXAE+ZmeGhifmLMp5oEFkhP/d/cDFVKwwxydC1lMN6LBRLFXElE5VcBvIEPtGNusskpxv/GPCPge
Az6W1/YbULAD2vlMA71EljrnHet4zg4sh561cjLPQN2DUNHr/8qxlo4ONww5HrNW+aj3zt0V9iXd
LMCR8NG58iQqMP1t5ybi/4urLnu1EF4AFJP8eDrIn+UhiFljJ04qUkg6UteUS1Qbzshw6awFUiey
WBeovfV6FXCJKwHugmJ9lX0v8OpeazDBCdnLiduAGRdSYyvX8gZsv3vJDGtRy/jgipU3YvWtjuVV
YtKThRWW0HDHoUbtraCor3GB7nSBYetgLBhI2w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CCwrvinvzJ/ig55I5/d/Amnn8e78wAQQ3CZeQChsQV8lNb/2YZzJQqDeIZnIw2PW9XMMQWu1BZ8c
iNYcwzM1UFZoOaZeVnYUYwb2RIF29CtoBJrR/IdRvyNiLiX6yB25jHmLHr0ZI2+HcOU/DUGMCHdj
rXeeb/zWm2+BlGVXo8nZQsBLb7Ax2MZrkpa0MTARS71LcKF7w1t4GoY7bVE/6IqiapBrM+ZEG0G0
A/Ha5M7b0iGDPUjoi9W9dI+/QCxu2Jzm/2Lv/GivvO91GfWy+GtP+BOuITXoh1RMI1r+C0BVFEmZ
cJTPz6NO//KkkLFG9/hmPYFN1LfA2Ba990gqjw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UtpgxYdpPKuSNM+KxM6Sv3Iy4ZOFYPNHS2XNuKmMlCw2QC5U4+i3rdVze9p+UBDrx6Er9G9pm8c7
cuUkBFDSwAo1nmCsTUQkSQOtPXr5uH5HznaUeoa9jW2AL4fdOIyDGx9ybjy86RZqbLwFXSFl5h+u
N7pnU5jSiJzRe2r8HEgZz2gz/hfTN/jzQXetqGKueHxsQ3aoufearKsdAddLj5L+S7JaV0vI1A+I
C0NrqJNr80rSabETlIhyDi8M+O31ACijPvd5lxs/aM4t0hkDuJEjD/4zSMAR4kX6rFuoAaGj+gkL
JNO4LonSwyx9V/aLCUGZvakCGOoTfa8HsXALSg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bYpkb72jOpiSeCQ5PRip31Y2zumke9hnzyF2MW+IVzPW0m3jVUMoEwgSxAqE+vlQuzZiaESSLPa4
hEofuBzsD/1HhUexhJNB4Y+/VPBvwWtiuiJJBrLU2aBqlxKZznTLdxMXRPgndyi9c3Bm+BaDdRxt
QobwAkJhk6Cy+jZEy/kc8piXqUSO6chEDW5OWt1z8Yp5BR7KL5Wbm2MilK8JLKlm/z19oTOcUu4h
Zc/O6xJcNdqjekuqJ6hg7HEz9U1UKFQudRtsv7J0+tBPchAGiv5TypyI+/t+vNPdEWYYqMpLIvZN
cCSJD0PTRiRj5gWzhCtfKhiGSqaSGSjo2ySroQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
sHfsIbA/GTiYiIhFVT+ta4MYPEvZVn5bzP0L9SmLFYXxtXCWmeDpCp9ZZwtGS9IH6xlOR9TtFG5W
pgKkFb5r5QCZfajiTmrZfPjhvh247eO53zGpnNOd0OD8ieVYpE+zrABiidJQZIJKyypvLU+yKMcK
ieY1rJH9psSNTXb3F5RJBwS7BAIUABNBZQnGq7oy4LEOxgBNofWAIW356JOU+bZ9yTI94wEStpim
5BFs8fstAwWnwM6ZBxHDgmukn8PzlJVxzDFileHS+GIb5lPZJAMfhj/nCnvFAKrsVpYMjDZiwUXS
inHd4rP1QfU6bBAS5qhsBh1LbedSjDIbguzLNaMGqf3V74evgzM0Ps8jg9qHcPLyqUD36zjCw262
gOC0ofer0rkLqaM6oyYN9vLgtccUgx1yvJlD41DPYJxSSgHkRG/5QSwS1sPS1s3Akwg0CFWU6kDJ
IgTusnQGjwO0kd7isRhV5vbprQccIjmYDSkUVuuQ1QKIJdSZNgqBKujv

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ni0skYr41xEhGcERgtNsJJ63OdYzP9ki5X7c3IbnsFCvWxeRQKlubX6N8A/0jpNXOv7aZEKafLZ1
qwbSeUvbN5EGxOtmP500LKoc6ooFVOT30GABYPyplJZQKkOV1gCLsFgwAOvKXk0nzR3DidZfgNmV
WzVuzpauwrR4E5VbDQ5MRanHIv9fUJyWGO5b0vBraafqmyDaWmLnOjDZvy2FLKT8h/g+leYjmoOW
ZJ6PXCZ0Q4ga21Xt6erSGIYPOkEEG6WbpWPjflxT9mjFpLmFZ9GiIu/sAP35ujidUd4QOQ1OhsD2
xotuK4Bk3godsqXIIt4XQ32YzMS3QWkODMZ9tQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Vr9cGi332/lxwY+1s1c/q/QC1iXTtfGX0cX5Ee8iMu9RcXLuTLEJUJMfxD3nNqpTzZPP2uje9SLL
ag4NXGXSpax2KTl6n0ZR19GRYIQeoyuIEObQQuuUjIKIJWfhtOUJl3OTHWIfOKbakya+nCm5WfDr
xgAKiWZOPd4QTtzIfurdl1JtQQHX8Df2qJz7sQ85KbEnr9f0x0Z/P+vOiNCy0ZYtVnvaUhSssVFw
l2tWmTqvL+Cqw0ceq0VyZ+3vpLw66QGWxVHdhMsrsyfNGyr3ihgnG3a7Y1MCMfOZq/SVFUt69F0M
XHyhnqbPQtcHQDzO9skrKwKEzN4uFs0H5KYx8A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VzSc8XP1P8vnrcckgvVZGDZrGVT26w6xIjvo6a/h45CvlV+9LQYT27zdvXxkL5tmT5FePC9paUrR
foCdInU0kmlUZ759cK2VrUmeyxKT8HXWg6xlTw+mzpcVQ2L5RccoD+x7DUGD5oYrTIKMHhEjKj2t
V5hsm6x8SS58U2hgBj9Mrc9VsyQ5ckv5iHJPaptGNowNckVd/hBogWZomkIxlcUdE/M9DVvqxhVz
Tt6fy92B4AgzzJMfxezRMyx9/CEBICI15TibBxghqNpC23LHFun7+S3oDsoVwo9MdfJEo7qaiix2
uWtEvbP+An3VxhS+5G3uf+JyDLZlNZjjujiAuQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20864)
`pragma protect data_block
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
BLM=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
