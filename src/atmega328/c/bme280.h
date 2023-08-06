/*
 * bme280.h
 *
 * Created: 3/08/2022 8:33:17 PM
 *  Author: Jon. R
 */ 


#ifndef BME280_H_
#define BME280_H_


#define BME_ADDRESS 0x77


uint8_t bme280_get_id(uint8_t* id);
uint8_t bme280_get_measurements(int32_t *temp, uint32_t *pres, uint32_t *hum);


#endif