#!/bin/bash

BASEDIR="$HOME/go-quai"
SESSION_NAME="quai"

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
screen -dmS "$SESSION_NAME" ./build/bin/go-quai start \
--node.slices '[0 0]' \
--node.genesis-nonce 23621466532946281564673705261963422 \
--node.environment "colosseum" \
--node.quai-coinbases '0x0017986f17D2eeDC2ec4628eC22D676321FDfc6c' \
--node.qi-coinbases '0x00D1dCa40F09fEFD1Af0B6b1c90916f10888b5f4' \
--node.miner-preference 0 \
--node.coinbase-lockup 0
 
echo "Quai started in screen session '$SESSION_NAME'."

