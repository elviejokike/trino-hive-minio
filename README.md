# Deltalakes Infrastructure - Experiment

In this repository, an exploration of different open source technologies is carried out in order to setup an deltalake infrastructure.

As part of this experiment, Trino, Minio, Hive Metastore and Nessie are chosen to understand their role in the context of data engineering. 


## Minio

[Minio](https://min.io/) is an open-source object storage service designed to store and manage large amounts of data, typically used in cloud environments. It utilizes an Amazon S3-compatible API to store data as objects in a distributed architecture.

# Hive (Metastore)

[Hive](https://hive.apache.org/) is an open-source data warehouse infrastructure developed by Apache. It provides a framework for data storage and querying, typically used within the Apache Hadoop ecosystem. Hive enables querying structured data using a SQL-like query language called HiveQL.
Hive manages data definitions and metadata through a component called Hive Metastore, simplifying data cataloging and management.

# Nessie

[Nessie](https://projectnessie.org/) provides as transactional catalog for datalakes with some extra nice features (like git inspired version control).

# Trino

[Trino](https://trino.io), formerly known as Presto SQL, is an open-source SQL query engine designed for querying big data. It’s built to run SQL queries across distributed data processing systems and is used to **federate and query data from multiple data stores**.


## Setup

The location of the 'local' setup is located in the [deltalake](./deltalake/) subfolder.

```sh
cd ./deltalake
```

By running compose, all docker services shall be started with the default configuration of this experiment.


```sh
docker compose up -d
```

### Using Trino

In the [trino](./deltalake/trino/) folder, the local trino CLI can be found.
This can be used to connect to trino once this is up and running using:

```sh
exec ./trino/trino http://localhost:18080
```

### Playing with Nessie 

Create an schema

```
CREATE SCHEMA IF NOT EXISTS icebergnessie.test  WITH (location = 's3a://nessie-iceberg/test');
```

Create a table

```
CREATE TABLE IF NOT EXISTS icebergnessie.test.mytable
(
    width  DOUBLE,
    length DOUBLE,
    high  DOUBLE,
    reference VARCHAR
)
```
