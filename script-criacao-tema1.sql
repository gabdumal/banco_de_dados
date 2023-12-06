--- CRIAÇÃO DAS TABELAS
-- Aeroporto
CREATE TABLE aeroporto (
	-- Considerando o padrão ICAO de 4 dígitos
	codigo_aeroporto VARCHAR(4) NOT NULL,
	nome_aeroporto TEXT NOT NULL,
	localizacao TEXT NOT NULL
);
ALTER TABLE aeroporto
	ADD CONSTRAINT pk_aeroporto
	PRIMARY KEY (codigo_aeroporto);

-- Funcionario
CREATE TABLE funcionario (
	id_funcionario SERIAL NOT NULL,
	nome TEXT NOT NULL,
	sobrenome TEXT NOT NULL,
	cargo TEXT NOT NULL,
	salario NUMERIC(8,2) NOT NULL
);
ALTER TABLE funcionario
	ADD CONSTRAINT pk_funcionario
	PRIMARY KEY (id_funcionario);
ALTER TABLE funcionario
	ADD CONSTRAINT ck_funcionario_salario
	CHECK (salario > 0);

-- Passageiro
CREATE TABLE passageiro (
	id_passageiro SERIAL NOT NULL,
	nome TEXT NOT NULL,
	sobrenome TEXT NOT NULL,
	endereco TEXT NOT NULL,
	telefone TEXT NOT NULL,
	email TEXT NOT NULL
);
ALTER TABLE passageiro
	ADD CONSTRAINT pk_passageiro
	PRIMARY KEY (id_passageiro);

-- Aeronave
/* Classificação quanto ao tipo de motor
P - Hélice à pistão
H - Turbo-Hélice
F - Turbo-Fan
J - Turbo-Jato
*/
CREATE TABLE aeronave (
	id_aeronave SERIAL NOT NULL, 
	tipo_aeronave CHAR(1) NOT NULL,
	capacidade INTEGER NOT NULL
);
ALTER TABLE aeronave
	ADD CONSTRAINT pk_aeronave
	PRIMARY KEY (id_aeronave);
ALTER TABLE aeronave
	ADD CONSTRAINT ck_aeronave_tipo_aeronave
	CHECK (tipo_aeronave IN ('P', 'H', 'F', 'J'));
ALTER TABLE aeronave
	ADD CONSTRAINT ck_aeronave_capacidade
	CHECK (capacidade > 0);

-- Voo
CREATE TABLE voo (
	-- Não tenho certeza se este número deveria ser serial ou atribuído
	numero_voo SERIAL NOT NULL,
	aeroporto_partida VARCHAR(4) NOT NULL,
	aeroporto_chegada VARCHAR(4) NOT NULL,
	hora_partida DATE NOT NULL,
	hora_chegada DATE NOT NULL,
	tipo_aeronave CHAR(1) NOT NULL
);
ALTER TABLE voo
	ADD CONSTRAINT pk_voo
	PRIMARY KEY (numero_voo);
ALTER TABLE voo
	ADD CONSTRAINT ck_voo_tipo_aeronave
	CHECK (tipo_aeronave IN ('P', 'H', 'F', 'J'));
ALTER TABLE voo
	ADD CONSTRAINT ck_voo_hora_chegada
	CHECK (hora_chegada > hora_partida);

-- Bilhete
CREATE TABLE bilhete (
	-- Não tenho certeza se este número deveria ser serial ou atribuído
	numero_bilhete SERIAL NOT NULL,
	numero_assento INTEGER NOT NULL,
	preco_bilhete NUMERIC(7,2) NOT NULL,
	id_passageiro INTEGER NOT NULL,
	numero_voo INTEGER NOT NULL
);
ALTER TABLE bilhete
	ADD CONSTRAINT pk_bilhete
	PRIMARY KEY (numero_bilhete);
ALTER TABLE bilhete
	ADD CONSTRAINT ck_bilhete_numero_assento
	CHECK (numero_assento > 0);
ALTER TABLE bilhete
	ADD CONSTRAINT ck_bilhete_preco_bilhete
	CHECK (preco_bilhete > 0);


--- RELACIONAMENTOS
CREATE TABLE reserva (
	id_reserva SERIAL NOT NULL,
	data_reserva DATE NOT NULL,
	id_passageiro INTEGER NOT NULL,
	numero_voo INTEGER NOT NULL
);
ALTER TABLE reserva
	ADD CONSTRAINT pk_reserva
	PRIMARY KEY (id_reserva);
ALTER TABLE reserva
	ADD CONSTRAINT ck_reserva_passageiro_voo
	UNIQUE (id_passageiro, numero_voo);
ALTER TABLE reserva
	ADD CONSTRAINT fk_reserva_passageiro
	FOREIGN KEY (id_passageiro) REFERENCES passageiro(id_passageiro);
ALTER TABLE reserva
	ADD CONSTRAINT fk_reserva_voo
	FOREIGN KEY (numero_voo) REFERENCES voo(numero_voo);

ALTER TABLE voo
	ADD COLUMN id_aeronave INTEGER NOT NULL;
ALTER TABLE voo
	ADD CONSTRAINT fk_voo_aeronave
	FOREIGN KEY (id_aeronave) REFERENCES aeronave(id_aeronave);
ALTER TABLE voo
	ADD CONSTRAINT fk_voo_aeroporto_partida
	FOREIGN KEY (aeroporto_partida) REFERENCES aeroporto(codigo_aeroporto);
ALTER TABLE voo
	ADD CONSTRAINT fk_voo_aeroporto_chegada
	FOREIGN KEY (aeroporto_chegada) REFERENCES aeroporto(codigo_aeroporto);
	
CREATE TABLE emprego (
	id_emprego SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE DEFAULT NULL,
	id_funcionario INTEGER NOT NULL,
	codigo_aeroporto VARCHAR(4) NOT NULL
);
ALTER TABLE emprego
	ADD CONSTRAINT pk_emprego
	PRIMARY KEY (id_emprego);
ALTER TABLE emprego
	ADD CONSTRAINT ck_emprego_data_fim
	CHECK (data_fim IS NULL OR data_fim > data_inicio);
ALTER TABLE emprego
	ADD CONSTRAINT fk_emprego_funcionario
	FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE emprego
	ADD CONSTRAINT fk_emprego_aeroporto
	FOREIGN KEY (codigo_aeroporto) REFERENCES aeroporto(codigo_aeroporto);


--- EXCLUSÃO DAS TABELAS
-- DROP TABLE reserva;
-- DROP TABLE emprego;
-- DROP TABLE aeroporto;
-- DROP TABLE funcionario;
-- DROP TABLE passageiro;
-- DROP TABLE aeronave;
-- DROP TABLE voo;
-- DROP TABLE bilhete;