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
GROUP BY (pa.id_passageiro)
ORDER BY dinheiro_gasto;

/*
Query 3: calcula a média do valor do bilhete pago em cada voo.
Essa informação é útil para verificar se uma conexão aérea está sendo lucrativa.
*/
SELECT vo.numero_voo, vo.id_aeronave, vo.tipo_aeronave,
	AVG(bi.preco_bilhete) AS media_preco_bilhete
FROM bilhete bi
INNER JOIN voo vo ON vo.numero_voo = bi.numero_voo
GROUP BY (vo.numero_voo);

/*
Query 4: calcula a data de início do emprego mais recente do funcionário, desde que ele esteja ativo.
Essa informação é útil para obter dados do funcionário apenas para o emprego em que ele esteja trabalhando atualmente.
*/
SELECT fu.nome, fu.sobrenome, fu.cargo, fu.salario, 
	MAX(em.data_inicio) AS data_inicio_emprego_mais_recente
FROM funcionario fu
INNER JOIN emprego em ON em.id_funcionario = fu.id_funcionario
WHERE em.data_fim IS NULL
GROUP BY (fu.id_funcionario);

/*
Query 5: Calcula a menor, a maior, e a média duração de um voo já realizado partindo de um aeroporto.
Essa informação é útil para analisar o porte efetivo deste aeroporto.
*/
SELECT ap.codigo_aeroporto AS aeroporto_partida, ap.nome_aeroporto, ap.localizacao,
	MIN(vo.hora_chegada - vo.hora_partida) AS menor_duracao_voo,
	MAX(vo.hora_chegada - vo.hora_partida) AS maior_duracao_voo,
	AVG(vo.hora_chegada - vo.hora_partida) AS media_duracao_voo
FROM voo vo
INNER JOIN aeroporto ap ON ap.codigo_aeroporto = vo.aeroporto_partida
GROUP BY (ap.codigo_aeroporto);