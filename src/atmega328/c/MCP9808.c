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
#include "lib_twi.h"
#include "MCP9808.h"
#include "usart.h"


uint8_t mcp9808_read(uint8_t reg, uint16_t* val){
	uint8_t data[2];
	uint8_t status;
	
	status = lib_twi_read_bytes(MCP_ADDRESS, reg, 2, data);
	
	if (!status) {
		*val = (data[0]<<8) | data[1];	
	}
	
	return status;
}


uint8_t mcp9808_get_id(uint16_t* id){
	return mcp9808_read(REG_ID, id);
}


uint8_t mcp9808_get_temperature(int16_t* temperature){
	/*
	 * Returns a temperature reading
	 * offset by +4 bits (/16)
	 */
	uint16_t reg;
	int16_t temp;
	uint8_t sign;
	uint8_t status;
	
	status = mcp9808_read(REG_TEMP, &reg);
	
	if (!status){
		sign = (reg & 0x1000) >> 12;
		temp = (int16_t)reg & 0xFFF;
		
		// T < 0°C if sign
		*temperature = sign ? temp - (256<<4) : temp;
	}

	return status;
}