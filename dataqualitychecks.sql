-- DATA QUALITY & EXPLORATION CHECKS
-- California HPD Out-of-Pocket Cost Data (2022)


-- SECTION 1: ROW COUNTS & BASIC STRUCTURE

-- 1a. Total row count (expect: 24,140)
SELECT COUNT(*) AS total_rows 
FROM hpd_oop_chronic;

-- 1b.  data structure overview
SELECT 
    COUNT(DISTINCT county)            AS unique_counties,
    COUNT(DISTINCT product)           AS unique_products,
    COUNT(DISTINCT chronic_flag)      AS unique_chronic_flags,
    COUNT(DISTINCT chronic_number_v2) AS unique_chronic_numbers,
    COUNT(DISTINCT chronic_condition) AS unique_conditions
FROM hpd_oop_chronic;


-- SECTION 2: DIMENSION VALUE CHECKS

-- 2a. All payer/product types and their row counts
SELECT 
    product,
    COUNT(*) AS row_count
FROM hpd_oop_chronic
GROUP BY product
ORDER BY row_count DESC;

-- 2b. All chronic condition types (expect: 23 conditions + NULLs)
SELECT 
    chronic_condition,
    COUNT(*) AS row_count
FROM hpd_oop_chronic
GROUP BY chronic_condition
ORDER BY chronic_condition;

-- 2c. Chronic flag values
SELECT 
    chronic_flag,
    COUNT(*) AS row_count
FROM hpd_oop_chronic
GROUP BY chronic_flag
ORDER BY chronic_flag;

-- 2d. Chronic number values (1 condition vs multiple)
SELECT 
    chronic_number_v2,
    COUNT(*) AS row_count
FROM hpd_oop_chronic
GROUP BY chronic_number_v2
ORDER BY chronic_number_v2;


-- SECTION 3: NULL & MISSING VALUE CHECKS

-- 3a. NULL counts across all key fields
SELECT
    SUM(CASE WHEN county            IS NULL THEN 1 ELSE 0 END) AS null_county,
    SUM(CASE WHEN product           IS NULL THEN 1 ELSE 0 END) AS null_product,
    SUM(CASE WHEN chronic_flag      IS NULL THEN 1 ELSE 0 END) AS null_chronic_flag,
    SUM(CASE WHEN chronic_number_v2 IS NULL THEN 1 ELSE 0 END) AS null_chronic_number,
    SUM(CASE WHEN chronic_condition IS NULL THEN 1 ELSE 0 END) AS null_chronic_condition,
    SUM(CASE WHEN member_count      IS NULL THEN 1 ELSE 0 END) AS null_member_count,
    SUM(CASE WHEN med_oop_member    IS NULL THEN 1 ELSE 0 END) AS null_med_oop,
    SUM(CASE WHEN med_claim_ct      IS NULL THEN 1 ELSE 0 END) AS null_med_claim_ct
FROM hpd_oop_chronic;
