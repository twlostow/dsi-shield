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
Sheet 12 13
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
L TVP5150AM1PBS IC28
U 1 1 59904558
P 5150 2700
F 0 "IC28" H 5950 2773 50  0000 C CNN
F 1 "TVP5150AM1PBS" H 5150 2800 60  0001 L CNN
F 2 "" H 5150 2700 60  0001 C CNN
F 3 "" H 5150 2700 60  0001 C CNN
F 4 "Value" H 5150 2700 60  0001 C CNN "Fieldname"
	1    5150 2700
	1    0    0    -1  
$EndComp
Text HLabel 1600 1500 0    60   Input ~ 0
CVBS_IN
$Comp
L R0603_33R_1%_0.1W_100PPM R19
U 1 1 59905E84
P 1900 1500
F 0 "R19" H 2050 1697 50  0000 C CNN
F 1 "R0603_33R_1%_0.1W_100PPM" H 1900 1290 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 1900 480 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 1900 1110 60  0001 L CNN
F 4 "33" H 2050 1606 50  0000 C CNN "~"
F 5 "R0603_33R_1%_0.1W_100PPM" H 1900 1020 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 1900 930 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 1900 840 60  0001 L CNN "Library Path"
F 8 "=Value" H 1900 750 60  0001 L CNN "Comment"
F 9 "Standard" H 1900 660 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1900 570 60  0001 L CNN "Component Type"
F 11 "~~" H 1900 390 60  0001 L CNN "PackageDescription"
F 12 "2" H 1900 300 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 1900 210 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 1900 120 60  0001 L CNN "Footprint Ref"
F 15 "33" H 1900 30  60  0001 L CNN "Val"
F 16 "Preferred" H 1900 -60 60  0001 L CNN "Status"
F 17 "0.1W" H 1900 -150 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 1900 -240 60  0001 L CNN "TC"
F 19 "~~" H 1900 -330 60  0001 L CNN "Voltage"
F 20 "±1%" H 1900 -420 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 1900 -510 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1900 -600 60  0001 L CNN "Manufacturer"
F 23 "R0603_33R_1%_0.1W_100PPM" H 1900 -690 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1900 -780 60  0001 L CNN "Case"
F 25 "No" H 1900 -870 60  0001 L CNN "PressFit"
F 26 "Yes" H 1900 -960 60  0001 L CNN "Mounted"
F 27 "~~" H 1900 -1050 60  0001 L CNN "Sense Comment"
F 28 "No" H 1900 -1140 60  0001 L CNN "Sense"
F 29 "~~" H 1900 -1230 60  0001 L CNN "Status Comment"
F 30 "No" H 1900 -1320 60  0001 L CNN "Socket"
F 31 "Yes" H 1900 -1410 60  0001 L CNN "SMD"
F 32 "~~" H 1900 -1500 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 1900 -1590 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F33R0TRF" H 1900 -1680 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 1900 -1770 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 1900 -1860 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 1900 -1950 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 1900 -2040 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 1900 -2130 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 1900 -2220 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1900 -2310 60  0001 L CNN "License"
	1    1900 1500
	1    0    0    -1  
$EndComp
$Comp
L R0603_33R_1%_0.1W_100PPM R32
U 1 1 59906001
P 2300 1600
F 0 "R32" V 2404 1660 50  0000 L CNN
F 1 "R0603_33R_1%_0.1W_100PPM" H 2300 1390 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 2300 580 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 2300 1210 60  0001 L CNN
F 4 "33" V 2495 1660 50  0000 L CNN "~"
F 5 "R0603_33R_1%_0.1W_100PPM" H 2300 1120 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 2300 1030 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 2300 940 60  0001 L CNN "Library Path"
F 8 "=Value" H 2300 850 60  0001 L CNN "Comment"
F 9 "Standard" H 2300 760 60  0001 L CNN "Component Kind"
F 10 "Standard" H 2300 670 60  0001 L CNN "Component Type"
F 11 "~~" H 2300 490 60  0001 L CNN "PackageDescription"
F 12 "2" H 2300 400 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 2300 310 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 2300 220 60  0001 L CNN "Footprint Ref"
F 15 "33" H 2300 130 60  0001 L CNN "Val"
F 16 "Preferred" H 2300 40  60  0001 L CNN "Status"
F 17 "0.1W" H 2300 -50 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 2300 -140 60  0001 L CNN "TC"
F 19 "~~" H 2300 -230 60  0001 L CNN "Voltage"
F 20 "±1%" H 2300 -320 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 2300 -410 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 2300 -500 60  0001 L CNN "Manufacturer"
F 23 "R0603_33R_1%_0.1W_100PPM" H 2300 -590 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 2300 -680 60  0001 L CNN "Case"
F 25 "No" H 2300 -770 60  0001 L CNN "PressFit"
F 26 "Yes" H 2300 -860 60  0001 L CNN "Mounted"
F 27 "~~" H 2300 -950 60  0001 L CNN "Sense Comment"
F 28 "No" H 2300 -1040 60  0001 L CNN "Sense"
F 29 "~~" H 2300 -1130 60  0001 L CNN "Status Comment"
F 30 "No" H 2300 -1220 60  0001 L CNN "Socket"
F 31 "Yes" H 2300 -1310 60  0001 L CNN "SMD"
F 32 "~~" H 2300 -1400 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 2300 -1490 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F33R0TRF" H 2300 -1580 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 2300 -1670 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 2300 -1760 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 2300 -1850 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 2300 -1940 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 2300 -2030 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 2300 -2120 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 2300 -2210 60  0001 L CNN "License"
	1    2300 1600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR0110
U 1 1 599061B2
P 2300 2000
F 0 "#PWR0110" H 2300 1750 50  0001 C CNN
F 1 "GND" H 2305 1827 50  0000 C CNN
F 2 "" H 2300 2000 50  0001 C CNN
F 3 "" H 2300 2000 50  0001 C CNN
	1    2300 2000
	1    0    0    -1  
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C7
U 1 1 59906E21
P 2450 1500
F 0 "C7" H 2600 1747 50  0000 C CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 2450 1240 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X90N" H 2450 430 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 2450 1060 60  0001 L CNN
F 4 "100nF" H 2600 1656 50  0000 C CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 2450 970 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 2450 880 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 2450 790 60  0001 L CNN "Library Path"
F 8 "=Value" H 2450 700 60  0001 L CNN "Comment"
F 9 "Standard" H 2450 610 60  0001 L CNN "Component Kind"
F 10 "Standard" H 2450 520 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 2450 340 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 2450 250 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 2450 160 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 2450 70  60  0001 L CNN "PackageDescription"
F 15 "100nF" H 2450 -20 60  0001 L CNN "Val"
F 16 "None" H 2450 -110 60  0001 L CNN "Status"
F 17 "~~" H 2450 -200 60  0001 L CNN "Status Comment"
F 18 "100V" H 2450 -290 60  0001 L CNN "Voltage"
F 19 "X7R" H 2450 -380 60  0001 L CNN "TC"
F 20 "±10%" H 2450 -470 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 2450 -560 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 2450 -650 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 2450 -740 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 2450 -830 60  0001 L CNN "Case"
F 25 "Yes" H 2450 -920 60  0001 L CNN "Mounted"
F 26 "No" H 2450 -1010 60  0001 L CNN "Socket"
F 27 "Yes" H 2450 -1100 60  0001 L CNN "SMD"
F 28 "~~" H 2450 -1190 60  0001 L CNN "PressFit"
F 29 "No" H 2450 -1280 60  0001 L CNN "Sense"
F 30 "~~" H 2450 -1370 60  0001 L CNN "Sense Comment"
F 31 "~~" H 2450 -1460 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 2450 -1550 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 2450 -1640 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 2450 -1730 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 2450 -1820 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 2450 -1910 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 2450 -2000 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 2450 -2090 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 2450 -2180 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 2450 -2270 60  0001 L CNN "License"
	1    2450 1500
	1    0    0    -1  
$EndComp
NoConn ~ 4950 2900
$Comp
L R0603_3K3_1%_0.1W_100PPM R33
U 1 1 5990911E
P 4250 3100
F 0 "R33" H 4400 3297 50  0000 C CNN
F 1 "R0603_3K3_1%_0.1W_100PPM" H 4250 2890 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4250 2080 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4250 2710 60  0001 L CNN
F 4 "3k3" H 4400 3206 50  0000 C CNN "~"
F 5 "R0603_3K3_1%_0.1W_100PPM" H 4250 2620 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4250 2530 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4250 2440 60  0001 L CNN "Library Path"
F 8 "=Value" H 4250 2350 60  0001 L CNN "Comment"
F 9 "Standard" H 4250 2260 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4250 2170 60  0001 L CNN "Component Type"
F 11 "~~" H 4250 1990 60  0001 L CNN "PackageDescription"
F 12 "2" H 4250 1900 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4250 1810 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4250 1720 60  0001 L CNN "Footprint Ref"
F 15 "3k3" H 4250 1630 60  0001 L CNN "Val"
F 16 "Preferred" H 4250 1540 60  0001 L CNN "Status"
F 17 "0.1W" H 4250 1450 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4250 1360 60  0001 L CNN "TC"
F 19 "~~" H 4250 1270 60  0001 L CNN "Voltage"
F 20 "±1%" H 4250 1180 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4250 1090 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4250 1000 60  0001 L CNN "Manufacturer"
F 23 "R0603_3K3_1%_0.1W_100PPM" H 4250 910 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4250 820 60  0001 L CNN "Case"
F 25 "No" H 4250 730 60  0001 L CNN "PressFit"
F 26 "Yes" H 4250 640 60  0001 L CNN "Mounted"
F 27 "~~" H 4250 550 60  0001 L CNN "Sense Comment"
F 28 "No" H 4250 460 60  0001 L CNN "Sense"
F 29 "~~" H 4250 370 60  0001 L CNN "Status Comment"
F 30 "No" H 4250 280 60  0001 L CNN "Socket"
F 31 "Yes" H 4250 190 60  0001 L CNN "SMD"
F 32 "~~" H 4250 100 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4250 10  60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F3301TRF" H 4250 -80 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4250 -170 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4250 -260 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4250 -350 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4250 -440 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4250 -530 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4250 -620 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4250 -710 60  0001 L CNN "License"
	1    4250 3100
	1    0    0    -1  
$EndComp
$Comp
L R0603_3K3_1%_0.1W_100PPM R4
U 1 1 5990925B
P 4250 3200
F 0 "R4" H 4400 3050 50  0000 C CNN
F 1 "R0603_3K3_1%_0.1W_100PPM" H 4250 2990 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4250 2180 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4250 2810 60  0001 L CNN
F 4 "3k3" H 4400 2950 50  0000 C CNN "~"
F 5 "R0603_3K3_1%_0.1W_100PPM" H 4250 2720 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4250 2630 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4250 2540 60  0001 L CNN "Library Path"
F 8 "=Value" H 4250 2450 60  0001 L CNN "Comment"
F 9 "Standard" H 4250 2360 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4250 2270 60  0001 L CNN "Component Type"
F 11 "~~" H 4250 2090 60  0001 L CNN "PackageDescription"
F 12 "2" H 4250 2000 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4250 1910 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4250 1820 60  0001 L CNN "Footprint Ref"
F 15 "3k3" H 4250 1730 60  0001 L CNN "Val"
F 16 "Preferred" H 4250 1640 60  0001 L CNN "Status"
F 17 "0.1W" H 4250 1550 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4250 1460 60  0001 L CNN "TC"
F 19 "~~" H 4250 1370 60  0001 L CNN "Voltage"
F 20 "±1%" H 4250 1280 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4250 1190 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4250 1100 60  0001 L CNN "Manufacturer"
F 23 "R0603_3K3_1%_0.1W_100PPM" H 4250 1010 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4250 920 60  0001 L CNN "Case"
F 25 "No" H 4250 830 60  0001 L CNN "PressFit"
F 26 "Yes" H 4250 740 60  0001 L CNN "Mounted"
F 27 "~~" H 4250 650 60  0001 L CNN "Sense Comment"
F 28 "No" H 4250 560 60  0001 L CNN "Sense"
F 29 "~~" H 4250 470 60  0001 L CNN "Status Comment"
F 30 "No" H 4250 380 60  0001 L CNN "Socket"
F 31 "Yes" H 4250 290 60  0001 L CNN "SMD"
F 32 "~~" H 4250 200 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4250 110 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F3301TRF" H 4250 20  60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4250 -70 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4250 -160 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4250 -250 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4250 -340 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4250 -430 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4250 -520 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4250 -610 60  0001 L CNN "License"
	1    4250 3200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0111
U 1 1 59909459
P 4050 3100
F 0 "#PWR0111" H 4050 2950 50  0001 C CNN
F 1 "+3V3" V 4065 3228 50  0000 L CNN
F 2 "" H 4050 3100 50  0001 C CNN
F 3 "" H 4050 3100 50  0001 C CNN
	1    4050 3100
	0    -1   -1   0   
$EndComp
$Comp
L CC0603_22PF_50V_5%_NP0 C31
U 1 1 5990B552
P 3300 3600
F 0 "C31" V 3404 3710 50  0000 L CNN
F 1 "CC0603_22PF_50V_5%_NP0" H 3300 3340 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3300 2530 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 3300 3160 60  0001 L CNN
F 4 "22pF" V 3495 3710 50  0000 L CNN "~"
F 5 "CC0603_22PF_50V_5%_NP0" H 3300 3070 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3300 2980 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3300 2890 60  0001 L CNN "Library Path"
F 8 "=Value" H 3300 2800 60  0001 L CNN "Comment"
F 9 "Standard" H 3300 2710 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3300 2620 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3300 2440 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3300 2350 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3300 2260 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3300 2170 60  0001 L CNN "PackageDescription"
F 15 "22pF" H 3300 2080 60  0001 L CNN "Val"
F 16 "Preferred" H 3300 1990 60  0001 L CNN "Status"
F 17 "~~" H 3300 1900 60  0001 L CNN "Status Comment"
F 18 "50V" H 3300 1810 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 3300 1720 60  0001 L CNN "TC"
F 20 "±5%" H 3300 1630 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3300 1540 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3300 1450 60  0001 L CNN "Manufacturer"
F 23 "CC0603_22PF_50V_5%_NP0" H 3300 1360 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3300 1270 60  0001 L CNN "Case"
F 25 "Yes" H 3300 1180 60  0001 L CNN "Mounted"
F 26 "No" H 3300 1090 60  0001 L CNN "Socket"
F 27 "Yes" H 3300 1000 60  0001 L CNN "SMD"
F 28 "~~" H 3300 910 60  0001 L CNN "PressFit"
F 29 "No" H 3300 820 60  0001 L CNN "Sense"
F 30 "~~" H 3300 730 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3300 640 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 3300 550 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715229" H 3300 460 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 3300 370 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 3300 280 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 3300 190 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 3300 100 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 3300 10  60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3300 -80 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3300 -170 60  0001 L CNN "License"
	1    3300 3600
	0    1    1    0   
$EndComp
$Comp
L CC0603_22PF_50V_5%_NP0 C59
U 1 1 5990B6BB
P 2850 3600
F 0 "C59" V 2954 3710 50  0000 L CNN
F 1 "CC0603_22PF_50V_5%_NP0" H 2850 3340 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 2850 2530 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 2850 3160 60  0001 L CNN
F 4 "22pF" V 3045 3710 50  0000 L CNN "~"
F 5 "CC0603_22PF_50V_5%_NP0" H 2850 3070 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 2850 2980 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 2850 2890 60  0001 L CNN "Library Path"
F 8 "=Value" H 2850 2800 60  0001 L CNN "Comment"
F 9 "Standard" H 2850 2710 60  0001 L CNN "Component Kind"
F 10 "Standard" H 2850 2620 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 2850 2440 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 2850 2350 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 2850 2260 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 2850 2170 60  0001 L CNN "PackageDescription"
F 15 "22pF" H 2850 2080 60  0001 L CNN "Val"
F 16 "Preferred" H 2850 1990 60  0001 L CNN "Status"
F 17 "~~" H 2850 1900 60  0001 L CNN "Status Comment"
F 18 "50V" H 2850 1810 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 2850 1720 60  0001 L CNN "TC"
F 20 "±5%" H 2850 1630 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 2850 1540 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 2850 1450 60  0001 L CNN "Manufacturer"
F 23 "CC0603_22PF_50V_5%_NP0" H 2850 1360 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 2850 1270 60  0001 L CNN "Case"
F 25 "Yes" H 2850 1180 60  0001 L CNN "Mounted"
F 26 "No" H 2850 1090 60  0001 L CNN "Socket"
F 27 "Yes" H 2850 1000 60  0001 L CNN "SMD"
F 28 "~~" H 2850 910 60  0001 L CNN "PressFit"
F 29 "No" H 2850 820 60  0001 L CNN "Sense"
F 30 "~~" H 2850 730 60  0001 L CNN "Sense Comment"
F 31 "~~" H 2850 640 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 2850 550 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715229" H 2850 460 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 2850 370 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 2850 280 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 2850 190 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 2850 100 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 2850 10  60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 2850 -80 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 2850 -170 60  0001 L CNN "License"
	1    2850 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR0112
U 1 1 5990B96D
P 2850 3900
F 0 "#PWR0112" H 2850 3650 50  0001 C CNN
F 1 "GND" H 2855 3727 50  0000 C CNN
F 2 "" H 2850 3900 50  0001 C CNN
F 3 "" H 2850 3900 50  0001 C CNN
	1    2850 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0113
U 1 1 5990BA01
P 3300 3900
F 0 "#PWR0113" H 3300 3650 50  0001 C CNN
F 1 "GND" H 3305 3727 50  0000 C CNN
F 2 "" H 3300 3900 50  0001 C CNN
F 3 "" H 3300 3900 50  0001 C CNN
	1    3300 3900
	1    0    0    -1  
$EndComp
$Comp
L XTAL_12MHZ_TXC_7A-12.000MAAJ-T X1
U 1 1 5991099D
P 2350 3400
F 0 "X1" H 2500 3657 50  0000 C CNN
F 1 "XTAL_12MHZ_TXC_7A-14.31818MAAJ-T" H 2350 3110 60  0001 L CNN
F 2 "ICs And Semiconductors SMD:XTAL_TXC_7A" H 2350 2210 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\XTAL_TXC_7A.pdf" H 2350 2930 60  0001 L CNN
F 4 "Value" H 2350 3400 60  0001 C CNN "Fieldname"
F 5 "14.318 MHz" H 2500 3566 50  0000 C CNN "~"
F 6 "XTAL_12MHZ_TXC_7A-14.31818MAAJ-T" H 2350 2840 60  0001 L CNN "Part Number"
F 7 "Quartz Crystal" H 2350 2750 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Crystals & Oscillators.SchLib" H 2350 2660 60  0001 L CNN "Library Path"
F 9 "=Value" H 2350 2570 60  0001 L CNN "Comment"
F 10 "Standard" H 2350 2480 60  0001 L CNN "Component Kind"
F 11 "Standard" H 2350 2390 60  0001 L CNN "Component Type"
F 12 "~~" H 2350 2300 60  0001 L CNN "Device"
F 13 "2 Pins, 3.2x5mm, SMD Glass Seam Sealing Crystal, 7A Serie" H 2350 2120 60  0001 L CNN "PackageDescription"
F 14 "14.318 MHz" H 2350 2030 60  0001 L CNN "Val"
F 15 "~~" H 2350 1940 60  0001 L CNN "Status"
F 16 "Tolerance: ±30ppm, Stability: ±30ppm, -20°C to +70°C, 18pF, SMD Glass Seam Sealing Crystal, 7A Series" H 2350 1850 60  0001 L CNN "Part Description"
F 17 "TXC CORPORATION" H 2350 1760 60  0001 L CNN "Manufacturer"
F 18 "7A-14.31818MAAJ-T" H 2350 1670 60  0001 L CNN "Manufacturer Part Number"
F 19 "2" H 2350 1580 60  0001 L CNN "Pin Count"
F 20 "~~" H 2350 1490 60  0001 L CNN "Case"
F 21 "Yes" H 2350 1400 60  0001 L CNN "Mounted"
F 22 "No" H 2350 1310 60  0001 L CNN "Socket"
F 23 "Yes" H 2350 1220 60  0001 L CNN "SMD"
F 24 "No" H 2350 1130 60  0001 L CNN "PressFit"
F 25 "No" H 2350 1040 60  0001 L CNN "Sense"
F 26 "No" H 2350 950 60  0001 L CNN "Bonding"
F 27 "~~" H 2350 860 60  0001 L CNN "Sense Comment"
F 28 "~~" H 2350 770 60  0001 L CNN "Status Comment"
F 29 "~~" H 2350 680 60  0001 L CNN "Field1"
F 30 "1.2mm" H 2350 590 60  0001 L CNN "ComponentHeight"
F 31 "PcbLib\\ICs And Semiconductors SMD.PcbLib" H 2350 500 60  0001 L CNN "Footprint Path"
F 32 "XTAL_TXC_7A" H 2350 410 60  0001 L CNN "Footprint Ref"
F 33 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\XTAL_TXC_7A.pdf" H 2350 320 60  0001 L CNN "HelpURL"
F 34 "~~" H 2350 230 60  0001 L CNN "ComponentLink1URL"
F 35 "~~" H 2350 140 60  0001 L CNN "ComponentLink1Description"
F 36 "~~" H 2350 50  60  0001 L CNN "ComponentLink2URL"
F 37 "~~" H 2350 -40 60  0001 L CNN "ComponentLink2Description"
F 38 "CERN DEM JLC" H 2350 -130 60  0001 L CNN "Author"
F 39 "11/12/14 00:00:00" H 2350 -220 60  0001 L CNN "CreateDate"
F 40 "11/12/14 00:00:00" H 2350 -310 60  0001 L CNN "LatestRevisionDate"
F 41 "ICs And Semiconductors SMD" H 2350 -400 60  0001 L CNN "Library Name"
F 42 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 2350 -490 60  0001 L CNN "License"
	1    2350 3400
	1    0    0    -1  
$EndComp
Text HLabel 4600 4000 0    60   BiDi ~ 0
SCL
Text HLabel 4600 4100 0    60   BiDi ~ 0
SDA
$Comp
L GNDA #PWR0114
U 1 1 599157A5
P 7050 5400
F 0 "#PWR0114" H 7050 5150 50  0001 C CNN
F 1 "GNDA" H 7055 5227 50  0000 C CNN
F 2 "" H 7050 5400 50  0001 C CNN
F 3 "" H 7050 5400 50  0001 C CNN
	1    7050 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0115
U 1 1 5991582A
P 7250 5400
F 0 "#PWR0115" H 7250 5150 50  0001 C CNN
F 1 "GND" H 7255 5227 50  0000 C CNN
F 2 "" H 7250 5400 50  0001 C CNN
F 3 "" H 7250 5400 50  0001 C CNN
	1    7250 5400
	1    0    0    -1  
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C29
U 1 1 59918073
P 3500 4850
F 0 "C29" V 3604 4960 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3500 4590 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3500 3780 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3500 4410 60  0001 L CNN
F 4 "1uF" V 3695 4960 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3500 4320 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3500 4230 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3500 4140 60  0001 L CNN "Library Path"
F 8 "=Value" H 3500 4050 60  0001 L CNN "Comment"
F 9 "Standard" H 3500 3960 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3500 3870 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3500 3690 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3500 3600 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3500 3510 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3500 3420 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3500 3330 60  0001 L CNN "Val"
F 16 "None" H 3500 3240 60  0001 L CNN "Status"
F 17 "~~" H 3500 3150 60  0001 L CNN "Status Comment"
F 18 "50V" H 3500 3060 60  0001 L CNN "Voltage"
F 19 "X5R" H 3500 2970 60  0001 L CNN "TC"
F 20 "±10%" H 3500 2880 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3500 2790 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3500 2700 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3500 2610 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3500 2520 60  0001 L CNN "Case"
F 25 "Yes" H 3500 2430 60  0001 L CNN "Mounted"
F 26 "No" H 3500 2340 60  0001 L CNN "Socket"
F 27 "Yes" H 3500 2250 60  0001 L CNN "SMD"
F 28 "~~" H 3500 2160 60  0001 L CNN "PressFit"
F 29 "No" H 3500 2070 60  0001 L CNN "Sense"
F 30 "~~" H 3500 1980 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3500 1890 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3500 1800 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3500 1710 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3500 1620 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3500 1530 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3500 1440 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3500 1350 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3500 1260 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3500 1170 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3500 1080 60  0001 L CNN "License"
	1    3500 4850
	0    1    1    0   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C30
U 1 1 59918205
P 3900 4700
F 0 "C30" H 4050 4453 50  0000 C CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3900 4440 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3900 3630 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3900 4260 60  0001 L CNN
F 4 "1uF" H 4050 4544 50  0000 C CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3900 4170 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3900 4080 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3900 3990 60  0001 L CNN "Library Path"
F 8 "=Value" H 3900 3900 60  0001 L CNN "Comment"
F 9 "Standard" H 3900 3810 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3900 3720 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3900 3540 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3900 3450 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3900 3360 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3900 3270 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3900 3180 60  0001 L CNN "Val"
F 16 "None" H 3900 3090 60  0001 L CNN "Status"
F 17 "~~" H 3900 3000 60  0001 L CNN "Status Comment"
F 18 "50V" H 3900 2910 60  0001 L CNN "Voltage"
F 19 "X5R" H 3900 2820 60  0001 L CNN "TC"
F 20 "±10%" H 3900 2730 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3900 2640 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3900 2550 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3900 2460 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3900 2370 60  0001 L CNN "Case"
F 25 "Yes" H 3900 2280 60  0001 L CNN "Mounted"
F 26 "No" H 3900 2190 60  0001 L CNN "Socket"
F 27 "Yes" H 3900 2100 60  0001 L CNN "SMD"
F 28 "~~" H 3900 2010 60  0001 L CNN "PressFit"
F 29 "No" H 3900 1920 60  0001 L CNN "Sense"
F 30 "~~" H 3900 1830 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3900 1740 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3900 1650 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3900 1560 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3900 1470 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3900 1380 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3900 1290 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3900 1200 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3900 1110 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3900 1020 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3900 930 60  0001 L CNN "License"
	1    3900 4700
	-1   0    0    1   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C52
U 1 1 599182A5
P 3950 5150
F 0 "C52" V 4146 5040 50  0000 R CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3950 4890 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3950 4080 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3950 4710 60  0001 L CNN
F 4 "1uF" V 4055 5040 50  0000 R CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3950 4620 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3950 4530 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3950 4440 60  0001 L CNN "Library Path"
F 8 "=Value" H 3950 4350 60  0001 L CNN "Comment"
F 9 "Standard" H 3950 4260 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3950 4170 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3950 3990 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3950 3900 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3950 3810 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3950 3720 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3950 3630 60  0001 L CNN "Val"
F 16 "None" H 3950 3540 60  0001 L CNN "Status"
F 17 "~~" H 3950 3450 60  0001 L CNN "Status Comment"
F 18 "50V" H 3950 3360 60  0001 L CNN "Voltage"
F 19 "X5R" H 3950 3270 60  0001 L CNN "TC"
F 20 "±10%" H 3950 3180 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3950 3090 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3950 3000 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3950 2910 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3950 2820 60  0001 L CNN "Case"
F 25 "Yes" H 3950 2730 60  0001 L CNN "Mounted"
F 26 "No" H 3950 2640 60  0001 L CNN "Socket"
F 27 "Yes" H 3950 2550 60  0001 L CNN "SMD"
F 28 "~~" H 3950 2460 60  0001 L CNN "PressFit"
F 29 "No" H 3950 2370 60  0001 L CNN "Sense"
F 30 "~~" H 3950 2280 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3950 2190 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3950 2100 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3950 2010 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3950 1920 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3950 1830 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3950 1740 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3950 1650 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3950 1560 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3950 1470 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3950 1380 60  0001 L CNN "License"
	1    3950 5150
	0    -1   -1   0   
$EndComp
$Comp
L GNDA #PWR0116
U 1 1 5991843E
P 3500 5300
F 0 "#PWR0116" H 3500 5050 50  0001 C CNN
F 1 "GNDA" H 3505 5127 50  0000 C CNN
F 2 "" H 3500 5300 50  0001 C CNN
F 3 "" H 3500 5300 50  0001 C CNN
	1    3500 5300
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR0117
U 1 1 599184B2
P 3950 5300
F 0 "#PWR0117" H 3950 5050 50  0001 C CNN
F 1 "GNDA" H 3955 5127 50  0000 C CNN
F 2 "" H 3950 5300 50  0001 C CNN
F 3 "" H 3950 5300 50  0001 C CNN
	1    3950 5300
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0118
U 1 1 5991B27D
P 4950 4750
F 0 "#PWR0118" H 4950 4600 50  0001 C CNN
F 1 "+3V3" V 4965 4878 50  0000 L CNN
F 2 "" H 4950 4750 50  0001 C CNN
F 3 "" H 4950 4750 50  0001 C CNN
	1    4950 4750
	0    -1   -1   0   
$EndComp
$Comp
L +1V8 #PWR0119
U 1 1 5991B442
P 4950 4850
F 0 "#PWR0119" H 4950 4700 50  0001 C CNN
F 1 "+1V8" V 4965 4978 50  0000 L CNN
F 2 "" H 4950 4850 50  0001 C CNN
F 3 "" H 4950 4850 50  0001 C CNN
	1    4950 4850
	0    -1   -1   0   
$EndComp
$Comp
L VDDA #PWR0120
U 1 1 5991BFDF
P 4750 5050
F 0 "#PWR0120" H 4750 4900 50  0001 C CNN
F 1 "VDDA" V 4768 5178 50  0000 L CNN
F 2 "" H 4750 5050 50  0001 C CNN
F 3 "" H 4750 5050 50  0001 C CNN
	1    4750 5050
	0    -1   -1   0   
$EndComp
$Comp
L IND0805_MURATA_BLM21PG221SN1D L1
U 1 1 59920F8F
P 5750 6100
F 0 "L1" H 5900 6317 50  0000 C CNN
F 1 "IND0805_MURATA_BLM21PG221SN1D" H 5750 5910 60  0001 L CNN
F 2 "Inductors SMD:INDC2012X105N" H 5750 5100 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\IND0805_MURATA_BLM21P.pdf" H 5750 5730 60  0001 L CNN
F 4 "220R@100MHz" H 5900 6226 50  0000 C CNN "~"
F 5 "IND0805_MURATA_BLM21PG221SN1D" H 5750 5640 60  0001 L CNN "Part Number"
F 6 "Inductor" H 5750 5550 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Inductors & Transformers.SchLib" H 5750 5460 60  0001 L CNN "Library Path"
F 8 "=Value" H 5750 5370 60  0001 L CNN "Comment"
F 9 "Standard" H 5750 5280 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5750 5190 60  0001 L CNN "Component Type"
F 11 "~~" H 5750 5010 60  0001 L CNN "PackageDescription"
F 12 "2.0000000000000000e+00" H 5750 4920 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Inductors SMD.PcbLib" H 5750 4830 60  0001 L CNN "Footprint Path"
F 14 "INDC2012X105N" H 5750 4740 60  0001 L CNN "Footprint Ref"
F 15 "220R@100MHz" H 5750 4650 60  0001 L CNN "Val"
F 16 "None" H 5750 4560 60  0001 L CNN "Status"
F 17 "2A" H 5750 4470 60  0001 L CNN "Power"
F 18 "0.05R" H 5750 4380 60  0001 L CNN "Resistance"
F 19 "±25%" H 5750 4290 60  0001 L CNN "Tolerance"
F 20 "SMD EMIFIL Suppression Chip Ferrite Bead" H 5750 4200 60  0001 L CNN "Part Description"
F 21 "MURATA" H 5750 4110 60  0001 L CNN "Manufacturer"
F 22 "BLM21PG221SN1D" H 5750 4020 60  0001 L CNN "Manufacturer Part Number"
F 23 "0805" H 5750 3930 60  0001 L CNN "Case"
F 24 "Yes" H 5750 3840 60  0001 L CNN "Mounted"
F 25 "No" H 5750 3750 60  0001 L CNN "Socket"
F 26 "Yes" H 5750 3660 60  0001 L CNN "SMD"
F 27 "~~" H 5750 3570 60  0001 L CNN "Sense Comment"
F 28 "No" H 5750 3480 60  0001 L CNN "Sense"
F 29 "~~" H 5750 3390 60  0001 L CNN "Status Comment"
F 30 "1.05mm" H 5750 3300 60  0001 L CNN "ComponentHeight"
F 31 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\IND0805_MURATA_BLM21P.pdf" H 5750 3210 60  0001 L CNN "HelpURL"
F 32 "CERN DEM JLC" H 5750 3120 60  0001 L CNN "Author"
F 33 "01/25/10 00:00:00" H 5750 3030 60  0001 L CNN "CreateDate"
F 34 "01/17/17 00:00:00" H 5750 2940 60  0001 L CNN "LatestRevisionDate"
F 35 "Inductors SMD" H 5750 2850 60  0001 L CNN "Library Name"
F 36 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5750 2760 60  0001 L CNN "License"
	1    5750 6100
	1    0    0    -1  
$EndComp
$Comp
L IND0805_MURATA_BLM21PG221SN1D L6
U 1 1 59920FDD
P 5750 6400
F 0 "L6" H 5900 6617 50  0000 C CNN
F 1 "IND0805_MURATA_BLM21PG221SN1D" H 5750 6210 60  0001 L CNN
F 2 "Inductors SMD:INDC2012X105N" H 5750 5400 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\IND0805_MURATA_BLM21P.pdf" H 5750 6030 60  0001 L CNN
F 4 "220R@100MHz" H 5900 6526 50  0000 C CNN "~"
F 5 "IND0805_MURATA_BLM21PG221SN1D" H 5750 5940 60  0001 L CNN "Part Number"
F 6 "Inductor" H 5750 5850 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Inductors & Transformers.SchLib" H 5750 5760 60  0001 L CNN "Library Path"
F 8 "=Value" H 5750 5670 60  0001 L CNN "Comment"
F 9 "Standard" H 5750 5580 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5750 5490 60  0001 L CNN "Component Type"
F 11 "~~" H 5750 5310 60  0001 L CNN "PackageDescription"
F 12 "2.0000000000000000e+00" H 5750 5220 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Inductors SMD.PcbLib" H 5750 5130 60  0001 L CNN "Footprint Path"
F 14 "INDC2012X105N" H 5750 5040 60  0001 L CNN "Footprint Ref"
F 15 "220R@100MHz" H 5750 4950 60  0001 L CNN "Val"
F 16 "None" H 5750 4860 60  0001 L CNN "Status"
F 17 "2A" H 5750 4770 60  0001 L CNN "Power"
F 18 "0.05R" H 5750 4680 60  0001 L CNN "Resistance"
F 19 "±25%" H 5750 4590 60  0001 L CNN "Tolerance"
F 20 "SMD EMIFIL Suppression Chip Ferrite Bead" H 5750 4500 60  0001 L CNN "Part Description"
F 21 "MURATA" H 5750 4410 60  0001 L CNN "Manufacturer"
F 22 "BLM21PG221SN1D" H 5750 4320 60  0001 L CNN "Manufacturer Part Number"
F 23 "0805" H 5750 4230 60  0001 L CNN "Case"
F 24 "Yes" H 5750 4140 60  0001 L CNN "Mounted"
F 25 "No" H 5750 4050 60  0001 L CNN "Socket"
F 26 "Yes" H 5750 3960 60  0001 L CNN "SMD"
F 27 "~~" H 5750 3870 60  0001 L CNN "Sense Comment"
F 28 "No" H 5750 3780 60  0001 L CNN "Sense"
F 29 "~~" H 5750 3690 60  0001 L CNN "Status Comment"
F 30 "1.05mm" H 5750 3600 60  0001 L CNN "ComponentHeight"
F 31 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\IND0805_MURATA_BLM21P.pdf" H 5750 3510 60  0001 L CNN "HelpURL"
F 32 "CERN DEM JLC" H 5750 3420 60  0001 L CNN "Author"
F 33 "01/25/10 00:00:00" H 5750 3330 60  0001 L CNN "CreateDate"
F 34 "01/17/17 00:00:00" H 5750 3240 60  0001 L CNN "LatestRevisionDate"
F 35 "Inductors SMD" H 5750 3150 60  0001 L CNN "Library Name"
F 36 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5750 3060 60  0001 L CNN "License"
	1    5750 6400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0121
U 1 1 5992109A
P 5750 6100
F 0 "#PWR0121" H 5750 5850 50  0001 C CNN
F 1 "GND" H 5755 5927 50  0000 C CNN
F 2 "" H 5750 6100 50  0001 C CNN
F 3 "" H 5750 6100 50  0001 C CNN
	1    5750 6100
	0    1    1    0   
$EndComp
$Comp
L GNDA #PWR0122
U 1 1 599210CF
P 6050 6100
F 0 "#PWR0122" H 6050 5850 50  0001 C CNN
F 1 "GNDA" H 6055 5927 50  0000 C CNN
F 2 "" H 6050 6100 50  0001 C CNN
F 3 "" H 6050 6100 50  0001 C CNN
	1    6050 6100
	0    -1   -1   0   
$EndComp
$Comp
L +1V8 #PWR0123
U 1 1 5992113C
P 5750 6400
F 0 "#PWR0123" H 5750 6250 50  0001 C CNN
F 1 "+1V8" V 5765 6528 50  0000 L CNN
F 2 "" H 5750 6400 50  0001 C CNN
F 3 "" H 5750 6400 50  0001 C CNN
	1    5750 6400
	0    -1   -1   0   
$EndComp
$Comp
L VDDA #PWR0124
U 1 1 59921163
P 6100 6400
F 0 "#PWR0124" H 6100 6250 50  0001 C CNN
F 1 "VDDA" V 6118 6528 50  0000 L CNN
F 2 "" H 6100 6400 50  0001 C CNN
F 3 "" H 6100 6400 50  0001 C CNN
	1    6100 6400
	0    1    1    0   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C83
U 1 1 5992294C
P 3450 6200
F 0 "C83" V 3554 6310 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3450 5940 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3450 5130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3450 5760 60  0001 L CNN
F 4 "1uF" V 3645 6310 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3450 5670 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3450 5580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3450 5490 60  0001 L CNN "Library Path"
F 8 "=Value" H 3450 5400 60  0001 L CNN "Comment"
F 9 "Standard" H 3450 5310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3450 5220 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3450 5040 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3450 4950 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3450 4860 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3450 4770 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3450 4680 60  0001 L CNN "Val"
F 16 "None" H 3450 4590 60  0001 L CNN "Status"
F 17 "~~" H 3450 4500 60  0001 L CNN "Status Comment"
F 18 "50V" H 3450 4410 60  0001 L CNN "Voltage"
F 19 "X5R" H 3450 4320 60  0001 L CNN "TC"
F 20 "±10%" H 3450 4230 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3450 4140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3450 4050 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3450 3960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3450 3870 60  0001 L CNN "Case"
F 25 "Yes" H 3450 3780 60  0001 L CNN "Mounted"
F 26 "No" H 3450 3690 60  0001 L CNN "Socket"
F 27 "Yes" H 3450 3600 60  0001 L CNN "SMD"
F 28 "~~" H 3450 3510 60  0001 L CNN "PressFit"
F 29 "No" H 3450 3420 60  0001 L CNN "Sense"
F 30 "~~" H 3450 3330 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3450 3240 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3450 3150 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3450 3060 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3450 2970 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3450 2880 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3450 2790 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3450 2700 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3450 2610 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3450 2520 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3450 2430 60  0001 L CNN "License"
	1    3450 6200
	0    1    1    0   
$EndComp
$Comp
L GNDA #PWR0125
U 1 1 599229D3
P 3450 6600
F 0 "#PWR0125" H 3450 6350 50  0001 C CNN
F 1 "GNDA" H 3455 6427 50  0000 C CNN
F 2 "" H 3450 6600 50  0001 C CNN
F 3 "" H 3450 6600 50  0001 C CNN
	1    3450 6600
	1    0    0    -1  
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C84
U 1 1 5992364C
P 3850 6200
F 0 "C84" V 3954 6310 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 3850 5940 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X90N" H 3850 5130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3850 5760 60  0001 L CNN
F 4 "100nF" V 4045 6310 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 3850 5670 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3850 5580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3850 5490 60  0001 L CNN "Library Path"
F 8 "=Value" H 3850 5400 60  0001 L CNN "Comment"
F 9 "Standard" H 3850 5310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3850 5220 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3850 5040 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3850 4950 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 3850 4860 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3850 4770 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 3850 4680 60  0001 L CNN "Val"
F 16 "None" H 3850 4590 60  0001 L CNN "Status"
F 17 "~~" H 3850 4500 60  0001 L CNN "Status Comment"
F 18 "100V" H 3850 4410 60  0001 L CNN "Voltage"
F 19 "X7R" H 3850 4320 60  0001 L CNN "TC"
F 20 "±10%" H 3850 4230 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3850 4140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3850 4050 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 3850 3960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3850 3870 60  0001 L CNN "Case"
F 25 "Yes" H 3850 3780 60  0001 L CNN "Mounted"
F 26 "No" H 3850 3690 60  0001 L CNN "Socket"
F 27 "Yes" H 3850 3600 60  0001 L CNN "SMD"
F 28 "~~" H 3850 3510 60  0001 L CNN "PressFit"
F 29 "No" H 3850 3420 60  0001 L CNN "Sense"
F 30 "~~" H 3850 3330 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3850 3240 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 3850 3150 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 3850 3060 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3850 2970 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3850 2880 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 3850 2790 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 3850 2700 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 3850 2610 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3850 2520 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3850 2430 60  0001 L CNN "License"
	1    3850 6200
	0    1    1    0   
$EndComp
$Comp
L VDDA #PWR0126
U 1 1 599239E2
P 3450 6100
F 0 "#PWR0126" H 3450 5950 50  0001 C CNN
F 1 "VDDA" V 3468 6228 50  0000 L CNN
F 2 "" H 3450 6100 50  0001 C CNN
F 3 "" H 3450 6100 50  0001 C CNN
	1    3450 6100
	1    0    0    -1  
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C85
U 1 1 59923A52
P 4350 6200
F 0 "C85" V 4454 6310 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 4350 5940 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X90N" H 4350 5130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4350 5760 60  0001 L CNN
F 4 "100nF" V 4545 6310 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 4350 5670 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 4350 5580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 4350 5490 60  0001 L CNN "Library Path"
F 8 "=Value" H 4350 5400 60  0001 L CNN "Comment"
F 9 "Standard" H 4350 5310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4350 5220 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 4350 5040 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 4350 4950 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 4350 4860 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 4350 4770 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 4350 4680 60  0001 L CNN "Val"
F 16 "None" H 4350 4590 60  0001 L CNN "Status"
F 17 "~~" H 4350 4500 60  0001 L CNN "Status Comment"
F 18 "100V" H 4350 4410 60  0001 L CNN "Voltage"
F 19 "X7R" H 4350 4320 60  0001 L CNN "TC"
F 20 "±10%" H 4350 4230 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 4350 4140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4350 4050 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 4350 3960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4350 3870 60  0001 L CNN "Case"
F 25 "Yes" H 4350 3780 60  0001 L CNN "Mounted"
F 26 "No" H 4350 3690 60  0001 L CNN "Socket"
F 27 "Yes" H 4350 3600 60  0001 L CNN "SMD"
F 28 "~~" H 4350 3510 60  0001 L CNN "PressFit"
F 29 "No" H 4350 3420 60  0001 L CNN "Sense"
F 30 "~~" H 4350 3330 60  0001 L CNN "Sense Comment"
F 31 "~~" H 4350 3240 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 4350 3150 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 4350 3060 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 4350 2970 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4350 2880 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 4350 2790 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 4350 2700 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 4350 2610 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 4350 2520 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4350 2430 60  0001 L CNN "License"
	1    4350 6200
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C86
U 1 1 59923ADE
P 4800 6200
F 0 "C86" V 4904 6310 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 4800 5940 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X90N" H 4800 5130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4800 5760 60  0001 L CNN
F 4 "100nF" V 4995 6310 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 4800 5670 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 4800 5580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 4800 5490 60  0001 L CNN "Library Path"
F 8 "=Value" H 4800 5400 60  0001 L CNN "Comment"
F 9 "Standard" H 4800 5310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4800 5220 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 4800 5040 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 4800 4950 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 4800 4860 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 4800 4770 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 4800 4680 60  0001 L CNN "Val"
F 16 "None" H 4800 4590 60  0001 L CNN "Status"
F 17 "~~" H 4800 4500 60  0001 L CNN "Status Comment"
F 18 "100V" H 4800 4410 60  0001 L CNN "Voltage"
F 19 "X7R" H 4800 4320 60  0001 L CNN "TC"
F 20 "±10%" H 4800 4230 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 4800 4140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4800 4050 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 4800 3960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4800 3870 60  0001 L CNN "Case"
F 25 "Yes" H 4800 3780 60  0001 L CNN "Mounted"
F 26 "No" H 4800 3690 60  0001 L CNN "Socket"
F 27 "Yes" H 4800 3600 60  0001 L CNN "SMD"
F 28 "~~" H 4800 3510 60  0001 L CNN "PressFit"
F 29 "No" H 4800 3420 60  0001 L CNN "Sense"
F 30 "~~" H 4800 3330 60  0001 L CNN "Sense Comment"
F 31 "~~" H 4800 3240 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 4800 3150 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 4800 3060 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 4800 2970 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4800 2880 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 4800 2790 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 4800 2700 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 4800 2610 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 4800 2520 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4800 2430 60  0001 L CNN "License"
	1    4800 6200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR0127
U 1 1 59923BEB
P 4350 6500
F 0 "#PWR0127" H 4350 6250 50  0001 C CNN
F 1 "GND" H 4355 6327 50  0000 C CNN
F 2 "" H 4350 6500 50  0001 C CNN
F 3 "" H 4350 6500 50  0001 C CNN
	1    4350 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0128
U 1 1 59923C98
P 4800 6500
F 0 "#PWR0128" H 4800 6250 50  0001 C CNN
F 1 "GND" H 4805 6327 50  0000 C CNN
F 2 "" H 4800 6500 50  0001 C CNN
F 3 "" H 4800 6500 50  0001 C CNN
	1    4800 6500
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR0129
U 1 1 59923E68
P 4350 6100
F 0 "#PWR0129" H 4350 5950 50  0001 C CNN
F 1 "+1V8" H 4365 6273 50  0000 C CNN
F 2 "" H 4350 6100 50  0001 C CNN
F 3 "" H 4350 6100 50  0001 C CNN
	1    4350 6100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0130
U 1 1 59924064
P 4800 6100
F 0 "#PWR0130" H 4800 5950 50  0001 C CNN
F 1 "+3V3" H 4815 6273 50  0000 C CNN
F 2 "" H 4800 6100 50  0001 C CNN
F 3 "" H 4800 6100 50  0001 C CNN
	1    4800 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1500 1900 1500
Wire Wire Line
	2200 1500 2450 1500
Wire Wire Line
	2300 1500 2300 1600
Wire Wire Line
	2300 2000 2300 1900
Connection ~ 2300 1500
Wire Wire Line
	2750 1500 4250 1500
Wire Wire Line
	4250 1500 4250 2800
Wire Wire Line
	4250 2800 4950 2800
Wire Wire Line
	4550 3200 4950 3200
Wire Wire Line
	4550 3100 4950 3100
Wire Wire Line
	4250 3200 4150 3200
Wire Wire Line
	4150 3200 4150 3100
Wire Wire Line
	4050 3100 4250 3100
Connection ~ 4150 3100
Wire Wire Line
	2650 3400 4950 3400
Wire Wire Line
	3300 3400 3300 3600
Wire Wire Line
	2700 3500 4950 3500
Wire Wire Line
	2850 3500 2850 3600
Connection ~ 3300 3400
Wire Wire Line
	2700 3500 2700 3650
Wire Wire Line
	2700 3650 2250 3650
Wire Wire Line
	2250 3650 2250 3400
Wire Wire Line
	2250 3400 2350 3400
Connection ~ 2850 3500
Wire Wire Line
	4600 4100 4950 4100
Wire Wire Line
	4600 4000 4950 4000
Wire Wire Line
	6950 4750 7050 4750
Wire Wire Line
	7050 4750 7050 5400
Wire Wire Line
	6950 5050 7050 5050
Connection ~ 7050 5050
Wire Wire Line
	6950 5150 7050 5150
Connection ~ 7050 5150
Wire Wire Line
	6950 4850 7250 4850
Wire Wire Line
	7250 4850 7250 5400
Wire Wire Line
	4950 4350 3500 4350
Wire Wire Line
	3500 4350 3500 4850
Wire Wire Line
	3600 4700 3500 4700
Connection ~ 3500 4700
Wire Wire Line
	3900 4700 3950 4700
Wire Wire Line
	3950 4550 3950 4850
Wire Wire Line
	4950 4550 3950 4550
Connection ~ 3950 4700
Wire Wire Line
	3500 5150 3500 5300
Wire Wire Line
	3950 5300 3950 5150
Wire Wire Line
	4750 5050 4950 5050
Wire Wire Line
	4850 5050 4850 5150
Wire Wire Line
	4850 5150 4950 5150
Connection ~ 4850 5050
Wire Wire Line
	6100 6400 6050 6400
Wire Wire Line
	3450 6500 3450 6600
Wire Wire Line
	3850 6550 3850 6500
Wire Wire Line
	3850 6550 3450 6550
Connection ~ 3450 6550
Wire Wire Line
	3450 6100 3450 6200
Wire Wire Line
	3450 6150 3850 6150
Wire Wire Line
	3850 6150 3850 6200
Connection ~ 3450 6150
Wire Wire Line
	4350 6100 4350 6200
Wire Wire Line
	4800 6100 4800 6200
Wire Wire Line
	4750 3200 4750 2150
Wire Wire Line
	4750 2150 7700 2150
Connection ~ 4750 3200
Text HLabel 7700 2150 2    60   Input ~ 0
VID_RESETN
Text HLabel 7700 2800 2    60   Output ~ 0
VID_HS
Text HLabel 7700 3000 2    60   Output ~ 0
VID_VS
Text HLabel 7700 2900 2    60   Output ~ 0
VID_PCLK
Text HLabel 7700 3200 2    60   Output ~ 0
VID_D0
Text HLabel 7700 3300 2    60   Output ~ 0
VID_D1
Text HLabel 7700 3400 2    60   Output ~ 0
VID_D2
Text HLabel 7700 3500 2    60   Output ~ 0
VID_D3
Text HLabel 7700 3600 2    60   Output ~ 0
VID_D4
Text HLabel 7700 3700 2    60   Output ~ 0
VID_D5
Text HLabel 7700 3800 2    60   Output ~ 0
VID_D6
Text HLabel 7700 4000 2    60   Output ~ 0
VID_D7
Wire Wire Line
	7700 2800 6950 2800
Wire Wire Line
	7700 2900 6950 2900
Wire Wire Line
	7700 3000 6950 3000
Wire Wire Line
	7700 3200 6950 3200
Wire Wire Line
	7700 3300 6950 3300
Wire Wire Line
	7700 3400 6950 3400
Wire Wire Line
	7700 3500 6950 3500
Wire Wire Line
	7700 3600 6950 3600
Wire Wire Line
	7700 3700 6950 3700
Wire Wire Line
	7700 3800 6950 3800
Wire Wire Line
	7700 4000 6950 4000
$Comp
L R0603_3K3_1%_0.1W_100PPM R48
U 1 1 599279EE
P 7400 4150
F 0 "R48" V 7504 4210 50  0000 L CNN
F 1 "R0603_3K3_1%_0.1W_100PPM" H 7400 3940 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 7400 3130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7400 3760 60  0001 L CNN
F 4 "3k3" V 7595 4210 50  0000 L CNN "~"
F 5 "R0603_3K3_1%_0.1W_100PPM" H 7400 3670 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 7400 3580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 7400 3490 60  0001 L CNN "Library Path"
F 8 "=Value" H 7400 3400 60  0001 L CNN "Comment"
F 9 "Standard" H 7400 3310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 7400 3220 60  0001 L CNN "Component Type"
F 11 "~~" H 7400 3040 60  0001 L CNN "PackageDescription"
F 12 "2" H 7400 2950 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 7400 2860 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 7400 2770 60  0001 L CNN "Footprint Ref"
F 15 "3k3" H 7400 2680 60  0001 L CNN "Val"
F 16 "Preferred" H 7400 2590 60  0001 L CNN "Status"
F 17 "0.1W" H 7400 2500 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 7400 2410 60  0001 L CNN "TC"
F 19 "~~" H 7400 2320 60  0001 L CNN "Voltage"
F 20 "±1%" H 7400 2230 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 7400 2140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 7400 2050 60  0001 L CNN "Manufacturer"
F 23 "R0603_3K3_1%_0.1W_100PPM" H 7400 1960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 7400 1870 60  0001 L CNN "Case"
F 25 "No" H 7400 1780 60  0001 L CNN "PressFit"
F 26 "Yes" H 7400 1690 60  0001 L CNN "Mounted"
F 27 "~~" H 7400 1600 60  0001 L CNN "Sense Comment"
F 28 "No" H 7400 1510 60  0001 L CNN "Sense"
F 29 "~~" H 7400 1420 60  0001 L CNN "Status Comment"
F 30 "No" H 7400 1330 60  0001 L CNN "Socket"
F 31 "Yes" H 7400 1240 60  0001 L CNN "SMD"
F 32 "~~" H 7400 1150 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 7400 1060 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F3301TRF" H 7400 970 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 7400 880 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7400 790 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 7400 700 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 7400 610 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 7400 520 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 7400 430 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7400 340 60  0001 L CNN "License"
	1    7400 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4150 7400 4000
Connection ~ 7400 4000
$Comp
L GND #PWR0131
U 1 1 59927CC9
P 7400 4450
F 0 "#PWR0131" H 7400 4200 50  0001 C CNN
F 1 "GND" H 7405 4277 50  0000 C CNN
F 2 "" H 7400 4450 50  0001 C CNN
F 3 "" H 7400 4450 50  0001 C CNN
	1    7400 4450
	1    0    0    -1  
$EndComp
Text Notes 750  7600 0    40   ~ 0
Copyright 2013-2017 twl <twlostow@printf.cc>\n\nThis documentation describes Open Hardware and is licensed under\nthe CERN OHL v. 1.2. You may redistribute and modify this documentation\nunder the terms of the CERN OHL v.1.2. (http://ohwr.org/CERNOHL).\nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY\nAND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2\nfor applicable conditions.\n
Wire Notes Line
	700  6950 700  7650
Wire Notes Line
	700  7650 3100 7650
Wire Notes Line
	3100 7650 3100 6950
Wire Notes Line
	3100 6950 700  6950
Text Notes 10100 6825 2    150  ~ 0
HDMI DSI Shield
Text Notes 10100 7025 2    100  ~ 0
Composite video decoder
Text Notes 10825 7650 2    60   ~ 0
2.2a
Text Notes 8525 7500 2    60   ~ 0
Composite input/decoder
$EndSCHEMATC
