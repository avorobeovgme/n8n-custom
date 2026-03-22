FROM node:20-bullseye

# Install system dependencies required for TDLib and general tooling
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ca-certificates \
    libstdc++6 \
    build-essential \
    python3 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n

# Install TDLib prebuilt binaries globally so libtdjson.so is available at runtime
RUN npm install -g @telepilotco/tdlib-binaries-prebuilt

# Ensure n8n directories exist and are owned by node user (node user already exists in base image)
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node
WORKDIR /home/node

EXPOSE 5678

CMD ["n8n", "start"]
