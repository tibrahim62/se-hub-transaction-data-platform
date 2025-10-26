BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_SEHUB_RECONCILE',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN pkg_reconciliation.validate_txns(TRUNC(SYSDATE)-1);
                               pkg_reconciliation.reconcile_day(TRUNC(SYSDATE)-1);
                        END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY;BYHOUR=1;BYMINUTE=30;BYSECOND=0',
    enabled         => TRUE,
    comments        => 'Nightly validation and reconciliation for SE HUB.'
  );
END;
/
