# DAX Calculated Columns - Data Cleaning Summary

This file contains the DAX formulas used to create helper columns in the static summary tables for the `Data Cleaning Summary` dashboard. These columns are used to simplify measures or create new categories for visualization.

---

```dax
// =====================================================
// Data Cleaning Summary Dashboard - DAX (Columns)
// Author: Saishyam T
// Description: DAX formulas for metrics, KPIs, and reliability in the data_cleaning_summary dashboard.
// Each section contains well-documented measures by topic/table.
// =====================================================

/* ===========================
   COUNTRYWISE_RELIABILITY
   =========================== */

// Unreliability in Customers (Calculated Column)
// 1 minus the reliability value gives the fraction of unreliable records in customers for a country.
Unreliability_in_Customers = 
1 - Countrywise_Reliability[Reliability_in_Customers]
