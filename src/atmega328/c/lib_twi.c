/*
 * lib_twi.c
 *
 * Library functions for interacting with
 * TWI serial devices in the 
 * master TX / RX modes
 *
 * Created: 6/08/2023 12:23:49 PM
 *  Author: J. Rabe
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <stdint.h>
#include "lib_twi.h"
#include "twi.h"
#include "usart.h"


uint8_t lib_twi_read_bytes(uint8_t dev, uint8_t reg_0, uint8_t len, uint8_t *data) {
	uint8_t status;
	int i = 0;
	
	twi_init();
	twi_start();
	status = twi_get_status();
	
	if (status == TWSR_START){
		twi_write((dev << 1) & ~((uint8_t) LIB_TWI_WRITE));
		status = twi_get_status();
	}
	
	if (status == TWSR_TX_SLAW_ACK) {
		twi_write(reg_0);
		status = twi_get_status();
	}
	
	if (status == TWSR_TX_DATA_ACK){
		twi_start();
		status = twi_get_status();
	}
	
	if (status == TWSR_RX_RP_START){
		twi_write((dev << 1) | ((uint8_t) LIB_TWI_READ));
		status = twi_get_status();
	}
	
	if ((status==TWSR_RX_SLAR_ACK) && (len>1)){
		do {
			data[i] = twi_read_ack();
			status = twi_get_status();
			i++;
		} while ((status==TWSR_RX_DATA_ACK) && (i<(len-1)));
	}
	
	if ((status==TWSR_RX_DATA_ACK) || (status==TWSR_RX_SLAR_ACK)){
		data[len-1] = twi_read_nack();
		status = twi_get_status();
	}
	
	twi_stop();
	return status != TWSR_RX_DATA_NACK;
}


uint8_t lib_twi_write_bytes(uint8_t dev, uint8_t reg_0, uint8_t len, uint8_t* data) {
	uint8_t status;
	int i = 0;
	
	twi_init();
	twi_start();
	status = twi_get_status();
	
	if (status == TWSR_START){
		twi_write((dev << 1) | ((uint8_t) LIB_TWI_WRITE));
		status = twi_get_status();
	}
	
	if (status == TWSR_TX_SLAW_ACK){
		twi_write(reg_0);
		status = twi_get_status();
	}
	
	if ((status==TWSR_TX_DATA_ACK) && len>1){
		do {
			twi_write(data[i]);
			status = twi_get_status();
			i++;
		} while ((status==TWSR_TX_DATA_ACK) && (i<(len-1)));
	}
	
	if (status == TWSR_TX_DATA_ACK) {
		twi_write(data[len-1]);
		status = twi_get_status();
	}
		
	twi_stop();
	return !((status==TWSR_TX_DATA_NACK) || (status==TWSR_TX_DATA_ACK));
}


uint8_t lib_twi_read_byte(uint8_t dev, uint8_t reg, uint8_t *byte) {
	return lib_twi_read_bytes(dev, reg, 1, byte);
}


uint8_t lib_twi_write_byte(uint8_t dev, uint8_t reg, uint8_t byte) {
	return lib_twi_write_bytes(dev, reg, 1, &byte);
}
