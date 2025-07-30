-- Question 2: Change in uninsured percentage between 2019 and 2022
-- This query calculates the percent‑point change in uninsured rate for each county.

SELECT
    s22.county_name,
    s19.uninsured_percent AS pct_2019,
    s22.uninsured_percent AS pct_2022,
    (s22.uninsured_percent - s19.uninsured_percent) AS pct_point_change
FROM sahie_county_fl s22
JOIN sahie_county_fl s19
  ON s22.county_name = s19.county_name
WHERE s22.year = 2022
  AND s19.year = 2019
ORDER BY pct_point_change DESC;