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
#include "MCP9808.h"
#include "bme280.h"
#include "w5500.h"

FILE usart0_str = FDEV_SETUP_STREAM(USART0SendByte, USART0ReceiveByte, _FDEV_SETUP_RW);


int get_bme280(char* buf){
	int32_t temp;
	uint32_t pres;
	uint32_t hum;
	uint8_t id;
	int i = 0;
	
	id = bme280_get_id();
	bme280_get_measurements(&temp, &pres, &hum);
	i += sprintf(buf+i, "[{\"id\":%d},", id);
	i += sprintf(buf+i, "{\"temperature\":%d},", temp);
	i += sprintf(buf+i, "{\"pressure\":%lu},", pres);
	i += sprintf(buf+i, "{\"humidity\":%lu}]\0", hum);
	
	return i;
}


int main(void){
	int data_size;
	char data[64];	
	
	//USART0Init();
	//stdin=stdout=&usart0_str;
	//printf("Hello, world\n");
	
	uint8_t ip_addr[] = {192, 168, 1, 36};
	uint8_t subnet_mask[] = {255, 255, 255, 0};
	uint8_t mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
	uint8_t gateway[] = {192, 168, 1, 1};
	
	w5500_init();
	_delay_ms(1000);

	w5500_assign_network_addr(GATEWAY_ADDR, gateway, 4);
	w5500_assign_network_addr(MAC_ADDR, mac_addr, 6);
	w5500_assign_network_addr(SUBNET_MASK, subnet_mask, 4);
	w5500_assign_network_addr(IP_ADDR, ip_addr, 4);

	w5500_tcp_init(80);
	
	
	char header[] = "HTTP/1.1 200 OK\nContent-Type: application/json\n\n";

	while(1){
		data_size = get_bme280(data);		
		
		w5500_set_command(OPEN);
		while(w5500_get_status() != SOCK_INIT);
		
		w5500_set_command(LISTEN);
		while(w5500_get_status() != SOCK_LISTEN);
		while(w5500_get_status() != SOCK_ESTABLISHED){
			if(w5500_get_status() == SOCK_CLOSED){
				// Probably timed out
				break;
			}
		}
		_delay_ms(1);

		if(w5500_get_status() == SOCK_ESTABLISHED){
			// Wait for buffer to fill
			while(w5500_tcp_rx_free_size() == 0);
			
			w5500_tcp_tx(header, sizeof(header)-1);
			
			for(int i=0; i<500; i++){
				w5500_tcp_tx(data, data_size);
			}
		}
		
		w5500_set_command(DISCON);
		while(w5500_get_status() != SOCK_CLOSED);
	}
	
	return 0;
}


//int main(void){
	//int32_t temp;
	//uint32_t pres;
	//uint32_t hum;
	//
	//USART0Init();
	//stdin=stdout=&usart0_str;
	//
	//printf("Hello, world\r\n");
	//
	//while(1){
		//uint8_t bme_id = bme280_get_id();
		//printf("ID: %d\n", bme_id);
//
		//bme280_get_measurements(&temp, &pres, &hum);
				//
		//printf("Temperature: %d\n", temp);
		//printf("Pressure: %lu / 256\n", pres);
		//printf("Humidity: %lu / 1024\n", hum);
		//printf("----------------\n\n");
		//
		//_delay_ms(5000);
	//}
	//
	//return 0;
//}