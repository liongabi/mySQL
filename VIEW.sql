SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO
FROM tabela_de_produtos GROUP BY EMBALAGEM)
X WHERE X.MAIOR_PRECO >= 10;

#CRIO UMA VIEW COM O QUE ESTÁ ACIMA, DENTRO DOS (). AGORA, POSSO CHAMAR:

SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
vw_maiores_emabalagens  X WHERE X.MAIOR_PRECO >= 10;

 