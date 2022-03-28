SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;


SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;


SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO_CLIENTE FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO_VENDEDOR FROM tabela_de_vendedores;



##----------------- UNION + JOIN ----------------------##

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.Nome, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO

UNION

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.Nome, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
