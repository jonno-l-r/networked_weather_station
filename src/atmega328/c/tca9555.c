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
#include "twi.h"


uint8_t tca9555_write(uint8_t reg_addr, uint8_t val){
	
}


uint8_t tca9555_read(uint8_t reg_addr){
	uint8_t port;
	twi_init();
	
	twi_start();
	twi_write(TCA_ADDRESS | ((uint8_t) WRITE));
	twi_write(reg_addr);
	
	twi_start();
	twi_write(TCA_ADDRESS | ((uint8_t) READ));
	
	port = twi_read_ack();
	
	twi_stop();
	return port;
}


/*
 * TCA9555 driver API
 */

void tca9555_configure(uint8_t config){

}


uint8_t tca9555_read_port(uint8_t port){
	uint8_t val;
	return val;
}


void tca9555_write_port(uint8_t port){
	
}
