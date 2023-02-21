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


FILE usart0_str = FDEV_SETUP_STREAM(USART0SendByte, USART0ReceiveByte, _FDEV_SETUP_RW);


int main(void){
	int data_size;
	char data[512];
	
	uint8_t ip_addr[] = {192, 168, 1, 200};
	uint8_t subnet_mask[] = {255, 255, 255, 0};
	uint8_t mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
	uint8_t gateway[] = {192, 168, 1, 1};
	uint16_t port = 1000;
	
	// Test
	USART0Init();
	stdin=stdout=&usart0_str;
	data_size = api_get_all(data);
	printf("size: %d\n%s", data_size, data);
	
	tcp_init(mac_addr, subnet_mask, gateway, ip_addr, port);
	while (1){
		data_size = api_get_all(data);
		
		tcp_open();
		tcp_listen();
		tcp_wait_established();

		tcp_send(data, data_size);
		
		tcp_end();
	}
	
	return 0;
}
