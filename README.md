# ENGG56_CPU

Segue abaixo rascunhos iniciais de como as intruções devem ser passadas para a CPU seguindo as especificações. Dessa forma, ja tentei "combinar" os opcodes com as chave seletora da ULA, esperando que isso ajude futuramente. Note que será necessario passar 13 bits, os 5 bits iniciais se referem ao OPCODE enquanto os 8 finais se tratam do endereço ou valor imediato. Imaginei uma memoria/pilha de 8 palavras, por isso estou usando o valor ilustrativo 00000111 para M, mas obviamente podemos usar algo maior. As instruções que  acompanham um travessão, como não precisam de operandos, imagino quem possam receber qualquer coisa já que não vão usar esses 8 bits finais para nada.

<div align="center">
| —   | INSTRUÇÃO | OPCODE | M ou IMM    |
| --- | --------- | ------ | ----------- |
| 0   | PUSH      | 00000  | 00000111    |
| 1   | PUSH_I    | 00001  | 11111111    |
| 2   | PUSH_T    | 00010  | —           |
| 3   | POP       | 00011  | 00000111    |
| 4   | ADD       | 00100  | —           |
| 5   | SUB       | 00101  | —           |
| 6   | MUL       | 00110  | —           |
| 7   | DIV       | 00111  | —           |
| 8   | AND       | 01000  | —           |
| 9   | NAND      | 01001  | —           |
| 10  | OR        | 01010  | —           |
| 11  | XOR       | 01011  | —           |
| 12  | CMP       | 01100  | —           |
| 13  | NOT       | 01101  | —           |
| 14  | GOTO      | 01110  | 00000111    |
| 15  | IF_EQ     | 01111  | 00000111    |
| 16  | IF_GT     | 10000  | 00000111    |
| 17  | IF_LT     | 10001  | 00000111    |
| 18  | IF_GE     | 10010  | 00000111    |
| 19  | IF_LE     | 10011  | 00000111    |
| 20  | CALL      | 10100  | 00000111    |
| 21  | RET       | 10101  | —           |
</div>
