#include <EEPROM.h>
#include <Wire.h>
#include <DS3231.h>


#ifdef ATTINY
#define PIN_1 1
#define PIN_2 2
#else
#define PIN_1 12
#define PIN_2 13
#endif

#define PIN_FF 3
#define PIN_INTERRUPT 0

#define PULSE_WIDTH 400
#define PERIOD 30000
#define OFFSET_WINTER 3600
#define OFFSET_SUMMER 7200
#define OFFSET_ADDRESS 0

//positive if clock is disabled (for specified number of cycles)
//used to disable clock for 1h during winter time change
uint8_t disabled = 0;

void setup() {
	pinMode(PIN_1, OUTPUT);
	pinMode(PIN_2, OUTPUT);
	pinMode(PIN_FF,INPUT_PULLUP);
	digitalWrite(PIN_1,LOW);
	digitalWrite(PIN_2,LOW);
	//Serial.begin(115200);
}

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
	DateTime now = RTClib::now();
	uint32_t offset = adjustDstEurope(now);
	return offset;
}


void loop() {
	unsigned long t1,t2;
	//fast-forward mode
	if(digitalRead(PIN_FF)){
		do{
			pulse(PULSE_WIDTH);
			delay(400);
		}while(digitalRead(PIN_FF));
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
	delay(PERIOD-((t2-t1)));     	        
}
