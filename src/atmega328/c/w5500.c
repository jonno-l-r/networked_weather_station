/*
 * w5500.c
 *
 * Created: 22/05/2022 11:03:47 AM
 *  Author: Jonno
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include "spi.h"
#include "w5500.h"
#include "usart.h"


uint8_t w5500_write(uint8_t opcode, uint16_t addr, uint8_t data){
	uint8_t addr1 = (uint8_t)(addr >> 8);
	uint8_t addr2 = (uint8_t)(addr & 0xff);
	uint8_t data_rx;
	
	spi_ss(0);
	spi_txrx(addr1);
	spi_txrx(addr2);
	spi_txrx(opcode);
	data_rx = spi_txrx(data);
	spi_ss(1);
	
	return data_rx;
}


void w5500_init(void){
	spi_init();
	w5500_write(WRITE, MODE, 0x80);
}


uint8_t get_socket_BSB(uint8_t socket, uint8_t mode){
	return ((socket*4) + mode) << BSB_BIT_OFFSET;
}


uint8_t w5500_get_status(int socket){
	return (uint8_t) w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_SR, 0x0);
}


void w5500_set_command(int socket, uint8_t cmd){
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_CR, cmd);
}


void w5500_tcp_init(int socket, uint16_t source_port){
	// Enable TCP
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_MR, 0x01);
		
	// Source port
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_PORT0, (uint8_t)(source_port >> 8));
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_PORT1, (uint8_t)(source_port & 0xff));
}


void w5500_rx_set_size(int socket, int size){
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_RXBUF_SIZE, size);
}


uint16_t w5500_rx_rsr(int socket){
	uint16_t size = 0x0;
	uint8_t size_upper = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_RX_RSR0, 0x0);
	uint8_t size_lower = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_RX_RSR1, 0x0);
	size = ((uint16_t) size_upper) << 8;
	size |= (uint16_t) size_lower;
	
	return size;
}


uint16_t w5500_rx_size(int socket){
	uint8_t reg = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_RXBUF_SIZE, 0x0);
	switch(reg){
		case 0: return 0;
		case 1: return 0x400;
		case 2: return 0x800;
		case 4: return 0x1000;
		case 8: return 0x2000;
		case 16: return 0x4000;
	}
}


void w5500_tx_set_size(int socket, int size){
	w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_TXBUF_SIZE, size);
}


uint16_t w5500_tx_fsr(int socket){
	uint16_t size = 0x0;
	uint8_t size_upper = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_TX_FSR0, 0x0);
	uint8_t size_lower = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_TX_FSR1, 0x0);
	size = ((uint16_t) size_upper) << 8;
	size |= (uint16_t) size_lower;
	
	return size;
}


uint16_t w5500_tx_size(int socket){
	uint8_t reg = w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_TXBUF_SIZE, 0x0);
	switch(reg){
		case 0: return 0;
		case 1: return 0x400;
		case 2: return 0x800;
		case 4: return 0x1000;
		case 8: return 0x2000;
		case 16: return 0x4000;
	}
}


int w5500_tcp_rx(int socket, uint8_t* data){
	uint16_t read_pt = 0;
	int read_size = w5500_rx_rsr(socket);
	uint16_t sock_size = w5500_rx_size(socket);
	int offset = 0;
	int i;

	do {
		read_pt = ((uint16_t)w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_RX_RD0, 0x0)) << 8;
		read_pt |= (uint16_t)w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_RX_RD1, 0x0);
		
		for(i=0; i<read_size; i++){
			data[offset+i] = w5500_write(READ | get_socket_BSB(socket, SOCK_n_RX_BUF), i, 0x0);
			// printf("%c", w5500_write(READ | get_socket_BSB(socket, SOCK_n_RX_BUF), i, 0x0));
		}
		offset += i;
		read_pt += i;
		uint8_t size_upper = (uint8_t) (read_pt >> 8);
		uint8_t size_lower = (uint8_t) (read_pt & 0xff);
		w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_RX_RD0, size_upper);
		w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_RX_RD1, size_lower);
		
		read_size = w5500_rx_rsr(socket);
		w5500_set_command(socket, RECV);
	} while(read_size > 0);
	
	return offset;
}


void w5500_tcp_tx(int socket, char* data, int data_size){
	uint16_t free_size = w5500_tx_fsr(socket);
	uint16_t sock_size = w5500_tx_size(socket);
	uint16_t write_pt = 0;
	int offset = 0;
	
	do {
		// write buffer cleared after send
		write_pt = ((uint16_t) w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_TX_WR0, 0x0)) << 8;
		write_pt |= (uint16_t) w5500_write(READ | get_socket_BSB(socket, SOCK_n), S0_TX_WR1, 0x0);
	
		for(int i=0; i<(data_size>free_size ? free_size : data_size); i++){
			w5500_write(WRITE | get_socket_BSB(socket, SOCK_n_TX_BUF), write_pt+i, data[offset+i]);
		}
	
		offset += free_size;
		write_pt += data_size;
		data_size -= free_size;
		uint8_t size_upper = (uint8_t) (write_pt >> 8);
		uint8_t size_lower = (uint8_t) (write_pt & 0xff);
		w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_TX_WR0, size_upper);
		w5500_write(WRITE | get_socket_BSB(socket, SOCK_n), S0_TX_WR1, size_lower);
	
		free_size = w5500_tx_fsr(socket);
		w5500_set_command(socket, SEND);
	} while(free_size == 0);
}


void w5500_assign_network_addr(uint16_t base_reg_addr, uint8_t* addr, uint8_t length){
	for (uint8_t i=0; i<length; i++){
		w5500_write(WRITE, base_reg_addr+i, addr[i]);
	}
}