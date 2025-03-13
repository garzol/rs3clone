// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:38:20 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/rs3clone/RS3C1B201.gen/sources_1/ip/GAMEPROM/GAMEPROM_sim_netlist.v
// Design      : GAMEPROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "GAMEPROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module GAMEPROM
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
  (* C_INIT_FILE = "GAMEPROM.mem" *) 
  (* C_INIT_FILE_NAME = "GAMEPROM.mif" *) 
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
  GAMEPROM_blk_mem_gen_v8_4_10 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19856)
`pragma protect data_block
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
q9fVMFtOLg4sh2TX6GboARPF5Xk=
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
