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
#include "lib_twi.h"
#include "bme280.h"
#include "usart.h"
#include "twi.h"


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
int is_init = 0;
int is_error = 0;


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


uint8_t bme280_write(uint8_t reg, uint8_t byte){
	_delay_ms(10);
	return lib_twi_write_byte(BME_ADDRESS, reg, byte);
}


uint8_t bme280_read(uint8_t reg, uint8_t* byte){
	_delay_ms(10);
	return lib_twi_read_byte(BME_ADDRESS, reg, byte);
}


uint8_t bme280_burst_read(uint8_t start_reg, int len, uint8_t *data){
	_delay_ms(10);
	return lib_twi_read_bytes(BME_ADDRESS, start_reg, len, data);
}


uint8_t _bme280_wait_read(uint8_t reg, uint8_t byte, uint8_t mask, uint8_t(*test)(uint8_t b, uint8_t _b)){
	uint8_t status = 0;
	uint8_t _byte;
	
	do {
		status |= bme280_read(reg, &_byte);
		_byte &= mask;
	} while (test(_byte, byte) && (status==0));
	
	return status;
}


uint8_t _bme280_is_equal(uint8_t byte_in, uint8_t byte_test) {
	return byte_in == byte_test;
};


uint8_t _bme280_is_not_equal(uint8_t byte_in, uint8_t byte_test) {
	return byte_in != byte_test;
};


uint8_t bme280_get_compensation(void){
	uint8_t status;
	uint8_t data[26];
	
	status = bme280_burst_read(0x88, 26, data);
	
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
	
	return status;
}


uint8_t bme280_init(void){
	uint8_t status;
	
	// reset
	status = bme280_write(0xE0, 0xB6);
	status |= _bme280_wait_read(0xE0, 0, 0xFF, _bme280_is_not_equal);
	
	// Control humidity reg
	status |= bme280_write(0xF2, 0x01);
	status |= _bme280_wait_read(0xF2, 0x01, 0xFF, _bme280_is_not_equal);
	
	// Set pres. and temp. oversampling = 1x
	status |= bme280_write(0xF4, 0x24);
	status |= _bme280_wait_read(0xF4, 0x24, 0xFF, _bme280_is_not_equal);
	
	// Disable IIR filter
	status |= bme280_write(0xF5, 0x00);
	status |= _bme280_wait_read(0xF5, 0, 0xFF, _bme280_is_not_equal);
	
	// Get compensation data
	status |= _bme280_wait_read(0xF3, 1, 0x8, _bme280_is_equal);
	status |= bme280_get_compensation();
	
	if (!status) is_init = 1;
	is_error = status;
	_delay_ms(10);
	
	return status;
}


uint8_t bme280_get_measurements(int32_t *temp, uint32_t *pres, uint32_t *hum){
	uint8_t status = 0;
	uint8_t data[8];
	int32_t t_raw = 0;
	int32_t p_raw = 0;
	int32_t h_raw = 0;
	
	if (!is_init || is_error) status = bme280_init();
	
	// Trigger measurement by entering forced mode
	status |= bme280_write(0xF4, 0x26);
	status |= _bme280_wait_read(0xF3, 1, 1, _bme280_is_equal);
	
	// Get raw measurement data (0xF7 - 0xFE)
	status |= bme280_burst_read(0xF7, 8, data);
	
	p_raw = (int32_t)((((uint32_t)data[0]) << 12) | (((uint32_t)data[1]) << 4) | (((uint32_t)data[2]) >> 4));
	t_raw = (int32_t)((((uint32_t)data[3]) << 12) | (((uint32_t)data[4]) << 4) | (((uint32_t)data[5]) >> 4));
	h_raw = (int32_t)((((uint32_t)data[6]) << 8) | ((uint32_t)data[7]));
	
	// Get compensated measurements
	*temp = bme280_get_temperature(t_raw);
	*pres = bme280_get_pressure(p_raw);
	*hum = bme280_get_humidity(h_raw);
	
	is_error = status;
	
	return status;
}


uint8_t bme280_get_id(uint8_t* id){
	return bme280_read(0xD0, id);
}
