# Stage 1: Build the Go binary (Donetick/core)
FROM golang:1.22-alpine3.18 AS builder
WORKDIR /app
ENV CGO_ENABLED=1
RUN apk --no-cache add gcc  musl-dev git musl-dev sqlite-dev 
RUN apk add git
RUN git clone https://github.com/Donetick/core
WORKDIR /app/core
RUN go mod download
RUN CGO_ENABLED=1 GOOS=linux go build -ldflags="-s -w " -buildvcs=false  -o /donetick-core 
#RUN CGO_ENABLED=1 GOOS=linux go build -ldflags='-s -w -extldflags "-static"' -buildvcs=false  -o /donetick-core 

# Stage 2: Build the frontend (Donetick/frontend)
FROM node:18-alpine AS frontend
WORKDIR /app
RUN apk add --no-cache git  # Install git in the Node.js image
RUN git clone https://github.com/donetick/frontend
WORKDIR /app/frontend     

# Install dependencies and build the frontend
# RUN npm ci

RUN npm install
# VITE_APP_API_URL=http://host.docker.internal:2021
RUN  npm run build


# Stage 3: Final image with Go binary, built frontend, and http-server
FROM nginx:alpine

# install node and NPM:
# RUN apt-get update && apt-get install -y nodejs npm

# install nginx:
# RUN apt-get install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

# Install http server(serve) globally
# RUN npm install -g serve

# Create a new directory for the built app
RUN mkdir build


# Copy built frontend files to the nginx directory:
COPY --from=frontend /app/frontend/dist /usr/share/nginx/html
# Copy the Go binary from the builder stage
COPY --from=builder /donetick-core .
# list copied files:
COPY --from=builder /app/core/config ./config


RUN chmod +x ./donetick-core


# Expose ports
EXPOSE 2021 80

# Start the Go binary and the frontend server concurrently
# CMD ["sh", "-c", "cd /app & donetick-core & serve -s build -l 7926"]
# CMD ["sh", "-c", "./donetick-core & serve -s build -l 7926"]
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]