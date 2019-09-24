# 
# FROM python:3-slim
# 
# https://hub.docker.com/_/python
# 
# Docker configuration for Django Applications
#
FROM python:3-slim

# Default ENVIRONMENT VARS to make build
RUN echo "Default ENVIRONMENT VARS to make build: "
ARG DIR_APP=example-app
ARG PYTHON_ENV=production
ARG PORT_APP=8000

# Custom ENVIRONMENT VARS to make build
RUN echo "Custom ENVIRONMENT VARS to make build: "
RUN echo $DIR_APP
RUN echo $PYTHON_ENV
RUN echo $PORT_APP

# Create src directory
RUN mkdir -p /home/python/src
# Set workdir
WORKDIR /home/python/src

# Install dependencies DEPRECATED IN ALPINE dorcker hub image ONLY FROM python:3-alpine
#apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
#ln -s /usr/include/locale.h /usr/include/xlocale.h

# Install Python modules dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django app source
COPY src/$DIR_APP .
# Install Python modules Django app source dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Replace this with your application's default port
EXPOSE $PORT_APP

# Run aplication [dev, prod]
#ENTRYPOINT [ "/usr/local/bin/python" ]
#CMD [ "python", "--version" ]
CMD [ "/bin/bash" ]
