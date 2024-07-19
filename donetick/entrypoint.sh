#!/usr/bin/with-contenv bashio


# Envirment variables:
# export VITE_APP_API_URL=http://host.docker.internal:2021
DONETICK_TELEGRAM_TOKEN=$(bashio::config 'telegram_token')

# # Export telegram token
export DONETICK_TELEGRAM_TOKEN

# Start donetick backend and save PID 
bashio::log.info "Starting Donetick backend..."

./donetick-core &
PID1=$!

# Start the second process in the background(ngnix):
bashio::log.info "Starting Nginx..."
# Start the second process in the background(ngnix):
bashio::log.info "Starting Nginx..."
nginx -g 'daemon off;' >> /dev/stdout &
PID2=$!





cleanup() {
    echo "Terminating processes..."
    kill $PID1
    kill $PID2
}

# Trap SIGINT & SIGTERM to clean up before exiting
trap cleanup SIGINT SIGTERM

# Wait for both processes to exit
wait $PID1 $PID2 

echo "Both processes have completed."