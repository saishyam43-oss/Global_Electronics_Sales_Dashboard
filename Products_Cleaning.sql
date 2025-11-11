-- Products Table Data Profiling and Cleaning Pipeline
-- ---------------------------------------------------
-- Data profiling, integrity checks, and cleaning for product master data.
-- Covers duplicates, nulls, mapping reliability, and price logic.
-- Author: Saishyam T
-- Date: 2025-10-28

-- STEP 1: Basic Data Health Checks
SELECT COUNT(*) AS TotalRows FROM productsraw; -- 2617 rows

-- Focused Missing Value Analysis
SELECT COUNT(*) AS NullCriticalFields FROM productsraw
WHERE productkey IS NULL OR productname IS NULL OR brand IS NULL OR color IS NULL
   OR unitcostusd IS NULL OR unitpriceusd IS NULL
   OR subcategorykey IS NULL OR subcategory IS NULL
   OR categorykey IS NULL OR category IS NULL; -- 28 rows missing required fields (mostly brand/color)

SELECT COUNT(*) AS NullBrand FROM productsraw WHERE brand IS NULL; -- 21 nulls
SELECT COUNT(*) AS NullColor FROM productsraw WHERE color IS NULL; -- 7 nulls

-- STEP 2: Key Integrity and Duplicate Analysis
SELECT productkey, COUNT(*) AS DuplicateCount
FROM productsraw
GROUP BY productkey
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC; -- 168 ProductKey duplicates found

-- Duplicated rows for ProductKey-ProductName combos
SELECT productkey, productname, COUNT(*) AS ComboDuplicates
FROM productsraw
GROUP BY productkey, productname
HAVING COUNT(*) > 1
ORDER BY ComboDuplicates DESC; -- View all duplicated product keys

-- STEP 3: Categorical Mapping Reliability
-- Profile category and subcategory key mappings for consistency
SELECT categorykey, COUNT(DISTINCT category) AS DistinctCategoryCount
FROM productsraw
GROUP BY categorykey
HAVING COUNT(DISTINCT category) > 1; -- 3 keys map to multiple categories

SELECT subcategorykey, COUNT(DISTINCT subcategory) AS DistinctSubcategoryCount
FROM productsraw
GROUP BY subcategorykey
HAVING COUNT(DISTINCT subcategory) > 1; -- 2 keys map to multiple subcategories

-- Brand and Color Values, Coverage
SELECT DISTINCT brand FROM productsraw ORDER BY brand; -- 19 brands found, plus NULL
SELECT DISTINCT color FROM productsraw ORDER BY color; -- 17 colors found, plus NULL

-- STEP 4: Logical Field Consistency
-- Check cost/price logic and outliers
SELECT MAX(CAST(TRIM(REPLACE(REPLACE(unitcostusd, ',', ''), ' ','')) AS REAL)) AS MaxCost,
       MIN(CAST(TRIM(REPLACE(REPLACE(unitcostusd, ',', ''), ' ','')) AS REAL)) AS MinCost,
       AVG(CAST(TRIM(REPLACE(REPLACE(unitcostusd, ',', ''), ' ','')) AS REAL)) AS AvgCost,
       MAX(CAST(TRIM(REPLACE(REPLACE(unitpriceusd, ',', ''), ' ','')) AS REAL)) AS MaxPrice,
       MIN(CAST(TRIM(REPLACE(REPLACE(unitpriceusd, ',', ''), ' ','')) AS REAL)) AS MinPrice,
       AVG(CAST(TRIM(REPLACE(REPLACE(unitpriceusd, ',', ''), ' ','')) AS REAL)) AS AvgPrice
FROM productsraw; -- Review for statistical outliers (e.g., reported MaxCost = 1060.22, MinCost = 0.48; MaxPrice = 3199.99)

-- Logical test: cost should never exceed price
SELECT * FROM productsraw
WHERE CAST(TRIM(REPLACE(REPLACE(unitcostusd, ',', ''), ' ','')) AS REAL) >
      CAST(TRIM(REPLACE(REPLACE(unitpriceusd, ',', ''), ' ','')) AS REAL); -- 15 illogical pricing rows flagged

-- STEP 5: Data Cleaning Transformations
CREATE TABLE ProductsFinal AS
-- Category and Subcategory Mappings to Most Frequent Value (for reliable analytics)
WITH CategoryMapRanked AS (
    SELECT categorykey, category, COUNT(*) AS Freq,
        ROW_NUMBER() OVER (PARTITION BY categorykey ORDER BY COUNT(*) DESC, category) AS rn
    FROM productsraw 
    GROUP BY categorykey, category
),
CategoryMap AS (
    SELECT categorykey, category FROM CategoryMapRanked WHERE rn = 1
),
SubcategoryMapRanked AS (
    SELECT subcategorykey, subcategory, COUNT(*) AS Freq,
        ROW_NUMBER() OVER (PARTITION BY subcategorykey ORDER BY COUNT(*) DESC, subcategory) AS rn
    FROM productsraw
    GROUP BY subcategorykey, subcategory
),
SubcategoryMap AS (
    SELECT subcategorykey, subcategory FROM SubcategoryMapRanked WHERE rn = 1
),

ProductsBase AS (
    SELECT
        p.*,
        COALESCE(p.productname, 'Unknown') AS ProductNameCleaned,
        COALESCE(p.brand, 'Unknown') AS BrandCleaned,
        COALESCE(p.color, 'Unknown') AS ColorCleaned,
        CAST(TRIM(REPLACE(REPLACE(p.unitcostusd, ',', ''), ' ','')) AS REAL) AS UnitCostCleaned,
        CAST(TRIM(REPLACE(REPLACE(p.unitpriceusd, ',', ''), ' ','')) AS REAL) AS UnitPriceCleaned,
        cm.category AS CategoryCleaned,
        sm.subcategory AS SubcategoryCleaned,
        ROW_NUMBER() OVER (PARTITION BY p.productkey ORDER BY p.productname) AS rn
    FROM productsraw AS p
    LEFT JOIN CategoryMap AS cm ON p.categorykey = cm.categorykey
    LEFT JOIN SubcategoryMap AS sm ON p.subcategorykey = sm.subcategorykey
)

-- STEP 6: Final Products Table Creation

SELECT
    productkey,
    ProductNameCleaned AS productname,
    BrandCleaned AS brand,
    ColorCleaned AS color,
    subcategorykey,
    categorykey,
    SubcategoryCleaned AS subcategory,
    CategoryCleaned AS category,
    UnitCostCleaned AS unitcostusd,
    UnitPriceCleaned AS unitpriceusd,
    CASE WHEN rn > 1 THEN 'Duplicate' ELSE NULL END AS duplicateflag
FROM ProductsBase
WHERE UnitCostCleaned <= UnitPriceCleaned; -- Only include rows with logical pricing

-- ---------------------------------------------------
-- End of Products table data cleaning workflow.
-- All intermediate profiling/checks are documented for full analytic transparency.