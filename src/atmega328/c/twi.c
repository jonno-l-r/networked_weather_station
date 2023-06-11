/*
 * twi.c
 *
 * Created: 15/05/2022 4:42:18 PM
 *  Author: Jon. R
 */ 

#include "twi.h"

void twi_init(void){
	// SCL = f_cpu / (16 + 2*TWBR*prescaler)
	TWSR = 0x03; // Prescaler (bits 1:0)
	TWBR = 0x40; // SCL scaler
	
	TWCR = (1<<TWEN); // Control register (start, stop, interrupt)
}

void twi_start(void)
{
	TWCR = (1<<TWINT)|(1<<TWSTA)|(1<<TWEN); // Generate a start signal
	while ((TWCR & (1<<TWINT)) == 0);
}

void twi_stop(void)
{
	TWCR = (1<<TWINT)|(1<<TWSTO)|(1<<TWEN); // Generate stop signal
}

void twi_write(uint8_t u8data)
{
	TWDR = u8data;
	TWCR = (1<<TWINT)|(1<<TWEN);
	while ((TWCR & (1<<TWINT)) == 0);
}

uint8_t twi_read_ack(void)
{
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWEA);
	while ((TWCR & (1<<TWINT)) == 0);
	return TWDR;
}

uint8_t twi_read_nack(void)
{
	TWCR = (1<<TWINT)|(1<<TWEN);
	while ((TWCR & (1<<TWINT)) == 0);
	return TWDR;
}

uint8_t twi_get_status(void)
{
	uint8_t status;
	//mask status
	status = TWSR & 0xF8;
	return status;
}

