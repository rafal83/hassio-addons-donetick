# ARG BUILD_FROM
# FROM $BUILD_FROM

FROM alpine:3.14
WORKDIR /app

RUN apk --no-cache add gcc musl-dev git sqlite-dev curl 
RUN mkdir -p /app/core
# download the binary from donetick releases:
RUN curl -L https://github.com/Donetick/core/releases/download/v0.0.8/core_Linux_x86_64.tar.gz | tar -xz -C /app/core --strip-components=1

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose necessary ports
EXPOSE 2021

# Set the entrypoint script
CMD ["/app/entrypoint.sh"]