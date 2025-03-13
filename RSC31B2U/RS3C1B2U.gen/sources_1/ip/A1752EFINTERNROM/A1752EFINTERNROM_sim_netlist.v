// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:11:03 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1752EFINTERNROM/A1752EFINTERNROM_sim_netlist.v
// Design      : A1752EFINTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1752EFINTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1752EFINTERNROM
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
  (* C_INIT_FILE = "A1752EFINTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1752EFINTERNROM.mif" *) 
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
  A1752EFINTERNROM_blk_mem_gen_v8_4_10 U0
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
9CZVDnmf46U=
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
