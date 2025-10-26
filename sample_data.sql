INSERT INTO accounts (agency_code, account_number, customer_name)
VALUES ('FTE','A-1001','SunPass Customer 1');

INSERT INTO accounts (agency_code, account_number, customer_name)
VALUES ('FTE','A-1002','SunPass Customer 2');

INSERT INTO toll_transactions (txn_ts, plaza_id, lane_id, tag_id, class_code, amount, account_number, agency_code)
VALUES (TRUNC(SYSDATE)-1, 'PLZ-01','L-01','TAG-001',2, 1.75,'A-1001','FTE');

INSERT INTO toll_transactions (txn_ts, plaza_id, lane_id, tag_id, class_code, amount, account_number, agency_code)
VALUES (TRUNC(SYSDATE)-1, 'PLZ-01','L-02','TAG-002',2, 1.75,'A-1002','FTE');

INSERT INTO toll_transactions (txn_ts, plaza_id, lane_id, tag_id, class_code, amount, account_number, agency_code)
VALUES (TRUNC(SYSDATE),   'PLZ-02','L-03','TAG-001',2, 2.25,'A-1001','FTE');

COMMIT;
