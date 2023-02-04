/*
 * spi.h
 *
 * Created: 18/05/2022 9:27:25 PM
 *  Author: Jonno
 */ 

#ifndef SPI_H_
#define SPI_H_
#include <avr/io.h>

void spi_init(void);
void spi_ss(uint8_t);
uint8_t spi_txrx(uint8_t data);

void spi_write_multi(uint8_t* data, int len);
uint8_t spi_read(void);

#endif /* SPI_H_ */