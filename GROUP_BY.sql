SELECT * FROM tabela_de_clientes;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM tabela_de_clientes GROUP BY ESTADO;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM TABELA_DE_CLIENTES WHERE CIDADE='RIO DE JANEIRO' 
GROUP BY ESTADO, BAIRRO ORDER BY BAIRRO;

SELECT MAX(QUANTIDADE) FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' ;

SELECT COUNT(*) FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' AND QUANTIDADE = 99; 