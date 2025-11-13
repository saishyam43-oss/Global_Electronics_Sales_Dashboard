# ⭐ Power BI Data Model — Star Schema (Documentation)

This file documents the data model used for the **Global Electronics Retail Sales Dashboard**, designed using a standard **Star Schema** to optimize analytical performance, DAX calculations, and Power BI interactivity.

---

## 🧱 1. Model Overview

The cleaned datasets were transformed into a **Star Schema** consisting of:

### **Fact Table**
- **`sales_final`**
  - Contains one row per transaction (line-item granularity)
  - Includes fully validated:
    - ProductKey
    - CustomerKey
    - StoreKey
    - Order date & delivery data
    - Normalized currency-adjusted revenue and costs

### **Dimension Tables**
- **`products`**
  - Brand, Category, Subcategory, Product attributes
  - Product hierarchy used for matrix visuals & grouping

- **`customers`**
  - Age, Age Groups, Geography, Cohort information
  - Used for segmentation (RFM, retention, demographic analysis)

- **`stores`**
  - Country, State, geo flags, store metadata (size, open date)
  - Basis for regional/store efficiency metrics

- **`exchange_rates_final`**
  - Monthly exchange rates used to convert all revenue and cost into USD
  - Supports the *local currency vs global currency* analysis

- **`Calendar`**
  - Standard date table with:
    - Year
    - Quarter
    - Month
    - Day of week
    - Day of year
  - Drives all time-intelligence DAX (YTD, YoY, moving averages)

---

## 🕸 2. Relationship Structure

The schema follows a **one-to-many relationship pattern**:

- `products` → `sales_final`  
- `customers` → `sales_final`  
- `stores` → `sales_final`  
- `exchange_rates_final` → `sales_final`  
- `Calendar` → `sales_final`

**Relationship Notes**
- All relationships are **single-directional (→)** from dimension → fact  
- This avoids circular dependencies and ensures predictable DAX evaluation  
- The Calendar table is marked as a **Date Table** for correct time intelligence

---

## ⚙️ 3. Modeling Decisions & Best Practices Applied

### ✔ Single Fact Table  
Keeping only one central fact table (`sales_final`) reduces model complexity and speeds up DAX calculations.

### ✔ Normalized Revenue & Costs  
All monetary fields were standardized to USD using the `exchange_rates_final` table to enable cross-region comparability.

### ✔ Geo-validated Dimensions  
100% reliable City–State–Country mappings ensure accurate store- and region-level insights.

### ✔ Clean Hierarchies  
Product and customer dimensions include well-formed hierarchies for drilldowns:
- Category → Subcategory → Product  
- Cohort → Age Group → Customer  

### ✔ Optimized Cardinality  
Keys were deduplicated and validated in SQL, reducing high-cardinality joins that slow Power BI.

---

## 🚀 4. Why a Star Schema?

This model was chosen because it:

- Improves performance in Power BI  
- Simplifies DAX calculations (`CALCULATE`, `SAMEPERIODLASTYEAR`, YTD, YoY)  
- Enables intuitive filtering and drilldowns  
- Prevents many-to-many relationship ambiguity  
- Keeps the model stable for time-series analysis

---

## 📊 5. Image Reference

Below is the visual representation of the final model:

<div align="center">

<img src="Star_Schema.png" alt="Star Schema Diagram" width="800"/>

</div>

---

## 📁 6. Related Files

- SQL cleaning scripts: [`/data_cleaning_sql`](../data_cleaning_sql/)
- DAX measures: [`/dax_measures`](../dax_measures/)
- Data audit tables: [`/data_cleaning_tables`](../data_cleaning_tables/)
- README analysis section: see the main project README

---

*This model underpins all insights and dashboards in the project, ensuring accuracy, consistency, and high analytical performance in Power BI.*
