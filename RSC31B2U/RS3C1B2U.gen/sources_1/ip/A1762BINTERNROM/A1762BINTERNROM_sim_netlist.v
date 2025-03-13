// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:09:59 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1762BINTERNROM/A1762BINTERNROM_sim_netlist.v
// Design      : A1762BINTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1762BINTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1762BINTERNROM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
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
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.1884 mW" *) 
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
  (* C_INIT_FILE = "A1762BINTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1762BINTERNROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  A1762BINTERNROM_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18432)
`pragma protect data_block
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
5ADsTFREf7aJKKGHgfijNPvFjSvp
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
