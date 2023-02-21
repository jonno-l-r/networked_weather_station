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


int api_get_bme280(char* buf, int offset){
	int32_t temp;
	uint32_t pres;
	uint32_t hum;
	uint8_t id;
	int i = 0;
	
	id = bme280_get_id();
	bme280_get_measurements(&temp, &pres, &hum);
	i += sprintf(offset+buf+i, "[{\"id\":%d},", id);
	i += sprintf(offset+buf+i, "{\"temperature\":%ld, \"div\":%d},", temp, 100);
	i += sprintf(offset+buf+i, "{\"pressure\":%lu, \"div\":%d},", pres, 256);
	i += sprintf(offset+buf+i, "{\"humidity\":%lu, \"div\":%d}]", hum, 1024);
		
	return i;
}


int api_get_mcp9808(char* buf, int offset){
	uint16_t temp;
	uint8_t id;
	int i = 0;
	
	id = mcp9808_get_id();
	temp = mcp9808_get_temperature();
	i += sprintf(offset+buf+i, "[{\"id\":%d},", id);
	i += sprintf(offset+buf+i, "{\"temperature\":%d, \"div\":%d}]", temp, 16);
	
	return i;
}


int api_get_all(char* buf){
	int i = 0;
	
	i += sprintf(buf+i, "{\"BME280\" : ");
	i += api_get_bme280(buf, i);
	i += sprintf(buf+i, ", \"MCP9808\" : ");
	i += api_get_mcp9808(buf, i);
	i += sprintf(buf+i, "}\0");
	
	return i;
}

