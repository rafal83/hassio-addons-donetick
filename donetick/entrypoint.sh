#!/bin/sh

# Envirment variables:
# export VITE_APP_API_URL=http://host.docker.internal:2021

# Start donetick backend and save PID 
./donetick-core &
PID1=$!

# Start the second process in the background(ngnix):
nginx -g 'daemon off;' &
PID2=$!



cleanup() {
    echo "Terminating processes..."
    kill $PID1 $PID2
}

# Trap SIGINT & SIGTERM to clean up before exiting
trap cleanup SIGINT SIGTERM

# Wait for both processes to exit
wait $PID1 $PID2 $PID3

echo "Both processes have completed."