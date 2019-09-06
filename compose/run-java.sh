#!/usr/bin/env bash

# Run a Python 3 container:
# -it      Interactive and tty (so we can interact with the container)
# --rm     Delete the container on exit (avoids leaving test clutter)

docker run -it --rm java:alpine

# Ctrl-C to quit the container
# NB Alpine is a small, security-friendly distro
