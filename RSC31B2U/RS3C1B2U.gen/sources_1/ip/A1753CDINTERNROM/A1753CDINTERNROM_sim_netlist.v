// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:11:18 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1753CDINTERNROM/A1753CDINTERNROM_sim_netlist.v
// Design      : A1753CDINTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1753CDINTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1753CDINTERNROM
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
  (* C_INIT_FILE = "A1753CDINTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1753CDINTERNROM.mif" *) 
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
  A1753CDINTERNROM_blk_mem_gen_v8_4_10 U0
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
G+dWCaYcFTY=
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
