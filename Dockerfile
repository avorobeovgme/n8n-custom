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

# Create n8n user and working directories
RUN useradd -m -u 1000 node && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node
WORKDIR /home/node

EXPOSE 5678

CMD ["n8n", "start"]
