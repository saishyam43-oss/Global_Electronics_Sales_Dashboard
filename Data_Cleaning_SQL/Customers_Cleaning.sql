-- Customers Table Data Profiling and Cleaning Pipeline
-- ---------------------------------------------------
-- This script profiles, validates, and cleans the customers raw dataset prior to standardized modeling.
-- Profiling queries provide full context for decisions and transformations.
-- Author: Saishyam T
-- Date: 2025-10-28

-- STEP 1: Basic Data Health Checks
-- Assess overall completeness and missing values
SELECT COUNT(*) AS TotalRows FROM customersraw;

SELECT COUNT(*) AS MissingCriticalFields
FROM customersraw
WHERE CustomerKey IS NULL OR Gender IS NULL OR Name IS NULL OR City IS NULL
   OR StateCode IS NULL OR State IS NULL OR ZipCode IS NULL
   OR Country IS NULL OR Continent IS NULL OR Birthday IS NULL; -- 45 rows missing one or more critical fields

-- Focused missing value breakdown
SELECT COUNT(*) AS MissingGender FROM customersraw WHERE Gender IS NULL;
SELECT COUNT(*) AS MissingStateCode FROM customersraw WHERE StateCode IS NULL;
SELECT COUNT(*) AS MissingBirthday FROM customersraw WHERE Birthday IS NULL;

-- STEP 2: Key Integrity and Duplicate Analysis
SELECT CustomerKey, COUNT(*) AS DuplicateCount
FROM customersraw
GROUP BY CustomerKey
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC; -- 47 duplicate customer keys identified

SELECT Name, COUNT(*) AS NameDuplicates
FROM customersraw
GROUP BY Name
HAVING COUNT(*) > 1
ORDER BY NameDuplicates DESC; -- 189 duplicate names found

-- STEP 3: Field Format Assessment
-- Gender normalization review
SELECT DISTINCT TRIM(Gender) FROM customersraw; -- Identify formats needing standardization

-- Birthday format review
SELECT LENGTH(Birthday) AS DateLength,
       CASE
           WHEN Birthday LIKE '%/%' THEN 'Slashes'
           WHEN Birthday LIKE '%-%' THEN 'Dashes'
           ELSE 'No Separator'
       END AS SeparatorType,
       COUNT(*) AS RowCount
FROM customersraw
WHERE Birthday IS NOT NULL
GROUP BY LENGTH(Birthday), SeparatorType
ORDER BY DateLength, SeparatorType; -- Multiple formats found; cleaning needed

-- STEP 4: Geographic Hierarchy Reliability
-- Zip codes with multiple State mappings
SELECT ZipCode, COUNT(DISTINCT State) AS StateCount
FROM customersraw
WHERE ZipCode IS NOT NULL
GROUP BY ZipCode
HAVING COUNT(DISTINCT State) > 1
ORDER BY StateCount DESC; -- 233 zip codes with >1 state flag

-- Cities mapped to multiple States
SELECT City, COUNT(DISTINCT State) AS StateCount
FROM customersraw
WHERE City IS NOT NULL
GROUP BY City
HAVING COUNT(DISTINCT State) > 1
ORDER BY StateCount DESC; -- 435 cities have more than one mapped state

-- States mapped to multiple Countries
SELECT State, COUNT(DISTINCT Country) AS CountryCount
FROM customersraw
WHERE State IS NOT NULL
GROUP BY State
HAVING COUNT(DISTINCT Country) > 1
ORDER BY CountryCount DESC; -- 10 such cases

-- STEP 5: Length/Value Outliers
SELECT LENGTH(CustomerKey) AS KeyLength, COUNT(*) AS Count
FROM customersraw
GROUP BY KeyLength
ORDER BY KeyLength; -- 4 rows found with length 3 (possible data error)

-- STEP 6: Data Cleaning Transformations

-- Normalize Gender
ALTER TABLE customersraw ADD COLUMN GenderCleaned TEXT;
UPDATE customersraw
SET GenderCleaned = CASE
    WHEN UPPER(TRIM(Gender)) IN ('M', 'MALE') THEN 'Male'
    WHEN UPPER(TRIM(Gender)) IN ('F', 'FEMALE') THEN 'Female'
    WHEN Gender IS NULL THEN 'Unknown'
    ELSE 'Other'
END;

-- Standardize Birthday format (create new column)
ALTER TABLE customersraw ADD COLUMN Birthday_Cleaned TEXT;
UPDATE customers_raw
SET Birthday_Cleaned = CASE

    -- Format 1: 'YYYY-MM-DD' (10 chars, dashes)
    -- This is already correct.
    WHEN LENGTH(Birthday) = 10 AND Birthday LIKE '____-__-__' THEN
        Birthday

    -- Format 2 (FIXED): 'DD-MM-YYYY' (10 chars, dashes)
    -- Check if first part is > 12 (e.g., '14-03-2020')
    WHEN LENGTH(Birthday) = 10 AND Birthday LIKE '__-__-____' AND CAST(SUBSTR(Birthday, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Birthday, 7, 4) || '-' || SUBSTR(Birthday, 4, 2) || '-' || SUBSTR(Birthday, 1, 2)

    -- Format 3: 'MM-DD-YYYY' (10 chars, dashes)
    -- This now handles '03-14-2020' and assumes ambiguous '01-05-2020' is MM-DD.
    WHEN LENGTH(Birthday) = 10 AND Birthday LIKE '__-__-____' THEN
        SUBSTR(Birthday, 7, 4) || '-' || SUBSTR(Birthday, 1, 2) || '-' || SUBSTR(Birthday, 4, 2)

    -- Format 4 (FIXED): 'DD/MM/YYYY' (10 chars, slashes)
    -- Check if first part is > 12 (e.g., '14/03/2020')
    WHEN LENGTH(Birthday) = 10 AND Birthday LIKE '__/__/____' AND CAST(SUBSTR(Birthday, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Birthday, 7, 4) || '-' || SUBSTR(Birthday, 4, 2) || '-' || SUBSTR(Birthday, 1, 2)

    -- Format 5: 'MM/DD/YYYY' (10 chars, slashes)
    -- This now handles '03/14/2020' and assumes ambiguous '01/05/2020' is MM/DD.
    WHEN LENGTH(Birthday) = 10 AND Birthday LIKE '__/__/____' THEN
        SUBSTR(Birthday, 7, 4) || '-' || SUBSTR(Birthday, 1, 2) || '-' || SUBSTR(Birthday, 4, 2)

    -- Format 6: 'M/D/YYYY' (8 chars, slashes) -> Assumed M/D/YYYY
    WHEN LENGTH(Birthday) = 8 AND Birthday LIKE '_/_/____' THEN
        SUBSTR(Birthday, 5, 4) || '-0' || SUBSTR(Birthday, 1, 1) || '-0' || SUBSTR(Birthday, 3, 1)

    -- Format 7: 'M/DD/YYYY' (9 chars, slashes) -> Assumed M/DD/YYYY
    -- Catches '1/13/2016'
    WHEN LENGTH(Birthday) = 9 AND Birthday LIKE '_/__/____' THEN
        SUBSTR(Birthday, 6, 4) || '-0' || SUBSTR(Birthday, 1, 1) || '-' || SUBSTR(Birthday, 3, 2)

    -- Format 8: 'MM/D/YYYY' (9 chars, slashes) -> Assumed MM/D/YYYY
    WHEN LENGTH(Birthday) = 9 AND Birthday LIKE '__/_/____' THEN
        SUBSTR(Birthday, 6, 4) || '-' || SUBSTR(Birthday, 1, 2) || '-0' || SUBSTR(Birthday, 4, 1)

    -- Add other rules here if you find them...

    -- Else, set to NULL so we can find it.
    ELSE NULL

END;

-- Calculate Age as of analysis date (2021-03-01 for sample)
ALTER TABLE customersraw ADD COLUMN Age INTEGER;
UPDATE customersraw
SET Age =
    CASE
        WHEN Birthday_Cleaned IS NOT NULL
            THEN CAST(strftime('%Y', '2021-03-01') AS INTEGER) - CAST(strftime('%Y', Birthday_Cleaned) AS INTEGER)
                 - CASE WHEN strftime('%m-%d', '2021-03-01') < strftime('%m-%d', Birthday_Cleaned) THEN 1 ELSE 0 END
        ELSE NULL
    END;

-- Standardize Country (trim extra spaces, uppercase)
ALTER TABLE customersraw ADD COLUMN CountryCleaned TEXT;
UPDATE customersraw SET CountryCleaned = TRIM(UPPER(Country));

-- STEP 7: Final Table Creation (including reliable geographic mapping)
CREATE TABLE CustomersFinal AS
SELECT
    c.CustomerKey,
    COALESCE(c.Name, 'Unknown') AS Name,
    COALESCE(c.GenderCleaned, 'Unknown') AS Gender,
    c.Birthday_Cleaned AS Birthday,
    c.Age,
    c.ZipCode AS OriginalZipCode,
    z.zipcode AS CleanedZipCode,
    z.city AS City,
    z.state AS State,
    z.statecode AS StateCode,
    z.countryname AS Country,
    /* Map continent according to country, fallback if not detected */
    CASE
        WHEN z.countryname = 'UNITED STATES' THEN 'North America'
        WHEN z.countryname = 'CANADA' THEN 'North America'
        WHEN z.countryname = 'AUSTRALIA' THEN 'Australia'
        WHEN z.countryname IN ('UNITED KINGDOM', 'GERMANY', 'FRANCE', 'ITALY', 'NETHERLANDS') THEN 'Europe'
        ELSE c.Continent
    END AS Continent,
    /* Flag duplicates using window function */
    CASE WHEN ROW_NUMBER() OVER (PARTITION BY c.CustomerKey ORDER BY c.Name) > 1 THEN 'Duplicate' ELSE NULL END AS DuplicateFlag
FROM customersraw AS c
LEFT JOIN ziplookup AS z ON c.ZipCode = z.zipcode AND z.countryname = c.CountryCleaned;

-- ---------------------------------------------------
-- End of Customers table cleaning workflow.
-- All checks and cleaning logic documented for full reproducibility.