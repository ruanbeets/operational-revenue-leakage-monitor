-- ================================
-- REVENUE RECONCILIATION: TOTALS
-- ================================

CREATE OR REPLACE VIEW v_revenue_totals AS
SELECT
    'customer_transactions' AS source,
    COUNT(*)               AS transaction_count,
    SUM(amount)            AS total_amount
FROM v_transactions_clean
WHERE is_valid_amount = TRUE

UNION ALL

SELECT
    'network_transactions' AS source,
    COUNT(*)               AS transaction_count,
    SUM(amount)            AS total_amount
FROM v_network_transactions_clean
WHERE is_valid_amount = TRUE;
