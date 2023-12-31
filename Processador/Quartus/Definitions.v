// ENGG56 - PROJETO DE CIRCUITOS INTEGRADOS DIGITAIS
// TRABALHO PRATICO - PROCESSADOR - DEFINITIONS
// INTEGRANTES: ANDRE COSTA, DAVID FERRARI, DAVID OLIVEIRA E PALOMA ARIZE.

// Definições de instruções da CPU e estados da FSM. Muito é útil para facilitar a codificação.
`define OP_PUSH 5'b00_000
`define OP_PUSH_I 5'b00_001
`define OP_PUSH_T 5'b00_010
`define OP_POP 5'b00_011
`define OP_ADD 5'b00_100
`define OP_SUB 5'b00_101
`define OP_MUL 5'b00_110
`define OP_DIV 5'b00_111
`define OP_AND 5'b01_000
`define OP_NAND 5'b01_001
`define OP_OR 5'b01_010
`define OP_XOR 5'b01_011
`define OP_CMP 5'b01_100
`define OP_NOT 5'b01_101
`define OP_GOTO 5'b01_110
`define OP_IF_EQ 5'b01_111
`define OP_IF_GT 5'b10_000
`define OP_IF_LT 5'b10_001
`define OP_IF_GE 5'b10_010
`define OP_IF_LE 5'b10_011
`define OP_CALL 5'b10_100
`define OP_RET 5'b10_101

`define STATE_RESET 5'h0
`define STATE_FETCH_INST 5'h1
`define STATE_DECODE 5'h2
`define STATE_POP_TO_TEMP1_1 5'h3
`define STATE_POP_TO_TEMP1_2 5'h4
`define STATE_POP_TO_TEMP2_1 5'h5
`define STATE_POP_TO_TEMP2_2 5'h6
`define STATE_EXECUTE_ALU 5'h7
`define STATE_EXECUTE_1_REG_INSTRUCTION 5'h8
`define STATE_PREPARE_PUSH_TO_STACK 5'h9
`define STATE_PUSH_TO_STACK 5'hA
`define STATE_CONFIG_DATA_MEM_READ 5'hB
`define STATE_DATA_MEM_READ 5'hC
`define STATE_PREPARE_SEND_TO_RAM 5'hD
`define STATE_SEND_TO_RAM 5'hE
`define STATE_JMP_NEXT 5'hF
`define STATE_NEXT 5'h10

