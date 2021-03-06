EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:HBridge
LIBS:arduibodet
LIBS:ArduiBodet-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ArduiBodet - Horloge mère pour horloge Bodet 1/2 MIN"
Date "2015-11-02"
Rev "1.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-P IC1
U 1 1 553F1F61
P 3950 4200
F 0 "IC1" H 3200 5450 40  0000 L BNN
F 1 "ATMEGA328-P" H 4350 2800 40  0000 L BNN
F 2 "Housings_DIP:DIP-28__300" H 3950 4200 30  0000 C CIN
F 3 "" H 3950 4200 60  0000 C CNN
	1    3950 4200
	1    0    0    -1  
$EndComp
$Comp
L Switch_DPST SW2
U 1 1 553F233A
P 7500 5300
F 0 "SW2" H 7800 5350 50  0000 C CNN
F 1 "Switch_DPST" H 7800 5250 50  0000 C CNN
F 2 "myLib:Pin_Header_Straight_2x03_for_SPDT_switch" H 7500 5300 60  0001 C CNN
F 3 "" H 7500 5300 60  0000 C CNN
	1    7500 5300
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW1
U 1 1 553F23F4
P 4750 1600
F 0 "SW1" H 4550 1750 50  0000 C CNN
F 1 "SWITCH_INV" H 4600 1450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 4750 1600 60  0001 C CNN
F 3 "" H 4750 1600 60  0000 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 553F26E8
P 8200 5100
F 0 "R3" V 8280 5100 50  0000 C CNN
F 1 "470" V 8200 5100 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8130 5100 30  0001 C CNN
F 3 "" H 8200 5100 30  0000 C CNN
	1    8200 5100
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 553F277F
P 2850 4100
F 0 "C1" H 2875 4200 50  0000 L CNN
F 1 "100nF" H 2875 4000 50  0000 L CNN
F 2 "MyLib:C_Rect_L7_W2.5_P2.5" H 2888 3950 30  0001 C CNN
F 3 "" H 2850 4100 60  0000 C CNN
	1    2850 4100
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 553F289E
P 9150 3200
F 0 "C3" H 9175 3300 50  0000 L CNN
F 1 "100nF" H 9175 3100 50  0000 L CNN
F 2 "MyLib:C_Rect_L7_W2.5_P2.5" H 9188 3050 30  0001 C CNN
F 3 "" H 9150 3200 60  0000 C CNN
	1    9150 3200
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 553F29DF
P 6950 1850
F 0 "C2" H 6975 1950 50  0000 L CNN
F 1 "100 nF" H 6975 1750 50  0000 L CNN
F 2 "MyLib:C_Rect_L7_W2.5_P2.5" H 6988 1700 30  0001 C CNN
F 3 "" H 6950 1850 60  0000 C CNN
	1    6950 1850
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 553F2A3B
P 8550 5100
F 0 "D1" H 8550 5200 50  0000 C CNN
F 1 "LED" H 8550 5000 50  0000 C CNN
F 2 "LEDs:LED-5MM" H 8550 5100 60  0001 C CNN
F 3 "" H 8550 5100 60  0000 C CNN
	1    8550 5100
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 553F2C4A
P 8100 4550
F 0 "R2" V 8180 4550 50  0000 C CNN
F 1 "47" V 8100 4550 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Vertical_RM5mm" V 8030 4550 30  0001 C CNN
F 3 "" H 8100 4550 30  0000 C CNN
	1    8100 4550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 553F2D4B
P 8450 4600
F 0 "P3" H 8450 4750 50  0000 C CNN
F 1 "Moteur Horloge" H 8550 4403 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 8450 4600 60  0001 C CNN
F 3 "" H 8450 4600 60  0000 C CNN
	1    8450 4600
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 553F334F
P 5200 2800
F 0 "R1" V 5280 2800 50  0000 C CNN
F 1 "22K" V 5200 2800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5130 2800 30  0001 C CNN
F 3 "" H 5200 2800 30  0000 C CNN
	1    5200 2800
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR01
U 1 1 553F41CC
P 8350 4100
F 0 "#PWR01" H 8350 3850 50  0001 C CNN
F 1 "GNDA" H 8350 3950 50  0000 C CNN
F 2 "" H 8350 4100 60  0000 C CNN
F 3 "" H 8350 4100 60  0000 C CNN
	1    8350 4100
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 553F4D1D
P 3950 1700
F 0 "CON1" H 3950 1950 60  0000 C CNN
F 1 "BARREL_JACK" H 3950 1500 60  0000 C CNN
F 2 "myLib:BARREL_JACK_FR" H 3950 1700 60  0001 C CNN
F 3 "" H 3950 1700 60  0000 C CNN
	1    3950 1700
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 553F581B
P 5550 1700
F 0 "#FLG02" H 5550 1795 50  0001 C CNN
F 1 "PWR_FLAG" H 5550 1880 50  0000 C CNN
F 2 "" H 5550 1700 60  0000 C CNN
F 3 "" H 5550 1700 60  0000 C CNN
	1    5550 1700
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR03
U 1 1 553F8611
P 6950 2100
F 0 "#PWR03" H 6950 1850 50  0001 C CNN
F 1 "GNDA" H 6950 1950 50  0000 C CNN
F 2 "" H 6950 2100 60  0000 C CNN
F 3 "" H 6950 2100 60  0000 C CNN
	1    6950 2100
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR04
U 1 1 553F9829
P 8950 5650
F 0 "#PWR04" H 8950 5400 50  0001 C CNN
F 1 "GNDA" H 8950 5500 50  0000 C CNN
F 2 "" H 8950 5650 60  0000 C CNN
F 3 "" H 8950 5650 60  0000 C CNN
	1    8950 5650
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR05
U 1 1 553FABF0
P 3050 5550
F 0 "#PWR05" H 3050 5300 50  0001 C CNN
F 1 "GNDA" H 3050 5400 50  0000 C CNN
F 2 "" H 3050 5550 60  0000 C CNN
F 3 "" H 3050 5550 60  0000 C CNN
	1    3050 5550
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR06
U 1 1 553FBFBB
P 5700 5700
F 0 "#PWR06" H 5700 5450 50  0001 C CNN
F 1 "GNDA" H 5700 5550 50  0000 C CNN
F 2 "" H 5700 5700 60  0000 C CNN
F 3 "" H 5700 5700 60  0000 C CNN
	1    5700 5700
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR07
U 1 1 553FE91E
P 6750 3950
F 0 "#PWR07" H 6750 3700 50  0001 C CNN
F 1 "GNDA" H 6750 3800 50  0000 C CNN
F 2 "" H 6750 3950 60  0000 C CNN
F 3 "" H 6750 3950 60  0000 C CNN
	1    6750 3950
	1    0    0    -1  
$EndComp
NoConn ~ 6050 3500
NoConn ~ 4950 3100
NoConn ~ 4950 3700
NoConn ~ 4950 3800
NoConn ~ 4950 3950
NoConn ~ 4950 4050
NoConn ~ 4950 4150
NoConn ~ 4950 4250
NoConn ~ 4950 4700
NoConn ~ 4950 4800
NoConn ~ 4950 5000
NoConn ~ 4950 5200
NoConn ~ 4950 5300
NoConn ~ 4950 5400
NoConn ~ 3050 3400
NoConn ~ 3050 3700
NoConn ~ 8550 3400
NoConn ~ 8550 3500
$Comp
L SN754410 IC2
U 1 1 553F21D6
P 7850 3400
F 0 "IC2" H 7450 4100 50  0000 L BNN
F 1 "SN754410" H 8050 3000 50  0000 L BNN
F 2 "Housings_DIP:DIP-16__300" H 7850 3550 50  0001 C CNN
F 3 "" H 7850 3400 60  0000 C CNN
	1    7850 3400
	1    0    0    -1  
$EndComp
NoConn ~ 8550 3100
NoConn ~ 8550 3200
NoConn ~ 5250 1500
NoConn ~ 4250 1700
$Comp
L GNDA #PWR08
U 1 1 5540F934
P 2450 5550
F 0 "#PWR08" H 2450 5300 50  0001 C CNN
F 1 "GNDA" H 2450 5400 50  0000 C CNN
F 2 "" H 2450 5550 60  0000 C CNN
F 3 "" H 2450 5550 60  0000 C CNN
	1    2450 5550
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 5540F950
P 2450 5400
F 0 "#FLG09" H 2450 5495 50  0001 C CNN
F 1 "PWR_FLAG" H 2450 5580 50  0000 C CNN
F 2 "" H 2450 5400 60  0000 C CNN
F 3 "" H 2450 5400 60  0000 C CNN
	1    2450 5400
	1    0    0    -1  
$EndComp
Text Notes 7250 5700 0    60   ~ 0
Avance Rapide
Text Notes 4550 1900 0    60   ~ 0
Marche/Arrêt
$Comp
L LM7805CT U1
U 1 1 5545FF74
P 6350 1750
F 0 "U1" H 6150 1950 40  0000 C CNN
F 1 "LM7805CT" H 6350 1950 40  0000 L CNN
F 2 "Power_Integrations:TO-220" H 6350 1850 30  0000 C CIN
F 3 "" H 6350 1750 60  0000 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 55460D40
P 5800 1850
F 0 "C5" H 5825 1950 50  0000 L CNN
F 1 "330nF" H 5825 1750 50  0000 L CNN
F 2 "MyLib:C_Rect_L7_W2.5_P2.5" H 5838 1700 30  0001 C CNN
F 3 "" H 5800 1850 60  0000 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR010
U 1 1 553F8364
P 4350 2100
F 0 "#PWR010" H 4350 1850 50  0001 C CNN
F 1 "GNDA" H 4350 1950 50  0000 C CNN
F 2 "" H 4350 2100 60  0000 C CNN
F 3 "" H 4350 2100 60  0000 C CNN
	1    4350 2100
	1    0    0    -1  
$EndComp
$Comp
L CP C4
U 1 1 55460F8C
P 5550 1850
F 0 "C4" H 5575 1950 50  0000 L CNN
F 1 "1000 uF" H 5450 1750 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_20x10mm_RM2.5" H 5588 1700 30  0001 C CNN
F 3 "" H 5550 1850 60  0000 C CNN
	1    5550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4550 7950 4550
Wire Wire Line
	7200 3500 7200 4550
Wire Wire Line
	7150 3000 7250 3000
Wire Wire Line
	7150 2500 7150 3000
Connection ~ 7850 2500
Wire Wire Line
	4350 1800 4250 1800
Connection ~ 7750 4100
Wire Wire Line
	7650 3900 7650 4100
Connection ~ 7850 4100
Wire Wire Line
	7750 3900 7750 4100
Connection ~ 7950 4100
Wire Wire Line
	7950 4100 7950 3900
Connection ~ 8800 4100
Wire Wire Line
	8800 4100 8800 3000
Wire Wire Line
	8800 3000 8550 3000
Wire Wire Line
	9150 2450 9150 3050
Wire Wire Line
	7850 2500 3050 2500
Wire Wire Line
	7850 2450 9150 2450
Connection ~ 8350 4100
Wire Wire Line
	7850 4100 7850 3900
Wire Wire Line
	7650 4100 9150 4100
Wire Wire Line
	9150 4100 9150 3350
Wire Wire Line
	6750 1700 7850 1700
Wire Wire Line
	7100 3400 7100 5100
Wire Wire Line
	7100 4650 8250 4650
Wire Wire Line
	7100 3400 7250 3400
Wire Wire Line
	8750 5100 8950 5100
Wire Wire Line
	8950 5100 8950 5650
Wire Wire Line
	7800 5100 8050 5100
Wire Wire Line
	7100 5100 7200 5100
Connection ~ 7100 4650
Wire Wire Line
	3050 2500 3050 3100
Connection ~ 7150 2500
Wire Wire Line
	2850 4250 2850 5300
Wire Wire Line
	2850 5300 3050 5300
Wire Wire Line
	3050 3100 2850 3100
Wire Wire Line
	2850 3100 2850 3950
Wire Wire Line
	5200 2650 5200 2500
Connection ~ 5200 2500
Wire Wire Line
	5200 2950 5200 4550
Wire Wire Line
	5200 4550 4950 4550
Wire Wire Line
	5700 5700 5700 4850
Wire Wire Line
	5700 4850 5850 4850
Connection ~ 5800 2500
Wire Wire Line
	4950 4350 5600 4350
Wire Wire Line
	5600 4350 5600 5050
Wire Wire Line
	5600 5050 5850 5050
Wire Wire Line
	4950 4450 5500 4450
Wire Wire Line
	5500 4450 5500 5150
Wire Wire Line
	5500 5150 5850 5150
Wire Wire Line
	4950 4900 5400 4900
Wire Wire Line
	5400 4900 5400 5250
Wire Wire Line
	5400 5250 5850 5250
Wire Wire Line
	4950 5100 5300 5100
Wire Wire Line
	5300 5100 5300 5500
Wire Wire Line
	5300 5500 7200 5500
Wire Wire Line
	7800 5500 8950 5500
Connection ~ 8950 5500
Wire Wire Line
	6750 3500 6750 3950
Connection ~ 6750 3600
Connection ~ 6750 3700
Connection ~ 6750 3800
Wire Wire Line
	6750 3400 6750 2500
Connection ~ 6750 2500
Wire Wire Line
	4950 3400 6050 3400
Wire Wire Line
	4950 3500 5900 3500
Wire Wire Line
	5900 3500 5900 3800
Wire Wire Line
	5900 3800 6050 3800
Wire Wire Line
	5200 3600 6050 3600
Connection ~ 5200 3600
Wire Wire Line
	4950 3600 5100 3600
Wire Wire Line
	5100 3600 5100 3700
Wire Wire Line
	5100 3700 6050 3700
Wire Wire Line
	7050 3300 7050 3200
Wire Wire Line
	7050 3200 7250 3200
Wire Wire Line
	4950 3200 6950 3200
Wire Wire Line
	6950 3200 6950 3100
Wire Wire Line
	6950 3100 7250 3100
Wire Wire Line
	4950 3300 7050 3300
Wire Wire Line
	5850 4950 5800 4950
Wire Wire Line
	5800 4950 5800 2500
Wire Wire Line
	3050 5300 3050 5550
Connection ~ 3050 5400
Wire Wire Line
	2450 5400 2450 5550
Wire Wire Line
	5550 2050 6950 2050
Wire Wire Line
	6950 2000 6950 2100
Wire Wire Line
	6350 2050 6350 2000
Connection ~ 6950 2050
Wire Wire Line
	4350 2100 4350 1800
Wire Wire Line
	5250 1700 5950 1700
Connection ~ 5800 1700
Connection ~ 5550 1700
Wire Wire Line
	5800 2000 5800 2050
Connection ~ 6350 2050
Wire Wire Line
	7250 3500 7200 3500
Connection ~ 7850 2450
Wire Wire Line
	5550 2000 5550 2050
Connection ~ 5800 2050
Wire Wire Line
	5800 1700 5800 1400
Wire Wire Line
	5800 1400 7950 1400
Wire Wire Line
	7950 1400 7950 2500
Wire Wire Line
	6950 1700 6950 1700
Connection ~ 6950 1700
Wire Wire Line
	7850 1700 7850 2500
$Comp
L DS3231_Breakout_Connector P2
U 1 1 562E1AFB
P 6050 5100
F 0 "P2" H 6050 5450 50  0000 C CNN
F 1 "DS3231_Breakout_Connector" V 6150 5100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 6050 5100 60  0001 C CNN
F 3 "" H 6050 5100 60  0000 C CNN
	1    6050 5100
	1    0    0    -1  
$EndComp
NoConn ~ 5850 5350
$Comp
L ICSP_10_PIN P1
U 1 1 562E2283
P 6300 3600
F 0 "P1" H 6300 3900 50  0000 C CNN
F 1 "ICSP_10_PIN" H 6300 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05" H 6300 2400 60  0001 C CNN
F 3 "" H 6300 2400 60  0000 C CNN
	1    6300 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
