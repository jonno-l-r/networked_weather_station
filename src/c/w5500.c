/*
 * w5500.c
 *
 * Created: 22/05/2022 11:03:47 AM
 *  Author: Jonno
 */ 

#include "spi.h"
#include "w5500.h"
#include <util/delay.h>
#include "usart.h"

uint8_t w5500_test(uint8_t opcode, uint8_t addr1, uint8_t addr2, uint8_t data){
	spi_ss(0);
	//_delay_ms(5);
	 spi_txrx(addr1);
	//_delay_ms(1);
	 spi_txrx(addr2);
	//_delay_ms(1);
	 spi_txrx(opcode);
	//_delay_ms(1);
	uint8_t rx = spi_txrx(data);

	//uint8_t tx[] = {addr1, addr2, opcode, data};
	//spi_write_multi(tx, 4);
	//uint8_t rx = spi_read();
	//_delay_ms(5)
	spi_ss(1);
	
	return rx;
}

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


uint8_t w5500_get_status(void){
	return (uint8_t) w5500_write(READ | SOCK_0, S0_SR, 0x0);
}


void w5500_set_command(uint8_t cmd){
	w5500_write(WRITE | SOCK_0, S0_CR, cmd);
}


w5500_tcp_init(uint16_t source_port){
	// Enable TCP
	w5500_write(WRITE | SOCK_0, S0_MR, 0x01);
		
	// Source port
	w5500_write(WRITE | SOCK_0, S0_PORT0, (uint8_t)(source_port >> 8));
	w5500_write(WRITE | SOCK_0, S0_PORT1, (uint8_t)(source_port & 0xff));	
}


uint16_t w5500_tcp_rx_free_size(void){
	uint16_t size = 0x0;
	uint8_t size_upper = w5500_write(READ | SOCK_0, S0_RX_RSR0, 0x0);
	uint8_t size_lower = w5500_write(READ | SOCK_0, S0_RX_RSR1, 0x0);
	size = ((uint16_t) size_upper) << 8;
	size |= (uint16_t) size_lower;
	
	return size;
}


uint16_t w5500_rx_tcp_size(void){
	uint8_t reg = w5500_write(READ | SOCK_0, S0_RXBUF_SIZE, 0x0);
	switch(reg){
		case 0: return 0;
		case 1: return 0x400;
		case 2: return 0x800;
		case 4: return 0x1000;
		case 8: return 0x2000;
		case 16: return 0x4000;
	}
}


uint16_t w5500_tcp_tx_free_size(void){
	uint16_t size = 0x0;
	uint8_t size_upper = w5500_write(READ | SOCK_0, S0_TX_FSR0, 0x0);
	uint8_t size_lower = w5500_write(READ | SOCK_0, S0_TX_FSR1, 0x0);
	size = ((uint16_t) size_upper) << 8;
	size |= (uint16_t) size_lower;
	
	return size;
}


uint16_t w5500_tx_tcp_size(void){
	uint8_t reg = w5500_write(READ | SOCK_0, S0_TXBUF_SIZE, 0x0);
	switch(reg){
		case 0: return 0;
		case 1: return 0x400;
		case 2: return 0x800;
		case 4: return 0x1000;
		case 8: return 0x2000;
		case 16: return 0x4000;
	}
}


void w5500_tcp_rx(uint8_t* data){
	uint16_t read_pt = 0x0;
	uint16_t free_size = w5500_tcp_rx_free_size();
	uint16_t sock_size = w5500_rx_tcp_size();
	uint16_t data_ptr = 0;

	uint8_t read_pt_upper = w5500_write(READ | SOCK_0, S0_RX_RD0, 0x0);
	uint8_t read_pt_lower = w5500_write(READ | SOCK_0, S0_RX_RD1, 0x0);
	
	read_pt = ((uint16_t) read_pt_upper) << 8;
	read_pt |= (uint16_t) read_pt_lower;
	
	while(free_size > sock_size){
		int i;
		for(i=0; i<sock_size; i++){
			data[i+data_ptr] = w5500_write(READ | SOCK_0_RX_BUF, i, 0x0);
		}
		data_ptr = i;
		free_size = w5500_tcp_rx_free_size();
		w5500_set_command(RECV); // Does this reset rx read pointer?
	}
	if(free_size > 0) {
		for(int i=0; i<free_size; i++){
			data[i+data_ptr] = w5500_write(READ | SOCK_0_RX_BUF, i, 0x0);
		}
		w5500_set_command(RECV);
	}

	// w5500_write(WRITE | SOCK_0, S0_RX_RD0, size_upper);
	// w5500_write(WRITE | SOCK_0, S0_RX_RD1, size_lower);
}


void w5500_tcp_tx(uint8_t* data, uint16_t data_size){
	uint16_t free_size = w5500_tcp_tx_free_size();
	uint16_t sock_size = w5500_tx_tcp_size();
	uint16_t write_pt = 0;
	uint16_t read_pt = 0;
	uint16_t offset;
	uint16_t start_addr;
	uint16_t TX_MASK = 0x800 - 1;
	
	// buffer cleared after send
	write_pt = ((uint16_t) w5500_write(READ | SOCK_0, S0_TX_WR0, 0x0)) << 8;
	write_pt |= (uint16_t) w5500_write(READ | SOCK_0, S0_TX_WR1, 0x0);
	
	offset =  write_pt & TX_MASK;
	start_addr = write_pt;//0x4000 + offset;
	printf("Start address: %d\n", start_addr);
	
	for(int i=0; i<data_size; i++){
		w5500_write(WRITE | SOCK_0_TX_BUF, start_addr+i, data[i]);
	}
	
	write_pt += data_size;
	uint8_t size_upper = (uint8_t) (write_pt >> 8);
	uint8_t size_lower = (uint8_t) (write_pt & 0xff);
	w5500_write(WRITE | SOCK_0, S0_TX_WR0, size_upper);
	w5500_write(WRITE | SOCK_0, S0_TX_WR1, size_lower);
	
	w5500_set_command(SEND);
}


void w5500_assign_network_addr(uint16_t base_reg_addr, uint8_t* addr, uint8_t length){
	for (uint8_t i=0; i<length; i++){
		w5500_write(WRITE, base_reg_addr+i, addr[i]);
	}
}