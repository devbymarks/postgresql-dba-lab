#!/usr/bin/env bash
set -Eeuo pipefail

DB_NAME="${DB_NAME:-postgres}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"

echo "=== PostgreSQL ==="
psql -X -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -Atqc \
  "SELECT version();"

echo -e "\n=== Disponibilidade ==="
pg_isready -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER"

echo -e "\n=== Sessões ==="
psql -X -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c \
  "SELECT state, COUNT(*) FROM pg_stat_activity GROUP BY state ORDER BY 2 DESC;"

echo -e "\n=== Recursos do sistema ==="
printf 'Carga: '; uptime
printf '\nMemória:\n'; free -h
printf '\nDisco:\n'; df -h
