SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

#### --------- INNER JOIN -------------####

SELECT * FROM tabela_de_vendedores A 
INNER JOIN notas_fiscais B
ON A.MATRICULA=B.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) 
FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA=B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;


SELECT A.MATRICULA, A.NOME, COUNT(*) 
FROM tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA=B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;


#FATURAMENTO ANUAL#
#FATURAMENTO = QUANTIDADE X PREÇO

SELECT * FROM NOTAS_FISCAIS;
SELECT * FROM itens_notas_fiscais;

#UNIR NOTAS_FISCAIS E ITENS_NOTAS_FISCAIS PELO NUMERO
#DEPOIS CALCULAR YEAR(DATA_VENDA) 

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO_ANUAL
FROM notas_fiscais A
INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
GROUP BY YEAR(DATA_VENDA);

#### --------- LEFT/RIGHT JOIN -------------####
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS GROUP BY CPF; 

SELECT DISTINCT A.CPF, A.NOME, B.CPF
FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B 
ON A.CPF=B.CPF
WHERE B.CPF IS NULL;

#### --------- FULL/CROSS JOIN -------------####
SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

SELECT * FROM TABELA_DE_VENDEDORES INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;