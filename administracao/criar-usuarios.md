# Usuários e roles

No PostgreSQL, usuários são roles com permissão de login.

```sql
CREATE ROLE app_empresa
    LOGIN
    PASSWORD 'defina-fora-do-repositorio'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;
```

Para listar roles:

```text
\du+
```

Nunca salve a senha real em scripts ou no Git. Prefira `.pgpass` com permissão `0600` ou um gerenciador de segredos.
