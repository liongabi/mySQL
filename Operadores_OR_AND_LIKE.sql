SELECT * FROM tabela_de_produtos WHERE SABOR = 'MANGA' AND TAMANHO = '470 ML';

SELECT * FROM tabela_de_produtos WHERE NOT SABOR = 'MANGA' OR NOT TAMANHO = '470 ML';


SELECT * FROM tabela_de_produtos WHERE SABOR IN ('MANGA', 'LARANJA');

SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%MAÇA';