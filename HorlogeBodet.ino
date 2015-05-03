#include <EEPROM.h>
#include <Wire.h>
#include "DS3231.h"
#include "LowPower.h"

//includes pour sleep mode
#include <avr/interrupt.h>
#include <avr/power.h>
#include <avr/sleep.h>
#include <avr/wdt.h>

#define DEBUG_SERIAL 1

#if defined(__AVR_ATmega32U4__)
#define PIN_INTERRUPT 0
#define ID_INTERRUPT 2
#else
#define ID_INTERRUPT 0
#define PIN_INTERRUPT 2
#endif

#define PIN_1 9
#define PIN_2 10
#define PIN_FF 4

#define PULSE_WIDTH 400
#define PERIOD 1000
//#define PERIOD 30000
#define OFFSET_WINTER 3600
#define OFFSET_SUMMER 7200
#define OFFSET_ADDRESS 0
#define FAST_FORWARD_DELAY 400

//positive if clock is disabled (for specified number of cycles)
//used to disable clock for 1h during winter time change
uint8_t disabled = 0;
RTClib RTC;
DS3231 clock;
volatile uint8_t tickCounter=0;
//true if a tick interrupt has been received
volatile uint8_t tickReceived=0;

#ifdef DEBUG_SERIAL
void dumpTimestamp(char* msg){
	DateTime now = RTC.now();
	  Serial.print(now.year(), DEC);
	  Serial.print('/');
	  Serial.print(now.month(), DEC);
	  Serial.print('/');
	  Serial.print(now.day(), DEC);
	  Serial.print(' ');
	  Serial.print(now.hour(), DEC);
	  Serial.print(':');
	  Serial.print(now.minute(), DEC);
	  Serial.print(':');
	  Serial.print(now.second(), DEC);
	  Serial.print(' ');
	  Serial.println(msg);
}
#endif
/************************************************************************/
/* Wake-up interrupt routine                                            */
/************************************************************************/
void tick(){
	if(tickCounter == 0){
		tickReceived = true;
	}else{
		tickReceived = false;
	}
	
	tickCounter++;
	if(tickCounter == 30){
		tickCounter = 0;
	}
}

void setup() {
    Wire.begin();
	pinMode(PIN_1, OUTPUT);
	pinMode(PIN_2, OUTPUT);
	pinMode(PIN_FF,INPUT_PULLUP);
	pinMode(PIN_INTERRUPT, INPUT);   
	digitalWrite(PIN_1,LOW);
	digitalWrite(PIN_2,LOW);
#ifdef DEBUG_SERIAL	
	Serial.begin(9600);
#endif
     //init RTC
	 clock.enableOscillator(true,false,0); //enable 1Hz on SQW output
	 
	 DateTime now = RTC.now();
        //TODO: remove true after tests
	 if(true || now.year() == 2000){
			//first run or dead battery, reinit to compile time & date
			//DateTime newDT = DateTime(__DATE__, __TIME__);
			DateTime newDT = DateTime(2015,5,1,15,20);
			clock.setClockMode(false);	// set to 24h
		 	clock.setYear(newDT.year()-2000);
			clock.setMonth(newDT.month());
			clock.setDate(newDT.day());
			clock.setHour(newDT.hour());
			clock.setMinute(newDT.minute());
			clock.setSecond(newDT.second()); 
	 }
	 
	 attachInterrupt(ID_INTERRUPT, tick, RISING);
	 

	 #ifdef DEBUG_SERIAL
	 dumpTimestamp("starting loop");
	 #endif
}

/************************************************************************/
/* Send pulse to clock motor - pulse polarity is automatically inverted on each call  */
/************************************************************************/
void pulse(uint16_t pulseWidth)
{
	static uint8_t step = 0;
	uint8_t pin;
	if (step % 2 == 0){
		pin = PIN_1;
		}else{
		pin = PIN_2;
	}
	
	digitalWrite(pin,HIGH);
	delay(pulseWidth);
	digitalWrite(pin,LOW);	
	step++; 
}

/************************************************************************/
/* record time offset in eeprom                                         */
/************************************************************************/
void recordOffset(uint16_t offset)
{
	EEPROM.write(OFFSET_ADDRESS,offset & 0xFF);
	EEPROM.write(OFFSET_ADDRESS+1,(offset >> 8 ) & 0xFF);
}

/************************************************************************/
/* read time offset from eeprom                                         */
/************************************************************************/
uint16_t readOffset()
{
	uint16_t offset = EEPROM.read(OFFSET_ADDRESS) | (EEPROM.read(OFFSET_ADDRESS+1) << 8);
	return offset;
}

/************************************************************************/
/* Calculates DST change.
/* returns 0: no change necessary, 1: summer time change required, -1: winter time change required */
/************************************************************************/
int8_t calcDSTChange()
{
	int8_t change = 0;
	uint16_t currentOffset =  getCurrentTimeOffset();
	uint16_t previousOffset = readOffset();
	#ifdef DEBUG_SERIAL	
	Serial.print("currentOffset: ");
	Serial.println(currentOffset);
	Serial.print("previousOffset: ");
	Serial.println(previousOffset);
	#endif
	if(previousOffset != 0 && (previousOffset != currentOffset)){
		//change required
		recordOffset(currentOffset);
		if(currentOffset == OFFSET_SUMMER){
			change = +1;
		}else{
			if(currentOffset == OFFSET_WINTER){
				change = -1;
			}	
		}
	}
	return change;
}

uint16_t adjustDstEurope(DateTime t)
{
 /*You can use the following equations to calculate when DST starts and ends.
 The divisions are integer divisions, in which remainders are discarded.
 "mod" means the remainder when doing integer division, e.g., 20 mod 7 = 6.
 That is, 20 divided by 7 is 2 and 6/7th (where six is the remainder).
 With: y = year.
        For the United States:
            Begin DST: Sunday April (2+6*y-y/4) mod 7+1
            End DST: Sunday October (31-(y*5/4+1) mod 7)
           Valid for years 1900 to 2006, though DST wasn't adopted until the 1950s-1960s. 2007 and after:
            Begin DST: Sunday March 14 - (1 + y*5/4) mod 7
            End DST: Sunday November 7 - (1 + y*5/4) mod 7;
        European Economic Community:
            Begin DST: Sunday March (31 - (5*y/4 + 4) mod 7) at 1h U.T.
            End DST: Sunday October (31 - (5*y/4 + 1) mod 7) at 1h U.T.
            Since 1996, valid through 2099
(Equations by Wei-Hwa Huang (US), and Robert H. van Gent (EC))
 
 Adjustig Time with DST Europe/France/Paris: UTC+1h in winter, UTC+2h in summer
 
 */
 
  // last sunday of march
  int beginDSTDate=  (31 - (5* t.year() /4 + 4) % 7);
  //Serial.println(beginDSTDate);
  int beginDSTMonth=3;
  //last sunday of october
  int endDSTDate= (31 - (5 * t.year() /4 + 1) % 7);
  //Serial.println(endDSTDate);
  int endDSTMonth=10;
  // DST is valid as:
  if (((t.month() > beginDSTMonth) && (t.month() < endDSTMonth))
      || ((t.month() == beginDSTMonth) && (t.day() > beginDSTDate)) 
	  || ((t.month() == beginDSTMonth) && (t.day() == beginDSTDate) && (t.hour() >= 1))
      || ((t.month() == endDSTMonth) && (t.day() < endDSTDate))
	  || ((t.month() == endDSTMonth) && (t.day() == endDSTDate) && (t.hour() < 1)))
  return 7200;      // DST europe = utc +2 hour (summer time)
  else return 3600; // nonDST europe = utc +1 hour (winter time)
}


uint32_t getCurrentTimeOffset()
{
	DateTime now = RTC.now();
	uint32_t offset = adjustDstEurope(now);
	return offset;
}

/*********************************************************************************************/
/*  add 1h to the displayed time, and compensates for the time taken to move the clock hands */
/*********************************************************************************************/
void fastForwardToSummerTime(){
	detachInterrupt(PIN_INTERRUPT);
	for(int p=0;p<121;p++){
		pulse(PULSE_WIDTH);
		delay(FAST_FORWARD_DELAY);
	}
	attachInterrupt(ID_INTERRUPT, tick, RISING);
}

void loop() {
		unsigned long t1,t2;
		//fast-forward mode
		if(!digitalRead(PIN_FF)){
			detachInterrupt(PIN_INTERRUPT);
			do{
				pulse(PULSE_WIDTH);
				delay(FAST_FORWARD_DELAY);
			}while(!digitalRead(PIN_FF));
			tickCounter=1;
			attachInterrupt(ID_INTERRUPT, tick, RISING);
		}
	if(tickReceived){
		#ifdef DEBUG_SERIAL
		dumpTimestamp("tickReceived");
		#endif
		#ifdef DEBUG_SERIAL
		Serial.print("disabled: ");
		Serial.println(disabled);
		#endif
		int8_t changeRequired = calcDSTChange();
		#ifdef DEBUG_SERIAL
		Serial.print("changeRequired: ");
		Serial.println(changeRequired,DEC);
		#endif
		if(changeRequired == -1){
			disabled = 120; //2 cycles per min
		}else{
			if(changeRequired == 1){
				fastForwardToSummerTime();
			}
		}
		
		//check if DTS time change is required
		//TODO implement
		//if -1 -> disabled = 3600
		//if 1 -> fast-forward for 1h + delta secs (to be measured)
	
		//main loop
		if(disabled == 0){
			t1 = millis();
			pulse(PULSE_WIDTH);
			t2 = millis();
		}else{
			//updates are disabled
			disabled--;
		}
  }
	//delay(PERIOD-((t2-t1)));     	 
	// Enter power down state with ADC and BOD module disabled.
	// Wake up when wake up pin is rising
        //TODO set BOD_OFF after tests
	LowPower.powerDown(SLEEP_FOREVER, ADC_OFF, BOD_ON);  
	
	//LowPower.powerSave(SLEEP_FOREVER, ADC_OFF, BOD_ON,TIMER2_ON);  
	//LowPower.idle(SLEEP_FOREVER, ADC_OFF,TIMER4_ON,TIMER3_ON,	TIMER1_ON, TIMER0_ON,SPI_ON,USART1_ON,TWI_ON,USB_ON);  
	//TODO supprimer après tests
	pinMode(13,OUTPUT);
	digitalWrite(13,HIGH);
	delay(25);
	digitalWrite(13,LOW);
}
