EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1400 4350 2    50   ~ 0
AREF
Wire Wire Line
	1550 4350 1400 4350
Text Label 1350 3400 1    50   ~ 0
5V0
Connection ~ 1850 3500
Wire Wire Line
	2550 3500 2750 3500
Connection ~ 2550 3500
Wire Wire Line
	2550 3950 2550 3500
Wire Wire Line
	2250 3950 2550 3950
Wire Wire Line
	2250 4050 2250 3950
Wire Wire Line
	2500 3500 2550 3500
Connection ~ 2150 3500
Wire Wire Line
	2150 3500 2200 3500
$Comp
L power:GND #PWR029
U 1 1 62907E4F
P 2750 3900
F 0 "#PWR029" H 2750 3650 50  0001 C CNN
F 1 "GND" H 2755 3727 50  0000 C CNN
F 2 "" H 2750 3900 50  0001 C CNN
F 3 "" H 2750 3900 50  0001 C CNN
	1    2750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3500 2750 3600
Wire Wire Line
	2150 3500 2150 4050
Wire Wire Line
	1850 3500 2150 3500
Wire Wire Line
	1850 3550 1850 3500
$Comp
L power:GND #PWR026
U 1 1 62907E59
P 1850 3900
F 0 "#PWR026" H 1850 3650 50  0001 C CNN
F 1 "GND" H 1855 3727 50  0000 C CNN
F 2 "" H 1850 3900 50  0001 C CNN
F 3 "" H 1850 3900 50  0001 C CNN
	1    1850 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 62907E5F
P 1850 3700
F 0 "C25" H 1735 3654 50  0000 R CNN
F 1 "100nF" H 1735 3745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 3550 50  0001 C CNN
F 3 "~" H 1850 3700 50  0001 C CNN
	1    1850 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 62907E65
P 2750 3750
F 0 "C26" V 2498 3750 50  0000 C CNN
F 1 "100nF" V 2589 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2788 3600 50  0001 C CNN
F 3 "~" H 2750 3750 50  0001 C CNN
	1    2750 3750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR027
U 1 1 62907E71
P 2150 7050
F 0 "#PWR027" H 2150 6800 50  0001 C CNN
F 1 "GND" H 2155 6877 50  0000 C CNN
F 2 "" H 2150 7050 50  0001 C CNN
F 3 "" H 2150 7050 50  0001 C CNN
	1    2150 7050
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATmega328-PU U5
U 1 1 62907E77
P 2150 5550
F 0 "U5" H 1506 5596 50  0000 R CNN
F 1 "ATmega328-PU" H 1506 5505 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2150 5550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2150 5550 50  0001 C CNN
	1    2150 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 6291BB7A
P 3750 5000
F 0 "Y2" V 3704 5131 50  0000 L CNN
F 1 "18MHz" V 3795 5131 50  0000 L CNN
F 2 "" H 3750 5000 50  0001 C CNN
F 3 "~" H 3750 5000 50  0001 C CNN
	1    3750 5000
	0    1    1    0   
$EndComp
$Comp
L Device:C C27
U 1 1 6291BB80
P 4100 4700
F 0 "C27" V 3848 4700 50  0000 C CNN
F 1 "18pF" V 3939 4700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4138 4550 50  0001 C CNN
F 3 "~" H 4100 4700 50  0001 C CNN
	1    4100 4700
	0    1    1    0   
$EndComp
$Comp
L Device:C C28
U 1 1 6291BB86
P 4100 5300
F 0 "C28" V 3848 5300 50  0000 C CNN
F 1 "18pF" V 3939 5300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4138 5150 50  0001 C CNN
F 3 "~" H 4100 5300 50  0001 C CNN
	1    4100 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 4700 3950 4700
Wire Wire Line
	3750 5300 3950 5300
Wire Wire Line
	4250 4700 4350 4700
Wire Wire Line
	4250 5300 4350 5300
Wire Wire Line
	4350 4700 4350 5300
Wire Wire Line
	4350 5300 4350 5450
Connection ~ 4350 5300
$Comp
L power:GND #PWR030
U 1 1 6291BB93
P 4350 5450
F 0 "#PWR030" H 4350 5200 50  0001 C CNN
F 1 "GND" H 4355 5277 50  0000 C CNN
F 2 "" H 4350 5450 50  0001 C CNN
F 3 "" H 4350 5450 50  0001 C CNN
	1    4350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4700 3750 4850
Wire Wire Line
	3750 5150 3750 5300
Wire Wire Line
	3450 4700 3750 4700
Wire Wire Line
	3450 4700 3450 4950
Connection ~ 3750 4700
Wire Wire Line
	3450 5300 3750 5300
Wire Wire Line
	3450 5050 3450 5300
Connection ~ 3750 5300
Text Label 2750 3500 0    50   ~ 0
5V0_ANA
Wire Wire Line
	2750 4950 3450 4950
Wire Wire Line
	2750 5050 3450 5050
Wire Wire Line
	2750 4850 2900 4850
Wire Wire Line
	2750 4750 2900 4750
Wire Wire Line
	2750 4650 2900 4650
Wire Wire Line
	2750 4550 2900 4550
Text Label 2900 4850 0    50   ~ 0
SCLK_5V
Text Label 2900 4750 0    50   ~ 0
MISO_5V
Text Label 2900 4650 0    50   ~ 0
MOSI_5V
Text Label 2900 4550 0    50   ~ 0
CS_5V
Wire Wire Line
	2750 5650 2900 5650
Wire Wire Line
	2750 5750 2900 5750
Text Label 2900 5750 0    50   ~ 0
SCL
Text Label 2900 5650 0    50   ~ 0
SDA
$Comp
L Connector:6P6C J7
U 1 1 623DF60D
P 9500 1200
F 0 "J7" H 9170 1204 50  0000 R CNN
F 1 "6P6C" H 9170 1295 50  0000 R CNN
F 2 "" V 9500 1225 50  0001 C CNN
F 3 "~" V 9500 1225 50  0001 C CNN
	1    9500 1200
	-1   0    0    -1  
$EndComp
Text Label 8100 1000 2    50   ~ 0
3V3
$Comp
L Device:C C36
U 1 1 623F6098
P 9500 1950
F 0 "C36" H 9615 1996 50  0000 L CNN
F 1 "100nF" H 9615 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9538 1800 50  0001 C CNN
F 3 "~" H 9500 1950 50  0001 C CNN
	1    9500 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1500 9200 1400
Wire Wire Line
	9200 1400 9100 1400
Text Label 8100 1400 2    50   ~ 0
ADC_0
Text Label 8100 900  2    50   ~ 0
SDA_RJ11
Text Label 8100 1100 2    50   ~ 0
SCL_RJ11
Wire Wire Line
	2750 5850 2900 5850
Text Label 2900 5850 0    50   ~ 0
RST
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 6285D658
P 2200 1600
F 0 "J3" H 2250 1917 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 2250 1826 50  0000 C CNN
F 2 "" H 2200 1600 50  0001 C CNN
F 3 "~" H 2200 1600 50  0001 C CNN
	1    2200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1500 2750 1500
Text Label 2750 1100 1    50   ~ 0
5V0
Wire Wire Line
	2500 1600 2750 1600
Wire Wire Line
	2500 1700 2750 1700
Wire Wire Line
	2750 1700 2750 1850
$Comp
L power:GND #PWR028
U 1 1 62863179
P 2750 1850
F 0 "#PWR028" H 2750 1600 50  0001 C CNN
F 1 "GND" H 2755 1677 50  0000 C CNN
F 2 "" H 2750 1850 50  0001 C CNN
F 3 "" H 2750 1850 50  0001 C CNN
	1    2750 1850
	1    0    0    -1  
$EndComp
Text Label 2750 1600 0    50   ~ 0
MOSI_5V
Text Label 1500 1500 2    50   ~ 0
MISO_5V
Text Label 1500 1600 2    50   ~ 0
SCLK_5V
$Comp
L Device:R R23
U 1 1 6286AEC8
P 2000 1150
F 0 "R23" H 1930 1104 50  0000 R CNN
F 1 "10k" H 1930 1195 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1930 1150 50  0001 C CNN
F 3 "~" H 2000 1150 50  0001 C CNN
	1    2000 1150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 6286AA1B
P 1800 2250
F 0 "#PWR025" H 1800 2000 50  0001 C CNN
F 1 "GND" H 1805 2077 50  0000 C CNN
F 2 "" H 1800 2250 50  0001 C CNN
F 3 "" H 1800 2250 50  0001 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 6286A110
P 1800 2050
F 0 "SW2" V 1846 2002 50  0000 R CNN
F 1 "SW_Push" V 1755 2002 50  0000 R CNN
F 2 "" H 1800 2250 50  0001 C CNN
F 3 "~" H 1800 2250 50  0001 C CNN
	1    1800 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 1700 1800 1700
Text Label 1500 1700 2    50   ~ 0
RST
Wire Wire Line
	2750 1100 2750 1150
Wire Wire Line
	1800 1700 1800 1850
Wire Wire Line
	1500 1600 2000 1600
Wire Wire Line
	1500 1700 1800 1700
Connection ~ 1800 1700
Wire Wire Line
	1500 1500 2000 1500
Wire Wire Line
	2150 1150 2750 1150
Connection ~ 2750 1150
Wire Wire Line
	2750 1150 2750 1500
Wire Wire Line
	1850 1150 1800 1150
Wire Wire Line
	1800 1150 1800 1700
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 628974BC
P 3700 6050
F 0 "J4" H 3780 6042 50  0000 L CNN
F 1 "Conn_01x02" H 3780 5951 50  0000 L CNN
F 2 "" H 3700 6050 50  0001 C CNN
F 3 "~" H 3700 6050 50  0001 C CNN
	1    3700 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6050 3150 6050
Wire Wire Line
	2750 6150 3200 6150
Wire Wire Line
	3200 6150 3200 6250
Wire Wire Line
	3200 6250 3350 6250
Connection ~ 3200 6150
Wire Wire Line
	3200 6150 3500 6150
Text Label 3350 6250 0    50   ~ 0
TX
Wire Wire Line
	3150 6050 3150 6350
Wire Wire Line
	3150 6350 3350 6350
Connection ~ 3150 6050
Wire Wire Line
	3150 6050 3500 6050
Text Label 3350 6350 0    50   ~ 0
RX
Text Notes 3300 6000 0    50   ~ 0
UART\n
Text Notes 2100 1900 0    50   ~ 0
ICSP header\n
Text Notes 2900 6950 0    50   ~ 0
PD2 --> INT0\n(external interrupt 0)\n
Wire Wire Line
	2750 6250 3050 6250
Wire Wire Line
	3050 6250 3050 6500
Wire Wire Line
	3050 6500 3650 6500
Text Label 3650 6500 0    50   ~ 0
INT_W5500
Text Notes 3550 4350 0    50   ~ 0
18 MHz\nECS-180-S-5PX-TR
Text Notes 2750 7450 0    50   ~ 0
TODO\n- Atmega328 pin mapping\n- Route ADC input 1
$Comp
L Logic_LevelTranslator:TXB0104D U7
U 1 1 62D75B44
P 6650 4950
F 0 "U7" H 6650 4161 50  0000 C CNN
F 1 "TXB0104D" H 6650 4070 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6650 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 6760 5045 50  0001 C CNN
	1    6650 4950
	-1   0    0    -1  
$EndComp
Text Label 6100 3900 2    50   ~ 0
5V0
Text Label 7250 3900 0    50   ~ 0
3V3
Wire Wire Line
	6250 4650 6100 4650
Wire Wire Line
	6250 5050 6100 5050
Wire Wire Line
	6250 5250 6100 5250
Text Label 6100 4650 2    50   ~ 0
SCLK_5V
Text Label 6100 5250 2    50   ~ 0
CS_5V
Text Label 6100 5050 2    50   ~ 0
MOSI_5V
Text Label 6100 4850 2    50   ~ 0
MISO_5V
Wire Wire Line
	6250 4850 6100 4850
Wire Wire Line
	7050 5050 7200 5050
Wire Wire Line
	7050 4650 7200 4650
Wire Wire Line
	7050 5250 7200 5250
Text Label 7200 4650 0    50   ~ 0
SCLK
Text Label 7200 5250 0    50   ~ 0
CS
Text Label 7200 5050 0    50   ~ 0
MOSI
Text Label 7200 4850 0    50   ~ 0
MISO
Wire Wire Line
	7050 4850 7200 4850
Wire Wire Line
	9050 1000 9050 1700
Wire Wire Line
	9500 1700 9500 1800
Wire Wire Line
	9050 1700 9050 1800
$Comp
L Device:C C34
U 1 1 631DB87C
P 7200 4150
F 0 "C34" H 7315 4196 50  0000 L CNN
F 1 "100nF" H 7315 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 4000 50  0001 C CNN
F 3 "~" H 7200 4150 50  0001 C CNN
	1    7200 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 631DFFCE
P 6150 4150
F 0 "C31" H 6265 4196 50  0000 L CNN
F 1 "100nF" H 6265 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6188 4000 50  0001 C CNN
F 3 "~" H 6150 4150 50  0001 C CNN
	1    6150 4150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 63218CA3
P 7200 4300
F 0 "#PWR036" H 7200 4050 50  0001 C CNN
F 1 "GND" H 7205 4127 50  0000 C CNN
F 2 "" H 7200 4300 50  0001 C CNN
F 3 "" H 7200 4300 50  0001 C CNN
	1    7200 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 632191F1
P 6150 4300
F 0 "#PWR034" H 6150 4050 50  0001 C CNN
F 1 "GND" H 6155 4127 50  0000 C CNN
F 2 "" H 6150 4300 50  0001 C CNN
F 3 "" H 6150 4300 50  0001 C CNN
	1    6150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4000 7200 3900
Connection ~ 7200 3900
Wire Wire Line
	7200 3900 7250 3900
Wire Wire Line
	6150 4000 6150 3900
Wire Wire Line
	6100 3900 6150 3900
Connection ~ 6150 3900
$Comp
L Device:Ferrite_Bead FB4
U 1 1 6323F4B9
P 2350 3500
F 0 "FB4" V 2624 3500 50  0000 C CNN
F 1 "BLM21" V 2533 3500 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 2280 3500 50  0001 C CNN
F 3 "~" H 2350 3500 50  0001 C CNN
	1    2350 3500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C24
U 1 1 625A6D53
P 1350 3700
F 0 "C24" H 1235 3654 50  0000 R CNN
F 1 "10uF" H 1235 3745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1388 3550 50  0001 C CNN
F 3 "~" H 1350 3700 50  0001 C CNN
	1    1350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3500 1350 3550
Wire Wire Line
	1350 3500 1850 3500
Wire Wire Line
	1350 3850 1350 3900
Wire Wire Line
	1350 3900 1850 3900
Wire Wire Line
	1850 3850 1850 3900
Connection ~ 1850 3900
Wire Wire Line
	1350 3500 1350 3400
Connection ~ 1350 3500
Wire Wire Line
	6550 4250 6550 3900
Wire Wire Line
	6150 3900 6550 3900
Wire Wire Line
	6750 4250 6750 3900
Wire Wire Line
	6750 3900 7200 3900
$Comp
L Device:C C35
U 1 1 625F438F
P 9050 1950
F 0 "C35" H 9165 1996 50  0000 L CNN
F 1 "10uF" H 9165 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9088 1800 50  0001 C CNN
F 3 "~" H 9050 1950 50  0001 C CNN
	1    9050 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 62A46D73
P 9250 4000
F 0 "J5" H 9330 3992 50  0000 L CNN
F 1 "Conn_01x04" H 9330 3901 50  0000 L CNN
F 2 "" H 9250 4000 50  0001 C CNN
F 3 "~" H 9250 4000 50  0001 C CNN
	1    9250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3900 8900 3900
Wire Wire Line
	9050 4000 8900 4000
Wire Wire Line
	9050 4100 8900 4100
Wire Wire Line
	9050 4200 8900 4200
Text Label 8900 3900 2    50   ~ 0
SDA
Text Label 8900 4000 2    50   ~ 0
3V3
Text Label 8900 4100 2    50   ~ 0
SCL
Wire Wire Line
	8900 4200 8900 4300
$Comp
L power:GND #PWR038
U 1 1 62AA4040
P 8900 4300
F 0 "#PWR038" H 8900 4050 50  0001 C CNN
F 1 "GND" H 8905 4127 50  0000 C CNN
F 2 "" H 8900 4300 50  0001 C CNN
F 3 "" H 8900 4300 50  0001 C CNN
	1    8900 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J6
U 1 1 62473124
P 9250 5000
F 0 "J6" H 9330 5042 50  0000 L CNN
F 1 "Conn_01x05" H 9330 4951 50  0000 L CNN
F 2 "" H 9250 5000 50  0001 C CNN
F 3 "~" H 9250 5000 50  0001 C CNN
	1    9250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5250 2900 5250
Wire Wire Line
	2750 5350 2900 5350
Wire Wire Line
	2750 5450 2900 5450
Wire Wire Line
	2750 5550 2900 5550
Text Label 2900 5250 0    50   ~ 0
ADC_0
Text Label 2900 5350 0    50   ~ 0
ADC_1
Text Label 2900 5450 0    50   ~ 0
ADC_2
Text Label 2900 5550 0    50   ~ 0
ADC_3
Wire Wire Line
	9050 5200 8900 5200
Wire Wire Line
	8900 5200 8900 5300
$Comp
L power:GND #PWR039
U 1 1 62491733
P 8900 5300
F 0 "#PWR039" H 8900 5050 50  0001 C CNN
F 1 "GND" H 8905 5127 50  0000 C CNN
F 2 "" H 8900 5300 50  0001 C CNN
F 3 "" H 8900 5300 50  0001 C CNN
	1    8900 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 5100 8900 5100
Wire Wire Line
	9050 5000 8900 5000
Wire Wire Line
	9050 4900 8900 4900
Wire Wire Line
	9050 4800 8900 4800
Text Label 8900 4800 2    50   ~ 0
ADC_0
Text Label 8900 4900 2    50   ~ 0
ADC_1
Text Label 8900 5000 2    50   ~ 0
ADC_2
Text Label 8900 5100 2    50   ~ 0
ADC_3
$Comp
L Device:R R33
U 1 1 624B96DC
P 8350 1400
F 0 "R33" V 8557 1400 50  0000 C CNN
F 1 "DNF" V 8466 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 1400 50  0001 C CNN
F 3 "~" H 8350 1400 50  0001 C CNN
	1    8350 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8200 1400 8100 1400
Wire Wire Line
	2750 6350 2950 6350
Wire Wire Line
	2950 6350 2950 6600
Wire Wire Line
	2950 6600 3650 6600
Text Label 3650 6600 0    50   ~ 0
INT_SPARE
NoConn ~ 2750 6450
NoConn ~ 2750 6550
NoConn ~ 2750 6650
NoConn ~ 2750 6750
NoConn ~ 2750 4350
NoConn ~ 2750 4450
Wire Wire Line
	8850 1200 9100 1200
Wire Wire Line
	9050 1000 9100 1000
Connection ~ 9050 1700
Wire Wire Line
	9050 1700 9500 1700
Wire Wire Line
	9050 2100 9050 2200
Wire Wire Line
	9500 2100 9500 2200
$Comp
L Device:R R34
U 1 1 625C5CFD
P 8350 1700
F 0 "R34" V 8557 1700 50  0000 C CNN
F 1 "DNF" V 8466 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 1700 50  0001 C CNN
F 3 "~" H 8350 1700 50  0001 C CNN
	1    8350 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 1400 8650 1400
Wire Wire Line
	8100 900  9100 900 
Wire Wire Line
	8100 1000 9050 1000
Connection ~ 9050 1000
Wire Wire Line
	8100 1100 9100 1100
Wire Wire Line
	8650 1300 8650 1400
$Comp
L Device:R R35
U 1 1 6262F28C
P 8650 1950
F 0 "R35" H 8580 1904 50  0000 R CNN
F 1 "0" H 8580 1995 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 1950 50  0001 C CNN
F 3 "~" H 8650 1950 50  0001 C CNN
	1    8650 1950
	-1   0    0    1   
$EndComp
Connection ~ 9100 1400
Wire Wire Line
	8650 1800 8650 1700
Wire Wire Line
	8650 1700 8500 1700
Wire Wire Line
	8650 2100 8650 2200
Wire Wire Line
	8650 1300 9100 1300
Wire Wire Line
	8750 1700 8650 1700
Wire Wire Line
	8750 1400 9100 1400
Wire Wire Line
	8850 1200 8850 2200
$Comp
L power:GND #PWR037
U 1 1 626A4738
P 8650 2300
F 0 "#PWR037" H 8650 2050 50  0001 C CNN
F 1 "GND" H 8655 2127 50  0000 C CNN
F 2 "" H 8650 2300 50  0001 C CNN
F 3 "" H 8650 2300 50  0001 C CNN
	1    8650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2200 8850 2200
Connection ~ 8850 2200
Wire Wire Line
	8850 2200 9050 2200
Connection ~ 9050 2200
Wire Wire Line
	9050 2200 9500 2200
Wire Wire Line
	8650 2200 8650 2300
Connection ~ 8650 2200
Connection ~ 8650 1700
Wire Wire Line
	8750 1400 8750 1700
Wire Wire Line
	8200 1700 8100 1700
Text Label 8100 1700 2    50   ~ 0
INT_SPARE
$Comp
L custom_digital:PCA9517A U6
U 1 1 624DB520
P 4950 1700
F 0 "U6" H 4925 1775 50  0000 C CNN
F 1 "PCA9517A" H 4925 1684 50  0000 C CNN
F 2 "" H 4950 1700 50  0001 C CNN
F 3 "" H 4950 1700 50  0001 C CNN
	1    4950 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 624DC04F
P 5850 1850
F 0 "R26" V 5643 1850 50  0000 C CNN
F 1 "75" V 5734 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5780 1850 50  0001 C CNN
F 3 "~" H 5850 1850 50  0001 C CNN
	1    5850 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 624DD22A
P 5850 2150
F 0 "R27" V 5643 2150 50  0000 C CNN
F 1 "75" V 5734 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5780 2150 50  0001 C CNN
F 3 "~" H 5850 2150 50  0001 C CNN
	1    5850 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 1950 5600 1850
Wire Wire Line
	5600 1850 5700 1850
Wire Wire Line
	5600 2050 5600 2150
Wire Wire Line
	5600 2150 5700 2150
Wire Wire Line
	6000 1850 6100 1850
Wire Wire Line
	6100 1850 6100 1950
Wire Wire Line
	6000 2150 6100 2150
Wire Wire Line
	6100 2150 6100 2050
$Comp
L Device:R R30
U 1 1 624F572C
P 6500 1500
F 0 "R30" H 6570 1546 50  0000 L CNN
F 1 "2.2k" H 6570 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 1500 50  0001 C CNN
F 3 "~" H 6500 1500 50  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R31
U 1 1 624F6644
P 6750 1300
F 0 "R31" H 6820 1346 50  0000 L CNN
F 1 "2.2k" H 6820 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6680 1300 50  0001 C CNN
F 3 "~" H 6750 1300 50  0001 C CNN
	1    6750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2050 6950 2050
Connection ~ 6500 2050
$Comp
L Device:R R28
U 1 1 62524162
P 6250 1700
F 0 "R28" H 6320 1746 50  0000 L CNN
F 1 "10k" H 6320 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6180 1700 50  0001 C CNN
F 3 "~" H 6250 1700 50  0001 C CNN
	1    6250 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2150 5450 2150
Wire Wire Line
	5450 2150 5450 2300
Wire Wire Line
	6250 2300 6250 1850
Wire Wire Line
	6100 2050 6500 2050
Wire Wire Line
	6100 1950 6750 1950
Wire Wire Line
	6500 1650 6500 2050
Wire Wire Line
	6750 1450 6750 1950
Connection ~ 6750 1950
Wire Wire Line
	6750 1950 6950 1950
Wire Wire Line
	6750 1050 6500 1050
Wire Wire Line
	5500 1050 5500 1850
Wire Wire Line
	6750 1050 6750 1150
Wire Wire Line
	6500 1350 6500 1050
Connection ~ 6500 1050
Wire Wire Line
	6500 1050 6250 1050
Wire Wire Line
	6250 1550 6250 1050
Connection ~ 6250 1050
Wire Wire Line
	6250 1050 5500 1050
Wire Wire Line
	5500 900  5500 1050
$Comp
L Device:C C30
U 1 1 62575931
P 5150 1250
F 0 "C30" H 5265 1296 50  0000 L CNN
F 1 "100nF" H 5265 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5188 1100 50  0001 C CNN
F 3 "~" H 5150 1250 50  0001 C CNN
	1    5150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 6257D1C2
P 5150 1400
F 0 "#PWR033" H 5150 1150 50  0001 C CNN
F 1 "GND" H 5155 1227 50  0000 C CNN
F 2 "" H 5150 1400 50  0001 C CNN
F 3 "" H 5150 1400 50  0001 C CNN
	1    5150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1100 5150 1050
Text Label 5500 900  1    50   ~ 0
3V3
Wire Wire Line
	4550 1950 4250 1950
Wire Wire Line
	4550 2050 4000 2050
$Comp
L Device:R R25
U 1 1 625AB2A2
P 4250 1500
F 0 "R25" H 4320 1546 50  0000 L CNN
F 1 "10k" H 4320 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4180 1500 50  0001 C CNN
F 3 "~" H 4250 1500 50  0001 C CNN
	1    4250 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 625B233C
P 4000 1700
F 0 "R24" H 4070 1746 50  0000 L CNN
F 1 "10k" H 4070 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 1700 50  0001 C CNN
F 3 "~" H 4000 1700 50  0001 C CNN
	1    4000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1650 4250 1950
Connection ~ 4250 1950
Wire Wire Line
	4250 1950 3850 1950
Wire Wire Line
	4000 1850 4000 2050
Connection ~ 4000 2050
Wire Wire Line
	4000 2050 3850 2050
Wire Wire Line
	4550 1850 4500 1850
Wire Wire Line
	4500 1850 4500 1250
Wire Wire Line
	4250 1350 4250 1250
Wire Wire Line
	4250 1250 4500 1250
Connection ~ 4500 1250
Wire Wire Line
	4000 1550 4000 1250
Wire Wire Line
	4000 1250 4250 1250
Connection ~ 4250 1250
$Comp
L Device:C C29
U 1 1 625E5DC0
P 4650 1250
F 0 "C29" H 4765 1296 50  0000 L CNN
F 1 "100nF" H 4765 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 1100 50  0001 C CNN
F 3 "~" H 4650 1250 50  0001 C CNN
	1    4650 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 625F5E5A
P 4650 1400
F 0 "#PWR032" H 4650 1150 50  0001 C CNN
F 1 "GND" H 4655 1227 50  0000 C CNN
F 2 "" H 4650 1400 50  0001 C CNN
F 3 "" H 4650 1400 50  0001 C CNN
	1    4650 1400
	1    0    0    -1  
$EndComp
Text Label 4500 900  1    50   ~ 0
5V0
Text Label 6950 2050 0    50   ~ 0
SDA_RJ11
Text Label 6950 1950 0    50   ~ 0
SCL_RJ11
Text Label 3850 1950 2    50   ~ 0
SCL
Text Label 3850 2050 2    50   ~ 0
SDA
Wire Wire Line
	4550 2150 4500 2150
Wire Wire Line
	4500 2150 4500 2250
$Comp
L power:GND #PWR031
U 1 1 6260815F
P 4500 2250
F 0 "#PWR031" H 4500 2000 50  0001 C CNN
F 1 "GND" H 4505 2077 50  0000 C CNN
F 2 "" H 4500 2250 50  0001 C CNN
F 3 "" H 4500 2250 50  0001 C CNN
	1    4500 2250
	1    0    0    -1  
$EndComp
Connection ~ 5500 1050
Wire Wire Line
	5300 1850 5500 1850
Wire Wire Line
	5300 1950 5600 1950
Wire Wire Line
	5300 2050 5600 2050
Wire Wire Line
	5450 2300 6250 2300
Wire Wire Line
	5150 1050 5500 1050
Wire Wire Line
	4500 900  4500 1050
Wire Wire Line
	4650 1100 4650 1050
Wire Wire Line
	4650 1050 4500 1050
Connection ~ 4500 1050
Wire Wire Line
	4500 1050 4500 1250
$Comp
L Device:R R29
U 1 1 626BF1B5
P 6450 2400
F 0 "R29" H 6520 2446 50  0000 L CNN
F 1 "DNF" H 6520 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 2400 50  0001 C CNN
F 3 "~" H 6450 2400 50  0001 C CNN
	1    6450 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C32
U 1 1 626E1963
P 6450 2800
F 0 "C32" H 6565 2846 50  0000 L CNN
F 1 "DNF" H 6565 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 2650 50  0001 C CNN
F 3 "~" H 6450 2800 50  0001 C CNN
	1    6450 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R32
U 1 1 626F4122
P 6800 2400
F 0 "R32" H 6870 2446 50  0000 L CNN
F 1 "DNF" H 6870 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6730 2400 50  0001 C CNN
F 3 "~" H 6800 2400 50  0001 C CNN
	1    6800 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C33
U 1 1 626F4128
P 6800 2800
F 0 "C33" H 6915 2846 50  0000 L CNN
F 1 "DNF" H 6915 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6838 2650 50  0001 C CNN
F 3 "~" H 6800 2800 50  0001 C CNN
	1    6800 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2050 6500 2150
Wire Wire Line
	6500 2150 6450 2150
Wire Wire Line
	6450 2150 6450 2250
Wire Wire Line
	6450 2550 6450 2650
Wire Wire Line
	6750 1950 6750 2150
Wire Wire Line
	6750 2150 6800 2150
Wire Wire Line
	6800 2150 6800 2250
Wire Wire Line
	6800 2550 6800 2650
Wire Wire Line
	6450 2950 6450 3000
Wire Wire Line
	6450 3000 6800 3000
Wire Wire Line
	6800 3000 6800 2950
Connection ~ 6450 3000
Wire Wire Line
	6450 3000 6450 3100
$Comp
L power:GND #PWR035
U 1 1 62739F6A
P 6450 3100
F 0 "#PWR035" H 6450 2850 50  0001 C CNN
F 1 "GND" H 6455 2927 50  0000 C CNN
F 2 "" H 6450 3100 50  0001 C CNN
F 3 "" H 6450 3100 50  0001 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
Text Notes 7100 2500 0    50   ~ 0
150 Ohm and 150 pF\ntypical damping values,\nif required
$EndSCHEMATC
