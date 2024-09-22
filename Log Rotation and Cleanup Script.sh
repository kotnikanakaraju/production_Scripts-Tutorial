#!/bin/bash

# Variables
LOG_DIR="/var/log/myapp"       # Log directory
ARCHIVE_DIR="/var/log/archive" # Archive directory
DAYS_TO_KEEP=7                 # Number of days to keep the logs

# Create archive directory if not exists
mkdir -p $ARCHIVE_DIR

# Compress the log files
for log_file in $LOG_DIR/*.log; do
  gzip $log_file
done

# Move the compressed logs to the archive directory
mv $LOG_DIR/*.gz $ARCHIVE_DIR/

# Delete old log files from the archive
find $ARCHIVE_DIR -type f -name "*.gz" -mtime +$DAYS_TO_KEEP -exec rm {} \;

# Print success message
echo "Log rotation and cleanup completed. Old logs older than $DAYS_TO_KEEP days removed."
