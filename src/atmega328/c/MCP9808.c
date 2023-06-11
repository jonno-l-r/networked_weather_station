/*
 * MCP9080 I2C temperature sensor driver
 *
 * Created: 31/07/2022 5:55:27 PM
 *  Author: Jon. R
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
	twi_write(MCP_ADDRESS & ~((uint8_t) MCP_WRITE));
	twi_write(reg);
	
	twi_start();
	twi_write(MCP_ADDRESS | ((uint8_t) MCP_READ));
	upper_byte = twi_read_ack();
	lower_byte = twi_read_nack();
	
	twi_stop();
	
	return (upper_byte<<8) | lower_byte;
}


uint8_t mcp9808_get_id(void){
	return mcp9808_read(REG_ID) >> 8;
}


int16_t mcp9808_get_temperature(void){
	/*
	 * Returns a temperature reading
	 * offset by +4 bits (/16)
	 */
	uint16_t reg;
	int16_t temp;
	uint8_t sign;
	
	reg = mcp9808_read(REG_TEMP);
	sign = (reg & 0x1000) >> 12;
	temp = (int16_t)reg & 0xFFF;
	
	if (sign){
		//TA < 0°C
		return temp - (256<<4);
	}
	
	else {
		return temp;
	}
}