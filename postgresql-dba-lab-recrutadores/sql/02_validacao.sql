\set ON_ERROR_STOP on

SELECT current_database() AS banco,
       current_user AS usuario,
       version() AS versao;

SELECT COUNT(*) AS total_funcionarios,
       MIN(salario) AS menor_salario,
       MAX(salario) AS maior_salario,
       ROUND(AVG(salario), 2) AS media_salarial
FROM funcionarios;

SELECT id, nome, cargo, salario
FROM funcionarios
ORDER BY id;
