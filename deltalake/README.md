# Trino-Hive-Minio Setup

The local setup described in this section is used to spin up:

- minio: for storing all data (ala table formats)
- postgres: used as the database engine for hive metastore.
- hive (metastore)
- trino

## Configure

### Minio Configuration

- bucket
- access keys

### Hive Configuration

- Minio connection

### Trino

- Minio connection
- Hive metastore configuraion



## Run with docker compose

```
docker compose up -d
```

