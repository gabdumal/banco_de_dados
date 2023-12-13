/*
Query com LEFT JOIN para retornar informações sobre todos os aeroportos, mesmo que destes não tenham partido voos, entre um
intervalo de data especificado.
Essa query é útil para verificar todos os aeroportos ativos em determinada data e os voos partindo destes.
*/
SELECT ap.codigo_aeroporto, ap.nome_aeroporto, ap.localizacao,
	vo.numero_voo, vo.tipo_aeronave, vo.id_aeronave, vo.aeroporto_partida, vo.hora_partida, vo.aeroporto_chegada, vo.hora_chegada
FROM aeroporto ap
LEFT JOIN voo vo ON vo.aeroporto_partida = ap.codigo_aeroporto
WHERE vo.hora_partida ISNULL OR (vo.hora_partida >= '2023-01-01' AND vo.hora_partida <= '2023-12-31');
