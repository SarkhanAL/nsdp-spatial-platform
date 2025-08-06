// Insert data
spark.sql("""
  INSERT INTO iceberg.nsdp.property_data
  VALUES (1, 'Baku', 1000000, current_timestamp())
""")

// Query snapshots
println("=== Snapshot History ===")
spark.sql("""
  SELECT 
    snapshot_id, 
    operation, 
    committed_at, 
    summary['added-records'] as added,
    summary['deleted-records'] as deleted
  FROM iceberg.nsdp.property_data.snapshots
  ORDER BY committed_at DESC
""").show(false)

// Time-travel to specific snapshot (6341094609637024672 from your example)
println("\n=== Time Travel Query ===")
spark.read
  .option("snapshot-id", "6341094609637024672")
  .table("iceberg.nsdp.property_data")
  .show(false)

System.exit(0)
