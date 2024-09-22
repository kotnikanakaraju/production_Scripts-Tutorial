#!/bin/bash

# Variables
DB_USER="root"                         # MySQL username
DB_PASSWORD="password"                 # MySQL password
DB_NAME="mydatabase"                   # Database to backup
BACKUP_DIR="/backup"                   # Backup directory
DATE=$(date +"%Y-%m-%d")               # Current date
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup the database and compress the file
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME | gzip > $BACKUP_FILE

# Print success message
echo "Database backup for $DB_NAME completed and saved to $BACKUP_FILE"
