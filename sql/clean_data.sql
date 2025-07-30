-- Data loading and transformation script for the Florida health‑insurance project
-- This script demonstrates how to import CSV/Excel data into staging tables and
-- produce the final aggregated county table used in analysis.

-- Example: load Florida SAHIE samples (CSV) into a staging table.
-- You will need to adjust the LOCAL INFILE path and the file names based on
-- your environment. Make sure the MySQL server is configured to allow
-- LOCAL INFILE operations.

DROP TABLE IF EXISTS sahie_staging;
CREATE TABLE sahie_staging (
    year            INT,
    version         VARCHAR(10),
    statefips       INT,
    countyfips      INT,
    geocat          INT,
    agecat          INT,
    racecat         INT,
    sexcat          INT,
    iprcat          INT,
    NIPR            INT,
    nipr_moe        INT,
    NUI             INT,
    nui_moe         INT,
    NIC             INT,
    nic_moe         INT,
    PCTUI           DECIMAL(8,3),
    pctui_moe       DECIMAL(8,3),
    PCTIC           DECIMAL(8,3),
    pctic_moe       DECIMAL(8,3),
    PCTELIG         DECIMAL(8,3),
    pctelig_moe     DECIMAL(8,3),
    PCTLIIC         DECIMAL(8,3),
    pctliic_moe     DECIMAL(8,3),
    state_name      VARCHAR(50),
    county_name     VARCHAR(100)
);

-- Load each year’s Florida sample into the staging table
-- Repeat the following for 2019, 2020, 2021 and 2022 files:
-- LOAD DATA LOCAL INFILE '/path/to/sahie_2019_sampled_FL.csv'
-- INTO TABLE sahie_staging
-- FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;

-- Aggregate county‑level data: sum uninsured and population at risk and calculate
-- uninsured percentage. Insert results into the final table.
DELETE FROM sahie_county_fl;
INSERT INTO sahie_county_fl (year, county_name, county_fips, state_fips, uninsured_number, at_risk_population, uninsured_percent)
SELECT
    s.year,
    TRIM(s.county_name) AS county_name,
    s.countyfips AS county_fips,
    s.statefips  AS state_fips,
    SUM(s.NUI)   AS uninsured_number,
    SUM(s.NIPR)  AS at_risk_population,
    (SUM(s.NUI) / SUM(s.NIPR)) * 100 AS uninsured_percent
FROM sahie_staging s
WHERE s.geocat = 50 -- county level
GROUP BY s.year, TRIM(s.county_name), s.countyfips, s.statefips;

-- Example: load ACS tables (HI05/HI10/HI11/HI12/HI15) into their respective tables
-- Note: Excel imports typically require using an external tool (e.g. pandas or
-- MySQL Workbench) to convert to CSV first. Once converted, use LOAD DATA.
-- LOAD DATA LOCAL INFILE '/path/to/hi05_acs.csv'
-- INTO TABLE acs_hi05
-- FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;
-- Repeat for hi10_acs, hi11_acs, hi12_acs, hi15_acs and CMS tables.

-- After loading all tables, the database will be ready for the analytical queries.