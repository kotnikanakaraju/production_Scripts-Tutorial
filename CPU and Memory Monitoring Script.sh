#!/bin/bash

# Variables
CPU_THRESHOLD=80               # CPU usage threshold
MEMORY_THRESHOLD=90            # Memory usage threshold
EMAIL="admin@company.com"       # Email for notification

# Get CPU and memory usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Check if CPU usage exceeds threshold
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "CPU usage critical: $CPU_USAGE%" | mail -s "CPU Usage Alert" $EMAIL
fi

# Check if memory usage exceeds threshold
if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
  echo "Memory usage critical: $MEMORY_USAGE%" | mail -s "Memory Usage Alert" $EMAIL
fi
