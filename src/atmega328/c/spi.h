/*
 * spi.h
 *
 * Created: 18/05/2022 9:27:25 PM
 *  Author: Jon. R
 */ 

#ifndef SPI_H_
#define SPI_H_
#include <avr/io.h>


void spi_init(void);
void spi_set_chip_select(uint8_t level);
void spi_write(uint8_t byte);
uint8_t spi_read(void);
uint8_t spi_collision(void);


#endif /* SPI_H_ */