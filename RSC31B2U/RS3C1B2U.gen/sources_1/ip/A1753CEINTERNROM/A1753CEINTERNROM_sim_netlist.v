// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:11:33 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1753CEINTERNROM/A1753CEINTERNROM_sim_netlist.v
// Design      : A1753CEINTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1753CEINTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1753CEINTERNROM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.2196 mW" *) 
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
  (* C_INIT_FILE = "A1753CEINTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1753CEINTERNROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  A1753CEINTERNROM_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17792)
`pragma protect data_block
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
2avZ4P9iMI0=
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
