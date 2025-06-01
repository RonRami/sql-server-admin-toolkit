-- check_index_health.sql
-- Checks index fragmentation and usage stats for all user tables

SELECT 
    DB_NAME() AS DatabaseName,
    OBJECT_NAME(ips.object_id) AS TableName,
    si.name AS IndexName,
    ips.index_type_desc AS IndexType,
    ips.avg_fragmentation_in_percent,
    ips.page_count,
    user_seeks,
    user_scans,
    user_lookups,
    user_updates
FROM 
    sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') ips
INNER JOIN 
    sys.indexes si ON ips.object_id = si.object_id AND ips.index_id = si.index_id
LEFT JOIN 
    sys.dm_db_index_usage_stats ius ON si.object_id = ius.object_id AND si.index_id = ius.index_id AND ius.database_id = DB_ID()
WHERE 
    si.index_id > 0
ORDER BY 
    ips.avg_fragmentation_in_percent DESC, ips.page_count DESC;
