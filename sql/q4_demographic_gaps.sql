-- Question 4: Demographic gaps in insurance coverage
-- This query identifies the age and income segments with the highest uninsured
-- percentages at the state level (Florida). Adjust the table names and
-- columns based on your actual ACS data layout.

-- Age‑based gaps (HI05)
SELECT
    age_group,
    uninsured_percent,
    insured_percent,
    (uninsured_percent / NULLIF(insured_percent, 0)) AS gap_ratio
FROM acs_hi05
WHERE state_name = 'Florida'
  AND year = 2022
ORDER BY gap_ratio DESC;

-- Poverty‑based gaps (HI12)
SELECT
    income_ratio,
    uninsured_percent,
    insured_percent,
    (uninsured_percent / NULLIF(insured_percent, 0)) AS gap_ratio
FROM acs_hi12
WHERE state_name = 'Florida'
  AND year = 2022
ORDER BY gap_ratio DESC;