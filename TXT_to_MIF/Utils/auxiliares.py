base = '\t0    :   0000000000000;\n'
final = 'END;\n'

def ler_arquivo_mif(nome_arquivo):
    with open(nome_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
    return linhas

def escrever_arquivo_mif(nome_arquivo, linhas):
    with open(nome_arquivo, 'w') as arquivo:
        arquivo.writelines(linhas)
            
def ler_arquivo_txt(nome_arquivo):
    with open(nome_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
    return linhas

def converter_para_binario_8_bits(valor):
    # Verifica se é binário
    if all(digito in '01' for digito in valor):
        # Completa com zeros à esquerda para garantir 8 bits
        return valor.zfill(8)

    # Verifica se é decimal
    elif valor.isdigit():
        # Converte para binário e completa com zeros à esquerda para garantir 8 bits
        return bin(int(valor))[2:].zfill(8)

    # Verifica se é hexadecimal
    elif all(digito in '0123456789ABCDEFabcdef' for digito in valor):
        # Converte para binário e completa com zeros à esquerda para garantir 8 bits
        return bin(int(valor, 16))[2:].zfill(8)

    # Se não for nenhum dos formatos válidos
    else:
        raise ValueError('Formato não suportado: insira um número binário, decimal ou hexadecimal.')
        
def converter_instrucao(opcode):
    opcode = opcode.lower()
    if opcode == 'push':
        return '00000'
    elif opcode == 'push_i':
        return '00001'
    elif opcode == 'push_t':
        return '00010'
    elif opcode == 'pop':
        return '00011'
    elif opcode == 'add':
        return '00100'
    elif opcode == 'sub':
        return '00101'
    elif opcode == 'mul':
        return '00110'
    elif opcode == 'div':
        return '00111'
    elif opcode == 'and':
        return '01000'
    elif opcode == 'nand':
        return '01001'
    elif opcode == 'or':
        return '01010'
    elif opcode == 'xor':
        return '01011'
    elif opcode == 'cmp':
        return '01100'
    elif opcode == 'not':
        return '01101'
    elif opcode == 'goto':
        return '01110'
    elif opcode == 'if_eq':
        return '01111'
    elif opcode == 'if_gt':
        return '10000'
    elif opcode == 'if_lt':
        return '10001'
    elif opcode == 'if_ge':
        return '10010'
    elif opcode == 'if_le':
        return '10011'
    elif opcode == 'call':
        return '10100'
    elif opcode == 'ret':
        return '10101'
    elif opcode == 'null':
        return '11111'
    else:
        return None  # Retorna null para opcodes desconhecidos.
