/*
 * main.c
 *
 * Created: 15/05/2022 7:51:12 PM
 *  Author: Jon. R
 */ 

// TODO set using compiler option
#define F_CPU 18000000UL

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <stdint.h>
#include "main.h"
#include "http_server.h"
#include "sensor_api.h"
// #include "usart.h"
#include "mcp9808.h"
#include "w5500.h"

// For USART
// FILE usart0_str = FDEV_SETUP_STREAM(USART0SendByte, USART0ReceiveByte, _FDEV_SETUP_RW);


int main(void){	
	uint16_t data_size;
	char data[512];
	
	// Bring up USART for testing (need to include usart.h)
	// USART0Init();
	// stdin=stdout=&usart0_str;
	
	data_size = api_get_all(data, AVERAGES);
	
	tcp_init(mac_addr, subnet_mask, gateway, ip_addr, port);
	
	while (1){
		data_size = api_get_all(data, AVERAGES);
		tcp_open();
		tcp_listen();
		tcp_wait_established();
		
		tcp_send(data, data_size);
		
		tcp_end();
	}
	
	return 0;
}
