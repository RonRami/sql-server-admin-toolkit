CREATE TABLE SQLAgent_JobFailures (
    job_id UNIQUEIDENTIFIER PRIMARY KEY,
    job_name NVARCHAR(255) NOT NULL,
    step_name NVARCHAR(255),
    error_message NVARCHAR(MAX),
    run_date DATE NOT NULL,
    run_time TIME NOT NULL,
    server_name SYSNAME NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
