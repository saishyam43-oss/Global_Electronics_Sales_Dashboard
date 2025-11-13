-- Exchange Rates Data Cleaning and Transformation SQL
-- ---------------------------------------------------
-- This script was created for standardizing and cleaning raw currency exchange rates data.
-- The goal is to create a reliable final ExchangeRates table for analysis, reporting, or dashboarding.
-- Each transformation step addresses a specific data issue as detailed below.
-- Author: Saishyam T
-- Date: 2025-10-28

-- STEP 1: Inspect & Profile Raw Data
-- Count records, inspect for duplicates, NULLs, and inconsistent column formats.
SELECT COUNT(*) FROM exchangeratesraw;                           -- Check total rows in the raw table

SELECT COUNT(*)
FROM exchangeratesraw
WHERE Date IS NULL OR Currency IS NULL OR Exchange IS NULL;      -- Detect missing values in critical columns

SELECT DISTINCT Currency FROM exchangeratesraw;                  -- List unique currencies and check for inconsistencies

SELECT LENGTH(Date) AS DateLength,
       CASE
           WHEN Date LIKE '%/%' THEN 'Slashes'
           WHEN Date LIKE '%-%' THEN 'Dashes'
           ELSE 'No Separator'
       END AS SeparatorType,
       COUNT(*) AS RowCount
FROM exchangeratesraw
WHERE Date IS NOT NULL
GROUP BY LENGTH(Date), SeparatorType
ORDER BY Date, SeparatorType;                                    -- Assess variety and consistency of date formats

-- STEP 2: Clean and Standardize Data
-- Create a new cleaned date column to standardize all date formats.
ALTER TABLE exchangeratesraw ADD COLUMN Date_Cleaned TEXT;        -- Add cleaned date column

-- Standardize dates into ISO format (YYYY-MM-DD). Handles multiple possible formats.
UPDATE exchange_rates_raw
SET Date_Cleaned = CASE

    -- Format 1: 'YYYY-MM-DD' (10 chars, dashes)
    -- This is already correct.
    WHEN LENGTH(Date) = 10 AND Date LIKE '____-__-__' THEN
        Date

    -- Format 2 (FIXED): 'DD-MM-YYYY' (10 chars, dashes)
    -- Check if first part is > 12 (e.g., '14-03-2020')
    WHEN LENGTH(Date) = 10 AND Date LIKE '__-__-____' AND CAST(SUBSTR(Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Date, 7, 4) || '-' || SUBSTR(Date, 4, 2) || '-' || SUBSTR(Date, 1, 2)

    -- Format 3: 'MM-DD-YYYY' (10 chars, dashes)
    -- This now handles '03-14-2020' and assumes ambiguous '01-05-2020' is MM-DD.
    WHEN LENGTH(Date) = 10 AND Date LIKE '__-__-____' THEN
        SUBSTR(Date, 7, 4) || '-' || SUBSTR(Date, 1, 2) || '-' || SUBSTR(Date, 4, 2)

    -- Format 4 (FIXED): 'DD/MM/YYYY' (10 chars, slashes)
    -- Check if first part is > 12 (e.g., '14/03/2020')
    WHEN LENGTH(Date) = 10 AND Date LIKE '__/__/____' AND CAST(SUBSTR(Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Date, 7, 4) || '-' || SUBSTR(Date, 4, 2) || '-' || SUBSTR(Date, 1, 2)

    -- Format 5: 'MM/DD/YYYY' (10 chars, slashes)
    -- This now handles '03/14/2020' and assumes ambiguous '01/05/2020' is MM/DD.
    WHEN LENGTH(Date) = 10 AND Date LIKE '__/__/____' THEN
        SUBSTR(Date, 7, 4) || '-' || SUBSTR(Date, 1, 2) || '-' || SUBSTR(Date, 4, 2)

    -- Format 6: 'M/D/YYYY' (8 chars, slashes) -> Assumed M/D/YYYY
    WHEN LENGTH(Date) = 8 AND Date LIKE '_/_/____' THEN
        SUBSTR(Date, 5, 4) || '-0' || SUBSTR(Date, 1, 1) || '-0' || SUBSTR(Date, 3, 1)

    -- Format 7: 'M/DD/YYYY' (9 chars, slashes) -> Assumed M/DD/YYYY
    -- Catches '1/13/2016'
    WHEN LENGTH(Date) = 9 AND Date LIKE '_/__/____' THEN
        SUBSTR(Date, 6, 4) || '-0' || SUBSTR(Date, 1, 1) || '-' || SUBSTR(Date, 3, 2)

    -- Format 8: 'MM/D/YYYY' (9 chars, slashes) -> Assumed MM/D/YYYY
    WHEN LENGTH(Date) = 9 AND Date LIKE '__/_/____' THEN
        SUBSTR(Date, 6, 4) || '-' || SUBSTR(Date, 1, 2) || '-0' || SUBSTR(Date, 4, 1)

    -- Add other rules here if you find them...

    -- Else, set to NULL so we can find it.
    ELSE NULL

END;                                                        -- Repeat/add further branches for all found date formats

-- STEP 3: Remove Outliers in Exchange Rate Values
-- Outliers were identified as values outside [0.6, 1.8]. Two specific extreme values: 0.0001 and 500.
DELETE FROM exchangeratesraw
WHERE Exchange IN (0.0001, 500);                              -- Remove problematic rate outliers

-- STEP 4: Standardize Currency Codes
-- Fix inconsistent casing for currencies, e.g., eur → EUR.
UPDATE exchangeratesraw
SET Currency = UPPER(TRIM(Currency));                         -- Standardize to upper-case, trimmed currency codes

-- STEP 5: Aggregate Duplicate Date-Currency Pairs
-- Some (Date, Currency) pairs have multiple entries. Average these rates (industry standard).
CREATE TABLE ExchangeRatesAggregated AS
SELECT Date_Cleaned AS Date,
       Currency AS Currency,
       AVG(Exchange) AS AvgExchange
FROM exchangeratesraw
GROUP BY Date_Cleaned, Currency;                               -- Remove duplicates by averaging exchange rates per pair

-- STEP 6: Fill in Missing Rates by Carrying Forward Last Known Value
-- Use SQL window functions (LAG) to handle missing Exchange rates by filling with previous day's value (if possible).
CREATE TABLE ExchangeRatesLagged AS
SELECT Date,
       Currency,
       AvgExchange,
       LAG(AvgExchange, 1) OVER (PARTITION BY Currency ORDER BY Date) AS PrevExchange
FROM ExchangeRatesAggregated;

-- STEP 7: Create Final ExchangeRates Table
-- For each Date-Currency, use average rate when available, or previous day's rate if missing.
CREATE TABLE ExchangeRatesFinal AS
SELECT Date,
       Currency,
       COALESCE(AvgExchange, PrevExchange) AS Exchange
FROM ExchangeRatesLagged;

-- ---------------------------------------------------
-- End of SQL data cleaning pipeline for Exchange Rates
-- Each transformation ensures high data quality and reliability for downstream analysis.
-- For questions, refer to project documentation or contact the repo maintainer.
