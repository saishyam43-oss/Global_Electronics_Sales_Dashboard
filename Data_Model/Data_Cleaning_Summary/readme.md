# Data Model - Data Cleaning Summary

This is a visual representation of the "data model" that powers the **Data Cleaning Summary** dashboard.

![Data Model](Data_Model/Data_Cleaning_Summary/Data_Modeling.jpg)

---

### Key Purpose: Visualizing the *Metrics*, Not the *Database*

It is critical to understand that this **is not** a relational data model (like a star schema) used for live analysis.

Instead, this image is a visual aid that shows the **static, pre-calculated summary tables** (found in `Data_Cleaning_Tables.xlsx`) that were created *after* all SQL cleaning scripts were run. These tables exist only to populate the "Data Cleaning Summary" dashboard with its final metrics.

* **No Relationships:** The tables are disconnected. All metrics are pre-calculated.
* **Static Data:** This model represents a "point-in-time" snapshot of the final cleaning results.

---

### Table (Sheet) Descriptions

Each table in the model corresponds to a sheet in the `Data_Cleaning_Tables.xlsx` workbook and powers a specific part of the summary dashboard.

| Table / Sheet Name | Description |
| :--- | :--- |
| **`Sales_Metrics`** | Aggregated cleaning stats for the `sales` table (rows removed, outliers, etc.). |
| **`Customers_Metrics`** | Cleaning stats for `customers` (duplicates, nulls, geo flags). |
| **`Products_Metrics`** | Cleaning stats for `products` (duplicates, nulls, re-mappings). |
| **`Stores_Metrics`** | Cleaning stats for `stores` (duplicates, dates). |
| **`Exchange_Rates_Metrics`**| Cleaning stats for `exchange_rates` (outliers, formatting, nulls). |
| **`Geo_Reliability`** | The final, high-level reliability scores (e.g., 99.60%) for key hierarchies. |
| **`Countrywise_Reliability`**| A detailed breakdown of invalid records by country, for both customers and sales. |
| **`Removal_Reason`** | The specific count of sales rows removed, by reason (e.g., "Invalid ProductKey"). |
| **`Summary_Table`** | A master list of all 33 issues found and their final status (`Corrected` vs. `Accepted`). |
| **`Before_Cleaning`** | Schema snapshot (column names) of all 5 raw tables. |
| **`After_Cleaning`** | Schema snapshot (column names) of all 5 final clean tables. |

---

### Related Project Folders

* **`../Data_Cleaning_Tables/`**: Contains the `Data_Cleaning_Tables.xlsx` file that this model is based on.
* **`../Data_Cleaning_SQL/`**: Contains the SQL cleaning scripts that *generated* the numbers in these tables.
* **`../DAX/`**: Contains the DAX logic for the *main analytical dashboards* (Product, Time, Customer, etc.), which use the *real*, relational data model.
