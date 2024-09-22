#!/bin/bash

# Variables
SERVICE="nginx"            # Service name
EMAIL="admin@company.com"  # Email for notification

# Check if service is running
if ! systemctl is-active --quiet $SERVICE; then
  # Restart the service
  systemctl restart $SERVICE
  
  # Send email notification
  echo "$SERVICE was down and has been restarted" | mail -s "$SERVICE Restarted" $EMAIL
fi
