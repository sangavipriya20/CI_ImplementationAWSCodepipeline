#!/bin/bash
set -e

# Stop the running container (if any)
# getting the running container id
containerid='docker ps | awk -F " " '{print $1}''
# forcefully stopping the container
docker rm -f $containerid

