-- Sessões e comandos em execução
SELECT pid,
       usename,
       datname,
       application_name,
       client_addr,
       state,
       wait_event_type,
       wait_event,
       query_start,
       LEFT(query, 120) AS query
FROM pg_stat_activity
WHERE pid <> pg_backend_pid()
ORDER BY query_start NULLS LAST;

-- Bancos por tamanho
SELECT datname,
       pg_size_pretty(pg_database_size(datname)) AS tamanho
FROM pg_database
WHERE datistemplate = false
ORDER BY pg_database_size(datname) DESC;

-- Sessões por estado
SELECT COALESCE(state, 'sem estado') AS estado,
       COUNT(*) AS quantidade
FROM pg_stat_activity
GROUP BY state
ORDER BY quantidade DESC;
