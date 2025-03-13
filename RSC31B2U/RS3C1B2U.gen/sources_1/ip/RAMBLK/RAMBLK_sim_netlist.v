// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:37:39 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top RAMBLK -prefix
//               RAMBLK_ RAMBLK_sim_netlist.v
// Design      : RAMBLK
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "RAMBLK,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module RAMBLK
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [6:0]addra;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
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
  (* C_INIT_FILE = "RAMBLK.mem" *) 
  (* C_INIT_FILE_NAME = "RAMBLK.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  RAMBLK_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20432)
`pragma protect data_block
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
sWE2j2MZVhqD4SMgFoTT4SH8pWP91ekqxVE=
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
