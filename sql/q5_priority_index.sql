-- Question 5: Outreach Priority Index
-- This query standardizes uninsured % and uninsured count (z‑scores) and
-- computes a composite index to rank counties for outreach priority.

WITH stats AS (
  SELECT
    year,
    AVG(uninsured_percent) AS avg_uninsured_pct,
    STDDEV_SAMP(uninsured_percent) AS std_uninsured_pct,
    AVG(uninsured_number) AS avg_uninsured_num,
    STDDEV_SAMP(uninsured_number) AS std_uninsured_num
  FROM sahie_county_fl
  GROUP BY year
),
z_scores AS (
  SELECT
    s.year,
    s.county_name,
    s.uninsured_percent,
    s.uninsured_number,
    (s.uninsured_percent - st.avg_uninsured_pct) / st.std_uninsured_pct AS z_uninsured_pct,
    (s.uninsured_number  - st.avg_uninsured_num) / st.std_uninsured_num AS z_uninsured_num
  FROM sahie_county_fl s
  JOIN stats st ON s.year = st.year
)
SELECT
    county_name,
    year,
    uninsured_percent,
    uninsured_number,
    z_uninsured_pct,
    z_uninsured_num,
    (z_uninsured_pct + z_uninsured_num) / 2 AS outreach_priority_index
FROM z_scores
WHERE year = 2022
ORDER BY outreach_priority_index DESC
LIMIT 10;