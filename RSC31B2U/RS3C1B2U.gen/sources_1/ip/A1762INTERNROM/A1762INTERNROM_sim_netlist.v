// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 21:09:37 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/RS3C1B2U/RS3C1B2U.gen/sources_1/ip/A1762INTERNROM/A1762INTERNROM_sim_netlist.v
// Design      : A1762INTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1762INTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1762INTERNROM
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
  (* C_INIT_FILE = "A1762INTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
  A1762INTERNROM_blk_mem_gen_v8_4_10 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17744)
`pragma protect data_block
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
dSRb52LmC5XDX82+T+c2g38=
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
