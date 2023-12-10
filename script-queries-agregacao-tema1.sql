-- Query 1: Conta o número total de voos cadastrados
SELECT COUNT(numero_voo) AS total_de_voos
FROM voo;

-- Query 2: Calcula a média de salários dos funcionários
SELECT AVG(salario) AS media_salarios
FROM funcionario;

-- Query 3: Obtém o número total de passageiros cadastrados
SELECT COUNT(id_passageiro) AS total_de_passageiros
FROM passageiro;

-- Query 4: Calcula o valor total arrecadado através dos bilhetes de voo vendidos
SELECT SUM(preco_bilhete) AS total_arrecadado
FROM bilhete;

-- Query 5: Encontra a data mínima de início de emprego entre os funcionários
SELECT MIN(data_inicio) AS data_inicio_emprego_minima
FROM emprego;