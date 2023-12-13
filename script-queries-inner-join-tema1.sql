/*
Query 1: Retorna os detalhes dos voos junto com as informações das aeronaves associadas a esses voos
Essa query é útil para visualizar informações gerais dos voos. Com a condição de mostrar apenas os voos futuros, é
possível montar um quadro daqueles que ainda ocorrerão.
*/
SELECT vo.numero_voo, vo.aeroporto_partida,  vo.hora_partida, vo.aeroporto_chegada, vo.hora_chegada,
	vo.tipo_aeronave as tipo_aeronave_esperado, an.id_aeronave, an.tipo_aeronave,
	an.capacidade
FROM voo vo
INNER JOIN aeronave an ON vo.id_aeronave = an.id_aeronave
WHERE vo.hora_partida >= '2023-12-07 12:00:00'
ORDER BY vo.hora_partida;

/* 
Query 2: Obtém os detalhes dos bilhetes de voo, juntamente com as informações dos passageiros associados a esses bilhetes
Essa query é útil para obter todas as informações necessárias para um passageiro embarcar com seu bilhete, desde seus dados
pessoais, quanto a origem e o destino deste.
*/
SELECT bi.numero_bilhete, bi.numero_voo, bi.numero_assento, bi.preco_bilhete, pa.id_passageiro,
	vo.id_aeronave, vo.tipo_aeronave, vo.aeroporto_chegada, vo.hora_chegada, vo.aeroporto_partida, vo.hora_chegada,
	pa.nome, pa.sobrenome, pa.endereco, pa.telefone, pa.email
FROM bilhete bi
INNER JOIN voo vo ON bi.numero_voo = vo.numero_voo
INNER JOIN passageiro pa ON bi.id_passageiro = pa.id_passageiro
ORDER BY vo.hora_partida;

/*
Query 3: Retorna as reservas feitas, incluindo os detalhes dos voos associados a essas reservas e os aeroportos de partida e
chegada desses voos, limitando por um intervalo de data da reserva.
Essa query é útil para avaliar que voos foram mais reservados em determinados períodos.
*/
SELECT re.id_reserva, re.data_reserva, re.numero_voo,
	vo.id_aeronave, vo.tipo_aeronave,
	vo.aeroporto_partida, vo.hora_partida, ap.nome_aeroporto AS nome_aeroporto_partida, ap.localizacao AS localizacao_aeroporto_partida,
	vo.aeroporto_chegada, vo.hora_chegada, ac.nome_aeroporto AS nome_aeroporto_chegada, ac.localizacao AS localizacao_aeroporto_chegada
FROM reserva re
INNER JOIN voo vo ON re.numero_voo = vo.numero_voo
INNER JOIN aeroporto ap ON vo.aeroporto_partida = ap.codigo_aeroporto
INNER JOIN aeroporto ac ON vo.aeroporto_chegada = ac.codigo_aeroporto
WHERE re.data_reserva >= '2023-11-30 08:45:00' AND re.data_reserva <= '2023-12-05 13:30:00';

/*
Query 4: Retorna informações sobre os empregos dos funcionários, incluindo os detalhes dos aeroportos onde estão empregados.
Ordena prioritariamente os funcionários ativos (que não têm data de fim do emprego). Secundariamente, ordena os registros de
emprego que forem mais antigos.
*/
SELECT em.id_emprego, em.data_inicio, em.data_fim,
	em.id_funcionario, fu.cargo, fu.nome, fu.sobrenome, fu.salario,
	em.codigo_aeroporto, ap.nome_aeroporto, ap.localizacao
FROM emprego em
INNER JOIN funcionario fu ON em.id_funcionario = fu.id_funcionario
INNER JOIN aeroporto ap ON em.codigo_aeroporto = ap.codigo_aeroporto
ORDER BY data_fim DESC, data_inicio ASC;

/*
Query 5: Retorna informações sobre todos os voos em que determinado passageiro viajou.
Essa informação é útil por questões de segurança, gerando um histórico das movimentações de uma pessoa.
*/
SELECT pa.id_passageiro, pa.nome, pa.sobrenome, pa.telefone, pa.endereco, pa.email,
	bi.numero_bilhete, bi.numero_voo, bi.numero_assento, bi.preco_bilhete,
	vo.id_aeronave, vo.tipo_aeronave, vo.aeroporto_partida, vo.hora_partida, vo.aeroporto_chegada, vo.hora_chegada,
	an.capacidade
FROM passageiro pa
INNER JOIN bilhete bi ON bi.id_passageiro = pa.id_passageiro
INNER JOIN voo vo ON vo.numero_voo = bi.numero_voo
INNER JOIN aeronave an ON an.id_aeronave = vo.id_aeronave
WHERE pa.id_passageiro = '3';


--- QUERIES AUXILIARES
-- SELECT * FROM reserva;
-- SELECT * FROM emprego;
-- SELECT * FROM bilhete;
-- SELECT * FROM voo;
-- SELECT * FROM aeroporto;
-- SELECT * FROM funcionario;
-- SELECT * FROM passageiro;
-- SELECT * FROM aeronave;