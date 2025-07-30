-- Question 3: Misalignment between Medicare coverage and uninsured need
-- This query compares county uninsured rates with Medicare dual‑eligible share
-- to identify areas where Medicare coverage is not aligned with uninsured burden.

SELECT
    s.county_name,
    s.uninsured_percent AS uninsured_pct,
    m.dual_eligible_percent AS dual_eligible_pct,
    (s.uninsured_percent - m.dual_eligible_percent) AS misalignment
FROM sahie_county_fl s
JOIN cms_hi13 m
  ON s.year = m.year
 AND s.county_name = m.county_name
WHERE s.year = 2022
ORDER BY misalignment DESC;