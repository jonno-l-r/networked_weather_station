/*
 * sensor_api.h
 *
 * Created: 13/08/2022 11:51:27 AM
 *  Author: Jon. R
 */ 

#ifndef SENSOR_API_H_
#define SENSOR_API_H_


int api_get_bme280(char* buf, int offset, int avg);
int api_get_mcp9808(char* buf, int offset, int avg);
int api_get_all(char* buf, int avg);


#endif