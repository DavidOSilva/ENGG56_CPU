# ENGG56_CPU
A implementação do processador foi subdividida em três grupos de componentes, as memórias (ROM e RAM), o Datapath e a Unidade de Controle. O grupo das memórias possui o propósito de armazenar as instruções especificadas pelo usuário durante a escrita de um programa que será executado pela CPU (memória RAM), além de armazenar valores utilizados em comandos específicos de endereçamento indireto dentro do sistema (memória RAM). Para isso foi utilizada uma memória RAM de 256 endereços e 8 bits e uma memória ROM de 256 endereços e 13 bits. Além disso, não foi necessário desenvolver o código desses módulos de memória em Verilog, uma que a ferramenta Altera Quartus Prime disponibiliza as memórias prontas.

<p align="center">
  <img src="/Assets/diagrama-projeto.png" alt="Diagrama esquemático do projeto da CPU no Quartus Prime">
</p>

Ademais, atribuímos a cada instrução da especificação do projeto um opcode associado com 5 bits, o que foi bastante útil já que criamos um arquivo definitions.v com a diretiva macro “define” de modo a vincular um texto a um valor binário. Desse modo, a instrução ADD é representada pelo valor 5’b00100 e possui um texto associado pelo arquivo definitions.v como OP_ADD. Veja a seguir a tabela completa das representações em binário(opcode) para cada instrução:

<p align="center">
  <img src="/Assets/tabela-inst.png" alt="Tabela com todas as representações das instruções em binário">
</p>

Dito isso, note que as instruções armazenadas na ROM recebem até 13 bits, com 5 bits para o opcode da instrução que será executada e os 8 bits restantes relacionados ao valor do operando, caso a instrução precise.

<p align="center">
  <img src="/Assets/formato-inst.png" alt="Ilustrando como as instruções são armazenadas na ROM">
</p>

O programa que o usuário deseja executar é escrito em um arquivo txt, obedecendo uma estrutura básica similar à da linguagem de montagem. Após essa escrita, o arquivo txt é lido por um código criado em Python (TXTtoMIF.py), que faz todo o tratamento do programa para ser interpretado pelo processador. Este código em Python converte um arquivo de texto contendo instruções em uma pseudo linguagem de montagem para um formato de arquivo Memory Initialization File (MIF). O MIF é um formato usado para descrever o conteúdo inicial de uma memória, como uma memória ROM. O MIF resultante após a conversão é salvo no mesmo arquivo MIF de origem.

<p align="center">
  <img src="/Assets/ilustracao-py.png" alt="Ilustrando processo de conversão feito pelo código em Python">
</p>

Dessa forma, a função permite a automação da conversão do código-fonte, em uma pseudo linguagem de montagem, para o formato adequado para a memória ROM em binário. Isso é útil para facilitar o desenvolvimento, evitando a necessidade de converter manualmente cada instrução. O código separa os valores de cada linha do programa em uma String e analisa se o número de linhas será suportado pela memória ROM, que tem um limite de 256 endereços. Tendo feito essa análise, cada String individual é separada em instrução e operando, que serão tratados de maneira distinta. As instruções serão interpretadas por uma função criada também em Python que recebe a String do comando e devolve o código binário relativo a aquela instrução, conforme visto na tabela acima. Enquanto isso, o operando associado a instrução, caso a mesma necessite de um, será convertido para seu equivalente em binário de 8 bits. Também é possível passar valores em decimal, binário (padrão) e até hexadecimal que a conversão é feita sem problemas.  Assim, com o fim do tratamento, o opcode é concatenado novamente ao seu operando, só que dessa vez tudo em binário, e então é armazenado em um endereço dentro da memória ROM, sendo importante salientar que ela utiliza um endereço para cada instrução escrita.

<p align="center">
  <img src="/Assets/txt_to_mif.png" alt="Ilustrando processo de conversão de txt para mif">
</p>

A unidade de controle do sistema, por sua vez, foi feita a partir de uma FSM de 17 estados que realiza toda a manutenção e integração dos diferentes componentes do sistema. Os estados dela foram criados conforme as necessidades específicas, tendo objetivos variados, desde um estado com o intuito de controlar a parte do Reset do processador, até estados que decodificam os diferentes comandos enviados do sistema e realizam tarefas individuais dentro da execução desses comandos. Também existem estados que controlam a interação entre a CPU e a pilha, para ler, colocar e remover valores. Além disso, existem estados associados à leitura e utilização dos valores armazenados dentro das memórias RAM e ROM, falaremos com mais detalhes mais adiante. Por último, o Datapath do circuito é composto pelas instâncias da ULA, pilha e registradores do sistema. A ULA tem o propósito de realizar as operações aritméticas pedidas ao processador, como soma e multiplicação, e também é responsável por fazer as operações lógicas, como operação de AND, OR entre outras. A pilha do processador não só é utilizada nos comandos referentes a ela, como PUSH e POP, como fornece os dados que são utilizados em praticamente todos os comandos existentes no sistema, pois tanto nas operações lógicas quanto aritméticas, os valores utilizados são puxados do topo da pilha naquele momento, valor esse será estabelecido pelo usuário por meio dos comandos de PUSH e POP. Para finalizar, tem-se o bloco de registradores do sistema, que basicamente possuem a função de controlar as variáveis de temp1 e temp2 que são as responsáveis por distribuir os valores que serão utilizados dentro do sistema.
