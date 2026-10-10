[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared customer_metrics = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "customer_metrics.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 12, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"metric_id", Int64.Type}, {"region_id", Int64.Type}, {"date_id", Int64.Type}, {"product_id", Int64.Type}, {"total_subscribers", Int64.Type}, {"new_subscribers", Int64.Type}, {"churned_subscribers", Int64.Type}, {"churn_rate_pct", type number}, {"nps_score", Int64.Type}, {"csat_score", type number}, {"arpu_usd", type number}, {"revenue_usd", type number}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "date_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared date = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "date.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 10, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"date_id", Int64.Type}, {"full_date", type date}, {"year", Int64.Type}, {"quarter", Int64.Type}, {"month_num", Int64.Type}, {"month_name", type text}, {"week_num", Int64.Type}, {"day_of_week", type text}, {"is_weekend", Int64.Type}, {"fiscal_period", type text}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "field_operations_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared field_operations = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "field_operations.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 11, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"work_order_id", Int64.Type}, {"region_id", Int64.Type}, {"date_id", Int64.Type}, {"order_type", type text}, {"status", type text}, {"technician_id", Int64.Type}, {"scheduled_date", type date}, {"completed_date", type date}, {"first_time_fix_flag", Int64.Type}, {"truck_rolls", Int64.Type}, {"job_duration_hrs", type number}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "network_kpis_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared network_kpis = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "network_kpis.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 12, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"kpi_id", Int64.Type}, {"region_id", Int64.Type}, {"date_id", Int64.Type}, {"uptime_pct", type number}, {"avg_latency_ms", type number}, {"packet_loss_pct", type number}, {"outage_count", Int64.Type}, {"outage_duration_hrs", type number}, {"tickets_opened", Int64.Type}, {"tickets_resolved", Int64.Type}, {"mean_time_to_repair_hrs", type number}, {"nodes_monitored", Int64.Type}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "product_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared product = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "product.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 6, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"product_id", Int64.Type}, {"product_name", type text}, {"product_category", type text}, {"bundle_type", type text}, {"monthly_price_usd", type number}, {"is_active", Int64.Type}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "region_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared region = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "region.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"region_id", Int64.Type}, {"region_name", type text}, {"division", type text}, {"state", type text}, {"market_type", type text}, {"territory_manager", type text}, {"headend_location", type text}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "serviceability_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared serviceability = let
  Source = Folder.Files("D:\Telecom_data\New folder"),
  Navigation = Source{[#"Folder Path" = "D:\Telecom_data\New folder\", Name = "serviceability.csv"]}[Content],
  #"Imported CSV" = Csv.Document(Navigation, [Delimiter = ",", Columns = 15, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"address_id", Int64.Type}, {"region_id", Int64.Type}, {"date_id", Int64.Type}, {"street_address", type text}, {"city", type text}, {"state", type text}, {"zip_code", Int64.Type}, {"serviceable_flag", Int64.Type}, {"service_type", type text}, {"max_speed_mbps", Int64.Type}, {"technology", type text}, {"coverage_tier", type text}, {"overbuild_flag", Int64.Type}, {"latitude", type number}, {"longitude", type number}})
in
  #"Changed column type";
shared date_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "date", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared field_operations_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "field_operations", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared network_kpis_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "network_kpis", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared product_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "product", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared region_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "region", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared serviceability_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "73345ee2-a559-4d4e-ae3b-bd1f31b62f65"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ccb69277-cc05-40f8-ad82-c65b70696290"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "serviceability", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
