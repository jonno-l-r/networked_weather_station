/*
 * Created: 18/05/2022 9:10:52 PM
 *  Author: Jon. R
 */ 

#include <util/delay.h>
#include "spi.h"
// #include "usart.h"

/*
SCK: PB5
MISO: PB4
MOSI: PB3
SS: PB2
*/

void spi_init(void){
	uint8_t mode = 0;
	
	// Set data direction (MOSI, SCLK as outputs)
	// (must be before enable bit is set)
	DDRB = (1<<DDB3) | (1<<DDB5) | (1<<DDB2);
	
	// Enable pullup on SS
	//PORTB |= (1<<PORTB2);
	
	// Enable
	PRR &= ~(1<<PRSPI);
	SPCR = (1<<SPE) | (1<<MSTR);
	
	// SPI mode
	SPCR |= ((mode & 1) << CPOL) | ((mode & 2) << CPHA);
	
	// sclk speed
	SPCR |= (1<<SPR0) | (1<<SPR1);
	
	SPCR |= (0<<DORD);
}


void spi_set_chip_select(uint8_t level){
	if (level){
		//_delay_ms(1);
		PORTB |= (1<<DDB2);
	}
	else {
		PORTB &= ~(1<<DDB2);
		//_delay_ms(1);
	}
}


void spi_write(uint8_t byte){
	// Poll until transmission is complete
	SPDR = byte;
	while (!(SPSR & (1<<SPIF)));
}


uint8_t spi_read(void){
	SPDR = 0;
	
	while (!(SPSR & (1<<SPIF)));
	
	return SPDR;
}


uint8_t spi_collision(void){
	return (SPSR & (1<<WCOL));
}