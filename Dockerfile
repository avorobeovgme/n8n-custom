FROM n8nio/n8n:latest

USER root

RUN npm install -g @telepilotco/tdlib-binaries-prebuilt

USER node
