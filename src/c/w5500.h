/*
 * w5500.h
 *
 * Created: 22/05/2022 9:47:10 PM
 *  Author: Jonno
 */ 

#ifndef W5500_H_
#define W5500_H_
#include <avr/io.h>
#include "spi.h"

// Opcodes
#define WRITE 0x04 // 0xf0
#define READ 0x00 // 0x0f
#define SOCK_0 0x08

#define SOCK_0_RX_BUF 0x18
#define SOCK_0_TX_BUF 0x10

// Registers
#define MODE 0x0
#define INTERRUPT_MASK 0x16
#define GATEWAY_ADDR 0x01
#define SUBNET_MASK 0x05
#define MAC_ADDR 0x09
#define IP_ADDR 0x0F


#define RMSR 0x001A
#define TMSR 0x001B

#define S0_MR 0x00

#define S0_PORT0 0x04
#define S0_PORT1 0x05

#define S0_CR 0x01
#define S0_SR 0x03

#define S0_RX_RSR0 0x26 // upper
#define S0_RX_RSR1 0x27 // lower

#define S0_RX_RD0 0x28
#define S0_RX_RD1 0x29

#define S0_TX_FSR0 0x20
#define S0_TX_FSR1 0x21

#define S0_TX_WR0 0x24
#define S0_TX_WR1 0x25
#define S0_TX_RD0 0x22
#define S0_TX_RD0 0x23

#define S0_RXBUF_SIZE 0x1E
#define S0_TXBUF_SIZE 0x1F

// Socket states (command reg)
#define OPEN 0x01
#define LISTEN 0x02
#define CONNECT 0x04
#define DISCON 0x08
#define CLOSE 0x10
#define RECV 0x40
#define SEND 0x20

// Socket states (status reg)
#define SOCK_CLOSED 0x00
#define SOCK_ESTABLISHED 0x17
#define SOCK_INIT 0x13
#define SOCK_LISTEN 0x14
#define SOCK_CLOSE_WAIT 0x1c

#define EOT 0x04

uint8_t w5500_test(uint8_t opcode, uint8_t addr1, uint8_t addr2, uint8_t data);
uint8_t w5500_write(uint8_t opcode, uint16_t addr, uint8_t data);
void w5500_init(void);
void w5500_assign_network_addr(uint16_t base_reg_addr, uint8_t* addr, uint8_t length);
uint8_t w5500_get_status(void);
uint16_t w5500_rx_tcp_size(void);
uint16_t w5500_tcp_tx_free_size(void);
uint16_t w5500_tcp_rx_free_size(void);
uint16_t w5500_tx_tcp_size(void);

#endif /* W5500_H_ */