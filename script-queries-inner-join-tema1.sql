-- Query 1: Retorna os detalhes dos voos junto com as informações das aeronaves associadas a esses voos
SELECT v.*, a.*
FROM voo v
INNER JOIN aeronave a ON v.id_aeronave = a.id_aeronave;

-- Query 2: Obtém os detalhes dos bilhetes de voo, juntamente com as informações dos passageiros associados a esses bilhetes
SELECT b.*, p.*
FROM bilhete b
INNER JOIN passageiro p ON b.id_passageiro = p.id_passageiro;

-- Query 3: Retorna as reservas feitas, incluindo os detalhes dos voos associados a essas reservas e os aeroportos de partida e chegada desses voos
SELECT r.*, v.*, ap.nome_aeroporto AS aeroporto_partida, ac.nome_aeroporto AS aeroporto_chegada
FROM reserva r
INNER JOIN voo v ON r.numero_voo = v.numero_voo
INNER JOIN aeroporto ap ON v.aeroporto_partida = ap.codigo_aeroporto
INNER JOIN aeroporto ac ON v.aeroporto_chegada = ac.codigo_aeroporto;

-- Query 4: Retorna informações sobre os empregos dos funcionários, incluindo os detalhes dos aeroportos onde estão empregados
SELECT e.*, f.*, a.*
FROM emprego e
INNER JOIN funcionario f ON e.id_funcionario = f.id_funcionario
INNER JOIN aeroporto a ON e.codigo_aeroporto = a.codigo_aeroporto;

-- Query 5: Obtém os detalhes dos voos, juntamente com as informações dos aeroportos de partida e chegada
SELECT v.*, ap.nome_aeroporto AS aeroporto_partida, ac.nome_aeroporto AS aeroporto_chegada
FROM voo v
INNER JOIN aeroporto ap ON v.aeroporto_partida = ap.codigo_aeroporto
INNER JOIN aeroporto ac ON v.aeroporto_chegada = ac.codigo_aeroporto;