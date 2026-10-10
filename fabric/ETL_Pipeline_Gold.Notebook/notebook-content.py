# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "afb9f891-c94e-4ad1-a6e0-b8c9ff904b30",
# META       "default_lakehouse_name": "Telecom_Serviceability_Curated",
# META       "default_lakehouse_workspace_id": "73345ee2-a559-4d4e-ae3b-bd1f31b62f65",
# META       "known_lakehouses": [
# META         {
# META           "id": "157c1c5e-62d3-42c8-ae9e-b8152e3466e1"
# META         },
# META         {
# META           "id": "afb9f891-c94e-4ad1-a6e0-b8c9ff904b30"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

print("✨ Initializing Gold Star Schema Pipeline (Saving to Telecom_Serviceability_Curated)...")

# Define our exact source and target catalogs based on your real Fabric workspace
SOURCE_CATALOG = "Telecom_Serviceability_Processed"
TARGET_CATALOG = "Telecom_Serviceability_Curated"
SCHEMA_NAME = "dbo"

# ==========================================
# 1. MATERIALIZE DIMENSION TABLES (3 Tables)
# ==========================================

print("Processing: dim_date...")
df_date = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`date`")
df_date.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`dim_date`")

print("Processing: dim_product...")
df_product = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`product`")
df_product.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`dim_product`")

print("Processing: dim_region...")
df_region = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`region`")
df_region.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`dim_region`")


# ==========================================
# 2. MATERIALIZE FACT TABLES (4 Tables)
# ==========================================

print("Processing: fact_customer_metrics...")
df_cust = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`customer_metrics`")
df_cust.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`fact_customer_metrics`")

print("Processing: fact_field_operations...")
df_ops = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`field_operations`")
df_ops.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`fact_field_operations`")

print("Processing: fact_network_kpis...")
df_net = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`network_kpis`")
df_net.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`fact_network_kpis`")

print("Processing: fact_serviceability...")
df_serv = spark.read.table(f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`serviceability`")
df_serv.write.format("delta").mode("overwrite").option("overwriteSchema", "true") \
    .saveAsTable(f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`fact_serviceability`")


print("\n🏆 SUCCESS: All 7 data assets are successfully loaded into your real Gold Lakehouse!")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
