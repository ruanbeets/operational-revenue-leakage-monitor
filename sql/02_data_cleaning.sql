-- ================================
-- CLEANED TRANSACTIONS VIEW
-- ================================

CREATE OR REPLACE VIEW v_transactions_clean AS
SELECT
    step,
    customer_id,

    -- Convert age safely: only digits become integers
    CASE
        WHEN age_raw ~ '^[0-9]+$' THEN age_raw::INTEGER
        ELSE NULL
    END AS age,

    gender,
    zipcode_ori,
    merchant_id,
    zip_merchant,
    category,
    amount,
    fraud,

    -- Data quality flags
    CASE
        WHEN amount > 0 THEN TRUE
        ELSE FALSE
    END AS is_valid_amount,

    CASE
        WHEN age_raw ~ '^[0-9]+$' THEN TRUE
        ELSE FALSE
    END AS has_valid_age

FROM transactions_raw;
