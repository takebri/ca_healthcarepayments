# Patient Financial Burden Analysis: California Chronic Conditions (2022)

**Interactive Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/brian.takeda/viz/PatientFinancialBurdenAnalysisCaliforniaChronicConditions2022/Findings)

![Dashboard Overview](images/dashboard_overview.png)

---

## Project Overview

Healthcare costs continue to rise, but the financial burden on patients varies significantly by condition and insurance type. This project analyzes California all-payer out-of-pocket (OOP) cost data to identify which chronic conditions create the highest financial burden for patients and how this burden differs across insurance types.

---

## Business Question

**Which chronic conditions create the highest out-of-pocket financial burden for patients, and how does this vary by insurance type?**

---

## Data Source

**Source:** California Health Care Payment Data (HPD)  
**Dataset:** Out-of-Pocket Costs and Chronic Conditions (2022)  
**Records:** 24,140 aggregated records  
**Coverage:** 23 chronic conditions across 59 California counties  
**Scope:** Statewide median values across Commercial, Medicare, and Medicaid payer types

**Link:** https://data.ca.gov/dataset/healthcare-payments-data-hpd-medical-out-of-pocket-costs-and-chronic-conditions

---

## Key Terminology

**Out-of-Pocket (OOP) Cost:** Amount patients pay directly for healthcare (copays, coinsurance, deductibles), excluding insurance payments

**Claim:** A billable medical event (doctor visit, prescription fill, lab test, procedure, etc.)

**Cost Per Claim:** Average OOP cost per individual claim

**Utilization:** Frequency of healthcare use, measured by number of claims per patient per year

---

## Key Findings

1. **Hip/Pelvic Fracture patients face the highest out-of-pocket burden at $326/year median cost**

2. **Medicare FFS beneficiaries face dramatically higher costs ($1,224-$3,385) than Commercial patients ($260-$536) due to lack of out-of-pocket maximum protection**

3. **High OOP costs are driven by high utilization (23-37 claims/year) rather than expensive individual services**

4. **Medicaid provides complete financial protection ($0 OOP) while Medicare FFS leaves seniors vulnerable to catastrophic costs**

---

## Methodology

Loaded California HPD data into Snowflake and performed quality validation. Conducted three SQL analyses: (1) ranked chronic conditions by median OOP cost, (2) compared costs across Commercial, Medicare, and Medicaid payer types, and (3) examined the relationship between utilization frequency and total patient costs. Results visualized in interactive Tableau dashboard.

---

## Tools & Technologies

**SQL (Snowflake)** • **Tableau** • **Excel**

---

## Business Implications

- Patient burden driven by visit frequency (23-37 claims/year), not expensive services; addressing utilization is key to reducing costs
- Medicare FFS patients face catastrophic costs due to lack of OOP maximum protection; Medicare Advantage offers significantly better financial protection
- Medicaid provides complete OOP protection while Commercial insurance shows moderate patient burden

---

## Project Structure
```
patient-financial-burden/
├── README.md
├── images/
│   └── dashboard_overview.png
├── sql_queries/
│   ├── 00_data_quality_checks.sql
│   ├── 01_create_table.sql
│   ├── 02_query_top_conditions.sql
│   ├── 03_query_payer_comparison.sql
│   └── 04_query_utilization_vs_cost.sql
├── data/
│   ├── hpd_oop_chronic_2022_masked.csv
│   └── data-dictionary-oop-cost-final.csv
├── results/
│   ├── query_top_conditions.csv
│   ├── results_payer_comparisons.csv
│   └── results_utilization_vs_cost.csv
```

---



## Author

**Brian Takeda**  
[Tableau Public Profile](https://public.tableau.com/app/profile/brian.takeda)

---

## Data Attribution

California Healthcare Payment Data (2022)  
California Department of Health Care Access and Information (HCAI)
