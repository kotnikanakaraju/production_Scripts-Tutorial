#!/bin/bash

# Variables
THRESHOLD=90                # Set threshold percentage
EMAIL="admin@company.com"    # Email for notification
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')  # Get disk usage

# Check if disk usage exceeds threshold
if [ $DISK_USAGE -gt $THRESHOLD ]; then
  echo "Disk space critical. Usage: $DISK_USAGE%" | mail -s "Disk Space Alert" $EMAIL
fi
