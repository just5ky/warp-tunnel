FROM debian:12-slim

LABEL maintainer="JustSKY sky@justsky.in"
LABEL description="Container for Cloudflare WARP tunnel"

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y wget gnupg procps apt-transport-https && \
    wget -O /usr/share/keyrings/cloudflare-warp-archive-keyring.asc https://pkg.cloudflareclient.com/pubkey.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.asc] https://pkg.cloudflareclient.com/ bookworm main" | tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt-get -qq update && apt-get -qq install cloudflare-warp

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to the bash script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
