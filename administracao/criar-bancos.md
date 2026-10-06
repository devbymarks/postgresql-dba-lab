# Administração de bancos

## Criar um banco

```sql
CREATE DATABASE empresa
    WITH ENCODING = 'UTF8'
    TEMPLATE = template0;
```

No `psql`, liste os bancos com:

```text
\l+
```

## Verificar tamanho

```sql
SELECT pg_size_pretty(pg_database_size('empresa')) AS tamanho;
```

## Boas práticas

- use nomes consistentes e sem espaços;
- defina proprietário e permissões conscientemente;
- evite alterações diretamente em produção sem homologação;
- confirme encoding e locale antes de receber dados.
