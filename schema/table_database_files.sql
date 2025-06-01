CREATE TABLE Database_Files (
    file_id INT PRIMARY KEY IDENTITY(1,1),
    database_name NVARCHAR(100) NOT NULL,
    file_type VARCHAR(20) CHECK (file_type IN ('DATA', 'LOG')) NOT NULL,
    logical_name NVARCHAR(128) NOT NULL,
    physical_name NVARCHAR(255) NOT NULL,
    size_mb DECIMAL(10, 2),
    max_size_mb DECIMAL(10, 2),
    growth_rate VARCHAR(20),
    is_autogrow_enabled BIT,
    collected_at DATETIME DEFAULT GETDATE()
);
