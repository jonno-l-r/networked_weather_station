/*
 * twi.h
 *
 * Created: 15/05/2022 7:35:17 PM
 *  Author: Jon. R
 */ 

#ifndef TWI_H_
#define TWI_H_
#include <avr/io.h>

// TWI Status codes
// SLAW = slave write
// SLAR = slave read
#define TWSR_MASK 0xf8
#define TWSR_START 0x08
#define TWSR_LOST 0x38
#define TWSR_TX_SLAW_ACK 0x18
#define TWSR_TX_SLAW_NACK 0x20
#define TWSR_TX_DATA_ACK 0x28
#define TWSR_TX_DATA_NACK 0x38
#define TWSR_RX_RP_START 0x10
#define TWSR_RX_SLAR_ACK 0x40
#define TWSR_RX_SLAR_NACK 0x48
#define TWSR_RX_DATA_ACK 0x50
#define TWSR_RX_DATA_NACK 0x58


void twi_init(void);
void twi_start(void);
void twi_stop(void);
void twi_write(uint8_t u8data);
uint8_t twi_read_ack(void);
uint8_t twi_read_nack(void);
uint8_t twi_get_status(void);

void twi_debug(void);


#endif /* TWI_H_ */