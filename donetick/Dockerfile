# ARG BUILD_FROM
# FROM $BUILD_FROM

FROM ghcr.io/home-assistant/amd64-base:3.15

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache \
    nginx \
    git \
    go \
    musl-dev \
    gcc \
    sqlite-dev

# Clone and build the Donetick core backend
RUN git clone https://github.com/Donetick/core /app/core
WORKDIR /app/core
RUN go mod download
RUN CGO_ENABLED=1 GOOS=linux go build -ldflags="-s -w" -buildvcs=false -o /app/donetick-core

# Clone and build the Donetick frontend
WORKDIR /app
RUN apk add --no-cache nodejs npm
RUN git clone https://github.com/donetick/frontend /app/frontend
WORKDIR /app/frontend
RUN npm install
ENV VITE_APP_API_URL=/api
RUN npm run build

# Setup nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /usr/share/nginx/html
COPY /app/frontend/dist /usr/share/nginx/html

# Copy the built Donetick core binary
COPY /app/donetick-core /app

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose necessary ports
EXPOSE 2021 80

# Set the entrypoint script
# CMD ["/app/entrypoint.sh"]