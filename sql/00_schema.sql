-- =========================
-- RAW TRANSACTION TABLE
-- =========================

DROP TABLE IF EXISTS transactions_raw;

CREATE TABLE transactions_raw (
    step            INTEGER,
    customer_id     VARCHAR(20),
    age_raw         VARCHAR(10),
    gender          CHAR(1),
    zipcode_ori     VARCHAR(10),
    merchant_id     VARCHAR(20),
    zip_merchant    VARCHAR(10),
    category        VARCHAR(50),
    amount          NUMERIC(12,2),
    fraud           INTEGER
);


-- =========================
-- NETWORK / OUTCOME TABLE
-- =========================

DROP TABLE IF EXISTS transaction_network_raw;

CREATE TABLE transaction_network_raw (
    source_id       VARCHAR(20),
    target_id       VARCHAR(20),
    amount          NUMERIC(12,2),
    transaction_type VARCHAR(50),
    fraud           INTEGER
);
