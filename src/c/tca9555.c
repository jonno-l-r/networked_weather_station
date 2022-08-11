/*
 * tca9555.c
 *
 * Created: 3/08/2022 8:50:02 AM
 *  Author: Jonno
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include "tca9555.h"


uint8_t tca9555_read(uint8_t reg_addr){
	uint8_t port;
	twi_init();
	
	twi_start();
	twi_write(ADDRESS | ((uint8_t) WRITE));
	twi_write(reg_addr);
	
	twi_start();
	twi_write(ADDRESS | ((uint8_t) READ));
	
	port = twi_read_ack();
	
	twi_stop();
	return port;
}