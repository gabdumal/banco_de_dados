-- Populando tabela aeroporto
INSERT INTO aeroporto (codigo_aeroporto, nome_aeroporto, localizacao) VALUES
('SBGR', 'Aeroporto Internacional de Guarulhos', 'São Paulo, Brasil'),
('KJFK', 'Aeroporto Internacional John F. Kennedy', 'Nova York, Estados Unidos'),
('EGLL', 'Aeroporto de Heathrow', 'Londres, Reino Unido');

-- Populando tabela funcionario
INSERT INTO funcionario (nome, sobrenome, cargo, salario) VALUES
('Anastácia', 'Malosto', 'Piloto', 6000.00),
('Alexandre', 'Moreira', 'Comissário de Bordo', 3500.00),
('Lucas', 'Paiva', 'Engenheiro de Manutenção', 4500.00);

-- Populando tabela passageiro
INSERT INTO passageiro (nome, sobrenome, endereco, telefone, email) VALUES
('Ítalo', 'Almeida', 'Rua das Flores, 123', '+55 11 98765-4321', 'italo@email.com'),
('Taíssa', 'Xavier', 'Av. Principal, 456', '+1 212-555-6789', 'taissa@email.com'),
('Rodrigo', 'Soares', 'Rua Central, 789', '+44 20 1234 5678', 'rodrigo@email.com');

-- Populando tabela aeronave
INSERT INTO aeronave (tipo_aeronave, capacidade) VALUES
('P', 50),
('H', 80),
('F', 200);

-- Populando tabela voo
INSERT INTO voo (aeroporto_partida, aeroporto_chegada, hora_partida, hora_chegada, tipo_aeronave, id_aeronave) VALUES
('SBGR', 'KJFK', '2023-12-10', '2023-12-11', 'J', 3),
('EGLL', 'SBGR', '2023-12-12', '2023-12-13', 'F', 1),
('KJFK', 'EGLL', '2023-12-14', '2023-12-15', 'H', 2);

-- Populando tabela bilhete
INSERT INTO bilhete (numero_assento, preco_bilhete, id_passageiro, numero_voo) VALUES
(15, 500.00, 1, 1),
(20, 700.00, 2, 2),
(10, 600.00, 3, 3);

-- Populando tabela reserva
INSERT INTO reserva (data_reserva, id_passageiro, numero_voo) VALUES
('2023-12-08', 1, 1),
('2023-12-09', 2, 2),
('2023-12-10', 3, 3);

-- Populando tabela emprego
INSERT INTO emprego (data_inicio, data_fim, id_funcionario, codigo_aeroporto) VALUES
('2023-01-01', NULL, 1, 'SBGR'),
('2023-02-01', '2023-12-31', 2, 'KJFK'),
('2023-03-01', NULL, 3, 'EGLL');