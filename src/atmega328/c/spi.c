/*
 * Created: 18/05/2022 9:10:52 PM
 *  Author: Jon. R
 */ 

#include "spi.h"

/*
SCK: PB5
MISO: PB4
MOSI: PB3
SS: PB2
*/

void spi_init(void){
	// Enable
	PRR &= ~(1<<PRSPI);
	SPCR = (1<<SPE) | (1<<MSTR);
	
	// SPI mode
	SPCR |= (0<<CPOL) | (0<<CPHA);
	
	// sclk speed
	SPCR |= (1<<SPR0) | (1<<SPR1);
	
	SPCR |= (0<<DORD);
	
	// Set data direction (MOSI, SCLK as outputs)
	DDRB = (1<<DDB3) | (1<<DDB5) | (1<<DDB2);
	
	// Enable pullup on SS
	PORTB |= (1<<PORTB2);
}

void spi_ss (uint8_t lvl){
	if (lvl){
		PORTB |= (1<<DDB2);
	}
	else {
		PORTB &= ~(1<<DDB2);
	}
}

uint8_t spi_txrx(uint8_t data){
	SPDR = data;
	
	// Poll until transmission is complete
	while (!(SPSR & (1<<SPIF)));
	
	return SPDR;
}

void spi_write_multi(uint8_t* data, int len){
	for(int i=0; i<len; i++){
		SPDR = data[i];
		while (!(SPSR & (1<<SPIF)));
	}
}


uint8_t spi_read(void){
	while(!(SPSR & (1<<SPIF)));
	return SPDR;
}