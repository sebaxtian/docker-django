#!/bin/bash

#
# This Script run a shell into container
#

docker start docker-django
docker exec -it docker-django bash
