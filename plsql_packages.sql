CREATE OR REPLACE PACKAGE pkg_reconciliation AS
  PROCEDURE validate_txns(p_date IN DATE);
  PROCEDURE reconcile_day(p_date IN DATE);
  FUNCTION  get_settlement_total(p_date IN DATE, p_agency IN VARCHAR2) RETURN NUMBER;
END pkg_reconciliation;
/

CREATE OR REPLACE PACKAGE BODY pkg_reconciliation AS

  PROCEDURE validate_txns(p_date IN DATE) IS
  BEGIN
    UPDATE toll_transactions
       SET status = 'ERROR',
           error_msg = 'Missing account_number'
     WHERE TRUNC(txn_ts) = TRUNC(p_date)
       AND (account_number IS NULL OR account_number = 'NULL');

    UPDATE toll_transactions
       SET status = 'VALIDATED',
           error_msg = NULL
     WHERE TRUNC(txn_ts) = TRUNC(p_date)
       AND NVL(status,'NEW') IN ('NEW','ERROR')
       AND account_number IS NOT NULL;
  END validate_txns;

  PROCEDURE reconcile_day(p_date IN DATE) IS
  BEGIN
    MERGE INTO settlements s
    USING (
      SELECT agency_code,
             TRUNC(p_date) AS settle_date,
             COUNT(*) AS total_txn,
             SUM(amount) AS total_amount
        FROM toll_transactions
       WHERE TRUNC(txn_ts) = TRUNC(p_date)
         AND status = 'VALIDATED'
       GROUP BY agency_code
    ) x
    ON (s.settle_date = x.settle_date AND s.agency_code = x.agency_code)
    WHEN MATCHED THEN
      UPDATE SET s.total_txn = x.total_txn, s.total_amount = x.total_amount
    WHEN NOT MATCHED THEN
      INSERT (settle_date, agency_code, total_txn, total_amount)
      VALUES (x.settle_date, x.agency_code, x.total_txn, x.total_amount);

    UPDATE toll_transactions
       SET status = 'RECONCILED'
     WHERE TRUNC(txn_ts) = TRUNC(p_date)
       AND status = 'VALIDATED';
  END reconcile_day;

  FUNCTION get_settlement_total(p_date IN DATE, p_agency IN VARCHAR2) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT NVL(total_amount,0)
      INTO v_total
      FROM settlements
     WHERE settle_date = TRUNC(p_date)
       AND agency_code  = p_agency;
    RETURN v_total;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RETURN 0;
  END get_settlement_total;

END pkg_reconciliation;
/
