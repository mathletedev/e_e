#Clock
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];

#Push Buttons
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { start }]; #IO_L8P_T1_34 Schematic=BTN0
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { react }]; #IO_L4N_T0_34 Schematic=BTN1
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { avg }]; #IO_L24P_T3_34 Schematic=BTN2

#Individual LEDS
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { led }]; #IO_L14P_T2_SRCC_34 Schematic=LD0

set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { idx[0] }]; #IO_0_34 Schematic=LD2
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { idx[1] }]; #IO_L15P_T2_DQS_34 Schematic=LD3
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { idx[2] }]; #IO_L3P_T0_DWS_PUDC_B_34 Schematic=LD4
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { idx[3] }]; #IO_25_34 Schematic=LD5
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { idx[4] }]; #IO_L16N_T2_34 Schematic=LD6
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { idx[5] }]; #IO_L17N_T2_34  Schematic=LD7
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { idx[6] }]; #IO_L16P_T2_34 Schematic=LD8
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { idx[7] }]; #IO_L22N_T3_34 Schematic=LD9

#Seven Segmen Display Anodes
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { seg_an[0] }]; #IO_L10P_T1_AD11P_35 Schematic=SSEG_AN0
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { seg_an[1] }]; #IO_L13N_T2_MRCC_35 Schematic=SSEG_AN1
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { seg_an[2] }]; #IO_L8N_T1_AD10N_35 Schematic=SSEG_AN2
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { seg_an[3] }]; #IO_L11P_T1_SRCC_35 Schematic=SSEG_AN3

#Seven Segmen Display Cathodes
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[0] }]; #IO_L20P_T3_AD6P_35 Schematic=SSEG_CA
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[1] }]; #IO_L19P_T3_35 Schematic=SSEG_CB
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[2] }]; #IO_L14P_T2_AD4P_SRCC_35 Schematic=SSEG_CC
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[3] }]; #IO_25_35 Schematic=SSEG_CD
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[4] }]; #IO_L8P_T1_AD10P_35 Schematic=SSEG_CE
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[5] }]; #IO_L24N_T3_AD15N_35 Schematic=SSEG_CF
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { seg_cat[6] }]; #IO_L8P_T1_AD10P_35 Schematic=SSEG_CG
