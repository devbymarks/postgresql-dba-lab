# Troubleshooting PostgreSQL

## Serviço indisponível

```bash
pg_isready
systemctl status postgresql
journalctl -u postgresql --since '30 minutes ago'
```

## Falha de autenticação

Verifique, nesta ordem:

1. usuário e banco informados;
2. regra aplicável no `pg_hba.conf`;
3. endereço de escuta em `listen_addresses`;
4. porta configurada;
5. firewall e rota;
6. logs do servidor.

## Disco cheio

```bash
df -h
du -xhd1 /var/lib/postgresql 2>/dev/null | sort -h
```

Não apague arquivos diretamente do diretório de dados. Identifique a origem do crescimento e siga um procedimento seguro.

## Sessões bloqueadas

Execute [`sql/04_locks.sql`](../sql/04_locks.sql), identifique o bloqueador e avalie impacto antes de cancelar ou terminar qualquer backend.
