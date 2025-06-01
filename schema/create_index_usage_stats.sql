CREATE TABLE Index_Usage_Stats (
    index_id INT PRIMARY KEY,
    object_name SYSNAME NOT NULL,
    index_name SYSNAME NOT NULL,
    user_seeks BIGINT DEFAULT 0,
    user_scans BIGINT DEFAULT 0,
    user_lookups BIGINT DEFAULT 0,
    user_updates BIGINT DEFAULT 0,
    last_used DATETIME,
    created_at DATETIME DEFAULT GETDATE()
);
