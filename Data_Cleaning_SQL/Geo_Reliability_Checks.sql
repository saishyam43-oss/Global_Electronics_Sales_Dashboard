-- ===========================================
-- Geo Reliability Auditing Script
-- ===========================================
-- This script identifies ambiguous or unreliable geographic mappings in the customer and sales dimensions.
-- Include in your repo for documentation, repeatability, and team review.
-- Author: Saishyam T
-- Date: 2025-10-28

-- ========================================================
-- STEP 1: States Mapped to Multiple Countries (Customers)
-- ========================================================
SELECT state, country, COUNT(*) AS RecordCount
FROM customersfinal
WHERE state IN (
    SELECT state
    FROM customersfinal
    GROUP BY state
    HAVING COUNT(DISTINCT country) > 1
)
GROUP BY state, country
ORDER BY state, country;
-- Result: Flags states (e.g., Arizona, Victoria, Quebec) assigned to >1 country for detailed review.

-- ========================================================
-- STEP 2: Impact of Unreliable State-Country Mappings (Sales)
-- ========================================================
SELECT COUNT(*) AS ImpactedSalesRecords
FROM salesfinal
WHERE customerkey IN (
    SELECT customerkey
    FROM customersfinal
    WHERE (country = 'Australia' AND state IN ('Arizona', 'California', 'Quebec'))
       OR (country = 'Canada' AND state IN ('New York', 'Quebec', 'Queensland', 'Texas', 'Ontario'))
       OR (country = 'United States' AND state IN ('Alberta', 'Ontario', 'South Australia', 'Victoria'))
);
-- Result: Small number of sales impacted by unreliable geo links; can be flagged or excluded.

-- ========================================================
-- STEP 3: Unreliable City-State Mappings (Customers/Sales)
-- ========================================================
-- Add city-state pairs flagged as problematic in previous profiling
SELECT c.state, c.city, COUNT(*) AS CustomerRecords
FROM customersfinal c
WHERE (c.state = 'Washington DC' AND c.city = 'Alexandria')
   OR (c.state = 'Virginia' AND c.city = 'Beltsville')
   OR (c.state = 'Padova' AND c.city = 'Borgoforte')
   OR (c.state = 'Maryland' AND c.city = 'Maryland Heights')
   OR (c.state = 'Rieti' AND c.city = 'SantIppolito')
   OR (c.state = 'Illinois' AND c.city = 'Chicago')
   OR (c.state = 'Indiana' AND c.city = 'Chicago')
   -- Add all other flagged pairs as needed...
GROUP BY c.state, c.city;

SELECT COUNT(*) AS ImpactedSalesCityStateRecords
FROM salesfinal s
WHERE s.customerkey IN (
    SELECT customerkey
    FROM customersfinal
    WHERE (state = 'Washington DC' AND city = 'Alexandria')
       OR (state = 'Virginia' AND city = 'Beltsville')
       OR (state = 'Padova' AND city = 'Borgoforte')
       OR (state = 'Maryland' AND city = 'Maryland Heights')
       OR (state = 'Rieti' AND city = 'SantIppolito')
       OR (state = 'Illinois' AND city = 'Chicago')
       OR (state = 'Indiana' AND city = 'Chicago')
       -- Add all other flagged pairs as needed...
);

-- ========================================================
-- STEP 4: Summary Statistics for Reliability Issues
-- ========================================================
SELECT
    (SELECT COUNT(*) FROM customersfinal WHERE state IN ('Arizona','California','Quebec','New York','Queensland','Texas','Alberta','Ontario','South Australia','Victoria')) AS ProblemGeoCustomers,
    (SELECT COUNT(*) FROM salesfinal WHERE customerkey IN (
        SELECT customerkey FROM customersfinal WHERE state IN ('Arizona','California','Quebec','New York','Queensland','Texas','Alberta','Ontario','South Australia','Victoria'))
    ) AS ProblemGeoSales,
    (SELECT COUNT(*) FROM customersfinal WHERE city IN ('Alexandria','Beltsville','Borgoforte','Maryland Heights','SantIppolito','Chicago')) AS ProblemCityCustomers,
    (SELECT COUNT(*) FROM salesfinal WHERE customerkey IN (
        SELECT customerkey FROM customersfinal WHERE city IN ('Alexandria','Beltsville','Borgoforte','Maryland Heights','SantIppolito','Chicago'))
    ) AS ProblemCitySales;
-- Use these summary numbers for dashboard reliability reporting or to document reliability improvements.

-- ===========================================
-- End of geo reliability auditing and summary.
-- ===========================================