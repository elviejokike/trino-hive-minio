# Trino-Hive-Minio

In this repository, an exploration Trino, Minio, and Hive Metastore is done to understand their role in the context of data engineering. 
[Trino](https://trino.io), known as a distributed query engine, is a powerful tool capable of executing fast queries on large datasets. [Minio](https://min.io/), on the other hand, is an open-source solution for object storage systems, ensuring the secure and scalable storage of data. Hive Metastore, a component of [Hive](https://hive.apache.org/) serves as a component for managing metadata in the Hive data warehouse.

## Minio

MinIO is an open-source object storage service designed to store and manage large amounts of data, typically used in cloud environments. It utilizes an Amazon S3-compatible API to store data as objects in a distributed architecture.

# Hive (Metastore)

Hive is an open-source data warehouse infrastructure developed by Apache. It provides a framework for data storage and querying, typically used within the Apache Hadoop ecosystem. Hive enables querying structured data using a SQL-like query language called HiveQL.
Hive manages data definitions and metadata through a component called Hive Metastore, simplifying data cataloging and management.

# Trino

Trino, formerly known as Presto SQL, is an open-source SQL query engine designed for querying big data. It’s built to run SQL queries across distributed data processing systems and is used to **federate and query data from multiple data stores**.


## Setup

The location of the 'local' setup is located in the [deltalake](./deltalake/) subfolder.

## Play

### Minio

- Create  bucket called *play*.

### Using Trino

In the [trino](./deltalake/trino/) folder, the local trino CLI can be found.
This can be used to connect to trino once this is up and running using:

```
./trino http://localhost:18080
```

Create an schema

```
CREATE SCHEMA IF NOT EXISTS delta.play WITH (location = 's3a://play/');
```

Create a table

```
CREATE TABLE IF NOT EXISTS delta.play.mytable
(
    width  DOUBLE,
    length DOUBLE,
    high  DOUBLE,
    reference VARCHAR
)
```

Create a table in a specific location

```
create table delta.play.table_with_location (
        col1 varchar,
        col2 varchar,
        col3 varchar
)with (
    location = 's3a://play/table_with_location/my_collection/*'
);
```

Create a table in a specific location and partition

```
create table delta.play.table_with_partition (
        col1 varchar,
        col2 varchar,
        col3 varchar,
        country varchar,
        city varchar
)with (
    location = 's3a://play/table_with_partition/my_collection/*',
    partitioned_by = ARRAY['country','city']
);
```