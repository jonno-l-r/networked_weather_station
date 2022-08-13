/*
 * MCP9808.h
 *
 * Created: 31/07/2022 6:05:35 PM
 *  Author: Jonno
 */ 


#ifndef MCP9808_H_
#define MCP9808_H_

// Device address
#define MCP_ADDRESS 0x30

// Op codes
#define MCP_READ 0x1
#define MCP_WRITE 0x0

// Register addresses
#define REG_TEMP 0x5
#define REG_ID 0x7

uint16_t mcp9808_get_temperature(void);
uint8_t mcp9808_get_id(void);

#endif