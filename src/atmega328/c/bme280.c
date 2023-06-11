/*
 * bme280.c
 *
 * Created: 3/08/2022 8:32:53 PM
 *  Author: Jon. R
 *
 * Compensation based off the listings
 * found on pages 25 and 26 of the datasheet
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <stdint.h>
#include "twi.h"
#include "bme280.h"
#include "usart.h"


int32_t t_fine = 0;

struct compensation {
	uint16_t dig_t1;
	int16_t dig_t2;
	int16_t dig_t3;
	uint16_t dig_p1;
	int16_t dig_p2;
	int16_t dig_p3;
	int16_t dig_p4;
	int16_t dig_p5;
	int16_t dig_p6;
	int16_t dig_p7;
	int16_t dig_p8;
	int16_t dig_p9;
	uint8_t dig_h1;
	int16_t dig_h2;
	uint8_t dig_h3;
	int16_t dig_h4;
	int16_t dig_h5;
	int8_t dig_h6;
} compensation = {0};


int32_t bme280_get_temperature(int32_t t_raw){
	int32_t v1 = 0;
	int32_t v2 = 0;
	int32_t T = 0;
	
	v1 = (((t_raw>>3) - ((int32_t)compensation.dig_t1<<1))) * ((int32_t)compensation.dig_t2) >> 11;
	v2 = (((((t_raw>>4) - ((int32_t)compensation.dig_t1)) * ((t_raw>>4) - ((int32_t)compensation.dig_t1))) >> 12) * ((int32_t)compensation.dig_t3)) >> 14;
	t_fine = v1 + v2;
	T = (t_fine * 5 + 128) >> 8;

	return T;
}


uint32_t bme280_get_pressure(int32_t p_raw){
	int64_t v1;
	int64_t v2;
	int64_t P;
	
	v1 = (int64_t)t_fine - 128000;
	v2 = v1*v1 * (int64_t)compensation.dig_p6;
	v2 = v2 + ((v1*(int64_t)compensation.dig_p5) << 17);
	v2 = v2 + (((int64_t)compensation.dig_p4) << 35);
	v1 = ((v1*v1 * (int64_t)compensation.dig_p3) >> 8) + ((v1 * (int64_t)compensation.dig_p2) << 12);
	v1 = (((((int64_t)1) << 47) + v1)) * ((int64_t)compensation.dig_p1) >> 33;
	
	if(v1 == 0){
		return 0;
	}

	P = 1048576 - p_raw;
	P = (((P << 31) - v2)*3125) / v1;
	v1 = (((int64_t)compensation.dig_p9) * (P>>13) * (P>>13)) >> 25;
	v2 = (((int64_t)compensation.dig_p8) * P) >> 19;
	P = ((P + v1 + v2) >> 8) + (((int64_t)compensation.dig_p7) << 4);
	
	return (uint32_t)P;
}


uint32_t bme280_get_humidity(int32_t h_raw){
	int32_t v1;
	v1 = (t_fine - ((int32_t)76800));

	v1 = (((((h_raw << 14) - (((int32_t)compensation.dig_h4) << 20) - \
		(((int32_t)compensation.dig_h5) * v1)) + ((int32_t)16384)) >> 15) * \
		(((((((v1 * ((int32_t)compensation.dig_h6)) >> 10) * \
		(((v1 * ((int32_t)compensation.dig_h3)) >> 11) + ((int32_t)32768))) >> 10) + \
		((int32_t)2097152)) * ((int32_t)compensation.dig_h2) +8192) >> 14));
	
	v1 = (v1 - (((((v1 >> 15) * (v1 >> 15)) >> 7) *\
		((int32_t)compensation.dig_h1)) >> 4));
		
	v1 = (v1 < 0 ? 0 : v1);
	v1 = (v1 > 419430400 ? 419430400 : v1);
	
	return (uint32_t)(v1>>12);
}


void bme280_write(uint8_t reg, uint8_t data){
	twi_init();
	
	twi_start();
	
	twi_write(((uint8_t) BME_ADDRESS) | ((uint8_t) BME_WRITE));
	twi_write(reg);
	twi_write(data);
	
	twi_stop();
}


uint16_t bme280_read(uint8_t reg){
	uint8_t byte;
	
	twi_init();
	
	twi_start();
	twi_write(((uint8_t) BME_ADDRESS) | ((uint8_t) BME_WRITE));
	twi_write(reg);
	
	twi_start();
	twi_write(BME_ADDRESS | ((uint8_t) BME_READ));
	byte = twi_read_nack();
	
	twi_stop();
	
	return byte;
}


void bme280_burst_read(uint8_t start_reg, int len, uint8_t *data){
	twi_init();
	
	twi_start();
	twi_write(((uint8_t) BME_ADDRESS) | ((uint8_t) BME_WRITE));
	twi_write(start_reg);
	
	twi_start();
	twi_write(BME_ADDRESS | ((uint8_t) BME_READ));
	
	for (int i=0; i<len-1; i++){
		data[i] = twi_read_ack();
	}
	data[len-1] = twi_read_nack();
	
	twi_stop();
}


void bme280_get_compensation(void){
	uint8_t data[26];
	bme280_burst_read(0x88, 26, data);
	
	compensation.dig_t1 = (((uint16_t)data[1]) << 8) | ((uint16_t)data[0]);
	compensation.dig_t2 = (int16_t) ((((uint16_t)data[3]) << 8) | ((uint16_t)data[2]));
	compensation.dig_t3 = (int16_t) ((((uint16_t)data[5]) << 8) | ((uint16_t)data[4]));
	
	compensation.dig_p1 = (((uint16_t)data[7]) << 8) | ((uint16_t)data[6]);
	compensation.dig_p2 = (int16_t) ((((uint16_t)data[9]) << 8) | ((uint16_t)data[8]));
	compensation.dig_p3 = (int16_t) ((((uint16_t)data[11]) << 8) | ((uint16_t)data[10]));
	compensation.dig_p4 = (int16_t) ((((uint16_t)data[13]) << 8) | ((uint16_t)data[12]));
	compensation.dig_p5 = (int16_t) ((((uint16_t)data[15]) << 8) | ((uint16_t)data[14]));
	compensation.dig_p6 = (int16_t) ((((uint16_t)data[17]) << 8) | ((uint16_t)data[16]));
	compensation.dig_p7 = (int16_t) ((((uint16_t)data[19]) << 8) | ((uint16_t)data[18]));
	compensation.dig_p8 = (int16_t) ((((uint16_t)data[21]) << 8) | ((uint16_t)data[20]));
	compensation.dig_p9 = (int16_t) ((((uint16_t)data[23]) << 8) | ((uint16_t)data[22]));
	
	compensation.dig_h1 = (uint8_t) data[25];
	
	bme280_burst_read(0xE1, 6, data);
	compensation.dig_h2 = (int16_t) ((((uint16_t)data[1]) << 8) | ((uint16_t)data[0]));
	compensation.dig_h3 = (uint8_t) data[2];
	compensation.dig_h4 = (int16_t) (((uint16_t)data[3]) << 4) | ((uint8_t)data[4] & 0x0F);
	compensation.dig_h5 = (int16_t) (((uint16_t)data[5]) << 4) | ((uint8_t)data[4] & 0xF0);
	compensation.dig_h6 = (int8_t)data[6];
}


void bme280_get_measurements(int32_t *temp, uint32_t *pres, uint32_t *hum){
	uint8_t data[8];
	// uint16_t status = 0;
	int32_t t_raw = 0;
	int32_t p_raw = 0;
	int32_t h_raw = 0;
	
	// reset
	bme280_write(0xE0, 0xB6);
	while (bme280_read(0xE0) != 0);
	
	// Control humidity reg
	bme280_write(0xF2, 0x01);
	while (bme280_read(0xF2) != 0x01);
	
	// Set pres. and temp. oversampling = 1x
	bme280_write(0xF4, 0x24);
	while (bme280_read(0xF4) != 0x24);
	
	// Disable IIR filter
	bme280_write(0xF5, 0x00);
	while (bme280_read(0xF5) != 0);
	
	// Get compensation data
	while (bme280_read(0xF3) & 8);
	bme280_get_compensation();
	
	
	// Trigger measurement by entering forced mode
	bme280_write(0xF4, 0x26);
	while (bme280_read(0xF3) & 1);
	
	// Get raw measurement data (0xF7 - 0xFE)
	bme280_burst_read(0xF7, 8, data);
	
	p_raw = (int32_t)((((uint32_t)data[0]) << 12) | (((uint32_t)data[1]) << 4) | (((uint32_t)data[2]) >> 4));
	t_raw = (int32_t)((((uint32_t)data[3]) << 12) | (((uint32_t)data[4]) << 4) | (((uint32_t)data[5]) >> 4));
	h_raw = (int32_t)((((uint32_t)data[6]) << 8) | ((uint32_t)data[7]));
	
	// Get compensated measurements
	*temp = bme280_get_temperature(t_raw);
	*pres = bme280_get_pressure(p_raw);
	*hum = bme280_get_humidity(h_raw);
}


uint8_t bme280_get_id(void){
	return bme280_read(0xD0);
}
