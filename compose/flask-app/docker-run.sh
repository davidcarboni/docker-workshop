#!/usr/bin/env bash

# Create and run a container using the "flask-app" image

docker run -it --rm -p 5000:5000 flask-app

