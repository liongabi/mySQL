# 1. Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).
SELECT CONCAT(NOME, ', ', ENDERECO_1, ', ', BAIRRO, ', ', CIDADE, ', ', ESTADO ) AS RESULTADO FROM tabela_de_clientes;

# 2. Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT (FLOOR(DATEDIFF(current_date, DATA_DE_NASCIMENTO)/365)) AS AGE FROM TABELA_DE_CLIENTES;

# 3. Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento.
# Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.

SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;
SELECT * FROM TABELA_DE_CLIENTES;

SELECT year(DATA_VENDA) AS ANO, (FLOOR(sum(IMPOSTO *(PRECO * QUANTIDADE)))) AS TOTAL FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY YEAR(DATA_VENDA); 

# 4. Queremos construir um SQL cujo resultado seja, para cada cliente:
# “O cliente João da Silva faturou 120000 no ano de 2016”. Somente para o ano de 2016.

SELECT * FROM TABELA_DE_CLIENTES;


SELECT (CONCAT('O cliente ', TC.NOME, ' faturou ', SUM(INTF.QUANTIDADE * INTF.PRECO), ' no ano de 2016.')) AS RESULTADO FROM TABELA_DE_CLIENTES TC 
INNER JOIN NOTAS_FISCAIS NTF ON TC.CPF = NTF.CPF
INNER JOIN itens_notas_fiscais INTF ON NTF.NUMERO = INTF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY TC.NOME, YEAR(NTF.DATA_VENDA); 


#resposta da alura
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA)