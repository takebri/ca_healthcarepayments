-- Analysis 1: Top Chronic Conditions by OOP Cost

-- Business Question: Which chronic conditions create the highest 
-- out-of-pocket burden for patients statewide?


SELECT 
    chronic_condition,
    member_count as total_members,
    med_oop_member as median_oop_cost,
    med_claim_ct as median_claims,
    med_oop_member / NULLIF(med_claim_ct, 0) as oop_cost_per_claim
FROM CA_HEALTH.PUBLIC.HPD_OOP_CHRONIC
WHERE 
    county = 'All'
    AND product = 'All'
    AND chronic_condition IS NOT NULL
    AND chronic_number_v2 = 'All'  -- CHANGED: was IS NULL, now = 'All'
    AND member_count > 0
ORDER BY median_oop_cost DESC;

