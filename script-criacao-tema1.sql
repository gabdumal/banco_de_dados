--- CRIAÇÃO DAS TABELAS
-- Aeroporto
CREATE TABLE aeroporto (
	-- Considerando o padrão ICAO de 4 dígitos
	codigo_aeroporto VARCHAR(4) NOT NULL,
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
	salario NUMERIC(8,2) NOT NULL
);
ALTER TABLE funcionario
	ADD CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario);
ALTER TABLE funcionario
	ADD CONSTRAINT ck_funcionario_salario CHECK (salario > 0);

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
	ADD CONSTRAINT pk_passageiro PRIMARY KEY (id_passageiro);

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
	ADD CONSTRAINT pk_aeronave PRIMARY KEY (id_aeronave);
ALTER TABLE aeronave
	ADD CONSTRAINT ck_aeronave_tipo_aeronave CHECK (tipo_aeronave IN ('P', 'H', 'F', 'J'));
ALTER TABLE aeronave
	ADD CONSTRAINT ck_aeronave_capacidade CHECK (capacidade > 0);

-- Voo
CREATE TABLE voo (
	-- Não tenho certeza se este número deveria ser serial ou atribuído
	numero_voo SERIAL NOT NULL,
	aeroporto_partida INTEGER NOT NULL,
	aeroporto_chegada INTEGER NOT NULL,
	hora_partida DATE NOT NULL,
	hora_chegada DATE NOT NULL,
	tipo_aeronave CHAR(1) NOT NULL
);
ALTER TABLE voo
	ADD CONSTRAINT pk_voo PRIMARY KEY (numero_voo);
ALTER TABLE voo
	ADD CONSTRAINT ck_voo_tipo_aeronave CHECK (tipo_aeronave IN ('P', 'H', 'F', 'J'));
ALTER TABLE voo
	ADD CONSTRAINT ck_voo_hora_chegada CHECK (hora_chegada > hora_partida);

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
	ADD CONSTRAINT pk_bilhete PRIMARY KEY (numero_bilhete);
ALTER TABLE bilhete
	ADD CONSTRAINT ck_bilhete_numero_assento CHECK (numero_assento > 0);
ALTER TABLE bilhete
	ADD CONSTRAINT ck_bilhete_preco_bilhete CHECK (preco_bilhete > 0);


--- EXCLUSÃO DAS TABELAS
DROP TABLE aeroporto;
DROP TABLE funcionario;
DROP TABLE passageiro;
DROP TABLE aeronave;
DROP TABLE voo;
DROP TABLE bilhete;