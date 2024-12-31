# Use a lightweight Node.js base image
FROM node:16-slim

# Install dependencies for Neko
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  libx11-dev \
  libxcomposite-dev \
  libxrandr-dev \
  libglu1-mesa \
  libxi6 \
  libxtst6 \
  libnss3 \
  libasound2 \
  libatk1.0-0 \
  libgdk-pixbuf2.0-0 \
  libxss1 \
  xdg-utils \
  ca-certificates

# Download and install Neko v2.8.0
RUN curl -sL https://github.com/m1k1o/neko/archive/refs/tags/v2.8.0.tar.gz | tar xz -C /usr/local/bin

# Set the working directory
WORKDIR /app

# Expose a port for testing
EXPOSE 8080

# Default command to run Neko
CMD ["neko"]
