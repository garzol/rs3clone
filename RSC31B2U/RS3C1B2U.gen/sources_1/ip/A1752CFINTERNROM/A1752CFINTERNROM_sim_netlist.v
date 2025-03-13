// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:10:13 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1752CFINTERNROM/A1752CFINTERNROM_sim_netlist.v
// Design      : A1752CFINTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1752CFINTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1752CFINTERNROM
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
  (* C_INIT_FILE = "A1752CFINTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1752CFINTERNROM.mif" *) 
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
  A1752CFINTERNROM_blk_mem_gen_v8_4_10 U0
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
zrF6aGYaLBE=
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
