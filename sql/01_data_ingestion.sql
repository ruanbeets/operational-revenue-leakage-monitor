\copy transactions_raw FROM 'data/raw/bs140513_032310.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '''');

\copy transaction_network_raw (source_id, target_id, amount, transaction_type, fraud) FROM 'data/raw/bsNET140513_032310.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '''');
