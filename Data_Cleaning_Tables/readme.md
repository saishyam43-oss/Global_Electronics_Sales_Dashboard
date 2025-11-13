# Data Cleaning Tables – Documentation

This folder contains the `Data_Cleaning_Tables.xlsx` file. This workbook serves as a detailed technical companion to the **Data Cleaning Summary** dashboard, providing the raw, aggregated metrics that power its visualizations.

It is intended for technical reviewers who wish to audit the data cleaning process and see the direct numerical results of the SQL scripts.

---

### Mapping to SQL Cleaning Steps

The metrics in this Excel file are the direct, aggregated outputs of the SQL cleaning scripts.

* **Summary Metrics** (e.g., "Total Rows Before/After," "Removed Duplicates") are the result of `COUNT(*)` queries run before and after key cleaning operations.
* **Reliability Scores** (e.g., "Geo-Reliability") are calculated from SQL queries that used `GROUP BY` and `HAVING` to identify ambiguous mappings and their impact.
* **Issue Tallies** (e.g., "Invalid ProductKeys Removed") directly correspond to the number of rows affected by `DELETE` or `JOIN` filters in the final `sales_final` query.

---

### Workbook Sheet Breakdown

Each sheet in the workbook corresponds to a specific dataset or visual in the Data Cleaning Summary dashboard.

| Sheet Name | Description | Dashboard Role |
| :--- | :--- | :--- |
| **`Sales_Metrics`** | Aggregated cleaning stats for the `sales` table (rows removed, outliers, etc.). | Powers the "Invalid Sales Removed" KPI and "Removals per Reason" chart. |
| **`Customers_Metrics`** | Cleaning stats for `customers` (duplicates, nulls, geo flags). | Populates the "Issues by Table" chart and "Geo-Reliability" KPIs. |
| **`Products_Metrics`** | Cleaning stats for `products` (duplicates, nulls, re-mappings). | Populates the "Issues by Table" chart. |
| **`Stores_Metrics`** | Cleaning stats for `stores` (duplicates, dates). | Populates the "Issues by Table" chart and "Duplicate Keys Flagged" KPI. |
| **`Exchange_Rates_Metrics`**| Cleaning stats for `exchange_rates` (outliers, formatting, nulls). | Populates the "Issues by Table" chart. |
| **`Aggregated`** | Top-line summary metrics (e.g., total dates formatted, total rows removed). | Powers the main KPI cards like "Dates Standardized." |
| **`Summary_Table`** | A master list of all 33 issues found and their final status (Corrected vs. Accepted). | Powers the "Corrected & Accepted" visual. |
| **`Before_Cleaning`** | Schema snapshot (column names) of all raw tables. | Technical reference. |
| **`After_Cleaning`** | Schema snapshot (column names) of all final clean tables. | Technical reference. |
| **`Geo_Reliability`** | The final reliability scores (99.995%, 99.60%) for `State -> Country` and `City -> State`. | Powers the "Geo-Reliability" KPIs and map. |
| **`Removal_Reason`** | The count of sales rows removed, by specific reason. | Powers the "Removals per Reason" bar chart. |
| **`Countrywise_Reliability`**| The detailed breakdown of invalid records by country. | Source data for the "Geographic Data Quality" map/charts. |

---

### Notes on Data Flow

* **Static Snapshot:** The figures in this Excel file are a static snapshot taken *after* all SQL cleaning scripts were run. They are a "point-in-time" summary used to populate the cleaning dashboard.
* **Auditability:** This file provides transparency. The numbers here can be independently verified by re-running the SQL scripts found in the `/sql_scripts` folder.
* **Dashboard Logic:** The *final* analytical dashboards (Product, Time, Customer, Region) do not use this file. They are connected live to the clean `.db` file, and their logic is built using DAX measures (see `/dax_measures` folder).
