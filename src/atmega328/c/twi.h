/*
 * twi.h
 *
 * Created: 15/05/2022 7:35:17 PM
 *  Author: Jonno
 */ 

#ifndef TWI_H_
#define TWI_H_
#include <avr/io.h>
void twi_init(void);
void twi_start(void);
void twi_stop(void);
void twi_write(uint8_t u8data);
uint8_t twi_read_ack(void);
uint8_t twi_read_nack(void);
uint8_t twi_get_status(void);



#endif /* TWI_H_ */