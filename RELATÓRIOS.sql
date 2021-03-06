# -------------------------------------------------------- RELATÓRIO 01 --------------------------------------------------------#
# ------------------------------------------------------- vendas válidas -------------------------------------------------------#

SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;
SELECT * FROM tabela_de_clientes;

/* volume total de vendas, para cada cliente, dentro de um mês; */
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, SUM(QUANTIDADE) AS TOTAL FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

/* volume de venda permitida por cliente */
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA FROM tabela_de_clientes TC;

/* UNINDO AS DUAS BASES */

SELECT X.CPF, X.NOME, X.MES_ANO, X.TOTAL, X.QUANTIDADE_LIMITE, (X.QUANTIDADE_LIMITE - X.TOTAL) AS DIFERENCA,
ROUND(((1 - X.TOTAL)/X.QUANTIDADE_LIMITE)*100) AS DIFERENCA_PERCENTUAL,

CASE WHEN X.QUANTIDADE_LIMITE - X.TOTAL < 0 THEN 'INVÁLIDA'
ELSE 'OK'
END AS STATUS_VENDA

FROM (SELECT
NF.CPF, 
TC.NOME, 
DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS TOTAL, 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE

FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF

GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) 
X
WHERE X.QUANTIDADE_LIMITE - X.TOTAL < 0
;


# -------------------------------------------------------- RELATÓRIO 02 --------------------------------------------------------#
# ------------------------------------------------------ vendas por sabor ------------------------------------------------------#

SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;
SELECT * FROM tabela_de_produtos;

/*UNINDO TODAS AS TABELAS COM DADOS DE INTERESSE*/

SELECT VENDAS_SABOR.SABOR, VENDAS_SABOR.ANO, VENDAS_SABOR.VENDA_TOTAL_SABOR, (VENDAS_SABOR.VENDA_TOTAL_SABOR/VENDA_TOTAL.VENDA_TOTAL)*100 AS PARTICIPACAO

FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS VENDA_TOTAL_SABOR FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO=INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO=NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016 
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDAS_SABOR
INNER JOIN
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS VENDA_TOTAL FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO=INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO=NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016) AS VENDA_TOTAL
ON VENDAS_SABOR.ANO=VENDA_TOTAL.ANO
ORDER BY VENDAS_SABOR.VENDA_TOTAL_SABOR DESC;


# -------------------------------------------------------- RELATÓRIO 03 --------------------------------------------------------#
# ----------------------------------------------------- vendas por tamanho -----------------------------------------------------#


SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.VENDA_TOTAL_TAMANHO, (VENDA_TAMANHO.VENDA_TOTAL_TAMANHO/VENDA_TOTAL.VENDA_TOTAL)*100 AS PARTICIPACAO

FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS VENDA_TOTAL_TAMANHO FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO=INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO=NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016 
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS VENDA_TOTAL FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO=INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO=NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO=VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.VENDA_TOTAL_TAMANHO DESC;