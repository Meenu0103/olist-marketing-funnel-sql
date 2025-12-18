-- =====================================================
-- Data Validation Queries
-- Purpose: Verify data integrity after ingestion
-- =====================================================

-- 1. Row count checks
SELECT COUNT(*) AS total_mqls
FROM marketing.marketing_qualified_leads;

SELECT COUNT(*) AS total_closed_deals
FROM marketing.marketing_closed_deals;


-- 2. Funnel sanity check
-- Closed deals should be a subset of MQLs
SELECT COUNT(DISTINCT mql_id) AS closed_mqls
FROM marketing.marketing_closed_deals;


-- 3. NULL checks on key fields
SELECT
    COUNT(*) FILTER (WHERE mql_id IS NULL) AS null_mql_id,
    COUNT(*) FILTER (WHERE won_date IS NULL) AS null_won_date
FROM marketing.marketing_closed_deals;


-- 4. Boolean value distribution
SELECT
    has_company,
    COUNT(*) AS count
FROM marketing.marketing_closed_deals
GROUP BY has_company;

SELECT
    has_gtin,
    COUNT(*) AS count
FROM marketing.marketing_closed_deals
GROUP BY has_gtin;


-- 5. Date range validation
SELECT
    MIN(first_contact_date) AS earliest_contact,
    MAX(first_contact_date) AS latest_contact
FROM marketing.marketing_qualified_leads;

SELECT
    MIN(won_date) AS earliest_deal,
    MAX(won_date) AS latest_deal
FROM marketing.marketing_closed_deals;


-- 6. Revenue sanity check
SELECT
    MIN(declared_monthly_revenue) AS min_revenue,
    MAX(declared_monthly_revenue) AS max_revenue
FROM marketing.marketing_closed_deals;


--7. Percentage of closed deals with declared revenue
SELECT
    COUNT(*) FILTER (WHERE declared_monthly_revenue IS NOT NULL) * 100.0
    / COUNT(*) AS pct_with_revenue
FROM marketing.marketing_closed_deals;


--8. Percentage of closed deals with non-zero declared revenue
SELECT
    COUNT(*) FILTER (
        WHERE declared_monthly_revenue IS NOT NULL
          AND declared_monthly_revenue > 0
    ) * 100.0 / COUNT(*) AS pct_with_nonzero_revenue
FROM marketing.marketing_closed_deals;


