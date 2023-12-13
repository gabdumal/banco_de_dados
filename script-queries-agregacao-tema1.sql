/*
Query 1: retorna informações sobre todos os voos a partir de determinada data, utilizando funções de agregação para
ressaltar a quantidade de assentos ocupados e disponíveis, com base nas reservas feitas.
Essas informações podem ser usadas para verificar se ainda pode permitir novas reservas sobre um voo.
*/
SELECT vo.numero_voo, vo.id_aeronave, vo.tipo_aeronave, an.capacidade,
	COUNT(re.id_reserva) as qtd_reservas, (an.capacidade - COUNT(re.id_reserva)) AS assentos_disponiveis
FROM voo vo
INNER JOIN reserva re ON re.numero_voo = vo.numero_voo
INNER JOIN aeronave an ON an.id_aeronave = vo.id_aeronave
GROUP BY (vo.numero_voo, an.capacidade);

/*
Query 2: retorna informações sobre todos os passageiros registrados no sistema, mesmo que não tenham comprado
algum bilhete.
As funções de agregação permitem contar a quantidade de bilhetes comprados e o valor total gasto.
Essas informações podem ser usadas para fins gerenciais, em campanhas publicitárias direcionadas.
*/
SELECT pa.id_passageiro, pa.nome, pa.sobrenome, pa.endereco, pa.telefone, pa.email,
	COUNT(bi.numero_voo) AS qtd_voos, SUM(bi.preco_bilhete) AS dinheiro_gasto
FROM passageiro pa
LEFT JOIN bilhete bi ON bi.id_passageiro = pa.id_passageiro
GROUP BY pa.id_passageiro
ORDER BY dinheiro_gasto;

-- Query 1: Conta o número total de voos cadastrados
SELECT COUNT(numero_voo) AS total_de_voos
FROM voo;

-- Query 2: Calcula a média de salários dos funcionários
SELECT AVG(salario) AS media_salarios
FROM funcionario;

-- Query 5: Encontra a data mínima de início de emprego entre os funcionários
SELECT  fu.id_funcionario, fu.nome, fu.sobrenome, fu.cargo, fu.salario, em.codigo_aeroporto,
	MAX(em.data_inicio) AS data_inicio_emprego_mais_recente
FROM emprego em
INNER JOIN funcionario fu ON fu.id_funcionario = em.id_funcionario
GROUP BY (fu.id_funcionario, em.codigo_aeroporto);