/*
 * main.c
 *
 * Created: 15/05/2022 7:51:12 PM
 *  Author: Jonno
 */ 

#define F_CPU 18000000UL

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <stdint.h>
#include "string.h"
#include "usart.h"
#include "http_server.h"
#include "sensor_api.h"


//FILE usart0_str = FDEV_SETUP_STREAM(USART0SendByte, USART0ReceiveByte, _FDEV_SETUP_RW);


int main(void){
	int data_size;
	char data[512];
	
	//USART0Init();
	//stdin=stdout=&usart0_str;
	//printf("Hello, world\n");
	
	uint8_t ip_addr[] = {192, 168, 1, 36};
	uint8_t subnet_mask[] = {255, 255, 255, 0};
	uint8_t mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
	uint8_t gateway[] = {192, 168, 1, 1};
	
	tcp_init(mac_addr, subnet_mask, gateway, ip_addr);
	
	while(1){
		data_size = api_get_all(data);
		//printf("size: %d\n%s", data_size, data);
		
		tcp_open();
		tcp_listen();
		tcp_wait_established();

		tcp_send(data, data_size);
		
		tcp_end();
	}
	
	return 0;
}












	//while(1){
	//data_size = get_bme280(data);
	//
	//w5500_set_command(socket, OPEN);
	//while(w5500_get_status(socket) != SOCK_INIT);
	//
	//w5500_set_command(socket, LISTEN);
	//while(w5500_get_status(socket) != SOCK_LISTEN);
	//while(w5500_get_status(socket) != SOCK_ESTABLISHED){
	//if(w5500_get_status(socket) == SOCK_CLOSED){
	//// Probably timed out
	//break;
	//}
	//}
	//_delay_ms(1);
	//
	//if(w5500_get_status(socket) == SOCK_ESTABLISHED){
	//// Wait for buffer to fill
	//while(w5500_rx_rsr(socket) == 0);
	//
	//w5500_tcp_tx(socket, header, sizeof(header)-1);
	//w5500_tcp_tx(socket, data, data_size);
	//}
	//
	//w5500_set_command(socket, DISCON);
	//while(w5500_get_status(socket) != SOCK_CLOSED);
	//}