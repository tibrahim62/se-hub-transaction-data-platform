-- Daily totals by agency
SELECT TRUNC(txn_ts) AS txn_date, agency_code, COUNT(*) AS total_txn, SUM(amount) AS revenue
  FROM toll_transactions
 WHERE TRUNC(txn_ts) = TRUNC(SYSDATE)
 GROUP BY TRUNC(txn_ts), agency_code
 ORDER BY agency_code;

-- Exceptions for today
SELECT txn_id, txn_ts, agency_code, account_number, error_msg
  FROM toll_transactions
 WHERE TRUNC(txn_ts) = TRUNC(SYSDATE)
   AND status = 'ERROR'
 ORDER BY txn_ts;

-- Settlement summary (yesterday)
SELECT * FROM settlements
 WHERE settle_date = TRUNC(SYSDATE) - 1
 ORDER BY agency_code;
