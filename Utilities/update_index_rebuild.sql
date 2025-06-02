-- update_index_rebuild.sql
-- Rebuilds indexes with fragmentation above 30%

DECLARE @table NVARCHAR(255);
DECLARE @sql NVARCHAR(MAX);

DECLARE table_cursor CURSOR FOR
SELECT QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) AS TableName
FROM sys.tables;

OPEN table_cursor;
FETCH NEXT FROM table_cursor INTO @table;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = '
    DECLARE @index NVARCHAR(255);
    DECLARE index_cursor CURSOR FOR
    SELECT name FROM sys.indexes WHERE object_id = OBJECT_ID(''' + @table + ''') 
    AND index_id > 0 AND avg_fragmentation_in_percent > 30;

    OPEN index_cursor;
    FETCH NEXT FROM index_cursor INTO @index;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT ''Rebuilding index '' + @index + '' on table ' + @table + ''';
        EXEC(''ALTER INDEX '' + @index + '' ON ' + @table + ' REBUILD'');
        FETCH NEXT FROM index_cursor INTO @index;
    END

    CLOSE index_cursor;
    DEALLOCATE index_cursor;
    ';

    EXEC sp_executesql @sql;
    FETCH NEXT FROM table_cursor INTO @table;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;
