FROM n8nio/n8n:latest

USER root

# Install build dependencies for tdlib (Alpine Linux)
RUN apk add --no-cache \
    build-base \
    python3 \
    g++ \
    make

# Install the package with build from source
RUN npm install -g @telepilotco/tdlib-binaries-prebuilt --build-from-source

USER node
