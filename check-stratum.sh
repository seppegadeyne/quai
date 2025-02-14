#!/bin/bash

BASEDIR="$HOME/go-quai-stratum"
SESSION_NAME="stratum"
PROCESS_PATH="./build/bin/go-quai-stratum"  # Exact path of the target process
RUN_SCRIPT="$BASEDIR/run.sh"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
    logger -t check-stratum "Error: Directory '$BASEDIR' does not exist. Exiting."
    exit 1
fi

# Find the exact process running as './build/bin/go-quai-stratum' (avoid matching similar names)
PROCESS_PID=$(ps aux | awk '$11 == "'$PROCESS_PATH'" {print $2}')

if [ -n "$PROCESS_PID" ]; then
    logger -t check-stratum "Process '$PROCESS_PATH' is already running (PID: $PROCESS_PID). No action needed."
    exit 0
fi

logger -t check-stratum "Process '$PROCESS_PATH' is not running. Restarting..."

# Call run.sh to restart the application, and suppress output
cd "$BASEDIR" && ./run.sh

logger -t check-stratum "Stratum process restarted successfully."

