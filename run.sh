#!/bin/bash

#
# See example.env file
# This Script remove and run new container
# On Windows use W parameter (Use Git Bash)
#

# Check there is exist
if [ "$(docker ps -a | grep docker-django)" ]; then
    docker rm -f docker-django
fi

export $(cat .env | grep -v '#' | awk '/=/ {print $1}')

# On Windows (Use Git Bash)
if [[ $1 = "W" ]]; then
    docker run -it --name docker-django --env-file $PWD_WINDOWS/.env -v $PWD_WINDOWS/src/$DIR_APP:/home/python/src -p $PORT_APP:$PORT_APP sebaxtian/docker-django:1.0.0
else
    # On Linux
    docker run -it --name docker-django --env-file $PWD/.env -v $PWD/src/$DIR_APP:/home/python/src -p $PORT_APP:$PORT_APP sebaxtian/docker-django:1.0.0
fi
