
# Florida Health Coverage Insights: Market Gaps & Medicare Expansion

### Identifying high-priority counties and outreach strategies using ACS, SAHIE, and CMS data

This project analyzes U.S. Census Bureau and CMS Medicare data to pinpoint Florida counties with the highest unmet healthcare coverage needs. Using SQL and Tableau, we identify strategic gaps, model regional risk, and deliver actionable insights for product, marketing, and enrollment teams — aligning with the responsibilities of a Business Intelligence Analyst at HealthPlanOne.

---

## Executive Summary

This analysis answers five high-impact, stakeholder-aligned questions for decision-makers in healthcare analytics:

1. **Where are the most underinsured counties in Florida — and how large are those populations?** We identify counties with the highest uninsured rates and quantify their market size to guide outreach targeting.
2. **How have coverage rates changed since the pandemic?** We compare 2019 to 2022 SAHIE data to assess regional recovery and highlight counties where the uninsured gap is widening.
3. **Which counties show a misalignment between Medicare coverage and uninsured need?** By cross-analyzing Medicare share (HI13/HI14) and county-level uninsured rates, we flag regions for dual-eligible expansion.
4. **Which age and income segments remain least insured across Florida?** ACS tables (HI05, HI12) reveal demographic coverage gaps that could guide model recalibration or LLM outreach customization.
5. **Where should enrollment outreach be prioritized based on uninsured % and population risk?** We build a weighted “Outreach Priority Index” using county-level z-scores on uninsured % and population size.

### Dashboard Overview

The Tableau dashboard will include:

- **2022 County Heatmap:** uninsured rates and population overlays
- **2019 vs. 2022 Comparison:** coverage rate changes post-pandemic
- **Targeting Index:** weighted ranking of high-risk counties
- **Medicare Context Cards:** income and dual-eligibility metrics (HI13/HI14)
- **Demographic Gaps:** state-level charts for coverage by age and poverty

> 🔗 *[Dashboard link placeholder — coming soon]*

---

## Actionable Recommendations

- **Focus outreach on high-population counties with growing coverage gaps.** Counties like [Example County] show rising uninsured rates and large outreach potential.
- **Recalibrate ML targeting models using updated uninsured distributions by income and age.** Integrate HI12 and HI05 tables to fine-tune targeting logic.
- **Align Medicare expansion strategies with underserved regions.** Counties with high dual-eligible potential but low coverage rates offer entry points for new plans or partnerships.
- **Build LLM prompt templates that reflect demographic risk.** Use coverage by poverty and age to tailor message tone and format for higher engagement.
- **Monitor post-pandemic insurance trends.** Flag counties where uninsured rates remain elevated despite recovery elsewhere.

---

## Deep Dive: Analytical Approach

### Dataset Overview

This project uses data from multiple U.S. Census programs and CMS tables:

- **SAHIE** (Small Area Health Insurance Estimates): County-level uninsured % by age, sex, income.
- **ACS HI05/HI12/HI13/HI14**: State-level coverage breakdowns by age, poverty, and Medicare participation.
- **Years Used:** 2019, 2021, 2022 (for trends); ACS 2022/2023 (for current context)

### Analytical Steps

1. **Data Cleaning:** Excel files were formatted into long format (per year, per dimension) and imported into MySQL staging tables.
2. **Dimension Setup:** A Florida county FIPS mapping table supports joins and name consistency across datasets.
3. **County-Level Views:** Created using `CREATE VIEW` statements to isolate 2022 data and compute differences from 2019.
4. **Index Modeling:** Standardized scores (z-scores) for uninsured % and population were blended into a composite Outreach Priority Index.
5. **Tableau Integration:** Core views were exported to CSV and linked to Tableau dashboards with filters by year, age, and income.

---

## Scripts

This repository includes SQL scripts to define schemas, views, and answer all five business questions.

### SQL Scripts

- **`acs_sahie_project.sql`** – Full SQL workflow: DDL + core queries
- **`q1_top_uninsured_counties.sql`** – Returns counties with highest uninsured % in 2022
- **`q2_trend_uninsured_change.sql`** – Measures percent-point change from 2019 to 2022
- **`q3_medicare_vs_uninsured.sql`** – Aligns SAHIE and HI13/HI14 data
- **`q4_demographic_gaps.sql`** – Analyzes uninsured % by age and income
- **`q5_priority_index.sql`** – Ranks counties by weighted priority score

---

## Repository Structure

```
health-insurance-insights/
├── data/
│   ├── sahie_2019.xlsx / sahie_2022.xlsx     # raw county-level data
│   ├── hi05_acs.xlsx / hi12_acs.xlsx         # ACS age/income files
│   ├── hi13_cms.xlsx / hi14_cms.xlsx         # Medicare participation
├── sql/
│   └── acs_sahie_project.sql                 # full pipeline SQL
├── images/
│   └── dashboard_preview.png                 # Tableau overview (placeholder)
├── README.md                                 # project summary
```

---

## Tools Used

- **SQL (MySQL):** database structure, aggregation, modeling
- **Excel / Power Query:** staging and reshaping ACS/SAHIE source files
- **Tableau Public:** dynamic dashboards with filters and KPIs
- **Python (optional):** preprocessing or z-score calculation if needed

---

## Data Sources

- **SAHIE 2019/2021/2022:** [Census SAHIE Program](https://www.census.gov/programs-surveys/sahie.html)
- **ACS HI Tables (HI05–HI15):** [Census Health Insurance Tables](https://www.census.gov/data/tables/time-series/demo/health-insurance/acs-hi.html)
- **CMS Medicare Breakdowns:** (in ACS Medicare Add-On Tables)

---

## About the Analyst

Jeremy Gutierrez – Data Analyst focused on healthcare and market strategy using SQL, Tableau, and AI-augmented workflows.  
Let’s connect: [LinkedIn](https://www.linkedin.com/in/jeremy-gutierrez-4502391bb/) | [GitHub](https://github.com/JZambrana1612)
