-- Schema definitions for the Florida health‑insurance project
-- Run this script first to set up the database

-- Drop tables if they already exist
DROP TABLE IF EXISTS sahie_county_fl;
DROP TABLE IF EXISTS acs_hi05;
DROP TABLE IF EXISTS acs_hi10;
DROP TABLE IF EXISTS acs_hi11;
DROP TABLE IF EXISTS acs_hi12;
DROP TABLE IF EXISTS acs_hi15;
DROP TABLE IF EXISTS cms_hi13;
DROP TABLE IF EXISTS cms_hi14;
DROP TABLE IF EXISTS county_fips_map;

-- SAHIE Florida county‑level table
CREATE TABLE sahie_county_fl (
    year               INT NOT NULL,
    county_name        VARCHAR(100) NOT NULL,
    county_fips        INT          NULL,
    state_fips         INT          NULL,
    uninsured_number   INT          NOT NULL,
    at_risk_population INT          NOT NULL,
    uninsured_percent  DECIMAL(6,3) NOT NULL,
    PRIMARY KEY (year, county_name)
);

-- ACS health‑insurance tables (simplified schema)
CREATE TABLE acs_hi05 (
    year          INT NOT NULL,
    state_name    VARCHAR(50) NOT NULL,
    age_group     VARCHAR(50) NOT NULL,
    insured_percent   DECIMAL(6,3) NULL,
    uninsured_percent DECIMAL(6,3) NULL,
    population        INT NULL
);

CREATE TABLE acs_hi10 (
    year           INT NOT NULL,
    state_name     VARCHAR(50) NOT NULL,
    sex            VARCHAR(20) NOT NULL,
    insured_percent    DECIMAL(6,3) NULL,
    uninsured_percent  DECIMAL(6,3) NULL,
    population         INT NULL
);

CREATE TABLE acs_hi11 (
    year           INT NOT NULL,
    state_name     VARCHAR(50) NOT NULL,
    race           VARCHAR(50) NOT NULL,
    insured_percent    DECIMAL(6,3) NULL,
    uninsured_percent  DECIMAL(6,3) NULL,
    population         INT NULL
);

CREATE TABLE acs_hi12 (
    year          INT NOT NULL,
    state_name    VARCHAR(50) NOT NULL,
    income_ratio  VARCHAR(50) NOT NULL,
    insured_percent   DECIMAL(6,3) NULL,
    uninsured_percent DECIMAL(6,3) NULL,
    population        INT NULL
);

CREATE TABLE acs_hi15 (
    year          INT NOT NULL,
    state_name    VARCHAR(50) NOT NULL,
    insured_percent   DECIMAL(6,3) NULL,
    uninsured_percent DECIMAL(6,3) NULL,
    population        INT NULL,
    PRIMARY KEY (year, state_name)
);

-- CMS Medicare add‑on tables (simplified schema)
CREATE TABLE cms_hi13 (
    year                    INT NOT NULL,
    state_name              VARCHAR(50) NOT NULL,
    county_name             VARCHAR(100) NOT NULL,
    dual_eligible_percent   DECIMAL(6,3) NULL,
    PRIMARY KEY (year, state_name, county_name)
);

CREATE TABLE cms_hi14 (
    year                 INT NOT NULL,
    state_name           VARCHAR(50) NOT NULL,
    county_name          VARCHAR(100) NOT NULL,
    medicare_poverty_ratio DECIMAL(6,3) NULL,
    PRIMARY KEY (year, state_name, county_name)
);

-- Optional mapping table for state and county FIPS codes
CREATE TABLE county_fips_map (
    state_fips   INT NOT NULL,
    county_fips  INT NOT NULL,
    county_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (state_fips, county_fips)
);