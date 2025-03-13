// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:06:42 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/GAMEPROM_CR/GAMEPROM_CR_sim_netlist.v
// Design      : GAMEPROM_CR
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "GAMEPROM_CR,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module GAMEPROM_CR
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]douta;
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
  (* C_DEFAULT_DATA = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3768 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
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
  (* C_INIT_FILE = "GAMEPROM_CR.mem" *) 
  (* C_INIT_FILE_NAME = "GAMEPROM_CR.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
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
  (* C_USE_DEFAULT_DATA = "0" *) 
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
  GAMEPROM_CR_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
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
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19888)
`pragma protect data_block
XsJCdo4E8aVZRlkssE/0nNt+CjKu6ESKKifod7IRTpNvD66iOAigr4Vk2F7+PtoFpQEMtuPhfqW4
lwYiSfIgCU1GkosBDLDhbxPYI/z14EdxwqTyNVxdy8qeIU0t8bBOTvdfS+uNdzT+izqcDVRWKbWY
3OCifp9+yOvxtyjZ7DViN2lDY1ceq3z+VPgv86Gi3uzKgUM4q7hZVPe0tf1HR3cH2I/D89idzmYf
hwCJ9eXH8bTqFO6sY513bUjqn89D4CUtPVupTvUbgnijcnS9oCyJ+xGw5tdjn1ufspajuOLrhhyx
J7ggvhFXrhAqd9LCpyLiJbx2O/WdGVcU+FbX7BngT7bvAp/fUHm8uq6+8bfefysWlU5yDdU4HKDg
t2bI3a0S+1WvS4Jtcg8vXAv7a0jidyR91zNYIrObtCMdZmpxzc1p0ugauycLVMH1Yy5amQPw+04L
OZvLPKCasxcNFs64f58mgjSL26loaXdej+7TiDXEaaMO9WmG0W8FR8WMtQ8d4W8Wbz2qE7jA8Bsg
a0Ow86AXdAHcwrFcHg7qIty5O4r2mPJJVGYn0lk+6GRDyoYef1rosmM5VelRUiNzRWUQqoB9cuMK
5R4JXl3qlWOA41UbhY6xaR6kyYZw1DkD45FI+EOWFHY12rhyMxntNiKZNiUVVKf/HVBzOWWGAoFD
JckEMBIwhVoxfLd6R/eAHFi8VHMLRqeU3yhR5Yhij8hSD+f9ndT6k9KTOX1+Bzwbck7dSIgOlFe7
DpMXuwwNVoO/pq/sbqC+hFMLa6SpwsEVmpmKJAw7JirnIHeenBNpbc1ue7vNGpAhoeuKGu+EpcWn
0QNa+i6IwmTbHluFpZfdsWt3Xt5Z7q7+IBeASaMB7kpnOdR4iLef9pNwFyzpthyp2eqFLww7k8nq
/+Ak31r+CgrfX+cReP048gOJH/c/9V6D+6e+Iy2/RkOgyjJKpsCA251pWCuGNcwKQRr5lRZMRTEK
1BnLc6Q6PrNQy0iIUT+YoGXZ/9+tZOOaXghul/GcF+9SR8jdwKo9FfgPTngLaA4mkPmkf515UW1P
P2hif35O9HRV/MlNXxwFY8S7FfE3dJMQEFQfV4pexSx9I3Gjr2IZnTF6BB6MXsRI/dD5pqpPgwRB
I5Wie6e5A5pJPlFJQSwV4J7cUd8ELppj9r+Id013MNxz25njU7PCZaB4zxNZHTHPBKGVxU7ffZkK
ZbHbMIqb+pB8S5pkG8NyFBjglSiySZO/g0lcjAFavr7ilV7j+JJKbU5lj/f93LcZqvZoGO0haHWD
acM9WOL4CUVuf1kjq9rUB50CdwxqKkticu3NZjWsUKGvMqxl7oHrDipEOQ7r4t6rrM2MgzGPs40R
0o0VPqkEpATR2JnNKtXlp4hnDfjlpotbSqotH0XdFzkNDMmSqVvVoCBpyLfE7fuu1tRb62cBz12D
frJfQeeJyFtAMEMuNpw7kq9FJFZ/iWVfbgSYO6FApfHWLUBVZT6+0SYvRmx5anhIsLmoLYY4YKhu
JEiZpED8NEjR8fJ16SaQA52chHdQL69E5rm112awqJMpLMoz97SleAW6DmYKm3kJUXYT/V2r6w0X
MoajkwU/4iGDnGE5KklEZlXdMTgea3IbX4Lf1A8RV5wdqzkDc1Nc9cv5KrkvTa8KdotX+5/khxtU
B5Jjewl0BE2cn8qxbP4zKPLSS5BPDzwzADRylbYX/Z3Q46B2mZWmZLZQfAhQSKCAtSBRZfpk3P09
K84euNK8dUyUEobTP2FGcU+kr5Q7YRm4JmLRNujy71K/qIvy3NgKOeFX8U54ibbBV1i1+9dLpWxm
BmEHo/4XprPNsQMkAwbDbATRlju3wJ4vYhfDxErga00Er93yxwkPXAW436cReqfG6n5Jhxdn4no9
r4vvcAEN5KJ0v4FkBofCxFfnLh7fFgFyvrR326Mq+1lYX7461y2iyanyuQg9BrhYLk+c2HztoIS4
BOd0S2mXP2mskkSGsBfkMMBw5xNMGG2hl9YI/npUS58Y1nErWebSYOpMea8M2XJpYrsFd7jmYUUW
0zuHPcW1jk8Z8MZ4OwHjoUXKUHu229pwfHg0ZVUEUKnCErCH4IeycVJU0ILUledV1zBusSnwQKmD
dSxIGVx1acCrUTFizb57gNVS66afG6w/PX2EvI4dvEvCQyN5QoZAf9CqUyIb56q21RMN4SU0w9Iy
BuE9Miye6XY6NRgMz1yJlGx/uI6GZ9l2/Akj6+ljPgLkerT4PJtbdZZI5fDVJ2XM2kmGrf+WO8Zd
0EsiqUmU4ra5KD6fC7m5d/DtteCdY+JP7OojotVZdTWVH2zKtOzb+51OINbTRykZFnG5b0PwuD2X
3MD3wTTUq+iBxncTffFirGTWdaMJBP3YiOB5SBQGyQie8KGrzkPBaVO5xd8Z1zqt/l05X5IkGtYP
Cx3ItM6SIGsRgGm/lLdjEQ8tHiltXIeqy+cxBq74vyrXkGJ0ixxe8XuYswIzWprKfl+0Y2l7J8Hz
VBpjMI8ikaFUDVfu5CtBtrXNDlu5c2DsbkaAw46JZtQ64ZIgUvtkYzOvl6uUa+kJ9qEMM6yuvOoH
CoyuvG+XRDPcqzp7QRwEL1pfeCZOZTwOQj+hlW81BVecT0wnrU8WLs9o+J4c1YX8zTe0uZFBmevj
sloXBNhyuaGD76N+Sz7E1+fmTquPp0VJoUk4PGmS/9zlaHiP/WHgacSDzMpsrGtDl/eOjZPX5zk3
eLwoGys/rpQdzmCwJ8SvFZVp2YcVH/G+ghByBx0rXiEo1QXOp0xjcUosS/YKRvJlVLVXh2+7exZQ
fcRvEZWqxhfoJrSO6kABP9yv0GyhvAqm23a1EhQ5pUI93DfHe927mZ3Fea4bwfrFUS0BNmOYw2uE
2VfduSvs8iiWDL5IyZ45Ue2b+wn6AdQ+GIR839r8APuyRVLjz8Sj9GUWK1X4+ZF6ptXhFCcsaV+X
B2Z4nFDS/4lPawH+FS3u4ut9s4PO/+uhKfo3cNRPRvcGuqmMhpRb6nSMwhBSyncIid4IJu/BsE3j
GsKtxAspw/cgYWSXTrCfbfBqbVqzagJsvCOtwsykLjmr25rvLltsK3kQgTJMMrQKoRaTjRuqL+Ak
65l3OUyZAX0d/1PokP9QbECh7fFVEI7jFJt0o29rjhO+c0VY5EtvQnFANd3ObAhiQmZ35CXmdNRU
bbBvPnQ/d9zYDUoNMRsu2H/sJUDKUggUi9KQJ9w2fzvPuF43KBPLK4JpTvYpaPI6DZ5csyxQqHHf
2/U7U10FzwFDAxTYtAh9gCE+Zhv2yu9wD9uleE+UpPe8hFs64DmGsMuJrhMpnb43tWiXDnKXUH/h
fnPBVDcntr5eykoDjakTOBl0Eu9FI3d5ENTcjBsNIe1YTgwggawliSVZvCBV7cqRpZe1PB49Hb1L
T6hVcE5mmyeBKUmPrmocbb2hw8mc5KHlJraWvEpUawKiS5zz6x65JAlxwe7HbIlnNP9OdTAXmy6y
hcaIulQgTyv6sY1ZtWen3S+DtlaYO3MWXWvkB9srrA15VJeFF5B1+aP/rHJyQ8vwKJdROTwls97H
zKvxeLwnJRImHJFyISErshIuynvcZxICmunzHscL2XCf4Wod3nYZ+pyRxBTvumMmz4DfgzTdIiCl
Ktjn5JOlrqR7wGuBW29yhBi7YoJjXUTKa9p0i6YVvyWMpmQ/J8TdmXfh0tp7GdwhP/GWhjU9/42x
OpNpqOLX1Tkyd2cz71R+XZAaRBG1B1yfs7Kr4WGuvOEXpdAuAJfR9VYPfr519aIEXN0bRZbaHNEq
P5/DZet0GsDgWpwSshByVd6zhYnJVZoy6sQICM7mQyYYBc49ebvmnTYb0SMTnotdMEE5JxrwzC32
PCEgAiOskoopA6oWCvHzt8bha3xcneCUxJwrqnFBPf3rNKPCDW2CnBRnHPA7CjzSq90ZNLMLM1rm
fVk7drcfD+vS/GpUaAdlKMZdobo7Sh0f876HGJdzdwTkfArJcfEdvdlb1gOrsOLpTm9Af7tuCm/y
HWeFU6SQdCdkuYsG8PCd/929ZH9gaNefwZ5lNNdjYXZ/ckLBA6SfaaXA2VGJ0QHtaaKYr3uUw+Ek
S915/wAWK4BOKq5dGlRocAeEzbpqVSsy1+HJVY8BlWu5PU5HN+kBxr4ClWVwzp2Br1Gln+mf/B6z
oNIJWmhuLkf4V8tz7fG9LeMZ6tmdO/WumWf/bGHcm12z5yRKhOJezTeJJq74HzP47/BYR9nJm3QY
Ahol6uI140DXN5ORl7s4251WnPs2KFkUx3cU17xVjPZPB5wI+V0IFkcBgorFUEg51qEWsaAGCUoj
fApTaCTRYGzxrcbqUptE1RZq5bNP41+udO47tu3l7NrilVSutN6myCXVQAjZ7I9Q1wZqkRdfLYW+
njfIVVetkm9faISdNHazFYneDuqa9s4OKz8Gi0X5btJ4jMN/OInc5xJ+AZUi8glrM9lrPhGO2WrO
83lt7ZaDI8lkRxiS+dLTl/2FsY7MOUrX+APSfNWC+B8hbPMIjro1gszBMJ94WQD8x+61A92/KztF
27WaxBnISx9VwCaf2oK2XDcRwYhqDzBPshr7qljPg3bjeUVUhFTrYFTB7Bc+bIKrwXaTQbXue9Rf
52WmyJhyrJ9IHezuLihM71R4i5ESkzjJXafG+Q7ArEH5wigDSq9obu6B7xcvee0y9DOeFecnUaO/
UJouexVA5eOYvXM4EoJ/TFK+ddE4ebfZEOvO73QcszMkE/DYMMOZgYvDPMaD49TxXKmrjSaguO8T
xItnTAz8q2mR9XcxUYe25CwrbqdsqI9mYIqMDTrZ6TxbccOygpcuG5SG4xmznuSStZ3roxH5pGxW
L0Bm5C8UjjQ1xckyPRgv+l4rSGuULYWlmJBNO442g/JDwzeP+BhrnPMGai/cm7S7SJO39WfGpyy1
QhTef7OPI5WdzpT++2jtjve/JPM1PdOirTu51MQaz43bNF16EYYD1XSaAP3Y9FqrE90AtNKrMC9C
6jRD1FU6+9U4eBV0rb/QrKtVo/E9dVX5DHJY+hPTGqKlzSCPVBQice5IdGEB0dVVNuwk0xyhLoK8
SlQ6/uBWh8gR0/sUB+2REut6KlWuJshAMMrwMbS2fALSvOG0I8Dvepj9q22ETxDuum6IRu9h/79A
hMG7O45+1neF065SJmcQYZFlcBqQoW0slNY2BOy8EZArDY/goNPnaJ88deHw/MWtWyomfoojoiRp
LfUJCjBUMTFMgY7nFBdAIZXru9pQ4F0K7Oywrfrq+aczckWy1O+xxfwtqZRlNEl6uaEl23GTvdZh
uakb9QnH93AKxhHdtDvI/gehO6MAwIdRCWzulkDc8vsOfwftR0QEnGe7fVfgCAIpxfwSxIiXE3lH
pUeFm5I/sUwYt4kNx6ChgmwPhMmFKhPNjZ0IHuF/Ls+7/klZJcO7xAxCAgur2Ny0bEc28j/GyC9Q
TkrJkJ8hnBSzbSfuRGkFytUiO/wAj0coKXqiZ1Faeau3ufd9TWPc8D44k70DIaUFJrstGQU3vAb4
iTwNsv1kxfB4m25C29DTAAhmc3vGqZZc5CKes1tQftirmHm9/+ueAY3l2DZJ1UvBZZQxHlQBZzCf
fOJvFO82PRs/wdeKoR+Yc++eLrC2LEquNtpC7E0n4dQCTEkg9XoPgizAwgFFZFnKTZbkHKamdxid
eBGw7VlIdEY03NAD6iFgQNkJqXbrzfR7jD8Wf49qdupEJT06tddf4FX6CTi0sPCs00rNappKx88b
Gg8inKjemzK++/TVMXZWZxjKp+XEE3BBIzf+/5PleuRHUTgygauM9aRD0qc+WOK5XymOpReaaJ1n
bJgkwZa7p15jxY2BPIgmuet8qPK6eL7/Ec1eL14QY+5rmayOnozSk18mSIIZ2J/0MlwNeOTuZKQu
YjpGPjD4OOLCP6Sgdv6a06kwma+8sub4JfAXSIVVt/6nawzIcRLmqkJo57SVfqrjZ29WfLceLwTC
L0AZi9nZjSRi4QUP3KFM6oj/RHXlwcbCs/Bh8RQUHmSl/DFL6Vd9k4UlcrSLvhf2RoeCl0JzZy/3
gp3ls8HAhPxxwqGSK7Qjtp2/liuJRo2XcZAttVEyOvB/OOnL9aoJFZ9mg3JE5PJ5CsrwAVPcARXX
vi2no9gS33o1WJlArVB4tK3tOyia2AmM3oZMnjnSJAGhCqPYTTL52xJE21Eq0rwI/uRGFDZYYXvT
fgdvhS4sPrkkZUtiyIuAUKxClSurpKT3Fxgda+QX79eFsiCgaLa3r7HRjrhosvkXz6qYpRIHLyaS
ifB03VAOrvHjJj2MpZLMX69Iku2wT65v+O68T7DmYdgqrAgUyaIWqfLGj2cf9XdzfS76AqrWuNRX
OZ+WJJOj3KZEsp7Tzml+cyOj0KxnKBj8HP0wuejelsOQanyM3owURDyl89LKvsYNy2rUut6gUfXj
uVM4rlKPaedXALWriRr8vqAjvjyAXIGuAYxI7fUcREXGh8xmd0uoKhs0Wq3utMsLOC/Oqoj8tTWg
q+m5YCM3EjibvHnfG4cqCgLgu2HlMtwloZqimoLgGtNGX1wJiehj4oQxB69IiE3W2g+Ong64WVNp
8Ba7aUGlOLBVHqFgYYe82BSm2IzahJPUGPu1qynZlFsAYE6DfnpSxyB+bt4xqsyrB8SDyla4suuH
j9FoYkDVVTMfKg1jKUvWl2fdKwS43f8u7brbOBYJdQrij7DR992mKLqNFSMJKQpipq8gF7pJ/Kuf
/bL5+s2xLiDlDPe1mYJLAwtg8FJ10lg5gFrXuiHErtZcdemktX52EAoejAORZIcUOO0+zifzap9y
lDXcfCPzVNLFIimfULEUSAdO9t6Ew6Daq6RMpv1cMGEMwdCG4S28v+tUtmrtYsvJGJQz7wnR2TJx
f5CU9Sy5tpCfDtVrpG6dALP0ji1NJzV+x8jvwL35GlxGkCSlsR5dKogh13FUQJVbtvGIxY5Odgew
k/Hwk2+WMCQyGR6qpowY6KbsQQ7xMTpvYu2BwrMYVhALHRwOJO5Rx1HSwDVa2WXWFmVjuuGfaRjC
sSHL1AWhSh+Smzw8AzNw5JXgdP+KYVN/J/SzLRTh/dta45cBWICz6G9DvRt+3V2MCTSU6+SGho4r
VNcr28IiF7RVF+cF+ThY71uxinpNwxhOSxZbCqJfPergCjW+8PaSEMVltO2ZNByY47MpC2zkr171
+DCOoNNs+wgzrxEaMWabaU4RdwxL/L8h+vGFs7I7sziOtHwnLu6LDRDy+ovH9MqZTXjujZpJ31ST
DjYw4YglvUvJUdyc/MymuHSa+FmnOp+HnJesovQBMh5AKyXoepuf3+PuzV4Qq4RmcEFm2z0S845I
aOhBU3Hu9n+rYCMGO6kYE0+LC0cbCBisXJNv1NlBELPGMnXQyZyAU4ulv2Nh0GyW+9HKOeBYa8/X
YZUNKKsBukijSvaAixhZF4spyd8t0TjEHkPxQB7Yc44Z9cRM7CVkEQJXpQneK3ZgEuQra1WB3RFH
XzIqP7Rcgmtg4lMn0nG/DMKU2tux6fW1qY+5oJz01NQJbN3bq21p80NJKxgHHNDRSNTSTgA37e2g
e+pBa/mTiHkCG9FkatPWxL43R2AoT9tzLMSln55fQtL0RtQS126gtAnJL/7NgSYt7kkCTwA6nNua
t9ygbUQSaFs6Qi7yI7uRHy9JsCg9wl0lV0hiWEIOB5YaXNvELxM+wVzzmeZzJk4J//A5hCHZ5Nfv
ewSTo6l8kyzypsmF/hW/wYoPMphqIru/mMlEd86Q0dz+uqXUVgrsIgicQuCZEKIyDFzGG7TZTFDD
Ef6hQzCd2h7RKs3+K9ruZaY9uxQ4yr/D9YbE0yDc4NU0Um81Km3BPMbDnKJCe4K7R9txTdMhZ5SJ
1ruTFC88E5ouhw+qt9Fy0MKS+6TfX7GenuVfofFTnnlCmNDBknMtkJ6wCSntk7XhWf5ETnb6qdDp
sceRbzAheqX57NHAqcFuGKOZF6iETNiBp/ZfDsNEvxup0htaEB7ORLhiP1TZ3oiNRk1OgFHlOfYs
EIoItyC48YcS1LXGonCb9y7aVBYwEKlKPPhT++uYZSnRVrNGiShazc02uO8W89JY6uRAiey6nWg+
G+mMzSBELkxX/E41DlpduDGz8rzmaCal0BHW2qeSheG1Ha6YAwsfdXTI4CNcH9HZxPJsB6Pn+2jk
ISue1Ht36kpX38wN6NvzVUNrxkm4z0PBRBlD59BThM/eheJK6Jh8gcEhhIkOAwHCMugjeE/WQYXy
/Dq0s6pPU5TtrioWkONId9c6oNaps3nAAlv/wg7yr/KyqCeLaHKt7RvwKO/p69dkdu2uPQGvhd0V
AjastEVL8etBsawiAs5KdMMpZOhgvhWhJm7uK8bRzSqehr6Nk6YIaxDGu8ikRqH4Q2dQcBZ64GvJ
c2YAQVNzziz6On7beZSvIrIQ7Ica4mTJx24iNl3Qfi7V/vd2hBCO+pTkyo9mwZnn0LVE1uF01My/
fR1+KlSjJQbygb+TtSLKVQorZbXlfnVcnf8RlccDj5td3h9rrZZSWz3e/uW8VPiQAdez+pNYJdjB
XwlczI+YrlB3JAzMXSdRFwCh+nYu2P0oCDQd61cFqAGZbzQkEN8w5SrJGgXuPMLiJQssnMykcbIx
7EayHAYEbgtjTE+VsCJTvPS46VjBVGDdlGPJhmJat8PH6CKrYI5sjSqjp9j0liDZgrwiKsMwLnaK
lAKCAsCpqnRFGTL+uUZQCuvdnRMGT6zsqITLmisESjEonxP3zyRi5HTlmwOsSlfrk0aGfa6kYo53
h6DTiWwF+4Ov8M7+yhj4n+GxYRJlxmdycLeiLHpa+SLzBdNU5rpZeTQI0xD9VSvXjGGx+r0N8vGS
kR7B12z/ISZmvy1FCEUZJsxRaPsSa+Mz3d4xszXkir8FUq9VeQm/a0P+IeGGqvk2iTjIdT1PTVDv
Z5oBWj/H19UVWpx4XdeS361jrGgfkmdZNoMVY3jtk/c52hY6p3L4QXUULcLXhhRNNbuKqGXRsxhK
CmoVYUF40lXOJlw1sQknQKIJNAIE5XzCwBVQyCJpk0hq28mY2xhqUBYWIfZm06XyMzwQqNP0X8A9
TN6KTXw3rCDOOSPTKxcF3UtQ3sNVQqKzgxHsi+SB08yc/2/hQFB7tviU7e88OAjgans9HEHzfiny
F0GXKVRejVrv3NIdVLYEIdNLRY+huzI4RdPAnHMNfBV4loy2qFf74r0Cw8wPtpbntpV4KMplKxDL
IREOgF8hxQkw1eLpnXo3ld5K7Ze5PzLohQ3SxOhKwZ8vQzPFuB45vGWGIqc4PzrF8WwvIbQbBj9w
MNxoE9m8F7WrFYIX2UWpOZaJDVSyr7IbZ1C0apF2PKxx1elXD6n6DkvOC1sJe6ENOGccZrWEhABl
Bf0oJd+qSB/WPDQ+zq+EvLJcu79wKkx5aTJUNIYTexMWQbp0RRQnTBGMBnPnxEGiwCLd9D7Zi3a6
u2dGNuI5FxfAaLk4SR/AmDhHZUru1cUITiD56ubr9KD56MrHH7JhQmmhWfgm5nHu8YNVI1lGxzRQ
CEUkZfa5Kp8jtXdfSvc24bde5MKYo4nw3Mp2Hzu+rnW4H14C1jar+VB8SiU1ri5N+zgCKbOsLzoh
32VoTR8GLdhLVj/8VvNOP2LcWruDG0H+SHEj2A9fzO0qIOIuW9mVObqcH9fAVnzxq+UiZA2bz3er
dAAsj5zGXWOEdhXRRZ5DhywWpRvYug63NR6o8UgGQZiCg9qoL6+yhv3XHSWdh73QvxpZR6Sg+/vJ
ut85bb85+BGlwUgtXllSd4xHzKrcY0sQN6REoyErPs/QVPUIvzqwKZHrqdPwcnKWbZeaGZVc8zPF
X+RBTK+poLQgw83xZHuaupZdvbAM1iYTZTOMfF+Kmd3zQ6weLE7JdiuJJFuI7HJq6P6slhSqkUfb
BlkrixWH2k9Eq/HpKaYOhmB5Xx1Xa1PvhDqlZhfHcV6/S+WoYLT4VoYf4TEonHdAsgpwXXunrFUt
NpBS6G4PcP42hhU5hzQp8y1SLRY4pPKafo7afRHa7L5c6nrOdt1qAdvJg3FA5nlf4+TP2DBzD1hP
Flw6OzvlIwFFAR1xYNgAbdKHl4H+FiH3vn1M1Q/DZFs/AdaIjvNbFcVq8eGyj4wjkERehMdwiNmM
+hYHc2Sx4UXi36ROKt6z2nWMv6LbAruOeHtnajMO3D0PGpinY8NndwQcm4x4XsydPSEjWa5tP4f4
WZZmuu/K3YLrkhmk2lXXzsKEQhfM79uTw+1piDK+okeDbcWJfT9xXKRYwgBTlHiiMkCItil6URDf
IlMDisNAeM0G8oo0WPJOMBe698wmhM9vmk+LXXMkOxMwxaIFqW9m0k7uxDlq3Fcs4CmbsiY3+URH
BAbIvl7r7r4W3xQbWw0xhdTvxrbqfj48tbACRwhqRqDiifaC1XPTB/pGrpyzKYnubrtKyINC2fMN
JQjymIyEIq3eIfXx9Jny5qxRF1fC2cCLqRTDemFbWn6O42CDcZ/VfFtwE5iGPj3O+pmowSAHaDSS
z49H46xMD6L2HGjo/LEcwbzoUxeq2HElL/li/42ZyYCMYJhkpzq+8zCbTsvIARh66ZfXhp13983V
SDc/96Ul9NMm9bP9iTlBBog3SXymtqww3HS184A1WCjwbLA3DnHLHEcof8PxK0FrNDm41tcOA0Y8
IihFOAYSGZtJ/FjpGq6jVjhNKIX6YvOCEaNHPp5HclBYWm0sceuqvnaweIorJyDSjCdb5JtQW2j1
+QbvktPGoIgYh5fqK/uGs1KJYR6GCD2tV/l7WblZFw47ZbHXbUqQpKkJivNg3a6r9xrqlwN8xQx3
0NiZxRa/D5KSPcNJG40fxKy5bVH8DlAKF8PkFkIAYz8LZeViSzRXpXOSbpNKQQrCtAWutMKPpnDs
QMCSSgG7/xd5j02mxIJPwhaSjjzIKatn64vF/TGnyHVztnVS24F3s7NsV5XRJFT6nWJtQXs64m1y
4sKjKPx6wrd/vSrf4SwZ41yRJyllsynXxmBHR2tCs6z9HoCubkKRnqFDeZ0JTjgu0clSgdNE2GCY
52tdM8/EIt8VXkhUfFwJx6MugM/A9KsI1Jrs7kFS4Ovn2a9WALopkfbqElYhYpF89WLYwHjrxeUm
vSvcnPv0P38vSUgovcw6RRpbKnB9dG0j77xW5NLAMH3z/PNrJp2fBSQ00928oogySYZKWc4yaTTr
hcz4Nqddq+Ohg9guWh/rWQTQKOx++Ec8ZGUdTscnIruH0cOhtj1MHDMoOPMPSMUz9NpTnqvCC5k4
vi0cC5e7WlIwSBh6vFdZaJ0eKIrW6phz99bvsBOkGjO1gYGeteBcca2Qr+nNH8sJJsLaRKXlDPFZ
9shouJQy6mTX9ZD2f/uDsScXzYD4JEX5CHbv8bh1VamTyIa+9z5tlCDrtMc0mo3+ryJTIwHfKjWM
bAm2/Jf8kHq2gNXbOPV9Opmzkne5cl/nF8tZqr1fqfTalGo0ol4WKR7L02zP2BwI0tehrpiNg4/g
R08T3dKUkyS4SrZJ1AXzknOZi9CN+TLloS9HFwNZYhSib5UyN58ts5qXbsn0aJPij1FSdgCzVOgf
4pVBvXBnBuLWevwpevgCgngdc7eTEQYig5xoEA58OxXgRhRW4GoTYlNFqBSxDQyBDl17DP5fozOv
r3hRw25pX98dV7+YRo9Eosejcd9RQp4xyaxM+kGypILENEtGVxK+X5Qz1GZxH6ZjSlOZ8ZYkiYUn
bgW/jBAzHodQ50p017hEBeUdPhgalxLQVV5cTzbKb+AAQLtZ9rEK5uxaTDSN2PAlBdulm0HSFZMs
QFeB+dDiUAB1wwFjAY1dswg7H1bW7vzQ7VpdywSf41N1UBQQGBzIKKBE4Xtrjj/HsKFEJxi5Yil4
NYDU4DcBpOdmfkq7zMU0oz69WAlsdRZopnWhjbUOwZRI+fMWWIpPKdhhlDzV8LSw15ggmzsy/mi5
IGkACT0LidCdLI5pDMCRjuXOQv1J/VrhWc7gn4r2xwjktHKMSFwwwWCt8frHU4mi6OK5EynnVGc6
RmmlnW69srhGIi8EFjC83VONvbT7J2p4Xv71m/QLLsBHD/pPezVm4LCjRLLx9sBqRcO4S4A/DNxG
mQocY2DPPI46slT3UJjUdwbELgAS7ZBkweDry7ueI8jzvxYytYdxLmpLm7M6AdIV/5lw0hSF1KYr
Iv3Q3dVRLTa9awpWWg2FvPBcbU94lP4W56rLUtH1cMy2ja644WcCyDidupcoShyb4DgnP+CJvFbN
8wHHWXT6+vEfXjx2xYGFnS/7rzROOZBAqXNzfCC3E3ZmfC5zAW6MXApMWHGHGncBcf1PQMoEQIxg
2uJWdke7vYho2GilZHKBXtREdI1Fw8Xl3X3DMpBe29fYG7oDFXTrI5rMhWj7qS7ZI2vA348+7nZM
Txu8FoDJ7BQ8bYBFSJq/kGzW2mvao12x8r+jdZLiXW0RrHZl0PI3BupBxW0PJNLB84mBM6xSiXtu
7F/6BrcwMOZA+YpDWKxwSLsulDtNB2PO5au0Z2XutYrXL3SQh+fRg6tVO1w1oqgmO5rmOwbwbfPe
TANDT/rFtBLG4L9UTXz9h0Cc42SqYrGyEyx/OjSmJH7I7ju5IUoi6cYyOBeY7WVHmuxwl3aqW/PH
Xyv7zWiUgyyKC+Rhfnz8EjXJZg2cud4NmvDJaWm24yQpOThpY1zuMsAIAvX+Lx/PDq51WBvxoMzu
Ebx88k7/p7z9BXh7kgSmfnxEeIUXOXNm1A31gSUaxZKJ3LZmJaG0fKFNUGqZCewWfGo+Uu8L0By6
8cMrwbOtbaUpoaZTsXVhorSAd6sXKcHFcPuUCyFg6jTa1/ih0dl7NErxD7+MmMXz/FGi44hhw6vI
9w1oFEQdAXpgRnfPmacCRU4ae+Ma+4BvUgQj/VjXZRnwnGr3svHhAj0GIe9E0YtwbNhE/jYcs+8P
T4wdsWA7nzstcEImZw25oVIHpiYLrtoQtgDLwUBUCWRRvPal+TrSdWzBA8GnXHpCY+II+5Fj5DkQ
Zh3D0266XsZlUoi2xsBU5q1Y/L7cWm962dAKdhbkXriOlfMrfZmzxCgAx2qq33brmEpBI28kJQEn
i1r4/tGJiOfej7sSgBw9cUJFp6iHYkHEMbwx4HCtR5UCjFzmBGpXZv40Ua+99/f3YJ2k54ZLJqtP
PNGV1Y7JCDoI1yIcUJFD8D4avJCQQ8Hr7Av32WM1a9WXj5gIYjbfEhM9J23dDVKbn4yuuwcHuLZq
RxVMUHs9HKkdHAjHNnF1m2qyZZGTJotH3huHXjIjHIwRzSZFFgp+2kXT4nc/LswuDqqS4TTWyu7j
MMplaQXr37GJyJWkw6Tx/33Mf+tUDh1Q04zfmSgkLhuRQuKiHAUBl8KqngXuZ5yV4Ej2JNUAt9oe
G9x1IjHMq4yyi0acp+LlDBWOCCdL+2qFel7GK1Lk+Pw5C3qpymo2lV5UUV5aImOGBGJA+yugCozr
RSMw1fVD7h5i1wclm10L3w7RuHNNoJBm8gdq/sBy1i+vxfX8JSK1/AgEjH30XXw8rm0hGjJV8/Bx
2hiXO+D5v0D5Kmhax1xFsIjEyL0nTDcfTp387lvLERjjdBAc1Bm9udMZ0DXK3LzkTDBF1MYDoWx2
qYrLl1/80L0Qfbl9lxpv/3jM/Qv96HC0S0cvsgLvWimEAdGH/QbfcFN+HR27zfzgn/VaWmjvPnNo
SpVPWJI32mzqlRylmtQpFINfu136uv6ZB+qD7JWeYpcBh1PUSpuvDwcij6U+37DYNLpHmnqBkY7P
xNMAx35aey4pVANbiv45HGfuf8PB86EgNWJNE9jBE/Dy3DpAAqcYh8h7RglwLYujC/1yqKn1dUe2
YcGFieZoTRuSwsylZMzUozBHY2apeZKkcJQcbBmODyMIeEA03lphrSn0ZY902EqdXZlUwx6mdb9F
dAFI/FN5aclWtIYE9KhgiuuERnYV1vRWELrPmsKvH8hfNx69RkZU0s+oNY/xRnDUsKdZVjTSIoeK
94Ssch/5NslB4ElbZ0vdkXxrimpW3tzgDJyo70S5C5Pqy4T4hIM3ygPNrP+Oe6bo8zUyPyR958rl
KVobLKvN5EnqoA7LHdHt57JwN3msEP/4pnwt/L5MJS7T6J7CmPiTFcM8thfWKRu55Ldbl6ySl//L
UviF0eg2bKpexJ+Q7OUAHxslPfmMdXnXkBWVb6EIuw0Wq/MD5nntxp5qI82GQ5xVhyfiUBbfZUB3
v6J+bSFkXP1eYetL/+8+zv9ZcK79UvBYhW2rRUo8TNwKbKuyMeO947U7GNl1thnH34CWv7krbfRO
HK1reei34v6MOilukxRZJ7yiNKU+eLcpZGTYsOLzyy131wYgeytK/oK0ga4oP7jLGOCSmSbOceRG
8xMcT2ky2q0pN5u4Tki4Wsf0MyfA1E4sP5yxwGGq3JfmuazaNac18vdstpoOyNXwNRkSfdW413Sz
YmGBVLfuF483rX29kRT6pK0pJ2cy5/6YmfknoNouuIHGZziQ78CPhPVa/+vdTXnTMSe2oUtFcwxN
kFFFvCsjf7KwK2U7aHjlY/NJNVCpHsW5kdaaQZrI2dpCujIKOWiF6naTxqmRrsTIuQQ+hYKMLf0c
IDxvUXq9MMegpVkHiM5y9MYb8ysXBY0D38Pt2BIE8kiXvGPvEWUuooka6N4KL+VnrKURI81FMKSI
KgX2LKjVOufa6oHw4hMRQ+ZHwN/GrfeAClZi81Fc0PMdW/SScJflhbhQJs6J+mYjZlmUYSSJRk7n
n/stx92/n+t3GHmIFzUzJQlCS3K2hwydf76r6W0UdFmgjEjam+5tE7Sf/G+OtLQ3LjZp0Hhil/Rn
7EV12WYP9TBdmM5MZQrbQ/bnmnXqr/9VWicJM69qWbKGT4JLiDjQU4T33b32QMHZDlzyBO0SOo1J
7sIiGUvDGbUSzF33EYlo8AggWJ0kmSm+v2K/kpUv/a5LyHYTXFC3ha7L0SZr2J2PDFRaR1a2L/Xi
rKStE11OSBCgpP3ShHJ1bOAC9KWNqPfe/HOasSW8Mvbi4fXe31GeqDPzUejrXCdd56V9Ys4vFtxh
3ep7V4Jr+Sqptub6zOAuwxXfYm5KgZBJXuVgqipyKdZf29oddeVDG0YKqdxCiGlirYdGLcZo5oF4
5Aj9ZC+g7titrDYzWlKFIlGV0GbZFAyXqu1ljma+bfu0p4P9yR+hR18H4h44zI9baE/XMJaNh8bJ
hvKnvtH7dDVtCCl0KuMZOsBS3v/bY9tIpQ1t4f0DwpjncQni9v3cBMg1dSQOUI9IKUC0UdvZhz08
xot84Oo6psWmAW24634oFsmx4RRdMHlJTV2GiwVmgHysX0vZAOgSI2zZDc7seGn9JRF1M3y5KUcN
L7nIEahW29Hqef68XL1/zN1DhjHuRkzfqO8SwM0/r+W9ehgi1DaCKBBENT/O15kWqlcccWyEJdqA
sZ+XmyuZueXkmToahX9yDe6kAkwOIYHj/tKi4kht6+PG/qVWWOAL+2Ht9swrTSjQ4f7bDTmQZU7O
XrkxeF4KQDYBt8rTweELhDggNbKTcrP8URvY/SlO1hNoXrM9CKm2SDmF/rps/jKYgXuGe3yglhc5
ZddjVH3ch9Ic0y84PbiRcemZH6uGTeAj42dIh9Qhl5G4hj9dQc+jgDoAzFuWDOj05BPXPN5KnXfu
3ifr22pGMncbeAP3u8IojSHFKW9reU2L2E7aFvNrwFDFmRe8xmr5ABv7Mn64NtyRk9ZZJ7ehTyEg
4JkoCD5mbZp4kbaGAoSrtBnFTQT1rKdHqiLgPT0T9kRYK0Um2/WU2Cczdd38kc3Q+dY4SfImZ0AN
pYyQeZDiBr5ZxRhZNk1K0ntdEiec/k0uOPfJbKVpNxqMBk/2TUwq5HjzH+lNABTYSnSfHm98n1gi
vqUi5SteZyimeynci0Bexrd17NNgn0+6kgy4ItvWzoB3UI8Db+ucjtfDOHh3nXpIi0PyL942Kw1X
wU63w4y81DI5v8Qd8F/HqICnOcWrUuQd2KLllbcvofxhB4jT9llZvqMUlt46fY/m1TFcNdBhpa5r
MjpAHiK+0DmmbxHEtxi90Dgo4hMhUr6vaGH5waVeSVoFE8DwW4ssjYVbsUfHytZqRt5qEZjdRNo/
wtdmBRruStjF5XR2Gx2yvViVE1j8yFgBIwYspBSYN6z3+jvAyd2mZEeyIzYt8ogB4wVEImVTkfYy
0K4JhALorFKxZYo1kkZoYSOCPDbgKive+x069NZbwcHu6xnINvpYlFr1DFDBElgiin0XE2/UXURj
yheOxeUzhWnGnnShx/wGA2SHjJQr9TXog1CzK2xMHYcv7QjBP2Fsans8tVQi7clKt6940AhmPUWD
M9OEUdYCsakaXFSWqbzutlvjMzFpMqrdg767qTLpI+2D59I4dHrIqqNISawiWbhx6uBQfrk0lmNt
2n1ypRRU1P1bJ7AnQVMuJifckhkKrW4zZh03J2db5QyIH3AQRCfa/y6OfPcvb8fk8Cf3vzI9UeLR
F05/QboZpP4bqgcMOmnSNWauBgygp9gZAxSt7QCmkyKTVvXI+vhGeQvghnzUxaJ3ldw5eTfAR8da
6+ggLh6oB30HhN0jr6++L8YXyxvJ9TkToF5WaXkVx7hnrvtN+JhmfX933NY75ursLU356pchBxFS
NdPGFVIrf6cWMogglSPMKbAkrkOOPiQmU5g1NzwjbvQl2IXo4ruTpNv22uf65Il4XB0ATk+nIdjY
voa6eJjzUZINEHgDjP7qfaRjjJC4h74UOq0SnjsakicoqkWgIsyH2wWe2mukjm4JK6zVW1baqJbl
/a0NarHoiSCPBwsgFXzOJAW87dgxbOrXcQYxUGluoiVc+SuD/OTDL4s/8g7W7BY+XXY4UNz5cGHs
nRokkMuiC28uozAKME/B1PT1mxEMW5TYolUY3YSU8CZr0Ynivp6jDtxbn+QwK7VrgxmMxARSb/YC
mdFbN9h4c8ItNQ4L0plKYQLgu75+bfsA0F5RNjmAKCWO7goOkNWrY5K1inbRtzGAN1OrLiA3K0Zx
MWuToRKXDfQpa6v/C2J0ytrBDnz9S3boVe6Xt43mjOA0Y0fKinXdtdTr3UeA3kq4ipztFr1+bR7U
7tLIS4MtU159JMlrVAyUrSrDANUbH5+nYx7uHVrwP/w2yizw0pJEGUZTvaQOOmin8FeYa91IPxDT
uWmCEn72YC332S1vKkTcchy0zn3V8W+AyB6n5OvExbh/ilR/o+OsFYH5SOQrCQB69LlF2UEu6Qxl
/24c9J1AIo0DwMEBtDoaWGUYvPKLGF1Y3Lwt0keQSY3m6mL33JFGWJAQex5H9XQ0QZSLUDVJK5Nx
5KVX9NZwgFrEFIzS0yjn6HVw4fKlLfvcs3/kLJTVSAl5suYPqcrV02HX+E7rtAj3qf3tNjsJ36XP
MgRP0KrV5bMk+e5d0BVeJTiGhb6doBtPveZxL2Je5nnMqFD5abTWEbedXUMNkoJLN9x2/iAFK2VA
zBB05kQw81mZJrNeAhEj0iwtUuzn7ErfOAnk6p0cjvA39ZcNe8cKxqQ7Xrd1S5WQRvqejHOZgrGt
Cj5e6evi/YaQgKFeE4eBeU/0GJ0Lz591UXQfM+/zk9YDCmjhAPEe+qbzm02ryliXgNy8RDIOGq+m
mLAsXVOsebMZ4cCj7vxIkZC2VQZAc/ONIgQF8monUdknfXnJw9y7sIaJhfshPyQNCd2BWGHlCNxJ
VYF5UCvCp2mmig7IofvLDZ5x81yaxTPyL/wpLmGiseGNgbjJ4yIA3saTPSNOSGHTZLnAZkoY567K
tBPMpPPXhRYK6l6vJ2JwIsOVdEmGz6Qhe4svPmHYZzb1AnTyAgU3bW1lU5ejMMhXEU4UuGu13J9V
1LRiDFjM2d+IQPmhDkuWU+X9CmUwquxcPTwBkKqBnXxUOxsJq436XTYtpA21GodjDsthB1b3Aq2/
fC13QaiyktPJl7OyQnY20g2XhJXDKFhXehS22y1VgxS8sJwfAWi8m61jipPFAaxGPid+A5yfR9hQ
IzxWfm+ZDhSB0Ac0ws9SW09crOSfLo7drXB8y2zMp/N5JtYFwtiHAn77V4nUUjqeRmqewR2BoKO4
kdu7MJ6XMoaaCNBXtovwJPRzXkSVfL6YJuZBWKa67AvV0/yon8Ze4fzARX7XiEixK45mcciPa25x
kba+FLKjO0/1g2BWFhpQ8yYgUaEa6+2vq8jqDhmYxJSaC00CQKSQsTPZr1uzrPtMr94VB72JT3NW
oNg1vDz9jT+6jRttJ0mJiZwzt0f2V6vvdQ4lUsMNikWNS7belZMBeShSj1nMTP/bdlWUMQOQnW0P
/XesNpAT0X1rSg6dhra//mLJhvcK0tGoJDyA9/vAZjvhVrboN+K0jD/+wWD3l5y2Zusd602AQfwR
EQkvzbEmdDA6NP6Dq+ykLl3NNMF9GgtPAfWZn1NSNvYQQJik+aCwgiIgBbwOLBGUbX/AZL/mJQm8
/R5XXWbZolx9WLx1uw86DN6Y1nT8Qq/IH0wG0H4lCiP71GXJQk4MMgTS52ffb2ykUG/Y/O+eReDj
wl8mmdpka380kid8iNcKQoEA8oSWUCvFx7XKUK/texo9p6VlQ3XEDCJ/b0fcFEXFA9BvQ+bfqAZc
/dxT72tIQbxouo8EF2pC0t9q+jb85lJphzBA4evpQm+G+wY4k4Y5dG6aw0j9PJmGE2XbY/57rMfH
yxgfhkP0Fuc1MT0rT4aDrLy9PR4qoqz5512GIz6GcNMAZkuRvgksJX4fogzSU7phr0atiHzToKcl
7sfsxb28ENj/wwnz4Yb/X4He//VAUytlRBpJ0In5vbD7pJH475yJjcLfLvlHwVJzB7i7qu62+zgD
R13j6/VUhfpQb7+ANp2/BqqLmt/EDiay/AzvW9bPawN12I/WNiUGmLWRfG06FZbNkx1JnTYEstGE
hTh9uw0Jcp7SqKSnzP0f2Qk6foy5LTewuy9mki0cnpTvT20DWLqsghJA+PdZ9pavjp0GQIxQLJ3/
HVhQCtCrbUGEBWsybKLPQJDnTlhm9VT8VZv4bkeLq9JI7bH6fw5+3aCnN4MlcMmwCxKTGHaOgjMv
FMRagLOCzChh5InncZ1SE2jo5hudZPMylQ6z6nCgJAiXhNqLovWUYdgX+yhp8Oc/X7yGupumD1cd
C5aOjWTEmJ231tHtRsRlB6OF23y7YolF83THP2CTvITO8XOmbuwOiWuiTKHgUE3Y/ThOBvbny1/I
JTR988eGGcxItyuswc0YTvXYs81lSE/7Plc2hxk2NnyeOd8ZERCh/eiBK1FA21+8/3ehoLlEtHMu
ndN396Zu4ZTPLLMC7bH2k6srTv85Jn6eg4YJuD7QvP7ueHMc0UBgEnTQqNHBDKWZRlJSoWv8ba9k
GhEnAvULyhKlhj914fsC1WcpI/XurvJVB2/H6dBDKLDd/b/ksNwroZmKm/au4C5Y+t1/+ZI0gnNg
Vzad9qP5/eImS+qhswwm9NsN/YsMwVep08w8n98hAJmaREwUXDYRNeMCubhql71vBB3FMRgiT3j2
Ty96vkTk4jPXwczAdMnc6cDcUf+LPAlx9DUg/BESfziiTpx/LxWnBEPKHbs4U+Jm7IwnbUdr2DUD
mrqQF909HwxZaKjNECYaPr7AB98kybdd+8xWozeueDl0BptLmRVr8wZn/DrpTtchKJ9hnaL+yR+8
laedNcT+wMzb189dOVaPp7JUHzzauDry4ZISE3xXaaKm/DZFXaQMziaGWxe1IxUcdsa3JkiBk5FW
Bt8Hb2kJriarzZi5zXOlPbgKvxTFOA7gdNJmpA5QhvKHXshi1FOIgqA1k6KxYFVYIR6L9o2Hdj/X
V/mj8AktOIQI6nWIPsvML6xfl9e9rBj6/lDoKyYkp9kXh3FJ/Kqhke6v72mt5SRY3NiCchzKxP46
qWMg1ZyBd7433TB0zEUSrhowUpHh3xBrEdtbJbnmk9UPonJnIg6IKGlXo+ers9xwlO8IlObxFoM3
EP7FpBYbrHDfh791NAE7K5doAQpP0qxlfGk+CrsINuRuPhiXUTAaO/HzROb/mzvDiYE6LQD8Cgbb
bDAdIahrZSgswkU5IHyYBgDz9DFEKY/oZ+WFtykFH8v6Fk/42HmEvbCLa2EwdU3R5X7nUsacIhk/
8JNCOTUVKA8lVQbPEc4BwGZWz87QL3ntRLgCXCVubebhZWDJywqOocs0xxbfgQEXxDDSD/ypJR3x
SO5p2M70F3PJMS7XLxv2tLh6ZrlzhOtCfyEiQZaAU51f2D6kH8XSJ3JEG+ZjhxXOewuXFZ5DW64f
/FK43+ooZzAdgqkaH17ESRleLTAUgSnGtTIUDYVns4f+UTVLpQHgsooE0Dx9dz0NptGzPoqTlKGS
oADciM5dgdtK8gdp73/Ccbg3IklCM2pbjgTxpQD+6cxZ6We45EUmIyp186b49M5CvlQHNSVC+NyU
+G2aGdTdEFBdCpBPJKw7oKHRCRdNWTYvWfaVMkCJJ8Hh/YWYBavSU07DKj78iEPBXlfqcE+KpZ3H
s3uNdJNGKQeiC/0bW+EJCjUpDY61WABvspmddJrkUuO7iGq0K8HEiTaQ3fl9+prlfSd2qCxsixi2
+YqDkwUu6ABsgycr5xgtufKSGHRmeJAtNbu2vUGCp/i2/h5eyEQchVjg4ptnD/CUc8wwEWnBwSKn
IZF02SWLGomqnbm1oiIz4UKDToNEKne71HMwORaZyGrq1MXEjYpXLwAZ/nbctThmigF4t+JE4tbQ
+4vEa/oe1XLxTbFCE/6JhEDM7FaBedmNNJzeumDWsRUgsJKwwuQ8XyGaGdDC83XrXibMxWddHOAQ
8jSb1fcjhCmm+gc15g5PxzKiC6slZDeKFLEKycYs+w7E40wzAI+4d5lHNYZ0OEqQSbyixuxxmDs6
MURFvm3P7H/JfUALRg8gMDNVJcvZfi52AlAnZAbbUPaXhSltEmqywmXu6vFY06IA+qZcGv7WeEZN
uSrtlPFrmiDTNM1oLDdRAoq3cKcwwWYSzuaFLTXAkw1pTHJSxBsXEK20rZVvmNYgdUtxlBEinA2K
zCxL3BA808pLZwMcWlNdNjHkbjRchAx8XHXEVtFUNyYjdY+5DOmLZ8/QENYLMEE7ItAX4kHzMX+a
IxY2JXO7BPJEB/anak1njZSmbkvefgjILnJPbtUZa8bSmi+lyW44SI/E4wTsM/uZjyR+iNEIq+34
gNQ4oECCRwicOw2MWZEdznb4lT7hxCcivL0ODGD8PKJaFv2jtghyYGg/frW7f4sgAG1H8GYx6B+z
g5xgTYGpgweZ26g3u52EGNugvqyLjtN9cIF4RzKZLcQoYTMWKp//VoGmtFDLHDJcWBaiHEsWBlWA
kDgQvHNnhXdRUk2zb2cc6mdOuvA4MBoUbNt42niB3HSClkQgVhPDrebR/xlBADWyBxU1XswLtzh5
tcg9LYUXe1WLgse5ltq1DApdRb0acXlsb+sEJOaSURZH+T6EFbPtP9PtXbE+fhut4oOPaN6lRMg2
AKZ6j1vgR1uCm6vCrXeltnVQZocuxvSfrMxkOLkPLveEvByqM+jT472jHUzkOajcIpl+JnaKyVP7
k6GH0Rlui3TX6j7jEEm1YlsKth579wYf+hyQLVQg5sHOVU4FnmdZquOxUSU+akrhQm+dJnFts217
QFye57KNCbUTPMbQbGj8jknHIZScsPpEDkubDQlZ5uuUx3DoNyzGInTxIsWmFfUgYDvERRelWSsm
9xedrqgpOE8GWSYl/EY5XEMSA9xFIcaD3PI0BaFMeDWidxxO/VnGVSkBhl5FqU+lj1Q9oUwVnkpH
A3EAVBlx2QaG7iurueD8U7xqS6j4I+R5wRFsOfFEedp9giBtdsqItJ/5EsoBI0eu2rKr5vMVCk9R
6uiR9eEwcaiYd449jNf43cmSDVIu6BzLbKMvY7Q1hWaATSTc8k1D0F8/fGSRYLPdsz551WxjkEp2
Eh5RhxwiUi7azh+ofAVoKnoxMq2p/JuoXSVAbkt4xK9UWU+2ccFSFRmBxZlRf0uXtagudlFw/Y8J
lf2xGGvUewZhwleUJKJ3J6fuOOqjM8TeskmL2rnXYGz8kY4EofWH5Ft+H3xJWsVdQFR9ZbbQ2qzc
1qv35Jeo4e9H11XaU1sYCO6s5KjzqYGqyIk5RrHglBDJRHTgTd0Glym4NIMA+Ikp130q4BJrGePn
TkCojnokVyjbNUaPC05fWfolb4aqeyeAE/1OitUCspdjUzkxO+4yhn0hsLfSAu+tqfA21OyYuPe2
cH9xGgMawegHlnJsH8GqIn8qXqvlZ5DNaPnDeAlO3B9v5fsEoRtp18POn0IbxFXV2n1dmW7mRrKy
UuynAXXP84HGtXK5H+Yb07Fwi02yPbuHtg4aMoHJxC03vi+kXlU/sjMUxIplifqOdLKVzwFHUGpp
dTD1nhTBEkNW9nk5BvinxM4X7AWkQySHgdYgBzgr1HVwlGs2AvpUD4VjwRLH6QFD6qBTZUEo2qTz
pV3d+vzDJ+pIfYaN+qKKLhnuwcT+MW2Q6EAJwdZRqMiPYjRS2p+UXPr6C20C/eBqYbcKUWgIKNmZ
CEXjdCpNZjsWvP8njb8C/w6gfnifRhkQtkDefzrkeE/jrJoCwVfvBMDrz2l5Cp0NH4yEN6DN6sdl
jt+WtWWXVU8OBvMYPTOoVtnyT8qG7+DbK6uM8TshizygTU1VCFFuTP6JJvf7MoqmzykpLy9dEZW2
HoxB3cxQsAX83rcSvF/3WFnXTnQ4sH/p26pJBu+r/y20C+i6v/oOQy7nSbacHMfxp8DFa12aSHGN
6E0uCAOmUHtyiITH9HKogjyvg9fO5UfnxhUFjnTqW2hN/0gcmYkwNUrU66SQFNBDC038k9sDS04x
qjfesiZxpBJjhizyXD0xrOOtHI1OfB5jbkacQLNnvVsqCnfSm26NbApDu0oxzuPt4k64qvjUKoGp
yyV5VVeToabRsbR891FZP/9sGGCUKXc/zrUgiVVDO/KRHjKqphdymbklGOj6tpKuDS0PAi97MubX
4Lmz3JGo/skJyt0Cq0VSpHps97jprKtOdt5QHoCifxvj0L6xYpTK07YRW9DpPJrQ/gR8aPEL8AfB
daZlDdlGYiEwbN0Yng+50b3ppHE8WbbIvJWCj0aiH754uJc8XlCEo9qz3+CoNK9vcLxau+BnJy/u
k3M+4+1V64+utzze/+NQHiE+nLMZoyDkBmFHYF43OtrDg7j+972hX2HiBB0/KhRf86xaR05pu7gO
ejjREnGO+L7SZ7aBjjSJmeAWWhEbhOnVGSaUt8KlmfgZiRO7/Yeu+Wc23KRj3T1ctE0BtrHYItm1
fdz6LgTknZvnWHIP2iDaGBN8IvGERTlc5T5WMXxMAfBfDMm35Mr6i0xVO7WIATxJ7W/t2nQiH262
sDArmXlzbpezMIpUGt3SpxsPcYoDic1i+UUs8stDloOMIA39M1g6zqCN1z7O9IVyW6RnmpyyK0c5
1xFjlBuTr28iH/DtPRGxSdqzj8IaeBjcDgLYg2mISnAXKHhXhFJvIt3nayV9O6B2xFoBXLp38wBU
PxCXG3ncHNTQShc5wtPXF+FeV41Enf0nX0xJbrQzIy9GpUKmnVWbgXY4q45syNYT4aKJ9kDAsjHb
/lmbQKRlefddLV40m8pw/6e9viyat99c8M2qZDpc92VQ89KSMXmbnD7FfX34DxnXCCqy1Q41VrEH
yPJ8v588iRoGnWFvWs3Cakhh/rhqjrILERmxuVGeZzIpcE1LZRae6C61MhIB24Lfn/Y8zenf25ly
bGpgwgIUeJHZe0JE909SfhsPvpNRsVQWua5SAstINUwNgW9ckMv2yj+h/X3Q0oLG3kRVH0aba8S8
x2Ku99stXk5XnZ9ESLQXdaK88C6onNLaFP1D9Fy3lzh3R35AOpoCVCJRUEigznkZ2XPIGEMJT0TH
KoZiaVnjoFA4gRB8HbNIOy2qyhC7oqgjNJMbCP9UFW2PI9csq9UQH3+9j5GuroN6hQbAMpTIy3kW
46pM4c3RioYJOK3ZNKdALXCeA7Muzyx6YVskf5B9kCcL+zhwbSImAXvNzCv4cOGyhrda066Irwlp
ucv2zaYra4OcA07xOoPylhYSTAaT56VDFRcRDGr8uIIR1RvbWRaMN6JDYdM79+R1qh9IKNmvfbKs
+b0jr2qjOtjFPW2nzoGtibDKC04IGCxndmY2ldCEQx2AUxQCcsNTdPWpKWT7PsCKvS2jF5YEWkgi
OxyAPF18LzOD/lg5stisXApCf5hgZZjE7x2ntnPadIyG9veeigg+hXvj3qdqWebglFiUBfm8GsAM
MBmavxUMSW7D+vhZBLx5r8N5Gm3c74DVQBH1YM/hIftuCehQZZMRvagwW4jtyPnowy27AhofJdrd
2Us+vLZbkMrpBZJOhHi85yd1n8fbSrgwkDGyRvtxlOb6ciZdbISWU3ZpEEJkSgrWcCJKDRhW0Q4Y
rxT5YqCQP+qBfAMvTR0bAHKXr2GlgUOZDfMopbkX9AU4isQkwsek+0qx0THWQ+FG0YWmcBsof+78
MuI6whNTNPGYiFRKvsjhWhxh5uy0Jyx7uCTQgjCBU0C5/qtOuGn4XABzEPt0WkJxK1d8GmlmZGO7
AyhwqcSvJge0o33qRvL3okaywy/2/wvJ2AA50bmvB6c5DpwQCt1gYbS8w8KPvexgysH0ZEa8dNDj
17JfXcdkWlcdcuIuxn8gULS0FhvXhc+sovWKGEhojjJz4t1HLcFY+G2+9pL09CyKKTuWYV8Ql5ke
eS/eEdIhPEeWQrQildz9RUAvufbDrn3RYKmtWeCAH8BywtckL6Dmml56HbPeatTPU1Tr7jLkB3lx
S7T+aO+1GAJeMBdM+HDhXRtryvwGaRt8Tigrxo9VKZo8CFCc6gz9h/rPPrBRHEX0uh4r5FPgK+ss
ZCnm7IXOZgxCqH4QyhbX3oMxdqddfkrNwDmQY3TrpZjkAsOfk0YoUB6tR2l6+5RFUlDJKF6Lvm8y
VP1bRBoQrTXHrlsnxxOXtNsFn2UIstL02GZHoNtPDpVHlvQGEuknUlR7+WwtRI0c4jgUv+NwHJuK
JEEvcjAVvDeDFmimG5QtSAgOmCfebXKReVAE13haz4e1a2dnTyejrgGsx1yGjgBmlr9mAm9EzZDE
3wBY00CvML893G6lxkdrf2Gsg5lkjF6AAfVoGVYr1f393kskHrQVpeLHnc3hXZgPM55gFHupK2IV
AyYaYDsBEpiozy/bJFZX6+AEVOgfjjdqYxkifY1qIFrq+c+3SkD9RusDHS2RC4tG42zwhLIvyrdl
64gulbWTOX4qgQCL/TmvlPtJhIb836Lg4BRBPcqWgY8i4WtygU3GDVlnDQlEksloKSThS+QGgDFW
A+bos6aeed7zlM5WhVAz43tZkSeRZn5frL7+TRUMZAVFeDe9cpOtjRS53N/+l5vFaPb1pEwM7m9i
1nQR0KmrF7Y9kuZr3jyZ4/z11b7nLeP/LW5b1oZGlzaAJC8BwzaYW9rBID/RcdpRkDQ++fHlV+KB
x1P0A7ApWkx/k6wMLCf/z4wOFwE5OBfLu+XfVns6W8dwLm6XOmbE7jWY1hY7icD6zesSgbFxxpCR
67/plYHTx1DCMlSFFjebCE8EUgbhf/LrMDJnSXHGytCCpFTRq8u96mE519ssddbUU+y/OAmK/Nrk
j7rf76O2RUJHZzeYDUMSCAJ9X0HhI6EVYwa3obzEP5LFvHn7W5ewtU+KOycCUzxsOtBTnQt/YdEn
YWQgUKpmCOV+sU0eHc0X5l2f5cPQaYUL/O+aPOvGP3fvd9eH3cz8mX4Bz0L9WO4zN0XgZPGOxXUf
sCRJqjSSow1buXsg2kKPHlklGRQ6BfKzLM7KbVWrpxY6sfjHFYWJ4WDakxxjiG6GaKCgpch7sx0i
/rQcwNpL5DWHhBkUrkMHjTPjd5mX7ym5c/42JVYsBzcaFcToMQcHZTS12f1sKbhyUUWLOE/sfDoQ
wp81KrxdCN3dmiZY+1LGXuQM9/kBVf3TbpJbVZOx5XfO2RPz2WgHsqUUeGa6My68Va0pUGhW2wp6
hekfaZqpTk1hgPcRe2PO5e96AVqY5r8CuxbBsA7OID1YVGDCbjG2eSCkV1oNx18VnocLJ4l09k9O
dq9ZbjbRPMykIpfWlX7Y+dKE+K/CGd9ONeabJIizugcKRcISTsaJ90taQPmEZzL/ryCLOd/Fqbpu
qL8akV3QWiD4jgzm5JM2DvkMU4w6C1j+38hovZUoMt23DODcIUT2u59MGb56EqVgrROYeq18s938
OgNNctcHiCGuiiiGX7JM0/9zGr3Q6ew8i51ViyhTxkxgKIL/64d12/+mr7CJtRVIZM9NVhC/5vtz
1G1L9n13wDggt7lFzBk8DsnK4dMjZuj1wg7gyKKaiX8uMU7t9kJ2UAnccCBnh+o+4BN4Vw==
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
