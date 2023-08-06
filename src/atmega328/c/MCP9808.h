/*
 * MCP9808.h
 *
 * Created: 31/07/2022 6:05:35 PM
 *  Author: Jon. R
 */ 


#ifndef MCP9808_H_
#define MCP9808_H_


// Device address
#define MCP_ADDRESS 0x18

// Register addresses
#define REG_TEMP 0x5
#define REG_ID 0x7

uint8_t mcp9808_read(uint8_t reg, uint16_t* val);
uint8_t mcp9808_get_temperature(int16_t* temperature);
uint8_t mcp9808_get_id(uint16_t* id);

#endif