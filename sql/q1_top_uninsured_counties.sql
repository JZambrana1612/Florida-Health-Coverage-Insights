-- Question 1: Top underinsured counties in Florida
-- This query lists counties with the highest uninsured percentage for a given year.
-- Adjust the @target_year variable to change the year of analysis.

SET @target_year = 2022;

SELECT
    county_name,
    uninsured_percent AS pct_uninsured,
    uninsured_number,
    at_risk_population
FROM sahie_county_fl
WHERE year = @target_year
ORDER BY uninsured_percent DESC
LIMIT 10;