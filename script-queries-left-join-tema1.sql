/*
Query com LEFT JOIN para retornar informações sobre todos os passageiros registrados no sistema, mesmo que não tenham comprado
algum bilhete.
*/
SELECT pa.id_passageiro, pa.nome, pa.sobrenome, pa.endereco, pa.telefone, pa.email,
	bi.numero_bilhete, bi.numero_assento, bi.preco_bilhete, bi.numero_voo
FROM passageiro pa
LEFT JOIN bilhete bi ON bi.id_passageiro = pa.id_passageiro
ORDER BY pa.id_passageiro;

/*
Query com LEFT JOIN para retornar informações sobre todos os aeroportos, mesmo que destes não tenham partido voos.
*/
SELECT ap.codigo_aeroporto, ap.nome_aeroporto, ap.localizacao,
	vo.numero_voo, vo.tipo_aeronave, vo.id_aeronave, vo.aeroporto_partida, vo.hora_partida, vo.aeroporto_chegada, vo.hora_chegada
FROM aeroporto ap
LEFT JOIN voo vo ON vo.aeroporto_partida = ap.codigo_aeroporto;

-- Query com LEFT JOIN para obter detalhes dos voos e informações sobre aeronaves correspondentes (caso existam)
-- SELECT v.*, a.*
-- FROM voo v
-- LEFT JOIN aeronave a ON v.id_aeronave = a.id_aeronave;