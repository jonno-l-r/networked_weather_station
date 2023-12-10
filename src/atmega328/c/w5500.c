/*
 * w5500.c
 *
 * Created: 22/05/2022 11:03:47 AM
 *  Author: Jon. R
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include "spi.h"
#include "w5500.h"
// #include "usart.h"

// SPI control
uint8_t _get_socket_BSB(uint8_t socket, uint8_t mode){
	return ((socket*4) + mode) << BSB_BIT_OFFSET;
}


uint8_t _w5500_spi_n(uint8_t write, uint8_t bsb, uint16_t addr, uint8_t* data, int len){
	uint8_t addr1 = (uint8_t)(addr >> 8);
	uint8_t addr2 = (uint8_t)(addr & 0xff);
	uint8_t error = 0;
	
	spi_set_chip_select(0);
	spi_write(addr1);
	error |= spi_collision();
	spi_write(addr2);
	error |= spi_collision();
	spi_write(write | bsb);
	error |= spi_collision();
	
	for (int i=0; i<len; i++) {
		if (write) {
			spi_write(data[i]);
		}
		else {
			data[i] = spi_read();
		}
		error |= spi_collision();
	}
	spi_set_chip_select(1);
	
	return error;
}


uint8_t w5500_write_n(uint8_t socket, uint8_t mode, uint16_t addr, uint8_t* data_tx, int len){
	return _w5500_spi_n(W5500_WRITE, _get_socket_BSB(socket, mode), addr, data_tx, len);
}


uint8_t w5500_read_n(uint8_t socket, uint8_t mode, uint16_t addr, uint8_t* data_rx, int len){
	return _w5500_spi_n(W5500_READ, _get_socket_BSB(socket, mode), addr, data_rx, len);
}


uint8_t w5500_write_byte(uint8_t socket, uint8_t mode, uint16_t addr, uint8_t byte){
	uint8_t* _byte = &byte;
	return w5500_write_n(socket, mode, addr, _byte, 1);
}


uint8_t w5500_init(void){
	spi_init();
	return w5500_write_byte(0, COMMON, MODE, 0x80);
}


uint8_t w5500_get_status(int socket){
	uint8_t status;
	w5500_read_n(socket, SOCK_n, S0_SR, &status, 1);
	
	return status;
}


void w5500_set_command(int socket, uint8_t cmd){
	uint8_t _cmd = cmd;
	w5500_write_byte(socket, SOCK_n, S0_CR, cmd);
	
	while (_cmd != 0) {
		w5500_read_n(socket, SOCK_n, S0_CR, &_cmd, 1);
	}
}


void w5500_tcp_init(int socket, uint16_t source_port){
	uint8_t _source_port[] = {
		(uint8_t)(source_port >> 8), 
		(uint8_t)(source_port & 0xff)
	};
	
	// Enable TCP and write source port
	w5500_write_byte(socket, SOCK_n, S0_MR, 0x01);
	w5500_write_n(socket, SOCK_n, S0_PORT0, _source_port, 2);
}


void w5500_rx_set_size(int socket, uint8_t size){
	w5500_write_byte(socket, SOCK_n, S0_RXBUF_SIZE, size);
}


uint16_t w5500_rx_rsr(int socket){
	uint8_t size[2];
	w5500_read_n(socket, SOCK_n, S0_RX_RSR0, size, 2);
	
	return (((uint16_t) size[0]) << 8) | ((uint16_t) size[1]);
}


uint16_t w5500_rx_size(int socket){
	uint8_t reg;
	w5500_read_n(socket, SOCK_n, S0_RXBUF_SIZE, &reg, 1);
	
	return ((uint16_t) reg) * 0x400;
}


void w5500_tx_set_size(int socket, uint8_t size){
	w5500_write_byte(socket, SOCK_n, S0_TXBUF_SIZE, size);
}


uint16_t w5500_tx_fsr(int socket){
	uint8_t size[2];
	w5500_read_n(socket, SOCK_n, S0_TX_FSR0, size, 2);
	
	return (((uint16_t) size[0]) << 8) | ((uint16_t) size[1]);
}


uint16_t w5500_tx_size(int socket){
	uint8_t reg;
	w5500_read_n(socket, SOCK_n, S0_TXBUF_SIZE, &reg, 1);
	
	return ((uint16_t) reg) * 0x400;
}


uint16_t w5500_tcp_rx(int socket, uint8_t* buffer, uint16_t buffer_size) {
	uint8_t _rx_pt[2];
	uint16_t rx_pt = 0;
	uint16_t rx_size = w5500_rx_rsr(socket);
	uint16_t read_size;
	uint16_t buffer_pt = 0;
	uint16_t buffer_remain = buffer_size;
	
	while((rx_size > 0) && buffer_remain) {
		w5500_read_n(socket, SOCK_n, S0_RX_RD0, _rx_pt, 2);
		rx_pt = ((uint16_t)_rx_pt[0] << 8) | ((uint16_t)_rx_pt[1]);
		read_size = rx_size>buffer_remain ? buffer_remain : rx_size;
		
		w5500_read_n(socket, SOCK_n_RX_BUF, rx_pt, buffer+buffer_pt, read_size);
		buffer_pt += read_size;
		rx_pt += read_size;
		buffer_remain -= read_size;
		
		w5500_write_byte(socket, SOCK_n, S0_RX_RD0, (rx_pt >> 8));
		w5500_write_byte(socket, SOCK_n, S0_RX_RD1, (rx_pt & 0xff));
		w5500_set_command(socket, RECV);
		
		rx_size = w5500_rx_rsr(socket);
		}
		
	return buffer_pt;
}


void w5500_tcp_tx(int socket, uint8_t* data, uint16_t data_size){
	uint16_t free_size = w5500_tx_fsr(socket);
	uint8_t _write_pt[2];
	uint16_t write_pt = 0;
	uint8_t offset = 0;
	
	do {
		w5500_read_n(socket, SOCK_n, S0_TX_WR0, _write_pt, 2);
		write_pt = ((uint16_t)_write_pt[0] << 8) | ((uint16_t)_write_pt[1]);
	
		w5500_write_n(socket, SOCK_n_TX_BUF, write_pt, data+offset,
						data_size>free_size? free_size : data_size);
	
		offset += free_size;
		write_pt += data_size;
		data_size -= free_size;
		
		uint8_t size_upper = (uint8_t) (write_pt >> 8);
		uint8_t size_lower = (uint8_t) (write_pt & 0xff);
		w5500_write_byte(socket, SOCK_n, S0_TX_WR0, size_upper);
		w5500_write_byte(socket, SOCK_n, S0_TX_WR1, size_lower);
	
		free_size = w5500_tx_fsr(socket);
		w5500_set_command(socket, SEND);
	} while(free_size == 0);
}


uint8_t w5500_assign_network_addr(uint16_t addr_reg, uint8_t* addr, uint8_t length){	
	return w5500_write_n(0, COMMON, addr_reg, addr, length);
}