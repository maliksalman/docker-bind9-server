#!/bin/sh

# Create the docker image
docker build -t bind9-server .

# Run the bind9 server in docker listening on port 35053
docker run --rm -d \
    --name bind9-server \
    -p 35053:53/tcp -p 35053:53/udp \
    bind9-server
