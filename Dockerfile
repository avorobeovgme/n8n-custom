FROM n8nio/n8n:latest

USER root

# Install build dependencies for tdlib
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Install the package with build from source
RUN npm install -g @telepilotco/tdlib-binaries-prebuilt --build-from-source

USER node
