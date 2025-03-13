// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:39:32 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/rs3clone/RS3C1B201.gen/sources_1/ip/A1761INTERNROM/A1761INTERNROM_sim_netlist.v
// Design      : A1761INTERNROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A1761INTERNROM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A1761INTERNROM
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
  (* C_DISABLE_WARN_BHV_RANGE = "1" *) 
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
  (* C_INIT_FILE = "A1761INTERNROM.mem" *) 
  (* C_INIT_FILE_NAME = "A1761INTERNROM.mif" *) 
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
  A1761INTERNROM_blk_mem_gen_v8_4_10 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17760)
`pragma protect data_block
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
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
