#!/bin/bash
source ./config.sh

spark-shell \
  --jars "$ICEBERG_JAR,$POSTGRES_JAR,$AWS_SDK_JAR,$HADOOP_AWS_JAR" \
  --conf spark.sql.catalog.iceberg=org.apache.iceberg.spark.SparkCatalog \
  --conf spark.sql.catalog.iceberg.catalog-impl=org.apache.iceberg.jdbc.JdbcCatalog \
  --conf "spark.sql.catalog.iceberg.uri=jdbc:postgresql://$DB_HOST:$DB_PORT/$CATALOG_DB" \
  --conf "spark.sql.catalog.iceberg.warehouse=$S3_WAREHOUSE" \
  --conf "spark.sql.catalog.iceberg.user=$DB_USER" \
  --conf "spark.sql.catalog.iceberg.password=$DB_PASSWORD" \
  --conf "spark.hadoop.fs.s3a.endpoint=$S3_ENDPOINT" \
  --conf "spark.hadoop.fs.s3a.access.key=$S3_ACCESS_KEY" \
  --conf "spark.hadoop.fs.s3a.secret.key=$S3_SECRET_KEY" \
  --conf spark.hadoop.fs.s3a.path.style.access=true \
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  -i ./sql/operations.scala
