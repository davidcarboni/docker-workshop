#!/usr/bin/env bash

# Run an Nginx container:
# -it      Interactive and tty (so we can interact with the container)
# --rm     Delete the container on exit (avoids leaving test clutter)
# -p 80:80 Map port 80 on the host to port 80 on the container (respectively)

docker run -it --rm -p 80:80 nginx

# Ctrl-C to quit the container
# Try changing some of those options, e.g. take away --rm and then do a 'docker ps -a' after stopping the container to verify that it hasn't been automatically deleted, or use -d instead of -it to run the container in the background, detatched from the command line. Use `docker ps` to see the running container and `docker rm -f <name>` to delete it.
