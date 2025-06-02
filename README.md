# SQL Server Admin Toolkit

This project is a comprehensive collection of SQL Server administration scripts and tools designed to showcase practical skills for a Junior SQL Server Database Administrator role. It covers essential tasks such as monitoring backups, storage metrics, index maintenance, SQL Agent job failure tracking, and disk space monitoring.

## Project Structure

- `schema/` — Contains SQL scripts to create necessary tables and indexes for tracking backups, storage metrics, and job failures.
- `monitoring-scripts/` — Includes scripts for monitoring system health like disk space.
- `utilities/` — Contains maintenance and utility scripts such as index health checks and fragmentation management.

## Usage

1. Run the scripts in the `schema/` folder first to create the required database schema objects.
2. Use the scripts in `monitoring-scripts/` and `utilities/` as needed to monitor and maintain your SQL Server environment.
3. These scripts can be executed manually or scheduled as SQL Server Agent jobs.

## Future Work

- Add automation for scheduling these scripts as SQL Server Agent jobs.
- Expand monitoring capabilities for performance metrics.
- Integrate alerting mechanisms based on monitoring results.
