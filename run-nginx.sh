#!/usr/bin/env bash

# Run an Nginx container:
# -it      Interactive and tty (so we can interact with the container)
# --rm     Delete the container on exit (avoids leaving test clutter)
# -p 80:80 Map port 80 on the host to port 80 on the container (respectively)

docker run -it --rm -p 80:80 nginx

# Ctrl-C to quit the container
# Try changing some of those options, e.g. take away --rm and then do a 'docker ps'
