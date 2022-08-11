/*
 * MCP9080 I2C temperature sensor driver
 *
 * Created: 31/07/2022 5:55:27 PM
 *  Author: Jonno
 */ 


#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include "twi.h"
#include "MCP9808.h"
#include "usart.h"


uint16_t mcp9808_read(uint8_t reg){
	uint8_t upper_byte;
	uint8_t lower_byte;
	
	twi_init();
	
	twi_start();
	twi_write(ADDRESS & ~((uint8_t) WRITE));
	twi_write(reg);
	
	twi_start();
	twi_write(ADDRESS | ((uint8_t) READ));
	upper_byte = twi_read_ack();
	lower_byte = twi_read_nack();
	
	twi_stop();
	
	return (upper_byte<<8) | lower_byte;
}


uint8_t mcp9808_get_id(void){
	return mcp9808_read(REG_ID) >> 8;
}


uint16_t mcp9808_get_temperature(void){
	/*
	 * Returns a temperature reading
	 * offset by +4 bits (/16)
	 */
	
	uint16_t temperature = mcp9808_read(REG_TEMP);
	uint8_t error = (temperature & 0xE000) >> 8;
	uint8_t sign = (temperature & 0x1000) >> 8;
	temperature = temperature & 0xFFF;
	
	if (sign){
		//TA < 0°C
		temperature = (256<<8) - temperature;
	}
	
	return temperature;
}