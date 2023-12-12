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
(4, 'Roberta', 'Coimbra', 'Central Street, 789, Whitechapel, Londres, Inglaterra', '+44 20 1234 5678', 'roberta@email.com'),
(5, 'Mariana', 'Silva', 'Rua das Palmeiras, 789, Jardim Botânico, Rio de Janeiro, Rio de Janeiro, Brasil', '+55 21 98765-4321', 'mariana@email.com'),
(6, 'Carlos', 'Pereira', 'Rua dos Pinheiros, 234, Pinheiros, São Paulo, São Paulo, Brasil', '+55 11 87654-3210', 'carlos@email.com'),
(7, 'Sophie', 'Dubois', 'Rue de la Paix, 567, Le Marais, Paris, França', '+33 1 23 45 67 89', 'sophie@email.com'),
(8, 'Alexandre', 'Oliveira', 'Av. da Liberdade, 123, Baixa, Lisboa, Portugal', '+351 21 987 6543', 'alexandre@email.com');

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
('ZXL958213', '18', 2500.00, 5, 'FL08573'),
('ZXL958214', '12', 3200.00, 6, 'FL08573'),
('ZXL958215', '5', 2900.00, 7, 'FL08573'),
('B230955', '2', 450.00, 3, 'S8573'),
('B230956', '22', 4200.00, 1, 'S8573'),
('B230957', '15', 3500.00, 7, 'S8573'),
('B230958', '7', 3800.00, 2, 'S8573'),
('B231034', '2', 900.00, 3, 'S8591'),
('B231035', '3', 1100.00, 7, 'S8591'),
('B231036', '4', 750.00, 5, 'S8591'),
('B231037', '5', 750.00, 2, 'S8591'),
('UA958B216', '30A', 5000.00, 1, 'FL08923'),
('UA958B217', '30B', 5000.00, 6, 'FL08923'),
('UA958B218', '25A', 4800.00, 7, 'FL08923'),
('UA958B219', '15B', 5200.00, 2, 'FL08923'),
('AN743F41P', '5A', 7500.00, 1, 'MNA98756'),
('AN743F42E', '20B', 8000.00, 2, 'MNA98756'),
('AN743F43E', '8C', 7200.00, 3, 'MNA98756'),
('AN743F44C', '20A', 5209.00, 6, 'MNA98756'),
('LS839X7392', '12C', 9500.00, 3, 'A0V09231'),
('LS839X7393', '7A', 9200.00, 1, 'A0V09231'),
('LS839X7394', '7B', 9200.00, 5, 'A0V09231'),
('LS839X7395', '20A', 9800.00, 6, 'A0V09231');

-- Populando tabela reserva
INSERT INTO reserva (id_reserva, data_reserva, id_passageiro, numero_voo) VALUES
(1, '2023-11-30 09:00:00', 2, 'FL08573'),
(2, '2023-11-28 15:30:00', 5, 'FL08573'),
(3, '2023-11-25 11:45:00', 6, 'FL08573'),
(4, '2023-11-20 14:20:00', 7, 'FL08573'),
(5, '2023-12-05 08:45:00', 3, 'S8573'),
(6, '2023-12-02 16:10:00', 1, 'S8573'),
(7, '2023-11-30 10:30:00', 7, 'S8573'),
(8, '2023-11-25 09:15:00', 2, 'S8573'),
(9, '2023-12-05 13:30:00', 3, 'S8591'),
(10, '2023-12-02 12:15:00', 7, 'S8591'),
(11, '2023-11-30 08:45:00', 5, 'S8591'),
(21, '2023-11-28 18:30:00', 2, 'S8591'),
(12, '2023-12-08 18:00:00', 1, 'FL08923'),
(13, '2023-12-05 14:30:00', 6, 'FL08923'),
(14, '2023-12-03 11:45:00', 7, 'FL08923'),
(22, '2023-12-03 10:15:00', 2, 'FL08923'),
(15, '2023-12-10 17:30:00', 1, 'MNA98756'),
(16, '2023-12-08 13:15:00', 2, 'MNA98756'),
(17, '2023-12-05 10:30:00', 3, 'MNA98756'),
(23, '2023-12-11 16:45:00', 6, 'MNA98756'),
(18, '2023-12-12 02:45:00', 3, 'A0V09231'),
(19, '2023-12-09 08:15:00', 1, 'A0V09231'),
(20, '2023-12-07 14:30:00', 5, 'A0V09231'),
(24, '2023-12-14 02:00:00', 6, 'A0V09231');

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