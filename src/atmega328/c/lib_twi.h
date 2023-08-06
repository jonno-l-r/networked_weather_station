/*
 * lib_twi.h
 *
 * Created: 6/08/2023 12:24:13 PM
 *  Author: J. Rabe
 */ 


#ifndef _LIB_TWI_H
#define _LIB_TWI_H


#define LIB_TWI_READ 1
#define LIB_TWI_WRITE 0


uint8_t lib_twi_read_byte(uint8_t dev, uint8_t reg, uint8_t* byte);
uint8_t lib_twi_read_bytes(uint8_t dev, uint8_t reg_0, uint8_t len, uint8_t *data);
uint8_t lib_twi_write_byte(uint8_t dev, uint8_t reg, uint8_t byte);
uint8_t lib_twi_write_bytes(uint8_t dev, uint8_t reg_0, uint8_t len, uint8_t *data);

#endif