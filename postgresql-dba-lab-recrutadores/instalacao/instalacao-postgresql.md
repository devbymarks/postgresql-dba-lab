# Instalação e validação do PostgreSQL

O método de instalação depende da distribuição e da política do ambiente. Em produção, prefira os pacotes oficiais da distribuição ou do projeto PostgreSQL.

## Checklist pós-instalação

```bash
postgres --version
psql --version
pg_isready
```

Dentro do `psql`:

```sql
SELECT version();
SELECT current_user;
SHOW data_directory;
SHOW config_file;
SHOW hba_file;
```

## Arquivos principais

- `postgresql.conf`: memória, conexões, logs, WAL e demais parâmetros;
- `pg_hba.conf`: autenticação e origem das conexões;
- diretório de dados: arquivos físicos do cluster.

Toda alteração deve ser documentada, revisada e testada antes de chegar à produção.
