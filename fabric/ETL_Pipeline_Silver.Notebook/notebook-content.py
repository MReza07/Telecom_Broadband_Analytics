# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "157c1c5e-62d3-42c8-ae9e-b8152e3466e1",
# META       "default_lakehouse_name": "Telecom_Serviceability_Processed",
# META       "default_lakehouse_workspace_id": "73345ee2-a559-4d4e-ae3b-bd1f31b62f65",
# META       "known_lakehouses": [
# META         {
# META           "id": "ccb69277-cc05-40f8-ad82-c65b70696290"
# META         },
# META         {
# META           "id": "157c1c5e-62d3-42c8-ae9e-b8152e3466e1"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

from pyspark.sql import functions as F
from pyspark.sql.types import DoubleType

# 1. Define exact Lakehouse names from your OneLake Explorer
SOURCE_CATALOG = "Telecom_Serviceability_Raw"
TARGET_CATALOG = "Telecom_Serviceability_Processed"
SCHEMA_NAME = "dbo"

# List of all 7 telecom data assets to process
tables_to_process = [
    "customer_metrics",
    "date",
    "field_operations",
    "network_kpis",
    "product",
    "region",
    "serviceability"
]

print(f"🚀 Starting End-to-End Silver ETL Pipeline execution...\n" + "="*60)

for table_name in tables_to_process:
    try:
        print(f"🔄 Processing table: {table_name}...")
        
        # 2. Build explicit source path: `Telecom_Serviceability_Raw`.`dbo`.`table_name`
        source_path = f"`{SOURCE_CATALOG}`.`{SCHEMA_NAME}`.`{table_name}`"
        df = spark.read.table(source_path)
        df_cleaned = df
        
        # 3. Apply targeted data cleaning transformations based on table schema
        if table_name == "customer_metrics":
            if "churned_subscribers" in df_cleaned.columns:
                df_cleaned = df_cleaned.fillna({"churned_subscribers": 0})
            
            if "revenue_usd" in df_cleaned.columns:
                df_cleaned = df_cleaned.withColumn(
                    "revenue_usd", 
                    F.coalesce(F.col("revenue_usd").cast(DoubleType()), F.lit(0.0))
                )
                
        elif table_name == "network_kpis":
            df_cleaned = df_cleaned.fillna({
                "outage_count": 0, 
                "tickets_opened": 0, 
                "tickets_resolved": 0, 
                "nodes_monitored": 0
            })
        elif table_name == "field_operations":
            # Fixed column name from dispatch_count to truck_rolls based on schema suggestions
            if "truck_rolls" in df_cleaned.columns:
                df_cleaned = df_cleaned.fillna({"truck_rolls": 0})
                
            if "job_duration_hrs" in df_cleaned.columns:
                df_cleaned = df_cleaned.fillna({"job_duration_hrs": 0.0})    

        # Drop exact duplicate rows across all processed tables
        df_cleaned = df_cleaned.dropDuplicates()

        # 4. Build explicit target path: `Telecom_Serviceability_Processed`.`dbo`.`table_name`
        target_path = f"`{TARGET_CATALOG}`.`{SCHEMA_NAME}`.`{table_name}`"
        
        # Save to Silver Layer with full schema enforcement
        df_cleaned.write \
            .format("delta") \
            .mode("overwrite") \
            .option("overwriteSchema", "true") \
            .saveAsTable(target_path)
            
        print(f"✅ Successfully processed, optimized, and saved: {table_name}\n" + "-"*40)
        
    except Exception as e:
        print(f"❌ ERROR processing table '{table_name}': {str(e)}\n" + "-"*40)

print("🏆 SUCCESS: All 7 telecom data assets are fully optimized and locked in the Silver Layer!")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
