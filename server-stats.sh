#!/bin/bash

echo "========================================"
echo "         Linux System Health Check"
echo "========================================"

# OS Version
echo -e "\nOS Version:"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'

# Uptime
echo -e "\nUptime:"
uptime -p

# Load average
echo -e "\nLoad Average (1, 5, 15 min):"
uptime | awk -F'load average: ' '{ print $2 }'

# Logged-in users
echo -e "\nLogged-in Users:"
who | awk '{print $1}' | sort | uniq

# Failed login attempts
echo -e "\nFailed Login Attempts (last 24h):"
journalctl _COMM=sshd --since "24 hours ago" 2>/dev/null | grep "Failed password" | wc -l

# CPU Usage
echo -e "\nTotal CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

# Memory Usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2 {
  used=$3
  total=$2
  percent=($3/$2)*100
  printf "Used: %s MB | Free: %s MB | Total: %s MB | Usage: %.2f%%\n", used, $4, total, percent
}'

# Disk Usage
echo -e "\nDisk Usage (/ partition):"
df -h / | awk 'NR==2 {
  printf "Used: %s | Free: %s | Total: %s | Usage: %s\n", $3, $4, $2, $5
}'

# Top 5 processes by CPU
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory Usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "========================================"
echo "      Health Check Completed"
echo "========================================"
