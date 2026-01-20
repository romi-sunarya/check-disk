#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/1449353039302361261/fdbaSeeHicBWtdmrRcnazNa7XKpgX0rp3-g_0IanmHKtKGfIjA-3uQSa3oy-BRUjAv2R"

# Threshold dalam persen
THRESHOLD=54

# Cek disk usage (root /)
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Nama host
HOSTNAME=$(hostname)

# Pesan alert
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MESSAGE="! Disk usage di **$HOSTNAME sudah ${USAGE}% (threshold ${THRESHOLD}%)"
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"$MESSAGE\"}" \
         "$WEBHOOK_URL"
fi
