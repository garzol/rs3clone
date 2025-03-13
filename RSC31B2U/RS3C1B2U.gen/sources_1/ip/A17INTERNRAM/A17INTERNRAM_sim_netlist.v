// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:40:12 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vvdprj/rs3clone/RS3C1B201.gen/sources_1/ip/A17INTERNRAM_1/A17INTERNRAM_sim_netlist.v
// Design      : A17INTERNRAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "A17INTERNRAM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module A17INTERNRAM
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [3:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
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
  wire [3:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.47915 mW" *) 
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
  (* C_INIT_FILE = "A17INTERNRAM.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
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
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  A17INTERNRAM_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[3:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20688)
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
