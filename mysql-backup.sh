#!/bin/bash

# Backup script for a remote MySQL database

sevr_ip='YOUR_SERVER_IP'   #Remote Host IP

sevr_uname='YOUR_USERNAME' #Remote Host Username
sevr_psswd='YOUR_PASSWORD' #Remote Host Password

db_uname='DB_USERNAME'     #Database Username
db_psswd='DB_PASSWORD'     #Database Password
db_name='DB_NAME'          #Database Name


date=$(date +%y-%m-%d)

echo "Backup started"

sshpass -p "$sevr_psswd" ssh -o StrictHostKeyChecking=no "$sevr_uname"@"$sevr_ip" mysqldump -u "$db_uname" --password="$db_psswd" "$db_name" > "$date.sql"

echo "Backup completed"
