# Setup Postgres for new service

# Create user

```zsh
  docker exec -it postgres psql -U <PG_ROOT_USERNAME> \
    -c "CREATE USER <NEW_SERVICE_USER_USERNAME> WITH PASSWORD '<NEW_SERVICE_USER_PASSWORD>';"
```

# Create database

```zsh
  docker exec -it postgres psql -U <PG_ROOT_USERNAME> \
    -c "CREATE DATABASE <NEW_SERVICE_DB_NAME> OWNER '<NEW_SERVICE_USER_USERNAME>';"
```

## Backup and restore Postgres

# Backup

```zsh
  pg_dumpall -h localhost -U <PG_ROOT_USERNAME> | gzip > full_backup.sql.gz
```

# Restore

```zsh
  gunzip -c full_backup.sql.gz | psql -h localhost -U <PG_ROOT_USERNAME> -f - <PG_ROOT_DB_NAME>
```

# Other

## Enter Postgres

```zsh
  docker exec -it postgres psql -U <PG_ROOT_USERNAME>
```

## Restart Nginx

```zsh
  docker exec -it nginx nginx -s reload
```
