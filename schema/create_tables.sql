CREATE TABLE Database_Backups (
    backup_id INT PRIMARY KEY IDENTITY(1,1),
    database_name NVARCHAR(100) NOT NULL,
    backup_type VARCHAR(20) CHECK (backup_type IN ('FULL', 'DIFFERENTIAL', 'LOG')) NOT NULL,
    backup_start DATETIME NOT NULL,
    backup_end DATETIME NOT NULL,
    backup_size_mb DECIMAL(10, 2),
    status VARCHAR(20) CHECK (status IN ('SUCCESS', 'FAILED')) NOT NULL,
    backup_path NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE()
);
