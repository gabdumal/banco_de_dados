-- Populando tabela aeroporto
INSERT INTO aeroporto (codigo_aeroporto, nome_aeroporto, localizacao) VALUES
('SBGR', 'Aeroporto Internacional de Guarulhos', 'Guarulhos, São Paulo, Brasil'),
('SBZM', 'Aeroporto Presidente Itamar Franco', 'Rio Novo, Minas Gerais, Brasil'),
('SBJF', 'Aeroporto de Juiz de Fora', 'Juiz de Fora, Minas Gerais, Brasil'),
('SBVT', 'Aeroporto Internacional de Vitória', 'Vitória, Espírito Santo, Brasil'),
('KJFK', 'Aeroporto Internacional John F. Kennedy', 'Nova York, Nova York, Estados Unidos'),
('EGLL', 'Aeroporto de Heathrow', 'Hillingdon, Londres, Reino Unido');

-- Populando tabela funcionario
INSERT INTO funcionario (id_funcionario, nome, sobrenome, cargo, salario) VALUES
(1, 'Natália', 'Machado', 'Piloto', 6000.00),
(2, 'Augusto', 'Minguado', 'Comissário de Bordo', 3500.00),
(3, 'Lorenzo', 'Pinto', 'Engenheiro de Manutenção', 4500.00);

-- Populando tabela passageiro
INSERT INTO passageiro (id_passageiro, nome, sobrenome, endereco, telefone, email) VALUES
(1, 'Igor', 'Amado', 'Rua das Flores, 123, Centro, Americana, São Paulo, Brasil', '+55 11 98765-4321', 'igor@email.com'),
(2, 'Tiago', 'Santana', 'Avenida Minas Gerais, 456, Centro, Juiz de Fora, Minas Gerais, Brasil', '+55 21 91255-6789', 'tiago@email.com'),
(3, 'Bruna', 'Campos', 'Avenida Brasil, 1056, Vila Veneza, Extrema, Minas Gerais, Brasil', '+1 212-555-6789', 'bruna@email.com'),
(4, 'Roberta', 'Coimbra', 'Central Street, 789, Whitechapel, Londres, Inglaterra', '+44 20 1234 5678', 'roberta@email.com');

-- Populando tabela aeronave
INSERT INTO aeronave (id_aeronave, tipo_aeronave, capacidade) VALUES
(1, 'P', 8),
(2, 'H', 62),
(3, 'H', 80),
(4, 'F', 200),
(5, 'F', 263),
(6, 'F', 241);

-- Populando tabela voo
INSERT INTO voo (numero_voo, aeroporto_partida, aeroporto_chegada, hora_partida, hora_chegada, tipo_aeronave, id_aeronave) VALUES
('FL08573', 'SBGR', 'SBZM', '2023-12-03 12:30:00', '2023-12-03 16:30:00', 'H', 2),
('S8573', 'SBZM', 'SBVT', '2023-12-07 10:15:00', '2023-12-07 13:30:00', 'H', 3),
('S8591', 'SBZM', 'SBJF', '2023-12-07 14:00:00', '2023-12-07 15:05:00', 'P', 1),
('FL08923', 'SBGR', 'KJFK', '2023-12-10 02:15:00', '2023-12-10 13:30:00', 'F', 4),
('MNA98756', 'EGLL', 'SBGR', '2023-12-12 19:00:00', '2023-12-13 14:45:00', 'F', 5),
('A0V09231', 'KJFK', 'EGLL', '2023-12-14 04:05:00', '2023-12-15 12:30:00', 'F', 5);

-- Populando tabela bilhete
INSERT INTO bilhete (numero_bilhete, numero_assento, preco_bilhete, id_passageiro, numero_voo) VALUES
('ZXL958212', '15', 2962.00, 2, 'FL08573'),
('AN743F41P', '20A', 5209.00, 1, 'MNA98756'),
('B230954', '2', 450.00, 3, 'S8591');

-- Populando tabela reserva
INSERT INTO reserva (id_reserva, data_reserva, id_passageiro, numero_voo) VALUES
(1, '2023-11-30 04:09:32', 2, 'FL08573'),
(2, '2023-12-09 12:46:12', 1, 'MNA98756'),
(3, '2023-12-06 09:18:08', 3, 'S8591');

-- Populando tabela emprego
INSERT INTO emprego (id_emprego, data_inicio, data_fim, id_funcionario, codigo_aeroporto) VALUES
(1, '2023-01-01', NULL, 1, 'SBGR'),
(2, '2022-02-01', '2023-03-31', 2, 'KJFK'),
(3, '2023-03-01', NULL, 3, 'EGLL'),
(4, '2023-07-01', NULL, 2, 'KJFK');

--- DELETA TODOS OS DADOS
-- DELETE FROM reserva;
-- DELETE FROM emprego;
-- DELETE FROM bilhete;
-- DELETE FROM voo;
-- DELETE FROM aeroporto;
-- DELETE FROM funcionario;
-- DELETE FROM passageiro;
-- DELETE FROM aeronave;