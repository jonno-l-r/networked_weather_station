/*
 * w5500.h
 *
 * Created: 22/05/2022 9:47:10 PM
 *  Author: Jon. R
 */ 

#ifndef W5500_H_
#define W5500_H_

/*
 * Control byte components
 * Address sequence is
 * addr_upper, addr_lower, control
 */
// Operation modes (control 2:0)
// (bit 2: R/W, bits 1:0: spi operation mode) 
#define W5500_WRITE 0x04
#define W5500_READ 0x00

// Block select bit offset
#define SOCKET_BIT_OFFSET 0x5
#define BSB_BIT_OFFSET 0x3
#define RW_BIT_OFFSET 0x2

// Control register: block select bits (control 4:3)
#define COMMON 0x00
#define SOCK_n 0x01
#define SOCK_n_RX_BUF 0x3
#define SOCK_n_TX_BUF 0x2


// Common registers 
// (see datasheet section 3.1)
#define MODE 0x0
#define INTERRUPT_MASK 0x16
#define GATEWAY_ADDR 0x01
#define SUBNET_MASK 0x05
#define MAC_ADDR 0x09
#define IP_ADDR 0x0F
#define RMSR 0x001A
#define TMSR 0x001B

// Socket registers
#define S0_MR 0x00

#define S0_PORT0 0x04
#define S0_PORT1 0x05

#define S0_RX_RSR0 0x26 // upper
#define S0_RX_RSR1 0x27 // lower
#define S0_RX_RD0 0x28
#define S0_RX_RD1 0x29
#define S0_RX_WR0 0x2A
#define S0_RX_WR1 0x2B

#define S0_TX_FSR0 0x20
#define S0_TX_FSR1 0x21
#define S0_TX_WR0 0x24
#define S0_TX_WR1 0x25
#define S0_TX_RD0 0x22
#define S0_TX_RD1 0x23

#define S0_RXBUF_SIZE 0x1E
#define S0_TXBUF_SIZE 0x1F

// Socket command register values (Sn_CR)
#define S0_CR 0x01
#define OPEN 0x01
#define LISTEN 0x02
#define CONNECT 0x04
#define DISCON 0x08
#define CLOSE 0x10
#define RECV 0x40
#define SEND 0x20

// Socket state register values (Sn_SR)
#define S0_SR 0x03
#define SOCK_CLOSED 0x00
#define SOCK_ESTABLISHED 0x17
#define SOCK_INIT 0x13
#define SOCK_LISTEN 0x14
#define SOCK_CLOSE_WAIT 0x1c

#define EOT 0x04


uint8_t w5500_write(uint8_t opcode, uint16_t addr, uint8_t data);
uint8_t w5500_init(void);
uint8_t get_socket_BSB(uint8_t socket, uint8_t mode);
uint8_t w5500_get_status(int socket);
void w5500_set_command(int socket, uint8_t cmd);
void w5500_tcp_init(int socket, uint16_t source_port);
void w5500_rx_set_size(int socket, uint8_t size);
uint16_t w5500_rx_rsr(int socket);
uint16_t w5500_rx_size(int socket);
void w5500_tx_set_size(int socket, uint8_t size);
uint16_t w5500_tx_fsr(int socket);
uint16_t w5500_tx_size(int socket);
uint16_t w5500_tcp_rx(int socket, uint8_t* buffer, uint16_t buffer_size);
void w5500_tcp_tx(int socket, uint8_t* data, uint16_t data_size);
uint8_t w5500_assign_network_addr(uint16_t base_reg_addr, uint8_t* addr, uint8_t length);


#endif /* W5500_H_ */