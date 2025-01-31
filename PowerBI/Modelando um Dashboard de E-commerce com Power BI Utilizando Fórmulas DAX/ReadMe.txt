# Projeto de Modelagem de Dados em Esquema em Estrela

Este projeto consiste na criação de um modelo de dados baseado em esquema em estrela (star schema) a partir de uma tabela única de amostra financeira. O objetivo é organizar os dados de forma a facilitar análises e consultas eficientes.

## Tabelas Criadas

### Tabelas de Dimensões

1. **D_Produtos**
   - **Colunas**:
     - `ID_Produto`: Identificador único do produto.
     - `Produto`: Nome do produto.
     - `Média de Unidades Vendidas`: Média de unidades vendidas.
     - `Médias do valor de vendas`: Média do valor de vendas.
     - `Mediana do valor de vendas`: Mediana do valor de vendas.
     - `Valor máximo de Venda`: Valor máximo de venda.
     - `Valor mínimo de Venda`: Valor mínimo de venda.

2. **D_Produtos_Detalhes**
   - **Colunas**:
     - `ID_Produto`: Identificador único do produto.
     - `Discount Band`: Faixa de desconto.
     - `Sale Price`: Preço de venda.
     - `Units Sold`: Unidades vendidas.
     - `Manufacturing Price`: Preço de fabricação.

3. **D_Descontos**
   - **Colunas**:
     - `ID_Produto`: Identificador único do produto.
     - `Discount`: Valor do desconto.
     - `Discount Band`: Faixa de desconto.

4. **D_Detalhes**
   - **Colunas**:
     - `COGS`: Custo dos Produtos Vendidos.
     - `Country`: País.
     - `Date`: Data.
     - `Discount Band`: Faixa de desconto.
     - `Discounts`: Descontos.
     - `Gross Sales`: Vendas brutas.
     - `Indice`: Índice.
     - `Manufacturing Price`: Preço de fabricação.
     - `Month Name`: Nome do mês.
     - `Month Number`: Número do mês.
     - `Product`: Produto.
     - `Profit`: Lucro.
     - `Sale Price`: Preço de venda.
     - `Segment`: Segmento.
     - `Units Sold`: Unidades vendidas.
     - `Year`: Ano.

5. **D_Calendário**
   - **Criação**:
     - A tabela de calendário foi criada utilizando DAX com a função `CALENDAR`.
     - **DAX**:
       ```dax
       D_CALENDÁRIO = CALENDAR(DATE(2000, 1, 1), DATE(2025, 12, 31))
       ```
   - **Colunas**:
     - `Date`: Data.

### Tabela de Fatos

1. **F_Vendas**
   - **Colunas**:
     - `SK_ID`: Identificador único (Surrogate Key).
     - `ID_Produto`: Identificador único do produto.
     - `Produto`: Nome do produto.
     - `Units Sold`: Unidades vendidas.
     - `Sales Price`: Preço de venda.
     - `Discount Band`: Faixa de desconto.
     - `Segment`: Segmento.
     - `Country`: País.
     - `Sales`: Vendas.
     - `Profit`: Lucro.
     - `Date`: Data.

## Processo de Criação

- **Agrupamento**: As tabelas de dimensões foram criadas a partir do agrupamento de dados da tabela original, selecionando as colunas relevantes para cada dimensão.
- **Colunas Condicionais**: Foram utilizadas colunas condicionais para derivar informações específicas, como na seleção de ID de produtos
- **Índices**: Índices foram criados para melhorar a performance de consultas e garantir a integridade dos dados.

## Considerações Finais

Este modelo de dados foi projetado para facilitar a análise de informações financeiras, proporcionando uma visão clara e organizada dos dados. A utilização de um esquema em estrela permite consultas eficientes e uma fácil expansão para novas dimensões ou fatos, conforme necessário.
