/* 
	Editor: http://www.visualmicro.com
	        visual micro and the arduino ide ignore this code during compilation. this code is automatically maintained by visualmicro, manual changes to this file will be overwritten
	        the contents of the Visual Micro sketch sub folder can be deleted prior to publishing a project
	        all non-arduino files created by visual micro and all visual studio project or solution files can be freely deleted and are not required to compile a sketch (do not delete your own code!).
	        note: debugger breakpoints are stored in '.sln' or '.asln' files, knowledge of last uploaded breakpoints is stored in the upload.vmps.xml file. Both files are required to continue a previous debug session without needing to compile and upload again
	
	Hardware: Arduino Duemilanove w/ ATmega328, Platform=avr, Package=arduino
*/

#define __AVR_ATmega328p__
#define __AVR_ATmega328P__
#define ARDUINO 105
#define ARDUINO_MAIN
#define F_CPU 16000000L
#define __AVR__
extern "C" void __cxa_pure_virtual() {;}

void dumpTimestamp(char* msg);
void tick();
//
void pulse(uint16_t pulseWidth);
void recordOffset(uint16_t offset);
uint16_t readOffset();
int8_t calcDSTChange();
uint16_t adjustDstEurope(DateTime t);
uint32_t getCurrentTimeOffset();
void fastForwardToSummerTime();
//

#include "D:\arduino\arduino-1.0.5\hardware\arduino\variants\standard\pins_arduino.h" 
#include "D:\arduino\arduino-1.0.5\hardware\arduino\cores\arduino\arduino.h"
#include "C:\Users\xnrq8224\Documents\Arduino\HorlogeBodet\HorlogeBodet.ino"
