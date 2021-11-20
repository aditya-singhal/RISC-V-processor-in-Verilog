// First program 
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[1] = {7'b0100000, 5'b00111, 5'b01001, 3'b000, 5'b01011, 7'b0110011};	// SUB R[11] = R[9] - R[7] = 20
mem_array[2] = {7'b0000000, 5'b00001, 5'b00100, 3'b001, 5'b01100, 7'b0110011};	// SLL R[12] = R[4] << R[1] = 40960
mem_array[3] = {7'b0000000, 5'b00101, 5'b00010, 3'b010, 5'b01101, 7'b0110011};	// SLT R[13] = (R[2] < R[5]) ? 1 : 0
mem_array[4] = {7'b0000000, 5'b00111, 5'b00011, 3'b100, 5'b01110, 7'b0110011};	// XOR R[14] = R[3] ^ R[7] = 88
mem_array[5] = {7'b0000000, 5'b00111, 5'b00011, 3'b110, 5'b01111, 7'b0110011};	// OR R[15] = R[3] | R[7] = 94
mem_array[6] = {7'b0000000, 5'b00111, 5'b00011, 3'b111, 5'b10000, 7'b0110011};	// AND R[16] = R[3] & R[7] = 6
mem_array[7] = {7'b0000000, 5'b00010, 5'b00011, 3'b010, 5'b01001, 7'b0000011};	// LW type R[9] = Mem[imm + R[3]] imm = 2: 320
mem_array[8] = {7'b0000000, 5'b11011, 5'b00011, 3'b010, 5'b01000, 7'b0100011};	// SW type Mem[imm + R[3]] = R[27] imm = 8: 
mem_array[9] = {7'b0000000, 5'b00011, 5'b00011, 3'b000, 5'b01000, 7'b1100011};	// BEQ if (R[3] == R[3]), Jump to (PC+imm<<1), imm = 8
mem_array[13] = {7'b0000000, 5'b00011, 5'b00010, 3'b000, 5'b00111, 7'b0110011};	// ADD R[7] = R[2] + R[3]
mem_array[14] = {7'b0000000, 5'b00011, 5'b00010, 3'b000, 5'b01000, 7'b0110011};	// ADD R[8] = R[2] + R[3]


// EX hazard detection
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[4] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01011, 7'b0110011};	// ADD R[11] = R[10] + R[8] = 90
mem_array[8] = {7'b0000000, 5'b01000, 5'b01011, 3'b000, 5'b01100, 7'b0110011};	// ADD R[12] = R[11] + R[8] = 170
mem_array[12] = {7'b0000000, 5'b01000, 5'b01100, 3'b000, 5'b01101, 7'b0110011};	// ADD R[13] = R[12] + R[8] = 250

// MEM hazard detection
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[4] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01011, 7'b0110011};	// ADD R[11] = R[10] + R[8] = 90
mem_array[8] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01100, 7'b0110011};	// ADD R[12] = R[10] + R[8] = 90
mem_array[12] = {7'b0000000, 5'b01000, 5'b01011, 3'b000, 5'b01101, 7'b0110011};	// ADD R[13] = R[11] + R[8] = 170

// Sequence hazard detection
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[4] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[10] + R[8] = 90
mem_array[8] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[10] + R[8] = 170
mem_array[12] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[10] + R[8] = 250
mem_array[16] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[10] + R[8] = 330
mem_array[20] = {7'b0000000, 5'b00111, 5'b01010, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[10] + R[7] = 400

// 4th instruction hazard detection
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[4] = {7'b0000000, 5'b01000, 5'b00111, 3'b000, 5'b01011, 7'b0110011};	// ADD R[11] = R[7] + R[8] = 150
mem_array[8] = {7'b0000000, 5'b01000, 5'b00111, 3'b000, 5'b01100, 7'b0110011};	// ADD R[12] = R[7] + R[8] = 150
mem_array[12] = {7'b0000000, 5'b01000, 5'b01010, 3'b000, 5'b01101, 7'b0110011};	// ADD R[13] = R[10] + R[8] = 90
mem_array[16] = {7'b0000000, 5'b01000, 5'b00111, 3'b000, 5'b01110, 7'b0110011};	// ADD R[14] = R[7] + R[8] = 150
mem_array[20] = {7'b0000000, 5'b00111, 5'b00111, 3'b000, 5'b01111, 7'b0110011};	// ADD R[15] = R[7] + R[7] = 140

// Add instruction after LW hazard, solved using stall
mem_array[0] = {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b01010, 7'b0110011};	// ADD R[10] = R[0] + R[1] = 10
mem_array[4] = {7'b0000000, 5'b01000, 5'b00111, 3'b000, 5'b01011, 7'b0110011};	// ADD R[11] = R[7] + R[8] = 150
mem_array[8] = {7'b0000000, 5'b00010, 5'b00011, 3'b010, 5'b01100, 7'b0000011};	// LW type R[12] = Mem[imm + R[3]] imm = 2: 320
mem_array[12] = {7'b0000000, 5'b01000, 5'b01100, 3'b000, 5'b01101, 7'b0110011};	// ADD R[13] = R[12] + R[8] = 400
mem_array[16] = {7'b0000000, 5'b01000, 5'b00111, 3'b000, 5'b01110, 7'b0110011};	// ADD R[14] = R[7] + R[8] = 150
mem_array[20] = {7'b0000000, 5'b00111, 5'b00111, 3'b000, 5'b01111, 7'b0110011};	// ADD R[15] = R[7] + R[7] = 140

// Control hazard, flush logic
mem_array[0] = {7'b0000000, 5'b00011, 5'b00011, 3'b000, 5'b11000, 7'b1100011};	// BEQ if (R[3] == R[3]), Jump to (PC+imm<<1), imm = 24
mem_array[4] = {7'b0000000, 5'b00001, 5'b00100, 3'b001, 5'b01100, 7'b0110011};	// SLL R[12] = R[4] << R[1] = 40960
mem_array[8] = {7'b0000000, 5'b00101, 5'b00010, 3'b010, 5'b01101, 7'b0110011};	// SLT R[13] = (R[2] < R[5]) ? 1 : 0
mem_array[12] = {7'b0000000, 5'b00111, 5'b00011, 3'b100, 5'b01110, 7'b0110011};	// XOR R[14] = R[3] ^ R[7] = 88
mem_array[16] = {7'b0000000, 5'b00111, 5'b00011, 3'b110, 5'b01111, 7'b0110011};	// OR R[15] = R[3] | R[7] = 94
mem_array[20] = {7'b0000000, 5'b00111, 5'b00011, 3'b111, 5'b10000, 7'b0110011};	// AND R[16] = R[3] & R[7] = 6
mem_array[24] = {7'b0000000, 5'b00010, 5'b00011, 3'b010, 5'b01001, 7'b0000011};	// LW type R[9] = Mem[imm + R[3]] imm = 2: 320
mem_array[28] = {7'b0000000, 5'b11011, 5'b00011, 3'b010, 5'b01000, 7'b0100011};	// SW type Mem[imm + R[3]] = R[27] imm = 8: 
mem_array[32] = {7'b0000000, 5'b00011, 5'b00011, 3'b000, 5'b00111, 7'b1100011};	// BEQ if (R[3] == R[3]), Jump to (PC+imm<<1), imm = 7
mem_array[48] = {7'b0000000, 5'b00011, 5'b00010, 3'b000, 5'b00111, 7'b0110011};	// ADD R[7] = R[2] + R[3]
mem_array[52] = {7'b0000000, 5'b00011, 5'b00010, 3'b000, 5'b01000, 7'b0110011};	// ADD R[8] = R[2] + R[3]
mem_array[56] = {7'b0000000, 5'b00001, 5'b00100, 3'b001, 5'b01100, 7'b0110011};	// SLL R[12] = R[4] << R[1] = 40960
