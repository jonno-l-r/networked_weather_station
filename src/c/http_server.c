/*
 * http_server.c
 *
 * Created: 11/08/2022 10:43:55 PM
 *  Author: Jonno
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include "w5500.h"
#include "http_server.h"
#include "usart.h"


char header[] = "HTTP/1.1 200 OK\nContent-Type: application/json\n\n";
uint8_t socket = 0;
uint8_t rx_buf_size = 2;
uint8_t tx_buf_size = 2;


void tcp_init(uint8_t* mac_addr, uint8_t* subnet_mask, uint8_t* gateway, uint8_t* ip_addr){
	w5500_init();
	
	w5500_assign_network_addr(GATEWAY_ADDR, gateway, 4);
	w5500_assign_network_addr(MAC_ADDR, mac_addr, 6);
	w5500_assign_network_addr(SUBNET_MASK, subnet_mask, 4);
	w5500_assign_network_addr(IP_ADDR, ip_addr, 4);
	
	w5500_tcp_init(socket, 80);
}


void tcp_open(void){
	w5500_set_command(socket, OPEN);
	while(w5500_get_status(socket) != SOCK_INIT);	
}


void tcp_listen(void){
	w5500_set_command(socket, LISTEN);
	while(w5500_get_status(socket) != SOCK_LISTEN);	
}


int tcp_wait_established(void){
	while(w5500_get_status(socket) != SOCK_ESTABLISHED){
		if(w5500_get_status(socket) == SOCK_CLOSED){
			// Probably timed out
			return 1;
		}
	}
	
	_delay_ms(1);
	
	while(w5500_rx_rsr(socket) == 0);
	tcp_send(header, sizeof(header)-1);
	
	return 0;
}


void tcp_send(char* data, int size){
	if(w5500_get_status(socket) == SOCK_ESTABLISHED){
		w5500_tcp_tx(socket, data, size);
	}	
}


void tcp_end(void){
	w5500_set_command(socket, DISCON);
	while(w5500_get_status(socket) != SOCK_CLOSED);	
}