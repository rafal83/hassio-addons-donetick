#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start the donetick service with environment setup and process management
# ==============================================================================

# Set environment variables
# export VITE_APP_API_URL=http://host.docker.internal:2021

# Read telegram token from addon config
DONETICK_TELEGRAM_TOKEN=$(bashio::config 'telegram_token')

# Export telegram token
export DONETICK_TELEGRAM_TOKEN

# Start donetick backend and save PID
./donetick-core &
PID1=$!

# Start nginx in the foreground as the second process
nginx -g 'daemon off;' &
PID2=$!

cleanup() {
    echo "Terminating processes..."
    kill $PID1 $PID2
}

# Trap SIGINT & SIGTERM to clean up before exiting
trap cleanup SIGINT SIGTERM

# Wait for both processes to exit
wait $PID1 $PID2

echo "Both processes have completed."