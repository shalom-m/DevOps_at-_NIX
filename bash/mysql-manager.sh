#!/bin/bash

# mysql-backup-tool.sh
BACKUP_SCRIPT="/usr/bin/mysql-backup.sh"  # Path to your backup script

function db_backup() {
    read -p "Enter database name: " db_name
    read -p "Enter table name (or press Enter for full DB): " table_name
    if [ -z "$table_name" ]; then
        sudo "$BACKUP_SCRIPT" dbbackup "$db_name"
    else
        sudo "$BACKUP_SCRIPT" dbbackup "$db_name" "$table_name"
    fi
}

function db_archive() {
    sudo "$BACKUP_SCRIPT" archive
}

function list_archives() {
    sudo "$BACKUP_SCRIPT" list
}

case "$1" in
    backup)
        db_backup
        ;;
    archive)
        db_archive
        ;;
    list)
        list_archives
        ;;
    *)
        echo "Usage: $0 {backup|archive|list}"
        exit 1
esac

