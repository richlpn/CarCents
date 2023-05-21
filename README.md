# TRABALHO 01: CarCents

Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>

Integrantes do grupo<br>
Kailany Faustino: kailanyfaustino@gmail.com<br>
Lucas Codeco: lucas.codeco2@gmail.com<br>
Micaely Gusmão: gusmaomicaely@gmail.com<br>
Richard Lucas: richardl1010@outlook.com<br>

...<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>

Este documento contém a especificação do projeto do banco de dados <nome do projeto>
<br>e motivação da escolha realizada. <br>

> A empresa Abacaxi Tech sabendo da dificuldade existente entre os usuários que são donos dos veículos para administrar os gastos e manutenções dos seus veículos iniciou a criação do projeto CarCents, um aplicativo para dispositivos móveis que tem como objetivo esclarecer para os usuários quanto cada veículo está gerando de despesas em um intervalo de tempo, lembretes que auxiliem em manutenções periódicas como troca de óleo e além disso existirá o controle em relação a gastos gerados para percursos como viagens.  Para realizar essa ajuda na administração dos gastos é necessário armazenar dos usuários os seus veículos, gastos, manutenções, o registro de abastecimento para que possa ser possível calcular o consumo médio de cada veículo em relação ao tipo de combustível e informações sobre as viagens que serão/foram feitas. Nas telas de listagem dos gastos e manutenções deverá existir um filtro que permita o usuário colocar um intervalo de data e uma soma dos valores gastos nesse intervalo de datas possam aparecer.

### 3.MINI-MUNDO<br>

> O sistema do CarCents conterá as informações aqui detalhadas. Do usuário serão armazenados id, nome, senha e email. Dos veículos serão armazenados id, nome, placa, ano, id do tipo de veículo e a quilometragem em que foi feito a última troca de óleo, o mesmo veículo não poderá ser cadastrado mais de uma vez e cada veículo deverá ter um tipo de veículo vinculado a ele. Do tipo de veículo deverá ser armazenado o id e a categoria. Do manutenção deverá ser armazenado o id, o id do tipo de manutenção, o id de qual veículo foi feita a manutenção, data, nome, valor gasto e a quilometragem atual do veículo em que essa manutenção foi feita. Do tipo de manutenção deverá ser armazenado o id e nome para que possa ser identificado. Dos gastos deverá ser armazenado o id, id do tipo de gasto, nome, valor gasto, data e id do veículo a que se refere o gasto registrado. Do tipo de gasto deverá ser registrado o id e o nome para que esse tipo de gasto possa ser identificado no momento da vinculação com o gasto. Para as viagens deverá ser armazenado o id, data de início. data de fim onde essa não poderá ser menor que a data de início, km inicial, km inicial e somente depois de todos os campos preenchidos deverá ser possível mostrar o relatório de gastos com o trajeto cadastrado, exibindo o valor gasto com o combustível e km total percorrido. Para o armazenamento do consumo médio é necessário o registro do tipo de combustível que deverá ter o nome e o id armazenados, para o consumo médio deverá ter o id do veículo ao qual se refere o consumo médio, quilômetro inicial, quilômetro final, data, quantidade de litros e valor do abastecimento para que possa ser feito o cálculo do consumo médio do veículo vinculado ao tipo de combustível que foi vinculado. Para o controle de troca de óleo deverá ser registrado em uma tabela de quantos em quantos quilômetros deve ser a troca de óleo do veículo considerando o tipo de óleo que o usuário comprou para colocar, para isso deve ser registrado o id, o km para troca e um boolean para saber se o registro está ativo ou inativo.

### 4.PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>

#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

Link para todas as telas: https://whimsical.com/carcents-JghTqFLsGwd8PvrBB9aM8F@7YNFXnKbZA8iQdvdXYPvu<br>

![Alt text](https://github.com/richlpn/CarCents/blob/main/images/telas_iniciais.png "Telas Iniciais")
![Alt text](https://github.com/richlpn/CarCents/blob/main/images/Tela%20inicial.png "Dashboard e Menu Lateral")
![Alt text](https://github.com/richlpn/CarCents/blob/main/images/consumo_medio.png "Consumo médio")

#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?

    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes?
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!

> A Empresa DevCom precisa inicialmente dos seguintes relatórios:

- Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
- Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
- Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
- Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes.
  > > ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br> b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo.
- Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.

#### 4.3 TABELA DE DADOS DO SISTEMA:

    a) Esta tabela deve conter todos os atributos do sistema e um mínimo de 10 linhas/registros de dados.
    b) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados

![Exemplo de Tabela de dados da Empresa Devcom](https://github.com/discipbd1/trab01/blob/master/arquivos/TabelaEmpresaDevCom_sample.xlsx?raw=true "Tabela - Empresa Devcom")

### 5.MODELO CONCEITUAL<br>

    A) Utilizar a Notação adequada (Preferencialmente utilizar o BR Modelo 3)
    B) O mínimo de entidades do modelo conceitual pare este trabalho será igual a 3 e o Máximo 5.
        * informe quais são as 3 principais entidades do sistema em densenvolvimento<br>(se houverem mais de 3 entidades, pense na importância da entidade para o sistema)
    C) Principais fluxos de informação/entidades do sistema (mínimo 3). <br>Dica: normalmente estes fluxos estão associados as tabelas que conterão maior quantidade de dados
    D) Qualidade e Clareza
        Garantir que a semântica dos atributos seja clara no esquema (nomes coerentes com os dados).
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null,
        e tuplas falsas (Aplicar os conceitos de normalização abordados).

![Alt text](https://github.com/richlpn/CarCents/blob/main/images/modelo_conceitual.png "Modelo Conceitual")

#### 5.1 Validação do Modelo Conceitual

    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 Descrição dos dados

    [objeto]: [descrição do objeto]

    EXEMPLO:
    CLIENTE: Tabela que armazena as informações relativas ao cliente<br>
    CPF: campo que armazena o número de Cadastro de Pessoa Física para cada cliente da empresa.<br>

### 6 MODELO LÓGICO<br>

        a) inclusão do esquema lógico do banco de dados
        b) verificação de correspondencia com o modelo conceitual
        (não serão aceitos modelos que não estejam em conformidade)

### 7 MODELO FÍSICO<br>

        a) inclusão das instruções de criacão das estruturas em SQL/DDL
        (criação de tabelas, alterações, etc..)

### 8 INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>

        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico
        (Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados + insert para dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL

### 9 TABELAS E PRINCIPAIS CONSULTAS<br>

    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>

#### 9.1 CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>

> # Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2 CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>

#### 9.3 CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)

    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4 CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>

    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

#### 9.5 INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>

    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6 CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>

    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7 CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>

    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8 CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>

    a) Criar minimo 1 de cada tipo

#### 9.9 CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>

        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10 SUBCONSULTAS (Mínimo 4)<br>

     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

> # Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)

#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA

#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

### 11 AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>

#### b) Tempo de apresentação 6:40

> # Marco de Entrega 03: Itens 10 e 11<br>
>
> <br>
> <br>

### 12 FORMATACAO NO GIT:<br>

https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>

##### About Formatting

    https://help.github.com/articles/about-writing-and-formatting-on-github/

##### Basic Formatting in Git

    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests

##### Working with advanced formatting

    https://help.github.com/articles/working-with-advanced-formatting/

#### Mastering Markdown

    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.

1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.

Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>

Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")
