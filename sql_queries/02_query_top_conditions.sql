-- Analysis 1: Top Chronic Conditions by OOP Cost

-- Business Question: Which chronic conditions create the highest 
-- out-of-pocket burden for patients statewide?


SELECT 
    chronic_condition,
    SUM(member_count) as total_members,
    AVG(med_oop_member) as avg_median_oop_cost,
    AVG(med_claim_ct) as avg_median_claims,
    AVG(med_oop_member) / NULLIF(AVG(med_claim_ct), 0) as oop_cost_per_claim
FROM CA_HEALTH.PUBLIC.HPD_OOP_CHRONIC
WHERE 
    county = 'All'
    AND product = 'All'
    AND chronic_condition IS NOT NULL
    AND chronic_number_v2 = 'All'  -- CHANGED: was IS NULL, now = 'All'
    AND member_count > 0
GROUP BY chronic_condition
ORDER BY avg_median_oop_cost DESC;

