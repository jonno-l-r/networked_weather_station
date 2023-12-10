/*
 * sensor_api.c
 *
 * Created: 13/08/2022 11:24:26 AM
 *  Author: Jon. R
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <util/delay.h>
#include "http_server.h"
#include "bme280.h"
#include "mcp9808.h"
#include "sensor_api.h"


int api_get_bme280(char* buf, int offset, int avg){
	uint8_t success = 0;
	int32_t temp = 0;
	uint32_t pres = 0;
	uint32_t hum = 0;
	int32_t _temp;
	uint32_t _pres;
	uint32_t _hum;	
	uint8_t id;
	int i = 0;
	
	for (int i=0; i<avg; i++){
		success = !bme280_get_measurements(&_temp, &_pres, &_hum);
		
		if (!success) break;
		
		temp += _temp;
		pres += _pres;
		hum += _hum;
	}
	
	if (success) {
		success = !bme280_get_id(&id);
	}
	
	i += sprintf(offset+buf+i, "{\"id\":%d,", id);
	i += sprintf(offset+buf+i, "\"success\":%d,", success);
	i += sprintf(offset+buf+i, "\"temperature\":{\"data\":%d, \"div\":%d},", (int16_t)temp, 100*avg);
	i += sprintf(offset+buf+i, "\"pressure\":{\"data\":%lu, \"div\":%d},", pres, 256*avg);
	i += sprintf(offset+buf+i, "\"humidity\":{\"data\":%lu, \"div\":%d}}", hum, 1024*avg);
		
	return i;
}


int api_get_mcp9808(char* buf, int offset, int avg){
	int16_t temp = 0;
	int16_t _temp;
	uint16_t id = 0;
	uint8_t success = 0;
	int i = 0;
	
	for (int i=0; i<avg; i++){
		success = !mcp9808_get_temperature(&_temp);
		
		if (!success) break;
		
		temp += _temp;
		_delay_ms(50);
	}
	
	if (success){
		success = !mcp9808_get_id(&id);
	}
	
	i += sprintf(offset+buf+i, "{\"id\":%d,", id);
	i += sprintf(offset+buf+i, "\"success\":%d,", success);
	i += sprintf(offset+buf+i, "\"temperature\":{\"data\":%d, \"div\":%d}}", temp, 16*avg);
	
	return i;
}


int api_get_all(char* buf, int avg){
	int i = 0;
	
	i += sprintf(buf+i, "{\"BME280\" : ");
	i += api_get_bme280(buf, i, avg);
	i += sprintf(buf+i, ", \"MCP9808\" : ");
	i += api_get_mcp9808(buf, i, avg);
	
	// Need a double null termination
    // here, hence the warning...
	i += sprintf(buf+i, "}\0");
	
	return i;
}

