#!/bin/bash

#
# See example.env file
# This Script remove and build new image
#

# Check there is exist
if [ "$(docker ps -a | grep docker-django)" ]; then
    docker rm -f docker-django
fi
if [ "$(docker images | grep docker-django)" ]; then
    docker rmi sebaxtian/docker-django:1.0.0
fi

docker build $(for i in `cat .env | grep -v '#'`; do out+="--build-arg $i " ; done; echo $out;out="") -t sebaxtian/docker-django:1.0.0 .
