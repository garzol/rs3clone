// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Mon Mar 10 16:37:40 2025
// Host        : delalacon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top DBL1024RAM -prefix
//               DBL1024RAM_ DBL1024RAM_sim_netlist.v
// Design      : DBL1024RAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "DBL1024RAM,blk_mem_gen_v8_4_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_10,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module DBL1024RAM
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [0:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [0:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [6:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [7:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [9:0]addra;
  wire [6:0]addrb;
  wire clka;
  wire [0:0]dina;
  wire [7:0]dinb;
  wire [0:0]douta;
  wire [7:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.4103 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
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
  (* C_INIT_FILE = "DBL1024RAM.mem" *) 
  (* C_INIT_FILE_NAME = "DBL1024RAM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "1" *) 
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
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "1" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  DBL1024RAM_blk_mem_gen_v8_4_10 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
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
        .s_axi_wdata(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20592)
`pragma protect data_block
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
p9Yb37XWEuw9uSlrBnwm
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
