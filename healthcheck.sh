#!/bin/bash

DATE=$(date +%F)
LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system_$DATE.log"

mkdir -p "$LOG_DIR"

echo "System Health Report - $DATE" > "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo "Memory usage:" >> "$LOG_FILE"
systeminfo | grep "Total Physical Memory" >> "$LOG_FILE"
systeminfo | grep "Available Physical Memory" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo " Disk usage:" >> "$LOG_FILE"
df -h >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo " CPU load:" >> "$LOG_FILE"
wmic cpu get loadpercentage >> "$LOG_FILE"

cat "$LOG_FILE"
