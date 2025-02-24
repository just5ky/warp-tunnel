# WARP Tunnel

```yml
services:
  cf-warp-tunnel:
    image: justsky/warp-tunnel:latest
    environment:
      - WARP_TOKEN=
    #privileged: true
    #network_mode: host
    #hostname: nobara
    restart: unless-stopped
    container_name: cf-warp-tunnel
```
