#!/bin/bash

# Get the current RAM usage percentage
RAM_USAGE=$(free | awk '/Mem/{printf("%.0f", $3/$2 * 100)}')

# Set the threshold (90%)
THRESHOLD=90

if [ "$RAM_USAGE" -ge "$THRESHOLD" ]; then
    echo "Memory usage is at ${RAM_USAGE}%. Clearing caches..."
    
    # Sync filesystem buffers to disk
    sync

    # Clear PageCache, dentries, and inodes
    echo 3 > /proc/sys/vm/drop_caches

    # Refresh Swap memory (if enabled)
    swapoff -a && swapon -a

    echo "Memory cleared. Current usage:"
    free -m
else
    echo "Memory usage is ${RAM_USAGE}%. No action needed."
fi
