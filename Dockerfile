# Test Update
# Use ubuntu to get a familiar environment
# For local testing:
#     docker run --rm -it debian:buster-slim \
#     /bin/bash
FROM --platform=linux/amd64 ubuntu:26.04

# Updating and adding of tools/apps/languages
RUN apt-get -qq -y update && \
      apt-get -qq -y upgrade && \
      apt-get -qq -y autoclean && \
      apt-get -qq -y autoremove && \
      apt-get -qq -y software-properties-common vim sudo \
      rm -rf /var/lib/apt/lists/*      

# Adding the following to give me a user inside
# the container with sudo access
RUN useradd -m docker && echo "docker:docker" | chpasswd && \
      adduser docker sudo
USER docker

