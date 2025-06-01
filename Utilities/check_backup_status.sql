-- check_backup_status.sql
-- Checks the status of database backups and alerts if any backups have failed or are missing.

SELECT
    database_name,
    MAX(backup_end) AS last_backup_time,
    status
FROM Database_Backups
GROUP BY database_name, status
HAVING status = 'FAILED'
   OR MAX(backup_end) < DATEADD(day, -1, GETDATE());
