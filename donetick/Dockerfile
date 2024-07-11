# ARG BUILD_FROM
# FROM $BUILD_FROM

FROM golang:1.22-alpine3.18 AS builder
WORKDIR /app
ENV CGO_ENABLED=1
RUN apk --no-cache add gcc  musl-dev git musl-dev sqlite-dev 
RUN apk add git
RUN git clone https://github.com/Donetick/core
WORKDIR /app/core
RUN go mod download
RUN CGO_ENABLED=1 GOOS=linux go build -ldflags="-s -w " -buildvcs=false  -o /donetick-core 

# ARG BUILD_FROM
# FROM $BUILD_FROM


FROM node:18-alpine AS frontend
WORKDIR /app
RUN apk add --no-cache git  # Install git in the Node.js image
RUN git clone https://github.com/donetick/frontend
WORKDIR /app/frontend     

# Install dependencies and build the frontend
# RUN npm ci

RUN npm install
ENV VITE_APP_API_URL=/api
RUN  npm run build



FROM ghcr.io/home-assistant/amd64-base:3.15

RUN apk add --no-cache \
    nginx

# Setup nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /usr/share/nginx/html

# Copy the built Donetick core binary
COPY --from=builder /donetick-core /app/donetick-core
COPY --from=builder /app/core/config /app/config
COPY --from=frontend /app/frontend/dist /usr/share/nginx/html

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose necessary ports
EXPOSE 2021 80

# Set the entrypoint script
CMD ["/app/entrypoint.sh"]