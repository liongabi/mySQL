SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM TABELA_DE_CLIENTES WHERE SOMA_LIMTE > 900000 GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM TABELA_DE_CLIENTES GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF HAVING COUNT(*) > 2000;