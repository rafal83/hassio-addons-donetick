#!/usr/bin/with-contenv bashio


# Envirment variables:
# export VITE_APP_API_URL=http://host.docker.internal:2021
DONETICK_TELEGRAM_TOKEN=$(bashio::config 'telegram_token')

# # Export telegram token
export DONETICK_TELEGRAM_TOKEN

# Start donetick backend and save PID 
bashio::log.info "Starting Donetick backend..."

# Envirment variables:
# export VITE_APP_API_URL=http://host.docker.internal:2021
cd /app/core
# Start donetick backend and save PID 
export DT_ENV="selfhosted"

./donetick-core &
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