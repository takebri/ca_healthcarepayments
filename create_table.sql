-- HPD Out-of-Pocket Cost Data - Table Create - Snowflake SQL


-- Drop table if exists --
DROP TABLE IF EXISTS hpd_oop_chronic;


-- Create table
CREATE TABLE hpd_oop_chronic (
    id INT,
    table_name VARCHAR(50),
    county VARCHAR(100),
    product VARCHAR(100),
    chronic_flag VARCHAR(100),
    chronic_number_v2 VARCHAR(100),
    chronic_condition VARCHAR(100),
    member_count INT,
    med_oop_member DECIMAL(10, 2),
    p25th_oop_member DECIMAL(10, 2),
    p75th_oop_member DECIMAL(10, 2),
    med_claim_ct DECIMAL(10, 2),
    p25th_claim_member DECIMAL(10, 2),
    p75th_claim_member DECIMAL(10, 2)
);


-- verify load
SELECT COUNT(*) as total_rows FROM hpd_oop_chronic;
SELECT * FROM hpd_oop_chronic LIMIT 10;