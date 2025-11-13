-- Stores Table Data Cleaning and Transformation SQL
-- -------------------------------------------------
-- This script standardizes the raw stores data for analytic reliability and joins.
-- Steps: Profiling, column normalization, duplicate detection, date cleaning, and flagging data quality issues.
-- Author: Saishyam T
-- Date: 2025-10-28

-- STEP 1: Inspect & Profile Raw Data
-- Count records, detect NULLs in key columns, check StoreKey uniqueness and date formatting.
SELECT COUNT(*) FROM storesraw;                                          -- Get total row count

SELECT COUNT(DISTINCT StoreKey) FROM storesraw;                          -- Identify unique stores

SELECT StoreKey, COUNT(*) AS RowCount
FROM storesraw
GROUP BY StoreKey
HAVING COUNT(*) > 1
ORDER BY RowCount DESC;                                                  -- Find StoreKeys with duplicates

SELECT COUNT(*)
FROM storesraw
WHERE StoreKey IS NULL OR Country IS NULL OR State IS NULL
   OR SquareMeters IS NULL OR OpenDate IS NULL;                          -- Remove or flag any missing values (if needed)

-- STEP 2: Column Value Profiling
SELECT DISTINCT Country FROM storesraw;                                  -- Check country coding consistency
SELECT DISTINCT State FROM storesraw;                                    -- Check state coding consistency

-- Identify possible many-to-one mappings (for reliability assessment/reporting)
SELECT State, COUNT(DISTINCT Country) AS CountryCount
FROM storesraw
GROUP BY State
HAVING CountryCount > 1;                                                 -- Find states mapped to multiple countries

-- STEP 3: Detect Outliers in Store Size
SELECT MAX(SquareMeters) AS MaxArea,
       MIN(SquareMeters) AS MinArea,
       AVG(SquareMeters) AS AvgArea,
       SUM(SquareMeters) AS TotalArea
FROM storesraw;                                                          -- Review extreme values for SquareMeters

-- STEP 4: Standardize OpenDate Format
-- Many date formats exist; create a canonical column for ISO format (YYYY-MM-DD).
ALTER TABLE storesraw ADD COLUMN OpenDateCleaned TEXT;                   -- Add cleaned date column

UPDATE stores_raw
SET Open_Date_Cleaned = CASE

    -- Format 1: 'YYYY-MM-DD' (10 chars, dashes)
    -- This is already correct.
    WHEN LENGTH(Open_Date) = 10 AND Open_Date LIKE '____-__-__' THEN
        Open_Date

    -- Format 2 (FIXED): 'DD-MM-YYYY' (10 chars, dashes)
    -- Check if first part is > 12 (e.g., '14-03-2020')
    WHEN LENGTH(Open_Date) = 10 AND Open_Date LIKE '__-__-____' AND CAST(SUBSTR(Open_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Open_Date, 7, 4) || '-' || SUBSTR(Open_Date, 4, 2) || '-' || SUBSTR(Open_Date, 1, 2)

    -- Format 3: 'MM-DD-YYYY' (10 chars, dashes)
    -- This now handles '03-14-2020' and assumes ambiguous '01-05-2020' is MM-DD.
    WHEN LENGTH(Open_Date) = 10 AND Open_Date LIKE '__-__-____' THEN
        SUBSTR(Open_Date, 7, 4) || '-' || SUBSTR(Open_Date, 1, 2) || '-' || SUBSTR(Open_Date, 4, 2)

    -- Format 4 (FIXED): 'DD/MM/YYYY' (10 chars, slashes)
    -- Check if first part is > 12 (e.g., '14/03/2020')
    WHEN LENGTH(Open_Date) = 10 AND Open_Date LIKE '__/__/____' AND CAST(SUBSTR(Open_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Open_Date, 7, 4) || '-' || SUBSTR(Open_Date, 4, 2) || '-' || SUBSTR(Open_Date, 1, 2)

    -- Format 5: 'MM/DD/YYYY' (10 chars, slashes)
    -- This now handles '03/14/2020' and assumes ambiguous '01/05/2020' is MM/DD.
    WHEN LENGTH(Open_Date) = 10 AND Open_Date LIKE '__/__/____' THEN
        SUBSTR(Open_Date, 7, 4) || '-' || SUBSTR(Open_Date, 1, 2) || '-' || SUBSTR(Open_Date, 4, 2)

    -- Format 6: 'M/D/YYYY' (8 chars, slashes) -> Assumed M/D/YYYY
    WHEN LENGTH(Open_Date) = 8 AND Open_Date LIKE '_/_/____' THEN
        SUBSTR(Open_Date, 5, 4) || '-0' || SUBSTR(Open_Date, 1, 1) || '-0' || SUBSTR(Open_Date, 3, 1)

    -- Format 7: 'M/DD/YYYY' (9 chars, slashes) -> Assumed M/DD/YYYY
    -- Catches '1/13/2016'
    WHEN LENGTH(Open_Date) = 9 AND Open_Date LIKE '_/__/____' THEN
        SUBSTR(Open_Date, 6, 4) || '-0' || SUBSTR(Open_Date, 1, 1) || '-' || SUBSTR(Open_Date, 3, 2)

    -- Format 8: 'MM/D/YYYY' (9 chars, slashes) -> Assumed MM/D/YYYY
    WHEN LENGTH(Open_Date) = 9 AND Open_Date LIKE '__/_/____' THEN
        SUBSTR(Open_Date, 6, 4) || '-' || SUBSTR(Open_Date, 1, 2) || '-0' || SUBSTR(Open_Date, 4, 1)

    -- Add other rules here if you find them...

    -- Else, set to NULL so we can find it.
    ELSE NULL
END;
-- Expand the CASE statement with all logic from data profiling to handle each encountered date format.

-- STEP 5: Flag Duplicate Stores
-- Industry practice is to maintain original records, but flag duplicates for transparency.
-- Assign a DuplicateFlag for subsequent records (not the earliest per StoreKey, using the oldest OpenDate if available).
CREATE TABLE RankedStores AS
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY StoreKey ORDER BY OpenDateCleaned ASC) AS rn
FROM storesraw;

CREATE TABLE StoresFinal AS
SELECT
    StoreKey,
    Country,
    State,
    SquareMeters,
    Open_Date_Cleaned AS Open_Date,
    CASE
        WHEN rn > 1 THEN 'Duplicate'
        ELSE NULL
    END AS DuplicateFlag
FROM RankedStores;

-- -------------------------------------------------
-- End of Stores table cleaning logic.
-- This delivers a standardized table with date consistency, duplicate flagging, and data quality notes suitable for BI dashboards and reporting.
-- Issues like missing SquareMeters or ambiguous State mappings are flagged (or documented for further review).
-- For questions, consult project documentation or contact the repo maintainer.
