# Privilégios com menor acesso necessário

Exemplo de acesso de aplicação:

```sql
GRANT CONNECT ON DATABASE empresa TO app_empresa;

\connect empresa

GRANT USAGE ON SCHEMA public TO app_empresa;
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO app_empresa;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO app_empresa;
```

Para objetos futuros:

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_empresa;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO app_empresa;
```
