EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7400 7500 0    50   ~ 0
Weather station control board
$Comp
L Regulator_Linear:NCP1117-3.3_SOT223 U2
U 1 1 61FAA009
P 1800 2250
F 0 "U2" H 1800 2492 50  0000 C CNN
F 1 "NCP1117-3.3_SOT223" H 1800 2401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1800 2450 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCP1117-D.PDF" H 1900 2000 50  0001 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 900  2400 900 
Wire Wire Line
	1500 900  1250 900 
$Comp
L Regulator_Linear:NCP1117-5.0_SOT223 U1
U 1 1 61FAAF1F
P 1800 900
F 0 "U1" H 1800 1142 50  0000 C CNN
F 1 "NCP1117-5.0_SOT223" H 1800 1051 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1800 1100 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCP1117-D.PDF" H 1900 650 50  0001 C CNN
	1    1800 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 900  2400 1150
Wire Wire Line
	1250 900  1250 1150
Wire Wire Line
	2400 1450 2400 1650
Wire Wire Line
	1250 1450 1250 1650
Wire Wire Line
	1800 1200 1800 1350
$Comp
L power:GND #PWR07
U 1 1 61FB3501
P 2400 1650
F 0 "#PWR07" H 2400 1400 50  0001 C CNN
F 1 "GND" H 2405 1477 50  0000 C CNN
F 2 "" H 2400 1650 50  0001 C CNN
F 3 "" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 900  2550 900 
Wire Wire Line
	2550 900  2550 750 
Connection ~ 2400 900 
Text Label 2550 750  0    50   ~ 0
5V0
$Comp
L power:GND #PWR03
U 1 1 61FB4B17
P 1800 1350
F 0 "#PWR03" H 1800 1100 50  0001 C CNN
F 1 "GND" H 1805 1177 50  0000 C CNN
F 2 "" H 1800 1350 50  0001 C CNN
F 3 "" H 1800 1350 50  0001 C CNN
	1    1800 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 61FB4FD8
P 1250 1650
F 0 "#PWR01" H 1250 1400 50  0001 C CNN
F 1 "GND" H 1255 1477 50  0000 C CNN
F 2 "" H 1250 1650 50  0001 C CNN
F 3 "" H 1250 1650 50  0001 C CNN
	1    1250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2250 2400 2250
Wire Wire Line
	1500 2250 1250 2250
Wire Wire Line
	2400 2250 2400 2500
Wire Wire Line
	1250 2250 1250 2500
Wire Wire Line
	2400 2800 2400 3000
Wire Wire Line
	1250 2800 1250 3000
$Comp
L power:GND #PWR08
U 1 1 61FB6D14
P 2400 3000
F 0 "#PWR08" H 2400 2750 50  0001 C CNN
F 1 "GND" H 2405 2827 50  0000 C CNN
F 2 "" H 2400 3000 50  0001 C CNN
F 3 "" H 2400 3000 50  0001 C CNN
	1    2400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2250 2550 2250
Wire Wire Line
	2550 2250 2550 2100
Connection ~ 2400 2250
Text Label 2550 2100 0    50   ~ 0
3V3
$Comp
L power:GND #PWR04
U 1 1 61FB6D1E
P 1800 2700
F 0 "#PWR04" H 1800 2450 50  0001 C CNN
F 1 "GND" H 1805 2527 50  0000 C CNN
F 2 "" H 1800 2700 50  0001 C CNN
F 3 "" H 1800 2700 50  0001 C CNN
	1    1800 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61FB6D24
P 1250 3000
F 0 "#PWR02" H 1250 2750 50  0001 C CNN
F 1 "GND" H 1255 2827 50  0000 C CNN
F 2 "" H 1250 3000 50  0001 C CNN
F 3 "" H 1250 3000 50  0001 C CNN
	1    1250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2550 1800 2700
Wire Wire Line
	1250 900  1050 900 
Connection ~ 1250 900 
Wire Wire Line
	1250 2250 1050 2250
Connection ~ 1250 2250
Text Label 1050 900  2    50   ~ 0
PIN_12V
Text Label 1050 2250 2    50   ~ 0
PIN_12V
$Comp
L custom_digital:W5500 U4
U 1 1 62228853
P 4750 4150
F 0 "U4" H 5644 4196 50  0000 L CNN
F 1 "W5500" H 5644 4105 50  0000 L CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 3850 5000 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Dev/Arduino/Shields/W5500_datasheet_v1.0.2_1.pdf" H 3850 5000 50  0001 C CNN
	1    4750 4150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 62239810
P 5950 4350
F 0 "R11" V 5743 4350 50  0000 C CNN
F 1 "0" V 5834 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5880 4350 50  0001 C CNN
F 3 "~" H 5950 4350 50  0001 C CNN
	1    5950 4350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 62240891
P 6300 4200
F 0 "R14" V 6093 4200 50  0000 C CNN
F 1 "0" V 6184 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 4200 50  0001 C CNN
F 3 "~" H 6300 4200 50  0001 C CNN
	1    6300 4200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R20
U 1 1 6224415D
P 7550 5350
F 0 "R20" H 7620 5396 50  0000 L CNN
F 1 "49.9" H 7620 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 5350 50  0001 C CNN
F 3 "~" H 7550 5350 50  0001 C CNN
	1    7550 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 622477B4
P 7300 5850
F 0 "C17" H 7415 5896 50  0000 L CNN
F 1 "10nF" H 7415 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7338 5700 50  0001 C CNN
F 3 "~" H 7300 5850 50  0001 C CNN
	1    7300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 62248829
P 7300 6050
F 0 "#PWR020" H 7300 5800 50  0001 C CNN
F 1 "GND" H 7305 5877 50  0000 C CNN
F 2 "" H 7300 6050 50  0001 C CNN
F 3 "" H 7300 6050 50  0001 C CNN
	1    7300 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5600 7300 5700
Wire Wire Line
	7300 6000 7300 6050
$Comp
L Device:R R18
U 1 1 6223CA6C
P 7300 5150
F 0 "R18" H 7370 5196 50  0000 L CNN
F 1 "49.9" H 7370 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 5150 50  0001 C CNN
F 3 "~" H 7300 5150 50  0001 C CNN
	1    7300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5300 7300 5600
Wire Wire Line
	7300 5600 7550 5600
Wire Wire Line
	7550 5600 7550 5500
Connection ~ 7300 5600
$Comp
L Device:R R12
U 1 1 62286D2B
P 5950 4700
F 0 "R12" V 5743 4700 50  0000 C CNN
F 1 "0" V 5834 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5880 4700 50  0001 C CNN
F 3 "~" H 5950 4700 50  0001 C CNN
	1    5950 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 62286D31
P 6300 4550
F 0 "R15" V 6093 4550 50  0000 C CNN
F 1 "0" V 6184 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 4550 50  0001 C CNN
F 3 "~" H 6300 4550 50  0001 C CNN
	1    6300 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 62286D37
P 7050 3550
F 0 "R17" H 7120 3596 50  0000 L CNN
F 1 "49.9" H 7120 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 3550 50  0001 C CNN
F 3 "~" H 7050 3550 50  0001 C CNN
	1    7050 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 62286D43
P 8350 3750
F 0 "#PWR022" H 8350 3500 50  0001 C CNN
F 1 "GND" H 8355 3577 50  0000 C CNN
F 2 "" H 8350 3750 50  0001 C CNN
F 3 "" H 8350 3750 50  0001 C CNN
	1    8350 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 62286D52
P 6800 3750
F 0 "R16" H 6870 3796 50  0000 L CNN
F 1 "49.9" H 6870 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6730 3750 50  0001 C CNN
F 3 "~" H 6800 3750 50  0001 C CNN
	1    6800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4200 6150 4200
Wire Wire Line
	5600 4300 5800 4300
Wire Wire Line
	5600 4600 6150 4600
Wire Wire Line
	5600 4700 5800 4700
Wire Wire Line
	5700 4500 5700 4850
$Comp
L power:GND #PWR017
U 1 1 622F144D
P 5700 4850
F 0 "#PWR017" H 5700 4600 50  0001 C CNN
F 1 "GND" H 5705 4677 50  0000 C CNN
F 2 "" H 5700 4850 50  0001 C CNN
F 3 "" H 5700 4850 50  0001 C CNN
	1    5700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4400 5700 4400
Wire Wire Line
	5700 4400 5700 4000
Wire Wire Line
	5700 4000 5600 4000
$Comp
L power:GND #PWR018
U 1 1 622FC0C7
P 5900 3950
F 0 "#PWR018" H 5900 3700 50  0001 C CNN
F 1 "GND" H 5905 3777 50  0000 C CNN
F 2 "" H 5900 3950 50  0001 C CNN
F 3 "" H 5900 3950 50  0001 C CNN
	1    5900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3900 5900 3950
Wire Wire Line
	5600 3900 5900 3900
Wire Wire Line
	5600 4500 5700 4500
Wire Wire Line
	5700 4000 5700 3700
Wire Wire Line
	5700 3700 5600 3700
Connection ~ 5700 4000
Connection ~ 5700 3700
$Comp
L Device:R R13
U 1 1 6231CCAC
P 6300 3800
F 0 "R13" V 6093 3800 50  0000 C CNN
F 1 "12k4" V 6184 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6230 3800 50  0001 C CNN
F 3 "~" H 6300 3800 50  0001 C CNN
	1    6300 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3800 6150 3800
Wire Wire Line
	6450 3800 6550 3800
Wire Wire Line
	6550 3800 6550 3950
$Comp
L power:GND #PWR019
U 1 1 62329C3D
P 6550 3950
F 0 "#PWR019" H 6550 3700 50  0001 C CNN
F 1 "GND" H 6555 3777 50  0000 C CNN
F 2 "" H 6550 3950 50  0001 C CNN
F 3 "" H 6550 3950 50  0001 C CNN
	1    6550 3950
	1    0    0    -1  
$EndComp
Text Notes 6450 3750 0    50   ~ 0
<1%
$Comp
L custom_passive:RJ45_jack_POE J1
U 1 1 62344D7E
P 9600 4950
F 0 "J1" H 9928 5671 50  0000 L CNN
F 1 "RJ45_jack_POE" H 9928 5580 50  0000 L CNN
F 2 "" H 9600 6450 50  0001 C CNN
F 3 "https://abracon.com/Magnetics/ARJM11.pdf" H 9600 6450 50  0001 C CNN
	1    9600 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 62368E86
P 7800 4750
F 0 "C21" V 7548 4750 50  0000 C CNN
F 1 "6.8nF" V 7639 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 4600 50  0001 C CNN
F 3 "~" H 7800 4750 50  0001 C CNN
	1    7800 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 4350 7300 4350
Wire Wire Line
	6450 4200 7550 4200
Wire Wire Line
	6100 4700 6800 4700
Wire Wire Line
	6800 3900 6800 3950
Wire Wire Line
	7050 3700 7050 3850
Wire Wire Line
	7050 3400 7050 3300
Wire Wire Line
	6800 3600 6800 3300
Connection ~ 6800 3300
Wire Wire Line
	6800 3300 5700 3300
Wire Wire Line
	5700 3300 5700 3700
$Comp
L Device:C C20
U 1 1 62368098
P 7800 4350
F 0 "C20" V 7548 4350 50  0000 C CNN
F 1 "6.8nF" V 7639 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 4200 50  0001 C CNN
F 3 "~" H 7800 4350 50  0001 C CNN
	1    7800 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 4350 8050 4550
Connection ~ 7550 5600
Wire Wire Line
	7550 4200 7550 4350
Wire Wire Line
	7650 4750 7300 4750
Connection ~ 7300 4750
Wire Wire Line
	7300 4750 7300 5000
Wire Wire Line
	7650 4350 7550 4350
Connection ~ 7550 4350
Wire Wire Line
	7550 4350 7550 5200
Wire Wire Line
	7950 4350 8050 4350
Wire Wire Line
	8350 5600 8350 4650
Wire Wire Line
	6800 3950 8000 3950
Connection ~ 6800 3950
Wire Wire Line
	6800 3950 6800 4700
Wire Wire Line
	8200 3850 8200 4050
Wire Wire Line
	7050 3850 7050 4550
$Comp
L Device:R R19
U 1 1 6241508F
P 7500 3300
F 0 "R19" V 7293 3300 50  0000 C CNN
F 1 "10" V 7384 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7430 3300 50  0001 C CNN
F 3 "~" H 7500 3300 50  0001 C CNN
	1    7500 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3450 8350 3300
$Comp
L Device:C C23
U 1 1 62286D3D
P 8350 3600
F 0 "C23" H 8465 3646 50  0000 L CNN
F 1 "22nF" H 8465 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8388 3450 50  0001 C CNN
F 3 "~" H 8350 3600 50  0001 C CNN
	1    8350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3300 8100 3300
Wire Wire Line
	7550 5600 8350 5600
Connection ~ 7050 3300
Wire Wire Line
	7050 3300 7350 3300
Wire Wire Line
	6800 3300 7050 3300
Connection ~ 7050 3850
Wire Wire Line
	7050 3850 8200 3850
Text Notes 9350 5200 0    50   ~ 0
ARJM11C7-114-BA-EW2
Text Notes 5900 5150 0    31   ~ 0
See http://wizwiki.net/wiki/lib/exe/fetch.php/\nproducts:w5500:w5500_sch_v110_use_mag_.png?cache=
Text Notes 10000 4800 0    47   ~ 0
VC2 is POE on\nJ4/5 (VC2+) and\nJ7/8 (VC2-)
Text Label 7300 2250 2    47   ~ 0
PIN_12V_POE
NoConn ~ 9250 4350
NoConn ~ 9250 4850
$Comp
L Device:Jumper JP5
U 1 1 624A0154
P 10050 6100
F 0 "JP5" H 10050 6364 50  0000 C CNN
F 1 "Jumper" H 10050 6273 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 10050 6100 50  0001 C CNN
F 3 "~" H 10050 6100 50  0001 C CNN
	1    10050 6100
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper JP4
U 1 1 624A141E
P 10050 5900
F 0 "JP4" H 10050 6164 50  0000 C CNN
F 1 "Jumper" H 10050 6073 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 10050 5900 50  0001 C CNN
F 3 "~" H 10050 5900 50  0001 C CNN
	1    10050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 5900 9650 5900
Wire Wire Line
	9650 5900 9650 6100
Wire Wire Line
	9750 6100 9650 6100
Connection ~ 9650 6100
Wire Wire Line
	10350 6100 10450 6100
Wire Wire Line
	10350 5900 10450 5900
Text Label 10450 6100 0    47   ~ 0
PIN_12V_POE
Text Label 10450 5900 0    47   ~ 0
PIN_12V_JACK
Text Label 8950 6100 2    47   ~ 0
PIN_12V
Wire Wire Line
	5300 5050 5300 5150
$Comp
L power:GND #PWR016
U 1 1 624BC8EA
P 5300 5150
F 0 "#PWR016" H 5300 4900 50  0001 C CNN
F 1 "GND" H 5305 4977 50  0000 C CNN
F 2 "" H 5300 5150 50  0001 C CNN
F 3 "" H 5300 5150 50  0001 C CNN
	1    5300 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 624BD5C9
P 4250 5450
F 0 "R10" V 4043 5450 50  0000 C CNN
F 1 "10k" V 4134 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4180 5450 50  0001 C CNN
F 3 "~" H 4250 5450 50  0001 C CNN
	1    4250 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 624BEBAD
P 4000 5700
F 0 "R9" V 3793 5700 50  0000 C CNN
F 1 "10k" V 3884 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 5700 50  0001 C CNN
F 3 "~" H 4000 5700 50  0001 C CNN
	1    4000 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 624C267A
P 3750 5950
F 0 "R8" V 3543 5950 50  0000 C CNN
F 1 "10k" V 3634 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3680 5950 50  0001 C CNN
F 3 "~" H 3750 5950 50  0001 C CNN
	1    3750 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 5950 5000 5050
Wire Wire Line
	3850 5700 3500 5700
Wire Wire Line
	4100 5450 3500 5450
Connection ~ 3500 5450
Text Label 3500 5250 1    31   ~ 0
3V3
Wire Wire Line
	3600 5950 3500 5950
Text Label 2350 5000 2    31   ~ 0
INT_W5500
Text Label 2350 5100 2    31   ~ 0
RST_W5500
$Comp
L power:GND #PWR011
U 1 1 6257B66D
P 3850 1400
F 0 "#PWR011" H 3850 1150 50  0001 C CNN
F 1 "GND" H 3855 1227 50  0000 C CNN
F 2 "" H 3850 1400 50  0001 C CNN
F 3 "" H 3850 1400 50  0001 C CNN
	1    3850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 900  4650 1000
Text Label 3250 900  2    50   ~ 0
3V3
Wire Wire Line
	4400 900  4650 900 
Wire Wire Line
	3400 900  3250 900 
Text Label 7600 900  0    47   ~ 0
3V3_ANA
Connection ~ 5700 3300
Connection ~ 5700 3150
Wire Wire Line
	5700 3150 5700 3100
Connection ~ 5100 3150
Wire Wire Line
	5700 3150 5700 3300
Wire Wire Line
	5100 3150 5700 3150
Connection ~ 4900 3150
Wire Wire Line
	5100 3150 5100 3250
Wire Wire Line
	4900 3150 5100 3150
Wire Wire Line
	4900 3150 4900 3250
Wire Wire Line
	4500 3150 4900 3150
Wire Wire Line
	4500 3250 4500 3150
Text Label 5700 3100 1    50   ~ 0
3V3_ANA
$Comp
L power:GND #PWR010
U 1 1 625EC1CC
P 3750 3250
F 0 "#PWR010" H 3750 3000 50  0001 C CNN
F 1 "GND" H 3755 3077 50  0000 C CNN
F 2 "" H 3750 3250 50  0001 C CNN
F 3 "" H 3750 3250 50  0001 C CNN
	1    3750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3200 4300 3200
Wire Wire Line
	4700 3200 4700 3250
Wire Wire Line
	4700 3200 5000 3200
Wire Wire Line
	5000 3200 5000 3250
Connection ~ 4700 3200
Wire Wire Line
	5000 3200 5200 3200
Wire Wire Line
	5200 3200 5200 3250
Connection ~ 5000 3200
Wire Wire Line
	3750 3250 3750 3200
Wire Wire Line
	3750 3200 3850 3200
Connection ~ 3850 3200
Wire Wire Line
	3850 4000 3900 4000
Wire Wire Line
	3850 3200 3850 4000
Wire Wire Line
	3900 3900 3750 3900
Text Label 3750 3900 2    47   ~ 0
3V3
Wire Wire Line
	8000 4250 8000 3950
Wire Wire Line
	8100 3300 8100 4150
Wire Wire Line
	8900 4450 9250 4450
Wire Wire Line
	8050 4550 9250 4550
Wire Wire Line
	8350 4650 9250 4650
Wire Wire Line
	7950 4750 9250 4750
Wire Wire Line
	9250 3900 9200 3900
Wire Wire Line
	9250 3700 9200 3700
Wire Wire Line
	9200 3700 9200 3900
Wire Wire Line
	9250 3600 9200 3600
Text Label 9200 3200 1    31   ~ 0
LINK_LED
Text Label 9050 3200 1    31   ~ 0
ACT_LED
$Comp
L Device:R R22
U 1 1 626F92F6
P 9200 3400
F 0 "R22" H 9270 3446 50  0000 L CNN
F 1 "330" H 9270 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9130 3400 50  0001 C CNN
F 3 "~" H 9200 3400 50  0001 C CNN
	1    9200 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 626FA91B
P 9050 3600
F 0 "R21" H 8980 3554 50  0000 R CNN
F 1 "330" H 8980 3645 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8980 3600 50  0001 C CNN
F 3 "~" H 9050 3600 50  0001 C CNN
	1    9050 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 3550 9200 3600
Wire Wire Line
	9050 3200 9050 3450
Wire Wire Line
	9200 3250 9200 3200
Wire Wire Line
	9050 3750 9050 3800
Wire Wire Line
	9050 3800 9250 3800
Text Label 3750 3600 2    31   ~ 0
LINK_LED
Text Label 3750 3800 2    31   ~ 0
ACT_LED
Wire Wire Line
	3750 3600 3900 3600
Wire Wire Line
	3750 3800 3900 3800
Text Label 3100 4600 2    31   ~ 0
SCLK
Text Label 3100 4700 2    31   ~ 0
MISO
Text Label 3100 4800 2    31   ~ 0
MOSI
Text Label 3100 4500 2    31   ~ 0
CS
$Comp
L Device:C C4
U 1 1 62814E31
P 2100 4300
F 0 "C4" V 1848 4300 50  0000 C CNN
F 1 "18pF" V 1939 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 4150 50  0001 C CNN
F 3 "~" H 2100 4300 50  0001 C CNN
	1    2100 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 62814E37
P 2100 3800
F 0 "C3" V 1848 3800 50  0000 C CNN
F 1 "18pF" V 1939 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 3650 50  0001 C CNN
F 3 "~" H 2100 3800 50  0001 C CNN
	1    2100 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 3800 2450 3800
Wire Wire Line
	2250 4300 2450 4300
Wire Wire Line
	2450 3800 2450 3900
Connection ~ 2450 3800
Wire Wire Line
	2450 3800 2700 3800
Wire Wire Line
	2450 4200 2450 4300
$Comp
L Device:R R3
U 1 1 628B3E95
P 2700 4050
F 0 "R3" H 2630 4004 50  0000 R CNN
F 1 "1M" H 2630 4095 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2630 4050 50  0001 C CNN
F 3 "~" H 2700 4050 50  0001 C CNN
	1    2700 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 628D5369
P 2900 4300
F 0 "R5" V 3107 4300 50  0000 C CNN
F 1 "0" V 3016 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 4300 50  0001 C CNN
F 3 "~" H 2900 4300 50  0001 C CNN
	1    2900 4300
	0    -1   -1   0   
$EndComp
$Sheet
S 9450 750  1400 950 
U 628DF4B1
F0 "MCU" 31
F1 "MCU.sch" 31
$EndSheet
Wire Wire Line
	1950 3800 1850 3800
Wire Wire Line
	1950 4300 1850 4300
Wire Wire Line
	2450 4300 2700 4300
Connection ~ 2450 4300
Wire Wire Line
	2700 4200 2700 4300
Connection ~ 2700 4300
Wire Wire Line
	2700 4300 2750 4300
Wire Wire Line
	2700 3900 2700 3800
Connection ~ 2700 3800
Wire Wire Line
	3050 4300 3150 4300
Wire Wire Line
	3150 4300 3150 4200
Wire Wire Line
	3150 4200 3900 4200
Wire Wire Line
	3150 3800 3150 4100
Wire Wire Line
	3150 4100 3900 4100
Wire Wire Line
	2700 3800 3150 3800
Wire Wire Line
	1850 3800 1850 4300
Wire Wire Line
	1850 4300 1850 4450
Connection ~ 1850 4300
$Comp
L power:GND #PWR05
U 1 1 6296FD4F
P 1850 4450
F 0 "#PWR05" H 1850 4200 50  0001 C CNN
F 1 "GND" H 1855 4277 50  0000 C CNN
F 2 "" H 1850 4450 50  0001 C CNN
F 3 "" H 1850 4450 50  0001 C CNN
	1    1850 4450
	1    0    0    -1  
$EndComp
Text Notes 2450 3750 0    31   ~ 0
25 MHz\nECS-250-18-5PX-F-TR (50ppm)\n
NoConn ~ 3900 3700
NoConn ~ 4200 3250
Wire Wire Line
	4300 3250 4300 3200
Connection ~ 4300 3200
Wire Wire Line
	4300 3200 4700 3200
$Comp
L Device:C C9
U 1 1 6298E99D
P 4050 2950
F 0 "C9" V 3798 2950 50  0000 C CNN
F 1 "10nF" V 3889 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4088 2800 50  0001 C CNN
F 3 "~" H 4050 2950 50  0001 C CNN
	1    4050 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2950 4400 3250
$Comp
L Device:C C10
U 1 1 629B0B51
P 4350 2700
F 0 "C10" V 4098 2700 50  0000 C CNN
F 1 "4.7uF" V 4189 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 2550 50  0001 C CNN
F 3 "~" H 4350 2700 50  0001 C CNN
	1    4350 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 2950 3850 2950
Wire Wire Line
	4200 2950 4400 2950
Wire Wire Line
	4200 2700 3850 2700
Wire Wire Line
	3850 2700 3850 2950
Connection ~ 3850 2950
Wire Wire Line
	3850 2950 3850 3200
Wire Wire Line
	4500 2700 4600 2700
Wire Wire Line
	4600 2700 4600 3250
NoConn ~ 4800 3250
$Comp
L Device:Jumper JP2
U 1 1 622D94C3
P 4400 6350
F 0 "JP2" V 4354 6477 50  0000 L CNN
F 1 "Jumper" V 4445 6477 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4400 6350 50  0001 C CNN
F 3 "~" H 4400 6350 50  0001 C CNN
	1    4400 6350
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 622E67A0
P 3900 6350
F 0 "JP1" V 3854 6477 50  0000 L CNN
F 1 "Jumper" V 3945 6477 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3900 6350 50  0001 C CNN
F 3 "~" H 3900 6350 50  0001 C CNN
	1    3900 6350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 623087E5
P 4400 6650
F 0 "#PWR013" H 4400 6400 50  0001 C CNN
F 1 "GND" H 4405 6477 50  0000 C CNN
F 2 "" H 4400 6650 50  0001 C CNN
F 3 "" H 4400 6650 50  0001 C CNN
	1    4400 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6231EE9C
P 3900 6650
F 0 "#PWR012" H 3900 6400 50  0001 C CNN
F 1 "GND" H 3905 6477 50  0000 C CNN
F 2 "" H 3900 6650 50  0001 C CNN
F 3 "" H 3900 6650 50  0001 C CNN
	1    3900 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 6233797C
P 4900 6350
F 0 "JP3" V 4854 6477 50  0000 L CNN
F 1 "Jumper" V 4945 6477 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4900 6350 50  0001 C CNN
F 3 "~" H 4900 6350 50  0001 C CNN
	1    4900 6350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 62337982
P 4900 6650
F 0 "#PWR015" H 4900 6400 50  0001 C CNN
F 1 "GND" H 4905 6477 50  0000 C CNN
F 2 "" H 4900 6650 50  0001 C CNN
F 3 "" H 4900 6650 50  0001 C CNN
	1    4900 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5950 4400 5950
Wire Wire Line
	3900 6050 3900 5950
Connection ~ 3900 5950
Wire Wire Line
	4150 5700 4900 5700
Wire Wire Line
	4400 5450 4800 5450
Wire Wire Line
	4400 5950 4400 5450
Connection ~ 4400 5450
Wire Wire Line
	7300 4350 7300 4750
Wire Wire Line
	5800 4300 5800 4350
Wire Wire Line
	6150 4600 6150 4550
Wire Wire Line
	6450 4550 7050 4550
Wire Wire Line
	3900 4700 3850 4700
Wire Wire Line
	3850 4700 3850 4900
Wire Wire Line
	3900 4600 3800 4600
Wire Wire Line
	3800 4600 3800 4800
Wire Wire Line
	3900 4500 3750 4500
Wire Wire Line
	3750 4500 3750 4700
Wire Wire Line
	3900 4400 3700 4400
Wire Wire Line
	3700 4400 3700 4600
$Comp
L Device:R R7
U 1 1 624C622B
P 3300 4500
F 0 "R7" V 3507 4500 50  0000 C CNN
F 1 "0" V 3416 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 4500 50  0001 C CNN
F 3 "~" H 3300 4500 50  0001 C CNN
	1    3300 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 4500 3650 4500
Wire Wire Line
	3650 4500 3650 4300
Wire Wire Line
	3650 4300 3900 4300
Wire Wire Line
	3150 4500 3100 4500
Wire Wire Line
	3100 4600 3700 4600
Wire Wire Line
	3100 4700 3750 4700
Wire Wire Line
	3100 4800 3800 4800
Connection ~ 4900 5700
Wire Wire Line
	4900 5700 4900 5050
Wire Wire Line
	4900 5700 4900 6050
Connection ~ 4400 5950
Wire Wire Line
	4400 5950 5000 5950
Wire Wire Line
	4800 5450 4800 5050
Wire Wire Line
	4400 6050 4400 5950
Wire Wire Line
	3500 5450 3500 5700
Connection ~ 3500 5700
Wire Wire Line
	3500 5700 3500 5950
Wire Wire Line
	3500 5250 3500 5450
Wire Wire Line
	3850 4900 3300 4900
Wire Wire Line
	3300 4900 3300 5000
$Comp
L Device:R R4
U 1 1 6290DB48
P 2700 4750
F 0 "R4" H 2630 4704 50  0000 R CNN
F 1 "DNF" H 2630 4795 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2630 4750 50  0001 C CNN
F 3 "~" H 2700 4750 50  0001 C CNN
	1    2700 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 5000 2700 4900
Wire Wire Line
	4200 5050 4200 5100
Wire Wire Line
	4200 5100 2550 5100
Wire Wire Line
	2550 5100 2350 5100
Connection ~ 2550 5100
$Comp
L Switch:SW_Push SW1
U 1 1 629D8568
P 2550 5400
F 0 "SW1" V 2596 5352 50  0000 R CNN
F 1 "SW_Push" V 2505 5352 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2550 5600 50  0001 C CNN
F 3 "~" H 2550 5600 50  0001 C CNN
	1    2550 5400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 629D99A8
P 2550 5600
F 0 "#PWR09" H 2550 5350 50  0001 C CNN
F 1 "GND" H 2555 5427 50  0000 C CNN
F 2 "" H 2550 5600 50  0001 C CNN
F 3 "" H 2550 5600 50  0001 C CNN
	1    2550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5200 2550 5100
Wire Wire Line
	2550 4550 2550 4500
Text Label 2550 4500 1    50   ~ 0
3V3
$Comp
L Power_Supervisor:CAT811STBI-GT3 U3
U 1 1 62A0655F
P 2000 6850
F 0 "U3" H 2444 6896 50  0000 L CNN
F 1 "CAT811STBI-GT3" H 2444 6805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 2100 6550 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/CAT811-D.PDF" H 1650 6150 50  0001 C CNN
	1    2000 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6850 2450 6850
Wire Wire Line
	2450 6850 2450 7050
Wire Wire Line
	2450 7050 2600 7050
Text Label 3200 7050 0    50   ~ 0
RST_W5500
Wire Wire Line
	2000 7150 2000 7350
$Comp
L power:GND #PWR06
U 1 1 62A25690
P 2000 7350
F 0 "#PWR06" H 2000 7100 50  0001 C CNN
F 1 "GND" H 2005 7177 50  0000 C CNN
F 2 "" H 2000 7350 50  0001 C CNN
F 3 "" H 2000 7350 50  0001 C CNN
	1    2000 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 62A25CFE
P 2400 7350
F 0 "R2" V 2193 7350 50  0000 C CNN
F 1 "100k" V 2284 7350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2330 7350 50  0001 C CNN
F 3 "~" H 2400 7350 50  0001 C CNN
	1    2400 7350
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 7350 2000 7350
Connection ~ 2000 7350
Wire Wire Line
	2550 7350 2600 7350
Wire Wire Line
	2600 7350 2600 7050
Connection ~ 2600 7050
$Comp
L Device:R R6
U 1 1 62A71746
P 2950 7050
F 0 "R6" V 2743 7050 50  0000 C CNN
F 1 "4.7k" V 2834 7050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2880 7050 50  0001 C CNN
F 3 "~" H 2950 7050 50  0001 C CNN
	1    2950 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 7050 2800 7050
Wire Wire Line
	3100 7050 3200 7050
Text Notes 2800 7350 0    50   ~ 0
W5500 RSTn internal\npullup > 62k
Wire Wire Line
	2000 6550 2000 6450
Text Label 2000 6450 1    50   ~ 0
3V3
Text Label 900  6850 2    50   ~ 0
RST
$Comp
L Device:R R1
U 1 1 62ADEE51
P 1250 6850
F 0 "R1" V 1457 6850 50  0000 C CNN
F 1 "0" V 1366 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1180 6850 50  0001 C CNN
F 3 "~" H 1250 6850 50  0001 C CNN
	1    1250 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 6850 1400 6850
Wire Wire Line
	1100 6850 900  6850
Connection ~ 2700 5000
Wire Wire Line
	2700 5000 2350 5000
Wire Wire Line
	2700 5000 3300 5000
Wire Wire Line
	2550 4550 2700 4550
Wire Wire Line
	2700 4550 2700 4600
$Comp
L Device:Crystal Y1
U 1 1 62814E29
P 2450 4050
F 0 "Y1" V 2404 4181 50  0000 L CNN
F 1 "25MHz" V 2495 4181 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_HC49-SD_HandSoldering" H 2450 4050 50  0001 C CNN
F 3 "~" H 2450 4050 50  0001 C CNN
	1    2450 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Ferrite_Bead FB1
U 1 1 6245E229
P 4250 900
F 0 "FB1" V 4524 900 50  0000 C CNN
F 1 "BLM21" V 4433 900 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 4180 900 50  0001 C CNN
F 3 "~" H 4250 900 50  0001 C CNN
	1    4250 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 2250 8900 2250
$Comp
L Device:Ferrite_Bead FB2
U 1 1 624D9824
P 8450 2250
F 0 "FB2" H 8587 2296 50  0000 L CNN
F 1 "BLM21" H 8587 2205 50  0000 L CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 8380 2250 50  0001 C CNN
F 3 "~" H 8450 2250 50  0001 C CNN
	1    8450 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8750 4950 9250 4950
Wire Wire Line
	9200 3900 9200 5200
Connection ~ 9200 3900
$Comp
L power:GND #PWR023
U 1 1 62537268
P 9200 5200
F 0 "#PWR023" H 9200 4950 50  0001 C CNN
F 1 "GND" H 9205 5027 50  0000 C CNN
F 2 "" H 9200 5200 50  0001 C CNN
F 3 "" H 9200 5200 50  0001 C CNN
	1    9200 5200
	1    0    0    -1  
$EndComp
Connection ~ 8100 3300
Wire Wire Line
	8100 3300 8350 3300
Wire Wire Line
	8200 4050 9250 4050
Wire Wire Line
	8100 4150 9250 4150
Wire Wire Line
	8000 4250 9250 4250
Wire Wire Line
	8750 4950 8750 2850
Wire Wire Line
	8900 2250 8900 4450
$Comp
L Device:Ferrite_Bead FB3
U 1 1 6262E593
P 8450 2850
F 0 "FB3" H 8587 2896 50  0000 L CNN
F 1 "BLM21" H 8587 2805 50  0000 L CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 8380 2850 50  0001 C CNN
F 3 "~" H 8450 2850 50  0001 C CNN
	1    8450 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 2850 8750 2850
Wire Wire Line
	8000 2250 8300 2250
$Comp
L power:GND #PWR021
U 1 1 626797AB
P 8000 2950
F 0 "#PWR021" H 8000 2700 50  0001 C CNN
F 1 "GND" H 8005 2777 50  0000 C CNN
F 2 "" H 8000 2950 50  0001 C CNN
F 3 "" H 8000 2950 50  0001 C CNN
	1    8000 2950
	1    0    0    -1  
$EndComp
Connection ~ 8000 2250
Wire Wire Line
	8000 2850 8000 2950
Connection ~ 8000 2850
$Comp
L Connector:TestPoint TP2
U 1 1 62BD0C2D
P 8000 2150
F 0 "TP2" H 8058 2268 50  0000 L CNN
F 1 "TestPoint" H 8058 2177 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 8200 2150 50  0001 C CNN
F 3 "~" H 8200 2150 50  0001 C CNN
	1    8000 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 62BD24C9
P 7300 2850
F 0 "TP1" V 7495 2922 50  0000 C CNN
F 1 "TestPoint" V 7404 2922 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 7500 2850 50  0001 C CNN
F 3 "~" H 7500 2850 50  0001 C CNN
	1    7300 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 2850 8000 2850
Wire Wire Line
	8000 2250 8000 2150
$Comp
L Device:C C8
U 1 1 62C14474
P 3850 1150
F 0 "C8" H 3735 1104 50  0000 R CNN
F 1 "100nF" H 3735 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3888 1000 50  0001 C CNN
F 3 "~" H 3850 1150 50  0001 C CNN
	1    3850 1150
	-1   0    0    1   
$EndComp
Connection ~ 3400 900 
Wire Wire Line
	3400 900  3850 900 
Connection ~ 3850 900 
Wire Wire Line
	3850 900  4100 900 
Wire Wire Line
	3400 1300 3400 1350
Wire Wire Line
	3850 1350 3850 1400
Wire Wire Line
	3850 1350 3850 1300
Wire Wire Line
	3400 1350 3850 1350
Wire Wire Line
	5100 900  5100 1000
Wire Wire Line
	5550 900  5550 1000
Wire Wire Line
	6000 900  6000 1000
Connection ~ 5550 900 
Wire Wire Line
	5550 900  6000 900 
Connection ~ 6000 900 
Wire Wire Line
	5100 900  5550 900 
Wire Wire Line
	4650 900  5100 900 
Connection ~ 4650 900 
Connection ~ 5100 900 
Wire Wire Line
	6450 900  6450 1000
Wire Wire Line
	6900 900  6900 1000
$Comp
L power:GND #PWR014
U 1 1 62E07730
P 4650 1400
F 0 "#PWR014" H 4650 1150 50  0001 C CNN
F 1 "GND" H 4655 1227 50  0000 C CNN
F 2 "" H 4650 1400 50  0001 C CNN
F 3 "" H 4650 1400 50  0001 C CNN
	1    4650 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 900  6450 900 
Connection ~ 6450 900 
Connection ~ 6900 900 
$Comp
L Device:C C11
U 1 1 62E6EE45
P 4650 1150
F 0 "C11" H 4535 1104 50  0000 R CNN
F 1 "100nF" H 4535 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 1000 50  0001 C CNN
F 3 "~" H 4650 1150 50  0001 C CNN
	1    4650 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3400 900  3400 1000
Wire Wire Line
	3850 900  3850 1000
Wire Wire Line
	4650 1300 4650 1350
Wire Wire Line
	4650 1350 6900 1350
$Comp
L Device:C C12
U 1 1 62F0B102
P 5100 1150
F 0 "C12" H 4985 1104 50  0000 R CNN
F 1 "100nF" H 4985 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5138 1000 50  0001 C CNN
F 3 "~" H 5100 1150 50  0001 C CNN
	1    5100 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 1300 5100 1350
$Comp
L Device:C C13
U 1 1 62F1BE09
P 5550 1150
F 0 "C13" H 5435 1104 50  0000 R CNN
F 1 "100nF" H 5435 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5588 1000 50  0001 C CNN
F 3 "~" H 5550 1150 50  0001 C CNN
	1    5550 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 1300 5550 1350
$Comp
L Device:C C14
U 1 1 62F3E323
P 6000 1150
F 0 "C14" H 5885 1104 50  0000 R CNN
F 1 "100nF" H 5885 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 1000 50  0001 C CNN
F 3 "~" H 6000 1150 50  0001 C CNN
	1    6000 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 1300 6000 1350
$Comp
L Device:C C15
U 1 1 62F4F2EE
P 6450 1150
F 0 "C15" H 6335 1104 50  0000 R CNN
F 1 "100nF" H 6335 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 1000 50  0001 C CNN
F 3 "~" H 6450 1150 50  0001 C CNN
	1    6450 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 1300 6450 1350
$Comp
L Device:C C16
U 1 1 62F604B1
P 6900 1150
F 0 "C16" H 6785 1104 50  0000 R CNN
F 1 "100nF" H 6785 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6938 1000 50  0001 C CNN
F 3 "~" H 6900 1150 50  0001 C CNN
	1    6900 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 1300 6900 1350
Wire Wire Line
	7400 1300 7400 1350
Wire Wire Line
	6450 900  6900 900 
Wire Wire Line
	6900 900  7400 900 
Wire Wire Line
	7400 900  7400 1000
Connection ~ 7400 900 
Wire Wire Line
	7400 900  7600 900 
Wire Wire Line
	6900 1350 7400 1350
Connection ~ 6900 1350
Wire Wire Line
	4650 1350 4650 1400
Connection ~ 4650 1350
Connection ~ 3850 1350
$Comp
L Device:CP C22
U 1 1 6313C837
P 8000 2550
F 0 "C22" H 8118 2596 50  0000 L CNN
F 1 "33uF" H 8118 2505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 8038 2400 50  0001 C CNN
F 3 "~" H 8000 2550 50  0001 C CNN
	1    8000 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2250 8000 2400
Wire Wire Line
	8000 2700 8000 2850
$Comp
L Device:C C19
U 1 1 62415D4C
P 7700 2550
F 0 "C19" H 7585 2504 50  0000 R CNN
F 1 "100nF" H 7585 2595 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7738 2400 50  0001 C CNN
F 3 "~" H 7700 2550 50  0001 C CNN
	1    7700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2250 7700 2400
Wire Wire Line
	7700 2250 8000 2250
Wire Wire Line
	7700 2850 7700 2700
Wire Wire Line
	7700 2850 8000 2850
Wire Wire Line
	7700 2850 7300 2850
Connection ~ 7700 2850
Wire Wire Line
	7700 2250 7300 2250
Connection ~ 7700 2250
$Comp
L Device:C C7
U 1 1 624834EF
P 3400 1150
F 0 "C7" H 3285 1104 50  0000 R CNN
F 1 "10uF" H 3285 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3438 1000 50  0001 C CNN
F 3 "~" H 3400 1150 50  0001 C CNN
	1    3400 1150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C18
U 1 1 624A7823
P 7400 1150
F 0 "C18" H 7285 1104 50  0000 R CNN
F 1 "10uF" H 7285 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7438 1000 50  0001 C CNN
F 3 "~" H 7400 1150 50  0001 C CNN
	1    7400 1150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 624DF5CE
P 2400 1300
F 0 "C5" H 2285 1254 50  0000 R CNN
F 1 "10uF" H 2285 1345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 1150 50  0001 C CNN
F 3 "~" H 2400 1300 50  0001 C CNN
	1    2400 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 624F17E3
P 1250 1300
F 0 "C1" H 1135 1254 50  0000 R CNN
F 1 "10uF" H 1135 1345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 1150 50  0001 C CNN
F 3 "~" H 1250 1300 50  0001 C CNN
	1    1250 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 62527C37
P 1250 2650
F 0 "C2" H 1135 2604 50  0000 R CNN
F 1 "10uF" H 1135 2695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 2500 50  0001 C CNN
F 3 "~" H 1250 2650 50  0001 C CNN
	1    1250 2650
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 62539C77
P 2400 2650
F 0 "C6" H 2285 2604 50  0000 R CNN
F 1 "10uF" H 2285 2695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 2500 50  0001 C CNN
F 3 "~" H 2400 2650 50  0001 C CNN
	1    2400 2650
	-1   0    0    1   
$EndComp
$Comp
L Connector:Barrel_Jack_MountingPin J2
U 1 1 6255071B
P 10200 2450
F 0 "J2" H 9970 2408 50  0000 R CNN
F 1 "Barrel_Jack" H 9970 2499 50  0000 R CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 10250 2410 50  0001 C CNN
F 3 "~" H 10250 2410 50  0001 C CNN
	1    10200 2450
	-1   0    0    1   
$EndComp
Text Label 9700 2550 2    47   ~ 0
PIN_12V_JACK
Wire Wire Line
	9700 2550 9900 2550
Wire Wire Line
	9900 2350 9850 2350
Wire Wire Line
	9850 2350 9850 2700
$Comp
L power:GND #PWR024
U 1 1 6259D7E2
P 9850 2700
F 0 "#PWR024" H 9850 2450 50  0001 C CNN
F 1 "GND" H 9855 2527 50  0000 C CNN
F 2 "" H 9850 2700 50  0001 C CNN
F 3 "" H 9850 2700 50  0001 C CNN
	1    9850 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 62437589
P 9250 6100
F 0 "D1" H 9250 6317 50  0000 C CNN
F 1 "D" H 9250 6226 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 9250 6100 50  0001 C CNN
F 3 "~" H 9250 6100 50  0001 C CNN
	1    9250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6100 9650 6100
Wire Wire Line
	9100 6100 8950 6100
$EndSCHEMATC
