/*
 * http_server.h
 *
 * Created: 13/08/2022 11:21:58 AM
 *  Author: Jon. R
 */ 

#ifndef HTTP_SERVER_H_
#define HTTP_SERVER_H_


void tcp_init(uint8_t* mac_addr, uint8_t* subnet_mask, uint8_t* gateway, uint8_t* ip_addr, uint16_t port);
void tcp_open(void);
void tcp_listen(void);
int tcp_wait_established(void);
void tcp_send(char* data, int size);
uint16_t tcp_receive(char* data, uint16_t data_size);
void tcp_end(void);


#endif