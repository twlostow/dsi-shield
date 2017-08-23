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
Sheet 9 13
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
L LM26480 IC4
U 1 1 599BC23D
P 2500 1300
F 0 "IC4" H 2950 1465 50  0000 C CNN
F 1 "LM26480" H 2500 -1890 60  0001 L CNN
F 2 "ICs And Semiconductors SMD:QFN50P400X400X80-25N-S230" H 2500 -1980 60  0001 L CNN
F 3 "" H 2500 -2070 60  0001 L CNN
F 4 "Yes" H 2500 -2160 60  0001 L CNN "Field4"
F 5 "LM26480SQ-AA" H 2500 -2250 60  0001 L CNN "Field5"
F 6 "LM26480" H 2950 1374 50  0000 C CNN "Field6"
	1    2500 1300
	1    0    0    -1  
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C43
U 1 1 599BCDB0
P 1800 1050
F 0 "C43" V 1904 1160 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 1800 790 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1800 -20 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1800 610 60  0001 L CNN
F 4 "1uF" V 1995 1160 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 1800 520 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1800 430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1800 340 60  0001 L CNN "Library Path"
F 8 "=Value" H 1800 250 60  0001 L CNN "Comment"
F 9 "Standard" H 1800 160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1800 70  60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1800 -110 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1800 -200 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1800 -290 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1800 -380 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 1800 -470 60  0001 L CNN "Val"
F 16 "None" H 1800 -560 60  0001 L CNN "Status"
F 17 "~~" H 1800 -650 60  0001 L CNN "Status Comment"
F 18 "50V" H 1800 -740 60  0001 L CNN "Voltage"
F 19 "X5R" H 1800 -830 60  0001 L CNN "TC"
F 20 "±10%" H 1800 -920 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1800 -1010 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1800 -1100 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 1800 -1190 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1800 -1280 60  0001 L CNN "Case"
F 25 "Yes" H 1800 -1370 60  0001 L CNN "Mounted"
F 26 "No" H 1800 -1460 60  0001 L CNN "Socket"
F 27 "Yes" H 1800 -1550 60  0001 L CNN "SMD"
F 28 "~~" H 1800 -1640 60  0001 L CNN "PressFit"
F 29 "No" H 1800 -1730 60  0001 L CNN "Sense"
F 30 "~~" H 1800 -1820 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1800 -1910 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 1800 -2000 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 1800 -2090 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 1800 -2180 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1800 -2270 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 1800 -2360 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 1800 -2450 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 1800 -2540 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1800 -2630 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1800 -2720 60  0001 L CNN "License"
	1    1800 1050
	0    1    1    0   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C42
U 1 1 599BCF06
P 1550 1050
F 0 "C42" V 1654 941 50  0000 R CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 1550 790 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 -20 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 610 60  0001 L CNN
F 4 "1uF" V 1745 941 50  0000 R CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 1550 520 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 340 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 250 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 70  60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 -110 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 -200 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 -290 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 -380 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 1550 -470 60  0001 L CNN "Val"
F 16 "None" H 1550 -560 60  0001 L CNN "Status"
F 17 "~~" H 1550 -650 60  0001 L CNN "Status Comment"
F 18 "50V" H 1550 -740 60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 -830 60  0001 L CNN "TC"
F 20 "±10%" H 1550 -920 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 -1010 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 -1100 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 1550 -1190 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 -1280 60  0001 L CNN "Case"
F 25 "Yes" H 1550 -1370 60  0001 L CNN "Mounted"
F 26 "No" H 1550 -1460 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 -1550 60  0001 L CNN "SMD"
F 28 "~~" H 1550 -1640 60  0001 L CNN "PressFit"
F 29 "No" H 1550 -1730 60  0001 L CNN "Sense"
F 30 "~~" H 1550 -1820 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 -1910 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 1550 -2000 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 1550 -2090 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 1550 -2180 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 -2270 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 1550 -2360 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 1550 -2450 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 1550 -2540 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 -2630 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 -2720 60  0001 L CNN "License"
	1    1550 1050
	0    1    1    0   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C47
U 1 1 599BCF78
P 1550 1850
F 0 "C47" V 1654 1960 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 1550 1590 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 780 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 1410 60  0001 L CNN
F 4 "1uF" V 1745 1960 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 1550 1320 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 1230 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 1140 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 1050 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 960 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 870 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 690 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 600 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 510 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 420 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 1550 330 60  0001 L CNN "Val"
F 16 "None" H 1550 240 60  0001 L CNN "Status"
F 17 "~~" H 1550 150 60  0001 L CNN "Status Comment"
F 18 "50V" H 1550 60  60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 -30 60  0001 L CNN "TC"
F 20 "±10%" H 1550 -120 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 -210 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 -300 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 1550 -390 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 -480 60  0001 L CNN "Case"
F 25 "Yes" H 1550 -570 60  0001 L CNN "Mounted"
F 26 "No" H 1550 -660 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 -750 60  0001 L CNN "SMD"
F 28 "~~" H 1550 -840 60  0001 L CNN "PressFit"
F 29 "No" H 1550 -930 60  0001 L CNN "Sense"
F 30 "~~" H 1550 -1020 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 -1110 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 1550 -1200 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 1550 -1290 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 1550 -1380 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 -1470 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 1550 -1560 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 1550 -1650 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 1550 -1740 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 -1830 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 -1920 60  0001 L CNN "License"
	1    1550 1850
	0    1    1    0   
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C41
U 1 1 599BD178
P 1550 2450
F 0 "C41" V 1654 2560 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 1550 2190 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 1380 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 2010 60  0001 L CNN
F 4 "1uF" V 1745 2560 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 1550 1920 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 1830 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 1740 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 1650 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 1560 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 1470 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 1290 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 1200 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 1110 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 1020 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 1550 930 60  0001 L CNN "Val"
F 16 "None" H 1550 840 60  0001 L CNN "Status"
F 17 "~~" H 1550 750 60  0001 L CNN "Status Comment"
F 18 "50V" H 1550 660 60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 570 60  0001 L CNN "TC"
F 20 "±10%" H 1550 480 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 390 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 300 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 1550 210 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 120 60  0001 L CNN "Case"
F 25 "Yes" H 1550 30  60  0001 L CNN "Mounted"
F 26 "No" H 1550 -60 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 -150 60  0001 L CNN "SMD"
F 28 "~~" H 1550 -240 60  0001 L CNN "PressFit"
F 29 "No" H 1550 -330 60  0001 L CNN "Sense"
F 30 "~~" H 1550 -420 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 -510 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 1550 -600 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 1550 -690 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 1550 -780 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 -870 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 1550 -960 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 1550 -1050 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 1550 -1140 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 -1230 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 -1320 60  0001 L CNN "License"
	1    1550 2450
	0    1    1    0   
$EndComp
$Comp
L CC0603_4.7UF_6.3V_10%_X5R C55
U 1 1 599BE71D
P 1550 3050
F 0 "C55" V 1654 3160 50  0000 L CNN
F 1 "CC0603_4.7UF_6.3V_10%_X5R" H 1550 2790 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 1980 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 1550 2610 60  0001 L CNN
F 4 "4.7uF" V 1745 3160 50  0000 L CNN "~"
F 5 "CC0603_4.7UF_6.3V_10%_X5R" H 1550 2520 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 2430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 2340 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 2250 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 2160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 2070 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 1890 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 1800 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 1710 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 1620 60  0001 L CNN "PackageDescription"
F 15 "4.7uF" H 1550 1530 60  0001 L CNN "Val"
F 16 "Preferred" H 1550 1440 60  0001 L CNN "Status"
F 17 "~~" H 1550 1350 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 1550 1260 60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 1170 60  0001 L CNN "TC"
F 20 "±10%" H 1550 1080 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 990 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 900 60  0001 L CNN "Manufacturer"
F 23 "CC0603_4.7uF_6.3V_10%_X5R" H 1550 810 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 720 60  0001 L CNN "Case"
F 25 "Yes" H 1550 630 60  0001 L CNN "Mounted"
F 26 "No" H 1550 540 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 450 60  0001 L CNN "SMD"
F 28 "~~" H 1550 360 60  0001 L CNN "PressFit"
F 29 "No" H 1550 270 60  0001 L CNN "Sense"
F 30 "~~" H 1550 180 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 90  60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 1550 0   60  0001 L CNN "Manufacturer1 Example"
F 33 "225520613672" H 1550 -90 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 1550 -180 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 1550 -270 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 1550 -360 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 1550 -450 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 1550 -540 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 -630 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 -720 60  0001 L CNN "License"
	1    1550 3050
	0    1    1    0   
$EndComp
$Comp
L CC0603_4.7UF_6.3V_10%_X5R C56
U 1 1 599BE89F
P 1550 3650
F 0 "C56" V 1654 3760 50  0000 L CNN
F 1 "CC0603_4.7UF_6.3V_10%_X5R" H 1550 3390 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 2580 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 1550 3210 60  0001 L CNN
F 4 "4.7uF" V 1745 3760 50  0000 L CNN "~"
F 5 "CC0603_4.7UF_6.3V_10%_X5R" H 1550 3120 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 3030 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 2940 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 2850 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 2760 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 2670 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 2490 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 2400 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 2310 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 2220 60  0001 L CNN "PackageDescription"
F 15 "4.7uF" H 1550 2130 60  0001 L CNN "Val"
F 16 "Preferred" H 1550 2040 60  0001 L CNN "Status"
F 17 "~~" H 1550 1950 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 1550 1860 60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 1770 60  0001 L CNN "TC"
F 20 "±10%" H 1550 1680 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 1590 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 1500 60  0001 L CNN "Manufacturer"
F 23 "CC0603_4.7uF_6.3V_10%_X5R" H 1550 1410 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 1320 60  0001 L CNN "Case"
F 25 "Yes" H 1550 1230 60  0001 L CNN "Mounted"
F 26 "No" H 1550 1140 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 1050 60  0001 L CNN "SMD"
F 28 "~~" H 1550 960 60  0001 L CNN "PressFit"
F 29 "No" H 1550 870 60  0001 L CNN "Sense"
F 30 "~~" H 1550 780 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 690 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 1550 600 60  0001 L CNN "Manufacturer1 Example"
F 33 "225520613672" H 1550 510 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 1550 420 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 1550 330 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 1550 240 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 1550 150 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 1550 60  60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 -30 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 -120 60  0001 L CNN "License"
	1    1550 3650
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR051
U 1 1 599BECB2
P 1350 1400
F 0 "#PWR051" H 1350 1250 50  0001 C CNN
F 1 "+5V" V 1365 1528 50  0000 L CNN
F 2 "" H 1350 1400 50  0001 C CNN
F 3 "" H 1350 1400 50  0001 C CNN
	1    1350 1400
	0    -1   -1   0   
$EndComp
$Comp
L +1V8 #PWR052
U 1 1 599BEDDC
P 1350 1800
F 0 "#PWR052" H 1350 1650 50  0001 C CNN
F 1 "+1V8" V 1365 1928 50  0000 L CNN
F 2 "" H 1350 1800 50  0001 C CNN
F 3 "" H 1350 1800 50  0001 C CNN
	1    1350 1800
	0    -1   -1   0   
$EndComp
$Comp
L +3V3 #PWR053
U 1 1 599BEF15
P 1350 2400
F 0 "#PWR053" H 1350 2250 50  0001 C CNN
F 1 "+3V3" V 1365 2528 50  0000 L CNN
F 2 "" H 1350 2400 50  0001 C CNN
F 3 "" H 1350 2400 50  0001 C CNN
	1    1350 2400
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR054
U 1 1 599BF223
P 1350 3000
F 0 "#PWR054" H 1350 2850 50  0001 C CNN
F 1 "+5V" V 1365 3128 50  0000 L CNN
F 2 "" H 1350 3000 50  0001 C CNN
F 3 "" H 1350 3000 50  0001 C CNN
	1    1350 3000
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR055
U 1 1 599BF307
P 1350 3600
F 0 "#PWR055" H 1350 3450 50  0001 C CNN
F 1 "+5V" V 1365 3728 50  0000 L CNN
F 2 "" H 1350 3600 50  0001 C CNN
F 3 "" H 1350 3600 50  0001 C CNN
	1    1350 3600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR056
U 1 1 599BF571
P 1550 2150
F 0 "#PWR056" H 1550 1900 50  0001 C CNN
F 1 "GND" H 1555 1977 50  0000 C CNN
F 2 "" H 1550 2150 50  0001 C CNN
F 3 "" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR057
U 1 1 599BF59F
P 1550 2750
F 0 "#PWR057" H 1550 2500 50  0001 C CNN
F 1 "GND" H 1555 2577 50  0000 C CNN
F 2 "" H 1550 2750 50  0001 C CNN
F 3 "" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR058
U 1 1 599BF603
P 1550 3350
F 0 "#PWR058" H 1550 3100 50  0001 C CNN
F 1 "GND" H 1555 3177 50  0000 C CNN
F 2 "" H 1550 3350 50  0001 C CNN
F 3 "" H 1550 3350 50  0001 C CNN
	1    1550 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR059
U 1 1 599BF61C
P 1550 3950
F 0 "#PWR059" H 1550 3700 50  0001 C CNN
F 1 "GND" H 1555 3777 50  0000 C CNN
F 2 "" H 1550 3950 50  0001 C CNN
F 3 "" H 1550 3950 50  0001 C CNN
	1    1550 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR060
U 1 1 599BF635
P 1550 1050
F 0 "#PWR060" H 1550 800 50  0001 C CNN
F 1 "GND" H 1555 877 50  0000 C CNN
F 2 "" H 1550 1050 50  0001 C CNN
F 3 "" H 1550 1050 50  0001 C CNN
	1    1550 1050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR061
U 1 1 599BF65C
P 1800 1050
F 0 "#PWR061" H 1800 800 50  0001 C CNN
F 1 "GND" H 1805 877 50  0000 C CNN
F 2 "" H 1800 1050 50  0001 C CNN
F 3 "" H 1800 1050 50  0001 C CNN
	1    1800 1050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR062
U 1 1 599C01BA
P 2100 4350
F 0 "#PWR062" H 2100 4100 50  0001 C CNN
F 1 "GND" H 2105 4177 50  0000 C CNN
F 2 "" H 2100 4350 50  0001 C CNN
F 3 "" H 2100 4350 50  0001 C CNN
	1    2100 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR063
U 1 1 599C0DE2
P 4900 4850
F 0 "#PWR063" H 4900 4600 50  0001 C CNN
F 1 "GND" H 4905 4677 50  0000 C CNN
F 2 "" H 4900 4850 50  0001 C CNN
F 3 "" H 4900 4850 50  0001 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L DLCSM0315D-2R2-K L3
U 1 1 598E7CEC
P 4500 2800
F 0 "L3" H 4650 2714 50  0000 C CNN
F 1 "2.2uH" H 4650 2615 60  0000 C CNN
F 2 "dsi_shield:IND_PANASONIC_ELLVEG" H 4500 2800 60  0001 C CNN
F 3 "" H 4500 2800 60  0001 C CNN
F 4 "Value" H 4500 2800 60  0001 C CNN "Fieldname"
F 5 "1.4A" H 4500 1800 60  0001 L CNN "Power"
F 6 "0.23R" H 4500 1710 60  0001 L CNN "Resistance"
F 7 "±20%" H 4500 1620 60  0001 L CNN "Tollerance"
F 8 "Chip Inductor (Chip Coil) for Choke Wire Wound Type" H 4500 1530 60  0001 L CNN "Description"
F 9 "KINGCORE" H 4500 1440 60  0001 L CNN "Manufacturer"
F 10 "DLCSM0315D-2R2-K" H 4500 1350 60  0001 L CNN "Manufacturer Part Number"
F 11 "Yes" H 4500 1260 60  0001 L CNN "Mounted"
F 12 "Yes" H 4500 1080 60  0001 L CNN "SMD"
	1    4500 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR064
U 1 1 598E7F6B
P 3950 1200
F 0 "#PWR064" H 3950 950 50  0001 C CNN
F 1 "GND" H 3955 1027 50  0000 C CNN
F 2 "" H 3950 1200 50  0001 C CNN
F 3 "" H 3950 1200 50  0001 C CNN
	1    3950 1200
	-1   0    0    1   
$EndComp
$Comp
L R0603_100K_1%_0.1W_100PPM R35
U 1 1 598E8CB5
P 4200 1500
F 0 "R35" H 4350 1697 50  0000 C CNN
F 1 "R0603_100K_1%_0.1W_100PPM" H 4200 1290 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4200 480 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4200 1110 60  0001 L CNN
F 4 "100k" H 4350 1606 50  0000 C CNN "~"
F 5 "R0603_100K_1%_0.1W_100PPM" H 4200 1020 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4200 930 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4200 840 60  0001 L CNN "Library Path"
F 8 "=Value" H 4200 750 60  0001 L CNN "Comment"
F 9 "Standard" H 4200 660 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4200 570 60  0001 L CNN "Component Type"
F 11 "~~" H 4200 390 60  0001 L CNN "PackageDescription"
F 12 "2" H 4200 300 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4200 210 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4200 120 60  0001 L CNN "Footprint Ref"
F 15 "100k" H 4200 30  60  0001 L CNN "Val"
F 16 "Preferred" H 4200 -60 60  0001 L CNN "Status"
F 17 "0.1W" H 4200 -150 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4200 -240 60  0001 L CNN "TC"
F 19 "~~" H 4200 -330 60  0001 L CNN "Voltage"
F 20 "±1%" H 4200 -420 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4200 -510 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4200 -600 60  0001 L CNN "Manufacturer"
F 23 "R0603_100K_1%_0.1W_100PPM" H 4200 -690 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4200 -780 60  0001 L CNN "Case"
F 25 "No" H 4200 -870 60  0001 L CNN "PressFit"
F 26 "Yes" H 4200 -960 60  0001 L CNN "Mounted"
F 27 "~~" H 4200 -1050 60  0001 L CNN "Sense Comment"
F 28 "No" H 4200 -1140 60  0001 L CNN "Sense"
F 29 "~~" H 4200 -1230 60  0001 L CNN "Status Comment"
F 30 "No" H 4200 -1320 60  0001 L CNN "Socket"
F 31 "Yes" H 4200 -1410 60  0001 L CNN "SMD"
F 32 "~~" H 4200 -1500 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4200 -1590 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1003TRF" H 4200 -1680 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4200 -1770 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4200 -1860 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4200 -1950 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4200 -2040 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4200 -2130 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4200 -2220 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4200 -2310 60  0001 L CNN "License"
	1    4200 1500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR065
U 1 1 598E8F07
P 4550 1250
F 0 "#PWR065" H 4550 1100 50  0001 C CNN
F 1 "+5V" V 4565 1378 50  0000 L CNN
F 2 "" H 4550 1250 50  0001 C CNN
F 3 "" H 4550 1250 50  0001 C CNN
	1    4550 1250
	1    0    0    -1  
$EndComp
$Comp
L R0603_270K_1%_0.1W_100PPM R36
U 1 1 598EB236
P 4500 1800
F 0 "R36" H 4650 1997 50  0000 C CNN
F 1 "R0603_280K_1%_0.1W_100PPM" H 4500 1590 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4500 780 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4500 1410 60  0001 L CNN
F 4 "Value" H 4500 1800 60  0001 C CNN "Fieldname"
F 5 "280k" H 4650 1906 50  0000 C CNN "~"
F 6 "R0603_270K_1%_0.1W_100PPM" H 4500 1320 60  0001 L CNN "Part Number"
F 7 "Resistor - 1%" H 4500 1230 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Resistors.SchLib" H 4500 1140 60  0001 L CNN "Library Path"
F 9 "=Value" H 4500 1050 60  0001 L CNN "Comment"
F 10 "Standard" H 4500 960 60  0001 L CNN "Component Kind"
F 11 "Standard" H 4500 870 60  0001 L CNN "Component Type"
F 12 "~~" H 4500 690 60  0001 L CNN "PackageDescription"
F 13 "2" H 4500 600 60  0001 L CNN "Pin Count"
F 14 "PcbLib\\Resistors SMD.PcbLib" H 4500 510 60  0001 L CNN "Footprint Path"
F 15 "RESC1608X55N" H 4500 420 60  0001 L CNN "Footprint Ref"
F 16 "280k" H 4500 330 60  0001 L CNN "Val"
F 17 "Preferred" H 4500 240 60  0001 L CNN "Status"
F 18 "0.1W" H 4500 150 60  0001 L CNN "Power"
F 19 "±100ppm/°C" H 4500 60  60  0001 L CNN "TC"
F 20 "~~" H 4500 -30 60  0001 L CNN "Voltage"
F 21 "±1%" H 4500 -120 60  0001 L CNN "Tolerance"
F 22 "General Purpose Thick Film Chip Resistor" H 4500 -210 60  0001 L CNN "Part Description"
F 23 "GENERIC" H 4500 -300 60  0001 L CNN "Manufacturer"
F 24 "R0603_280K_1%_0.1W_100PPM" H 4500 -390 60  0001 L CNN "Manufacturer Part Number"
F 25 "0603" H 4500 -480 60  0001 L CNN "Case"
F 26 "No" H 4500 -570 60  0001 L CNN "PressFit"
F 27 "Yes" H 4500 -660 60  0001 L CNN "Mounted"
F 28 "~~" H 4500 -750 60  0001 L CNN "Sense Comment"
F 29 "No" H 4500 -840 60  0001 L CNN "Sense"
F 30 "~~" H 4500 -930 60  0001 L CNN "Status Comment"
F 31 "No" H 4500 -1020 60  0001 L CNN "Socket"
F 32 "Yes" H 4500 -1110 60  0001 L CNN "SMD"
F 33 "~~" H 4500 -1200 60  0001 L CNN "ComponentHeight"
F 34 "NIC COMPONENT" H 4500 -1290 60  0001 L CNN "Manufacturer1 Example"
F 35 "0.55mm" H 4500 -1470 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4500 -1560 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4500 -1650 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4500 -1740 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4500 -1830 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4500 -1920 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4500 -2010 60  0001 L CNN "License"
	1    4500 1800
	1    0    0    -1  
$EndComp
$Comp
L R0603_200K_1%_0.1W_100PPM R37
U 1 1 598EC8D2
P 5100 2000
F 0 "R37" H 5250 2197 50  0000 C CNN
F 1 "R0603_200K_1%_0.1W_100PPM" H 5100 1790 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 5100 980 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5100 1610 60  0001 L CNN
F 4 "200k" H 5250 2106 50  0000 C CNN "~"
F 5 "R0603_200K_1%_0.1W_100PPM" H 5100 1520 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 5100 1430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 5100 1340 60  0001 L CNN "Library Path"
F 8 "=Value" H 5100 1250 60  0001 L CNN "Comment"
F 9 "Standard" H 5100 1160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5100 1070 60  0001 L CNN "Component Type"
F 11 "~~" H 5100 890 60  0001 L CNN "PackageDescription"
F 12 "2" H 5100 800 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 5100 710 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 5100 620 60  0001 L CNN "Footprint Ref"
F 15 "200k" H 5100 530 60  0001 L CNN "Val"
F 16 "Preferred" H 5100 440 60  0001 L CNN "Status"
F 17 "0.1W" H 5100 350 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 5100 260 60  0001 L CNN "TC"
F 19 "~~" H 5100 170 60  0001 L CNN "Voltage"
F 20 "±1%" H 5100 80  60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 5100 -10 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5100 -100 60  0001 L CNN "Manufacturer"
F 23 "R0603_200K_1%_0.1W_100PPM" H 5100 -190 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5100 -280 60  0001 L CNN "Case"
F 25 "No" H 5100 -370 60  0001 L CNN "PressFit"
F 26 "Yes" H 5100 -460 60  0001 L CNN "Mounted"
F 27 "~~" H 5100 -550 60  0001 L CNN "Sense Comment"
F 28 "No" H 5100 -640 60  0001 L CNN "Sense"
F 29 "~~" H 5100 -730 60  0001 L CNN "Status Comment"
F 30 "No" H 5100 -820 60  0001 L CNN "Socket"
F 31 "Yes" H 5100 -910 60  0001 L CNN "SMD"
F 32 "~~" H 5100 -1000 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 5100 -1090 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F2003TRF" H 5100 -1180 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 5100 -1270 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5100 -1360 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 5100 -1450 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 5100 -1540 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 5100 -1630 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 5100 -1720 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5100 -1810 60  0001 L CNN "License"
	1    5100 2000
	1    0    0    -1  
$EndComp
$Comp
L +1V2 #PWR066
U 1 1 598ECD6B
P 5650 1600
F 0 "#PWR066" H 5650 1450 50  0001 C CNN
F 1 "+1V2" V 5665 1728 50  0000 L CNN
F 2 "" H 5650 1600 50  0001 C CNN
F 3 "" H 5650 1600 50  0001 C CNN
	1    5650 1600
	0    1    1    0   
$EndComp
$Comp
L CC0805_10UF_16V_10%_X5R C46
U 1 1 598ED790
P 5600 1650
F 0 "C46" V 5704 1760 50  0000 L CNN
F 1 "CC0805_10UF_16V_10%_X5R" H 5600 1390 60  0001 L CNN
F 2 "Capacitors SMD:CAPC2012X135N" H 5600 580 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5600 1210 60  0001 L CNN
F 4 "10uF" V 5795 1760 50  0000 L CNN "~"
F 5 "CC0805_10UF_16V_10%_X5R" H 5600 1120 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5600 1030 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5600 940 60  0001 L CNN "Library Path"
F 8 "=Value" H 5600 850 60  0001 L CNN "Comment"
F 9 "Standard" H 5600 760 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5600 670 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5600 490 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5600 400 60  0001 L CNN "Footprint Path"
F 13 "CAPC2012X135N" H 5600 310 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5600 220 60  0001 L CNN "PackageDescription"
F 15 "10uF" H 5600 130 60  0001 L CNN "Val"
F 16 "Preferred" H 5600 40  60  0001 L CNN "Status"
F 17 "~~" H 5600 -50 60  0001 L CNN "Status Comment"
F 18 "16V" H 5600 -140 60  0001 L CNN "Voltage"
F 19 "X5R" H 5600 -230 60  0001 L CNN "TC"
F 20 "±10%" H 5600 -320 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5600 -410 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5600 -500 60  0001 L CNN "Manufacturer"
F 23 "CC0805_10UF_16V_10%_X5R" H 5600 -590 60  0001 L CNN "Manufacturer Part Number"
F 24 "0805" H 5600 -680 60  0001 L CNN "Case"
F 25 "Yes" H 5600 -770 60  0001 L CNN "Mounted"
F 26 "No" H 5600 -860 60  0001 L CNN "Socket"
F 27 "Yes" H 5600 -950 60  0001 L CNN "SMD"
F 28 "~~" H 5600 -1040 60  0001 L CNN "PressFit"
F 29 "No" H 5600 -1130 60  0001 L CNN "Sense"
F 30 "~~" H 5600 -1220 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5600 -1310 60  0001 L CNN "ComponentHeight"
F 32 "KEMET" H 5600 -1400 60  0001 L CNN "Manufacturer1 Example"
F 33 "C0805C106K4PAC" H 5600 -1490 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "1.4mm" H 5600 -1580 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5600 -1670 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5600 -1760 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5600 -1850 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5600 -1940 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5600 -2030 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5600 -2120 60  0001 L CNN "License"
	1    5600 1650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR067
U 1 1 598ED9DA
P 5700 2000
F 0 "#PWR067" H 5700 1750 50  0001 C CNN
F 1 "GND" H 5705 1827 50  0000 C CNN
F 2 "" H 5700 2000 50  0001 C CNN
F 3 "" H 5700 2000 50  0001 C CNN
	1    5700 2000
	0    -1   -1   0   
$EndComp
$Comp
L R0603_750K_1%_0.1W_100PPM R38
U 1 1 598EF237
P 4500 2400
F 0 "R38" H 4650 2597 50  0000 C CNN
F 1 "R0603_750K_1%_0.1W_100PPM" H 4500 2190 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4500 1380 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4500 2010 60  0001 L CNN
F 4 "750k" H 4650 2506 50  0000 C CNN "~"
F 5 "R0603_750K_1%_0.1W_100PPM" H 4500 1920 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4500 1830 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4500 1740 60  0001 L CNN "Library Path"
F 8 "=Value" H 4500 1650 60  0001 L CNN "Comment"
F 9 "Standard" H 4500 1560 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4500 1470 60  0001 L CNN "Component Type"
F 11 "~~" H 4500 1290 60  0001 L CNN "PackageDescription"
F 12 "2" H 4500 1200 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4500 1110 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4500 1020 60  0001 L CNN "Footprint Ref"
F 15 "750k" H 4500 930 60  0001 L CNN "Val"
F 16 "Preferred" H 4500 840 60  0001 L CNN "Status"
F 17 "0.1W" H 4500 750 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4500 660 60  0001 L CNN "TC"
F 19 "~~" H 4500 570 60  0001 L CNN "Voltage"
F 20 "±1%" H 4500 480 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4500 390 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4500 300 60  0001 L CNN "Manufacturer"
F 23 "R0603_750K_1%_0.1W_100PPM" H 4500 210 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4500 120 60  0001 L CNN "Case"
F 25 "No" H 4500 30  60  0001 L CNN "PressFit"
F 26 "Yes" H 4500 -60 60  0001 L CNN "Mounted"
F 27 "~~" H 4500 -150 60  0001 L CNN "Sense Comment"
F 28 "No" H 4500 -240 60  0001 L CNN "Sense"
F 29 "~~" H 4500 -330 60  0001 L CNN "Status Comment"
F 30 "No" H 4500 -420 60  0001 L CNN "Socket"
F 31 "Yes" H 4500 -510 60  0001 L CNN "SMD"
F 32 "~~" H 4500 -600 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4500 -690 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F7503TRF" H 4500 -780 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4500 -870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4500 -960 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4500 -1050 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4500 -1140 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4500 -1230 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4500 -1320 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4500 -1410 60  0001 L CNN "License"
	1    4500 2400
	1    0    0    -1  
$EndComp
$Comp
L R0603_270K_1%_0.1W_100PPM R40
U 1 1 598EFA43
P 5100 2600
F 0 "R40" H 5250 2797 50  0000 C CNN
F 1 "R0603_187K_1%_0.1W_100PPM" H 5100 2390 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 5100 1580 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5100 2210 60  0001 L CNN
F 4 "Value" H 5100 2600 60  0001 C CNN "Fieldname"
F 5 "187k" H 5250 2706 50  0000 C CNN "~"
F 6 "R0603_187K_1%_0.1W_100PPM" H 5100 2120 60  0001 L CNN "Part Number"
F 7 "Resistor - 1%" H 5100 2030 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Resistors.SchLib" H 5100 1940 60  0001 L CNN "Library Path"
F 9 "=Value" H 5100 1850 60  0001 L CNN "Comment"
F 10 "Standard" H 5100 1760 60  0001 L CNN "Component Kind"
F 11 "Standard" H 5100 1670 60  0001 L CNN "Component Type"
F 12 "~~" H 5100 1490 60  0001 L CNN "PackageDescription"
F 13 "2" H 5100 1400 60  0001 L CNN "Pin Count"
F 14 "PcbLib\\Resistors SMD.PcbLib" H 5100 1310 60  0001 L CNN "Footprint Path"
F 15 "RESC1608X55N" H 5100 1220 60  0001 L CNN "Footprint Ref"
F 16 "187k" H 5100 1130 60  0001 L CNN "Val"
F 17 "Preferred" H 5100 1040 60  0001 L CNN "Status"
F 18 "0.1W" H 5100 950 60  0001 L CNN "Power"
F 19 "±100ppm/°C" H 5100 860 60  0001 L CNN "TC"
F 20 "~~" H 5100 770 60  0001 L CNN "Voltage"
F 21 "±1%" H 5100 680 60  0001 L CNN "Tolerance"
F 22 "General Purpose Thick Film Chip Resistor" H 5100 590 60  0001 L CNN "Part Description"
F 23 "GENERIC" H 5100 500 60  0001 L CNN "Manufacturer"
F 24 "R0603_187K_1%_0.1W_100PPM" H 5100 410 60  0001 L CNN "Manufacturer Part Number"
F 25 "0603" H 5100 320 60  0001 L CNN "Case"
F 26 "No" H 5100 230 60  0001 L CNN "PressFit"
F 27 "Yes" H 5100 140 60  0001 L CNN "Mounted"
F 28 "~~" H 5100 50  60  0001 L CNN "Sense Comment"
F 29 "No" H 5100 -40 60  0001 L CNN "Sense"
F 30 "~~" H 5100 -130 60  0001 L CNN "Status Comment"
F 31 "No" H 5100 -220 60  0001 L CNN "Socket"
F 32 "Yes" H 5100 -310 60  0001 L CNN "SMD"
F 33 "~~" H 5100 -400 60  0001 L CNN "ComponentHeight"
F 34 "NIC COMPONENT" H 5100 -490 60  0001 L CNN "Manufacturer1 Example"
F 35 "0.55mm" H 5100 -670 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5100 -760 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 5100 -850 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 5100 -940 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 5100 -1030 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 5100 -1120 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5100 -1210 60  0001 L CNN "License"
	1    5100 2600
	1    0    0    -1  
$EndComp
$Comp
L +2V5 #PWR068
U 1 1 598EFDEF
P 5650 2200
F 0 "#PWR068" H 5650 2050 50  0001 C CNN
F 1 "+2V5" V 5665 2328 50  0000 L CNN
F 2 "" H 5650 2200 50  0001 C CNN
F 3 "" H 5650 2200 50  0001 C CNN
	1    5650 2200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR069
U 1 1 598EFE2E
P 5650 2600
F 0 "#PWR069" H 5650 2350 50  0001 C CNN
F 1 "GND" H 5655 2427 50  0000 C CNN
F 2 "" H 5650 2600 50  0001 C CNN
F 3 "" H 5650 2600 50  0001 C CNN
	1    5650 2600
	0    -1   -1   0   
$EndComp
$Comp
L CC0805_10UF_16V_10%_X5R C50
U 1 1 598EFEC7
P 5600 2250
F 0 "C50" V 5704 2360 50  0000 L CNN
F 1 "CC0805_10UF_16V_10%_X5R" H 5600 1990 60  0001 L CNN
F 2 "Capacitors SMD:CAPC2012X135N" H 5600 1180 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5600 1810 60  0001 L CNN
F 4 "10uF" V 5795 2360 50  0000 L CNN "~"
F 5 "CC0805_10UF_16V_10%_X5R" H 5600 1720 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5600 1630 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5600 1540 60  0001 L CNN "Library Path"
F 8 "=Value" H 5600 1450 60  0001 L CNN "Comment"
F 9 "Standard" H 5600 1360 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5600 1270 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5600 1090 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5600 1000 60  0001 L CNN "Footprint Path"
F 13 "CAPC2012X135N" H 5600 910 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5600 820 60  0001 L CNN "PackageDescription"
F 15 "10uF" H 5600 730 60  0001 L CNN "Val"
F 16 "Preferred" H 5600 640 60  0001 L CNN "Status"
F 17 "~~" H 5600 550 60  0001 L CNN "Status Comment"
F 18 "16V" H 5600 460 60  0001 L CNN "Voltage"
F 19 "X5R" H 5600 370 60  0001 L CNN "TC"
F 20 "±10%" H 5600 280 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5600 190 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5600 100 60  0001 L CNN "Manufacturer"
F 23 "CC0805_10UF_16V_10%_X5R" H 5600 10  60  0001 L CNN "Manufacturer Part Number"
F 24 "0805" H 5600 -80 60  0001 L CNN "Case"
F 25 "Yes" H 5600 -170 60  0001 L CNN "Mounted"
F 26 "No" H 5600 -260 60  0001 L CNN "Socket"
F 27 "Yes" H 5600 -350 60  0001 L CNN "SMD"
F 28 "~~" H 5600 -440 60  0001 L CNN "PressFit"
F 29 "No" H 5600 -530 60  0001 L CNN "Sense"
F 30 "~~" H 5600 -620 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5600 -710 60  0001 L CNN "ComponentHeight"
F 32 "KEMET" H 5600 -800 60  0001 L CNN "Manufacturer1 Example"
F 33 "C0805C106K4PAC" H 5600 -890 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "1.4mm" H 5600 -980 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5600 -1070 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5600 -1160 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5600 -1250 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5600 -1340 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5600 -1430 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5600 -1520 60  0001 L CNN "License"
	1    5600 2250
	0    1    1    0   
$EndComp
$Comp
L R0603_270K_1%_0.1W_100PPM R41
U 1 1 598F1898
P 4900 2900
F 0 "R41" V 5004 2960 50  0000 L CNN
F 1 "R0603_464K_1%_0.1W_100PPM" H 4900 2690 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4900 1880 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 2510 60  0001 L CNN
F 4 "Value" H 4900 2900 60  0001 C CNN "Fieldname"
F 5 "464k" V 5095 2960 50  0000 L CNN "~"
F 6 "R0603_464K_1%_0.1W_100PPM" H 4900 2420 60  0001 L CNN "Part Number"
F 7 "Resistor - 1%" H 4900 2330 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Resistors.SchLib" H 4900 2240 60  0001 L CNN "Library Path"
F 9 "=Value" H 4900 2150 60  0001 L CNN "Comment"
F 10 "Standard" H 4900 2060 60  0001 L CNN "Component Kind"
F 11 "Standard" H 4900 1970 60  0001 L CNN "Component Type"
F 12 "~~" H 4900 1790 60  0001 L CNN "PackageDescription"
F 13 "2" H 4900 1700 60  0001 L CNN "Pin Count"
F 14 "PcbLib\\Resistors SMD.PcbLib" H 4900 1610 60  0001 L CNN "Footprint Path"
F 15 "RESC1608X55N" H 4900 1520 60  0001 L CNN "Footprint Ref"
F 16 "464k" H 4900 1430 60  0001 L CNN "Val"
F 17 "Preferred" H 4900 1340 60  0001 L CNN "Status"
F 18 "0.1W" H 4900 1250 60  0001 L CNN "Power"
F 19 "±100ppm/°C" H 4900 1160 60  0001 L CNN "TC"
F 20 "~~" H 4900 1070 60  0001 L CNN "Voltage"
F 21 "±1%" H 4900 980 60  0001 L CNN "Tolerance"
F 22 "General Purpose Thick Film Chip Resistor" H 4900 890 60  0001 L CNN "Part Description"
F 23 "GENERIC" H 4900 800 60  0001 L CNN "Manufacturer"
F 24 "R0603_464K_1%_0.1W_100PPM" H 4900 710 60  0001 L CNN "Manufacturer Part Number"
F 25 "0603" H 4900 620 60  0001 L CNN "Case"
F 26 "No" H 4900 530 60  0001 L CNN "PressFit"
F 27 "Yes" H 4900 440 60  0001 L CNN "Mounted"
F 28 "~~" H 4900 350 60  0001 L CNN "Sense Comment"
F 29 "No" H 4900 260 60  0001 L CNN "Sense"
F 30 "~~" H 4900 170 60  0001 L CNN "Status Comment"
F 31 "No" H 4900 80  60  0001 L CNN "Socket"
F 32 "Yes" H 4900 -10 60  0001 L CNN "SMD"
F 33 "~~" H 4900 -100 60  0001 L CNN "ComponentHeight"
F 34 "NIC COMPONENT" H 4900 -190 60  0001 L CNN "Manufacturer1 Example"
F 35 "0.55mm" H 4900 -370 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 -460 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4900 -550 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4900 -640 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4900 -730 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4900 -820 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4900 -910 60  0001 L CNN "License"
	1    4900 2900
	0    1    1    0   
$EndComp
$Comp
L CC0603_8.2PF_50V_0.5PF_NP0 C53
U 1 1 598F2EFB
P 5250 2900
F 0 "C53" V 5354 3010 50  0000 L CNN
F 1 "CC0603_8.2PF_50V_0.5PF_NP0" H 5250 2640 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 5250 1830 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 2460 60  0001 L CNN
F 4 "8.2pF" V 5445 3010 50  0000 L CNN "~"
F 5 "CC0603_8.2PF_50V_0.5PF_NP0" H 5250 2370 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5250 2280 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5250 2190 60  0001 L CNN "Library Path"
F 8 "=Value" H 5250 2100 60  0001 L CNN "Comment"
F 9 "Standard" H 5250 2010 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5250 1920 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5250 1740 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5250 1650 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 5250 1560 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5250 1470 60  0001 L CNN "PackageDescription"
F 15 "8.2pF" H 5250 1380 60  0001 L CNN "Val"
F 16 "Preferred" H 5250 1290 60  0001 L CNN "Status"
F 17 "~~" H 5250 1200 60  0001 L CNN "Status Comment"
F 18 "50V" H 5250 1110 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 5250 1020 60  0001 L CNN "TC"
F 20 "±0.5pF" H 5250 930 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5250 840 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5250 750 60  0001 L CNN "Manufacturer"
F 23 "CC0603_8.2PF_50V_0.5PF_NP0" H 5250 660 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5250 570 60  0001 L CNN "Case"
F 25 "Yes" H 5250 480 60  0001 L CNN "Mounted"
F 26 "No" H 5250 390 60  0001 L CNN "Socket"
F 27 "Yes" H 5250 300 60  0001 L CNN "SMD"
F 28 "~~" H 5250 210 60  0001 L CNN "PressFit"
F 29 "No" H 5250 120 60  0001 L CNN "Sense"
F 30 "~~" H 5250 30  60  0001 L CNN "Sense Comment"
F 31 "~~" H 5250 -60 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 5250 -150 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715828" H 5250 -240 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 5250 -330 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 -420 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5250 -510 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5250 -600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5250 -690 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5250 -780 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5250 -870 60  0001 L CNN "License"
	1    5250 2900
	0    1    1    0   
$EndComp
$Comp
L R0603_270K_1%_0.1W_100PPM R43
U 1 1 598F30B0
P 5400 3400
F 0 "R43" H 5550 3597 50  0000 C CNN
F 1 "R0603_178K_1%_0.1W_100PPM" H 5400 3190 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 5400 2380 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5400 3010 60  0001 L CNN
F 4 "Value" H 5400 3400 60  0001 C CNN "Fieldname"
F 5 "178k" H 5550 3506 50  0000 C CNN "~"
F 6 "R0603_178K_1%_0.1W_100PPM" H 5400 2920 60  0001 L CNN "Part Number"
F 7 "Resistor - 1%" H 5400 2830 60  0001 L CNN "Library Ref"
F 8 "SchLib\\Resistors.SchLib" H 5400 2740 60  0001 L CNN "Library Path"
F 9 "=Value" H 5400 2650 60  0001 L CNN "Comment"
F 10 "Standard" H 5400 2560 60  0001 L CNN "Component Kind"
F 11 "Standard" H 5400 2470 60  0001 L CNN "Component Type"
F 12 "~~" H 5400 2290 60  0001 L CNN "PackageDescription"
F 13 "2" H 5400 2200 60  0001 L CNN "Pin Count"
F 14 "PcbLib\\Resistors SMD.PcbLib" H 5400 2110 60  0001 L CNN "Footprint Path"
F 15 "RESC1608X55N" H 5400 2020 60  0001 L CNN "Footprint Ref"
F 16 "178k" H 5400 1930 60  0001 L CNN "Val"
F 17 "Preferred" H 5400 1840 60  0001 L CNN "Status"
F 18 "0.1W" H 5400 1750 60  0001 L CNN "Power"
F 19 "±100ppm/°C" H 5400 1660 60  0001 L CNN "TC"
F 20 "~~" H 5400 1570 60  0001 L CNN "Voltage"
F 21 "±1%" H 5400 1480 60  0001 L CNN "Tolerance"
F 22 "General Purpose Thick Film Chip Resistor" H 5400 1390 60  0001 L CNN "Part Description"
F 23 "GENERIC" H 5400 1300 60  0001 L CNN "Manufacturer"
F 24 "R0603_178K_1%_0.1W_100PPM" H 5400 1210 60  0001 L CNN "Manufacturer Part Number"
F 25 "0603" H 5400 1120 60  0001 L CNN "Case"
F 26 "No" H 5400 1030 60  0001 L CNN "PressFit"
F 27 "Yes" H 5400 940 60  0001 L CNN "Mounted"
F 28 "~~" H 5400 850 60  0001 L CNN "Sense Comment"
F 29 "No" H 5400 760 60  0001 L CNN "Sense"
F 30 "~~" H 5400 670 60  0001 L CNN "Status Comment"
F 31 "No" H 5400 580 60  0001 L CNN "Socket"
F 32 "Yes" H 5400 490 60  0001 L CNN "SMD"
F 33 "~~" H 5400 400 60  0001 L CNN "ComponentHeight"
F 34 "NIC COMPONENT" H 5400 310 60  0001 L CNN "Manufacturer1 Example"
F 35 "0.55mm" H 5400 130 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 5400 40  60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 5400 -50 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 5400 -140 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 5400 -230 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 5400 -320 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5400 -410 60  0001 L CNN "License"
	1    5400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1400 2200 1400
Wire Wire Line
	1550 1400 1550 1350
Wire Wire Line
	1800 1350 1800 1400
Connection ~ 1800 1400
Wire Wire Line
	2200 1500 2100 1500
Wire Wire Line
	2100 1400 2100 3800
Connection ~ 2100 1400
Wire Wire Line
	2100 2000 2200 2000
Connection ~ 2100 1500
Wire Wire Line
	2100 2600 2200 2600
Connection ~ 2100 2000
Wire Wire Line
	2100 3200 2200 3200
Connection ~ 2100 2600
Wire Wire Line
	2100 3800 2200 3800
Connection ~ 2100 3200
Wire Wire Line
	1350 3600 2200 3600
Wire Wire Line
	1550 3600 1550 3650
Wire Wire Line
	1350 3000 2200 3000
Wire Wire Line
	1550 3000 1550 3050
Wire Wire Line
	1350 2400 2200 2400
Wire Wire Line
	1550 2400 1550 2450
Wire Wire Line
	1350 1800 2200 1800
Wire Wire Line
	1550 1800 1550 1850
Connection ~ 1550 1400
Connection ~ 1550 1800
Connection ~ 1550 2400
Connection ~ 1550 3600
Connection ~ 1550 3000
Wire Wire Line
	2200 4000 2100 4000
Wire Wire Line
	2100 4000 2100 4350
Wire Wire Line
	2200 4200 2100 4200
Connection ~ 2100 4200
Wire Wire Line
	2200 4100 2100 4100
Connection ~ 2100 4100
Wire Wire Line
	3700 1400 3950 1400
Wire Wire Line
	4200 1500 3700 1500
Wire Wire Line
	4500 1500 4550 1500
Wire Wire Line
	4550 1500 4550 1250
Wire Wire Line
	3950 1400 3950 1200
Wire Wire Line
	4500 1800 3700 1800
Wire Wire Line
	3700 2000 5100 2000
Wire Wire Line
	4950 1800 4800 1800
Connection ~ 4950 2000
Wire Wire Line
	4400 1600 5650 1600
Wire Wire Line
	5600 1650 5600 1600
Connection ~ 5600 1600
Wire Wire Line
	5400 2000 5700 2000
Wire Wire Line
	5600 2000 5600 1950
Connection ~ 5600 2000
Wire Wire Line
	4500 2400 3700 2400
Wire Wire Line
	3700 2600 5100 2600
Wire Wire Line
	4800 2400 4950 2400
Connection ~ 4950 2600
Wire Wire Line
	4400 2200 5650 2200
Wire Wire Line
	5400 2600 5650 2600
Wire Wire Line
	5600 2250 5600 2200
Connection ~ 5600 2200
Wire Wire Line
	5600 2550 5600 2600
Connection ~ 5600 2600
Wire Wire Line
	3700 3000 4350 3000
Wire Wire Line
	4350 3000 4350 2800
Wire Wire Line
	4350 2800 4500 2800
Wire Wire Line
	4350 3400 5400 3400
Wire Wire Line
	4900 3400 4900 3200
Wire Wire Line
	5250 3200 5250 3400
Connection ~ 5250 3400
Wire Wire Line
	4800 2800 5800 2800
Wire Wire Line
	5250 2800 5250 2900
Wire Wire Line
	4900 2900 4900 2800
Connection ~ 4900 2800
Wire Wire Line
	3700 3200 4350 3200
Wire Wire Line
	4350 3200 4350 3400
Connection ~ 4900 3400
Wire Wire Line
	3700 3400 3800 3400
$Comp
L GND #PWR070
U 1 1 598F49E4
P 3800 3400
F 0 "#PWR070" H 3800 3150 50  0001 C CNN
F 1 "GND" H 3805 3227 50  0000 C CNN
F 2 "" H 3800 3400 50  0001 C CNN
F 3 "" H 3800 3400 50  0001 C CNN
	1    3800 3400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR071
U 1 1 598F4E17
P 5800 3400
F 0 "#PWR071" H 5800 3150 50  0001 C CNN
F 1 "GND" H 5805 3227 50  0000 C CNN
F 2 "" H 5800 3400 50  0001 C CNN
F 3 "" H 5800 3400 50  0001 C CNN
	1    5800 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 3400 5800 3400
$Comp
L CC0805_10UF_16V_10%_X5R C54
U 1 1 598F517C
P 5750 2900
F 0 "C54" V 5854 3010 50  0000 L CNN
F 1 "CC0805_10UF_16V_10%_X5R" H 5750 2640 60  0001 L CNN
F 2 "Capacitors SMD:CAPC2012X135N" H 5750 1830 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5750 2460 60  0001 L CNN
F 4 "10uF" V 5945 3010 50  0000 L CNN "~"
F 5 "CC0805_10UF_16V_10%_X5R" H 5750 2370 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5750 2280 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5750 2190 60  0001 L CNN "Library Path"
F 8 "=Value" H 5750 2100 60  0001 L CNN "Comment"
F 9 "Standard" H 5750 2010 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5750 1920 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5750 1740 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5750 1650 60  0001 L CNN "Footprint Path"
F 13 "CAPC2012X135N" H 5750 1560 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5750 1470 60  0001 L CNN "PackageDescription"
F 15 "10uF" H 5750 1380 60  0001 L CNN "Val"
F 16 "Preferred" H 5750 1290 60  0001 L CNN "Status"
F 17 "~~" H 5750 1200 60  0001 L CNN "Status Comment"
F 18 "16V" H 5750 1110 60  0001 L CNN "Voltage"
F 19 "X5R" H 5750 1020 60  0001 L CNN "TC"
F 20 "±10%" H 5750 930 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5750 840 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5750 750 60  0001 L CNN "Manufacturer"
F 23 "CC0805_10UF_16V_10%_X5R" H 5750 660 60  0001 L CNN "Manufacturer Part Number"
F 24 "0805" H 5750 570 60  0001 L CNN "Case"
F 25 "Yes" H 5750 480 60  0001 L CNN "Mounted"
F 26 "No" H 5750 390 60  0001 L CNN "Socket"
F 27 "Yes" H 5750 300 60  0001 L CNN "SMD"
F 28 "~~" H 5750 210 60  0001 L CNN "PressFit"
F 29 "No" H 5750 120 60  0001 L CNN "Sense"
F 30 "~~" H 5750 30  60  0001 L CNN "Sense Comment"
F 31 "~~" H 5750 -60 60  0001 L CNN "ComponentHeight"
F 32 "KEMET" H 5750 -150 60  0001 L CNN "Manufacturer1 Example"
F 33 "C0805C106K4PAC" H 5750 -240 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "1.4mm" H 5750 -330 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5750 -420 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5750 -510 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5750 -600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5750 -690 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5750 -780 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5750 -870 60  0001 L CNN "License"
	1    5750 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3200 5750 3400
Connection ~ 5750 3400
Wire Wire Line
	5750 2800 5750 2900
Connection ~ 5250 2800
Connection ~ 5750 2800
$Comp
L +1V8 #PWR072
U 1 1 598F5581
P 5800 2800
F 0 "#PWR072" H 5800 2650 50  0001 C CNN
F 1 "+1V8" V 5815 2928 50  0000 L CNN
F 2 "" H 5800 2800 50  0001 C CNN
F 3 "" H 5800 2800 50  0001 C CNN
	1    5800 2800
	0    1    1    0   
$EndComp
$Comp
L DLCSM0315D-2R2-K L4
U 1 1 598F654A
P 4500 3600
F 0 "L4" H 4650 3514 50  0000 C CNN
F 1 "2.2uH" H 4650 3415 60  0000 C CNN
F 2 "dsi_shield:IND_PANASONIC_ELLVEG" H 4500 3600 60  0001 C CNN
F 3 "" H 4500 3600 60  0001 C CNN
F 4 "Value" H 4500 3600 60  0001 C CNN "Fieldname"
F 5 "1.4A" H 4500 2600 60  0001 L CNN "Power"
F 6 "0.23R" H 4500 2510 60  0001 L CNN "Resistance"
F 7 "±20%" H 4500 2420 60  0001 L CNN "Tollerance"
F 8 "Chip Inductor (Chip Coil) for Choke Wire Wound Type" H 4500 2330 60  0001 L CNN "Description"
F 9 "KINGCORE" H 4500 2240 60  0001 L CNN "Manufacturer"
F 10 "DLCSM0315D-2R2-K" H 4500 2150 60  0001 L CNN "Manufacturer Part Number"
F 11 "Yes" H 4500 2060 60  0001 L CNN "Mounted"
F 12 "Yes" H 4500 1880 60  0001 L CNN "SMD"
	1    4500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3600 4500 3600
Wire Wire Line
	4900 4000 4900 4350
Wire Wire Line
	5250 4000 5250 4350
Connection ~ 5250 4200
Wire Wire Line
	4800 3600 5800 3600
Wire Wire Line
	5250 3600 5250 3700
Wire Wire Line
	4900 3700 4900 3600
Connection ~ 4900 3600
Connection ~ 4900 4200
$Comp
L CC0805_10UF_16V_10%_X5R C58
U 1 1 598F6611
P 5750 4050
F 0 "C58" V 5854 4160 50  0000 L CNN
F 1 "CC0805_10UF_16V_10%_X5R" H 5750 3790 60  0001 L CNN
F 2 "Capacitors SMD:CAPC2012X135N" H 5750 2980 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5750 3610 60  0001 L CNN
F 4 "10uF" V 5945 4160 50  0000 L CNN "~"
F 5 "CC0805_10UF_16V_10%_X5R" H 5750 3520 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5750 3430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5750 3340 60  0001 L CNN "Library Path"
F 8 "=Value" H 5750 3250 60  0001 L CNN "Comment"
F 9 "Standard" H 5750 3160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5750 3070 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5750 2890 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5750 2800 60  0001 L CNN "Footprint Path"
F 13 "CAPC2012X135N" H 5750 2710 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5750 2620 60  0001 L CNN "PackageDescription"
F 15 "10uF" H 5750 2530 60  0001 L CNN "Val"
F 16 "Preferred" H 5750 2440 60  0001 L CNN "Status"
F 17 "~~" H 5750 2350 60  0001 L CNN "Status Comment"
F 18 "16V" H 5750 2260 60  0001 L CNN "Voltage"
F 19 "X5R" H 5750 2170 60  0001 L CNN "TC"
F 20 "±10%" H 5750 2080 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5750 1990 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5750 1900 60  0001 L CNN "Manufacturer"
F 23 "CC0805_10UF_16V_10%_X5R" H 5750 1810 60  0001 L CNN "Manufacturer Part Number"
F 24 "0805" H 5750 1720 60  0001 L CNN "Case"
F 25 "Yes" H 5750 1630 60  0001 L CNN "Mounted"
F 26 "No" H 5750 1540 60  0001 L CNN "Socket"
F 27 "Yes" H 5750 1450 60  0001 L CNN "SMD"
F 28 "~~" H 5750 1360 60  0001 L CNN "PressFit"
F 29 "No" H 5750 1270 60  0001 L CNN "Sense"
F 30 "~~" H 5750 1180 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5750 1090 60  0001 L CNN "ComponentHeight"
F 32 "KEMET" H 5750 1000 60  0001 L CNN "Manufacturer1 Example"
F 33 "C0805C106K4PAC" H 5750 910 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "1.4mm" H 5750 820 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC1206_X5R_KEMET.pdf" H 5750 730 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5750 640 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5750 550 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5750 460 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5750 370 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5750 280 60  0001 L CNN "License"
	1    5750 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3600 5750 4050
Connection ~ 5250 3600
Connection ~ 5750 3600
$Comp
L CC0603_6.8PF_50V_0.5PF_NP0 C57
U 1 1 598F8072
P 5250 3700
F 0 "C57" V 5354 3810 50  0000 L CNN
F 1 "CC0603_6.8PF_50V_0.5PF_NP0" H 5250 3440 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 5250 2630 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 3260 60  0001 L CNN
F 4 "6.8pF" V 5445 3810 50  0000 L CNN "~"
F 5 "CC0603_6.8PF_50V_0.5PF_NP0" H 5250 3170 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5250 3080 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5250 2990 60  0001 L CNN "Library Path"
F 8 "=Value" H 5250 2900 60  0001 L CNN "Comment"
F 9 "Standard" H 5250 2810 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5250 2720 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5250 2540 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5250 2450 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 5250 2360 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5250 2270 60  0001 L CNN "PackageDescription"
F 15 "6.8pF" H 5250 2180 60  0001 L CNN "Val"
F 16 "Preferred" H 5250 2090 60  0001 L CNN "Status"
F 17 "~~" H 5250 2000 60  0001 L CNN "Status Comment"
F 18 "50V" H 5250 1910 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 5250 1820 60  0001 L CNN "TC"
F 20 "±0.5pF" H 5250 1730 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5250 1640 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5250 1550 60  0001 L CNN "Manufacturer"
F 23 "CC0603_6.8PF_50V_0.5PF_NP0" H 5250 1460 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5250 1370 60  0001 L CNN "Case"
F 25 "Yes" H 5250 1280 60  0001 L CNN "Mounted"
F 26 "No" H 5250 1190 60  0001 L CNN "Socket"
F 27 "Yes" H 5250 1100 60  0001 L CNN "SMD"
F 28 "~~" H 5250 1010 60  0001 L CNN "PressFit"
F 29 "No" H 5250 920 60  0001 L CNN "Sense"
F 30 "~~" H 5250 830 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5250 740 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 5250 650 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715688" H 5250 560 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 5250 470 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 380 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5250 290 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5250 200 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5250 110 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5250 20  60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5250 -70 60  0001 L CNN "License"
	1    5250 3700
	0    1    1    0   
$EndComp
$Comp
L CC0603_33PF_50V_5%_NP0 C74
U 1 1 598F8D14
P 5250 4350
F 0 "C74" V 5354 4460 50  0000 L CNN
F 1 "CC0603_33PF_50V_5%_NP0" H 5250 4090 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 5250 3280 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 3910 60  0001 L CNN
F 4 "33pF" V 5445 4460 50  0000 L CNN "~"
F 5 "CC0603_33PF_50V_5%_NP0" H 5250 3820 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5250 3730 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5250 3640 60  0001 L CNN "Library Path"
F 8 "=Value" H 5250 3550 60  0001 L CNN "Comment"
F 9 "Standard" H 5250 3460 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5250 3370 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5250 3190 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5250 3100 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 5250 3010 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5250 2920 60  0001 L CNN "PackageDescription"
F 15 "33pF" H 5250 2830 60  0001 L CNN "Val"
F 16 "Preferred" H 5250 2740 60  0001 L CNN "Status"
F 17 "~~" H 5250 2650 60  0001 L CNN "Status Comment"
F 18 "50V" H 5250 2560 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 5250 2470 60  0001 L CNN "TC"
F 20 "±5%" H 5250 2380 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5250 2290 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5250 2200 60  0001 L CNN "Manufacturer"
F 23 "CC0603_33PF_50V_5%_NP0" H 5250 2110 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5250 2020 60  0001 L CNN "Case"
F 25 "Yes" H 5250 1930 60  0001 L CNN "Mounted"
F 26 "No" H 5250 1840 60  0001 L CNN "Socket"
F 27 "Yes" H 5250 1750 60  0001 L CNN "SMD"
F 28 "~~" H 5250 1660 60  0001 L CNN "PressFit"
F 29 "No" H 5250 1570 60  0001 L CNN "Sense"
F 30 "~~" H 5250 1480 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5250 1390 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 5250 1300 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715339" H 5250 1210 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 5250 1120 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 5250 1030 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5250 940 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5250 850 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5250 760 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5250 670 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5250 580 60  0001 L CNN "License"
	1    5250 4350
	0    1    1    0   
$EndComp
$Comp
L R0603_560K_1%_0.1W_100PPM R45
U 1 1 598F9BAC
P 4900 3700
F 0 "R45" V 5004 3760 50  0000 L CNN
F 1 "R0603_560K_1%_0.1W_100PPM" H 4900 3490 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4900 2680 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 3310 60  0001 L CNN
F 4 "560k" V 5095 3760 50  0000 L CNN "~"
F 5 "R0603_560K_1%_0.1W_100PPM" H 4900 3220 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4900 3130 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4900 3040 60  0001 L CNN "Library Path"
F 8 "=Value" H 4900 2950 60  0001 L CNN "Comment"
F 9 "Standard" H 4900 2860 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4900 2770 60  0001 L CNN "Component Type"
F 11 "~~" H 4900 2590 60  0001 L CNN "PackageDescription"
F 12 "2" H 4900 2500 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4900 2410 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4900 2320 60  0001 L CNN "Footprint Ref"
F 15 "560k" H 4900 2230 60  0001 L CNN "Val"
F 16 "Preferred" H 4900 2140 60  0001 L CNN "Status"
F 17 "0.1W" H 4900 2050 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4900 1960 60  0001 L CNN "TC"
F 19 "~~" H 4900 1870 60  0001 L CNN "Voltage"
F 20 "±1%" H 4900 1780 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4900 1690 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4900 1600 60  0001 L CNN "Manufacturer"
F 23 "R0603_560K_1%_0.1W_100PPM" H 4900 1510 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4900 1420 60  0001 L CNN "Case"
F 25 "No" H 4900 1330 60  0001 L CNN "PressFit"
F 26 "Yes" H 4900 1240 60  0001 L CNN "Mounted"
F 27 "~~" H 4900 1150 60  0001 L CNN "Sense Comment"
F 28 "No" H 4900 1060 60  0001 L CNN "Sense"
F 29 "~~" H 4900 970 60  0001 L CNN "Status Comment"
F 30 "No" H 4900 880 60  0001 L CNN "Socket"
F 31 "Yes" H 4900 790 60  0001 L CNN "SMD"
F 32 "~~" H 4900 700 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4900 610 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F5603TRF" H 4900 520 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4900 430 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 340 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4900 250 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4900 160 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4900 70  60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4900 -20 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4900 -110 60  0001 L CNN "License"
	1    4900 3700
	0    1    1    0   
$EndComp
$Comp
L R0603_100K_1%_0.1W_100PPM R46
U 1 1 598FA6B8
P 4900 4350
F 0 "R46" V 5004 4410 50  0000 L CNN
F 1 "R0603_100K_1%_0.1W_100PPM" H 4900 4140 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 4900 3330 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 3960 60  0001 L CNN
F 4 "100k" V 5095 4410 50  0000 L CNN "~"
F 5 "R0603_100K_1%_0.1W_100PPM" H 4900 3870 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4900 3780 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4900 3690 60  0001 L CNN "Library Path"
F 8 "=Value" H 4900 3600 60  0001 L CNN "Comment"
F 9 "Standard" H 4900 3510 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4900 3420 60  0001 L CNN "Component Type"
F 11 "~~" H 4900 3240 60  0001 L CNN "PackageDescription"
F 12 "2" H 4900 3150 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4900 3060 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4900 2970 60  0001 L CNN "Footprint Ref"
F 15 "100k" H 4900 2880 60  0001 L CNN "Val"
F 16 "Preferred" H 4900 2790 60  0001 L CNN "Status"
F 17 "0.1W" H 4900 2700 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4900 2610 60  0001 L CNN "TC"
F 19 "~~" H 4900 2520 60  0001 L CNN "Voltage"
F 20 "±1%" H 4900 2430 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4900 2340 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4900 2250 60  0001 L CNN "Manufacturer"
F 23 "R0603_100K_1%_0.1W_100PPM" H 4900 2160 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4900 2070 60  0001 L CNN "Case"
F 25 "No" H 4900 1980 60  0001 L CNN "PressFit"
F 26 "Yes" H 4900 1890 60  0001 L CNN "Mounted"
F 27 "~~" H 4900 1800 60  0001 L CNN "Sense Comment"
F 28 "No" H 4900 1710 60  0001 L CNN "Sense"
F 29 "~~" H 4900 1620 60  0001 L CNN "Status Comment"
F 30 "No" H 4900 1530 60  0001 L CNN "Socket"
F 31 "Yes" H 4900 1440 60  0001 L CNN "SMD"
F 32 "~~" H 4900 1350 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4900 1260 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1003TRF" H 4900 1170 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4900 1080 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4900 990 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4900 900 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4900 810 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4900 720 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4900 630 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4900 540 60  0001 L CNN "License"
	1    4900 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 4650 4900 4850
Wire Wire Line
	4100 4750 5750 4750
Wire Wire Line
	5250 4750 5250 4650
Connection ~ 4900 4750
Wire Wire Line
	3700 3800 4300 3800
Wire Wire Line
	4300 3800 4300 4200
Wire Wire Line
	4300 4200 5250 4200
Wire Wire Line
	3700 4000 4100 4000
Wire Wire Line
	4100 4000 4100 4750
Wire Wire Line
	5750 4750 5750 4350
Connection ~ 5250 4750
$Comp
L +3V3 #PWR073
U 1 1 598FB2A2
P 5800 3600
F 0 "#PWR073" H 5800 3450 50  0001 C CNN
F 1 "+3V3" V 5815 3728 50  0000 L CNN
F 2 "" H 5800 3600 50  0001 C CNN
F 3 "" H 5800 3600 50  0001 C CNN
	1    5800 3600
	0    1    1    0   
$EndComp
Text Notes 2600 900  0    100  ~ 0
Main PMIC
$Comp
L TPS61041 IC5
U 1 1 598FF439
P 7700 2500
F 0 "IC5" H 7700 3065 50  0000 C CNN
F 1 "TPS61040" H 7700 2010 60  0001 L CNN
F 2 "ICs And Semiconductors SMD:SOT95P275X110-5N" H 7700 1920 60  0001 L CNN
F 3 "" H 7700 1830 60  0001 L CNN
F 4 "Value" H 7700 2500 60  0001 C CNN "Fieldname"
F 5 "Farnell" H 7700 1740 60  0001 L CNN "Field4"
F 6 "1564963" H 7700 1650 60  0001 L CNN "Field5"
F 7 "TPS61040DBVR" H 7700 1560 60  0001 L CNN "Field6"
F 8 "Yes" H 7700 1470 60  0001 L CNN "Field7"
F 9 "TPS61040" H 7700 2974 50  0000 C CNN "Field8"
	1    7700 2500
	1    0    0    -1  
$EndComp
$Comp
L CC0603_4.7UF_6.3V_10%_X5R C51
U 1 1 598FF9AB
P 6750 2250
F 0 "C51" V 6854 2360 50  0000 L CNN
F 1 "CC0603_4.7UF_6.3V_10%_X5R" H 6750 1990 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 6750 1180 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 6750 1810 60  0001 L CNN
F 4 "4.7uF" V 6945 2360 50  0000 L CNN "~"
F 5 "CC0603_4.7UF_6.3V_10%_X5R" H 6750 1720 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 6750 1630 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 6750 1540 60  0001 L CNN "Library Path"
F 8 "=Value" H 6750 1450 60  0001 L CNN "Comment"
F 9 "Standard" H 6750 1360 60  0001 L CNN "Component Kind"
F 10 "Standard" H 6750 1270 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 6750 1090 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 6750 1000 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 6750 910 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 6750 820 60  0001 L CNN "PackageDescription"
F 15 "4.7uF" H 6750 730 60  0001 L CNN "Val"
F 16 "Preferred" H 6750 640 60  0001 L CNN "Status"
F 17 "~~" H 6750 550 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 6750 460 60  0001 L CNN "Voltage"
F 19 "X5R" H 6750 370 60  0001 L CNN "TC"
F 20 "±10%" H 6750 280 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 6750 190 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 6750 100 60  0001 L CNN "Manufacturer"
F 23 "CC0603_4.7uF_6.3V_10%_X5R" H 6750 10  60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 6750 -80 60  0001 L CNN "Case"
F 25 "Yes" H 6750 -170 60  0001 L CNN "Mounted"
F 26 "No" H 6750 -260 60  0001 L CNN "Socket"
F 27 "Yes" H 6750 -350 60  0001 L CNN "SMD"
F 28 "~~" H 6750 -440 60  0001 L CNN "PressFit"
F 29 "No" H 6750 -530 60  0001 L CNN "Sense"
F 30 "~~" H 6750 -620 60  0001 L CNN "Sense Comment"
F 31 "~~" H 6750 -710 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 6750 -800 60  0001 L CNN "Manufacturer1 Example"
F 33 "225520613672" H 6750 -890 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 6750 -980 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 6750 -1070 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 6750 -1160 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 6750 -1250 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 6750 -1340 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 6750 -1430 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6750 -1520 60  0001 L CNN "License"
	1    6750 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 2700 7000 2700
Wire Wire Line
	7000 2700 7000 3200
$Comp
L R0603_100K_1%_0.1W_100PPM R44
U 1 1 59900376
P 7000 3200
F 0 "R44" V 7104 3260 50  0000 L CNN
F 1 "R0603_100K_1%_0.1W_100PPM" H 7000 2990 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 7000 2180 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7000 2810 60  0001 L CNN
F 4 "100k" V 7195 3260 50  0000 L CNN "~"
F 5 "R0603_100K_1%_0.1W_100PPM" H 7000 2720 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 7000 2630 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 7000 2540 60  0001 L CNN "Library Path"
F 8 "=Value" H 7000 2450 60  0001 L CNN "Comment"
F 9 "Standard" H 7000 2360 60  0001 L CNN "Component Kind"
F 10 "Standard" H 7000 2270 60  0001 L CNN "Component Type"
F 11 "~~" H 7000 2090 60  0001 L CNN "PackageDescription"
F 12 "2" H 7000 2000 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 7000 1910 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 7000 1820 60  0001 L CNN "Footprint Ref"
F 15 "100k" H 7000 1730 60  0001 L CNN "Val"
F 16 "Preferred" H 7000 1640 60  0001 L CNN "Status"
F 17 "0.1W" H 7000 1550 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 7000 1460 60  0001 L CNN "TC"
F 19 "~~" H 7000 1370 60  0001 L CNN "Voltage"
F 20 "±1%" H 7000 1280 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 7000 1190 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 7000 1100 60  0001 L CNN "Manufacturer"
F 23 "R0603_100K_1%_0.1W_100PPM" H 7000 1010 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 7000 920 60  0001 L CNN "Case"
F 25 "No" H 7000 830 60  0001 L CNN "PressFit"
F 26 "Yes" H 7000 740 60  0001 L CNN "Mounted"
F 27 "~~" H 7000 650 60  0001 L CNN "Sense Comment"
F 28 "No" H 7000 560 60  0001 L CNN "Sense"
F 29 "~~" H 7000 470 60  0001 L CNN "Status Comment"
F 30 "No" H 7000 380 60  0001 L CNN "Socket"
F 31 "Yes" H 7000 290 60  0001 L CNN "SMD"
F 32 "~~" H 7000 200 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 7000 110 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1003TRF" H 7000 20  60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 7000 -70 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 7000 -160 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 7000 -250 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 7000 -340 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 7000 -430 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 7000 -520 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 7000 -610 60  0001 L CNN "License"
	1    7000 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR074
U 1 1 599007AD
P 7000 3600
F 0 "#PWR074" H 7000 3350 50  0001 C CNN
F 1 "GND" H 7005 3427 50  0000 C CNN
F 2 "" H 7000 3600 50  0001 C CNN
F 3 "" H 7000 3600 50  0001 C CNN
	1    7000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3600 7000 3500
Wire Wire Line
	7000 3100 7150 3100
Connection ~ 7000 3100
Text HLabel 7150 3100 2    60   Input ~ 0
LCD_PWREN
$Comp
L DLCSM0315D-2R2-K L2
U 1 1 59901EF0
P 7550 1800
F 0 "L2" H 7700 2050 50  0000 C CNN
F 1 "4.7uH" H 7700 1951 60  0000 C CNN
F 2 "dsi_shield:IND_PANASONIC_ELLVEG" H 7550 1800 60  0001 C CNN
F 3 "" H 7550 1800 60  0001 C CNN
F 4 "Value" H 7550 1800 60  0001 C CNN "Fieldname"
F 5 "1A" H 7550 800 60  0001 L CNN "Power"
F 6 "0.38R" H 7550 710 60  0001 L CNN "Resistance"
F 7 "±20%" H 7550 620 60  0001 L CNN "Tollerance"
F 8 "Chip Inductor (Chip Coil) for Choke Wire Wound Type" H 7550 530 60  0001 L CNN "Description"
F 9 "KINGCORE" H 7550 440 60  0001 L CNN "Manufacturer"
F 10 "DLCSM0315D-4R7-K" H 7550 350 60  0001 L CNN "Manufacturer Part Number"
F 11 "Yes" H 7550 260 60  0001 L CNN "Mounted"
F 12 "Yes" H 7550 80  60  0001 L CNN "SMD"
	1    7550 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR075
U 1 1 59903236
P 6750 2600
F 0 "#PWR075" H 6750 2350 50  0001 C CNN
F 1 "GND" H 6755 2427 50  0000 C CNN
F 2 "" H 6750 2600 50  0001 C CNN
F 3 "" H 6750 2600 50  0001 C CNN
	1    6750 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2600 6750 2550
Wire Wire Line
	6750 2200 7200 2200
Wire Wire Line
	6750 2000 6750 2250
Connection ~ 6750 2200
Wire Wire Line
	7100 2200 7100 1800
Wire Wire Line
	7100 1800 7550 1800
Connection ~ 7100 2200
$Comp
L +3V3 #PWR076
U 1 1 59903825
P 6750 2000
F 0 "#PWR076" H 6750 1850 50  0001 C CNN
F 1 "+3V3" H 6765 2173 50  0000 C CNN
F 2 "" H 6750 2000 50  0001 C CNN
F 3 "" H 6750 2000 50  0001 C CNN
	1    6750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 1800 8400 1800
Wire Wire Line
	8400 1700 8400 2200
Wire Wire Line
	8200 2200 8750 2200
Connection ~ 8400 2200
$Comp
L GND #PWR077
U 1 1 59903F6B
P 8350 2850
F 0 "#PWR077" H 8350 2600 50  0001 C CNN
F 1 "GND" H 8355 2677 50  0000 C CNN
F 2 "" H 8350 2850 50  0001 C CNN
F 3 "" H 8350 2850 50  0001 C CNN
	1    8350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2700 8350 2700
Wire Wire Line
	8350 2700 8350 2850
$Comp
L CC0603_1UF_50V_10%_X5R C44
U 1 1 59905B46
P 8400 1400
F 0 "C44" V 8504 1510 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 8400 1140 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 8400 330 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 8400 960 60  0001 L CNN
F 4 "1uF" V 8595 1510 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 8400 870 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 8400 780 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 8400 690 60  0001 L CNN "Library Path"
F 8 "=Value" H 8400 600 60  0001 L CNN "Comment"
F 9 "Standard" H 8400 510 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8400 420 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 8400 240 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 8400 150 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 8400 60  60  0001 L CNN "Footprint Ref"
F 14 "~~" H 8400 -30 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 8400 -120 60  0001 L CNN "Val"
F 16 "None" H 8400 -210 60  0001 L CNN "Status"
F 17 "~~" H 8400 -300 60  0001 L CNN "Status Comment"
F 18 "50V" H 8400 -390 60  0001 L CNN "Voltage"
F 19 "X5R" H 8400 -480 60  0001 L CNN "TC"
F 20 "±10%" H 8400 -570 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 8400 -660 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8400 -750 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 8400 -840 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 8400 -930 60  0001 L CNN "Case"
F 25 "Yes" H 8400 -1020 60  0001 L CNN "Mounted"
F 26 "No" H 8400 -1110 60  0001 L CNN "Socket"
F 27 "Yes" H 8400 -1200 60  0001 L CNN "SMD"
F 28 "~~" H 8400 -1290 60  0001 L CNN "PressFit"
F 29 "No" H 8400 -1380 60  0001 L CNN "Sense"
F 30 "~~" H 8400 -1470 60  0001 L CNN "Sense Comment"
F 31 "~~" H 8400 -1560 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 8400 -1650 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 8400 -1740 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 8400 -1830 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 8400 -1920 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 8400 -2010 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 8400 -2100 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 8400 -2190 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 8400 -2280 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8400 -2370 60  0001 L CNN "License"
	1    8400 1400
	0    1    1    0   
$EndComp
Connection ~ 8400 1800
Wire Wire Line
	8400 1350 9050 1350
Wire Wire Line
	8400 1350 8400 1400
Wire Wire Line
	8900 1450 8900 1350
Connection ~ 8900 1350
$Comp
L GND #PWR078
U 1 1 5990B80A
P 8900 1850
F 0 "#PWR078" H 8900 1600 50  0001 C CNN
F 1 "GND" H 8905 1677 50  0000 C CNN
F 2 "" H 8900 1850 50  0001 C CNN
F 3 "" H 8900 1850 50  0001 C CNN
	1    8900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1850 8900 1750
$Comp
L Diode_Schottky D?
U 1 1 5990ACE0
P 9350 1350
AR Path="/59999DBD/5990ACE0" Ref="D?"  Part="1" 
AR Path="/599BB99B/5990ACE0" Ref="D1"  Part="1" 
F 0 "D1" H 9500 1123 50  0000 C CNN
F 1 "BAS170W" H 9500 1214 50  0000 C CNN
F 2 "ICs And Semiconductors SMD:SOD2713X115N" H 9350 870 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 9350 780 60  0001 L CNN
F 4 "Value" H 9350 1350 60  0001 C CNN "Fieldname"
F 5 "MBR0530PbF" H 9350 690 60  0001 L CNN "Field4"
F 6 "Standard" H 9350 600 60  0001 L CNN "Field5"
F 7 "Standard" H 9350 510 60  0001 L CNN "Field6"
F 8 "MBR0530PbF" H 9350 420 60  0001 L CNN "Field7"
F 9 "SOD Diode (SOD-123); 2.70mm W X 1.55mm L X 1.45mm H body, IPC Medium Density" H 9350 330 60  0001 L CNN "Field8"
F 10 "30V" H 9350 240 60  0001 L CNN "Field9"
F 11 "500mA" H 9350 150 60  0001 L CNN "Field10"
F 12 "Schottky Diode" H 9350 60  60  0001 L CNN "Field11"
F 13 "VISHAY HIGH POWER PRODUCTS" H 9350 -30 60  0001 L CNN "Field12"
F 14 "2" H 9350 -210 60  0001 L CNN "Field14"
F 15 "SOD-123" H 9350 -300 60  0001 L CNN "Field15"
F 16 "Yes" H 9350 -390 60  0001 L CNN "Field16"
F 17 "No" H 9350 -480 60  0001 L CNN "Field17"
F 18 "Yes" H 9350 -570 60  0001 L CNN "Field18"
F 19 "No" H 9350 -660 60  0001 L CNN "Field19"
F 20 "No" H 9350 -750 60  0001 L CNN "Field20"
F 21 "1.45mm" H 9350 -840 60  0001 L CNN "Field21"
F 22 "CERN DEM JLC" H 9350 -930 60  0001 L CNN "Field22"
F 23 "2010-01-26" H 9350 -1020 60  0001 L CNN "Field23"
F 24 "2010-01-26" H 9350 -1110 60  0001 L CNN "Field24"
F 25 "Diodes" H 9350 -1200 60  0001 L CNN "Field25"
	1    9350 1350
	-1   0    0    1   
$EndComp
$Comp
L Diode_Schottky D?
U 1 1 5990C14B
P 8900 1450
AR Path="/59999DBD/5990C14B" Ref="D?"  Part="1" 
AR Path="/599BB99B/5990C14B" Ref="D2"  Part="1" 
F 0 "D2" V 9004 1540 50  0000 L CNN
F 1 "BAS170W" V 9095 1540 50  0000 L CNN
F 2 "ICs And Semiconductors SMD:SOD2713X115N" H 8900 970 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 8900 880 60  0001 L CNN
F 4 "Value" H 8900 1450 60  0001 C CNN "Fieldname"
F 5 "MBR0530PbF" H 8900 790 60  0001 L CNN "Field4"
F 6 "Standard" H 8900 700 60  0001 L CNN "Field5"
F 7 "Standard" H 8900 610 60  0001 L CNN "Field6"
F 8 "MBR0530PbF" H 8900 520 60  0001 L CNN "Field7"
F 9 "SOD Diode (SOD-123); 2.70mm W X 1.55mm L X 1.45mm H body, IPC Medium Density" H 8900 430 60  0001 L CNN "Field8"
F 10 "30V" H 8900 340 60  0001 L CNN "Field9"
F 11 "500mA" H 8900 250 60  0001 L CNN "Field10"
F 12 "Schottky Diode" H 8900 160 60  0001 L CNN "Field11"
F 13 "VISHAY HIGH POWER PRODUCTS" H 8900 70  60  0001 L CNN "Field12"
F 14 "2" H 8900 -110 60  0001 L CNN "Field14"
F 15 "SOD-123" H 8900 -200 60  0001 L CNN "Field15"
F 16 "Yes" H 8900 -290 60  0001 L CNN "Field16"
F 17 "No" H 8900 -380 60  0001 L CNN "Field17"
F 18 "Yes" H 8900 -470 60  0001 L CNN "Field18"
F 19 "No" H 8900 -560 60  0001 L CNN "Field19"
F 20 "No" H 8900 -650 60  0001 L CNN "Field20"
F 21 "1.45mm" H 8900 -740 60  0001 L CNN "Field21"
F 22 "CERN DEM JLC" H 8900 -830 60  0001 L CNN "Field22"
F 23 "2010-01-26" H 8900 -920 60  0001 L CNN "Field23"
F 24 "2010-01-26" H 8900 -1010 60  0001 L CNN "Field24"
F 25 "Diodes" H 8900 -1100 60  0001 L CNN "Field25"
	1    8900 1450
	0    1    1    0   
$EndComp
$Comp
L Diode_Schottky D?
U 1 1 5990C260
P 8750 2200
AR Path="/59999DBD/5990C260" Ref="D?"  Part="1" 
AR Path="/599BB99B/5990C260" Ref="D3"  Part="1" 
F 0 "D3" H 8550 2375 50  0000 C CNN
F 1 "BAS170W" H 8675 2275 50  0000 C CNN
F 2 "ICs And Semiconductors SMD:SOD2713X115N" H 8750 1720 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 8750 1630 60  0001 L CNN
F 4 "Value" H 8750 2200 60  0001 C CNN "Fieldname"
F 5 "MBR0530PbF" H 8750 1540 60  0001 L CNN "Field4"
F 6 "Standard" H 8750 1450 60  0001 L CNN "Field5"
F 7 "Standard" H 8750 1360 60  0001 L CNN "Field6"
F 8 "MBR0530PbF" H 8750 1270 60  0001 L CNN "Field7"
F 9 "SOD Diode (SOD-123); 2.70mm W X 1.55mm L X 1.45mm H body, IPC Medium Density" H 8750 1180 60  0001 L CNN "Field8"
F 10 "30V" H 8750 1090 60  0001 L CNN "Field9"
F 11 "500mA" H 8750 1000 60  0001 L CNN "Field10"
F 12 "Schottky Diode" H 8750 910 60  0001 L CNN "Field11"
F 13 "VISHAY HIGH POWER PRODUCTS" H 8750 820 60  0001 L CNN "Field12"
F 14 "2" H 8750 640 60  0001 L CNN "Field14"
F 15 "SOD-123" H 8750 550 60  0001 L CNN "Field15"
F 16 "Yes" H 8750 460 60  0001 L CNN "Field16"
F 17 "No" H 8750 370 60  0001 L CNN "Field17"
F 18 "Yes" H 8750 280 60  0001 L CNN "Field18"
F 19 "No" H 8750 190 60  0001 L CNN "Field19"
F 20 "No" H 8750 100 60  0001 L CNN "Field20"
F 21 "1.45mm" H 8750 10  60  0001 L CNN "Field21"
F 22 "CERN DEM JLC" H 8750 -80 60  0001 L CNN "Field22"
F 23 "2010-01-26" H 8750 -170 60  0001 L CNN "Field23"
F 24 "2010-01-26" H 8750 -260 60  0001 L CNN "Field24"
F 25 "Diodes" H 8750 -350 60  0001 L CNN "Field25"
	1    8750 2200
	1    0    0    -1  
$EndComp
$Comp
L CC0603_1UF_50V_10%_X5R C48
U 1 1 5990C71E
P 9150 2300
F 0 "C48" V 9254 2410 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 9150 2040 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 9150 1230 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 9150 1860 60  0001 L CNN
F 4 "1uF" V 9345 2410 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 9150 1770 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 9150 1680 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 9150 1590 60  0001 L CNN "Library Path"
F 8 "=Value" H 9150 1500 60  0001 L CNN "Comment"
F 9 "Standard" H 9150 1410 60  0001 L CNN "Component Kind"
F 10 "Standard" H 9150 1320 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 9150 1140 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 9150 1050 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 9150 960 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 9150 870 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 9150 780 60  0001 L CNN "Val"
F 16 "None" H 9150 690 60  0001 L CNN "Status"
F 17 "~~" H 9150 600 60  0001 L CNN "Status Comment"
F 18 "50V" H 9150 510 60  0001 L CNN "Voltage"
F 19 "X5R" H 9150 420 60  0001 L CNN "TC"
F 20 "±10%" H 9150 330 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 9150 240 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 9150 150 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 9150 60  60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 9150 -30 60  0001 L CNN "Case"
F 25 "Yes" H 9150 -120 60  0001 L CNN "Mounted"
F 26 "No" H 9150 -210 60  0001 L CNN "Socket"
F 27 "Yes" H 9150 -300 60  0001 L CNN "SMD"
F 28 "~~" H 9150 -390 60  0001 L CNN "PressFit"
F 29 "No" H 9150 -480 60  0001 L CNN "Sense"
F 30 "~~" H 9150 -570 60  0001 L CNN "Sense Comment"
F 31 "~~" H 9150 -660 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 9150 -750 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 9150 -840 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 9150 -930 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 9150 -1020 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 9150 -1110 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 9150 -1200 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 9150 -1290 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 9150 -1380 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 9150 -1470 60  0001 L CNN "License"
	1    9150 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 2200 9850 2200
Wire Wire Line
	9150 2200 9150 2300
$Comp
L CC0603_4.7UF_6.3V_10%_X5R C45
U 1 1 5990D12B
P 9450 1450
F 0 "C45" V 9554 1560 50  0000 L CNN
F 1 "CC0603_4.7UF_6.3V_10%_X5R" H 9450 1190 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 9450 380 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 9450 1010 60  0001 L CNN
F 4 "4.7uF" V 9645 1560 50  0000 L CNN "~"
F 5 "CC0603_4.7UF_6.3V_10%_X5R" H 9450 920 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 9450 830 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 9450 740 60  0001 L CNN "Library Path"
F 8 "=Value" H 9450 650 60  0001 L CNN "Comment"
F 9 "Standard" H 9450 560 60  0001 L CNN "Component Kind"
F 10 "Standard" H 9450 470 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 9450 290 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 9450 200 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 9450 110 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 9450 20  60  0001 L CNN "PackageDescription"
F 15 "4.7uF" H 9450 -70 60  0001 L CNN "Val"
F 16 "Preferred" H 9450 -160 60  0001 L CNN "Status"
F 17 "~~" H 9450 -250 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 9450 -340 60  0001 L CNN "Voltage"
F 19 "X5R" H 9450 -430 60  0001 L CNN "TC"
F 20 "±10%" H 9450 -520 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 9450 -610 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 9450 -700 60  0001 L CNN "Manufacturer"
F 23 "CC0603_4.7uF_6.3V_10%_X5R" H 9450 -790 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 9450 -880 60  0001 L CNN "Case"
F 25 "Yes" H 9450 -970 60  0001 L CNN "Mounted"
F 26 "No" H 9450 -1060 60  0001 L CNN "Socket"
F 27 "Yes" H 9450 -1150 60  0001 L CNN "SMD"
F 28 "~~" H 9450 -1240 60  0001 L CNN "PressFit"
F 29 "No" H 9450 -1330 60  0001 L CNN "Sense"
F 30 "~~" H 9450 -1420 60  0001 L CNN "Sense Comment"
F 31 "~~" H 9450 -1510 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 9450 -1600 60  0001 L CNN "Manufacturer1 Example"
F 33 "225520613672" H 9450 -1690 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 9450 -1780 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0805_X5R_PHYCOMP_HC.pdf" H 9450 -1870 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 9450 -1960 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 9450 -2050 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 9450 -2140 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 9450 -2230 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 9450 -2320 60  0001 L CNN "License"
	1    9450 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 1350 9850 1350
Wire Wire Line
	9450 1350 9450 1450
$Comp
L GND #PWR079
U 1 1 5990D769
P 9450 1850
F 0 "#PWR079" H 9450 1600 50  0001 C CNN
F 1 "GND" H 9455 1677 50  0000 C CNN
F 2 "" H 9450 1850 50  0001 C CNN
F 3 "" H 9450 1850 50  0001 C CNN
	1    9450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1850 9450 1750
Connection ~ 9450 1350
$Comp
L CC0603_22PF_50V_5%_NP0 C49
U 1 1 59919B8A
P 9450 2300
F 0 "C49" V 9554 2410 50  0000 L CNN
F 1 "CC0603_22PF_50V_5%_NP0" H 9450 2040 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 9450 1230 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 9450 1860 60  0001 L CNN
F 4 "22pF" V 9645 2410 50  0000 L CNN "~"
F 5 "CC0603_22PF_50V_5%_NP0" H 9450 1770 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 9450 1680 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 9450 1590 60  0001 L CNN "Library Path"
F 8 "=Value" H 9450 1500 60  0001 L CNN "Comment"
F 9 "Standard" H 9450 1410 60  0001 L CNN "Component Kind"
F 10 "Standard" H 9450 1320 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 9450 1140 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 9450 1050 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 9450 960 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 9450 870 60  0001 L CNN "PackageDescription"
F 15 "22pF" H 9450 780 60  0001 L CNN "Val"
F 16 "Preferred" H 9450 690 60  0001 L CNN "Status"
F 17 "~~" H 9450 600 60  0001 L CNN "Status Comment"
F 18 "50V" H 9450 510 60  0001 L CNN "Voltage"
F 19 "C0G/NP0" H 9450 420 60  0001 L CNN "TC"
F 20 "±5%" H 9450 330 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 9450 240 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 9450 150 60  0001 L CNN "Manufacturer"
F 23 "CC0603_22PF_50V_5%_NP0" H 9450 60  60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 9450 -30 60  0001 L CNN "Case"
F 25 "Yes" H 9450 -120 60  0001 L CNN "Mounted"
F 26 "No" H 9450 -210 60  0001 L CNN "Socket"
F 27 "Yes" H 9450 -300 60  0001 L CNN "SMD"
F 28 "~~" H 9450 -390 60  0001 L CNN "PressFit"
F 29 "No" H 9450 -480 60  0001 L CNN "Sense"
F 30 "~~" H 9450 -570 60  0001 L CNN "Sense Comment"
F 31 "~~" H 9450 -660 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 9450 -750 60  0001 L CNN "Manufacturer1 Example"
F 33 "223886715229" H 9450 -840 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 9450 -930 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_NP0_PHYCOMP.pdf" H 9450 -1020 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 9450 -1110 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 9450 -1200 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 9450 -1290 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 9450 -1380 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 9450 -1470 60  0001 L CNN "License"
	1    9450 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 2200 9450 2300
Connection ~ 9150 2200
Connection ~ 9450 2200
$Comp
L R0603_100K_1%_0.1W_100PPM R39
U 1 1 5991A7FF
P 9800 2300
F 0 "R39" V 9904 2360 50  0000 L CNN
F 1 "R0603_100K_1%_0.1W_100PPM" H 9800 2090 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 9800 1280 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 9800 1910 60  0001 L CNN
F 4 "100k" V 9995 2360 50  0000 L CNN "~"
F 5 "R0603_100K_1%_0.1W_100PPM" H 9800 1820 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 9800 1730 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 9800 1640 60  0001 L CNN "Library Path"
F 8 "=Value" H 9800 1550 60  0001 L CNN "Comment"
F 9 "Standard" H 9800 1460 60  0001 L CNN "Component Kind"
F 10 "Standard" H 9800 1370 60  0001 L CNN "Component Type"
F 11 "~~" H 9800 1190 60  0001 L CNN "PackageDescription"
F 12 "2" H 9800 1100 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 9800 1010 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 9800 920 60  0001 L CNN "Footprint Ref"
F 15 "100k" H 9800 830 60  0001 L CNN "Val"
F 16 "Preferred" H 9800 740 60  0001 L CNN "Status"
F 17 "0.1W" H 9800 650 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 9800 560 60  0001 L CNN "TC"
F 19 "~~" H 9800 470 60  0001 L CNN "Voltage"
F 20 "±1%" H 9800 380 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 9800 290 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 9800 200 60  0001 L CNN "Manufacturer"
F 23 "R0603_100K_1%_0.1W_100PPM" H 9800 110 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 9800 20  60  0001 L CNN "Case"
F 25 "No" H 9800 -70 60  0001 L CNN "PressFit"
F 26 "Yes" H 9800 -160 60  0001 L CNN "Mounted"
F 27 "~~" H 9800 -250 60  0001 L CNN "Sense Comment"
F 28 "No" H 9800 -340 60  0001 L CNN "Sense"
F 29 "~~" H 9800 -430 60  0001 L CNN "Status Comment"
F 30 "No" H 9800 -520 60  0001 L CNN "Socket"
F 31 "Yes" H 9800 -610 60  0001 L CNN "SMD"
F 32 "~~" H 9800 -700 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 9800 -790 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1003TRF" H 9800 -880 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 9800 -970 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 9800 -1060 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 9800 -1150 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 9800 -1240 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 9800 -1330 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 9800 -1420 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 9800 -1510 60  0001 L CNN "License"
	1    9800 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	9800 2300 9800 2200
Connection ~ 9800 2200
$Comp
L R0603_27K_1%_0.1W_100PPM R42
U 1 1 5991B253
P 9800 2800
F 0 "R42" V 9904 2860 50  0000 L CNN
F 1 "R0603_27K_1%_0.1W_100PPM" H 9800 2590 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 9800 1780 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 9800 2410 60  0001 L CNN
F 4 "27k" V 9995 2860 50  0000 L CNN "~"
F 5 "R0603_27K_1%_0.1W_100PPM" H 9800 2320 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 9800 2230 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 9800 2140 60  0001 L CNN "Library Path"
F 8 "=Value" H 9800 2050 60  0001 L CNN "Comment"
F 9 "Standard" H 9800 1960 60  0001 L CNN "Component Kind"
F 10 "Standard" H 9800 1870 60  0001 L CNN "Component Type"
F 11 "~~" H 9800 1690 60  0001 L CNN "PackageDescription"
F 12 "2" H 9800 1600 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 9800 1510 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 9800 1420 60  0001 L CNN "Footprint Ref"
F 15 "27k" H 9800 1330 60  0001 L CNN "Val"
F 16 "Preferred" H 9800 1240 60  0001 L CNN "Status"
F 17 "0.1W" H 9800 1150 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 9800 1060 60  0001 L CNN "TC"
F 19 "~~" H 9800 970 60  0001 L CNN "Voltage"
F 20 "±1%" H 9800 880 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 9800 790 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 9800 700 60  0001 L CNN "Manufacturer"
F 23 "R0603_27K_1%_0.1W_100PPM" H 9800 610 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 9800 520 60  0001 L CNN "Case"
F 25 "No" H 9800 430 60  0001 L CNN "PressFit"
F 26 "Yes" H 9800 340 60  0001 L CNN "Mounted"
F 27 "~~" H 9800 250 60  0001 L CNN "Sense Comment"
F 28 "No" H 9800 160 60  0001 L CNN "Sense"
F 29 "~~" H 9800 70  60  0001 L CNN "Status Comment"
F 30 "No" H 9800 -20 60  0001 L CNN "Socket"
F 31 "Yes" H 9800 -110 60  0001 L CNN "SMD"
F 32 "~~" H 9800 -200 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 9800 -290 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F2702TRF" H 9800 -380 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 9800 -470 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 9800 -560 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 9800 -650 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 9800 -740 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 9800 -830 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 9800 -920 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 9800 -1010 60  0001 L CNN "License"
	1    9800 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	9800 2600 9800 2800
Wire Wire Line
	8700 2750 10050 2750
Wire Wire Line
	9450 2750 9450 2600
Connection ~ 9800 2750
Wire Wire Line
	8700 2750 8700 2500
Wire Wire Line
	8700 2500 8200 2500
Connection ~ 9450 2750
$Comp
L GND #PWR082
U 1 1 5991BB59
P 9150 2600
F 0 "#PWR082" H 9150 2350 50  0001 C CNN
F 1 "GND" H 9155 2427 50  0000 C CNN
F 2 "" H 9150 2600 50  0001 C CNN
F 3 "" H 9150 2600 50  0001 C CNN
	1    9150 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR083
U 1 1 5991CB4E
P 9800 3200
F 0 "#PWR083" H 9800 2950 50  0001 C CNN
F 1 "GND" H 9805 3027 50  0000 C CNN
F 2 "" H 9800 3200 50  0001 C CNN
F 3 "" H 9800 3200 50  0001 C CNN
	1    9800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3200 9800 3100
Text Label 8350 2500 0    60   ~ 0
LCD_BOOST_FB
Text Notes 8800 1050 2    100  ~ 0
LCD Vdrv boost converter
$Comp
L CTE3528-21_47UF_6.3V_10%_LESR0250 C60
U 1 1 59920A71
P 8450 4400
F 0 "C60" V 8554 4517 50  0000 L CNN
F 1 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8450 4140 60  0001 L CNN
F 2 "Capacitors SMD:CAPMP3528X210N" H 8450 3330 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CTE-LESR_AVX_TPS.pdf" H 8450 3960 60  0001 L CNN
F 4 "47uF" V 8645 4517 50  0000 L CNN "~"
F 5 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8450 3870 60  0001 L CNN "Part Number"
F 6 "Capacitor - polarized" H 8450 3780 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 8450 3690 60  0001 L CNN "Library Path"
F 8 "=Value" H 8450 3600 60  0001 L CNN "Comment"
F 9 "Standard" H 8450 3510 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8450 3420 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 8450 3240 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 8450 3150 60  0001 L CNN "Footprint Path"
F 13 "CAPMP3528X210N" H 8450 3060 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 8450 2970 60  0001 L CNN "PackageDescription"
F 15 "47uF" H 8450 2880 60  0001 L CNN "Val"
F 16 "Preferred" H 8450 2790 60  0001 L CNN "Status"
F 17 "~~" H 8450 2700 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 8450 2610 60  0001 L CNN "Voltage"
F 19 "~~" H 8450 2520 60  0001 L CNN "TC"
F 20 "±10%" H 8450 2430 60  0001 L CNN "Tolerance"
F 21 "Low ESR 0R25 Solid Tantalum Chip Capacitor" H 8450 2340 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8450 2250 60  0001 L CNN "Manufacturer"
F 23 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8450 2160 60  0001 L CNN "Manufacturer Part Number"
F 24 "B" H 8450 2070 60  0001 L CNN "Case"
F 25 "Yes" H 8450 1980 60  0001 L CNN "Mounted"
F 26 "No" H 8450 1890 60  0001 L CNN "Socket"
F 27 "Yes" H 8450 1800 60  0001 L CNN "SMD"
F 28 "~~" H 8450 1710 60  0001 L CNN "PressFit"
F 29 "No" H 8450 1620 60  0001 L CNN "Sense"
F 30 "~~" H 8450 1530 60  0001 L CNN "Sense Comment"
F 31 "~~" H 8450 1440 60  0001 L CNN "ComponentHeight"
F 32 "AVX" H 8450 1350 60  0001 L CNN "Manufacturer1 Example"
F 33 "TPSB476K006R0250" H 8450 1260 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "2.1mm" H 8450 1170 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CTE-LESR_AVX_TPS.pdf" H 8450 1080 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 8450 990 60  0001 L CNN "Author"
F 37 "05/05/08 00:00:00" H 8450 900 60  0001 L CNN "CreateDate"
F 38 "01/20/09 00:00:00" H 8450 810 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 8450 720 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8450 630 60  0001 L CNN "License"
	1    8450 4400
	0    1    1    0   
$EndComp
$Comp
L CTE3528-21_47UF_6.3V_10%_LESR0250 C61
U 1 1 59920D75
P 8900 4400
F 0 "C61" V 9004 4517 50  0000 L CNN
F 1 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8900 4140 60  0001 L CNN
F 2 "Capacitors SMD:CAPMP3528X210N" H 8900 3330 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CTE-LESR_AVX_TPS.pdf" H 8900 3960 60  0001 L CNN
F 4 "47uF" V 9095 4517 50  0000 L CNN "~"
F 5 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8900 3870 60  0001 L CNN "Part Number"
F 6 "Capacitor - polarized" H 8900 3780 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 8900 3690 60  0001 L CNN "Library Path"
F 8 "=Value" H 8900 3600 60  0001 L CNN "Comment"
F 9 "Standard" H 8900 3510 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8900 3420 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 8900 3240 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 8900 3150 60  0001 L CNN "Footprint Path"
F 13 "CAPMP3528X210N" H 8900 3060 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 8900 2970 60  0001 L CNN "PackageDescription"
F 15 "47uF" H 8900 2880 60  0001 L CNN "Val"
F 16 "Preferred" H 8900 2790 60  0001 L CNN "Status"
F 17 "~~" H 8900 2700 60  0001 L CNN "Status Comment"
F 18 "6.3V" H 8900 2610 60  0001 L CNN "Voltage"
F 19 "~~" H 8900 2520 60  0001 L CNN "TC"
F 20 "±10%" H 8900 2430 60  0001 L CNN "Tolerance"
F 21 "Low ESR 0R25 Solid Tantalum Chip Capacitor" H 8900 2340 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8900 2250 60  0001 L CNN "Manufacturer"
F 23 "CTE3528-21_47UF_6.3V_10%_LESR0250" H 8900 2160 60  0001 L CNN "Manufacturer Part Number"
F 24 "B" H 8900 2070 60  0001 L CNN "Case"
F 25 "Yes" H 8900 1980 60  0001 L CNN "Mounted"
F 26 "No" H 8900 1890 60  0001 L CNN "Socket"
F 27 "Yes" H 8900 1800 60  0001 L CNN "SMD"
F 28 "~~" H 8900 1710 60  0001 L CNN "PressFit"
F 29 "No" H 8900 1620 60  0001 L CNN "Sense"
F 30 "~~" H 8900 1530 60  0001 L CNN "Sense Comment"
F 31 "~~" H 8900 1440 60  0001 L CNN "ComponentHeight"
F 32 "AVX" H 8900 1350 60  0001 L CNN "Manufacturer1 Example"
F 33 "TPSB476K006R0250" H 8900 1260 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "2.1mm" H 8900 1170 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CTE-LESR_AVX_TPS.pdf" H 8900 1080 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 8900 990 60  0001 L CNN "Author"
F 37 "05/05/08 00:00:00" H 8900 900 60  0001 L CNN "CreateDate"
F 38 "01/20/09 00:00:00" H 8900 810 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 8900 720 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8900 630 60  0001 L CNN "License"
	1    8900 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 4100 8450 4400
Wire Wire Line
	8450 4250 8900 4250
Wire Wire Line
	8900 4250 8900 4400
Wire Wire Line
	8450 4700 8450 5000
Wire Wire Line
	8450 4850 8900 4850
Wire Wire Line
	8900 4850 8900 4700
$Comp
L GND #PWR084
U 1 1 599210B0
P 8450 5000
F 0 "#PWR084" H 8450 4750 50  0001 C CNN
F 1 "GND" H 8455 4827 50  0000 C CNN
F 2 "" H 8450 5000 50  0001 C CNN
F 3 "" H 8450 5000 50  0001 C CNN
	1    8450 5000
	1    0    0    -1  
$EndComp
Connection ~ 8450 4850
Connection ~ 8450 4250
$Comp
L +5V #PWR085
U 1 1 59921B83
P 8450 4100
F 0 "#PWR085" H 8450 3950 50  0001 C CNN
F 1 "+5V" V 8465 4228 50  0000 L CNN
F 2 "" H 8450 4100 50  0001 C CNN
F 3 "" H 8450 4100 50  0001 C CNN
	1    8450 4100
	1    0    0    -1  
$EndComp
Text Notes 8650 6400 0    40   ~ 0
Copyright 2013-2017 twl <twlostow@printf.cc>\n\nThis documentation describes Open Hardware and is licensed under\nthe CERN OHL v. 1.2. You may redistribute and modify this documentation\nunder the terms of the CERN OHL v.1.2. (http://ohwr.org/CERNOHL).\nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY\nAND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2\nfor applicable conditions.\n
Wire Notes Line
	8600 5750 8600 6450
Wire Notes Line
	8600 6450 11000 6450
Wire Notes Line
	11000 6450 11000 5750
Wire Notes Line
	11000 5750 8600 5750
$Comp
L LV52204MUTBG IC3
U 1 1 59926BB7
P 2250 5900
F 0 "IC3" H 2650 6079 50  0000 C CNN
F 1 "LV52204MUTBG" H 2650 5980 60  0000 C CNN
F 2 "dsi_shield:UDFN6_2X2_065P" H 2250 5900 60  0001 C CNN
F 3 "" H 2250 5900 60  0001 C CNN
F 4 "Value" H 2250 5900 60  0001 C CNN "Fieldname"
	1    2250 5900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR086
U 1 1 59927854
P 1550 5750
F 0 "#PWR086" H 1550 5600 50  0001 C CNN
F 1 "+3V3" V 1565 5878 50  0000 L CNN
F 2 "" H 1550 5750 50  0001 C CNN
F 3 "" H 1550 5750 50  0001 C CNN
	1    1550 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6000 1550 6000
Wire Wire Line
	1550 5750 1550 6050
$Comp
L CC0603_1UF_50V_10%_X5R C63
U 1 1 5992840D
P 1550 6050
F 0 "C63" V 1654 6160 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 1550 5790 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 1550 4980 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 5610 60  0001 L CNN
F 4 "1uF" V 1745 6160 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 1550 5520 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 1550 5430 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 1550 5340 60  0001 L CNN "Library Path"
F 8 "=Value" H 1550 5250 60  0001 L CNN "Comment"
F 9 "Standard" H 1550 5160 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1550 5070 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 1550 4890 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 1550 4800 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 1550 4710 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 1550 4620 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 1550 4530 60  0001 L CNN "Val"
F 16 "None" H 1550 4440 60  0001 L CNN "Status"
F 17 "~~" H 1550 4350 60  0001 L CNN "Status Comment"
F 18 "50V" H 1550 4260 60  0001 L CNN "Voltage"
F 19 "X5R" H 1550 4170 60  0001 L CNN "TC"
F 20 "±10%" H 1550 4080 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 1550 3990 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1550 3900 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 1550 3810 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1550 3720 60  0001 L CNN "Case"
F 25 "Yes" H 1550 3630 60  0001 L CNN "Mounted"
F 26 "No" H 1550 3540 60  0001 L CNN "Socket"
F 27 "Yes" H 1550 3450 60  0001 L CNN "SMD"
F 28 "~~" H 1550 3360 60  0001 L CNN "PressFit"
F 29 "No" H 1550 3270 60  0001 L CNN "Sense"
F 30 "~~" H 1550 3180 60  0001 L CNN "Sense Comment"
F 31 "~~" H 1550 3090 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 1550 3000 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 1550 2910 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 1550 2820 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 1550 2730 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 1550 2640 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 1550 2550 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 1550 2460 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 1550 2370 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1550 2280 60  0001 L CNN "License"
	1    1550 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 6200 1850 6200
Wire Wire Line
	1850 6200 1850 6550
Wire Wire Line
	1850 6550 1200 6550
$Comp
L CC0603_220NF_10V_10%_X7R C78
U 1 1 599296ED
P 2000 6800
F 0 "C78" V 2104 6910 50  0000 L CNN
F 1 "CC0603_220NF_10V_10%_X7R" H 2000 6540 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 2000 5730 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 2000 6360 60  0001 L CNN
F 4 "220nF" V 2195 6910 50  0000 L CNN "~"
F 5 "CC0603_220NF_10V_10%_X7R" H 2000 6270 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 2000 6180 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 2000 6090 60  0001 L CNN "Library Path"
F 8 "=Value" H 2000 6000 60  0001 L CNN "Comment"
F 9 "Standard" H 2000 5910 60  0001 L CNN "Component Kind"
F 10 "Standard" H 2000 5820 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 2000 5640 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 2000 5550 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 2000 5460 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 2000 5370 60  0001 L CNN "PackageDescription"
F 15 "220nF" H 2000 5280 60  0001 L CNN "Val"
F 16 "Preferred" H 2000 5190 60  0001 L CNN "Status"
F 17 "~~" H 2000 5100 60  0001 L CNN "Status Comment"
F 18 "10V" H 2000 5010 60  0001 L CNN "Voltage"
F 19 "X7R" H 2000 4920 60  0001 L CNN "TC"
F 20 "±10%" H 2000 4830 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 2000 4740 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 2000 4650 60  0001 L CNN "Manufacturer"
F 23 "CC0603_220NF_10V_10%_X7R" H 2000 4560 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 2000 4470 60  0001 L CNN "Case"
F 25 "Yes" H 2000 4380 60  0001 L CNN "Mounted"
F 26 "No" H 2000 4290 60  0001 L CNN "Socket"
F 27 "Yes" H 2000 4200 60  0001 L CNN "SMD"
F 28 "~~" H 2000 4110 60  0001 L CNN "PressFit"
F 29 "No" H 2000 4020 60  0001 L CNN "Sense"
F 30 "~~" H 2000 3930 60  0001 L CNN "Sense Comment"
F 31 "~~" H 2000 3840 60  0001 L CNN "ComponentHeight"
F 32 "YAGEO PHYCOMP" H 2000 3750 60  0001 L CNN "Manufacturer1 Example"
F 33 "223824615654 or CC0603KRX7R6BB224" H 2000 3660 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 2000 3570 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 2000 3480 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 2000 3390 60  0001 L CNN "Author"
F 37 "10/25/12 00:00:00" H 2000 3300 60  0001 L CNN "CreateDate"
F 38 "10/25/12 00:00:00" H 2000 3210 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 2000 3120 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 2000 3030 60  0001 L CNN "License"
	1    2000 6800
	0    1    1    0   
$EndComp
Connection ~ 1550 6000
$Comp
L GND #PWR087
U 1 1 59929D3C
P 1550 6400
F 0 "#PWR087" H 1550 6150 50  0001 C CNN
F 1 "GND" H 1472 6363 50  0000 R CNN
F 2 "" H 1550 6400 50  0001 C CNN
F 3 "" H 1550 6400 50  0001 C CNN
	1    1550 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6400 1550 6350
$Comp
L GND #PWR088
U 1 1 59929E79
P 2000 7150
F 0 "#PWR088" H 2000 6900 50  0001 C CNN
F 1 "GND" H 2005 6977 50  0000 C CNN
F 2 "" H 2000 7150 50  0001 C CNN
F 3 "" H 2000 7150 50  0001 C CNN
	1    2000 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 7150 2000 7100
Wire Wire Line
	2000 6500 2000 6800
Wire Wire Line
	2000 6500 2150 6500
$Comp
L R0603_100K_1%_0.1W_100PPM R53
U 1 1 5992B4CF
P 1400 6700
F 0 "R53" V 1504 6760 50  0000 L CNN
F 1 "R0603_100K_1%_0.1W_100PPM" H 1400 6490 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 1400 5680 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 1400 6310 60  0001 L CNN
F 4 "100k" V 1595 6760 50  0000 L CNN "~"
F 5 "R0603_100K_1%_0.1W_100PPM" H 1400 6220 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 1400 6130 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 1400 6040 60  0001 L CNN "Library Path"
F 8 "=Value" H 1400 5950 60  0001 L CNN "Comment"
F 9 "Standard" H 1400 5860 60  0001 L CNN "Component Kind"
F 10 "Standard" H 1400 5770 60  0001 L CNN "Component Type"
F 11 "~~" H 1400 5590 60  0001 L CNN "PackageDescription"
F 12 "2" H 1400 5500 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 1400 5410 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 1400 5320 60  0001 L CNN "Footprint Ref"
F 15 "100k" H 1400 5230 60  0001 L CNN "Val"
F 16 "Preferred" H 1400 5140 60  0001 L CNN "Status"
F 17 "0.1W" H 1400 5050 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 1400 4960 60  0001 L CNN "TC"
F 19 "~~" H 1400 4870 60  0001 L CNN "Voltage"
F 20 "±1%" H 1400 4780 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 1400 4690 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 1400 4600 60  0001 L CNN "Manufacturer"
F 23 "R0603_100K_1%_0.1W_100PPM" H 1400 4510 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 1400 4420 60  0001 L CNN "Case"
F 25 "No" H 1400 4330 60  0001 L CNN "PressFit"
F 26 "Yes" H 1400 4240 60  0001 L CNN "Mounted"
F 27 "~~" H 1400 4150 60  0001 L CNN "Sense Comment"
F 28 "No" H 1400 4060 60  0001 L CNN "Sense"
F 29 "~~" H 1400 3970 60  0001 L CNN "Status Comment"
F 30 "No" H 1400 3880 60  0001 L CNN "Socket"
F 31 "Yes" H 1400 3790 60  0001 L CNN "SMD"
F 32 "~~" H 1400 3700 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 1400 3610 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1003TRF" H 1400 3520 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 1400 3430 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 1400 3340 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 1400 3250 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 1400 3160 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 1400 3070 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 1400 2980 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 1400 2890 60  0001 L CNN "License"
	1    1400 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 6700 1400 6550
Connection ~ 1400 6550
$Comp
L GND #PWR089
U 1 1 5992BB66
P 1400 7200
F 0 "#PWR089" H 1400 6950 50  0001 C CNN
F 1 "GND" H 1405 7027 50  0000 C CNN
F 2 "" H 1400 7200 50  0001 C CNN
F 3 "" H 1400 7200 50  0001 C CNN
	1    1400 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 7200 1400 7000
Text HLabel 1200 6550 0    60   BiDi ~ 0
BL_DIM
Wire Wire Line
	3150 6400 3250 6400
Wire Wire Line
	3250 6400 3250 7150
Wire Wire Line
	3150 6500 3250 6500
Connection ~ 3250 6500
$Comp
L GND #PWR090
U 1 1 5992F015
P 3250 7150
F 0 "#PWR090" H 3250 6900 50  0001 C CNN
F 1 "GND" H 3255 6977 50  0000 C CNN
F 2 "" H 3250 7150 50  0001 C CNN
F 3 "" H 3250 7150 50  0001 C CNN
	1    3250 7150
	1    0    0    -1  
$EndComp
$Comp
L DLCSM0315D-2R2-K L5
U 1 1 5993074E
P 2450 5600
F 0 "L5" H 2600 5850 50  0000 C CNN
F 1 "22uH" H 2600 5751 60  0000 C CNN
F 2 "dsi_shield:IND_PANASONIC_ELLVEG" H 2450 5600 60  0001 C CNN
F 3 "" H 2450 5600 60  0001 C CNN
F 4 "Value" H 2450 5600 60  0001 C CNN "Fieldname"
F 5 "0.5A" H 2450 4600 60  0001 L CNN "Power"
F 6 "1.74R" H 2450 4510 60  0001 L CNN "Resistance"
F 7 "±20%" H 2450 4420 60  0001 L CNN "Tollerance"
F 8 "Chip Inductor (Chip Coil) for Choke Wire Wound Type" H 2450 4330 60  0001 L CNN "Description"
F 9 "KINGCORE" H 2450 4240 60  0001 L CNN "Manufacturer"
F 10 "DLCSM0315D-220M-K" H 2450 4150 60  0001 L CNN "Manufacturer Part Number"
F 11 "Yes" H 2450 4060 60  0001 L CNN "Mounted"
F 12 "Yes" H 2450 3880 60  0001 L CNN "SMD"
	1    2450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5600 2000 5600
Wire Wire Line
	2000 5600 2000 6000
Connection ~ 2000 6000
Wire Wire Line
	2750 5600 3350 5600
Wire Wire Line
	3350 5600 3350 6000
Connection ~ 3350 6000
$Comp
L CC0603_1UF_50V_10%_X5R C62
U 1 1 59933617
P 3900 6100
F 0 "C62" V 4004 6210 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3900 5840 60  0001 L CNN
F 2 "Capacitors SMD:CAPC1608X87N" H 3900 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3900 5660 60  0001 L CNN
F 4 "1uF" V 4095 6210 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3900 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3900 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3900 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 3900 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 3900 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3900 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3900 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3900 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3900 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3900 4670 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3900 4580 60  0001 L CNN "Val"
F 16 "None" H 3900 4490 60  0001 L CNN "Status"
F 17 "~~" H 3900 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 3900 4310 60  0001 L CNN "Voltage"
F 19 "X5R" H 3900 4220 60  0001 L CNN "TC"
F 20 "±10%" H 3900 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3900 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3900 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3900 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3900 3770 60  0001 L CNN "Case"
F 25 "Yes" H 3900 3680 60  0001 L CNN "Mounted"
F 26 "No" H 3900 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 3900 3500 60  0001 L CNN "SMD"
F 28 "~~" H 3900 3410 60  0001 L CNN "PressFit"
F 29 "No" H 3900 3320 60  0001 L CNN "Sense"
F 30 "~~" H 3900 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3900 3140 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3900 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3900 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3900 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3900 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3900 2690 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3900 2600 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3900 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3900 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3900 2330 60  0001 L CNN "License"
	1    3900 6100
	0    1    1    0   
$EndComp
$Comp
L Diode_Schottky D?
U 1 1 5993548D
P 3500 6000
AR Path="/59999DBD/5993548D" Ref="D?"  Part="1" 
AR Path="/599BB99B/5993548D" Ref="D4"  Part="1" 
F 0 "D4" H 3650 6227 50  0000 C CNN
F 1 "BAS170W" H 3650 6136 50  0000 C CNN
F 2 "ICs And Semiconductors SMD:SOD2713X115N" H 3500 5520 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\MBR0530PBF.pdf" H 3500 5430 60  0001 L CNN
F 4 "Value" H 3500 6000 60  0001 C CNN "Fieldname"
F 5 "MBR0530PbF" H 3500 5340 60  0001 L CNN "Field4"
F 6 "Standard" H 3500 5250 60  0001 L CNN "Field5"
F 7 "Standard" H 3500 5160 60  0001 L CNN "Field6"
F 8 "MBR0530PbF" H 3500 5070 60  0001 L CNN "Field7"
F 9 "SOD Diode (SOD-123); 2.70mm W X 1.55mm L X 1.45mm H body, IPC Medium Density" H 3500 4980 60  0001 L CNN "Field8"
F 10 "30V" H 3500 4890 60  0001 L CNN "Field9"
F 11 "500mA" H 3500 4800 60  0001 L CNN "Field10"
F 12 "Schottky Diode" H 3500 4710 60  0001 L CNN "Field11"
F 13 "VISHAY HIGH POWER PRODUCTS" H 3500 4620 60  0001 L CNN "Field12"
F 14 "2" H 3500 4440 60  0001 L CNN "Field14"
F 15 "SOD-123" H 3500 4350 60  0001 L CNN "Field15"
F 16 "Yes" H 3500 4260 60  0001 L CNN "Field16"
F 17 "No" H 3500 4170 60  0001 L CNN "Field17"
F 18 "Yes" H 3500 4080 60  0001 L CNN "Field18"
F 19 "No" H 3500 3990 60  0001 L CNN "Field19"
F 20 "No" H 3500 3900 60  0001 L CNN "Field20"
F 21 "1.45mm" H 3500 3810 60  0001 L CNN "Field21"
F 22 "CERN DEM JLC" H 3500 3720 60  0001 L CNN "Field22"
F 23 "2010-01-26" H 3500 3630 60  0001 L CNN "Field23"
F 24 "2010-01-26" H 3500 3540 60  0001 L CNN "Field24"
F 25 "Diodes" H 3500 3450 60  0001 L CNN "Field25"
	1    3500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6000 3150 6000
Wire Wire Line
	3800 6000 4050 6000
Wire Wire Line
	3900 6000 3900 6100
$Comp
L GND #PWR091
U 1 1 59935AC9
P 3900 6450
F 0 "#PWR091" H 3900 6200 50  0001 C CNN
F 1 "GND" H 3905 6277 50  0000 C CNN
F 2 "" H 3900 6450 50  0001 C CNN
F 3 "" H 3900 6450 50  0001 C CNN
	1    3900 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6450 3900 6400
Wire Wire Line
	3150 6200 3500 6200
Wire Wire Line
	3500 6200 3500 6750
$Comp
L R0603_10R_1%_0.1W_200PPM R47
U 1 1 59938126
P 3500 6750
F 0 "R47" V 3604 6810 50  0000 L CNN
F 1 "R0603_10R_1%_0.1W_200PPM" H 3500 6540 60  0001 L CNN
F 2 "Resistors SMD:RESC1608X55N" H 3500 5730 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 3500 6360 60  0001 L CNN
F 4 "10" V 3695 6810 50  0000 L CNN "~"
F 5 "R0603_10R_1%_0.1W_200PPM" H 3500 6270 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 3500 6180 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 3500 6090 60  0001 L CNN "Library Path"
F 8 "=Value" H 3500 6000 60  0001 L CNN "Comment"
F 9 "Standard" H 3500 5910 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3500 5820 60  0001 L CNN "Component Type"
F 11 "~~" H 3500 5640 60  0001 L CNN "PackageDescription"
F 12 "2" H 3500 5550 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 3500 5460 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 3500 5370 60  0001 L CNN "Footprint Ref"
F 15 "10" H 3500 5280 60  0001 L CNN "Val"
F 16 "Preferred" H 3500 5190 60  0001 L CNN "Status"
F 17 "0.1W" H 3500 5100 60  0001 L CNN "Power"
F 18 "±200ppm/°C" H 3500 5010 60  0001 L CNN "TC"
F 19 "~~" H 3500 4920 60  0001 L CNN "Voltage"
F 20 "±1%" H 3500 4830 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 3500 4740 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3500 4650 60  0001 L CNN "Manufacturer"
F 23 "R0603_10R_1%_0.1W_200PPM" H 3500 4560 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3500 4470 60  0001 L CNN "Case"
F 25 "No" H 3500 4380 60  0001 L CNN "PressFit"
F 26 "Yes" H 3500 4290 60  0001 L CNN "Mounted"
F 27 "~~" H 3500 4200 60  0001 L CNN "Sense Comment"
F 28 "No" H 3500 4110 60  0001 L CNN "Sense"
F 29 "~~" H 3500 4020 60  0001 L CNN "Status Comment"
F 30 "No" H 3500 3930 60  0001 L CNN "Socket"
F 31 "Yes" H 3500 3840 60  0001 L CNN "SMD"
F 32 "~~" H 3500 3750 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 3500 3660 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F10R0TRF" H 3500 3570 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 3500 3480 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 3500 3390 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 3500 3300 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 3500 3210 60  0001 L CNN "CreateDate"
F 39 "06/24/09 00:00:00" H 3500 3120 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 3500 3030 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3500 2940 60  0001 L CNN "License"
	1    3500 6750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR092
U 1 1 5993842D
P 3500 7150
F 0 "#PWR092" H 3500 6900 50  0001 C CNN
F 1 "GND" H 3505 6977 50  0000 C CNN
F 2 "" H 3500 7150 50  0001 C CNN
F 3 "" H 3500 7150 50  0001 C CNN
	1    3500 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 7150 3500 7050
Wire Wire Line
	3500 6700 4050 6700
Connection ~ 3500 6700
Connection ~ 3900 6000
Text HLabel 4050 6000 2    60   UnSpc ~ 0
LCD_BL_A
Text HLabel 4050 6700 2    60   UnSpc ~ 0
LCD_BL_FB
Text Notes 10000 6800 2    150  ~ 0
HDMI DSI Shield
Text Notes 9600 7000 2    100  ~ 0
Power supplies
Text Notes 10800 7650 2    60   ~ 0
2.2a
Text Notes 8050 7500 2    60   ~ 0
Power supplies
Text Notes 3600 5150 2    100  ~ 0
LCD backlight converter
Text HLabel 10050 2750 2    60   Input ~ 0
LCD_BOOST_FB
$Comp
L LCD_PVDD #PWR080
U 1 1 599DF8B8
P 9850 2200
F 0 "#PWR080" H 9850 2050 50  0001 C CNN
F 1 "LCD_PVDD" V 9865 2328 50  0000 L CNN
F 2 "" H 9850 2200 50  0001 C CNN
F 3 "" H 9850 2200 50  0001 C CNN
	1    9850 2200
	0    1    1    0   
$EndComp
$Comp
L LCD_MVDD #PWR081
U 1 1 599DFBE9
P 9850 1350
F 0 "#PWR081" H 9850 1200 50  0001 C CNN
F 1 "LCD_MVDD" V 9865 1478 50  0000 L CNN
F 2 "" H 9850 1350 50  0001 C CNN
F 3 "" H 9850 1350 50  0001 C CNN
	1    9850 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 1800 4950 2000
Wire Wire Line
	4400 1600 4400 1800
Connection ~ 4400 1800
Wire Wire Line
	4400 2200 4400 2400
Connection ~ 4400 2400
Connection ~ 4950 2200
Wire Wire Line
	4950 2400 4950 2600
$EndSCHEMATC
