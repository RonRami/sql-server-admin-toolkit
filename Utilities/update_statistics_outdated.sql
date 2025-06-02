-- update_statistics_outdated.sql
-- Updates all outdated statistics in the current database

EXEC sp_MSforeachtable 'UPDATE STATISTICS ? WITH FULLSCAN';
