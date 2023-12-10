-- Query com LEFT JOIN para obter detalhes dos voos e informações sobre aeronaves correspondentes (caso existam)
SELECT v.*, a.*
FROM voo v
LEFT JOIN aeronave a ON v.id_aeronave = a.id_aeronave;