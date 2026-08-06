#!/usr/bin/env bash
set -Eeuo pipefail

DB_NAME="${DB_NAME:-empresa}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/backups/postgresql}"
RETENTION_DAYS="${RETENTION_DAYS:-7}"
TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.dump"
LOG_FILE="${BACKUP_DIR}/backup.log"

log() {
  printf '%s | %s\n' "$(date +'%Y-%m-%d %H:%M:%S')" "$*" | tee -a "$LOG_FILE"
}

command -v pg_dump >/dev/null 2>&1 || {
  echo "ERRO: pg_dump não foi encontrado no PATH." >&2
  exit 1
}

mkdir -p "$BACKUP_DIR"
log "Iniciando backup do banco '${DB_NAME}'."

pg_dump \
  --host="$DB_HOST" \
  --port="$DB_PORT" \
  --username="$DB_USER" \
  --format=custom \
  --blobs \
  --verbose \
  --file="$BACKUP_FILE" \
  "$DB_NAME" >>"$LOG_FILE" 2>&1

pg_restore --list "$BACKUP_FILE" >/dev/null

if [[ ! -s "$BACKUP_FILE" ]]; then
  log "ERRO: o arquivo de backup está vazio."
  exit 1
fi

find "$BACKUP_DIR" -maxdepth 1 -type f -name "${DB_NAME}_*.dump" \
  -mtime "+${RETENTION_DAYS}" -print -delete >>"$LOG_FILE" 2>&1 || true

log "Backup concluído: ${BACKUP_FILE} ($(du -h "$BACKUP_FILE" | awk '{print $1}'))."
