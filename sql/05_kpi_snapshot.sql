-- =====================================================
-- KPI SNAPSHOT: MERCHANT-LEVEL RISK RANKING
-- =====================================================

CREATE OR REPLACE VIEW v_merchant_revenue_risk AS
SELECT
    merchant_id,

    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,

    COUNT(*) FILTER (WHERE fraud = 1) AS fraud_txn_count,
    SUM(amount) FILTER (WHERE fraud = 1) AS fraud_amount
FROM v_transactions_clean
WHERE is_valid_amount = TRUE
GROUP BY merchant_id
ORDER BY total_amount DESC;
