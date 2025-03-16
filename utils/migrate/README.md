
# Migrations

This section describes a simple procedure to apply data migration on our delta lake infrastructure, using the defined [iceberg - nessi](../../deltalake/docker-compose.yml) setup.
The process follows a similar strategy to the one provided by [flyway](https://github.com/flyway/flyway), where:

- Stores migration scripts in a directory (e.g., migrations/).
- Keeps track of applied migrations using a schema_migrations table in Trino.
- Applies only new migrations

## Structure

```sh
│── migrations/
│   ├── V1__step1.sql
│   ├── V2__......sql
│   ├── V3__stepN.sql
│── migrate.py
│── config.py
```

Each SQL file contains a single migration. For example:

```sql
ALTER TABLE icebergnessie.test.mig_1 ADD COLUMN value_y DOUBLE
```

The [config.py](./config.py) defines:

- Trino connection properties
- migration file locations

The [migrate.py](./migrate.py) script:

- connects to trino.
- Reads migration files from **migrations/** folder
- Checks which migrations have been applied
- Runs only new migrations and updates schema_migrations.


## Execute

Create a virtual python environment.

```sh
conda create -n myenv python=3.9
source activate myenv
```

Install requirements

```sh
pip install -r requirements.txt
```

Run migration script

```sh
python migrate.py 
```