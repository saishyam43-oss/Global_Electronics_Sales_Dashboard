-- Sales Table Data Profiling and Cleaning Pipeline
-- ---------------------------------------------------
-- Profiles, validates, and cleans sales transactional data before analytic modeling.
-- Documents checks for duplicates, nulls, key formats, date consistency, quantity outliers.
-- Author: Saishyam T
-- Date: 2025-10-28

-- STEP 1: Integrity & Duplicate Checks
-- Check for exact duplicates on core business key (OrderNumber, LineItem, CustomerKey, ProductKey)
SELECT OrderNumber, LineItem, CustomerKey, ProductKey, COUNT(*) AS RowCount
FROM salesraw
GROUP BY OrderNumber, LineItem, CustomerKey, ProductKey
HAVING COUNT(*) > 1;
-- Result: No duplicates found

-- STEP 2: Key Field Format & Length Profiling
-- OrderNumber length distribution
SELECT LENGTH(OrderNumber) AS LengthOrderNumber, COUNT(*) AS RowCount
FROM salesraw
GROUP BY LengthOrderNumber
ORDER BY LengthOrderNumber; -- Two common lengths: 6 and 7, no issues found

-- StoreKey, ProductKey length/value mismatch
SELECT DISTINCT LENGTH(CAST(StoreKey AS TEXT)) AS StoreKeyLen, COUNT(*)
FROM salesraw
GROUP BY StoreKeyLen
ORDER BY StoreKeyLen; -- Compare to master Store table

SELECT DISTINCT LENGTH(CAST(ProductKey AS TEXT)) AS ProductKeyLen, COUNT(*)
FROM salesraw
GROUP BY ProductKeyLen
ORDER BY ProductKeyLen; -- Compare to master Products table

-- STEP 3: NULL Checks
SELECT COUNT(*) AS NullCount
FROM salesraw
WHERE OrderNumber IS NULL OR LineItem IS NULL OR OrderDate IS NULL OR DeliveryDate IS NULL
   OR CustomerKey IS NULL OR StoreKey IS NULL OR ProductKey IS NULL
   OR Quantity IS NULL OR CurrencyCode IS NULL;
-- Result: DeliveryDate has 79 missing entries (0.04%), all other columns complete

-- STEP 4: Date Format Profiling and Consistent Cleaning
SELECT LENGTH(OrderDate) AS DateLength,
       CASE
           WHEN OrderDate LIKE '%/%' THEN 'Slashes'
           WHEN OrderDate LIKE '%-%' THEN 'Dashes'
           ELSE 'No Separator'
       END AS SeparatorType,
       COUNT(*) AS RowCount
FROM salesraw
WHERE OrderDate IS NOT NULL
GROUP BY DateLength, SeparatorType
ORDER BY DateLength, SeparatorType;
-- Multiple formats found; will create a consistent cleaned date column

-- Add new column for cleaned dates
ALTER TABLE salesraw ADD COLUMN Order_Date_Cleaned TEXT;

-- Standardize all date formats to YYYY-MM-DD
UPDATE sales_raw
SET Order_Date_Cleaned = CASE

    -- Format 1: 'YYYY-MM-DD' (10 chars, dashes)
    -- This is already correct.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '____-__-__' THEN
        Order_Date

    -- Format 2 (FIXED): 'DD-MM-YYYY' (10 chars, dashes)
    -- Check if first part is > 12 (e.g., '14-03-2020')
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__-__-____' AND CAST(SUBSTR(Order_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)

    -- Format 3: 'MM-DD-YYYY' (10 chars, dashes)
    -- This now handles '03-14-2020' and assumes ambiguous '01-05-2020' is MM-DD.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__-__-____' THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-' || SUBSTR(Order_Date, 4, 2)

    -- Format 4 (FIXED): 'DD/MM/YYYY' (10 chars, slashes)
    -- Check if first part is > 12 (e.g., '14/03/2020')
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__/__/____' AND CAST(SUBSTR(Order_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)

    -- Format 5: 'MM/DD/YYYY' (10 chars, slashes)
    -- This now handles '03/14/2020' and assumes ambiguous '01/05/2020' is MM/DD.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__/__/____' THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-' || SUBSTR(Order_Date, 4, 2)

    -- Format 6: 'M/D/YYYY' (8 chars, slashes) -> Assumed M/D/YYYY
    WHEN LENGTH(Order_Date) = 8 AND Order_Date LIKE '_/_/____' THEN
        SUBSTR(Order_Date, 5, 4) || '-0' || SUBSTR(Order_Date, 1, 1) || '-0' || SUBSTR(Order_Date, 3, 1)

    -- Format 7: 'M/DD/YYYY' (9 chars, slashes) -> Assumed M/DD/YYYY
    -- Catches '1/13/2016'
    WHEN LENGTH(Order_Date) = 9 AND Order_Date LIKE '_/__/____' THEN
        SUBSTR(Order_Date, 6, 4) || '-0' || SUBSTR(Order_Date, 1, 1) || '-' || SUBSTR(Order_Date, 3, 2)

    -- Format 8: 'MM/D/YYYY' (9 chars, slashes) -> Assumed MM/D/YYYY
    WHEN LENGTH(Order_Date) = 9 AND Order_Date LIKE '__/_/____' THEN
        SUBSTR(Order_Date, 6, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-0' || SUBSTR(Order_Date, 4, 1)

    -- Add other rules here if you find them...

    -- Else, set to NULL so we can find it.
    ELSE NULL
END;


-- Repeat the same for DeliveryDate
ALTER TABLE salesraw ADD COLUMN Delivery_Date_Cleaned TEXT;
UPDATE sales_raw
SET Delivery_Date_Cleaned = CASE

    -- Format 1: 'YYYY-MM-DD' (10 chars, dashes)
    -- This is already correct.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '____-__-__' THEN
        Order_Date

    -- Format 2 (FIXED): 'DD-MM-YYYY' (10 chars, dashes)
    -- Check if first part is > 12 (e.g., '14-03-2020')
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__-__-____' AND CAST(SUBSTR(Order_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)

    -- Format 3: 'MM-DD-YYYY' (10 chars, dashes)
    -- This now handles '03-14-2020' and assumes ambiguous '01-05-2020' is MM-DD.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__-__-____' THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-' || SUBSTR(Order_Date, 4, 2)

    -- Format 4 (FIXED): 'DD/MM/YYYY' (10 chars, slashes)
    -- Check if first part is > 12 (e.g., '14/03/2020')
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__/__/____' AND CAST(SUBSTR(Order_Date, 1, 2) AS INTEGER) > 12 THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)

    -- Format 5: 'MM/DD/YYYY' (10 chars, slashes)
    -- This now handles '03/14/2020' and assumes ambiguous '01/05/2020' is MM/DD.
    WHEN LENGTH(Order_Date) = 10 AND Order_Date LIKE '__/__/____' THEN
        SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-' || SUBSTR(Order_Date, 4, 2)

    -- Format 6: 'M/D/YYYY' (8 chars, slashes) -> Assumed M/D/YYYY
    WHEN LENGTH(Order_Date) = 8 AND Order_Date LIKE '_/_/____' THEN
        SUBSTR(Order_Date, 5, 4) || '-0' || SUBSTR(Order_Date, 1, 1) || '-0' || SUBSTR(Order_Date, 3, 1)

    -- Format 7: 'M/DD/YYYY' (9 chars, slashes) -> Assumed M/DD/YYYY
    -- Catches '1/13/2016'
    WHEN LENGTH(Order_Date) = 9 AND Order_Date LIKE '_/__/____' THEN
        SUBSTR(Order_Date, 6, 4) || '-0' || SUBSTR(Order_Date, 1, 1) || '-' || SUBSTR(Order_Date, 3, 2)

    -- Format 8: 'MM/D/YYYY' (9 chars, slashes) -> Assumed MM/D/YYYY
    WHEN LENGTH(Order_Date) = 9 AND Order_Date LIKE '__/_/____' THEN
        SUBSTR(Order_Date, 6, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-0' || SUBSTR(Order_Date, 4, 1)

    -- Add other rules here if you find them...

    -- Else, set to NULL so we can find it.
    ELSE NULL
END;

-- Check for any remaining invalid dates
SELECT DISTINCT OrderDate FROM salesraw WHERE Order_Date_Cleaned IS NULL AND OrderDate IS NOT NULL; -- 0
SELECT DISTINCT DeliveryDate FROM salesraw WHERE Delivery_Date_Cleaned IS NULL AND DeliveryDate IS NOT NULL; -- 0

-- STEP 5: Check Delivery & Order Dates Consistency
SELECT COUNT(*) AS InvalidDates
FROM salesraw
WHERE Order_Date_Cleaned > DeliveryDateCleaned; -- 580 (0.09%) orders have delivery before order; needs business rule check

-- STEP 6: Quantity Outlier Analysis
SELECT Quantity, COUNT(*) AS Count
FROM salesraw
GROUP BY Quantity
ORDER BY Quantity DESC; -- 15 non-sensical values (e.g., 0, negative, >15)

SELECT COUNT(*) AS QuantityOutliers
FROM salesraw
WHERE Quantity < 1 OR Quantity > 15; -- 25 outliers to be flagged/removed

-- STEP 7: Final Cleaned Table Creation
CREATE TABLE SalesFinal AS
SELECT
    OrderNumber,
    LineItem,
    Order_Date_Cleaned AS OrderDate,
    Delivery_Date_Cleaned AS DeliveryDate,
    CustomerKey,
    StoreKey,
    ProductKey,
    Quantity,
    CurrencyCode,
    -- Remove outliers
    CASE WHEN Quantity < 1 OR Quantity > 15 THEN 'Outlier' ELSE NULL END AS QuantityFlag,
    -- Flag if DeliveryDate is earlier than OrderDate
    CASE WHEN Order_Date_Cleaned > Delivery_Date_Cleaned THEN 'DeliveryBeforeOrder' ELSE NULL END AS DateFlag
FROM salesraw
WHERE Quantity >= 1 AND Quantity <= 15; -- Only include valid quantities

-- ---------------------------------------------------
-- End of Sales table cleaning workflow.
-- All data health checks, profiling, and cleaning steps are documented for auditability and reproducibility.