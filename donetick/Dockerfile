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
# ENV VITE_APP_API_URL=/api
RUN  npm run build

FROM golang:1.22-alpine3.18
WORKDIR /app

ENV CGO_ENABLED=1
RUN apk --no-cache add gcc  musl-dev git musl-dev sqlite-dev 
RUN apk add git
RUN git clone https://github.com/Donetick/core

# copy the frontend generate code to core and embed it:
COPY --from=frontend /app/frontend/dist /app/core/frontend/dist

WORKDIR /app/core
RUN go mod download
RUN CGO_ENABLED=1 GOOS=linux go build -ldflags="-s -w " -buildvcs=false  -o ./donetick-core 


# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose necessary ports
EXPOSE 2021

# Set the entrypoint script
CMD ["/app/entrypoint.sh"]