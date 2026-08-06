# Consultas de performance

Quando a extensão `pg_stat_statements` estiver habilitada:

```sql
SELECT calls,
       total_exec_time,
       mean_exec_time,
       rows,
       LEFT(query, 150) AS query
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;
```

Outros sinais importantes:

- crescimento de conexões;
- queries longas;
- bloqueios;
- crescimento de banco e tabelas;
- uso de CPU, memória e I/O;
- atraso de replicação, quando aplicável.
