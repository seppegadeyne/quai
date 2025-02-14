#!/bin/bash

BASEDIR="$HOME/go-quai"
SESSION_NAME="quai"
PROCESS_PATH="./build/bin/go-quai"  # Full path of the exact process
RUN_SCRIPT="$BASEDIR/run.sh"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
    logger -t check-quai "Error: Directory '$BASEDIR' does not exist. Exiting."
    exit 1
fi

# Check if the actual go-quai process is running (exact match)
PROCESS_PID=$(ps aux | awk '$11 == "'$PROCESS_PATH'" {print $2}')

if [ -n "$PROCESS_PID" ]; then
    logger -t check-quai "Process '$PROCESS_PATH' is already running (PID: $PROCESS_PID). No action needed."
    exit 0
fi

logger -t check-quai "Process '$PROCESS_PATH' is not running. Restarting..."

# Call run.sh to restart the application, and suppress output
cd "$BASEDIR" && ./run.sh 

logger -t check-quai "Quai process restarted successfully."

