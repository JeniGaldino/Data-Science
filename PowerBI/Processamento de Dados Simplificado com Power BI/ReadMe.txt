Integração de Dados e Transformação no Power BI com MySQL no Azure
Este projeto envolve a criação de uma instância de banco de dados no Azure utilizando MySQL, com integração ao Power BI para análise de dados. O objetivo é realizar transformações nos dados para garantir que estejam prontos para um modelo de análise eficiente. A seguir, estão descritas as etapas e transformações realizadas no processo, incluindo a verificação e a junção das tabelas para facilitar a análise dos dados.

Criação da Instância no Azure para MySQL
Foi criada uma instância no Azure com MySQL para hospedar os dados necessários. A instância foi configurada com base em parâmetros fornecidos, permitindo o acesso ao banco de dados para integração com o Power BI. Uma vez configurada, a instância do banco de dados foi conectada ao Power BI para que os dados pudessem ser importados e manipulados para análise.

Integração do Power BI com MySQL no Azure
A integração entre o Power BI e o banco de dados MySQL na Azure foi realizada com sucesso, permitindo importar as tabelas diretamente para o Power BI. Com isso, foi possível transformar e criar relatórios a partir dos dados presentes no banco, utilizando as ferramentas de transformação do Power BI.

Transformação de Dados
Durante o processo de transformação, vários pontos foram considerados para garantir que os dados estivessem prontos para análise:

Verificação dos Cabeçalhos e Tipos de Dados
A primeira etapa foi garantir que os cabeçalhos das colunas estivessem corretos e que os tipos de dados fossem apropriados. Isso ajuda a evitar problemas durante a análise e permite uma manipulação mais eficiente dos dados.

Modificação de Valores Monetários
Os valores monetários foram ajustados para o tipo double preciso, a fim de garantir que os cálculos financeiros fossem realizados com a maior precisão possível.

Verificação de Nulos e Análise de Remoção
Uma análise foi feita para verificar a presença de valores nulos nas colunas e determinar se seria necessário removê-los ou substituí-los por valores adequados. Isso é importante para evitar que dados incompletos impactem a qualidade da análise.

Verificação de Funcionários sem Gerente
Identificamos que funcionários com o campo Super_ssn nulo podem ser gerentes. Após essa verificação, buscamos por colaboradores que não possuíam gerente e fizemos a devida correção.

Departamentos sem Gerente
Verificamos se todos os departamentos possuíam gerentes atribuídos. Caso contrário, completamos as informações com dados disponíveis ou fizemos as correções necessárias.

Preenchimento de Lacunas de Gerentes nos Departamentos
Para departamentos sem gerentes, as lacunas foram preenchidas com base nos dados disponíveis, para garantir que todos os departamentos estivessem completos para análise.

Verificação das Horas dos Projetos
Foi realizada uma verificação no número de horas atribuídas aos projetos para garantir que os dados fossem consistentes e que as análises sobre o tempo dedicado a cada projeto fossem precisas.

Separação de Colunas Complexas
Algumas colunas com dados complexos foram separadas em novas colunas para facilitar a análise e manipulação dos dados.

Junção de Employee e Department
Uma junção entre as tabelas employee e department foi realizada para criar uma nova tabela que associasse o nome de cada colaborador ao seu respectivo departamento. Isso foi feito para fornecer uma visão mais clara das relações entre os funcionários e seus departamentos.

Eliminação de Colunas Desnecessárias
Após a junção e transformação dos dados, as colunas que não seriam utilizadas no relatório final foram removidas, a fim de otimizar o modelo de dados e melhorar a performance da análise.

Junção dos Colaboradores com Seus Gerentes
A junção dos colaboradores com seus respectivos gerentes foi feita utilizando uma consulta SQL. A query utilizada foi a seguinte:

sql
Copiar
Editar
SELECT 
    CONCAT(e.Fname, ' ', e.Lname) AS Colaborador,
    CONCAT(g.Fname, ' ', g.Lname) AS Gerente
FROM 
    employee e
LEFT JOIN 
    employee g
ON 
    e.Super_ssn = g.Ssn;
Essa junção associou os colaboradores aos seus gerentes, utilizando a chave de Super_ssn para vincular os registros de gerentes dentro da própria tabela de empregados.

Mesclagem de Nomes
A coluna de Nome completo dos colaboradores foi criada ao mesclar as colunas de Nome e Sobrenome, criando uma coluna única que representa o nome completo dos funcionários. Essa transformação facilita a visualização e a utilização dos dados em relatórios.

Mesclagem de Departamentos e Localizações
Para garantir que cada combinação de departamento e localização fosse única, as colunas de nome de departamento e localização foram mescladas. Essa transformação foi importante para a criação de um modelo estrela no futuro, facilitando a análise por local e departamento simultaneamente.

Explicação sobre o Uso de Mesclar e Não Atribuir
A razão para utilizarmos a operação mesclar e não atribuir nas transformações é que estamos criando novas colunas compostas a partir de dados existentes. O uso de atribuição substituiria valores em uma coluna por outros dados, enquanto a mesclagem permite combinar duas ou mais colunas em uma única coluna, criando um novo valor composto. A atribuição não seria adequada porque ela não combina os dados de forma útil, apenas substitui valores.

Agrupamento de Dados por Gerente
A partir da transformação dos dados, foi possível agrupar os colaboradores por gerente, permitindo entender a quantidade de funcionários sob cada liderança. Essa análise é útil para avaliar a carga de trabalho de cada gerente e garantir uma distribuição adequada dos colaboradores.

Conclusão
As transformações realizadas no banco de dados garantiram que os dados estivessem prontos para análise, removendo inconsistências, combinando informações relevantes e criando um modelo de dados adequado para visualização no Power BI. O trabalho de mesclagem de colunas, junção de tabelas e eliminação de dados desnecessários resulta em um conjunto de dados mais eficiente e fácil de analisar.