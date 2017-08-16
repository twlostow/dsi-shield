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
$Descr A4 11693 8268
encoding utf-8
Sheet 13 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_02X13 CN2
U 1 1 5992BEF4
P 6450 2050
F 0 "CN2" H 6450 2865 50  0000 C CNN
F 1 "AX3E41264" H 6450 2774 50  0000 C CNN
F 2 "" H 6450 900 50  0001 C CNN
F 3 "" H 6450 900 50  0001 C CNN
	1    6450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1450 6100 1450
Wire Wire Line
	6100 1450 6100 2850
Wire Wire Line
	6200 1750 6100 1750
Connection ~ 6100 1750
Wire Wire Line
	6200 2050 6100 2050
Connection ~ 6100 2050
Wire Wire Line
	6200 2350 6100 2350
Connection ~ 6100 2350
Wire Wire Line
	6200 2650 6100 2650
Connection ~ 6100 2650
Text Label 6900 1450 0    60   ~ 0
LCD_BL_A
Text Label 6900 1550 0    60   ~ 0
LCD_BL_FB
$Comp
L R0603_10R_1%_0.1W_200PPM R1
U 1 1 5992DD51
P 7500 1550
F 0 "R1" H 7650 1853 50  0000 C CNN
F 1 "R0603_10R_1%_0.1W_200PPM" H 7500 1340 60  0001 L CNN
F 2 "RESC1608X55N" H 7500 530 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7500 1160 60  0001 L CNN
F 4 "Value" H 7500 1550 60  0001 C CNN "Fieldname"
F 5 "10" H 7650 1762 50  0000 C CNN "~"
F 6 "R0603_10R_1%_0.1W_200PPM" H 7500 1070 60  0001 L CNN "Part Number"
F 7 "Resistor - 1%" H 7500 980 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Resistors.SchLib" H 7500 890 60  0001 L CNN "Library Path"
F 9 "=Value" H 7500 800 60  0001 L CNN "Comment"
F 10 "Standard" H 7500 710 60  0001 L CNN "Component Kind"
F 11 "Standard" H 7500 620 60  0001 L CNN "Component Type"
F 12 "~~" H 7500 440 60  0001 L CNN "PackageDescription"
F 13 "2" H 7500 350 60  0001 L CNN "Pin Count"
F 14 "PcbLib\\Resistors SMD.PcbLib" H 7500 260 60  0001 L CNN "Footprint Path"
F 15 "RESC1608X55N" H 7500 170 60  0001 L CNN "Footprint Ref"
F 16 "10" H 7500 80  60  0001 L CNN "Val"
F 17 "Preferred" H 7500 -10 60  0001 L CNN "Status"
F 18 "0.1W" H 7500 -100 60  0001 L CNN "Power"
F 19 "±200ppm/°C" H 7500 -190 60  0001 L CNN "TC"
F 20 "~~" H 7500 -280 60  0001 L CNN "Voltage"
F 21 "±1%" H 7500 -370 60  0001 L CNN "Tolerance"
F 22 "General Purpose Thick Film Chip Resistor" H 7500 -460 60  0001 L CNN "Part Description"
F 23 "GENERIC" H 7500 -550 60  0001 L CNN "Manufacturer"
F 24 "R0603_10R_1%_0.1W_200PPM" H 7500 -640 60  0001 L CNN "Manufacturer Part Number"
F 25 "0603" H 7500 -730 60  0001 L CNN "Case"
F 26 "No" H 7500 -820 60  0001 L CNN "PressFit"
F 27 "No" H 7650 1663 60  0000 C CNN "Mounted"
F 28 "~~" H 7500 -1000 60  0001 L CNN "Sense Comment"
F 29 "No" H 7500 -1090 60  0001 L CNN "Sense"
F 30 "~~" H 7500 -1180 60  0001 L CNN "Status Comment"
F 31 "No" H 7500 -1270 60  0001 L CNN "Socket"
F 32 "Yes" H 7500 -1360 60  0001 L CNN "SMD"
F 33 "~~" H 7500 -1450 60  0001 L CNN "ComponentHeight"
F 34 "NIC COMPONENT" H 7500 -1540 60  0001 L CNN "Manufacturer1 Example"
F 35 "NRC06F10R0TRF" H 7500 -1630 60  0001 L CNN "Manufacturer1 Part Number"
F 36 "0.55mm" H 7500 -1720 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 37 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7500 -1810 60  0001 L CNN "HelpURL"
F 38 "CERN DEM JLC" H 7500 -1900 60  0001 L CNN "Author"
F 39 "12/03/07 00:00:00" H 7500 -1990 60  0001 L CNN "CreateDate"
F 40 "06/24/09 00:00:00" H 7500 -2080 60  0001 L CNN "LatestRevisionDate"
F 41 "Resistors SMD" H 7500 -2170 60  0001 L CNN "Library Name"
F 42 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7500 -2260 60  0001 L CNN "License"
	1    7500 1550
	1    0    0    -1  
$EndComp
$Comp
L LCD_PVDRV #PWR0132
U 1 1 5992E116
P 6900 1650
F 0 "#PWR0132" H 6900 1500 50  0001 C CNN
F 1 "LCD_PVDRV" V 6915 1778 50  0000 L CNN
F 2 "" H 6900 1650 50  0001 C CNN
F 3 "" H 6900 1650 50  0001 C CNN
	1    6900 1650
	0    1    1    0   
$EndComp
$Comp
L +1V8 #PWR0133
U 1 1 5992E6B7
P 6900 1750
F 0 "#PWR0133" H 6900 1600 50  0001 C CNN
F 1 "+1V8" V 6915 1878 50  0000 L CNN
F 2 "" H 6900 1750 50  0001 C CNN
F 3 "" H 6900 1750 50  0001 C CNN
	1    6900 1750
	0    1    1    0   
$EndComp
NoConn ~ 6700 1850
Text Label 6900 1950 0    60   ~ 0
DSI_RESET_N
NoConn ~ 6700 2050
$Comp
L +1V8 #PWR0134
U 1 1 5992E849
P 6900 2150
F 0 "#PWR0134" H 6900 2000 50  0001 C CNN
F 1 "+1V8" V 6915 2278 50  0000 L CNN
F 2 "" H 6900 2150 50  0001 C CNN
F 3 "" H 6900 2150 50  0001 C CNN
	1    6900 2150
	0    1    1    0   
$EndComp
NoConn ~ 6700 2250
Wire Wire Line
	6700 2350 6800 2350
Wire Wire Line
	6800 2350 6800 2850
Wire Wire Line
	6800 2850 6100 2850
Wire Wire Line
	6700 2650 6800 2650
Connection ~ 6800 2650
Wire Wire Line
	6700 2450 7400 2450
Wire Wire Line
	6700 2550 7400 2550
Wire Wire Line
	6700 1450 7500 1450
Wire Wire Line
	7500 1550 6700 1550
Wire Wire Line
	6700 1650 6900 1650
Wire Wire Line
	6700 1750 6900 1750
Wire Wire Line
	6700 1950 7500 1950
Wire Wire Line
	6700 2150 6900 2150
$Comp
L R0603_3K3_1%_0.1W_100PPM R2
U 1 1 599346A2
P 7500 1950
F 0 "R2" H 7650 2147 50  0000 C CNN
F 1 "R0603_3K3_1%_0.1W_100PPM" H 7500 1740 60  0001 L CNN
F 2 "RESC1608X55N" H 7500 930 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7500 1560 60  0001 L CNN
F 4 "3k3" H 7650 2056 50  0000 C CNN "~"
F 5 "R0603_3K3_1%_0.1W_100PPM" H 7500 1470 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 7500 1380 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 7500 1290 60  0001 L CNN "Library Path"
F 8 "=Value" H 7500 1200 60  0001 L CNN "Comment"
F 9 "Standard" H 7500 1110 60  0001 L CNN "Component Kind"
F 10 "Standard" H 7500 1020 60  0001 L CNN "Component Type"
F 11 "~~" H 7500 840 60  0001 L CNN "PackageDescription"
F 12 "2" H 7500 750 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 7500 660 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 7500 570 60  0001 L CNN "Footprint Ref"
F 15 "3k3" H 7500 480 60  0001 L CNN "Val"
F 16 "Preferred" H 7500 390 60  0001 L CNN "Status"
F 17 "0.1W" H 7500 300 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 7500 210 60  0001 L CNN "TC"
F 19 "~~" H 7500 120 60  0001 L CNN "Voltage"
F 20 "±1%" H 7500 30  60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 7500 -60 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 7500 -150 60  0001 L CNN "Manufacturer"
F 23 "R0603_3K3_1%_0.1W_100PPM" H 7500 -240 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 7500 -330 60  0001 L CNN "Case"
F 25 "No" H 7500 -420 60  0001 L CNN "PressFit"
F 26 "Yes" H 7500 -510 60  0001 L CNN "Mounted"
F 27 "~~" H 7500 -600 60  0001 L CNN "Sense Comment"
F 28 "No" H 7500 -690 60  0001 L CNN "Sense"
F 29 "~~" H 7500 -780 60  0001 L CNN "Status Comment"
F 30 "No" H 7500 -870 60  0001 L CNN "Socket"
F 31 "Yes" H 7500 -960 60  0001 L CNN "SMD"
F 32 "~~" H 7500 -1050 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 7500 -1140 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F3301TRF" H 7500 -1230 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 7500 -1320 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7500 -1410 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 7500 -1500 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 7500 -1590 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 7500 -1680 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 7500 -1770 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7500 -1860 60  0001 L CNN "License"
	1    7500 1950
	1    0    0    -1  
$EndComp
Text Label 6900 2450 0    60   ~ 0
DSI_L3_P
Text Label 6900 2550 0    60   ~ 0
DSI_L3_N
Wire Wire Line
	5300 1550 6200 1550
Wire Wire Line
	5300 1650 6200 1650
Wire Wire Line
	5300 1850 6200 1850
Wire Wire Line
	5300 1950 6200 1950
Wire Wire Line
	5300 2150 6200 2150
Wire Wire Line
	5300 2250 6200 2250
Wire Wire Line
	5300 2450 6200 2450
Wire Wire Line
	5300 2550 6200 2550
Text Label 5400 1550 0    60   ~ 0
DSI_L0_P
Text Label 5400 1650 0    60   ~ 0
DSI_L0_N
Text Label 5400 1850 0    60   ~ 0
DSI_L1_P
Text Label 5400 1950 0    60   ~ 0
DSI_L1_N
Text Label 5400 2150 0    60   ~ 0
DSI_CLK_P
Text Label 5400 2250 0    60   ~ 0
DSI_CLK_N
Text Label 5400 2450 0    60   ~ 0
DSI_L2_P
Text Label 5400 2550 0    60   ~ 0
DSI_L2_N
Wire Wire Line
	6400 2850 6400 2950
Connection ~ 6400 2850
$Comp
L GND #PWR0135
U 1 1 5993C371
P 6400 2950
F 0 "#PWR0135" H 6400 2700 50  0001 C CNN
F 1 "GND" H 6405 2777 50  0000 C CNN
F 2 "" H 6400 2950 50  0001 C CNN
F 3 "" H 6400 2950 50  0001 C CNN
	1    6400 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0136
U 1 1 5993C3F9
P 7800 1550
F 0 "#PWR0136" H 7800 1300 50  0001 C CNN
F 1 "GND" V 7805 1422 50  0000 R CNN
F 2 "" H 7800 1550 50  0001 C CNN
F 3 "" H 7800 1550 50  0001 C CNN
	1    7800 1550
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR0137
U 1 1 5993C774
P 7800 1950
F 0 "#PWR0137" H 7800 1700 50  0001 C CNN
F 1 "GND" V 7805 1822 50  0000 R CNN
F 2 "" H 7800 1950 50  0001 C CNN
F 3 "" H 7800 1950 50  0001 C CNN
	1    7800 1950
	0    -1   -1   0   
$EndComp
Wire Notes Line
	5100 750  8250 750 
Wire Notes Line
	8250 750  8250 3300
Wire Notes Line
	8250 3300 4900 3300
Wire Notes Line
	4900 3300 4900 750 
Wire Notes Line
	4900 750  5150 750 
Text Notes 5000 900  0    60   ~ 0
Iphone 4 LCD connector (LH350WS1-SD02)
Wire Wire Line
	1550 1000 2450 1000
Wire Wire Line
	1550 1100 2450 1100
Wire Wire Line
	1550 1400 2450 1400
Wire Wire Line
	1550 1500 2450 1500
Wire Wire Line
	1550 2600 2450 2600
Wire Wire Line
	1550 2700 2450 2700
Wire Wire Line
	1550 1800 2450 1800
Wire Wire Line
	1550 1900 2450 1900
Text Label 1650 1000 0    60   ~ 0
DSI_L0_P
Text Label 1650 1100 0    60   ~ 0
DSI_L0_N
Text Label 1650 1400 0    60   ~ 0
DSI_L1_P
Text Label 1650 1500 0    60   ~ 0
DSI_L1_N
Text Label 1650 2600 0    60   ~ 0
DSI_CLK_P
Text Label 1650 2700 0    60   ~ 0
DSI_CLK_N
Text Label 1650 1800 0    60   ~ 0
DSI_L2_P
Text Label 1650 1900 0    60   ~ 0
DSI_L2_N
Wire Wire Line
	1550 2200 2450 2200
Wire Wire Line
	1550 2300 2450 2300
Text Label 1650 2200 0    60   ~ 0
DSI_L3_P
Text Label 1650 2300 0    60   ~ 0
DSI_L3_N
Text HLabel 1550 1000 0    60   Input ~ 0
DSI_L0_P
Text HLabel 1550 1100 0    60   Input ~ 0
DSI_L0_N
Text HLabel 1550 1400 0    60   Input ~ 0
DSI_L1_P
Text HLabel 1550 1500 0    60   Input ~ 0
DSI_L1_N
Text HLabel 1550 1800 0    60   Input ~ 0
DSI_L2_P
Text HLabel 1550 1900 0    60   Input ~ 0
DSI_L2_N
Text HLabel 1550 2200 0    60   Input ~ 0
DSI_L3_P
Text HLabel 1550 2300 0    60   Input ~ 0
DSI_L3_N
Text HLabel 1550 2600 0    60   Input ~ 0
DSI_CLK_P
Text HLabel 1550 2700 0    60   Input ~ 0
DSI_CLK_N
Text HLabel 1550 3050 0    60   UnSpc ~ 0
LCD_BL_A
Text HLabel 1550 3150 0    60   UnSpc ~ 0
LCD_BL_FB
Text HLabel 1550 3350 0    60   Input ~ 0
DSI_RESET_N
Text HLabel 1550 3450 0    60   Input ~ 0
DSI_GPIO0
Text HLabel 1550 3550 0    60   Input ~ 0
DSI_GPIO1
Text Label 1650 3050 0    60   ~ 0
LCD_BL_A
Text Label 1650 3150 0    60   ~ 0
LCD_BL_FB
Text Label 1650 3350 0    60   ~ 0
DSI_RESET_N
Text Label 1650 3450 0    60   ~ 0
DSI_GPIO0
Text Label 1650 3550 0    60   ~ 0
DSI_GPIO1
Wire Wire Line
	1550 3050 2450 3050
Wire Wire Line
	1550 3150 2450 3150
Wire Wire Line
	1550 3350 2450 3350
Wire Wire Line
	1550 3450 2450 3450
Wire Wire Line
	1550 3550 2450 3550
$Comp
L CONN_02X15_ALT CN3
U 1 1 59949FB3
P 6450 4950
F 0 "CN3" H 6450 5865 50  0000 C CNN
F 1 "CONN_02X15_ALT" H 6450 5774 50  0000 C CNN
F 2 "" H 6450 3800 50  0001 C CNN
F 3 "" H 6450 3800 50  0001 C CNN
	1    6450 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4250 6100 4250
Wire Wire Line
	6100 4250 6100 5950
Wire Wire Line
	6100 5950 6800 5950
Wire Wire Line
	6800 5950 6800 4250
Wire Wire Line
	6800 4250 6700 4250
Wire Wire Line
	6700 4550 6800 4550
Connection ~ 6800 4550
Wire Wire Line
	6800 5050 6700 5050
Connection ~ 6800 5050
Wire Wire Line
	6700 5350 6800 5350
Connection ~ 6800 5350
Wire Wire Line
	6800 5650 6700 5650
Connection ~ 6800 5650
Wire Wire Line
	6100 5650 6200 5650
Connection ~ 6100 5650
Wire Wire Line
	6200 5350 6100 5350
Connection ~ 6100 5350
Wire Wire Line
	6100 5050 6200 5050
Connection ~ 6100 5050
Wire Wire Line
	6200 4750 6100 4750
Connection ~ 6100 4750
Wire Wire Line
	6100 4450 6200 4450
Connection ~ 6100 4450
Wire Wire Line
	6200 4350 5250 4350
Text Label 5300 4350 0    60   ~ 0
LCD_BL_A
Wire Wire Line
	6700 4350 7150 4350
$Comp
L R0603_10R_1%_0.1W_200PPM R49
U 1 1 5994AFFA
P 7150 4350
F 0 "R49" H 7300 4547 50  0000 C CNN
F 1 "R0603_10R_1%_0.1W_200PPM" H 7150 4140 60  0001 L CNN
F 2 "RESC1608X55N" H 7150 3330 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7150 3960 60  0001 L CNN
F 4 "10" H 7300 4456 50  0000 C CNN "~"
F 5 "R0603_10R_1%_0.1W_200PPM" H 7150 3870 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 7150 3780 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 7150 3690 60  0001 L CNN "Library Path"
F 8 "=Value" H 7150 3600 60  0001 L CNN "Comment"
F 9 "Standard" H 7150 3510 60  0001 L CNN "Component Kind"
F 10 "Standard" H 7150 3420 60  0001 L CNN "Component Type"
F 11 "~~" H 7150 3240 60  0001 L CNN "PackageDescription"
F 12 "2" H 7150 3150 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 7150 3060 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 7150 2970 60  0001 L CNN "Footprint Ref"
F 15 "10" H 7150 2880 60  0001 L CNN "Val"
F 16 "Preferred" H 7150 2790 60  0001 L CNN "Status"
F 17 "0.1W" H 7150 2700 60  0001 L CNN "Power"
F 18 "±200ppm/°C" H 7150 2610 60  0001 L CNN "TC"
F 19 "~~" H 7150 2520 60  0001 L CNN "Voltage"
F 20 "±1%" H 7150 2430 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 7150 2340 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 7150 2250 60  0001 L CNN "Manufacturer"
F 23 "R0603_10R_1%_0.1W_200PPM" H 7150 2160 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 7150 2070 60  0001 L CNN "Case"
F 25 "No" H 7150 1980 60  0001 L CNN "PressFit"
F 26 "Yes" H 7150 1890 60  0001 L CNN "Mounted"
F 27 "~~" H 7150 1800 60  0001 L CNN "Sense Comment"
F 28 "No" H 7150 1710 60  0001 L CNN "Sense"
F 29 "~~" H 7150 1620 60  0001 L CNN "Status Comment"
F 30 "No" H 7150 1530 60  0001 L CNN "Socket"
F 31 "Yes" H 7150 1440 60  0001 L CNN "SMD"
F 32 "~~" H 7150 1350 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 7150 1260 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F10R0TRF" H 7150 1170 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 7150 1080 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7150 990 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 7150 900 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 7150 810 60  0001 L CNN "CreateDate"
F 39 "06/24/09 00:00:00" H 7150 720 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 7150 630 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7150 540 60  0001 L CNN "License"
	1    7150 4350
	1    0    0    -1  
$EndComp
$Comp
L R0603_10R_1%_0.1W_200PPM R50
U 1 1 5994B12D
P 7150 4450
F 0 "R50" H 7300 4345 50  0000 C CNN
F 1 "R0603_10R_1%_0.1W_200PPM" H 7150 4240 60  0001 L CNN
F 2 "RESC1608X55N" H 7150 3430 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7150 4060 60  0001 L CNN
F 4 "10" H 7450 4350 50  0000 C CNN "~"
F 5 "R0603_10R_1%_0.1W_200PPM" H 7150 3970 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 7150 3880 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 7150 3790 60  0001 L CNN "Library Path"
F 8 "=Value" H 7150 3700 60  0001 L CNN "Comment"
F 9 "Standard" H 7150 3610 60  0001 L CNN "Component Kind"
F 10 "Standard" H 7150 3520 60  0001 L CNN "Component Type"
F 11 "~~" H 7150 3340 60  0001 L CNN "PackageDescription"
F 12 "2" H 7150 3250 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 7150 3160 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 7150 3070 60  0001 L CNN "Footprint Ref"
F 15 "10" H 7150 2980 60  0001 L CNN "Val"
F 16 "Preferred" H 7150 2890 60  0001 L CNN "Status"
F 17 "0.1W" H 7150 2800 60  0001 L CNN "Power"
F 18 "±200ppm/°C" H 7150 2710 60  0001 L CNN "TC"
F 19 "~~" H 7150 2620 60  0001 L CNN "Voltage"
F 20 "±1%" H 7150 2530 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 7150 2440 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 7150 2350 60  0001 L CNN "Manufacturer"
F 23 "R0603_10R_1%_0.1W_200PPM" H 7150 2260 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 7150 2170 60  0001 L CNN "Case"
F 25 "No" H 7150 2080 60  0001 L CNN "PressFit"
F 26 "Yes" H 7150 1990 60  0001 L CNN "Mounted"
F 27 "~~" H 7150 1900 60  0001 L CNN "Sense Comment"
F 28 "No" H 7150 1810 60  0001 L CNN "Sense"
F 29 "~~" H 7150 1720 60  0001 L CNN "Status Comment"
F 30 "No" H 7150 1630 60  0001 L CNN "Socket"
F 31 "Yes" H 7150 1540 60  0001 L CNN "SMD"
F 32 "~~" H 7150 1450 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 7150 1360 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F10R0TRF" H 7150 1270 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 7150 1180 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7150 1090 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 7150 1000 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 7150 910 60  0001 L CNN "CreateDate"
F 39 "06/24/09 00:00:00" H 7150 820 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 7150 730 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7150 640 60  0001 L CNN "License"
	1    7150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4450 6700 4450
Wire Wire Line
	7450 4350 7550 4350
Wire Wire Line
	7550 4350 7550 4450
Wire Wire Line
	7450 4450 8200 4450
Connection ~ 7550 4450
Text Label 7700 4450 0    60   ~ 0
LCD_BL_FB
Wire Wire Line
	6700 4750 7550 4750
Text Label 7300 4750 0    60   ~ 0
DSI_GPIO0
Text Label 7300 4850 0    60   ~ 0
DSI_GPIO1
Text Label 7300 4950 0    60   ~ 0
DSI_RESET_N
Wire Wire Line
	7550 4850 6700 4850
Wire Wire Line
	7550 4950 6700 4950
Wire Wire Line
	6700 4650 6900 4650
$Comp
L +1V8 #PWR0138
U 1 1 5994CF83
P 6900 4650
F 0 "#PWR0138" H 6900 4500 50  0001 C CNN
F 1 "+1V8" V 6915 4778 50  0000 L CNN
F 2 "" H 6900 4650 50  0001 C CNN
F 3 "" H 6900 4650 50  0001 C CNN
	1    6900 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 4850 6200 4850
Wire Wire Line
	5300 4950 6200 4950
Wire Wire Line
	5300 5450 6200 5450
Wire Wire Line
	5300 5550 6200 5550
Wire Wire Line
	5300 5150 6200 5150
Wire Wire Line
	5300 5250 6200 5250
Wire Wire Line
	6700 5150 7550 5150
Wire Wire Line
	6700 5250 7550 5250
Text Label 5400 4950 0    60   ~ 0
DSI_L0_P
Text Label 5400 4850 0    60   ~ 0
DSI_L0_N
Text Label 5400 5450 0    60   ~ 0
DSI_L1_P
Text Label 5400 5550 0    60   ~ 0
DSI_L1_N
Text Label 5400 5250 0    60   ~ 0
DSI_CLK_P
Text Label 5400 5150 0    60   ~ 0
DSI_CLK_N
Text Label 7300 5150 0    60   ~ 0
DSI_L2_P
Text Label 7300 5250 0    60   ~ 0
DSI_L2_N
Wire Wire Line
	6700 5450 7550 5450
Wire Wire Line
	6700 5550 7550 5550
Text Label 7300 5550 0    60   ~ 0
DSI_L3_P
Text Label 7300 5450 0    60   ~ 0
DSI_L3_N
Wire Wire Line
	6200 4550 6000 4550
Wire Wire Line
	6200 4650 6000 4650
$Comp
L LCD_PVDRV #PWR0139
U 1 1 59953AB8
P 6000 4550
F 0 "#PWR0139" H 6000 4400 50  0001 C CNN
F 1 "LCD_PVDRV" V 6015 4678 50  0000 L CNN
F 2 "" H 6000 4550 50  0001 C CNN
F 3 "" H 6000 4550 50  0001 C CNN
	1    6000 4550
	0    -1   -1   0   
$EndComp
$Comp
L LCD_MVDRV #PWR0140
U 1 1 59953DAA
P 6000 4650
F 0 "#PWR0140" H 6000 4500 50  0001 C CNN
F 1 "LCD_MVDRV" V 6015 4777 50  0000 L CNN
F 2 "" H 6000 4650 50  0001 C CNN
F 3 "" H 6000 4650 50  0001 C CNN
	1    6000 4650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR0141
U 1 1 59956F93
P 6450 6150
F 0 "#PWR0141" H 6450 5900 50  0001 C CNN
F 1 "GND" H 6455 5977 50  0000 C CNN
F 2 "" H 6450 6150 50  0001 C CNN
F 3 "" H 6450 6150 50  0001 C CNN
	1    6450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 6150 6450 5950
Connection ~ 6450 5950
Wire Notes Line
	4900 3700 8250 3700
Wire Notes Line
	8250 3700 8250 6450
Wire Notes Line
	8250 6450 4900 6450
Wire Notes Line
	4900 6450 4900 3700
Text Notes 5000 3950 0    60   ~ 0
Optimus E980 LCD connector (LH550WF1-SD01)\n(also used for adapter mezzanine)
Text Notes 10100 6850 2    150  ~ 0
HDMI DSI Shield
Text Notes 9800 7050 2    100  ~ 0
Display connectors
Text Notes 10825 7650 2    60   ~ 0
2.2a
Text Notes 8250 7500 2    60   ~ 0
Display connectors
Text Notes 750  7450 0    40   ~ 0
Copyright 2013-2017 twl <twlostow@printf.cc>\n\nThis documentation describes Open Hardware and is licensed under\nthe CERN OHL v. 1.2. You may redistribute and modify this documentation\nunder the terms of the CERN OHL v.1.2. (http://ohwr.org/CERNOHL).\nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY\nAND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2\nfor applicable conditions.\n
Wire Notes Line
	700  6800 700  7500
Wire Notes Line
	700  7500 3100 7500
Wire Notes Line
	3100 7500 3100 6800
Wire Notes Line
	3100 6800 700  6800
$EndSCHEMATC
