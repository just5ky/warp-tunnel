#!/bin/sh

# Create /run/dbus directory if it doesn't exist
mkdir -p /run/dbus

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Start dbus-daemon in the foreground
dbus-daemon --system &

# Start warp-svc in the background
/bin/warp-svc &

# Wait for a few seconds to allow warp-svc to initialize
sleep 5s

# Initialize WARP connector and connect (using environment variable for token)
warp-cli --accept-tos connector new $WARP_TOKEN
warp-cli --accept-tos connect

# Keep the container running (optional, if warp-cli connect doesn't keep it alive)
tail -f /dev/null