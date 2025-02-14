#!/bin/bash

BASEDIR="$HOME/go-quai-stratum"
SESSION_NAME="stratum"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
    echo "Error: The directory '$BASEDIR' does not exist. Script is stopping."
    exit 1
fi

# Check if the screen session is already running, if so, stop it first
if screen -list | grep -q "$SESSION_NAME"; then
    echo "Screen session '$SESSION_NAME' is already running, stopping it now..."
    screen -S "$SESSION_NAME" -X quit
    sleep 2  # Give it some time to close
fi

# Start the application in a new screen session
screen -dmS "$SESSION_NAME" ./build/bin/go-quai-stratum --region=cyprus --zone=cyprus1
echo "Stratum restarted in screen session '$SESSION_NAME'."

