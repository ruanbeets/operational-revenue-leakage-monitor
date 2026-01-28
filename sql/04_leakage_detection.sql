-- =====================================================
-- LEAKAGE DETECTION: CATEGORY LEVEL
-- =====================================================

CREATE OR REPLACE VIEW v_category_reconciliation AS
SELECT
    COALESCE(c.category, n.category) AS category,

    c.transaction_count AS customer_txn_count,
    n.transaction_count AS network_txn_count,

    c.total_amount AS customer_amount,
    n.total_amount AS network_amount,

    (c.total_amount - n.total_amount) AS amount_diff
FROM (
    SELECT
        category,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_amount
    FROM v_transactions_clean
    WHERE is_valid_amount = TRUE
    GROUP BY category
) c
FULL OUTER JOIN (
    SELECT
        transaction_type AS category,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_amount
    FROM v_network_transactions_clean
    WHERE is_valid_amount = TRUE
    GROUP BY transaction_type
) n
ON c.category = n.category;
