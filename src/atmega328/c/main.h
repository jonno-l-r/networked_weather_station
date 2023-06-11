#ifndef MAIN_H_
#define MAIN_H_


// Measurement averages
#define AVERAGES 10


// Network configuration
static uint8_t ip_addr[] = {192, 168, 1, 200};
static uint8_t subnet_mask[] = {255, 255, 255, 0};
static uint8_t mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
static uint8_t gateway[] = {192, 168, 1, 1};
static uint16_t port = 1000;


int main(void);


#endif /* MAIN_H_ */