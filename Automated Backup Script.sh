#!/bin/bash

# Variables
SOURCE_DIR="/var/www/html"           # Directory to backup
BACKUP_DIR="/backup"                 # Local backup directory
REMOTE_SERVER="user@remote.server"   # Remote server details
REMOTE_DIR="/remote/backup"          # Remote backup directory
DATE=$(date +"%Y-%m-%d")             # Current date

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Compress the backup
tar -czvf $BACKUP_DIR/backup-$DATE.tar.gz $SOURCE_DIR

# Sync the backup to the remote server
rsync -avz $BACKUP_DIR/backup-$DATE.tar.gz $REMOTE_SERVER:$REMOTE_DIR

# Print success message
echo "Backup completed successfully for $SOURCE_DIR on $DATE"
