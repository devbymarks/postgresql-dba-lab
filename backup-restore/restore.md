# Restore e validação

```bash
createdb empresa_restore
pg_restore --no-owner -d empresa_restore empresa.dump
```

Valide os objetos:

```bash
psql -d empresa_restore -c '\dt+'
psql -d empresa_restore -c 'SELECT COUNT(*) FROM funcionarios;'
```

## Regra operacional

Antes de restaurar em um ambiente existente, confirme:

1. banco de destino correto;
2. janela de manutenção;
3. espaço em disco;
4. compatibilidade entre versões;
5. estratégia de retorno em caso de falha.
