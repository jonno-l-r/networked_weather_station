/*
 * main.c
 *
 * Created: 15/05/2022 7:51:12 PM
 *  Author: Jonno
 */ 

#define F_CPU 18000000UL

#include <stdio.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
//#include "usart.h"
#include "w5500.h"

//FILE usart0_str = FDEV_SETUP_STREAM(USART0SendByte, USART0ReceiveByte, _FDEV_SETUP_RW);

int main(void){
	//USART0Init();
	//stdin=stdout=&usart0_str;	
	//printf("Hello, world\n");
	
	uint8_t ip_addr[] = {192, 168, 1, 36};
	uint8_t subnet_mask[] = {255, 255, 255, 0};
	uint8_t mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
	uint8_t gateway[] = {192, 168, 1, 1};
	
	w5500_init();
	// uint8_t data[] = {0,0,0,0};
	//printf("spi initialized\n");
	_delay_ms(1000);
	// uint8_t rx;
	
	//for(int i=0; i<4; i++){
		//rx = w5500_test(WRITE, 0x00, GATEWAY_ADDR+i, gateway[i]);
		//rx = w5500_test(WRITE, 0x00, SUBNET_MASK+i, subnet_mask[i]);
		//rx = w5500_test(WRITE, 0x00, IP_ADDR+i, ip_addr[i]);		
	//}
	//
	//for(int i=0; i<6; i++){
		//rx = w5500_test(WRITE, 0x00, MAC_ADDR+i, mac_addr[i]);
	//}
	
	//rx = w5500_test(READ, 0x00, GATEWAY_ADDR, 0x00);
	//printf("0x%x", rx);
	//for(int i=0; i<4; i++){
		//printf("%x ", data[i]);
	//}
	w5500_assign_network_addr(GATEWAY_ADDR, gateway, 4);
	w5500_assign_network_addr(MAC_ADDR, mac_addr, 6);
	w5500_assign_network_addr(SUBNET_MASK, subnet_mask, 4);
	w5500_assign_network_addr(IP_ADDR, ip_addr, 4);
	
	//printf("assigned address\n");
	// printf("IP addr: ");
	 //uint8_t x;
	//for (int i=0; i<4; i++){
		//x = w5500_write(WRITE, IP_ADDR+i, 0x2);
		//x = w5500_write(READ, IP_ADDR+i, 0x0);
		//printf("%d.", x);
	//}
	
	w5500_tcp_init(80);
	//printf("initialized\n");
	w5500_set_command(OPEN);
	while(w5500_get_status() != SOCK_INIT);
	//printf("opened\n");
	//
	uint8_t header[] = "HTTP/1.1 200 OK\nContent-Type: text/html\n\n";
	uint8_t data[] = "Hello world!";
	//
	while(1){
		w5500_set_command(LISTEN);
		while(w5500_get_status() != SOCK_LISTEN);
		// printf("listening\n");
		while(w5500_get_status() != SOCK_ESTABLISHED);
		// printf("Established!\n");
		_delay_ms(10);
		
		while(w5500_tcp_rx_size() == 0);
		
		w5500_tcp_tx(header, sizeof(header));
		w5500_set_command(SEND);
		w5500_tcp_tx(data, sizeof(data));
		w5500_set_command(SEND);		
		w5500_set_command(DISCON);
	}
		
		//while(1){			
			//while(w5500_tcp_rx_size() == 0);
			//uint16_t size = w5500_tcp_rx_size();
			//uint8_t data[size];
			//w5500_tcp_rx(data, size);
			//w5500_set_command(RECV);
			//_delay_ms(1);
		//
			//for(int i=0; i<size; i++){
				//printf("%c", data[i]);
			//}
			//
			//if(w5500_tcp_rx_size() == 0){
				//w5500_tcp_tx(header, sizeof(header));
				//w5500_set_command(SEND);
				//w5500_tcp_tx(data, sizeof(data));
				//w5500_set_command(SEND);
				//w5500_set_command(DISCON);
				//break;				
			//}
		//}		
		//}
	
	return 0;
}

//int main(void){
	//USART0Init();
	//stdin=stdout=&usart0_str;
	//
	//spi_init();
	//
	///* w5100: 32 bit spi frame
	 //* opcode, addr1, addr2, data
	 //*/
	//
	//uint8_t op_read = 0x0f;
	//uint8_t op_write = 0xf0;
	//uint8_t addr1 = 0x000;
	//uint8_t addr2 = 0x002;
	//uint8_t data;
	//
	//while (1){
		//spi_ss(0);
		//spi_txrx(op_write);
		//spi_txrx(addr1);
		//spi_txrx(addr2);
		//data = spi_txrx(0x5);
		//spi_ss(1);
		//
		//spi_ss(0);
		//spi_txrx(op_read);
		//spi_txrx(addr1);
		//spi_txrx(addr2);
		//data = spi_txrx(0x0);
		//spi_ss(1);
		//
		//printf("Reg %x: %d\n", addr2, data);	
	//}
	//
	//return 0;
//}

//int main(void){
	//float temperature;
	//uint8_t upperByte;
	//uint8_t lowerByte;
	//
	//USART0Init();
	//stdin=stdout=&usart0_str;
	//
	//while(1){
		////send address & write command
		//twi_start();
		//twi_write(0x30);
		//
		//// Select temp reg
		//twi_write(0x05);
//
		//// Send address & read command
		//twi_start();
		//twi_write(0x31);
		//
		//// Read data from temp reg
		//upperByte = twi_read_ack();
		//lowerByte = twi_read_nack();
		//
		//upperByte = upperByte & 0x1F; //Clear flag bits
		//if ((upperByte & 0x10) == 0x10){
			////TA < 0°C
			//upperByte = upperByte & 0x0F; //Clear SIGN
			//temperature = 256 - (upperByte*16 + lowerByte / 16);
		//}
		//else {
			//temperature = (upperByte*16 + lowerByte / 16);
		//}	
	//
	//printf("Temperature: %f\n", temperature);
	//}
	//return 0;
//}