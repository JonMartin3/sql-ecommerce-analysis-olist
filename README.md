# 📊 Análise de Dados com SQL — E-commerce (Base Olist)
## 📌 Objetivo

Este projeto tem como objetivo realizar uma análise completa de dados de um e-commerce utilizando SQL, com foco em responder perguntas de negócio relacionadas a vendas, clientes e operação.

A partir da base de dados pública da Olist, foram desenvolvidas consultas analíticas para extrair insights que possam apoiar a tomada de decisão estratégica.

## 🧠 Problema de Negócio

Empresas de e-commerce precisam entender:

* Como está a evolução das vendas ao longo do tempo
* Quem são seus clientes mais valiosos
* Quais categorias e regiões geram mais receita
* Como a operação logística impacta a experiência do cliente

Este projeto busca responder essas questões utilizando SQL aplicado a dados reais.

## 🗂️ Base de Dados

Dataset público da Olist contendo informações de:

* Clientes
* Pedidos
* Produtos
* Pagamentos
* Avaliações
* Vendedores
* Geolocalização

## 🛠️ Tecnologias Utilizadas
* SQL
* PostgreSQL
* Git e GitHub

## 🧱 Modelagem de Dados

O banco de dados foi estruturado utilizando modelo relacional com as seguintes tabelas principais:

* customers
* orders
* order_items
* order_payments
* order_reviews
* products
* sellers
* geolocation
* product_category_names_translation

<img width="1389" height="1004" alt="Schema" src="https://github.com/user-attachments/assets/96401ba8-bc59-4ec8-bfa2-f406f19019e1" />
 
## 🔍 Etapas do Projeto

O projeto foi dividido em etapas para simular um fluxo real de análise de dados:

1. Exploração inicial
Entendimento da estrutura das tabelas
Verificação de volume de dados
Identificação de valores nulos
2. Análise de vendas
Receita total e evolução mensal
Ticket médio
Categorias mais vendidas
Vendedores com maior faturamento
3. Análise de clientes
Clientes únicos e recorrentes
Distribuição geográfica
Ticket médio por região
Perfil de consumo
4. Análise operacional
Tempo médio de entrega
Percentual de pedidos atrasados
Relação entre atraso e avaliação
5. SQL avançado
Window functions (RANK, ROW_NUMBER)
CTEs
Análise de retenção
Segmentação de clientes

## 📊 Principais Insights

* Determinadas categorias concentram grande parte da receita da plataforma
* Existe variação significativa no ticket médio entre estados
* Atrasos na entrega impactam negativamente as avaliações dos clientes
* A maioria dos clientes realiza apenas uma compra, indicando oportunidade de retenção
* Alguns vendedores concentram grande parte do faturamento

## 📁 Estrutura do Projeto
```
📦 sql-ecommerce-analysis-olist
┣ 📂 sql
┃ ┣ 📜 01_criacao_das_tabelas.sql
┃ ┣ 📜 02_imports_dos_csv.sql
┃ ┣ 📜 03_validacao_de_importacao.sql
┃ ┣ 📜 04_criacao_de_index_para_performance.sql
┃ ┣ 📜 05_consultas_iniciais.sql
┃ ┣ 📜 06_analise_vendas.sql
┃ ┣ 📜 07_analise_clientes.sql
┃ ┣ 📜 08_analise_operacional.sql
┃ ┗ 📜 09_sql_avancado.sql
┣ 📂 images
┃ ┗ 📜 Schema.png
┗ 📜 README.md
``` 
## 🚀 Como Executar o Projeto
* Criar o banco de dados no PostgreSQL
* Executar scripts de criação de tabelas
* Importar os dados via CSV (https://drive.google.com/drive/folders/1zOKUyBcna5OOmVZeyQhBCdsOSBEZwgdN?usp=sharing)
* Executar os scripts de análise SQL

## 📈 Próximos Passos
* Construção de dashboard em Power BI
* Criação de pipeline de dados (ETL)
* Análise preditiva (machine learning)

## 👨‍💻 Autor

Jonathan Guedes
