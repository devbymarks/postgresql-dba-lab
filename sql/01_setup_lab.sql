-- PostgreSQL DBA Lab
-- Execute inicialmente conectado a um banco administrativo, por exemplo: postgres

\set ON_ERROR_STOP on

SELECT 'Preparando o banco empresa...' AS status;

SELECT format('CREATE DATABASE %I', 'empresa')
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'empresa')
\gexec

\connect empresa

CREATE TABLE IF NOT EXISTS funcionarios (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL,
    cargo   VARCHAR(50) NOT NULL,
    salario NUMERIC(10,2) NOT NULL CHECK (salario >= 0)
);

INSERT INTO funcionarios (nome, cargo, salario)
SELECT dados.nome, dados.cargo, dados.salario
FROM (VALUES
    ('Joao Silva', 'DBA Jr', 3500.00::numeric),
    ('Maria Souza', 'Analista Banco', 4500.00::numeric),
    ('Carlos Lima', 'Dev Backend', 5000.00::numeric)
) AS dados(nome, cargo, salario)
WHERE NOT EXISTS (
    SELECT 1
    FROM funcionarios f
    WHERE f.nome = dados.nome
      AND f.cargo = dados.cargo
);

SELECT * FROM funcionarios ORDER BY id;
