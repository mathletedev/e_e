##Clock
#IO_L13P_T2_MRCC_35 Schematic name=SYSCLK
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 4} [get_ports { clk }];

##LEDS
#IO_L14P_T2_SRCC_34 Schematic name=LD0
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
#IO_L14N_T2_SRCC_34 Schematic name=LD1
set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
#IO_0_34 Schematic name=LD2
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
#IO_L15P_T2_DQS_34 Schematic name=LD3
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { led[3] }];

##RGB_LEDS
#IO_L3P_T0_DWS_PUDC_B_34 Schematic name=LD4_R
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { led[4] }];
#IO_25_34 Schematic name=LD4_G
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { led[5] }];
#IO_L16N_T2_34 Schematic name=LD4_B
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { led[6] }];

#IO_L17N_T2_34  Schematic name=LD5_R
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { led[7] }];
#IO_L16P_T2_34 Schematic name=LD5_G
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { led[8] }];
#IO_L22N_T3_34 Schematic name=LD5_B
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { led[9] }];

#IO_L22P_T3_34  Schematic name=LD6_R
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { led[10] }];
#IO_L18N_T2_34 Schematic name=LD6_G
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { led[11] }];
#IO_L17P_T2_34 Schematic name=LD6_B
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { led[12] }];

#IO_L8N_T1_34 Schematic name=LD7_R
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { led[13] }];
#IO_L7P_T1_34 Schematic name=LD7_G
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { led[14] }];
#IO_L7N_T1_34 Schematic name=LD7_B
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { led[15] }];

##SevenSegmentDisplay
##anodes
#IO_L10P_T1_AD11P_35 Schematic name=SSEG_AN0
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { an[0] }];
#IO_L13N_T2_MRCC_35 Schematic name=SSEG_AN1
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
#IO_L8N_T1_AD10N_35 Schematic name=SSEG_AN2
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
#IO_L11P_T1_SRCC_35 Schematic name=SSEG_AN3
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { an[3] }];

##cathodes
#IO_L20P_T3_AD6P_35 Schematic name=SSEG_CA
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }];
#IO_L19P_T3_35 Schematic name=SSEG_CB
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }];
#IO_L14P_T2_AD4P_SRCC_35 Schematic name=SSEG_CC
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }];
#IO_25_35 Schematic name=SSEG_CD
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { seg[3] }];
#IO_L8P_T1_AD10P_35 Schematic name=SSEG_CE
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { seg[4] }];
#IO_L24N_T3_AD15N_35 Schematic name=SSEG_CF
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { seg[5] }];
#IO_L8P_T1_AD10P_35 Schematic name=SSEG_CG
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { seg[6] }];
#IO_L12N_T1_MRCC_35 Schematic name=SSEG_DP
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { seg[7] }];
