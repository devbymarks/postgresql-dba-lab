# Sessões ativas

```sql
SELECT pid,
       usename,
       datname,
       client_addr,
       application_name,
       state,
       wait_event_type,
       wait_event,
       query_start,
       LEFT(query, 120) AS query
FROM pg_stat_activity
ORDER BY query_start NULLS LAST;
```

Evite encerrar sessões sem entender a transação e o impacto. Quando necessário, diferencie cancelamento de query e término da conexão:

```sql
SELECT pg_cancel_backend(<pid>);
SELECT pg_terminate_backend(<pid>);
```
