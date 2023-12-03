--- CREATE TABLES
-- Aeroporto
CREATE TABLE aeroporto (
	codigo_aeroporto SERIAL NOT NULL,
	nome_aeroporto TEXT NOT NULL,
	localizacao TEXT NOT NULL
);
ALTER TABLE aeroporto
	ADD CONSTRAINT pk_aeroporto PRIMARY KEY (codigo_aeroporto);

-- Funcionario
CREATE TABLE funcionario (
	id_funcionario SERIAL NOT NULL,
	nome TEXT NOT NULL,
	sobrenome TEXT NOT NULL,
	cargo TEXT NOT NULL,
	salario NUMERIC(10,4) NOT NULL
);
ALTER TABLE funcionario
	ADD CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario);


--- DROP TABLES
DROP TABLE aeroporto;
DROP TABLE funcionario;