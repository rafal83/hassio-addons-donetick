#!/usr/bin/with-contenv bashio


# Envirment variables:
export VITE_APP_API_URL="AUTO"
DONETICK_TELEGRAM_TOKEN=$(bashio::config 'telegram_token')
DONETICK_PUSHOVER_TOKEN=$(bashio::config 'pushover_token')
DONETICK_DISABLE_SIGNUP=$(bashio::config 'disable_signup')


# # Export telegram token
export DONETICK_TELEGRAM_TOKEN
export DONETICK_PUSHOVER_TOKEN
export DONETICK_DISABLE_SIGNUP

# Start donetick backend and save PID 
bashio::log.info "Starting Donetick backend..."

# Envirment variables:
# export VITE_APP_API_URL=http://host.docker.internal:2021

cd /app/core
# Start donetick backend and save PID 
export DT_ENV="selfhosted"

ls -lR /app/
./donetick &
PID1=$!




cleanup() {
    echo "Terminating processes..."
    kill $PID1 
}

# Trap SIGINT & SIGTERM to clean up before exiting
trap cleanup SIGINT SIGTERM

# Wait for both processes to exit
wait $PID1  

echo "Both processes have completed."