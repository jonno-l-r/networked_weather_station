/*
 * sensor_api.c
 *
 * Created: 13/08/2022 11:24:26 AM
 *  Author: Jonno
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include "http_server.h"
#include "bme280.h"
#include "mcp9808.h"
#include "sensor_api.h"


int api_get_bme280(char* buf, int offset, int avg){
	int32_t temp = 0;
	uint32_t pres = 0;
	uint32_t hum = 0;
	int32_t _temp;
	uint32_t _pres;
	uint32_t _hum;	
	uint8_t id;
	int i = 0;
	
	id = bme280_get_id();
	
	for (int i=0; i<avg; i++){
		bme280_get_measurements(&_temp, &_pres, &_hum);
		temp = temp + _temp;
		pres = pres + _pres;
		hum = hum + _hum;
	}
	
	i += sprintf(offset+buf+i, "[{\"id\":%d},", id);
	i += sprintf(offset+buf+i, "{\"temperature\":%ld, \"div\":%d},", temp, 100*avg);
	i += sprintf(offset+buf+i, "{\"pressure\":%lu, \"div\":%d},", pres, 256*avg);
	i += sprintf(offset+buf+i, "{\"humidity\":%lu, \"div\":%d}]", hum, 1024*avg);
		
	return i;
}


int api_get_mcp9808(char* buf, int offset, int avg){
	uint16_t temp = 0;
	uint16_t _temp;
	uint8_t id;
	int i = 0;
	
	for (int i=0; i<avg; i++){
		_temp = mcp9808_get_temperature();
		temp = temp + _temp;
	}	
	
	id = mcp9808_get_id();
	i += sprintf(offset+buf+i, "[{\"id\":%d},", id);
	i += sprintf(offset+buf+i, "{\"temperature\":%d, \"div\":%d}]", temp, 16*avg);
	
	return i;
}


int api_get_all(char* buf, int avg){
	int i = 0;
	
	i += sprintf(buf+i, "{\"BME280\" : ");
	i += api_get_bme280(buf, i, avg);
	i += sprintf(buf+i, ", \"MCP9808\" : ");
	i += api_get_mcp9808(buf, i, avg);
	i += sprintf(buf+i, "}\0");
	
	return i;
}

