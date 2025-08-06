#!/bin/bash
# PostgreSQL Catalog
export DB_HOST="192.168.141.3"
export DB_PORT="5432"
export DB_USER="sarkhanal"
export DB_PASSWORD="sarkhanal"
export CATALOG_DB="iceberg_catalog"

# MinIO
export S3_ENDPOINT="http://192.168.141.3:9100"
export S3_ACCESS_KEY="minioadmin"
export S3_SECRET_KEY="minioadmin"
export S3_WAREHOUSE="s3a://iceberg-data/iceberg_warehouse"

# JAR Paths
export ICEBERG_JAR="/opt/iceberg/jars/iceberg-spark-runtime-3.5_2.12-1.5.0.jar"
export POSTGRES_JAR="/opt/iceberg/jars/postgresql-42.7.3.jar"
export AWS_SDK_JAR="/opt/hadoop/jars/aws-java-sdk-bundle-1.11.901.jar"
export HADOOP_AWS_JAR="/opt/hadoop/jars/hadoop-aws-3.3.4.jar"
