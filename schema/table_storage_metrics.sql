CREATE TABLE Storage_Metrics (
    metric_id INT PRIMARY KEY IDENTITY(1,1),
    drive_letter CHAR(1) NOT NULL,
    total_space_gb DECIMAL(10, 2) NOT NULL,
    used_space_gb DECIMAL(10, 2) NOT NULL,
    free_space_gb AS (total_space_gb - used_space_gb),
    usage_percent AS (CAST(used_space_gb AS FLOAT) / total_space_gb * 100),
    recorded_at DATETIME DEFAULT GETDATE()
);
