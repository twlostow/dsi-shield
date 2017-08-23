EESchema Schematic File Version 2
LIBS:Capacitors Networks THD
LIBS:Capacitors Networks SMD
LIBS:Capacitors THD
LIBS:Capacitors SMD
LIBS:Miscellaneous
LIBS:HARWIN
LIBS:LEMO
LIBS:WEIDMULLER
LIBS:FCI
LIBS:MOLEX
LIBS:TYCO
LIBS:ERNI
LIBS:MENTOR
LIBS:SAMTEC
LIBS:STELVIO-KONTEK COMATEL
LIBS:AMPHENOL
LIBS:HARTING
LIBS:3M
LIBS:Pads
LIBS:Switches
LIBS:Relays
LIBS:Heat-Sinks
LIBS:Fasteners & Fixings
LIBS:Batteries
LIBS:Fuses
LIBS:Metal Screening Box
LIBS:Sockets
LIBS:Regulators
LIBS:Transistors
LIBS:Power Supplies
LIBS:Analog & Interface
LIBS:Sensors
LIBS:Logic
LIBS:Optocouplers
LIBS:Standard Logic
LIBS:DC-DC Converters
LIBS:Operational Amplifiers
LIBS:Crystals & Oscillators
LIBS:Diodes
LIBS:LEDs & Displays
LIBS:PCB Modules
LIBS:Bonding
LIBS:Resistors THD
LIBS:Potentiometers SMD
LIBS:Thermistors And Varistors
LIBS:Potentiometers THD
LIBS:Resistor Networks THD
LIBS:Resistors SMD
LIBS:Resistor Networks SMD
LIBS:Transformers
LIBS:Inductors SMD
LIBS:Inductors THD
LIBS:Cores
LIBS:power
LIBS:conn
LIBS:dsi_shield
LIBS:dsi_shield-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 9450 3500 1750 4800
U 598D85B4
F0 "FPGA" 60
F1 "fpga.sch" 60
F2 "DSI_L0_P" O R 11200 4150 60 
F3 "DSI_L0_N" O R 11200 4250 60 
F4 "DSI_L1_P" O R 11200 4350 60 
F5 "DSI_L1_N" O R 11200 4450 60 
F6 "DSI_L2_P" O R 11200 4550 60 
F7 "DSI_L2_N" O R 11200 4650 60 
F8 "DSI_L3_P" O R 11200 4750 60 
F9 "DSI_L3_N" O R 11200 4850 60 
F10 "DSI_CLK_P" O R 11200 4950 60 
F11 "DSI_CLK_N" O R 11200 5050 60 
F12 "~CPU_RST" I L 9450 7250 60 
F13 "TMS" I R 11200 7950 60 
F14 "TCK" I R 11200 8050 60 
F15 "TDI" I R 11200 8150 60 
F16 "TDO" O R 11200 7850 60 
F17 "DDR_VREF" U R 11200 5750 60 
F18 "BL_DIM" B L 9450 3750 60 
F19 "HPD_NOTIF" O L 9450 4900 60 
F20 "TMDS_RX2_P" I L 9450 4500 60 
F21 "TMDS_RX2_N" I L 9450 4600 60 
F22 "TMDS_RX1_P" I L 9450 4300 60 
F23 "TMDS_RX1_N" I L 9450 4400 60 
F24 "TMDS_RX0_P" I L 9450 4100 60 
F25 "TMDS_RX0_N" I L 9450 4200 60 
F26 "TMDS_RX3_P" I L 9450 4700 60 
F27 "TMDS_RX3_N" I L 9450 4800 60 
F28 "SCL" B L 9450 5100 60 
F29 "SDA" B L 9450 5200 60 
F30 "CLK_25MHZ" I L 9450 7450 60 
F31 "DSI_GPIO0" B R 11200 5250 60 
F32 "DSI_GPIO1" B R 11200 5350 60 
F33 "DSI_RESET_N" O R 11200 5150 60 
F34 "LCD_PWREN" O L 9450 3850 60 
F35 "VID_PCLK" I L 9450 5800 60 
F36 "VID_HS" I L 9450 5900 60 
F37 "VID_VS" I L 9450 6000 60 
F38 "VID_D0" I L 9450 6100 60 
F39 "VID_D1" I L 9450 6200 60 
F40 "VID_D2" I L 9450 6300 60 
F41 "VID_D3" I L 9450 6400 60 
F42 "VID_D4" I L 9450 6500 60 
F43 "VID_D5" I L 9450 6600 60 
F44 "VID_D6" I L 9450 6700 60 
F45 "VID_D7" I L 9450 6800 60 
F46 "VID_RESET_N" O L 9450 6900 60 
F47 "SDRAM_A[0..12]" O R 11200 5850 60 
F48 "SDRAM_DQ[0..15]" B R 11200 5950 60 
F49 "SDRAM_BA[0..1]" O R 11200 6050 60 
F50 "SDRAM_DQS[0..1]" B R 11200 6150 60 
F51 "SDRAM_DQM[0..1]" B R 11200 6250 60 
F52 "SDRAM_CLK_P" O R 11200 6350 60 
F53 "SDRAM_CLK_N" O R 11200 6450 60 
F54 "SDRAM_WE_N" O R 11200 6550 60 
F55 "SDRAM_RAS_N" O R 11200 6650 60 
F56 "SDRAM_CAS_N" O R 11200 6750 60 
F57 "SDRAM_CKE" O R 11200 6850 60 
F58 "SDRAM_CS_N" O R 11200 6950 60 
F59 "DBG_TX" O R 11200 7750 60 
F60 "DBG_RX" I R 11200 7650 60 
F61 "HOST_WE" I L 9450 8150 60 
F62 "HOST_RD" I L 9450 7950 60 
F63 "HOST_CS" I L 9450 8050 60 
F64 "HOST_A0" I L 9450 7750 60 
F65 "HOST_D[0..7]" B L 9450 7850 60 
F66 "HPD_EN" O L 9450 5000 60 
$EndSheet
Text Notes 750  11050 0    40   ~ 0
Copyright 2013-2017 twl <twlostow@printf.cc>\n\nThis documentation describes Open Hardware and is licensed under\nthe CERN OHL v. 1.2. You may redistribute and modify this documentation\nunder the terms of the CERN OHL v.1.2. (http://ohwr.org/CERNOHL).\nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY\nAND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2\nfor applicable conditions.\n
$Sheet
S 7100 3950 1700 1400
U 59999DBD
F0 "HDMI_IN" 60
F1 "hdmi_in.sch" 60
F2 "HPD_NOTIF" O R 8800 4900 60 
F3 "HPD_EN" I R 8800 5000 60 
F4 "TMDS2_P" O R 8800 4500 60 
F5 "TMDS2_N" O R 8800 4600 60 
F6 "TMDS1_P" O R 8800 4300 60 
F7 "TMDS1_N" O R 8800 4400 60 
F8 "TMDS0_P" O R 8800 4100 60 
F9 "TMDS0_N" O R 8800 4200 60 
F10 "TMDS_CLK_P" O R 8800 4700 60 
F11 "TMDS_CLK_N" O R 8800 4800 60 
F12 "SCL" B R 8800 5100 60 
F13 "SDA" B R 8800 5200 60 
$EndSheet
$Sheet
S 9450 2700 1750 550 
U 599BB99B
F0 "PSU" 60
F1 "power_supply.sch" 60
F2 "LCD_PWREN" I L 9450 2900 60 
F3 "BL_DIM" B L 9450 3000 60 
F4 "LCD_BL_A" U R 11200 2850 60 
F5 "LCD_BL_FB" U R 11200 2950 60 
$EndSheet
Text Notes 14900 10250 2    150  ~ 0
HDMI DSI Shield
Text Notes 14500 10450 2    100  ~ 0
Top level design
Text Notes 15625 11075 2    60   ~ 0
2.2a
Text Notes 13475 10925 2    60   ~ 0
Top level schematic design
$Sheet
S 11700 5550 1450 1550
U 59956471
F0 "DDR" 60
F1 "ddr_sdram.sch" 60
F2 "SDRAM_A[0..12]" I L 11700 5850 60 
F3 "SDRAM_BA[0..1]" I L 11700 6050 60 
F4 "SDRAM_RAS_N" I L 11700 6650 60 
F5 "SDRAM_CAS_N" I L 11700 6750 60 
F6 "SDRAM_WE_N" I L 11700 6550 60 
F7 "SDRAM_CS_N" I L 11700 6950 60 
F8 "SDRAM_CKE" I L 11700 6850 60 
F9 "SDRAM_CLK_P" I L 11700 6350 60 
F10 "SDRAM_CLK_N" I L 11700 6450 60 
F11 "SDRAM_DQ[0..15]" B L 11700 5950 60 
F12 "SDRAM_DQM[0..1]" B L 11700 6250 60 
F13 "SDRAM_DQS[0..1]" B L 11700 6150 60 
F14 "DDR_VREF" U L 11700 5750 60 
$EndSheet
$Sheet
S 11700 7500 1450 800 
U 59977AA5
F0 "USB_UART" 60
F1 "usb_uart.sch" 60
F2 "TXD" O L 11700 7650 60 
F3 "RXD" I L 11700 7750 60 
F4 "~CPU_RST" O R 13150 7650 60 
F5 "TDO" I L 11700 7850 60 
F6 "TDI" O L 11700 8150 60 
F7 "TCK" O L 11700 8050 60 
F8 "TMS" O L 11700 7950 60 
$EndSheet
$Comp
L OSC_25MHZ_PERICOM_FNETHE025 IC12
U 1 1 5992C2E4
P 5850 7250
F 0 "IC12" H 6150 7415 50  0000 C CNN
F 1 "OSC_25MHZ_PERICOM_FNETHE025" H 5850 6660 60  0001 L CNN
F 2 "ICs And Semiconductors SMD:OSC_PERICOM_FNETHE025" H 5850 5760 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\OSC_PERICOM_FNETHE025.pdf" H 5850 6480 60  0001 L CNN
F 4 "25MHz" H 6150 7324 50  0000 C CNN "~"
F 5 "OSC_25MHZ_PERICOM_FNETHE025" H 5850 6390 60  0001 L CNN "Part Number"
F 6 "Oscillator 1OE 2GND 3OUT 4VDD" H 5850 6300 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Crystals & Oscillators.SchLib" H 5850 6210 60  0001 L CNN "Library Path"
F 8 "=Value" H 5850 6120 60  0001 L CNN "Comment"
F 9 "Standard" H 5850 6030 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5850 5940 60  0001 L CNN "Component Type"
F 11 "~~" H 5850 5850 60  0001 L CNN "Device"
F 12 "SMD Oscillator, side convave, 4 pins, 5.00x7.00mm" H 5850 5670 60  0001 L CNN "PackageDescription"
F 13 "25MHz" H 5850 5580 60  0001 L CNN "Val"
F 14 "~~" H 5850 5490 60  0001 L CNN "Status"
F 15 "3.3V, ±25ppm, 15pF, -20..70°C, Surface Mount Crystal Oscillator" H 5850 5400 60  0001 L CNN "Part Description"
F 16 "PERICOM" H 5850 5310 60  0001 L CNN "Manufacturer"
F 17 "FNETHE025" H 5850 5220 60  0001 L CNN "Manufacturer Part Number"
F 18 "4" H 5850 5130 60  0001 L CNN "Pin Count"
F 19 "~~" H 5850 5040 60  0001 L CNN "Case"
F 20 "Yes" H 5850 4950 60  0001 L CNN "Mounted"
F 21 "No" H 5850 4860 60  0001 L CNN "Socket"
F 22 "Yes" H 5850 4770 60  0001 L CNN "SMD"
F 23 "No" H 5850 4680 60  0001 L CNN "PressFit"
F 24 "No" H 5850 4590 60  0001 L CNN "Sense"
F 25 "No" H 5850 4500 60  0001 L CNN "Bonding"
F 26 "~~" H 5850 4410 60  0001 L CNN "Sense Comment"
F 27 "~~" H 5850 4320 60  0001 L CNN "Status Comment"
F 28 "~~" H 5850 4230 60  0001 L CNN "Field1"
F 29 "1.55mm" H 5850 4140 60  0001 L CNN "ComponentHeight"
F 30 "PcbLib\\ICs And Semiconductors SMD.PcbLib" H 5850 4050 60  0001 L CNN "Footprint Path"
F 31 "OSC_PERICOM_FNETHE025" H 5850 3960 60  0001 L CNN "Footprint Ref"
F 32 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\OSC_PERICOM_FNETHE025.pdf" H 5850 3870 60  0001 L CNN "HelpURL"
F 33 "~~" H 5850 3780 60  0001 L CNN "ComponentLink1URL"
F 34 "~~" H 5850 3690 60  0001 L CNN "ComponentLink1Description"
F 35 "~~" H 5850 3600 60  0001 L CNN "ComponentLink2URL"
F 36 "~~" H 5850 3510 60  0001 L CNN "ComponentLink2Description"
F 37 "CERN DEM JLC" H 5850 3420 60  0001 L CNN "Author"
F 38 "04/25/12 00:00:00" H 5850 3330 60  0001 L CNN "CreateDate"
F 39 "04/25/12 00:00:00" H 5850 3240 60  0001 L CNN "LatestRevisionDate"
F 40 "ICs And Semiconductors SMD" H 5850 3150 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5850 3060 60  0001 L CNN "License"
	1    5850 7250
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR01
U 1 1 5992D2A2
P 5650 7200
F 0 "#PWR01" H 5650 7050 50  0001 C CNN
F 1 "+3V3" H 5665 7373 50  0000 C CNN
F 2 "" H 5650 7200 50  0001 C CNN
F 3 "" H 5650 7200 50  0001 C CNN
	1    5650 7200
	1    0    0    -1  
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C17
U 1 1 5992E213
P 5650 7750
F 0 "C17" V 5754 7860 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 5650 7490 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X90N" H 5650 6680 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 5650 7310 60  0001 L CNN
F 4 "100nF" V 5845 7860 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 5650 7220 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5650 7130 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5650 7040 60  0001 L CNN "Library Path"
F 8 "=Value" H 5650 6950 60  0001 L CNN "Comment"
F 9 "Standard" H 5650 6860 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5650 6770 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5650 6590 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5650 6500 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 5650 6410 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5650 6320 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 5650 6230 60  0001 L CNN "Val"
F 16 "None" H 5650 6140 60  0001 L CNN "Status"
F 17 "~~" H 5650 6050 60  0001 L CNN "Status Comment"
F 18 "100V" H 5650 5960 60  0001 L CNN "Voltage"
F 19 "X7R" H 5650 5870 60  0001 L CNN "TC"
F 20 "±10%" H 5650 5780 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5650 5690 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5650 5600 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 5650 5510 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5650 5420 60  0001 L CNN "Case"
F 25 "Yes" H 5650 5330 60  0001 L CNN "Mounted"
F 26 "No" H 5650 5240 60  0001 L CNN "Socket"
F 27 "Yes" H 5650 5150 60  0001 L CNN "SMD"
F 28 "~~" H 5650 5060 60  0001 L CNN "PressFit"
F 29 "No" H 5650 4970 60  0001 L CNN "Sense"
F 30 "~~" H 5650 4880 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5650 4790 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 5650 4700 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 5650 4610 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 5650 4520 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 5650 4430 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5650 4340 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 5650 4250 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 5650 4160 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5650 4070 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5650 3980 60  0001 L CNN "License"
	1    5650 7750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 5992E674
P 5650 8050
F 0 "#PWR02" H 5650 7800 50  0001 C CNN
F 1 "GND" H 5655 7877 50  0000 C CNN
F 2 "" H 5650 8050 50  0001 C CNN
F 3 "" H 5650 8050 50  0001 C CNN
	1    5650 8050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5992E91D
P 6700 7600
F 0 "#PWR03" H 6700 7350 50  0001 C CNN
F 1 "GND" H 6705 7427 50  0000 C CNN
F 2 "" H 6700 7600 50  0001 C CNN
F 3 "" H 6700 7600 50  0001 C CNN
	1    6700 7600
	1    0    0    -1  
$EndComp
Text Label 6750 7350 0    60   ~ 0
CLK_25MHZ
$Comp
L PLATED_HOLE2.0_PAD3.5 B1
U 1 1 59932F22
P 6500 9950
F 0 "B1" H 6600 9950 50  0000 C CNN
F 1 "PLATED_HOLE2.0_PAD3.5" H 6500 9780 60  0001 L CNN
F 2 "Pads:c350h200" H 6500 8970 60  0001 L CNN
F 3 "Undefined" H 6500 9600 60  0001 L CNN
F 4 "Plated Hole" H 6500 9510 60  0001 L CNN "Field4"
F 5 "PLATED_HOLE2.0_PAD3.5" H 6500 9510 60  0001 L CNN "Part Number"
F 6 "Single Terminal Socket" H 6500 9420 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6500 9330 60  0001 L CNN "Library Path"
F 8 "~~" H 6500 9240 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6500 9150 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6500 9060 60  0001 L CNN "Component Type"
F 11 "1" H 6500 8880 60  0001 L CNN "Pin Count"
F 12 "~~" H 6500 8790 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6500 8700 60  0001 L CNN "Footprint Path"
F 14 "c350h200" H 6500 8610 60  0001 L CNN "Footprint Ref"
F 15 "Plated Hole" H 6500 8520 60  0001 L CNN "Family"
F 16 "No" H 6500 8430 60  0001 L CNN "Mounted"
F 17 "No" H 6500 8340 60  0001 L CNN "Socket"
F 18 "No" H 6500 8250 60  0001 L CNN "SMD"
F 19 "No" H 6500 8160 60  0001 L CNN "Sense"
F 20 "~~" H 6500 8070 60  0001 L CNN "Sense Comment"
F 21 "None" H 6500 7980 60  0001 L CNN "Status"
F 22 "~~" H 6500 7890 60  0001 L CNN "Status Comment"
F 23 "~~" H 6500 7800 60  0001 L CNN "SCEM"
F 24 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 7710 60  0001 L CNN "Part Description"
F 25 "~~" H 6500 7620 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6500 7530 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6500 7440 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6500 7350 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6500 7260 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6500 7170 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6500 7080 60  0001 L CNN "HelpURL"
F 32 "~~" H 6500 6990 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6500 6900 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6500 6810 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6500 6720 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JMW" H 6500 6630 60  0001 L CNN "Author"
F 37 "11/05/09 00:00:00" H 6500 6540 60  0001 L CNN "CreateDate"
F 38 "11/05/09 00:00:00" H 6500 6450 60  0001 L CNN "LatestRevisionDate"
F 39 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 6360 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6500 6270 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6500 6180 60  0001 L CNN "License"
	1    6500 9950
	1    0    0    -1  
$EndComp
$Comp
L PLATED_HOLE2.0_PAD3.5 B2
U 1 1 599342E5
P 6500 10050
F 0 "B2" H 6600 10050 50  0000 C CNN
F 1 "PLATED_HOLE2.0_PAD3.5" H 6500 9880 60  0001 L CNN
F 2 "Pads:c350h200" H 6500 9070 60  0001 L CNN
F 3 "Undefined" H 6500 9700 60  0001 L CNN
F 4 "Plated Hole" H 6500 9610 60  0001 L CNN "Field4"
F 5 "PLATED_HOLE2.0_PAD3.5" H 6500 9610 60  0001 L CNN "Part Number"
F 6 "Single Terminal Socket" H 6500 9520 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6500 9430 60  0001 L CNN "Library Path"
F 8 "~~" H 6500 9340 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6500 9250 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6500 9160 60  0001 L CNN "Component Type"
F 11 "1" H 6500 8980 60  0001 L CNN "Pin Count"
F 12 "~~" H 6500 8890 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6500 8800 60  0001 L CNN "Footprint Path"
F 14 "c350h200" H 6500 8710 60  0001 L CNN "Footprint Ref"
F 15 "Plated Hole" H 6500 8620 60  0001 L CNN "Family"
F 16 "No" H 6500 8530 60  0001 L CNN "Mounted"
F 17 "No" H 6500 8440 60  0001 L CNN "Socket"
F 18 "No" H 6500 8350 60  0001 L CNN "SMD"
F 19 "No" H 6500 8260 60  0001 L CNN "Sense"
F 20 "~~" H 6500 8170 60  0001 L CNN "Sense Comment"
F 21 "None" H 6500 8080 60  0001 L CNN "Status"
F 22 "~~" H 6500 7990 60  0001 L CNN "Status Comment"
F 23 "~~" H 6500 7900 60  0001 L CNN "SCEM"
F 24 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 7810 60  0001 L CNN "Part Description"
F 25 "~~" H 6500 7720 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6500 7630 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6500 7540 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6500 7450 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6500 7360 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6500 7270 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6500 7180 60  0001 L CNN "HelpURL"
F 32 "~~" H 6500 7090 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6500 7000 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6500 6910 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6500 6820 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JMW" H 6500 6730 60  0001 L CNN "Author"
F 37 "11/05/09 00:00:00" H 6500 6640 60  0001 L CNN "CreateDate"
F 38 "11/05/09 00:00:00" H 6500 6550 60  0001 L CNN "LatestRevisionDate"
F 39 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 6460 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6500 6370 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6500 6280 60  0001 L CNN "License"
	1    6500 10050
	1    0    0    -1  
$EndComp
$Comp
L PLATED_HOLE2.0_PAD3.5 B3
U 1 1 599344FA
P 6500 10150
F 0 "B3" H 6600 10150 50  0000 C CNN
F 1 "PLATED_HOLE2.0_PAD3.5" H 6500 9980 60  0001 L CNN
F 2 "Pads:c350h200" H 6500 9170 60  0001 L CNN
F 3 "Undefined" H 6500 9800 60  0001 L CNN
F 4 "Plated Hole" H 6500 9710 60  0001 L CNN "Field4"
F 5 "PLATED_HOLE2.0_PAD3.5" H 6500 9710 60  0001 L CNN "Part Number"
F 6 "Single Terminal Socket" H 6500 9620 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6500 9530 60  0001 L CNN "Library Path"
F 8 "~~" H 6500 9440 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6500 9350 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6500 9260 60  0001 L CNN "Component Type"
F 11 "1" H 6500 9080 60  0001 L CNN "Pin Count"
F 12 "~~" H 6500 8990 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6500 8900 60  0001 L CNN "Footprint Path"
F 14 "c350h200" H 6500 8810 60  0001 L CNN "Footprint Ref"
F 15 "Plated Hole" H 6500 8720 60  0001 L CNN "Family"
F 16 "No" H 6500 8630 60  0001 L CNN "Mounted"
F 17 "No" H 6500 8540 60  0001 L CNN "Socket"
F 18 "No" H 6500 8450 60  0001 L CNN "SMD"
F 19 "No" H 6500 8360 60  0001 L CNN "Sense"
F 20 "~~" H 6500 8270 60  0001 L CNN "Sense Comment"
F 21 "None" H 6500 8180 60  0001 L CNN "Status"
F 22 "~~" H 6500 8090 60  0001 L CNN "Status Comment"
F 23 "~~" H 6500 8000 60  0001 L CNN "SCEM"
F 24 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 7910 60  0001 L CNN "Part Description"
F 25 "~~" H 6500 7820 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6500 7730 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6500 7640 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6500 7550 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6500 7460 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6500 7370 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6500 7280 60  0001 L CNN "HelpURL"
F 32 "~~" H 6500 7190 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6500 7100 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6500 7010 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6500 6920 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JMW" H 6500 6830 60  0001 L CNN "Author"
F 37 "11/05/09 00:00:00" H 6500 6740 60  0001 L CNN "CreateDate"
F 38 "11/05/09 00:00:00" H 6500 6650 60  0001 L CNN "LatestRevisionDate"
F 39 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 6560 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6500 6470 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6500 6380 60  0001 L CNN "License"
	1    6500 10150
	1    0    0    -1  
$EndComp
$Comp
L PLATED_HOLE2.0_PAD3.5 B4
U 1 1 59934715
P 6500 10250
F 0 "B4" H 6600 10250 50  0000 C CNN
F 1 "PLATED_HOLE2.0_PAD3.5" H 6500 10080 60  0001 L CNN
F 2 "Pads:c350h200" H 6500 9270 60  0001 L CNN
F 3 "Undefined" H 6500 9900 60  0001 L CNN
F 4 "Plated Hole" H 6500 9810 60  0001 L CNN "Field4"
F 5 "PLATED_HOLE2.0_PAD3.5" H 6500 9810 60  0001 L CNN "Part Number"
F 6 "Single Terminal Socket" H 6500 9720 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6500 9630 60  0001 L CNN "Library Path"
F 8 "~~" H 6500 9540 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6500 9450 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6500 9360 60  0001 L CNN "Component Type"
F 11 "1" H 6500 9180 60  0001 L CNN "Pin Count"
F 12 "~~" H 6500 9090 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6500 9000 60  0001 L CNN "Footprint Path"
F 14 "c350h200" H 6500 8910 60  0001 L CNN "Footprint Ref"
F 15 "Plated Hole" H 6500 8820 60  0001 L CNN "Family"
F 16 "No" H 6500 8730 60  0001 L CNN "Mounted"
F 17 "No" H 6500 8640 60  0001 L CNN "Socket"
F 18 "No" H 6500 8550 60  0001 L CNN "SMD"
F 19 "No" H 6500 8460 60  0001 L CNN "Sense"
F 20 "~~" H 6500 8370 60  0001 L CNN "Sense Comment"
F 21 "None" H 6500 8280 60  0001 L CNN "Status"
F 22 "~~" H 6500 8190 60  0001 L CNN "Status Comment"
F 23 "~~" H 6500 8100 60  0001 L CNN "SCEM"
F 24 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 8010 60  0001 L CNN "Part Description"
F 25 "~~" H 6500 7920 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6500 7830 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6500 7740 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6500 7650 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6500 7560 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6500 7470 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6500 7380 60  0001 L CNN "HelpURL"
F 32 "~~" H 6500 7290 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6500 7200 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6500 7110 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6500 7020 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JMW" H 6500 6930 60  0001 L CNN "Author"
F 37 "11/05/09 00:00:00" H 6500 6840 60  0001 L CNN "CreateDate"
F 38 "11/05/09 00:00:00" H 6500 6750 60  0001 L CNN "LatestRevisionDate"
F 39 "Plated Through Hole: Hole Dia.=2.0mm Pad Dia.=3.5mm" H 6500 6660 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6500 6570 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6500 6480 60  0001 L CNN "License"
	1    6500 10250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 59934D89
P 6350 10400
F 0 "#PWR04" H 6350 10150 50  0001 C CNN
F 1 "GND" H 6355 10227 50  0000 C CNN
F 2 "" H 6350 10400 50  0001 C CNN
F 3 "" H 6350 10400 50  0001 C CNN
	1    6350 10400
	1    0    0    -1  
$EndComp
$Sheet
S 7450 5650 1350 1350
U 5999986C
F0 "COMP_IN" 60
F1 "composite_input.sch" 60
F2 "CVBS_IN" I L 7450 5800 60 
F3 "SCL" B L 7450 6300 60 
F4 "SDA" B L 7450 6400 60 
F5 "VID_RESETN" I R 8800 6900 60 
F6 "VID_HS" O R 8800 5900 60 
F7 "VID_VS" O R 8800 6000 60 
F8 "VID_PCLK" O R 8800 5800 60 
F9 "VID_D0" O R 8800 6100 60 
F10 "VID_D1" O R 8800 6200 60 
F11 "VID_D2" O R 8800 6300 60 
F12 "VID_D3" O R 8800 6400 60 
F13 "VID_D4" O R 8800 6500 60 
F14 "VID_D5" O R 8800 6600 60 
F15 "VID_D6" O R 8800 6700 60 
F16 "VID_D7" O R 8800 6800 60 
$EndSheet
Text Label 13300 7650 0    60   ~ 0
CPU_RST_N
Text Label 9300 7250 2    60   ~ 0
CPU_RST_N
$Comp
L FIDUCIAL_TARGET_S100-200 FTG1
U 1 1 599436EB
P 6950 10050
F 0 "FTG1" H 7038 10050 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 6950 9900 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 6950 9090 60  0001 L CNN
F 3 "Undefined" H 6950 9720 60  0001 L CNN
F 4 "~~" H 6950 9630 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 6950 9630 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 6950 9540 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6950 9450 60  0001 L CNN "Library Path"
F 8 "~~" H 6950 9360 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6950 9270 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6950 9180 60  0001 L CNN "Component Type"
F 11 "1" H 6950 9000 60  0001 L CNN "Pin Count"
F 12 "~~" H 6950 8910 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6950 8820 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 6950 8730 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 6950 8640 60  0001 L CNN "Family"
F 16 "No" H 6950 8550 60  0001 L CNN "Mounted"
F 17 "No" H 6950 8460 60  0001 L CNN "Socket"
F 18 "Yes" H 6950 8370 60  0001 L CNN "SMD"
F 19 "No" H 6950 8280 60  0001 L CNN "Sense"
F 20 "~~" H 6950 8190 60  0001 L CNN "Sense Comment"
F 21 "None" H 6950 8100 60  0001 L CNN "Status"
F 22 "~~" H 6950 8010 60  0001 L CNN "Status Comment"
F 23 "~~" H 6950 7920 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 6950 7830 60  0001 L CNN "Part Description"
F 25 "~~" H 6950 7740 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6950 7650 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6950 7560 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6950 7470 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6950 7380 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6950 7290 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6950 7200 60  0001 L CNN "HelpURL"
F 32 "~~" H 6950 7110 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6950 7020 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6950 6930 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6950 6840 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 6950 6750 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 6950 6660 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 6950 6570 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 6950 6480 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6950 6390 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6950 6300 60  0001 L CNN "License"
	1    6950 10050
	1    0    0    -1  
$EndComp
$Comp
L FIDUCIAL_TARGET_S100-200 FTG2
U 1 1 599440AC
P 7350 10050
F 0 "FTG2" H 7438 10050 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 7350 9900 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 7350 9090 60  0001 L CNN
F 3 "Undefined" H 7350 9720 60  0001 L CNN
F 4 "~~" H 7350 9630 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 7350 9630 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 7350 9540 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 7350 9450 60  0001 L CNN "Library Path"
F 8 "~~" H 7350 9360 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 7350 9270 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 7350 9180 60  0001 L CNN "Component Type"
F 11 "1" H 7350 9000 60  0001 L CNN "Pin Count"
F 12 "~~" H 7350 8910 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 7350 8820 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 7350 8730 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 7350 8640 60  0001 L CNN "Family"
F 16 "No" H 7350 8550 60  0001 L CNN "Mounted"
F 17 "No" H 7350 8460 60  0001 L CNN "Socket"
F 18 "Yes" H 7350 8370 60  0001 L CNN "SMD"
F 19 "No" H 7350 8280 60  0001 L CNN "Sense"
F 20 "~~" H 7350 8190 60  0001 L CNN "Sense Comment"
F 21 "None" H 7350 8100 60  0001 L CNN "Status"
F 22 "~~" H 7350 8010 60  0001 L CNN "Status Comment"
F 23 "~~" H 7350 7920 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7350 7830 60  0001 L CNN "Part Description"
F 25 "~~" H 7350 7740 60  0001 L CNN "Manufacturer"
F 26 "~~" H 7350 7650 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 7350 7560 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 7350 7470 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 7350 7380 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 7350 7290 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 7350 7200 60  0001 L CNN "HelpURL"
F 32 "~~" H 7350 7110 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 7350 7020 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 7350 6930 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 7350 6840 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 7350 6750 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 7350 6660 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 7350 6570 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7350 6480 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 7350 6390 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7350 6300 60  0001 L CNN "License"
	1    7350 10050
	1    0    0    -1  
$EndComp
$Comp
L FIDUCIAL_TARGET_S100-200 FTG6
U 1 1 599443FB
P 7350 10350
F 0 "FTG6" H 7438 10350 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 7350 10200 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 7350 9390 60  0001 L CNN
F 3 "Undefined" H 7350 10020 60  0001 L CNN
F 4 "~~" H 7350 9930 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 7350 9930 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 7350 9840 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 7350 9750 60  0001 L CNN "Library Path"
F 8 "~~" H 7350 9660 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 7350 9570 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 7350 9480 60  0001 L CNN "Component Type"
F 11 "1" H 7350 9300 60  0001 L CNN "Pin Count"
F 12 "~~" H 7350 9210 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 7350 9120 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 7350 9030 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 7350 8940 60  0001 L CNN "Family"
F 16 "No" H 7350 8850 60  0001 L CNN "Mounted"
F 17 "No" H 7350 8760 60  0001 L CNN "Socket"
F 18 "Yes" H 7350 8670 60  0001 L CNN "SMD"
F 19 "No" H 7350 8580 60  0001 L CNN "Sense"
F 20 "~~" H 7350 8490 60  0001 L CNN "Sense Comment"
F 21 "None" H 7350 8400 60  0001 L CNN "Status"
F 22 "~~" H 7350 8310 60  0001 L CNN "Status Comment"
F 23 "~~" H 7350 8220 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7350 8130 60  0001 L CNN "Part Description"
F 25 "~~" H 7350 8040 60  0001 L CNN "Manufacturer"
F 26 "~~" H 7350 7950 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 7350 7860 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 7350 7770 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 7350 7680 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 7350 7590 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 7350 7500 60  0001 L CNN "HelpURL"
F 32 "~~" H 7350 7410 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 7350 7320 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 7350 7230 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 7350 7140 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 7350 7050 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 7350 6960 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 7350 6870 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7350 6780 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 7350 6690 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7350 6600 60  0001 L CNN "License"
	1    7350 10350
	1    0    0    -1  
$EndComp
$Comp
L FIDUCIAL_TARGET_S100-200 FTG5
U 1 1 59944748
P 6950 10350
F 0 "FTG5" H 7038 10350 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 6950 10200 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 6950 9390 60  0001 L CNN
F 3 "Undefined" H 6950 10020 60  0001 L CNN
F 4 "~~" H 6950 9930 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 6950 9930 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 6950 9840 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 6950 9750 60  0001 L CNN "Library Path"
F 8 "~~" H 6950 9660 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 6950 9570 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 6950 9480 60  0001 L CNN "Component Type"
F 11 "1" H 6950 9300 60  0001 L CNN "Pin Count"
F 12 "~~" H 6950 9210 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 6950 9120 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 6950 9030 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 6950 8940 60  0001 L CNN "Family"
F 16 "No" H 6950 8850 60  0001 L CNN "Mounted"
F 17 "No" H 6950 8760 60  0001 L CNN "Socket"
F 18 "Yes" H 6950 8670 60  0001 L CNN "SMD"
F 19 "No" H 6950 8580 60  0001 L CNN "Sense"
F 20 "~~" H 6950 8490 60  0001 L CNN "Sense Comment"
F 21 "None" H 6950 8400 60  0001 L CNN "Status"
F 22 "~~" H 6950 8310 60  0001 L CNN "Status Comment"
F 23 "~~" H 6950 8220 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 6950 8130 60  0001 L CNN "Part Description"
F 25 "~~" H 6950 8040 60  0001 L CNN "Manufacturer"
F 26 "~~" H 6950 7950 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 6950 7860 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 6950 7770 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 6950 7680 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 6950 7590 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 6950 7500 60  0001 L CNN "HelpURL"
F 32 "~~" H 6950 7410 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 6950 7320 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 6950 7230 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 6950 7140 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 6950 7050 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 6950 6960 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 6950 6870 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 6950 6780 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 6950 6690 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6950 6600 60  0001 L CNN "License"
	1    6950 10350
	1    0    0    -1  
$EndComp
$Comp
L FIDUCIAL_TARGET_S100-200 FTG4
U 1 1 59944A9B
P 7750 10350
F 0 "FTG4" H 7838 10350 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 7750 10200 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 7750 9390 60  0001 L CNN
F 3 "Undefined" H 7750 10020 60  0001 L CNN
F 4 "~~" H 7750 9930 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 7750 9930 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 7750 9840 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 7750 9750 60  0001 L CNN "Library Path"
F 8 "~~" H 7750 9660 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 7750 9570 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 7750 9480 60  0001 L CNN "Component Type"
F 11 "1" H 7750 9300 60  0001 L CNN "Pin Count"
F 12 "~~" H 7750 9210 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 7750 9120 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 7750 9030 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 7750 8940 60  0001 L CNN "Family"
F 16 "No" H 7750 8850 60  0001 L CNN "Mounted"
F 17 "No" H 7750 8760 60  0001 L CNN "Socket"
F 18 "Yes" H 7750 8670 60  0001 L CNN "SMD"
F 19 "No" H 7750 8580 60  0001 L CNN "Sense"
F 20 "~~" H 7750 8490 60  0001 L CNN "Sense Comment"
F 21 "None" H 7750 8400 60  0001 L CNN "Status"
F 22 "~~" H 7750 8310 60  0001 L CNN "Status Comment"
F 23 "~~" H 7750 8220 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7750 8130 60  0001 L CNN "Part Description"
F 25 "~~" H 7750 8040 60  0001 L CNN "Manufacturer"
F 26 "~~" H 7750 7950 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 7750 7860 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 7750 7770 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 7750 7680 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 7750 7590 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 7750 7500 60  0001 L CNN "HelpURL"
F 32 "~~" H 7750 7410 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 7750 7320 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 7750 7230 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 7750 7140 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 7750 7050 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 7750 6960 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 7750 6870 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7750 6780 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 7750 6690 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7750 6600 60  0001 L CNN "License"
	1    7750 10350
	1    0    0    -1  
$EndComp
$Comp
L FIDUCIAL_TARGET_S100-200 FTG3
U 1 1 59944DEC
P 7750 10050
F 0 "FTG3" H 7838 10050 50  0000 L CNN
F 1 "FIDUCIAL_TARGET_S100-200" H 7750 9900 60  0001 L CNN
F 2 "Pads:FIDUCIAL_TOP_S100-200" H 7750 9090 60  0001 L CNN
F 3 "Undefined" H 7750 9720 60  0001 L CNN
F 4 "~~" H 7750 9630 60  0001 L CNN "Field4"
F 5 "FIDUCIAL_TARGET_S100-200" H 7750 9630 60  0001 L CNN "Part Number"
F 6 "Fiducial Target" H 7750 9540 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Pads.SchLib" H 7750 9450 60  0001 L CNN "Library Path"
F 8 "~~" H 7750 9360 60  0001 L CNN "Comment"
F 9 "Standard (No BOM)" H 7750 9270 60  0001 L CNN "Component Kind"
F 10 "Standard (No BOM)" H 7750 9180 60  0001 L CNN "Component Type"
F 11 "1" H 7750 9000 60  0001 L CNN "Pin Count"
F 12 "~~" H 7750 8910 60  0001 L CNN "Case"
F 13 "PcbLib\\Pads.PcbLib" H 7750 8820 60  0001 L CNN "Footprint Path"
F 14 "FIDUCIAL_TOP_S100-200" H 7750 8730 60  0001 L CNN "Footprint Ref"
F 15 "Fiducial" H 7750 8640 60  0001 L CNN "Family"
F 16 "No" H 7750 8550 60  0001 L CNN "Mounted"
F 17 "No" H 7750 8460 60  0001 L CNN "Socket"
F 18 "Yes" H 7750 8370 60  0001 L CNN "SMD"
F 19 "No" H 7750 8280 60  0001 L CNN "Sense"
F 20 "~~" H 7750 8190 60  0001 L CNN "Sense Comment"
F 21 "None" H 7750 8100 60  0001 L CNN "Status"
F 22 "~~" H 7750 8010 60  0001 L CNN "Status Comment"
F 23 "~~" H 7750 7920 60  0001 L CNN "SCEM"
F 24 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7750 7830 60  0001 L CNN "Part Description"
F 25 "~~" H 7750 7740 60  0001 L CNN "Manufacturer"
F 26 "~~" H 7750 7650 60  0001 L CNN "Manufacturer Part Number"
F 27 "0mm" H 7750 7560 60  0001 L CNN "ComponentHeight"
F 28 "~~" H 7750 7470 60  0001 L CNN "Manufacturer1 Example"
F 29 "~~" H 7750 7380 60  0001 L CNN "Manufacturer1 Part Number"
F 30 "~~" H 7750 7290 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 31 "Undefined" H 7750 7200 60  0001 L CNN "HelpURL"
F 32 "~~" H 7750 7110 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 7750 7020 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 7750 6930 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 7750 6840 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 7750 6750 60  0001 L CNN "Author"
F 37 "02/09/10 00:00:00" H 7750 6660 60  0001 L CNN "CreateDate"
F 38 "04/04/12 00:00:00" H 7750 6570 60  0001 L CNN "LatestRevisionDate"
F 39 "Square Fiducial Target, Top Layer, 1.0mm, Top Solder 2.0mm, Keepout =2.0mm" H 7750 6480 60  0001 L CNN "PackageDescription"
F 40 "Pads" H 7750 6390 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7750 6300 60  0001 L CNN "License"
	1    7750 10050
	1    0    0    -1  
$EndComp
Text Label 7150 6300 0    60   ~ 0
SCL
Text Label 7150 6400 0    60   ~ 0
SDA
Text Label 8950 5100 0    60   ~ 0
SCL
Text Label 8950 5200 0    60   ~ 0
SDA
$Comp
L IOH CN5
U 1 1 5994E05C
P 3650 4750
F 0 "CN5" H 3694 3585 50  0000 C CNN
F 1 "IOH" H 3650 3560 60  0001 L CNN
F 2 "" H 3650 3470 60  0001 L CNN
F 3 "" H 3650 3380 60  0001 L CNN
F 4 "Yes" H 3650 3290 60  0001 L CNN "Field4"
F 5 "IOH" H 3694 3676 50  0000 C CNN "Field5"
	1    3650 4750
	-1   0    0    1   
$EndComp
$Comp
L IOL CN7
U 1 1 5994E87B
P 3650 6250
F 0 "CN7" H 3694 5271 50  0000 C CNN
F 1 "IOL" H 3650 5260 60  0001 L CNN
F 2 "" H 3650 5170 60  0001 L CNN
F 3 "" H 3650 5080 60  0001 L CNN
F 4 "Value" H 3650 6250 60  0001 C CNN "Fieldname"
F 5 "Yes" H 3650 4990 60  0001 L CNN "Field4"
F 6 "IOL" H 3694 5370 60  0000 C CNN "Field5"
	1    3650 6250
	-1   0    0    1   
$EndComp
$Comp
L POWER_UNO CN6
U 1 1 5994EDEB
P 2350 4550
F 0 "CN6" H 2393 3677 50  0000 C CNN
F 1 "POWER_UNO" H 2350 3560 60  0001 L CNN
F 2 "" H 2350 3470 60  0001 L CNN
F 3 "" H 2350 3380 60  0001 L CNN
F 4 "Yes" H 2350 3290 60  0001 L CNN "Field4"
F 5 "POWER" H 2350 3200 60  0001 L CNN "Field5"
	1    2350 4550
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 CN10
U 1 1 5994F8EB
P 6450 5850
F 0 "CN10" H 6369 5575 50  0000 C CNN
F 1 "CVBS In" H 6369 5666 50  0000 C CNN
F 2 "" H 6450 5850 50  0001 C CNN
F 3 "" H 6450 5850 50  0001 C CNN
	1    6450 5850
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR05
U 1 1 5995A62E
P 6750 6050
F 0 "#PWR05" H 6750 5800 50  0001 C CNN
F 1 "GNDA" H 6755 5877 50  0000 C CNN
F 2 "" H 6750 6050 50  0001 C CNN
F 3 "" H 6750 6050 50  0001 C CNN
	1    6750 6050
	1    0    0    -1  
$EndComp
$Comp
L MBR0530PbF D9
U 1 1 5995E5F7
P 1300 4150
F 0 "D9" V 1496 4060 50  0000 R CNN
F 1 "MBR0530PbF" V 1405 4060 50  0000 R CNN
F 2 "ICs And Semiconductors SMD:SOD3715X145N" H 1300 3010 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 1300 3730 60  0001 L CNN
F 4 "MBR0530PbF" H 1300 3640 60  0001 L CNN "Part Number"
F 5 "Diode Schottky" H 1300 3550 60  0001 L CNN "Library Ref"
F 6 "SchLib\\Diodes.SchLib" H 1300 3460 60  0001 L CNN "Library Path"
F 7 "=Device" H 1300 3370 60  0001 L CNN "Comment"
F 8 "Standard" H 1300 3280 60  0001 L CNN "Component Kind"
F 9 "Standard" H 1300 3190 60  0001 L CNN "Component Type"
F 10 "MBR0530PbF" H 1300 3100 60  0001 L CNN "Device"
F 11 "SOD Diode (SOD-123); 2.70mm W X 1.55mm L X 1.45mm H body, IPC Medium Density" H 1300 2920 60  0001 L CNN "PackageDescription"
F 12 "30V" H 1300 2830 60  0001 L CNN "Voltage"
F 13 "500mA" H 1300 2740 60  0001 L CNN "Power"
F 14 "~~" H 1300 2650 60  0001 L CNN "Status"
F 15 "Schottky Diode" H 1300 2560 60  0001 L CNN "Part Description"
F 16 "VISHAY HIGH POWER PRODUCTS" H 1300 2470 60  0001 L CNN "Manufacturer"
F 17 "MBR0530PbF" H 1300 2380 60  0001 L CNN "Manufacturer Part Number"
F 18 "2" H 1300 2290 60  0001 L CNN "Pin Count"
F 19 "SOD-123" H 1300 2200 60  0001 L CNN "Case"
F 20 "Yes" H 1300 2110 60  0001 L CNN "Mounted"
F 21 "No" H 1300 2020 60  0001 L CNN "Socket"
F 22 "Yes" H 1300 1930 60  0001 L CNN "SMD"
F 23 "No" H 1300 1840 60  0001 L CNN "PressFit"
F 24 "No" H 1300 1750 60  0001 L CNN "Sense"
F 25 "~~" H 1300 1660 60  0001 L CNN "Sense Comment"
F 26 "No" H 1300 1570 60  0001 L CNN "Bonding"
F 27 "~~" H 1300 1480 60  0001 L CNN "Status Comment"
F 28 "1.45mm" H 1300 1390 60  0001 L CNN "ComponentHeight"
F 29 "PcbLib\\ICs And Semiconductors SMD.PcbLib" H 1300 1300 60  0001 L CNN "Footprint Path"
F 30 "SOD3715X145N" H 1300 1210 60  0001 L CNN "Footprint Ref"
F 31 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 1300 1120 60  0001 L CNN "HelpURL"
F 32 "~~" H 1300 1030 60  0001 L CNN "ComponentLink1URL"
F 33 "~~" H 1300 940 60  0001 L CNN "ComponentLink1Description"
F 34 "~~" H 1300 850 60  0001 L CNN "ComponentLink2URL"
F 35 "~~" H 1300 760 60  0001 L CNN "ComponentLink2Description"
F 36 "CERN DEM JLC" H 1300 670 60  0001 L CNN "Author"
F 37 "01/26/10 00:00:00" H 1300 580 60  0001 L CNN "CreateDate"
F 38 "01/26/10 00:00:00" H 1300 490 60  0001 L CNN "LatestRevisionDate"
F 39 "ICs And Semiconductors SMD" H 1300 400 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1300 310 60  0001 L CNN "License"
	1    1300 4150
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR06
U 1 1 59963732
P 1300 3850
F 0 "#PWR06" H 1300 3700 50  0001 C CNN
F 1 "+5V" H 1315 4023 50  0000 C CNN
F 2 "" H 1300 3850 50  0001 C CNN
F 3 "" H 1300 3850 50  0001 C CNN
	1    1300 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5996428F
P 1850 4700
F 0 "#PWR07" H 1850 4450 50  0001 C CNN
F 1 "GND" H 1855 4527 50  0000 C CNN
F 2 "" H 1850 4700 50  0001 C CNN
F 3 "" H 1850 4700 50  0001 C CNN
	1    1850 4700
	1    0    0    -1  
$EndComp
Wire Notes Line
	700  10400 700  11100
Wire Notes Line
	700  11100 3100 11100
Wire Notes Line
	3100 11100 3100 10400
Wire Notes Line
	3100 10400 700  10400
Wire Wire Line
	5650 7200 5650 7750
Connection ~ 5650 7550
Connection ~ 5650 7350
Wire Wire Line
	6650 7550 6700 7550
Wire Wire Line
	6700 7550 6700 7600
Wire Wire Line
	6650 7350 8700 7350
Wire Wire Line
	6500 9950 6350 9950
Wire Wire Line
	6350 9950 6350 10400
Wire Wire Line
	6500 10250 6350 10250
Connection ~ 6350 10250
Wire Wire Line
	6350 10150 6500 10150
Connection ~ 6350 10150
Wire Wire Line
	6500 10050 6350 10050
Connection ~ 6350 10050
Wire Wire Line
	8800 5800 9450 5800
Wire Wire Line
	8800 5900 9450 5900
Wire Wire Line
	8800 6000 9450 6000
Wire Wire Line
	8800 6100 9450 6100
Wire Wire Line
	8800 6200 9450 6200
Wire Wire Line
	8800 6300 9450 6300
Wire Wire Line
	8800 6400 9450 6400
Wire Wire Line
	8800 6500 9450 6500
Wire Wire Line
	8800 6600 9450 6600
Wire Wire Line
	8800 6700 9450 6700
Wire Wire Line
	8800 6800 9450 6800
Wire Wire Line
	8800 6900 9450 6900
Wire Wire Line
	11200 6350 11700 6350
Wire Wire Line
	11200 6450 11700 6450
Wire Wire Line
	11200 6550 11700 6550
Wire Wire Line
	11200 6650 11700 6650
Wire Wire Line
	11200 6750 11700 6750
Wire Wire Line
	11200 6850 11700 6850
Wire Wire Line
	11200 6950 11700 6950
Wire Wire Line
	11200 5750 11700 5750
Wire Bus Line
	11200 5850 11700 5850
Wire Bus Line
	11200 5950 11700 5950
Wire Bus Line
	11200 6050 11700 6050
Wire Bus Line
	11200 6150 11700 6150
Wire Bus Line
	11200 6250 11700 6250
Wire Wire Line
	11200 7650 11700 7650
Wire Wire Line
	11200 7750 11700 7750
Wire Wire Line
	11200 7850 11700 7850
Wire Wire Line
	11200 7950 11700 7950
Wire Wire Line
	11200 8050 11700 8050
Wire Wire Line
	11200 8150 11700 8150
Wire Wire Line
	13150 7650 13800 7650
Wire Wire Line
	9450 7250 8700 7250
Wire Wire Line
	9450 2900 9200 2900
Wire Wire Line
	9200 2900 9200 3850
Wire Wire Line
	9200 3850 9450 3850
Wire Wire Line
	9300 3750 9450 3750
Wire Wire Line
	9300 3000 9300 3750
Wire Wire Line
	9300 3000 9450 3000
Wire Wire Line
	8800 4100 9450 4100
Wire Wire Line
	8800 4200 9450 4200
Wire Wire Line
	8800 4300 9450 4300
Wire Wire Line
	8800 4400 9450 4400
Wire Wire Line
	8800 4500 9450 4500
Wire Wire Line
	8800 4600 9450 4600
Wire Wire Line
	8800 4700 9450 4700
Wire Wire Line
	8800 4800 9450 4800
Wire Wire Line
	8800 4900 9450 4900
Wire Wire Line
	8800 5000 9450 5000
Wire Wire Line
	8800 5100 9450 5100
Wire Wire Line
	8800 5200 9450 5200
Wire Wire Line
	8700 7350 8700 7450
Wire Wire Line
	8700 7450 9450 7450
Wire Wire Line
	7450 6300 7050 6300
Wire Wire Line
	7450 6400 7050 6400
Wire Wire Line
	7450 5800 6650 5800
Wire Wire Line
	6650 5900 6750 5900
Wire Wire Line
	6750 5900 6750 6050
Wire Wire Line
	2050 4250 1300 4250
Wire Wire Line
	1300 4250 1300 4150
Wire Wire Line
	2050 4350 1850 4350
Wire Wire Line
	1850 4350 1850 4700
Wire Wire Line
	2050 4450 1850 4450
Connection ~ 1850 4450
NoConn ~ 2050 3850
NoConn ~ 2050 3950
NoConn ~ 2050 4050
NoConn ~ 2050 4150
NoConn ~ 2050 4550
Text Label 4100 3850 0    60   ~ 0
SCL
Text Label 4100 3950 0    60   ~ 0
SDA
Wire Wire Line
	3950 3850 4600 3850
Wire Wire Line
	3950 3950 4600 3950
$Comp
L GND #PWR08
U 1 1 599708A5
P 4050 4850
F 0 "#PWR08" H 4050 4600 50  0001 C CNN
F 1 "GND" H 4055 4677 50  0000 C CNN
F 2 "" H 4050 4850 50  0001 C CNN
F 3 "" H 4050 4850 50  0001 C CNN
	1    4050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4850 4050 4150
Wire Wire Line
	4050 4150 3950 4150
Wire Wire Line
	3950 4250 4600 4250
Wire Wire Line
	3950 4350 4600 4350
Wire Wire Line
	3950 4450 4600 4450
Wire Wire Line
	3950 4550 4600 4550
NoConn ~ 3950 4050
NoConn ~ 3950 4650
NoConn ~ 3950 4750
Text Label 4150 4250 0    60   ~ 0
HOST_A0
Text Label 4150 4350 0    60   ~ 0
HOST_WE
Text Label 4150 4450 0    60   ~ 0
HOST_RD
Text Label 4150 4550 0    60   ~ 0
HOST_CS
Wire Wire Line
	3950 5550 4600 5550
Wire Wire Line
	3950 5650 4600 5650
Wire Wire Line
	3950 5750 4600 5750
Wire Wire Line
	3950 5850 4600 5850
Wire Wire Line
	3950 5950 4600 5950
Wire Wire Line
	3950 6050 4600 6050
Wire Wire Line
	3950 6150 4600 6150
Wire Wire Line
	3950 6250 4600 6250
Text Label 4050 5550 0    60   ~ 0
HOST_D7
Text Label 4050 5650 0    60   ~ 0
HOST_D6
Text Label 4050 5750 0    60   ~ 0
HOST_D5
Text Label 4050 5850 0    60   ~ 0
HOST_D4
Text Label 4050 5950 0    60   ~ 0
HOST_D3
Text Label 4050 6050 0    60   ~ 0
HOST_D2
Text Label 4050 6150 0    60   ~ 0
HOST_D1
Text Label 4050 6250 0    60   ~ 0
HOST_D0
$Comp
L AD CN8
U 1 1 5997B8AD
P 2350 5550
F 0 "CN8" H 2350 5800 50  0000 L CNN
F 1 "AD" H 2350 4860 60  0001 L CNN
F 2 "" H 2350 4770 60  0001 L CNN
F 3 "" H 2350 4680 60  0001 L CNN
F 4 "Value" H 2350 5550 60  0001 C CNN "Fieldname"
F 5 "Yes" H 2350 4590 60  0001 L CNN "Field4"
F 6 "AD" H 2400 5700 60  0000 L CNN "Field5"
	1    2350 5550
	1    0    0    -1  
$EndComp
NoConn ~ 2050 5550
NoConn ~ 2050 5650
NoConn ~ 2050 5750
NoConn ~ 2050 5850
NoConn ~ 2050 5950
NoConn ~ 2050 6050
$Sheet
S 11700 3950 1450 1450
U 599286D8
F0 "CONN" 60
F1 "dsi_connectors.sch" 60
F2 "DSI_L0_P" I L 11700 4150 60 
F3 "DSI_L0_N" I L 11700 4250 60 
F4 "DSI_L1_P" I L 11700 4350 60 
F5 "DSI_L1_N" I L 11700 4450 60 
F6 "DSI_L2_P" I L 11700 4550 60 
F7 "DSI_L2_N" I L 11700 4650 60 
F8 "DSI_L3_P" I L 11700 4750 60 
F9 "DSI_L3_N" I L 11700 4850 60 
F10 "DSI_CLK_P" I L 11700 4950 60 
F11 "DSI_CLK_N" I L 11700 5050 60 
F12 "LCD_BL_A" U R 13150 4150 60 
F13 "LCD_BL_FB" U R 13150 4250 60 
F14 "DSI_RESET_N" I L 11700 5150 60 
F15 "DSI_GPIO0" I L 11700 5250 60 
F16 "DSI_GPIO1" I L 11700 5350 60 
$EndSheet
Wire Wire Line
	11200 4150 11700 4150
Wire Wire Line
	11200 4250 11700 4250
Wire Wire Line
	11200 4350 11700 4350
Wire Wire Line
	11200 4450 11700 4450
Wire Wire Line
	11200 4550 11700 4550
Wire Wire Line
	11200 4650 11700 4650
Wire Wire Line
	11200 4750 11700 4750
Wire Wire Line
	11200 4850 11700 4850
Wire Wire Line
	11200 4950 11700 4950
Wire Wire Line
	11200 5050 11700 5050
Wire Wire Line
	11200 5150 11700 5150
Wire Wire Line
	11200 5250 11700 5250
Wire Wire Line
	11200 5350 11700 5350
Wire Wire Line
	11200 2850 13400 2850
Wire Wire Line
	13400 2850 13400 4150
Wire Wire Line
	13400 4150 13150 4150
Wire Wire Line
	11200 2950 13500 2950
Wire Wire Line
	13500 2950 13500 4250
Wire Wire Line
	13500 4250 13150 4250
Wire Notes Line
	5950 10800 8400 10800
Wire Notes Line
	8400 10800 8400 9500
Wire Notes Line
	8400 9500 5950 9500
Wire Notes Line
	5950 9500 5950 10800
Text Notes 6100 9650 0    60   ~ 0
Mounting holes & fiducials
Wire Notes Line
	1150 3400 4850 3400
Wire Notes Line
	4850 3400 4850 6650
Wire Notes Line
	4850 6650 1150 6650
Wire Notes Line
	1150 6650 1150 3400
Text Notes 1250 3550 0    60   ~ 0
Arduino I/O headers\n
$EndSCHEMATC
