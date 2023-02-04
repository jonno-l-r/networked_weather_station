/*
 * pcf8574.c
 *
 * Created: 2/08/2022 8:48:15 AM
 *  Author: Jonno
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include "pcf8574.h"
#include "twi.h"


uint8_t pcf8574_read(void){
	uint8_t port;
	twi_init();
	
	twi_start();
	twi_write(ADDRESS | ((uint8_t) READ));
	
	port = twi_read_ack();
	
	twi_stop();
	return port;
}