# Use the Salesforce CLI full image
FROM salesforce/cli:latest-full

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install additional tools that might be useful for development
RUN apt-get update && apt-get install -y \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
