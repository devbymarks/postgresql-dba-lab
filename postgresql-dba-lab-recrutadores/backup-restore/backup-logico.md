# Backup lógico

## Formato customizado recomendado no laboratório

```bash
pg_dump -Fc -d empresa -f empresa.dump
```

Vantagens:

- permite selecionar objetos no restore;
- trabalha com `pg_restore`;
- suporta restore paralelo em cenários compatíveis;
- inclui catálogo que pode ser validado com `pg_restore --list`.

## Conferência mínima

```bash
pg_restore --list empresa.dump | head
ls -lh empresa.dump
```

Um arquivo existir não garante recuperação. A validação correta é executar um restore de teste e consultar os objetos restaurados.
