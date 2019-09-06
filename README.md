# Introduction to Containers in Practice

This repo contains files and scripts help you get Docker installed and up and running, and helps you step through the workshop.

If you don't already have [Git](https://git-scm.com/) installed, take a look at [`install-git.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/install-git.sh).

## Installing Docker

Take a look at [`install-docker.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/install-docker.sh). 

The Docker installation documentation can be found at: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-engine---community-1

## Run your first container

Take a look at [`test-docker.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/test-docker.sh).

This runs a container that prints "Hello, world!"

## Run an Nginx container

Here's where it gets interesting. Instead of installing Nginx on your machine, you can run it as an (ephemeral) container.

Take a look at [`run-nginx.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/run-nginx.sh).

Nginx will be available on port 80 (the running container port 80 is mapped to your host port 80). Once you stop the container, everything is deleted.

## Lots of languages

Containers can be a neat way to partition programming language runtimes. If you've used virtual environments in Python or installed more than one JVM, you'll know it's a faff. The dedicated filesystem in a container is a great way to do it reliably.

Head into the `languages` folder and try these scripts:

 * [run-node.sh](https://github.com/davidcarboni/docker-workshop/blob/master/languages/run-node.sh)
 * [run-python.sh](https://github.com/davidcarboni/docker-workshop/blob/master/languages/run-python.sh)
 * [run-java.sh](https://github.com/davidcarboni/docker-workshop/blob/master/languages/run-java.sh)
 * [run-golang.sh](https://github.com/davidcarboni/docker-workshop/blob/master/languages/run-golang.sh)

Congratulations, you've just polyglotted your world with a single, standard way to run code written in any language. You could run bash, C code, even Perl if that's your thing. It's "just" a Linux process, so anything you can run, you can containerise.

## Container scheduling with Compose

We *could* install Kubernetes, but let's be honest, it'll take **too long**. Ain't nobody got time for that. We'll illustrate container scheduling using Docker Compose.

Head into the `compose` folder and take a look at [`install-docker-compose.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/compose/install-docker-compose.sh).

The Docker Compose installation documentation is at: https://docs.docker.com/compose/install/

Now take a look at [`docker-compose.yml`](https://github.com/davidcarboni/docker-workshop/blob/master/compose/docker-compose.yml).

Much like Kubernetes, this is a declarative Yaml descriptor for the desired state of a system. 

The Docker Compose file reference is at: https://docs.docker.com/compose/compose-file/

We'll be running:

 * An Nginx reverse proxy
 * A Python app (you don't need Python installed)

**Nginx**: take a look at [`default.conf`](https://github.com/davidcarboni/docker-workshop/blob/master/compose/default.conf) - this file will be mounted into the nginx container to configure the reverse proxy. You may have noticed we're using *ephemeral* containers, so we're injecting configuration to a standard, vendor-maintained image at runtime.

**Python app**: if you'd like to explore the Python app we'll be runinng, head into the [`python-app`](https://github.com/davidcarboni/docker-workshop/tree/master/compose/python-app) folder. Unlike the standard Nginx container, here we're building a custom image. You can run the app stand-alone using the [`docker-build.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/compose/python-app/docker-build.sh) and [`docker-run.sh`](https://github.com/davidcarboni/docker-workshop/blob/master/compose/python-app/docker-run.sh) scripts.

To apply our declararation and run the containers we've specified, head back to the `compose` directory and start Docker compose:

 * `docker-compose up`

This will read `docker-compose.yml`, start the Nginx and Python containers, attach them to a default shared network and enable them to discover each other using the service names in the compose file.

Try this:
 * `docker ps` - display running containers
 * `docker exec -it compose_nginx_1 sh` - execute the command `sh` inside the nginx container (note the name provided by `docker ps`)
 * `apt update && apt install curl` - modify the running container. Remember the container is ephemeral, so if you restart the container, these changes will be lost.
 * `curl app:5000` - connect to the `app` container by DNS name 
 * Exit from the shell in the container and run `docker-compose scale app=2` - you now have two instances. Try `docker ps` to confirm.
 * Start a new shell in the nginx container. This time, `apt install dnsutils` and then `dig app` - you should get an IP address for each running `app` container.

----

Short link for this repo: https://carb.onl/docker-workshop 
