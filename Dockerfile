FROM n8nio/n8n:latest

USER root

# Create a startup wrapper script that installs the package before running n8n
RUN mkdir -p /startup && cat > /startup/entrypoint.sh << 'EOF'
#!/bin/sh
set -e

# Install the tdlib package locally in the n8n directory
cd /home/node/.n8n
npm install @telepilotco/tdlib-binaries-prebuilt 2>/dev/null || true

# Run the original n8n entrypoint
exec /docker-entrypoint.sh "$@"
EOF

RUN chmod +x /startup/entrypoint.sh

USER node

ENTRYPOINT ["/startup/entrypoint.sh"]
