# ENGG56 - PROJETO DE CIRCUITOS INTEGRADOS DIGITAIS
# TRABALHO PRATICO - TXT PARA MIF
# INTEGRANTES: ANDRE COSTA, DAVID FERRARI, DAVID OLIVEIRA E PALOMA ARIZE.

from Utils.auxiliares import *

def TXT_to_MIF(txt, mif):
    
    linhas_mif, linhas_txt = ler_arquivo_mif(mif),  ler_arquivo_txt(txt) # Realizando leitura dos arquivos.

    # Realizando a conversão de fato.
    if(len(linhas_txt) > 256):
        print("Não foi possível converter o txt, o programa existente no arquivo atingiu o limite de 256 linhas permitidas na memória ROM!")
        return None
    
    else:
        novoMif = linhas_mif[:24] # A configuração da ROM inicia de fato na linha 24, inicialmente só existem comentários.

        programa, i = [], 0
        for instrucao in linhas_txt:
            opcode, operando = "", "00000000"
            elementos = instrucao.split()
            opcode = converter_instrucao(elementos[0]) # Converte instrução de string para o valor correspondente em binário.
            if(opcode == None): 
                print(f"Não foi possível converter o txt, você inseriu um opcode inválido: {instrucao}")
                return None
            if(len(elementos)>1):
                operando = converter_para_binario_8_bits(elementos[1]) # Converte operando em binário, se tiver.
            programa.append(base[0:1] + f"{i}" + base[2:10] + f"{opcode}" + f"{operando}" + base[23:]) # Montado programa.
            i = i + 1

        if(len(linhas_txt)<256): programa.append(f'\t[{i}..255]  :   1111111111111;\n') # Zerando linhas restantes.
        
        programa.append(final) #Fecha o conteúdo da ROM no arquivo mif

        # Reconstruindo todas as linhas do arquivo mif usando o programa binário gerado através do txt.
        novoMif.extend(programa)

        # Salvando o arquivo mif.
        escrever_arquivo_mif(mif, novoMif)
        print("O txt foi convertido para mif com sucesso!")
        return novoMif
    
# Exemplo de uso:
dir_mif = r"ROM.mif"
dir_txt = r"programa.txt"
novoMif = TXT_to_MIF(dir_txt, dir_mif)

