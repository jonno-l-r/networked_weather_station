/*
 * bme280.h
 *
 * Created: 3/08/2022 8:33:17 PM
 *  Author: Jonno
 */ 


#ifndef BME280_H_
#define BME280_H_


#define ADDRESS 0xEE

// OP codes
#define READ 0x1
#define WRITE 0x0

uint8_t bme280_get_id(void);
void bme280_get_measurements(int32_t *temp, uint32_t *pres, uint32_t *hum);


#endif