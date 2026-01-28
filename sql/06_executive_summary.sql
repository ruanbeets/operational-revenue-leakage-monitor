-- =====================================================
-- EXECUTIVE REVENUE LEAKAGE SUMMARY
-- =====================================================

CREATE OR REPLACE VIEW v_revenue_leakage_summary AS
SELECT
    CURRENT_DATE AS snapshot_date,

    SUM(customer_amount) AS customer_total_amount,
    SUM(network_amount) AS network_total_amount,
    SUM(amount_diff) AS total_amount_difference,

    CASE
        WHEN SUM(amount_diff) = 0 THEN 'NO LEAKAGE DETECTED'
        ELSE 'POTENTIAL LEAKAGE'
    END AS leakage_status
FROM v_category_reconciliation;
