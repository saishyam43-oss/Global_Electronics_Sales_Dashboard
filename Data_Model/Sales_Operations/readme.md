# ⭐ Power BI Data Model — Star Schema (Documentation)

This file documents the data model used for the **Global Electronics Retail Sales Dashboard**, designed using a standard **Star Schema** to optimize analytical performance, DAX calculations, and Power BI interactivity.

---

## 🧱 1. Model Overview

The cleaned datasets were transformed into a Star Schema consisting of:

### **Fact Table**
- **`sales_final`**
  - One row per transaction (line-item granularity)
  - Fully validated keys for Product, Customer, Store
  - Currency-normalized revenue and cost
  - Delivery data, recency, and time-based attributes

### **Dimension Tables**
- **`products`**  
  Brand, Category, Subcategory, SKU-level attributes

- **`customers`**  
  Demographics, cohorts, geography, recency fields

- **`stores`**  
  Store location metadata, size (sqm), open date

- **`exchange_rates_final`**  
  Monthly conversion rates for USD normalization and currency impact analysis

- **`Calendar`**  
  This is a **DAX-generated calculated table**, created manually inside Power BI using a continuous date range (2016–2021).  
  It includes:
  - Date
  - Year / Quarter / Month / Day
  - Day of Week (name + number)
  - Day of Year
  - Sort-order columns for correct chronological visuals

  The Calendar table is explicitly marked as the **Date Table**, ensuring correct and predictable behavior for all time-intelligence DAX functions such as:
  - `DATESYTD`
  - `DATEADD`
  - `SAMEPERIODLASTYEAR`
  - Rolling averages

---

## 🕸 2. Relationship Structure

The schema follows a **one-to-many** pattern across all major relationships:

- `products` → `sales_final`  
- `customers` → `sales_final`  
- `stores` → `sales_final`  
- `exchange_rates_final` → `sales_final`  
- `Calendar` → `sales_final`

All relationships are **single-directional** from dimensions to fact, ensuring predictable filtering and stable DAX evaluation.

---

## 🔄 2.1 Special Case: Many-to-Many Relationship  
### **(Currency ↔ Currency_Code)**

A **many-to-many** relationship exists between:

- `exchange_rates_final[Currency]`  
- `sales_final[Currency_Code]`

This design is intentional because:

- Multiple regions may share the same currency (e.g., USD used by several countries).  
- Exchange rates are stored at a monthly grain, while transactions occur at a daily grain.  
- Currency normalization is performed at the fact level using DAX measures and column logic.

To avoid ambiguity:
- The relationship is kept **single-directional**,  
- No bidirectional filters are used,  
- All conversion logic references the date relationship (one-to-many) as the primary driver.

This ensures clean and deterministic evaluations.

---

## ⚙️ 3. Modeling Decisions & Best Practices Applied

### ✔ Single Fact Table  
Reduces complexity and improves DAX performance.

### ✔ Currency-Normalized Metrics  
Revenue and cost values were standardized into USD using monthly exchange rates.

### ✔ Geo-Validated Dimensions  
100% clean City → State → Country mappings ensure accurate region-based reporting.

### ✔ Hierarchical Dimensions  
- Category → Subcategory → Product  
- Cohort → Age Group → Customer  

These hierarchies power drill-downs and high-level segment analysis.

### ✔ Optimized Cardinality  
All keys were de-duplicated during SQL cleaning, preventing slow, high-cardinality joins.

### ✔ Custom Date Table (DAX Calculated)
A dedicated Calendar table was created using DAX, rather than relying on Power BI’s auto date table.  
This ensures:
- Full control over time granularity  
- Accurate time-intelligence calculations  
- Consistent sorting and hierarchical drilldowns (Year → Month → Day)  

---

## 🧮 4. Calculated Columns (Power BI Transformations)

Several important calculated columns were created **during analytical modeling (post-cleaning)** to enable richer business analysis.  
These were intentionally added inside Power BI rather than SQL to support dynamic visuals and DAX behavior.

### Key Calculated Columns
- **Customer Age Group**
- **Customer Cohort (Year–Month of first purchase)**
- **Delivery Days & Delivery Speed Buckets**
- **Recency Bins** (Active, Recent, Warm, Dormant)
- **Product Hierarchy Fields** (Category → Subcategory → SKU)
- **Sort-Order Columns** for age groups, months, and categories
- **Normalized USD Revenue & Cost Columns**
- **Months Since First Purchase**

The full list of calculated columns and logic is documented here:  
📁 [`/DAX/Columns/Sales_Operations/readme.md`](/DAX/Columns/Sales_Operations/readme.md)

---

## 🚀 5. Why a Star Schema?

This model was chosen because it:

- Improves query performance  
- Supports clean & predictable DAX evaluation  
- Eliminates many-to-many ambiguity  
- Enables drilldown analysis across product, customer, and region  
- Simplifies YTD, YoY, cohort, and retention calculations  

---

## 📊 6. Visual Model Reference

<div align="center">

<img src="Star_Schema.png" alt="Star Schema Diagram" width="800"/>

</div>

---

## 📁 7. Related Files

- SQL Cleaning Scripts → [`/data_cleaning_sql`](../data_cleaning_sql/)  
- DAX Measures → [`/dax_measures`](../dax_measures/)  
- Audit Tables → [`/data_cleaning_tables`](../data_cleaning_tables/)  
- Main README → root of repository  

---

*This model is the analytical backbone of the Global Electronics project, ensuring accuracy, stability, and high-value insight generation.*
