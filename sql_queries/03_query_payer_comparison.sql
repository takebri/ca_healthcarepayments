-- Analysis 2: OOP Cost by Payer Type for Top Conditions

-- Business Question: How does patient financial burdern differ
-- across Commercial, Medicare, and Medicaid for high-cost conditions?

-- First, identify top 5 conditions
WITH top_conditions AS (
    SELECT 
        chronic_condition
    FROM 
        CA_HEALTH.PUBLIC.HPD_OOP_CHRONIC
    WHERE 
        county = 'All'
        AND product = 'All'
        AND chronic_condition IS NOT NULL
        AND chronic_number_v2 = 'All'
        AND member_count > 0
    ORDER BY med_oop_member DESC
    LIMIT 5
)

-- Then analyze by payer type
SELECT 
    h.chronic_condition,
    h.product,
    h.member_count as total_members,
    h.med_oop_member as median_oop_cost,
    h.med_claim_ct as median_claims
FROM
    CA_HEALTH.PUBLIC.HPD_OOP_CHRONIC h
    INNER JOIN top_conditions t ON h.chronic_condition = t.chronic_condition
WHERE
    h.county = 'All'
    AND h.product IN (
        'COMMERCIAL',
        'MEDICARE ADVANTAGE',
        'MEDICARE FFS',
        'MEDICAID'
    )
    AND h.chronic_condition_v2 = 'All'
    AND h.member_count > 0
ORDER BY
    h.chronic_condition,
    median_oop_cost DESC;
