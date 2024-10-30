#Clock
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];

#Individual LEDS
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { led1 }]; #IO_L14P_T2_SRCC_34 Schematic=LD0

set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { led2[0] }]; #IO_0_34 Schematic=LD2
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { led2[1] }]; #IO_L15P_T2_DQS_34 Schematic=LD3
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { led2[2] }]; #IO_L3P_T0_DWS_PUDC_B_34 Schematic=LD4
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { led2[3] }]; #IO_25_34 Schematic=LD5

set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { led3 }]; #IO_L17N_T2_34  Schematic=LD7
