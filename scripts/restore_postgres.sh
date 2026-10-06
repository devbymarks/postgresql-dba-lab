#!/usr/bin/env bash
set -Eeuo pipefail

BACKUP_FILE="${BACKUP_FILE:-}"
TARGET_DB="${TARGET_DB:-empresa_restore}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"

if [[ -z "$BACKUP_FILE" ]]; then
  echo "Uso: BACKUP_FILE=/caminho/arquivo.dump TARGET_DB=empresa_restore $0" >&2
  exit 1
fi

if [[ ! -r "$BACKUP_FILE" ]]; then
  echo "ERRO: arquivo não encontrado ou sem permissão de leitura: $BACKUP_FILE" >&2
  exit 1
fi

for cmd in createdb dropdb pg_restore psql; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "ERRO: comando '$cmd' não encontrado no PATH." >&2
    exit 1
  }
done

if psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -Atqc \
  "SELECT 1 FROM pg_database WHERE datname = '${TARGET_DB//\'/\'\'}'" | grep -q 1; then
  echo "Banco '$TARGET_DB' já existe; removendo para um restore limpo."
  dropdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TARGET_DB"
fi

createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TARGET_DB"

pg_restore \
  --host="$DB_HOST" \
  --port="$DB_PORT" \
  --username="$DB_USER" \
  --dbname="$TARGET_DB" \
  --clean \
  --if-exists \
  --no-owner \
  --verbose \
  "$BACKUP_FILE"

psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$TARGET_DB" \
  -c "SELECT COUNT(*) AS total_funcionarios FROM funcionarios;"

echo "Restore concluído e validado no banco '$TARGET_DB'."
