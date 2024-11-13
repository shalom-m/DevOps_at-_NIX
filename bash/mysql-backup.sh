#!/bin/bash 


BACKUP_DIR="/var/backup/mysql"  # Base directory for backups
ARCHIVE_DIR="$BACKUP_DIR/archives"
LOG_DIR="/var/log/mysql_backup"
LOG_FILE="$LOG_DIR/backup.log"
MYSQL_CNF="/etc/mysql/backup.cnf"     # MySQL config for authentication

DATE=$(date +%Y-%m-%d_%H-%M-%S)


# Create necessary directories if they don't exist
mkdir -p "$ARCHIVE_DIR"
mkdir -p "$LOG_DIR"


# Function to backup a specific database table
dbbackup_table() {
    local db_name=$1
    local table_name=$2
    local backup_file="$BACKUP_DIR/$db_name-$table_name-$DATE.sql"

    # Log the start of the backup
    echo "Starting backup for $db_name.$table_name..."

    mysqldump --defaults-file="$MYSQL_CNF" "$db_name" "$table_name" >"$backup_file"

    # Check if mysqldump succeeded and log appropriately
    if [ $? -eq 0 ]; then
        echo "[$DATE] Backup completed for $db_name.$table_name, saved to $backup_file" >> "$LOG_FILE"
    else
        echo "[$DATE] Backup failed for $db_name.$table_name" >> "$LOG_FILE"
    fi
}

# Function to archive the backups every 3 days
archive_backups() {
    local archive_name="$ARCHIVE_DIR/$(date +%Y-%m-%d_%H-%M-%S)_backup.tar.gz"

    # Create the archive
    tar -czf "$archive_name" -C "$BACKUP_DIR" .

    # Log the archive creation
    echo "[$DATE] Archive created: $archive_name" >> "$LOG_FILE"

    # Delete old backups and keep only 3 archives
    ls -t $ARCHIVE_DIR/*.tar.gz | tail -n +4 | xargs rm -f
    echo "[$DATE] Old backups deleted, keeping the latest 3." >> "$LOG_FILE"
}

# Function to list archives
list_archives() {
    echo -e "Date\t\t\tSize"
    ls -lh $ARCHIVE_DIR/*.tar.gz | awk '{print $6, $7, $8, $5}' | column -t
}

# Main logic based on arguments
case "$1" in
    dbbackup)
        # Call dbbackup_table function with db_name and table_name
        dbbackup_table "$2" "$3"
        ;;
    archive)
        # Trigger archiving
        archive_backups
        ;;
    list)
        # List available archives
        list_archives
        ;;
    *)
        echo "Usage: $0 {dbbackup|archive|list}"
        exit 1
        ;;
esac
