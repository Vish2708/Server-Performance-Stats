# Server-Performance-Stats
This script will analyze basic server performance stats

# Linux System Health Check Script

This Bash script provides a quick overview of system resource usage and health for any Linux server. It's designed to be simple, portable, and useful for DevOps engineers, sysadmins, and anyone managing Linux infrastructure.

## 🔧 Features

- Total CPU usage
- Total memory usage (free vs used with percentage)
- Disk usage (for `/` partition with percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage
- OS version
- System uptime
- Load average (1, 5, 15 min)
- Logged-in users
- Failed SSH login attempts (last 24 hours)

## 📁 Files

- `server_stats.sh`: The main script to collect and display system health information. 
