#!/usr/bin/env bash
set -Eeuo pipefail

DB_NAME="${DB_NAME:-postgres}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"

psql -X -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 <<'SQL'
SELECT now() AS coleta,
       datname,
       usename,
       state,
       COUNT(*) AS conexoes
FROM pg_stat_activity
GROUP BY datname, usename, state
ORDER BY conexoes DESC;
SQL
