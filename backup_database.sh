#!/bin/bash

# Database credentials
DB_USER="root"
DB_PASSWORD="pass123"
DB_NAME="zeal_staging"

# Backup directory
BACKUP_DIR="/home/rootx/backups/"

# Timestamp (for unique backup filenames)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Backup command
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/$DB_NAME_$TIMESTAMP.sql

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully at $(date)"
else
    echo "Backup failed at $(date)"
fi
