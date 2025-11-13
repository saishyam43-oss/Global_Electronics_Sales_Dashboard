-- Aggregation and Referential Integrity Checks Script
-- --------------------------------------------------
-- This script contains key aggregation validation logic, entity integrity, and sentinel handling as performed for your project.
-- Helps identify impossible joins, orphaned keys, and other aggregation-level issues.
-- Author: Saishyam T
-- Date: 2025-10-28

-- 1. Check Sales Occurring Before the Store Opened
SELECT
    s.OrderNumber,
    s.StoreKey,
    s.OrderDateCleaned AS SaleDate,
    st.OpenDateCleaned AS StoreOpenDate
FROM salesraw AS s
JOIN storesraw AS st ON s.StoreKey = st.StoreKey
WHERE
    s.OrderDateCleaned IS NOT NULL
    AND st.OpenDateCleaned IS NOT NULL
    AND s.OrderDateCleaned < st.OpenDateCleaned;
-- Flags sales records where sale occurred before store officially opened.

-- 2. Check for Invalid ProductKeys in Sales Table
SELECT DISTINCT s.ProductKey
FROM salesraw AS s
LEFT JOIN productsraw AS p ON s.ProductKey = p.ProductKey
WHERE p.ProductKey IS NULL;
-- Detects sales records pointing to products that do not exist.

-- 3. Check for Invalid StoreKeys in Sales Table
SELECT DISTINCT s.StoreKey
FROM salesraw AS s
LEFT JOIN storesraw AS st ON s.StoreKey = st.StoreKey
WHERE st.StoreKey IS NULL;
-- Detects sales records with store IDs not present in stores table.

-- 4. Create Sentinel Customer/Handle NULL Customers in Sales
INSERT INTO CustomersFinal (CustomerKey, Name, Gender, City, State, Country, Age, Continent)
VALUES (0, 'Anonymous Sale', 'Unknown', 'Unknown', 'Unknown', 'Unknown', NULL, 'Unknown');

UPDATE salesraw
SET CustomerKey = 0
WHERE CustomerKey IS NULL;
-- Fills missing customer references with sentinel customer record.

-- 5. Insert Sentinel in Customers Raw Table (for historical reference)
INSERT INTO customersraw (CustomerKey, Gender, Name, City, StateCode, State, ZipCode, Country, Continent, Birthday, GenderCleaned, BirthdayCleaned, Age)
VALUES (-999, 'Unknown', 'Anonymous Sale', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', NULL, NULL);

-- 6. Remove Records with Invalid ProductKeys from Sales
DELETE FROM salesraw
WHERE ProductKey NOT IN (SELECT DISTINCT ProductKey FROM productsraw);
-- Removes orphan sales records with invalid product references.

-- 7. Remove Records with Invalid StoreKeys from Sales
DELETE FROM salesraw
WHERE StoreKey NOT IN (SELECT DISTINCT StoreKey FROM storesraw);
-- Removes orphan sales records with invalid store references.

-- 8. Remove Records Where Sale Occurred Before Store Opened
DELETE FROM salesraw
WHERE ROWID IN (
    SELECT s.ROWID
    FROM salesraw s
    JOIN storesraw st ON s.StoreKey = st.StoreKey
    WHERE s.OrderDateCleaned < st.OpenDateCleaned
);
-- Cleans out sales records with impossible date relationships to store opening.

-- 9. Remove Specific Invalid Store-Country-State Joins in Final Tables (if flagged)
DELETE FROM salesfinal
WHERE storekey IN (
    SELECT storekey
    FROM storesfinal
    WHERE
        (Country = 'United States' AND State = 'Ontario')
        OR (Country = 'United States' AND State = 'Scotland')
        OR (Country = 'Canada' AND State = 'Scotland')
        OR (Country = 'United Kingdom' AND State = 'Texas')
    )
    AND duplicateflag IS NULL;
-- Removes records with flagged country-state mismatches (customized per project findings).

-- --------------------------------------------------
-- End of aggregation and cross-table validation checks.
-- --------------------------------------------------