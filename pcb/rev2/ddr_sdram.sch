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
Sheet 10 13
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
L MT46V32M16P-5B:F IC10
U 1 1 59956E83
P 7650 4450
F 0 "IC10" H 4500 7425 50  0000 C CNN
F 1 "MT46V32M16P-5B:F" H 4875 7325 60  0000 C CNN
F 2 "" H 7650 3400 60  0001 L CNN
F 3 "" H 7650 3310 60  0001 L CNN
F 4 "Value" H 7650 4450 60  0001 C CNN "Fieldname"
F 5 "MT46V32M16P-5B:F" H 7650 3220 60  0001 L CNN "Field4"
F 6 "Yes" H 7650 3130 60  0001 L CNN "Field5"
F 7 "MT46V32M16P-5B:F" H 7650 3040 60  0001 L CNN "Field6"
	1    7650 4450
	1    0    0    -1  
$EndComp
$Comp
L +2V5 #PWR093
U 1 1 59957939
P 5450 1050
F 0 "#PWR093" H 5450 900 50  0001 C CNN
F 1 "+2V5" H 5465 1223 50  0000 C CNN
F 2 "" H 5450 1050 50  0001 C CNN
F 3 "" H 5450 1050 50  0001 C CNN
	1    5450 1050
	1    0    0    -1  
$EndComp
Text Label 4100 1850 0    60   ~ 0
SDRAM_A0
Text Label 4100 1950 0    60   ~ 0
SDRAM_A1
Text Label 4100 2050 0    60   ~ 0
SDRAM_A2
Text Label 4100 2150 0    60   ~ 0
SDRAM_A3
Text Label 4100 2250 0    60   ~ 0
SDRAM_A4
Text Label 4100 2350 0    60   ~ 0
SDRAM_A5
Text Label 4100 2450 0    60   ~ 0
SDRAM_A6
Text Label 4100 2550 0    60   ~ 0
SDRAM_A7
Text Label 4100 2650 0    60   ~ 0
SDRAM_A8
Text Label 4100 2750 0    60   ~ 0
SDRAM_A9
Text Label 4100 2850 0    60   ~ 0
SDRAM_A10
Text Label 4100 2950 0    60   ~ 0
SDRAM_A11
Text Label 4100 3050 0    60   ~ 0
SDRAM_A12
Entry Wire Line
	3900 1750 4000 1850
Entry Wire Line
	3900 1850 4000 1950
Entry Wire Line
	3900 1950 4000 2050
Entry Wire Line
	3900 2050 4000 2150
Entry Wire Line
	3900 2150 4000 2250
Entry Wire Line
	3900 2250 4000 2350
Entry Wire Line
	3900 2350 4000 2450
Entry Wire Line
	3900 2450 4000 2550
Entry Wire Line
	3900 2550 4000 2650
Entry Wire Line
	3900 2650 4000 2750
Entry Wire Line
	3900 2750 4000 2850
Entry Wire Line
	3900 2850 4000 2950
Entry Wire Line
	3900 2950 4000 3050
Text Label 3200 1750 0    60   ~ 0
SDRAM_A[0..12]
Text HLabel 3100 1750 0    60   Input ~ 0
SDRAM_A[0..12]
Text HLabel 3100 3150 0    60   Input ~ 0
SDRAM_BA[0..1]
Text Label 3150 3150 0    60   ~ 0
SDRAM_BA[0..1]
Text Label 4050 3350 0    60   ~ 0
SDRAM_BA0
Text Label 4050 3450 0    60   ~ 0
SDRAM_BA1
Entry Wire Line
	3900 3250 4000 3350
Entry Wire Line
	3900 3350 4000 3450
Text HLabel 3900 3750 0    60   Input ~ 0
SDRAM_RAS_N
Text HLabel 3900 3850 0    60   Input ~ 0
SDRAM_CAS_N
Text HLabel 3900 3950 0    60   Input ~ 0
SDRAM_WE_N
Text HLabel 3900 4050 0    60   Input ~ 0
SDRAM_CS_N
Text HLabel 3900 4350 0    60   Input ~ 0
SDRAM_CKE
Text HLabel 3900 4650 0    60   Input ~ 0
SDRAM_CLK_P
Text HLabel 3900 4750 0    60   Input ~ 0
SDRAM_CLK_N
$Comp
L R0603_100R_1%_0.1W_100PPM R67
U 1 1 5995CCB9
P 4200 4850
F 0 "R67" V 4304 4910 50  0000 L CNN
F 1 "R0603_100R_1%_0.1W_100PPM" H 4200 4640 60  0001 L CNN
F 2 "RESC1608X55N" H 4200 3830 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4200 4460 60  0001 L CNN
F 4 "100" V 4395 4910 50  0000 L CNN "~"
F 5 "R0603_100R_1%_0.1W_100PPM" H 4200 4370 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 4200 4280 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 4200 4190 60  0001 L CNN "Library Path"
F 8 "=Value" H 4200 4100 60  0001 L CNN "Comment"
F 9 "Standard" H 4200 4010 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4200 3920 60  0001 L CNN "Component Type"
F 11 "~~" H 4200 3740 60  0001 L CNN "PackageDescription"
F 12 "2" H 4200 3650 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 4200 3560 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 4200 3470 60  0001 L CNN "Footprint Ref"
F 15 "100" H 4200 3380 60  0001 L CNN "Val"
F 16 "Preferred" H 4200 3290 60  0001 L CNN "Status"
F 17 "0.1W" H 4200 3200 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 4200 3110 60  0001 L CNN "TC"
F 19 "~~" H 4200 3020 60  0001 L CNN "Voltage"
F 20 "±1%" H 4200 2930 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 4200 2840 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4200 2750 60  0001 L CNN "Manufacturer"
F 23 "R0603_100R_1%_0.1W_100PPM" H 4200 2660 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4200 2570 60  0001 L CNN "Case"
F 25 "No" H 4200 2480 60  0001 L CNN "PressFit"
F 26 "Yes" H 4200 2390 60  0001 L CNN "Mounted"
F 27 "~~" H 4200 2300 60  0001 L CNN "Sense Comment"
F 28 "No" H 4200 2210 60  0001 L CNN "Sense"
F 29 "~~" H 4200 2120 60  0001 L CNN "Status Comment"
F 30 "No" H 4200 2030 60  0001 L CNN "Socket"
F 31 "Yes" H 4200 1940 60  0001 L CNN "SMD"
F 32 "~~" H 4200 1850 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 4200 1760 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F4700TRF" H 4200 1670 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 4200 1580 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 4200 1490 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 4200 1400 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 4200 1310 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 4200 1220 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 4200 1130 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4200 1040 60  0001 L CNN "License"
	1    4200 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 1250 6450 1350
Wire Wire Line
	5450 1250 6450 1250
Wire Wire Line
	5450 1050 5450 1350
Connection ~ 5450 1250
Wire Wire Line
	5550 1350 5550 1250
Connection ~ 5550 1250
Wire Wire Line
	5650 1350 5650 1250
Connection ~ 5650 1250
Wire Wire Line
	6050 1350 6050 1250
Connection ~ 6050 1250
Wire Wire Line
	6150 1350 6150 1250
Connection ~ 6150 1250
Wire Wire Line
	6250 1350 6250 1250
Connection ~ 6250 1250
Wire Wire Line
	6350 1350 6350 1250
Connection ~ 6350 1250
Wire Wire Line
	4000 1850 4650 1850
Wire Wire Line
	4000 1950 4650 1950
Wire Wire Line
	4000 2050 4650 2050
Wire Wire Line
	4000 2150 4650 2150
Wire Wire Line
	4000 2250 4650 2250
Wire Wire Line
	4000 2350 4650 2350
Wire Wire Line
	4000 2450 4650 2450
Wire Wire Line
	4000 2550 4650 2550
Wire Wire Line
	4000 2650 4650 2650
Wire Wire Line
	4000 2750 4650 2750
Wire Wire Line
	4000 2850 4650 2850
Wire Wire Line
	4000 2950 4650 2950
Wire Wire Line
	4000 3050 4650 3050
Wire Bus Line
	3900 1750 3900 2950
Wire Bus Line
	3100 1750 3900 1750
Wire Wire Line
	4000 3350 4650 3350
Wire Wire Line
	4000 3450 4650 3450
Wire Bus Line
	3900 3150 3900 3350
Wire Bus Line
	3900 3150 3100 3150
Wire Wire Line
	4650 3750 3900 3750
Wire Wire Line
	4650 3850 3900 3850
Wire Wire Line
	4650 3950 3900 3950
Wire Wire Line
	4650 4050 3900 4050
Wire Wire Line
	4650 4350 3900 4350
Wire Wire Line
	3900 4650 4650 4650
Wire Wire Line
	3900 4750 4650 4750
Wire Wire Line
	4200 4850 4200 4650
Connection ~ 4200 4650
Wire Wire Line
	4200 5150 4200 5250
Wire Wire Line
	4200 5250 4400 5250
Wire Wire Line
	4400 5250 4400 4750
Connection ~ 4400 4750
Wire Wire Line
	5450 5250 5450 5500
Wire Wire Line
	5450 5350 6450 5350
Wire Wire Line
	6450 5350 6450 5250
Wire Wire Line
	5550 5250 5550 5350
Connection ~ 5550 5350
Wire Wire Line
	5650 5250 5650 5350
Connection ~ 5650 5350
Wire Wire Line
	6050 5250 6050 5350
Connection ~ 6050 5350
Wire Wire Line
	6150 5250 6150 5350
Connection ~ 6150 5350
Wire Wire Line
	6250 5250 6250 5350
Connection ~ 6250 5350
Wire Wire Line
	6350 5250 6350 5350
Connection ~ 6350 5350
Connection ~ 5450 5350
$Comp
L GND #PWR094
U 1 1 5995E2A8
P 5450 5500
F 0 "#PWR094" H 5450 5250 50  0001 C CNN
F 1 "GND" H 5455 5327 50  0000 C CNN
F 2 "" H 5450 5500 50  0001 C CNN
F 3 "" H 5450 5500 50  0001 C CNN
	1    5450 5500
	1    0    0    -1  
$EndComp
Text Label 7400 2050 0    60   ~ 0
SDRAM_DQ0
Text Label 7400 2150 0    60   ~ 0
SDRAM_DQ1
Text Label 7400 2250 0    60   ~ 0
SDRAM_DQ2
Text Label 7400 2350 0    60   ~ 0
SDRAM_DQ3
Text Label 7400 2450 0    60   ~ 0
SDRAM_DQ4
Text Label 7400 2550 0    60   ~ 0
SDRAM_DQ5
Text Label 7400 2650 0    60   ~ 0
SDRAM_DQ6
Text Label 7400 2750 0    60   ~ 0
SDRAM_DQ7
Text Label 7400 2850 0    60   ~ 0
SDRAM_DQ8
Text Label 7400 2950 0    60   ~ 0
SDRAM_DQ9
Text Label 7400 3050 0    60   ~ 0
SDRAM_DQ10
Text Label 7400 3150 0    60   ~ 0
SDRAM_DQ11
Text Label 7400 3250 0    60   ~ 0
SDRAM_DQ12
Text Label 7400 3350 0    60   ~ 0
SDRAM_DQ13
Text Label 7400 3450 0    60   ~ 0
SDRAM_DQ14
Text Label 7400 3550 0    60   ~ 0
SDRAM_DQ15
Wire Wire Line
	7250 2050 8100 2050
Wire Wire Line
	7250 2150 8100 2150
Wire Wire Line
	7250 2250 8100 2250
Wire Wire Line
	7250 2350 8100 2350
Wire Wire Line
	7250 2450 8100 2450
Wire Wire Line
	7250 2550 8100 2550
Wire Wire Line
	7250 2650 8100 2650
Wire Wire Line
	7250 2750 8100 2750
Wire Wire Line
	7250 2850 8100 2850
Wire Wire Line
	7250 2950 8100 2950
Wire Wire Line
	7250 3050 8100 3050
Wire Wire Line
	7250 3150 8100 3150
Wire Wire Line
	7250 3250 8100 3250
Wire Wire Line
	7250 3350 8100 3350
Wire Wire Line
	7250 3450 8100 3450
Wire Wire Line
	7250 3550 8100 3550
Entry Wire Line
	8100 2050 8200 2150
Entry Wire Line
	8100 2150 8200 2250
Entry Wire Line
	8100 2250 8200 2350
Entry Wire Line
	8100 2350 8200 2450
Entry Wire Line
	8100 2450 8200 2550
Entry Wire Line
	8100 2550 8200 2650
Entry Wire Line
	8100 2650 8200 2750
Entry Wire Line
	8100 2750 8200 2850
Entry Wire Line
	8100 2850 8200 2950
Entry Wire Line
	8100 2950 8200 3050
Entry Wire Line
	8100 3050 8200 3150
Entry Wire Line
	8100 3150 8200 3250
Entry Wire Line
	8100 3250 8200 3350
Entry Wire Line
	8100 3350 8200 3450
Entry Wire Line
	8100 3450 8200 3550
Entry Wire Line
	8100 3550 8200 3650
Wire Bus Line
	8200 2150 8200 3750
Wire Bus Line
	8200 3750 9200 3750
Text Label 8300 3750 0    60   ~ 0
SDRAM_DQ[0..15]
Text HLabel 9200 3750 2    60   BiDi ~ 0
SDRAM_DQ[0..15]
Text HLabel 9200 4100 2    60   BiDi ~ 0
SDRAM_DQM[0..1]
Text HLabel 9200 4500 2    60   BiDi ~ 0
SDRAM_DQS[0..1]
Wire Wire Line
	7250 3850 8100 3850
Wire Wire Line
	7250 3950 8100 3950
Text Label 7400 3850 0    60   ~ 0
SDRAM_DQM0
Text Label 7400 3950 0    60   ~ 0
SDRAM_DQM1
Text Label 7400 4250 0    60   ~ 0
SDRAM_DQS0
Text Label 7400 4350 0    60   ~ 0
SDRAM_DQS1
Wire Wire Line
	7250 4250 8100 4250
Wire Wire Line
	7250 4350 8100 4350
Entry Wire Line
	8100 3850 8200 3950
Entry Wire Line
	8100 3950 8200 4050
Entry Wire Line
	8100 4250 8200 4350
Entry Wire Line
	8100 4350 8200 4450
Wire Bus Line
	8200 3950 8200 4100
Wire Bus Line
	8200 4100 9200 4100
Wire Bus Line
	8200 4350 8200 4500
Wire Bus Line
	8200 4500 9200 4500
Text Label 8300 4100 0    60   ~ 0
SDRAM_DQM[0..1]
Text Label 8300 4500 0    60   ~ 0
SDRAM_DQS[0..1]
Wire Wire Line
	7250 4650 9200 4650
Text HLabel 9200 4650 2    60   UnSpc ~ 0
DDR_VREF
Wire Wire Line
	7800 4650 7800 5550
Wire Wire Line
	7800 5550 8400 5550
$Comp
L R0603_1K_1%_0.1W_100PPM R68
U 1 1 599686D8
P 8100 5150
F 0 "R68" V 8204 5210 50  0000 L CNN
F 1 "R0603_1K_1%_0.1W_100PPM" H 8100 4940 60  0001 L CNN
F 2 "RESC1608X55N" H 8100 4130 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 8100 4760 60  0001 L CNN
F 4 "1k" V 8295 5210 50  0000 L CNN "~"
F 5 "R0603_1K_1%_0.1W_100PPM" H 8100 4670 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 8100 4580 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 8100 4490 60  0001 L CNN "Library Path"
F 8 "=Value" H 8100 4400 60  0001 L CNN "Comment"
F 9 "Standard" H 8100 4310 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8100 4220 60  0001 L CNN "Component Type"
F 11 "~~" H 8100 4040 60  0001 L CNN "PackageDescription"
F 12 "2" H 8100 3950 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 8100 3860 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 8100 3770 60  0001 L CNN "Footprint Ref"
F 15 "1k" H 8100 3680 60  0001 L CNN "Val"
F 16 "Preferred" H 8100 3590 60  0001 L CNN "Status"
F 17 "0.1W" H 8100 3500 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 8100 3410 60  0001 L CNN "TC"
F 19 "~~" H 8100 3320 60  0001 L CNN "Voltage"
F 20 "±1%" H 8100 3230 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 8100 3140 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8100 3050 60  0001 L CNN "Manufacturer"
F 23 "R0603_1K_1%_0.1W_100PPM" H 8100 2960 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 8100 2870 60  0001 L CNN "Case"
F 25 "No" H 8100 2780 60  0001 L CNN "PressFit"
F 26 "Yes" H 8100 2690 60  0001 L CNN "Mounted"
F 27 "~~" H 8100 2600 60  0001 L CNN "Sense Comment"
F 28 "No" H 8100 2510 60  0001 L CNN "Sense"
F 29 "~~" H 8100 2420 60  0001 L CNN "Status Comment"
F 30 "No" H 8100 2330 60  0001 L CNN "Socket"
F 31 "Yes" H 8100 2240 60  0001 L CNN "SMD"
F 32 "~~" H 8100 2150 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 8100 2060 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1001TRF" H 8100 1970 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 8100 1880 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 8100 1790 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 8100 1700 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 8100 1610 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 8100 1520 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 8100 1430 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8100 1340 60  0001 L CNN "License"
	1    8100 5150
	0    1    1    0   
$EndComp
$Comp
L R0603_1K_1%_0.1W_100PPM R69
U 1 1 59968851
P 8100 5650
F 0 "R69" V 8204 5710 50  0000 L CNN
F 1 "R0603_1K_1%_0.1W_100PPM" H 8100 5440 60  0001 L CNN
F 2 "RESC1608X55N" H 8100 4630 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 8100 5260 60  0001 L CNN
F 4 "1k" V 8295 5710 50  0000 L CNN "~"
F 5 "R0603_1K_1%_0.1W_100PPM" H 8100 5170 60  0001 L CNN "Part Number"
F 6 "Resistor - 1%" H 8100 5080 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Resistors.SchLib" H 8100 4990 60  0001 L CNN "Library Path"
F 8 "=Value" H 8100 4900 60  0001 L CNN "Comment"
F 9 "Standard" H 8100 4810 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8100 4720 60  0001 L CNN "Component Type"
F 11 "~~" H 8100 4540 60  0001 L CNN "PackageDescription"
F 12 "2" H 8100 4450 60  0001 L CNN "Pin Count"
F 13 "PcbLib\\Resistors SMD.PcbLib" H 8100 4360 60  0001 L CNN "Footprint Path"
F 14 "RESC1608X55N" H 8100 4270 60  0001 L CNN "Footprint Ref"
F 15 "1k" H 8100 4180 60  0001 L CNN "Val"
F 16 "Preferred" H 8100 4090 60  0001 L CNN "Status"
F 17 "0.1W" H 8100 4000 60  0001 L CNN "Power"
F 18 "±100ppm/°C" H 8100 3910 60  0001 L CNN "TC"
F 19 "~~" H 8100 3820 60  0001 L CNN "Voltage"
F 20 "±1%" H 8100 3730 60  0001 L CNN "Tolerance"
F 21 "General Purpose Thick Film Chip Resistor" H 8100 3640 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8100 3550 60  0001 L CNN "Manufacturer"
F 23 "R0603_1K_1%_0.1W_100PPM" H 8100 3460 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 8100 3370 60  0001 L CNN "Case"
F 25 "No" H 8100 3280 60  0001 L CNN "PressFit"
F 26 "Yes" H 8100 3190 60  0001 L CNN "Mounted"
F 27 "~~" H 8100 3100 60  0001 L CNN "Sense Comment"
F 28 "No" H 8100 3010 60  0001 L CNN "Sense"
F 29 "~~" H 8100 2920 60  0001 L CNN "Status Comment"
F 30 "No" H 8100 2830 60  0001 L CNN "Socket"
F 31 "Yes" H 8100 2740 60  0001 L CNN "SMD"
F 32 "~~" H 8100 2650 60  0001 L CNN "ComponentHeight"
F 33 "NIC COMPONENT" H 8100 2560 60  0001 L CNN "Manufacturer1 Example"
F 34 "NRC06F1001TRF" H 8100 2470 60  0001 L CNN "Manufacturer1 Part Number"
F 35 "0.55mm" H 8100 2380 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 36 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\R0603_NIC_NRC.pdf" H 8100 2290 60  0001 L CNN "HelpURL"
F 37 "CERN DEM JLC" H 8100 2200 60  0001 L CNN "Author"
F 38 "12/03/07 00:00:00" H 8100 2110 60  0001 L CNN "CreateDate"
F 39 "03/13/08 00:00:00" H 8100 2020 60  0001 L CNN "LatestRevisionDate"
F 40 "Resistors SMD" H 8100 1930 60  0001 L CNN "Library Name"
F 41 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8100 1840 60  0001 L CNN "License"
	1    8100 5650
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C65
U 1 1 5996A953
P 8400 5150
F 0 "C65" V 8504 5260 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 8400 4890 60  0001 L CNN
F 2 "CAPC1608X90N" H 8400 4080 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 8400 4710 60  0001 L CNN
F 4 "100nF" V 8595 5260 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 8400 4620 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 8400 4530 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 8400 4440 60  0001 L CNN "Library Path"
F 8 "=Value" H 8400 4350 60  0001 L CNN "Comment"
F 9 "Standard" H 8400 4260 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8400 4170 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 8400 3990 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 8400 3900 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 8400 3810 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 8400 3720 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 8400 3630 60  0001 L CNN "Val"
F 16 "None" H 8400 3540 60  0001 L CNN "Status"
F 17 "~~" H 8400 3450 60  0001 L CNN "Status Comment"
F 18 "100V" H 8400 3360 60  0001 L CNN "Voltage"
F 19 "X7R" H 8400 3270 60  0001 L CNN "TC"
F 20 "±10%" H 8400 3180 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 8400 3090 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8400 3000 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 8400 2910 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 8400 2820 60  0001 L CNN "Case"
F 25 "Yes" H 8400 2730 60  0001 L CNN "Mounted"
F 26 "No" H 8400 2640 60  0001 L CNN "Socket"
F 27 "Yes" H 8400 2550 60  0001 L CNN "SMD"
F 28 "~~" H 8400 2460 60  0001 L CNN "PressFit"
F 29 "No" H 8400 2370 60  0001 L CNN "Sense"
F 30 "~~" H 8400 2280 60  0001 L CNN "Sense Comment"
F 31 "~~" H 8400 2190 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 8400 2100 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 8400 2010 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 8400 1920 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 8400 1830 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 8400 1740 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 8400 1650 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 8400 1560 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 8400 1470 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8400 1380 60  0001 L CNN "License"
	1    8400 5150
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C71
U 1 1 5996AB59
P 8400 5650
F 0 "C71" V 8504 5760 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 8400 5390 60  0001 L CNN
F 2 "CAPC1608X90N" H 8400 4580 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 8400 5210 60  0001 L CNN
F 4 "100nF" V 8595 5760 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 8400 5120 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 8400 5030 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 8400 4940 60  0001 L CNN "Library Path"
F 8 "=Value" H 8400 4850 60  0001 L CNN "Comment"
F 9 "Standard" H 8400 4760 60  0001 L CNN "Component Kind"
F 10 "Standard" H 8400 4670 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 8400 4490 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 8400 4400 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 8400 4310 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 8400 4220 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 8400 4130 60  0001 L CNN "Val"
F 16 "None" H 8400 4040 60  0001 L CNN "Status"
F 17 "~~" H 8400 3950 60  0001 L CNN "Status Comment"
F 18 "100V" H 8400 3860 60  0001 L CNN "Voltage"
F 19 "X7R" H 8400 3770 60  0001 L CNN "TC"
F 20 "±10%" H 8400 3680 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 8400 3590 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 8400 3500 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 8400 3410 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 8400 3320 60  0001 L CNN "Case"
F 25 "Yes" H 8400 3230 60  0001 L CNN "Mounted"
F 26 "No" H 8400 3140 60  0001 L CNN "Socket"
F 27 "Yes" H 8400 3050 60  0001 L CNN "SMD"
F 28 "~~" H 8400 2960 60  0001 L CNN "PressFit"
F 29 "No" H 8400 2870 60  0001 L CNN "Sense"
F 30 "~~" H 8400 2780 60  0001 L CNN "Sense Comment"
F 31 "~~" H 8400 2690 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 8400 2600 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 8400 2510 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 8400 2420 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 8400 2330 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 8400 2240 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 8400 2150 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 8400 2060 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 8400 1970 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 8400 1880 60  0001 L CNN "License"
	1    8400 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 5450 8400 5650
Connection ~ 8400 5550
Wire Wire Line
	8100 5450 8100 5650
Connection ~ 8100 5550
Wire Wire Line
	8100 4950 8100 5150
Wire Wire Line
	8100 5050 8400 5050
Wire Wire Line
	8400 5050 8400 5150
Connection ~ 7800 4650
Connection ~ 8100 5050
$Comp
L +2V5 #PWR095
U 1 1 5996C81F
P 8100 4950
F 0 "#PWR095" H 8100 4800 50  0001 C CNN
F 1 "+2V5" H 8115 5123 50  0000 C CNN
F 2 "" H 8100 4950 50  0001 C CNN
F 3 "" H 8100 4950 50  0001 C CNN
	1    8100 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5950 8100 6150
Wire Wire Line
	8100 6050 8400 6050
Wire Wire Line
	8400 6050 8400 5950
Connection ~ 8100 6050
$Comp
L GND #PWR096
U 1 1 5996C96D
P 8100 6150
F 0 "#PWR096" H 8100 5900 50  0001 C CNN
F 1 "GND" H 8105 5977 50  0000 C CNN
F 2 "" H 8100 6150 50  0001 C CNN
F 3 "" H 8100 6150 50  0001 C CNN
	1    8100 6150
	1    0    0    -1  
$EndComp
Text Notes 8800 6400 0    40   ~ 0
Copyright 2013-2017 twl <twlostow@printf.cc>\n\nThis documentation describes Open Hardware and is licensed under\nthe CERN OHL v. 1.2. You may redistribute and modify this documentation\nunder the terms of the CERN OHL v.1.2. (http://ohwr.org/CERNOHL).\nThis documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY\nAND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2\nfor applicable conditions.\n
Wire Notes Line
	8750 5750 8750 6450
Wire Notes Line
	8750 6450 11150 6450
Wire Notes Line
	11150 6450 11150 5750
Wire Notes Line
	11150 5750 8750 5750
Text Notes 10000 6800 2    150  ~ 0
HDMI DSI Shield
Text Notes 9450 7000 2    100  ~ 0
DDR SDRAM
Text Notes 10800 7650 2    60   ~ 0
2.2a
Text Notes 8050 7500 2    60   ~ 0
DDR SDRAM
$Comp
L CC0603_1UF_50V_10%_X5R C64
U 1 1 59971751
P 3200 6100
F 0 "C64" V 3304 6210 50  0000 L CNN
F 1 "CC0603_1UF_50V_10%_X5R" H 3200 5840 60  0001 L CNN
F 2 "CAPC1608X87N" H 3200 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3200 5660 60  0001 L CNN
F 4 "1uF" V 3395 6210 50  0000 L CNN "~"
F 5 "CC0603_1UF_50V_10%_X5R" H 3200 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3200 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3200 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 3200 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 3200 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3200 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3200 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3200 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 3200 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3200 4670 60  0001 L CNN "PackageDescription"
F 15 "1uF" H 3200 4580 60  0001 L CNN "Val"
F 16 "None" H 3200 4490 60  0001 L CNN "Status"
F 17 "~~" H 3200 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 3200 4310 60  0001 L CNN "Voltage"
F 19 "X5R" H 3200 4220 60  0001 L CNN "TC"
F 20 "±10%" H 3200 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3200 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3200 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_1UF_50V_10%_X5R" H 3200 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3200 3770 60  0001 L CNN "Case"
F 25 "Yes" H 3200 3680 60  0001 L CNN "Mounted"
F 26 "No" H 3200 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 3200 3500 60  0001 L CNN "SMD"
F 28 "~~" H 3200 3410 60  0001 L CNN "PressFit"
F 29 "No" H 3200 3320 60  0001 L CNN "Sense"
F 30 "~~" H 3200 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3200 3140 60  0001 L CNN "ComponentHeight"
F 32 "TDK" H 3200 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "C1608X5R1H105K080" H 3200 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3200 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X5R_TDK_C.pdf" H 3200 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JMW" H 3200 2690 60  0001 L CNN "Author"
F 37 "11/09/15 00:00:00" H 3200 2600 60  0001 L CNN "CreateDate"
F 38 "11/09/15 00:00:00" H 3200 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3200 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3200 2330 60  0001 L CNN "License"
	1    3200 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C67
U 1 1 599729A9
P 3550 6100
F 0 "C67" V 3654 6210 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 3550 5840 60  0001 L CNN
F 2 "CAPC1608X90N" H 3550 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3550 5660 60  0001 L CNN
F 4 "100nF" V 3745 6210 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 3550 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3550 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3550 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 3550 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 3550 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3550 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3550 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3550 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 3550 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3550 4670 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 3550 4580 60  0001 L CNN "Val"
F 16 "None" H 3550 4490 60  0001 L CNN "Status"
F 17 "~~" H 3550 4400 60  0001 L CNN "Status Comment"
F 18 "100V" H 3550 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 3550 4220 60  0001 L CNN "TC"
F 20 "±10%" H 3550 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3550 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3550 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 3550 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3550 3770 60  0001 L CNN "Case"
F 25 "Yes" H 3550 3680 60  0001 L CNN "Mounted"
F 26 "No" H 3550 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 3550 3500 60  0001 L CNN "SMD"
F 28 "~~" H 3550 3410 60  0001 L CNN "PressFit"
F 29 "No" H 3550 3320 60  0001 L CNN "Sense"
F 30 "~~" H 3550 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3550 3140 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 3550 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 3550 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3550 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3550 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 3550 2690 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 3550 2600 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 3550 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3550 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3550 2330 60  0001 L CNN "License"
	1    3550 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C75
U 1 1 59972AF3
P 3950 6100
F 0 "C75" V 4054 6210 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 3950 5840 60  0001 L CNN
F 2 "CAPC1608X90N" H 3950 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3950 5660 60  0001 L CNN
F 4 "100nF" V 4145 6210 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 3950 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 3950 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 3950 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 3950 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 3950 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 3950 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 3950 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 3950 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 3950 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 3950 4670 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 3950 4580 60  0001 L CNN "Val"
F 16 "None" H 3950 4490 60  0001 L CNN "Status"
F 17 "~~" H 3950 4400 60  0001 L CNN "Status Comment"
F 18 "100V" H 3950 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 3950 4220 60  0001 L CNN "TC"
F 20 "±10%" H 3950 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 3950 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 3950 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 3950 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 3950 3770 60  0001 L CNN "Case"
F 25 "Yes" H 3950 3680 60  0001 L CNN "Mounted"
F 26 "No" H 3950 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 3950 3500 60  0001 L CNN "SMD"
F 28 "~~" H 3950 3410 60  0001 L CNN "PressFit"
F 29 "No" H 3950 3320 60  0001 L CNN "Sense"
F 30 "~~" H 3950 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 3950 3140 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 3950 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 3950 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 3950 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 3950 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 3950 2690 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 3950 2600 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 3950 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 3950 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 3950 2330 60  0001 L CNN "License"
	1    3950 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C72
U 1 1 59972B6B
P 4300 6100
F 0 "C72" V 4404 6210 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 4300 5840 60  0001 L CNN
F 2 "CAPC1608X90N" H 4300 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4300 5660 60  0001 L CNN
F 4 "100nF" V 4495 6210 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 4300 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 4300 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 4300 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 4300 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 4300 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4300 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 4300 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 4300 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 4300 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 4300 4670 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 4300 4580 60  0001 L CNN "Val"
F 16 "None" H 4300 4490 60  0001 L CNN "Status"
F 17 "~~" H 4300 4400 60  0001 L CNN "Status Comment"
F 18 "100V" H 4300 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 4300 4220 60  0001 L CNN "TC"
F 20 "±10%" H 4300 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 4300 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4300 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 4300 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4300 3770 60  0001 L CNN "Case"
F 25 "Yes" H 4300 3680 60  0001 L CNN "Mounted"
F 26 "No" H 4300 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 4300 3500 60  0001 L CNN "SMD"
F 28 "~~" H 4300 3410 60  0001 L CNN "PressFit"
F 29 "No" H 4300 3320 60  0001 L CNN "Sense"
F 30 "~~" H 4300 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 4300 3140 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 4300 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 4300 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 4300 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4300 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 4300 2690 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 4300 2600 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 4300 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 4300 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4300 2330 60  0001 L CNN "License"
	1    4300 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C73
U 1 1 59972BE5
P 4650 6100
F 0 "C73" V 4754 6210 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 4650 5840 60  0001 L CNN
F 2 "CAPC1608X90N" H 4650 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4650 5660 60  0001 L CNN
F 4 "100nF" V 4845 6210 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 4650 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 4650 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 4650 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 4650 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 4650 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 4650 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 4650 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 4650 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 4650 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 4650 4670 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 4650 4580 60  0001 L CNN "Val"
F 16 "None" H 4650 4490 60  0001 L CNN "Status"
F 17 "~~" H 4650 4400 60  0001 L CNN "Status Comment"
F 18 "100V" H 4650 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 4650 4220 60  0001 L CNN "TC"
F 20 "±10%" H 4650 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 4650 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 4650 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 4650 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 4650 3770 60  0001 L CNN "Case"
F 25 "Yes" H 4650 3680 60  0001 L CNN "Mounted"
F 26 "No" H 4650 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 4650 3500 60  0001 L CNN "SMD"
F 28 "~~" H 4650 3410 60  0001 L CNN "PressFit"
F 29 "No" H 4650 3320 60  0001 L CNN "Sense"
F 30 "~~" H 4650 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 4650 3140 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 4650 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 4650 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 4650 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 4650 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 4650 2690 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 4650 2600 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 4650 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 4650 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 4650 2330 60  0001 L CNN "License"
	1    4650 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_100NF_100V_10%_X7R C11
U 1 1 59972C5F
P 5000 6100
F 0 "C11" V 5104 6210 50  0000 L CNN
F 1 "CC0603_100NF_100V_10%_X7R" H 5000 5840 60  0001 L CNN
F 2 "CAPC1608X90N" H 5000 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 5000 5660 60  0001 L CNN
F 4 "100nF" V 5195 6210 50  0000 L CNN "~"
F 5 "CC0603_100NF_100V_10%_X7R" H 5000 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5000 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5000 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 5000 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 5000 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5000 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5000 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5000 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X90N" H 5000 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5000 4670 60  0001 L CNN "PackageDescription"
F 15 "100nF" H 5000 4580 60  0001 L CNN "Val"
F 16 "None" H 5000 4490 60  0001 L CNN "Status"
F 17 "~~" H 5000 4400 60  0001 L CNN "Status Comment"
F 18 "100V" H 5000 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 5000 4220 60  0001 L CNN "TC"
F 20 "±10%" H 5000 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5000 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5000 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_100NF_100V_10%_X7R" H 5000 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5000 3770 60  0001 L CNN "Case"
F 25 "Yes" H 5000 3680 60  0001 L CNN "Mounted"
F 26 "No" H 5000 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 5000 3500 60  0001 L CNN "SMD"
F 28 "~~" H 5000 3410 60  0001 L CNN "PressFit"
F 29 "No" H 5000 3320 60  0001 L CNN "Sense"
F 30 "~~" H 5000 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5000 3140 60  0001 L CNN "ComponentHeight"
F 32 "MURATA" H 5000 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "GRM188R72A104KA35D" H 5000 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.9mm" H 5000 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_MURATA_GRM188R72A104KA35D.pdf" H 5000 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5000 2690 60  0001 L CNN "Author"
F 37 "12/11/13 00:00:00" H 5000 2600 60  0001 L CNN "CreateDate"
F 38 "12/11/13 00:00:00" H 5000 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5000 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5000 2330 60  0001 L CNN "License"
	1    5000 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_10NF_50V_10%_X7R C68
U 1 1 5997381F
P 5350 6100
F 0 "C68" V 5454 6210 50  0000 L CNN
F 1 "CC0603_10NF_50V_10%_X7R" H 5350 5840 60  0001 L CNN
F 2 "CAPC1608X87N" H 5350 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 5350 5660 60  0001 L CNN
F 4 "10nF" V 5545 6210 50  0000 L CNN "~"
F 5 "CC0603_10NF_50V_10%_X7R" H 5350 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5350 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5350 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 5350 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 5350 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5350 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5350 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5350 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 5350 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5350 4670 60  0001 L CNN "PackageDescription"
F 15 "10nF" H 5350 4580 60  0001 L CNN "Val"
F 16 "Preferred" H 5350 4490 60  0001 L CNN "Status"
F 17 "~~" H 5350 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 5350 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 5350 4220 60  0001 L CNN "TC"
F 20 "±10%" H 5350 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5350 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5350 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_10NF_50V_10%_X7R" H 5350 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5350 3770 60  0001 L CNN "Case"
F 25 "Yes" H 5350 3680 60  0001 L CNN "Mounted"
F 26 "No" H 5350 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 5350 3500 60  0001 L CNN "SMD"
F 28 "~~" H 5350 3410 60  0001 L CNN "PressFit"
F 29 "No" H 5350 3320 60  0001 L CNN "Sense"
F 30 "~~" H 5350 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5350 3140 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 5350 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "223858615636" H 5350 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 5350 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 5350 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5350 2690 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5350 2600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5350 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5350 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5350 2330 60  0001 L CNN "License"
	1    5350 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_10NF_50V_10%_X7R C69
U 1 1 59973B76
P 5700 6100
F 0 "C69" V 5804 6210 50  0000 L CNN
F 1 "CC0603_10NF_50V_10%_X7R" H 5700 5840 60  0001 L CNN
F 2 "CAPC1608X87N" H 5700 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 5700 5660 60  0001 L CNN
F 4 "10nF" V 5895 6210 50  0000 L CNN "~"
F 5 "CC0603_10NF_50V_10%_X7R" H 5700 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 5700 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 5700 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 5700 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 5700 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 5700 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 5700 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 5700 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 5700 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 5700 4670 60  0001 L CNN "PackageDescription"
F 15 "10nF" H 5700 4580 60  0001 L CNN "Val"
F 16 "Preferred" H 5700 4490 60  0001 L CNN "Status"
F 17 "~~" H 5700 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 5700 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 5700 4220 60  0001 L CNN "TC"
F 20 "±10%" H 5700 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 5700 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 5700 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_10NF_50V_10%_X7R" H 5700 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 5700 3770 60  0001 L CNN "Case"
F 25 "Yes" H 5700 3680 60  0001 L CNN "Mounted"
F 26 "No" H 5700 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 5700 3500 60  0001 L CNN "SMD"
F 28 "~~" H 5700 3410 60  0001 L CNN "PressFit"
F 29 "No" H 5700 3320 60  0001 L CNN "Sense"
F 30 "~~" H 5700 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 5700 3140 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 5700 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "223858615636" H 5700 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 5700 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 5700 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 5700 2690 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 5700 2600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 5700 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 5700 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 5700 2330 60  0001 L CNN "License"
	1    5700 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_10NF_50V_10%_X7R C70
U 1 1 59973BF6
P 6050 6100
F 0 "C70" V 6154 6210 50  0000 L CNN
F 1 "CC0603_10NF_50V_10%_X7R" H 6050 5840 60  0001 L CNN
F 2 "CAPC1608X87N" H 6050 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 6050 5660 60  0001 L CNN
F 4 "10nF" V 6245 6210 50  0000 L CNN "~"
F 5 "CC0603_10NF_50V_10%_X7R" H 6050 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 6050 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 6050 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 6050 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 6050 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 6050 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 6050 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 6050 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 6050 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 6050 4670 60  0001 L CNN "PackageDescription"
F 15 "10nF" H 6050 4580 60  0001 L CNN "Val"
F 16 "Preferred" H 6050 4490 60  0001 L CNN "Status"
F 17 "~~" H 6050 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 6050 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 6050 4220 60  0001 L CNN "TC"
F 20 "±10%" H 6050 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 6050 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 6050 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_10NF_50V_10%_X7R" H 6050 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 6050 3770 60  0001 L CNN "Case"
F 25 "Yes" H 6050 3680 60  0001 L CNN "Mounted"
F 26 "No" H 6050 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 6050 3500 60  0001 L CNN "SMD"
F 28 "~~" H 6050 3410 60  0001 L CNN "PressFit"
F 29 "No" H 6050 3320 60  0001 L CNN "Sense"
F 30 "~~" H 6050 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 6050 3140 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 6050 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "223858615636" H 6050 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 6050 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 6050 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 6050 2690 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 6050 2600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 6050 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 6050 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6050 2330 60  0001 L CNN "License"
	1    6050 6100
	0    1    1    0   
$EndComp
$Comp
L CC0603_10NF_50V_10%_X7R C66
U 1 1 59973C78
P 6400 6100
F 0 "C66" V 6504 6210 50  0000 L CNN
F 1 "CC0603_10NF_50V_10%_X7R" H 6400 5840 60  0001 L CNN
F 2 "CAPC1608X87N" H 6400 5030 60  0001 L CNN
F 3 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 6400 5660 60  0001 L CNN
F 4 "10nF" V 6595 6210 50  0000 L CNN "~"
F 5 "CC0603_10NF_50V_10%_X7R" H 6400 5570 60  0001 L CNN "Part Number"
F 6 "Capacitor - non polarized" H 6400 5480 60  0001 L CNN "Library Ref"
F 7 "SchLib\\Capacitors.SchLib" H 6400 5390 60  0001 L CNN "Library Path"
F 8 "=Value" H 6400 5300 60  0001 L CNN "Comment"
F 9 "Standard" H 6400 5210 60  0001 L CNN "Component Kind"
F 10 "Standard" H 6400 5120 60  0001 L CNN "Component Type"
F 11 "2.0000000000000000e+00" H 6400 4940 60  0001 L CNN "Pin Count"
F 12 "PcbLib\\Capacitors SMD.PcbLib" H 6400 4850 60  0001 L CNN "Footprint Path"
F 13 "CAPC1608X87N" H 6400 4760 60  0001 L CNN "Footprint Ref"
F 14 "~~" H 6400 4670 60  0001 L CNN "PackageDescription"
F 15 "10nF" H 6400 4580 60  0001 L CNN "Val"
F 16 "Preferred" H 6400 4490 60  0001 L CNN "Status"
F 17 "~~" H 6400 4400 60  0001 L CNN "Status Comment"
F 18 "50V" H 6400 4310 60  0001 L CNN "Voltage"
F 19 "X7R" H 6400 4220 60  0001 L CNN "TC"
F 20 "±10%" H 6400 4130 60  0001 L CNN "Tolerance"
F 21 "SMD Multilayer Chip Ceramic Capacitor" H 6400 4040 60  0001 L CNN "Part Description"
F 22 "GENERIC" H 6400 3950 60  0001 L CNN "Manufacturer"
F 23 "CC0603_10NF_50V_10%_X7R" H 6400 3860 60  0001 L CNN "Manufacturer Part Number"
F 24 "0603" H 6400 3770 60  0001 L CNN "Case"
F 25 "Yes" H 6400 3680 60  0001 L CNN "Mounted"
F 26 "No" H 6400 3590 60  0001 L CNN "Socket"
F 27 "Yes" H 6400 3500 60  0001 L CNN "SMD"
F 28 "~~" H 6400 3410 60  0001 L CNN "PressFit"
F 29 "No" H 6400 3320 60  0001 L CNN "Sense"
F 30 "~~" H 6400 3230 60  0001 L CNN "Sense Comment"
F 31 "~~" H 6400 3140 60  0001 L CNN "ComponentHeight"
F 32 "PHYCOMP" H 6400 3050 60  0001 L CNN "Manufacturer1 Example"
F 33 "223858615636" H 6400 2960 60  0001 L CNN "Manufacturer1 Part Number"
F 34 "0.87mm" H 6400 2870 60  0001 L CNN "Manufacturer1 ComponentHeight"
F 35 "\\cern.ch\\dfs\\Applications\\Altium\\Datasheets\\CC0603_X7R_PHYCOMP.pdf" H 6400 2780 60  0001 L CNN "HelpURL"
F 36 "CERN DEM JLC" H 6400 2690 60  0001 L CNN "Author"
F 37 "12/03/07 00:00:00" H 6400 2600 60  0001 L CNN "CreateDate"
F 38 "12/03/07 00:00:00" H 6400 2510 60  0001 L CNN "LatestRevisionDate"
F 39 "Capacitors SMD" H 6400 2420 60  0001 L CNN "Library Name"
F 40 "This work is licensed under the Creative Commons CC-BY-SA 4.0 License. To the extent that circuit schematics that use Licensed Material can be considered to be ‘Adapted Material’, then the copyright holder waives article 3.b of the license with respect to these schematics." H 6400 2330 60  0001 L CNN "License"
	1    6400 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 6100 6400 6000
Wire Wire Line
	6400 6000 3200 6000
Wire Wire Line
	3200 5900 3200 6100
Wire Wire Line
	3550 6000 3550 6100
Connection ~ 3550 6000
Wire Wire Line
	3950 6000 3950 6100
Connection ~ 3950 6000
Wire Wire Line
	4300 6100 4300 6000
Connection ~ 4300 6000
Wire Wire Line
	4650 6100 4650 6000
Connection ~ 4650 6000
Wire Wire Line
	5000 6100 5000 6000
Connection ~ 5000 6000
Wire Wire Line
	5350 6100 5350 6000
Connection ~ 5350 6000
Wire Wire Line
	5700 6100 5700 6000
Connection ~ 5700 6000
Wire Wire Line
	6050 6100 6050 6000
Connection ~ 6050 6000
Wire Wire Line
	3200 6400 3200 6600
Wire Wire Line
	3200 6500 6400 6500
Wire Wire Line
	6400 6500 6400 6400
Wire Wire Line
	3550 6400 3550 6500
Connection ~ 3550 6500
Wire Wire Line
	3950 6400 3950 6500
Connection ~ 3950 6500
Wire Wire Line
	4300 6400 4300 6500
Connection ~ 4300 6500
Wire Wire Line
	4650 6500 4650 6400
Connection ~ 4650 6500
Wire Wire Line
	5000 6400 5000 6500
Connection ~ 5000 6500
Wire Wire Line
	5350 6500 5350 6400
Connection ~ 5350 6500
Wire Wire Line
	5700 6400 5700 6500
Connection ~ 5700 6500
Wire Wire Line
	6050 6500 6050 6400
Connection ~ 6050 6500
$Comp
L +2V5 #PWR097
U 1 1 5997637D
P 3200 5900
F 0 "#PWR097" H 3200 5750 50  0001 C CNN
F 1 "+2V5" H 3215 6073 50  0000 C CNN
F 2 "" H 3200 5900 50  0001 C CNN
F 3 "" H 3200 5900 50  0001 C CNN
	1    3200 5900
	1    0    0    -1  
$EndComp
Connection ~ 3200 6000
$Comp
L GND #PWR098
U 1 1 59976555
P 3200 6600
F 0 "#PWR098" H 3200 6350 50  0001 C CNN
F 1 "GND" H 3205 6427 50  0000 C CNN
F 2 "" H 3200 6600 50  0001 C CNN
F 3 "" H 3200 6600 50  0001 C CNN
	1    3200 6600
	1    0    0    -1  
$EndComp
Connection ~ 3200 6500
$EndSCHEMATC
